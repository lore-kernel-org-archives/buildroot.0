From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 9 Apr 2021 00:59:19 +0200
Subject: [Buildroot] issue with timer_create and openblas after update
 buildroot from 2019_02 to 2021_02
In-Reply-To: <CAGpqJgqZBG5qMZDaS59syis2y1rm53f1KMWYzJKiwepHcJbadA@mail.gmail.com>
References: <CAGpqJgqZBG5qMZDaS59syis2y1rm53f1KMWYzJKiwepHcJbadA@mail.gmail.com>
Message-ID: <20210409005919.56690265@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arthur,

On Wed, 7 Apr 2021 11:01:59 +0200, Arthur Lambert <lambertarthur22@gmail.com> wrote:

> I am trying to update buildroot from 2019_02 tag to 2021_02. After the
> update I have
> some issue with timer_create function  from uclibc . I get -1 return error
> with  EAGAIN errno.
> The error only occurred with SIGEV_THREAD type.
>
> I was able to track the code responsible from the error without
> understanding the reason
>
> output/build/uclibc-1.0.37/libpthread/nptl/sysdeps/unix/sysv/linux/timer_create.c
> line-150
>
> >>     {
> >>     /* Create the helper thread.  */
> >>     pthread_once (&__helper_once, __start_helper_thread);
> >>     if (__helper_tid == 0)
> >> {
> >>  /* No resources to start the helper thread.  */
> >>  __set_errno (EAGAIN);
> >>  return -1;
> >> }
>
> I am was also able to reproduce the issue with a minimalist piece of code.
> The issue seems
> to be related to openblas. I dont see the link between BLAS and
> thread/timer issue ??
>
> >> #include <stdlib.h>
> >> #include <unistd.h>
> >> #include <stdio.h>
> >> #include <signal.h>
> >> #include <time.h>
> >>
> >>
> >> int main(void)
> >> {
> >>
> >> struct sigevent alarm_sigevt;
> >> timer_t alarm_timer;
> >> int ret = 0;
> >>
> >> alarm_sigevt.sigev_notify = SIGEV_THREAD;
> >> alarm_sigevt.sigev_notify_function = NULL;
> >> alarm_sigevt.sigev_notify_attributes = NULL;
> >> alarm_sigevt.sigev_value.sival_ptr =  NULL;
> >> ret = timer_create(CLOCK_REALTIME, &alarm_sigevt, &alarm_timer);
> >> printf ("ret : %d\n", ret);
> >>
> >> exit(EXIT_SUCCESS);
> >> }
>
> I compile the code like this :
>
> /home/arthur/work/buildroot/atto_dreem3_dev/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
> test_timer.c -o test_timer
>
> I run the binary on my arm target :
>
> # ./test_timer
> ret : 0
> #
>
> Everything is working fine here.

The strace log looks like the following:

[...]
235   stat("/lib/ld-uClibc.so.0", {st_mode=S_IFREG|0755, st_size=28408, ...}) = 0
235   mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb6f6b000
235   set_tls(0xb6f6b490)               = 0
235   mprotect(0x20000, 4096, PROT_READ) = 0
235   mprotect(0xb6f40000, 4096, PROT_READ) = 0
235   mprotect(0xb6f6d000, 4096, PROT_READ) = 0
235   set_tid_address(0xb6f6b068)       = 235
235   set_robust_list(0xb6f6b06c, 12)   = 0
235   rt_sigaction(SIGRTMIN, {sa_handler=0xb6f239e8, sa_mask=[], sa_flags=SA_RESTORER|SA_SIGINFO, sa_restorer=0xb6ed4908}, NULL, 8) = 0
235   rt_sigaction(SIGRT_1, {sa_handler=0xb6f23aac, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART|SA_SIGINFO, sa_restorer=0xb6ed4908}, NULL, 8) = 0
235   rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) = 0
235   ugetrlimit(RLIMIT_STACK, {rlim_cur=8192*1024, rlim_max=RLIM_INFINITY}) = 0
235   ioctl(0, TCGETS, {B115200 opost isig icanon echo ...}) = 0
235   ioctl(1, TCGETS, {B115200 opost isig icanon echo ...}) = 0
235   rt_sigprocmask(SIG_SETMASK, ~[RT_1], [], 8) = 0
235   mmap2(NULL, 16384, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|MAP_STACK, -1, 0) = 0xb6f67000
235   brk(NULL)                         = 0x1934000
235   brk(0x1935000)                    = 0x1935000
235   mprotect(0xb6f67000, 4096, PROT_NONE) = 0
235   clone(child_stack=0xb6f6a038, flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID, parent_tid=[236], tls=0xb6f6a960, child_tidptr=0xb6f6a538) = 236
235   rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
235   futex(0xb6f57824, FUTEX_WAKE_PRIVATE, 2147483647) = 0
235   timer_create(CLOCK_REALTIME, {sigev_value={sival_int=26427544, sival_ptr=0x1934098}, sigev_signo=SIGRTMIN, sigev_notify=SIGEV_THREAD_ID, sigev_notify_thread_id=236}, [0]) = 0
235   write(1, "ret : 0\n", 8)          = 8
235   exit_group(0)                     = ?
236   +++ exited with 0 +++
235   +++ exited with 0 +++

