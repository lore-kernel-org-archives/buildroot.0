From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 22:21:27 +0100
Subject: [Buildroot] [PATCH/next v9 01/28] package/freeswitch: new
 package
In-Reply-To: <1456586838-21197-2-git-send-email-bernd.kuhls@t-online.de>
References: <1456586838-21197-1-git-send-email-bernd.kuhls@t-online.de>
 <1456586838-21197-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160229222127.27db4013@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 27 Feb 2016 16:26:51 +0100, Bernd Kuhls wrote:
> This commit adds freeswitch without any configured modules and with a
> minimal set of non-optional dependencies. All other dependencies and
> modules will be added by further patches in this series.
> 
> PLease note that freeswitch source repo bundles some libraries which are
> also available as buildroot packages. The freeswitch build system does
> not allow to use system libraries in these cases:
> 
> apr, apr-util, libsrtp, sofia-sip, tiff
> 
> The reason are patches to these packages by the freeswitch project which
> are not yet upstream. There is an open JIRA report for this situation:
> https://freeswitch.org/jira/si/jira.issueviews:issue-html/FS-353/FS-353.html

The number of libs they bundle is quite unfortunate. But well, there's
no much you can about this besides following this bug report.

> 
> More historic infos can be found here:
> http://article.gmane.org/gmane.comp.telephony.freeswitch.devel/2715
> https://freeswitch.org/the-missing-link/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

This patch unfortunately does not build here. With the following
defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.11-rc1-71-g90d1299.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_FREESWITCH=y
# BR2_TARGET_ROOTFS_TAR is not set

I get:

  CCLD     fs_ivrd
libs/libzrtp/third_party/bnlib/libbn.a(lbnmem.o): In function `lbnMemWipe':
/home/thomas/projets/buildroot/output/build/freeswitch-1.6.6/libs/libzrtp/third_party/bnlib/lbnmem.c:69: undefined reference to `zrtp_memset'
libs/libzrtp/third_party/bnlib/libbn.a(lbnmem.o): In function `lbnMemAlloc':
/home/thomas/projets/buildroot/output/build/freeswitch-1.6.6/libs/libzrtp/third_party/bnlib/lbnmem.c:78: undefined reference to `zrtp_sys_alloc'
libs/libzrtp/third_party/bnlib/libbn.a(lbnmem.o): In function `lbnMemFree':
/home/thomas/projets/buildroot/output/build/freeswitch-1.6.6/libs/libzrtp/third_party/bnlib/lbnmem.c:87: undefined reference to `zrtp_sys_free'
collect2: error: ld returned 1 exit status
Makefile:1462: recipe for target 'fs_cli' failed
make[4]: *** [fs_cli] Error 1
make[4]: *** Waiting for unfinished jobs....
libs/libzrtp/third_party/bnlib/libbn.a(lbnmem.o): In function `lbnMemWipe':
/home/thomas/projets/buildroot/output/build/freeswitch-1.6.6/libs/libzrtp/third_party/bnlib/lbnmem.c:69: undefined reference to `zrtp_memset'
libs/libzrtp/third_party/bnlib/libbn.a(lbnmem.o): In function `lbnMemAlloc':
/home/thomas/projets/buildroot/output/build/freeswitch-1.6.6/libs/libzrtp/third_party/bnlib/lbnmem.c:78: undefined reference to `zrtp_sys_alloc'
libs/libzrtp/third_party/bnlib/libbn.a(lbnmem.o): In function `lbnMemFree':
/home/thomas/projets/buildroot/output/build/freeswitch-1.6.6/libs/libzrtp/third_party/bnlib/lbnmem.c:87: undefined reference to `zrtp_sys_free'
collect2: error: ld returned 1 exit status
Makefile:1470: recipe for target 'fs_ivrd' failed
make[4]: *** [fs_ivrd] Error 1

