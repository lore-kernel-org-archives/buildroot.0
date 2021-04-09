From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 9 Apr 2021 21:18:10 +0200
Subject: [Buildroot] issue with timer_create and openblas after update
 buildroot from 2019_02 to 2021_02
In-Reply-To: <CAGpqJgrWmKs+XvNOa4qo6TukXfrDe1+aqs+M4R0wUuToNfVvLg@mail.gmail.com>
References: <CAGpqJgqZBG5qMZDaS59syis2y1rm53f1KMWYzJKiwepHcJbadA@mail.gmail.com>
 <20210409005919.56690265@gmx.net>
 <CAGpqJgrWmKs+XvNOa4qo6TukXfrDe1+aqs+M4R0wUuToNfVvLg@mail.gmail.com>
Message-ID: <20210409211810.55eb6a22@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arthur,

On Fri, 9 Apr 2021 09:53:23 +0200, Arthur Lambert <lambertarthur22@gmail.com> wrote:

> I was able to fix the issue by checking the Openblas history commits. But I
> don't really understand the issue...
>
> The issue is coming from here:
> https://github.com/buildroot/buildroot/commit/6f29cdeee40e556d26b791fabaff84a09e1a2d5d#diff-0995e357753caee10bbc553c2e7aa033d1df05c0c9799916729d4881d7735d26
>
> By default, the multithreading setting is enabled on Openblas. This setting
> is really confusing me. For me, I have to enable the multithreading setting
> to use Openblas
> in a multithreading context (this is my case !). But it is the opposite!
> There is this information in the Openblas USAGE file :
>
> >> #### How can I use OpenBLAS in multi-threaded applications?
> >>
> >> If your application is already multi-threaded, it will conflict with
> OpenBLAS
> >> multi-threading. Thus, you must set OpenBLAS to use single thread in any
> of the
> >> following ways:
> >>
> >> * `export OPENBLAS_NUM_THREADS=1` in the environment variables.
> >> * Call `openblas_set_num_threads(1)` in the application on runtime.
> >> * Build OpenBLAS single thread version, e.g. `make USE_THREAD=0`
>
> So I have to add this in my defconfig to build Openblas with
> singlethread support to fix the problem:
>
> iff --git a/configs/xxxx_defconfig b/configs/dxxxxxx_defconfig
> index 4714080d7e..a760627e2c 100644
> --- a/configs/xxxxx_defconfig
> +++ b/configs/xxxx_defconfig
> @@ -45,6 +45,7 @@ BR2_PACKAGE_PAHO_MQTT_C=y
>  BR2_PACKAGE_ELFUTILS=y
>  BR2_PACKAGE_LIBUNWIND=y
>  BR2_PACKAGE_OPENBLAS=y
> +# BR2_PACKAGE_OPENBLAS_USE_THREAD is not set
>  BR2_PACKAGE_PROTOBUF=y
>  BR2_PACKAGE_PROTOBUF_C=y
>  BR2_PACKAGE_HAVEGED=y
>
> How this "conflict" can cause an error on the timer_create feature from
> uclibc?

This commit gives you only the chance to disable openblas threading support
(and circumvent the problem for you), but is not the decisive change
between buildroot 2019.02 and 2021.02 regarding uclibc/openblas, because
already the old/2019.02 version should have threading enabled (only without
an buildroot option to disable it)...

The version change from 2019.02 to 2021.02 are:

- openblas from 0.2.20 to 0.3.9
- uclibc from 1.0.31 to 1.0.38
- gcc/binutils/etc (did not yet check yet)?

But I did some debugging, with openblas linking the timer_create() call
fails because of a failing pthread_create() because of a stack-size
check in allocate_stack()...


Without openblas (o.k - one call via timer_create()/pthread_create()):

Breakpoint 1, allocate_stack (attr=0x7fed1079c8, pdp=0x7fed107920, stack=0x7fed107928)
    at libpthread/nptl/allocatestack.c:472
472	      pd = get_cached_stack (&size, &mem);
(gdb) p *attr
$1 = {schedparam = {__sched_priority = 0}, schedpolicy = 0, flags = 0, guardsize = 4096,
  stackaddr = 0x0, stacksize = 16384, cpuset = 0x0, cpusetsize = 0}
(gdb) p size
$2 = 16384
(gdb) p __static_tls_size
$3 = 1712


With openblas (failure - three time o.k call from openblas, one failing call from timer_create()):

Breakpoint 1, allocate_stack (attr=0x7fa286de48 <default_attr>, pdp=0x7febf5fd80, stack=0x7febf5fd88)
    at libpthread/nptl/allocatestack.c:472
472	      pd = get_cached_stack (&size, &mem);
(gdb) p *attr
$1 = {schedparam = {__sched_priority = 0}, schedpolicy = 0, flags = 0, guardsize = 1, stackaddr = 0x0,
  stacksize = 0, cpuset = 0x0, cpusetsize = 0}
(gdb) p size
$2 = 2097152
(gdb) p __static_tls_size
$3 = 63152

[...]

Thread 1 "test_timer_crea" hit Breakpoint 2, allocate_stack (attr=0x7febf61068, pdp=0x7febf60fc0,
    stack=0x7febf60fc8) at libpthread/nptl/allocatestack.c:468
468		return EINVAL;
(gdb) p *attr
$4 = {schedparam = {__sched_priority = 0}, schedpolicy = 0, flags = 0, guardsize = 4096,
  stackaddr = 0x0, stacksize = 16384, cpuset = 0x0, cpusetsize = 0}
(gdb) p size
$5 = 16384
(gdb) p __static_tls_size
$6 = 63152


- with openblas linking the thread-local-storage (__static_tls_size) is
  increased from 1712 to 63152

- the openblas threads are created with default pthread_attr_t/nullptr,
  the stack size size is calculated to 2097152 the check succeeds

- the timer_create pthread_create is called with pthread_attr_t created
  via

	66	  (void) pthread_attr_init (&attr);
	167	  (void) pthread_attr_setstacksize (&attr, PTHREAD_STACK_MIN);

  so stacksize is given as 16384, the check against the increased thread-local-
  storage (63152 + guadsize + MINIMAL_REST_STACK + padding) fails...

Maybe a uclibc bug/defect...., or an expert question: is the pthread_create/
pthread_attr_t stacksize inclusive or exclusive the reserved size for
thread-local-storage usage (my judgment would be exclusive as the thread-local
storage size is dependents on external parameters/library linking etc.)?

> Is my change correct?

If it works for you yes ;-), but does not fix the underlying/generally problem...

Regards,
Peter
