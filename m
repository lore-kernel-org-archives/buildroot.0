From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Jul 2011 22:32:50 +0200
Subject: [Buildroot] [PATCH] libnss: Add new package.
In-Reply-To: <CAFbHwiRfvF=c5Lys-rc7=vXUXqML+TyJvdQogcTrm2M-MoSf2w@mail.gmail.com>
 (Will Newton's message of "Thu, 7 Jul 2011 13:08:21 +0100")
References: <CAFbHwiRfvF=c5Lys-rc7=vXUXqML+TyJvdQogcTrm2M-MoSf2w@mail.gmail.com>
Message-ID: <87k4btrfv1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

 Will> NSS is the Network Security Services library developed as part of
 Will> the Mozilla project. It provides similar functions to OpenSSL but
 Will> allows MPL, GPL and LGPL licensing.

Thanks, a few comments.

 Will> Signed-off-by: Will Newton <will.newton@imgtec.com>
 Will> ---
 Will>  package/Config.in                  |    1 +
 Will>  package/libnss/Config.in           |   13 +++++++
 Will>  package/libnss/libnss-cross.patch  |   24 ++++++++++++++
 Will>  package/libnss/libnss-uclibc.patch |   14 ++++++++
 Will>  package/libnss/libnss.mk           |   62 ++++++++++++++++++++++++++++++++++++
 Will>  5 files changed, 114 insertions(+), 0 deletions(-)
 Will>  create mode 100644 package/libnss/Config.in
 Will>  create mode 100644 package/libnss/libnss-cross.patch
 Will>  create mode 100644 package/libnss/libnss-uclibc.patch
 Will>  create mode 100644 package/libnss/libnss.mk

 Will> diff --git a/package/Config.in b/package/Config.in
 Will> index 2a48d82..e8eb4c6 100644
 Will> --- a/package/Config.in
 Will> +++ b/package/Config.in
 Will> @@ -249,6 +249,7 @@ menu "Crypto"
 Will>  source "package/beecrypt/Config.in"
 Will>  source "package/libgcrypt/Config.in"
 Will>  source "package/libgpg-error/Config.in"
 Will> +source "package/libnss/Config.in"
 Will>  source "package/openssl/Config.in"
 Will>  endmenu

 Will> diff --git a/package/libnss/Config.in b/package/libnss/Config.in
 Will> new file mode 100644
 Will> index 0000000..12502c8
 Will> --- /dev/null
 Will> +++ b/package/libnss/Config.in
 Will> @@ -0,0 +1,13 @@
 Will> +config BR2_PACKAGE_LIBNSS
 Will> +	bool "libnss"
 Will> +	select BR2_PACKAGE_LIBNSPR
 Will> +	select BR2_PACKAGE_SQLITE
 Will> +	select BR2_PACKAGE_ZLIB
 Will> +	help

nspr needs largefile support, so you need to depend on largefile support
(and show a warning if not available) like nspr does,


 Will> +	  Network Security Services (NSS) is a set of libraries designed
 Will> +	  to support development of security-enabled client and server
 Will> +	  applications. Applications built with NSS can support SSL v2
 Will> +	  and v3, TLS, PKCS #5, PKCS #7, PKCS #11, PKCS #12, S/MIME,
 Will> +	  and X.509 v3 certificates.
 Will> +
 Will> +	  http://www.mozilla.org/projects/security/pki/nss/
 Will> diff --git a/package/libnss/libnss-cross.patch
 Will> b/package/libnss/libnss-cross.patch
 Will> new file mode 100644
 Will> index 0000000..8d01d7c
 Will> --- /dev/null
 Will> +++ b/package/libnss/libnss-cross.patch
 Will> @@ -0,0 +1,24 @@
 Will> +
 Will> +This patch allows us to set a value for the cross compiler via
 Will> TARGETCC without setting
 Will> +CC on the command line. CC is used for host tools as well as cross
 Will> compiled code so we
 Will> +cannot define it on the command line without breaking the host tools build.
 Will> +

Please sign off (git-style) on patches so it is easy to see who the
author is. What is the upstream status of this patch?


Will> +--- libnss-3.12.9.old/mozilla/security/coreconf/Linux.mk	2011-03-01
 Will> 10:31:21.517847183 +0000
 Will> ++++ libnss-3.12.9/mozilla/security/coreconf/Linux.mk	2011-03-01
 Will> 10:33:42.688648237 +0000
 Will> +@@ -46,9 +46,13 @@
 Will> + 	IMPL_STRATEGY = _PTH
 Will> + endif
 Will> +
 Will> +-CC			= gcc
 Will> +-CCC			= g++
 Will> +-RANLIB			= ranlib
 Will> ++TARGETCC		= gcc
 Will> ++TARGETCCC		= g++
 Will> ++TARGETRANLIB		= ranlib
 Will> ++
 Will> ++CC			= $(TARGETCC)
 Will> ++CCC			= $(TARGETCCC)
 Will> ++RANLIB			= $(TARGETRANLIB)
 Will> +
 Will> + DEFAULT_COMPILER = gcc
 Will> +


 Will> diff --git a/package/libnss/libnss-uclibc.patch
 Will> b/package/libnss/libnss-uclibc.patch
 Will> new file mode 100644
 Will> index 0000000..46b71b4
 Will> --- /dev/null
 Will> +++ b/package/libnss/libnss-uclibc.patch
 Will> @@ -0,0 +1,14 @@
 Will> +
 Will> +uCLibc does not support RTLD_NOLOAD.

Signed-off-by and upstream status again, please. This is because of the
libdl check, right?

      if (!(flag & (RTLD_LAZY|RTLD_NOW))) {
                _dl_error_number = LD_BAD_HANDLE;
                return NULL;

It would be good to only drop NOLOAD for uClibc, and not E.G. if you're
using an external (e)glibc toolchain with something like:

#include <features.h>
#ifdef __UCLIBC__
/* uClibc dlopen errors on NOLOAD */
#undef RTLD_NOLOAD
#define RTLD_NOLOAD 0
#endif

 Will> +
 Will> +--- libnss-3.12.9.old/mozilla/security/nss/lib/freebl/stubs.c	2011-03-01
 Will> 10:41:35.226450100 +0000
 Will> ++++ libnss-3.12.9/mozilla/security/nss/lib/freebl/stubs.c	2011-03-01
 Will> 10:42:14.628507934 +0000
 Will> +@@ -539,7 +539,7 @@
 Will> +  * fetch the library if it's loaded. For NSS it should already be loaded
 Will> +  */
 Will> + #define freebl_getLibrary(libName)  \
 Will> +-    dlopen (libName, RTLD_LAZY|RTLD_NOLOAD)
 Will> ++    dlopen (libName, RTLD_LAZY)
 Will> +
 Will> + #define freebl_releaseLibrary(lib) \
 Will> +     if (lib) dlclose(lib)
 Will> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
 Will> new file mode 100644
 Will> index 0000000..b530cc3
 Will> --- /dev/null
 Will> +++ b/package/libnss/libnss.mk
 Will> @@ -0,0 +1,62 @@
 Will> +#############################################################
 Will> +#
 Will> +# libnss
 Will> +#
 Will> +#############################################################
 Will> +LIBNSS_VERSION = 3.12.9
 Will> +LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 Will> +LIBNSS_SITE_VERSION = $(subst .,_,$(LIBNSS_VERSION))
 Will> +LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(LIBNSS_SITE_VERSION)_RTM/src/
 Will> +LIBNSS_SUBDIR = mozilla/security
 Will> +LIBNSS_DISTDIR = mozilla/dist
 Will> +LIBNSS_INSTALL_STAGING = YES
 Will> +LIBNSS_DEPENDENCIES = libnspr sqlite zlib
 Will> +
 Will> +LIBNSS_BUILD_VARS = MOZILLA_CLIENT=1 \
 Will> +		NSPR_INCLUDE_DIR=$(STAGING_DIR)/usr/include/nspr \
 Will> +		NSPR_LIB_DIR=$(STAGING_DIR)/usr/lib \
 Will> +		BUILD_OPT=1 \
 Will> +		NS_USE_GCC=1 \
 Will> +		OPTIMIZER="$(TARGET_CFLAGS)" \
 Will> +		NSS_USE_SYSTEM_SQLITE=1 \
 Will> +		NSS_ENABLE_ECC=1 \
 Will> +		NATIVE_CC="$(HOSTCC)" \
 Will> +		TARGETCC="$(TARGET_CC)" \
 Will> +		TARGETCCC="$(TARGET_CXX)" \
 Will> +		TARGETRANLIB="$(TARGET_RANLIB)" \
 Will> +		OS_ARCH="Linux" \
 Will> +		OS_RELEASE="2.6" \
 Will> +		OS_TEST="$(ARCH)"
 Will> +
 Will> +
 Will> +define LIBNSS_BUILD_CMDS
 Will> +	$(MAKE1) -C $(@D)/$(LIBNSS_SUBDIR)/nss build_coreconf build_dbm all \
 Will> +			SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 Will> +			DIST=$(@D)/$(LIBNSS_DISTDIR) \
 Will> +			CHECKLOC= \
 Will> +			$(LIBNSS_BUILD_VARS)
 Will> +endef
 Will> +
 Will> +define LIBNSS_INSTALL_STAGING_CMDS
 Will> +	$(INSTALL) -m 755 -t $(STAGING_DIR)/usr/lib/ \
 Will> +		$(@D)/$(LIBNSS_DISTDIR)/lib/*.so
 Will> +	$(INSTALL) -m 755 -d $(STAGING_DIR)/usr/include/nss
 Will> +	$(INSTALL) -m 644 -t $(STAGING_DIR)/usr/include/nss \
 Will> +		$(@D)/$(LIBNSS_DISTDIR)/public/nss/*
 Will> +	$(INSTALL) -m 755 -t $(STAGING_DIR)/usr/lib/ \
 Will> +		$(@D)/$(LIBNSS_DISTDIR)/lib/*.a
 Will> +endef

No make install?

 Will> +
 Will> +define LIBNSS_INSTALL_TARGET_CMDS
 Will> +	$(INSTALL) -m 755 -t $(TARGET_DIR)/usr/lib/ \
 Will> +		$(@D)/$(LIBNSS_DISTDIR)/lib/*.so
 Will> +endef

target install should preferably also install development stuff like
headers / .a files for people wanting to do development on target. The
global target-finalize step will remove them again if not needed.

-- 
Bye, Peter Korsgaard