> I just add openblas library now :
>
> /home/arthur/work/buildroot/atto_dreem3_dev/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
> test_timer.c -o test_timer -lopenblas
>
> I now run the new binary :
>
> # ./test_timer
> ret : -1
>
> An issue with openblas which init too many timer ?

The strace log looks like the following:

[...]
240   stat("/lib/ld-uClibc.so.0", {st_mode=S_IFREG|0755, st_size=28408, ...}) = 0
240   mmap2(NULL, 64304, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb6d0d000
240   mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb6f93000
240   set_tls(0xb6d0d490)               = 0
240   mprotect(0x20000, 4096, PROT_READ) = 0
240   mprotect(0xb6f7b000, 8192, PROT_READ) = 0
240   mprotect(0xb6d9b000, 4096, PROT_READ) = 0
240   mprotect(0xb6f95000, 4096, PROT_READ) = 0
240   set_tid_address(0xb6d0d068)       = 240
240   set_robust_list(0xb6d0d06c, 12)   = 0
240   rt_sigaction(SIGRTMIN, {sa_handler=0xb6d7e9e8, sa_mask=[], sa_flags=SA_RESTORER|SA_SIGINFO, sa_restorer=0xb6d2f908}, NULL, 8) = 0
240   rt_sigaction(SIGRT_1, {sa_handler=0xb6d7eaac, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART|SA_SIGINFO, sa_restorer=0xb6d2f908}, NULL, 8) = 0
240   rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) = 0
240   ugetrlimit(RLIMIT_STACK, {rlim_cur=8192*1024, rlim_max=RLIM_INFINITY}) = 0
240   ioctl(0, TCGETS, {B115200 opost isig icanon echo ...}) = 0
240   ioctl(1, TCGETS, {B115200 opost isig icanon echo ...}) = 0
240   open("/sys/devices/system/cpu", O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3
240   fstat64(3, {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
240   fcntl(3, F_SETFD, FD_CLOEXEC)     = 0
240   brk(NULL)                         = 0x1485000
240   brk(0x1486000)                    = 0x1486000
240   brk(0x1487000)                    = 0x1487000
240   getdents64(3, 0xbed7fa28 /* 13 entries */, 4096) = 392
240   getdents64(3, 0xbed7fa28 /* 0 entries */, 4096) = 0
240   close(3)                          = 0
240   rt_sigprocmask(SIG_SETMASK, ~[RT_1], [], 8) = 0
240   rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
240   futex(0xb6db2824, FUTEX_WAKE_PRIVATE, 2147483647) = 0
240   write(1, "ret : -1\n", 9)         = 9
240   exit_group(0)                     = ?
240   +++ exited with 0 +++

No clone() and no timer_create() syscall...., but the syscall sequence from
open("/sys/devices/system/cpu",...) to getdents64()/close() looks like the
nprocessors_conf() implementation from uclibc-1.0.38/libc/unistd/sysconf.c...,
strange....

Regards,
Peter
