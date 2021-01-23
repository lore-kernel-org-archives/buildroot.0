From: =?UTF-8?Q?Geoffrey_Le_Gourri=C3=A9rec?= <geoffrey.legourrierec@gmail.com>
Date: Sat, 23 Jan 2021 21:35:31 +0100
Subject: [Buildroot] [PATCH 1/2] configs/qemu_*: bump kernel version to
 5.10.7
In-Reply-To: <CACPK8XdWzEuu_4x5cWNx6EpatbSfn91FdQf42RzCyotGz9Hn6g@mail.gmail.com>
References: <20210120195954.31797-1-geoffrey.legourrierec@gmail.com>
 <CACPK8XdWzEuu_4x5cWNx6EpatbSfn91FdQf42RzCyotGz9Hn6g@mail.gmail.com>
Message-ID: <CADFgU5CWfAQ2bgJeQYXeAkwO8Q8E3K9PVGz_tWCa_YZmMD_SEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> Nice work.
>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>
> > ---
> > Regarding the 64-bit time data structures, an upstream fix [3]
> > had supposedly prepared for this situation where the libc has not
> > moved to 64-bits data structures yet, but unfortunately we seem to
> > slip into a crack here. Some quick header dependency analysis from
> > the offending __kernel_time64_t type managed to "follow up" to
> > linux/time_types.h (which is the one explicitly added in [3]) as
> > expected; so no luck here.
> > Any help on that matter would be appreciated.
>
> I saw your commit message for the sockios.h patch has cc Arnd. Did you
> get a response from him on this issue?
>

Not yet, I've sent the patch to the SH maintainers CC Arnd Bergman, and am
waiting for a reply. I'll keep you up to date when I get one.

