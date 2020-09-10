From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Sep 2020 17:43:11 +0200
Subject: [Buildroot] Toolchain issues on multiple architectures
In-Reply-To: <CANQCQparV9FCnOCT=arB7zK0rvhWN4n6tJXTcLLNpZjCJfHcaQ@mail.gmail.com>
References: <20200910120536.2431494d@windsurf.hq.k.grp>
 <CANQCQparV9FCnOCT=arB7zK0rvhWN4n6tJXTcLLNpZjCJfHcaQ@mail.gmail.com>
Message-ID: <20200910174311.39799887@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 10 Sep 2020 09:43:21 -0500
Matthew Weber <matthew.weber@collins.com> wrote:

> Checking out 2020.08 and using the following config from the CI job.
> BR2_powerpc64le=y
> BR2_powerpc_power8=y
> BR2_KERNEL_HEADERS_4_9=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_TOOLCHAIN_BUILDROOT_FORTRAN=y
> BR2_PACKAGE_HOST_GDB=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_GDB=y
> # BR2_TARGET_ROOTFS_TAR is not set
> 
> I see this error:
> ../../../libgfortran/libgfortran.h:61:12: fatal error:
> quadmath_weak.h: No such file or directory

Ah, so it's enabling the Fortran support that makes it fail to build. I
see that it is including quadmath_weak.h only if HAVE_FLOAT128 is
enabled:

#ifdef HAVE_FLOAT128
#  include "quadmath_weak.h"
#endif

I suppose PowerPC64 has HAVE_FLOAT128 enabled, and not other
architectures ?

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82292 has some context,
and concludes with "Yeah, I think this is user error.". Seems like
we're not passing the appropriate enable/disable libquadmath options.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
