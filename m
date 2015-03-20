From: Steven Noonan <steven@uplinklabs.net>
Date: Fri, 20 Mar 2015 15:33:41 -0700
Subject: [Buildroot] [PATCH v3] package: add hwloc 1.10.1
In-Reply-To: <20150320213733.312a1cb0@free-electrons.com>
References: <1426742959-1220-1-git-send-email-steven@uplinklabs.net>
 <20150320213733.312a1cb0@free-electrons.com>
Message-ID: <CAKbGBLiO-qSiuemZs-bC8KnhoR4PCgyUxS-B9GvK0fDhu7cmbg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 20, 2015 at 1:37 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Steven Noonan,
>
> On Wed, 18 Mar 2015 22:29:19 -0700, Steven Noonan wrote:
>
>> diff --git a/package/hwloc/Config.in b/package/hwloc/Config.in
>> new file mode 100644
>> index 0000000..332536b
>> --- /dev/null
>> +++ b/package/hwloc/Config.in
>> @@ -0,0 +1,18 @@
>> +config BR2_PACKAGE_HWLOC
>> +     bool "hwloc"
>> +     # libpciaccess dependency
>> +     depends on BR2_LARGEFILE
>> +     # numactl dependency
>> +     depends on BR2_i386 || BR2_mips || BR2_mipsel || \
>> +         BR2_mips64 || BR2_mips64el || BR2_powerpc || BR2_x86_64
>> +     select BR2_PACKAGE_LIBPCIACCESS
>> +     select BR2_PACKAGE_NUMACTL
>
> The dependencies on libpciaccess and numactl are optional, so I removed
> them.
>
> However, there was a missing dependency on BR2_TOOLCHAIN_HAS_THREADS,
> since hwloc uses pthread.

Again, only tested with glibc and such, so I'm not seeing lots of
these dependencies. Glad I held off on my other contributions until I
could get these through review. Now I've got some ideas of things to
look for before submission.

>> +     help
>> +       Portable Hardware Locality
>> +
>> +       Provides a portable abstraction (across OS, versions, architectures, ...)
>> +       of the hierarchical topology of modern architectures, including NUMA
>> +       memory nodes, sockets, shared caches, cores and simultaneous
>> +       multithreading.
>
> Lines slightly too long, so I rewrapped.

What column wrapping is preferred for the Config.in files? I could
throw it into my vim config to enforce it in the future.

>
>> +################################################################################
>> +#
>> +# hwloc
>> +#
>> +################################################################################
>> +
>> +HWLOC_VERSION = 1.10.1
>
> I declared HWLOC_VERSION_MAJOR here..
>
>> +HWLOC_SOURCE = hwloc-$(HWLOC_VERSION).tar.bz2
>> +HWLOC_SITE = http://www.open-mpi.org/software/hwloc/v1.10/downloads
>
> ... so it can be re-used here.
>
>> +HWLOC_DEPENDENCIES = libpciaccess numactl
>
> As I said, those dependencies are optional, so I made them as such, and
> also used explicit --enable/--disable options. This allowed me to
> discover that the numa support was never enabled with your submission:
> the numactl package was not installing its library/header file in
> $(STAGING_DIR). With an explicit --enable-libnuma, hwloc configure
> script bailed out since it couldn't find the libnuma library.

This would probably explain why the 'perf' build wasn't finding the
optional libnuma dependency as well -- hadn't figured out what was
wrong there.

> So I committed a patch that installs libnuma to the staging directory
> as well.

Excellent. I'm not familiar with how the staging directory works. Does
that change work for any package depending on it (e.g. perf)?

> Also, I added some explicit --disable options for the things that we
> don't support for now.
>

Nice.