It looks like time_types.h needs a definition of __kernel_time64_t.
> This appears to live in posix_types.h for uapi headers. Would this
> patch to the kernel fix the problem?
>
> --- a/include/uapi/linux/time_types.h
> +++ b/include/uapi/linux/time_types.h
> @@ -3,6 +3,7 @@
>  #define _UAPI_LINUX_TIME_TYPES_H
>
>  #include <linux/types.h>
> +#include <linux/posix_types.h>
>
>  struct __kernel_timespec {
>         __kernel_time64_t       tv_sec;                 /* seconds */
>

I just tried your suggestion with qemu_sh4eb_r2d_defconfig (after removing
my
own patch, of course), but looks like compilation still breaks :( Did you
have the
time to try it ?

/usr/bin/make -j5 -C
/home/clumsyape/PROJETS/buildroot/buildroot_git/output/build/uclibc-1.0.37
ARCH="sh"
CROSS_COMPILE="/home/clumsyape/PROJETS/buildroot/buildroot_git/output/host/bin/sh4eb-buildroot-linux-uclibc-"
UCLIBC_EXTRA_CFLAGS="" HOSTCC="/usr/bin/gcc"
  GEN libpthread/nptl/sysdeps/unix/sysv/linux/structsem.h
  GEN libpthread/nptl/sysdeps/unix/sysv/linux/structsem.h
  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h
  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h
In file included from
/home/clumsyape/PROJETS/buildroot/buildroot_git/output/build/linux-headers-5.10.7/usr/include/asm/sockios.h:5,
                 from
/home/clumsyape/PROJETS/buildroot/buildroot_git/output/build/linux-headers-5.10.7/usr/include/asm-generic/socket.h:6,
                 from
/home/clumsyape/PROJETS/buildroot/buildroot_git/output/build/linux-headers-5.10.7/usr/include/asm/socket.h:1,
                 from ./include/bits/socket.h:360,
                 from ./include/sys/socket.h:39,
                 from ./include/netinet/in.h:24,
                 from ./include/resolv.h:57,
                 from ./libpthread/nptl/descr.h:36,
                 from ./libpthread/nptl/pthreadP.h:25,
                 from <stdin>:2:
/home/clumsyape/PROJETS/buildroot/buildroot_git/output/build/linux-headers-5.10.7/usr/include/linux/time_types.h:9:2:
error: unknown type name '__kernel_time64_t'
    9 |  __kernel_time64_t       tv_sec;                 /* seconds */
      |  ^~~~~~~~~~~~~~~~~
/home/clumsyape/PROJETS/buildroot/buildroot_git/output/build/linux-headers-5.10.7/usr/include/linux/time_types.h:33:2:
error: unknown type name '__kernel_old_time_t'
   33 |  __kernel_old_time_t tv_sec;  /* seconds */
      |  ^~~~~~~~~~~~~~~~~~~
libpthread/nptl/sysdeps/unix/sysv/linux/Makefile.commonarch:135: recipe for
target 'libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h' failed
make[2]: *** [libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h]
Error 1
package/pkg-generic.mk:247: recipe for target
'/home/clumsyape/PROJETS/buildroot/buildroot_git/output/build/uclibc-1.0.37/.stamp_built'
failed
make[1]: ***
[/home/clumsyape/PROJETS/buildroot/buildroot_git/output/build/uclibc-1.0.37/.stamp_built]
Error 2
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2


> Cheers,
>
> Joel


Thanks for the review,

-- 
Geoffrey

Le mer. 20 janv. 2021 ? 23:29, Joel Stanley <joel@jms.id.au> a ?crit :

> On Wed, 20 Jan 2021 at 20:00, Geoffrey Le Gourri?rec
> <geoffrey.legourrierec@gmail.com> wrote:
> >
> > Bump most QEMU defconfigs (every one that was previously on 5.4.y)
> > to latest longterm kernel 5.10.7.
> >
> > Please note the following exceptions/modifications:
> > - board/qemu/qemu_s390x_defconfig: ignored (already up to date)
> > - board/qemu/sh4*-r2d:
> >     - Remove the remaining kernel patch [1] provided by Alan Modra
> >       fixing rodata alignment, carried here by Romain Naour [2] to
> >       fix an issue preventing kernel from booting with binutils 2.23.
> >       Patch is present in upstream Linux now.
> >     - Fix compile-time error regarding 64-bit time data structures
> >       from kernel headers when building with uclibc. Previous fix [3]
> >       existed upstream; but see details below.
> >     - board/qemu/ppc-mpc8544ds: Updated kernel patch
> > - board/qemu/arm-versatile: Updated kernel patch
> > - board/qemu/mips*r6*: Updated kernel patch
> >
> > Tested on all configs/qemu* configurations. [4]
> >
> > [1] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html
> > [2]
> https://git.busybox.net/buildroot/commit/?id=a2331c8a61bdd71c47492efc818fb0458a349219
> > [3]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fc94cf2092c7c1267fa2deb8388d624f50eba808
> > [4] https://gitlab.com/clumsyape/buildroot/-/pipelines/244024195
> >
> > Signed-off-by: Geoffrey Le Gourri?rec <geoffrey.legourrierec@gmail.com>
>
> Nice work.
>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>
> > ---
> > Regarding the 64-bit time data structures, an upstream fix [3]
> > had supposedly prepared for this situation where the libc has not
> > moved to 64-bits data structures yet, but unfortunately we seem to
> > slip into a crack here. Some quick header dependency analysis from
> > the offending __kernel_time64_t type managed to "follow up" to
> > linux/time_types.h (which is the one explicitly added in [3]) as
> > expected; so no luck here.
> > Any help on that matter would be appreciated.
>
> I saw your commit message for the sockios.h patch has cc Arnd. Did you
> get a response from him on this issue?
>
> It looks like time_types.h needs a definition of __kernel_time64_t.
> This appears to live in posix_types.h for uapi headers. Would this
> patch to the kernel fix the problem?
>
> --- a/include/uapi/linux/time_types.h
> +++ b/include/uapi/linux/time_types.h
> @@ -3,6 +3,7 @@
>  #define _UAPI_LINUX_TIME_TYPES_H
>
>  #include <linux/types.h>
> +#include <linux/posix_types.h>
>
>  struct __kernel_timespec {
>         __kernel_time64_t       tv_sec;                 /* seconds */
>
> Cheers,
>
> Joel
>
> > diff --git
> a/board/qemu/sh4eb-r2d/patches/linux-headers/0001-Use-types.h-and-not-time_types.h-in-sockios.h.patch
> b/board/qemu/sh4eb-r2d/patches/linux-headers/0001-Use-types.h-and-not-time_types.h-in-sockios.h.patch
> > new file mode 100644
> > index 0000000000..90bd4e8c6c
> > --- /dev/null
> > +++
> b/board/qemu/sh4eb-r2d/patches/linux-headers/0001-Use-types.h-and-not-time_types.h-in-sockios.h.patch
> > @@ -0,0 +1,76 @@
> > +From 34c78b21878ae7b0471299d11a7e861125e31b2c Mon Sep 17 00:00:00 2001
> > +From: =?UTF-8?q?Geoffrey=20Le=20Gourri=C3=A9rec?=
> > + <geoffrey.legourrierec@gmail.com>
> > +Date: Mon, 18 Jan 2021 23:40:28 +0100
> > +Subject: [PATCH] Use types.h and not time_types.h in sockios.h
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=UTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +This fixes builds for sh arch when libc is not using relevant
> > +time data structures definitions for 32-bit machines. A previous
> > +commit [1] provided a fix, that we seemed to slip through here.
> > +
> > +As of the time of this writing, the bug was found with non-
> > +up to date uclibc 1.0.37 only (currently the only libc supporting
> > +sh architecture).
> > +
> > +[1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fc94cf2092c7c1267fa2deb8388d624f50eba808
> > +
> > +Signed-off-by: Geoffrey Le Gourri?rec <geoffrey.legourrierec@gmail.com>
> > +Cc: Arnd Bergmann <arnd@arndb.de>
> > +
> > +---
> > +
> > +For the record, here's the build-time error:
> > +
> > +/usr/bin/make -j2 -C
> /builds/clumsyape/buildroot/output/build/uclibc-1.0.37 ARCH="sh"
> CROSS_COMPILE="/builds/clumsyape/buildroot/output/host/bin/sh4-buildroot-linux-uclibc-"
> UCLIBC_EXTRA_CFLAGS="" HOSTCC="/usr/bin/gcc"
> > +make[1]: Entering directory
> '/builds/clumsyape/buildroot/output/build/uclibc-1.0.37'
> > +  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelcond.h
> > +  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelcond.h
> > +  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h
> > +  GEN libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h
> > +In file included from
> /builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/asm/sockios.h:5,
> > +                 from
> /builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/asm-generic/socket.h:6,
> > +                 from
> /builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/asm/socket.h:1,
> > +                 from ./include/bits/socket.h:360,
> > +                 from ./include/sys/socket.h:39,
> > +                 from ./include/netinet/in.h:24,
> > +                 from ./include/resolv.h:57,
> > +                 from ./libpthread/nptl/descr.h:36,
> > +                 from ./libpthread/nptl/pthreadP.h:25,
> > +                 from <stdin>:2:
> >
> +/builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/linux/time_types.h:8:2:
> error: unknown type name '__kernel_time64_t'
> > +    8 |  __kernel_time64_t       tv_sec;                 /* seconds */
> > +      |  ^~~~~~~~~~~~~~~~~
> >
> +/builds/clumsyape/buildroot/output/build/linux-headers-5.10.7/usr/include/linux/time_types.h:32:2:
> error: unknown type name '__kernel_old_time_t'
> > +   32 |  __kernel_old_time_t tv_sec;  /* seconds */
> > +      |  ^~~~~~~~~~~~~~~~~~~
> > +libpthread/nptl/sysdeps/unix/sysv/linux/Makefile.commonarch:135: recipe
> for target 'libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h'
> failed
> > +make[1]: ***
> [libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h] Error 1
> > +make[1]: Leaving directory
> '/builds/clumsyape/buildroot/output/build/uclibc-1.0.37'
> > +
> > +I did a quick header dependency analysis starting from __kernel_time64_t
> > +(one of the offending types), but could "follow up" to
> linux/time_types.h
> > +as expected; so I fail to understand how this could break. What's even
> > +more confusing is linux/time_types.h includes linux/types.h itself.
> > +---
> > + arch/sh/include/uapi/asm/sockios.h | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/arch/sh/include/uapi/asm/sockios.h
> b/arch/sh/include/uapi/asm/sockios.h
> > +index ef01ced9e169..d97d14685305 100644
> > +--- a/arch/sh/include/uapi/asm/sockios.h
> > ++++ b/arch/sh/include/uapi/asm/sockios.h
> > +@@ -2,7 +2,7 @@
> > + #ifndef __ASM_SH_SOCKIOS_H
> > + #define __ASM_SH_SOCKIOS_H
> > +
> > +-#include <linux/time_types.h>
> > ++#include <linux/types.h>
> > +
> > + /* Socket-level I/O control calls. */
> > + #define FIOGETOWN     _IOR('f', 123, int)
> > +--
> > +2.17.1
> > +
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210123/e5b609f4/attachment.html>
