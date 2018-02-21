From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Feb 2018 22:32:16 +0100
Subject: [Buildroot] [PATCH-FOR-NEXT v1 2/6] package: add libnss host
 package
In-Reply-To: <20180221142801.28997-3-gael.portay@savoirfairelinux.com>
References: <20180221142801.28997-1-gael.portay@savoirfairelinux.com>
 <20180221142801.28997-3-gael.portay@savoirfairelinux.com>
Message-ID: <20180221223216.67db3368@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Feb 2018 09:27:57 -0500, Ga?l PORTAY wrote:
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  .../0002-add-zlib-include-dir-variable.patch       | 30 +++++++++++++
>  package/libnss/libnss.mk                           | 50 ++++++++++++++++++++++
>  2 files changed, 80 insertions(+)
>  create mode 100644 package/libnss/0002-add-zlib-include-dir-variable.patch
> 
> diff --git a/package/libnss/0002-add-zlib-include-dir-variable.patch b/package/libnss/0002-add-zlib-include-dir-variable.patch
> new file mode 100644
> index 0000000000..c127d39249
> --- /dev/null
> +++ b/package/libnss/0002-add-zlib-include-dir-variable.patch
> @@ -0,0 +1,30 @@
> +Add ZLIB_INCLUDE_DIR variable

This patch needs a better description. This only describes *what* is
done, but not *why*. And the *why* is the most important, because the
*what* can trivially be seen by reading the patch :-)

> +
> +Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> +
> +--- libnss-3.33.orig/nss/lib/ssl/manifest.mn	2017-09-20 02:47:27.000000000 -0400
> ++++ libnss-3.33/nss/lib/ssl/manifest.mn	2018-02-16 16:45:41.512709898 -0500
> +@@ -6,6 +6,10 @@
> + 
> + # DEFINES = -DTRACE
> + 
> ++ifdef ZLIB_INCLUDE_DIR
> ++INCLUDES += -I$(ZLIB_INCLUDE_DIR)
> ++endif
> ++
> + EXPORTS = \
> +         ssl.h \
> +         sslt.h \
> +--- host-libnss-3.33.orig/nss/cmd/signtool/manifest.mn.orig	2018-02-16 17:08:58.474777871 -0500
> ++++ host-libnss-3.33/nss/cmd/signtool/manifest.mn	2018-02-16 17:09:22.603710963 -0500
> +@@ -6,6 +6,10 @@
> + 
> + MODULE = nss
> + 
> ++ifdef ZLIB_INCLUDE_DIR
> ++INCLUDES += -I$(ZLIB_INCLUDE_DIR)
> ++endif
> ++
> + EXPORTS = 
> + 
> + CSRCS = signtool.c		\
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index 27d305cc34..29f87ccb17 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -92,4 +92,54 @@ define LIBNSS_INSTALL_TARGET_CMDS
>  		$(TARGET_DIR)/usr/lib/pkgconfig/nss.pc
>  endef
>  
> +HOST_LIBNSS_BUILD_VARS = \
> +	MOZILLA_CLIENT=1 \
> +	NSPR_INCLUDE_DIR=$(HOST_DIR)/include/nspr \
> +	NSPR_LIB_DIR=$(HOST_DIR)/lib \
> +	BUILD_OPT=1 \
> +	NS_USE_GCC=1 \
> +	NSS_DISABLE_GTESTS=1 \
> +	NSS_USE_SYSTEM_SQLITE=1 \
> +	SQLITE_INCLUDE_DIR=$(HOST_DIR)/include \
> +	ZLIB_INCLUDE_DIR=$(HOST_DIR)/include \
> +	NSS_ENABLE_ECC=1 \
> +	NATIVE_CC="$(HOSTCC)" \
> +	NATIVE_FLAGS="$(HOST_CFLAGS)"

Are you sure the NATIVE_CC and NATIVE_FLAGS options are needed? When
cross-compiling, I do understand the meaning of those options, but not
when building natively.

> +
> +HOST_LIBNSS_DEPENDENCIES = host-libnspr host-sqlite host-zlib
> +
> +ifeq ($(HOSTARCH),x86_64)
> +HOST_LIBNSS_BUILD_VARS += USE_64=1

Same comment as for libnspr: there's more than x86-64 in the 64-bit
host architectures :)

Otherwise, looks good to me.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