*** Warning: Linking the shared library libfreeswitch.la against the
*** static library libs/libzrtp/libzrtp.a is not portable!


> diff --git a/package/freeswitch/0001-jpeg.patch b/package/freeswitch/0001-jpeg.patch
> new file mode 100644
> index 0000000..8fc3052
> --- /dev/null
> +++ b/package/freeswitch/0001-jpeg.patch
> @@ -0,0 +1,31 @@
> +Fix jpeg detection
> +
> +libyuv has an optional jpeg dependency, freeswitch configure misses -ljpeg
> +when searching for libyuv and therefore assumes libyuv is missing. When
> +freeswitch first searches for libjpeg, -ljpeg will be added to
> +PKG_CHECK_MODULES([YUV].
> +
> +Patch sent upstream: https://freeswitch.org/jira/browse/FS-8745

Can you follow-up on this bug report by doing a pull request, as they
suggested?

> diff --git a/package/freeswitch/0002-zrtp.patch b/package/freeswitch/0002-zrtp.patch
> new file mode 100644
> index 0000000..c1cdeed
> --- /dev/null
> +++ b/package/freeswitch/0002-zrtp.patch
> @@ -0,0 +1,33 @@
> +Fix PowerPC detection (needs __linux__) and add aarch64 support.
> +
> +Patch sent upstream: https://freeswitch.org/jira/browse/FS-8746

Ditto.

(Note that I find it weird to fix a bug and add support for a new
architecture in the same patch. Two separate patches would have
definitely been better here.)

> diff --git a/package/freeswitch/0003-FS-8736-resolve-Missing-MEMMOVE-macro-in-spandsp-aut.patch b/package/freeswitch/0003-FS-8736-resolve-Missing-MEMMOVE-macro-in-spandsp-aut.patch
> new file mode 100644
> index 0000000..88cb390
> --- /dev/null
> +++ b/package/freeswitch/0003-FS-8736-resolve-Missing-MEMMOVE-macro-in-spandsp-aut.patch
> @@ -0,0 +1,71 @@
> +From 10df60039322b3903e62b001971c195d5ce48943 Mon Sep 17 00:00:00 2001
> +From: Anthony Minessale <anthm@freeswitch.org>
> +Date: Fri, 15 Jan 2016 13:14:07 -0600
> +Subject: [PATCH 05/99] FS-8736 #resolve [Missing MEMMOVE macro in spandsp
> + autoconf]

Not sure why there is a 05/99 here.

> diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
> new file mode 100644
> index 0000000..3c527fe
> --- /dev/null
> +++ b/package/freeswitch/freeswitch.mk
> @@ -0,0 +1,85 @@
> +################################################################################
> +#
> +# freeswitch
> +#
> +################################################################################
> +
> +FREESWITCH_VERSION = 1.6.6
> +FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
> +FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
> +FREESWITCH_LICENSE = MPL v1.1

This should be MPLv1.1

> +FREESWITCH_LICENSE_FILES = COPYING
> +
> +# required dependencies
> +FREESWITCH_DEPENDENCIES = \
> +	host-autoconf host-automake host-libtool host-pkgconf jpeg \
> +	libcurl openssl pcre speex sqlite zlib
> +
> +# remove an unneeded script which scans /usr/lib/freeswitch/mod
> +define FREESWITCH_REMOVE_MODCHECK
> +	$(SED) "/modcheck.sh/d" $(@D)/build/Makefile.am
> +endef
> +FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_REMOVE_MODCHECK

Shouldn't this hook be rather handled by a patch ?

> +
> +# autoreconf now is necessary to avoid broken autoreconf after configure
> +# we also patch configure.ac twice

What do you mean by "patch configure.ac twice" ? Do you mean that there
are two patches touching it.

You should also explain in a comment why the normal
FREESWITCH_AUTORECONF = YES incantation doesn't work.

Other than that looks good. I would probably have applied if I didn't
encounter the build failure :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
