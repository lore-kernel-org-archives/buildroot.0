From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 22 Apr 2019 19:20:51 +0200
Subject: [Buildroot] [PATCH] ltp-testsuite: Fix uClibc build with
 disabled fts.h support
In-Reply-To: <20190421123611.4016cc04@windsurf>
References: <20190417135458.15505-1-Nikita.Sobolev@synopsys.com>
 <20190421123611.4016cc04@windsurf>
Message-ID: <20190422172050.GA18445@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> I am confused, because the current ltp-testsuite package seems to build
> properly with uClibc that doesn't have FTS support enabled. I just
> built the following configuration:

> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.02-rc1.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_LTP_TESTSUITE=y
> # BR2_TARGET_ROOTFS_TAR is not set

> It has FTS disabled:

> $ grep FTS output/staging/usr/include/bits/uClibc_config.h
> #undef __UCLIBC_HAS_FTS__

> And it builds perfectly fine.
Thanks for a research (I'll do more testing next time, not just reviewing)!
Actually testing it, it's really ok, due these lines in
package/ltp-testsuite/ltp-testsuite.mk:

# Requires uClibc fts and bessel support, normally not enabled
ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
define LTP_TESTSUITE_REMOVE_UNSUPPORTED
	rm -rf $(@D)/testcases/kernel/controllers/cpuset/
	rm -rf $(@D)/testcases/misc/math/float/bessel/
	rm -f $(@D)/testcases/misc/math/float/float_bessel.c
endef
LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_UNSUPPORTED
endif

We can either remove deleting testcases/kernel/controllers/cpuset/ as part of
this patchset, or simply wait for next update (planning for the start of the
second week in the May [1]), I'd remove it during the update.

Kind regards,
Petr

[1] http://lists.linux.it/pipermail/ltp/2019-April/011729.html
