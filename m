From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 14:34:04 +0200
Subject: [Buildroot] [PATCH 04/27] package/libnss: re-enable package on
 microblaze
In-Reply-To: <20190614210346.121013-5-giulio.benetti@micronovasrl.com>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-5-giulio.benetti@micronovasrl.com>
Message-ID: <20190619143404.5a1452a6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Jun 2019 23:03:23 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index 484c79e9da..893ff80154 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -13,9 +13,15 @@ LIBNSS_DEPENDENCIES = libnspr sqlite zlib
>  LIBNSS_LICENSE = MPL-2.0
>  LIBNSS_LICENSE_FILES = nss/COPYING
>  
> +LIBNSS_CFLAGS = $(TARGET_CFLAGS)
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85862),y)
> +LIBNSS_CFLAGS += -O0
> +endif
> +
>  # Need to pass down TARGET_CFLAGS and TARGET_LDFLAGS
>  define LIBNSS_FIXUP_LINUX_MK
> -	echo 'OS_CFLAGS += ${TARGET_CFLAGS}' >> $(@D)/nss/coreconf/Linux.mk
> +	echo 'OS_CFLAGS += ${LIBNSS_CFLAGS}' >> $(@D)/nss/coreconf/Linux.mk

Please use $(...) to reference make variables.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
