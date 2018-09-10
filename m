From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Sep 2018 17:56:53 +0200
Subject: [Buildroot] [PATCH 1/2] bluez5_utils-headers: new package
In-Reply-To: <20180905113931.6703-1-grzegorz@blach.pl>
References: <20180905113931.6703-1-grzegorz@blach.pl>
Message-ID: <20180910155653.GE2674@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Grzegorz, All,

On 2018-09-05 13:39 +0200, Grzegorz Blach spake thusly:
> Header files from bluez utils version 5.x.
> 
> Separated headers are required to break circular dependencies
> when python3 is build with bluetooth support.
> 
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
[--SNIP--]
> diff --git a/package/bluez5_utils-headers/bluez5_utils_headers.hash b/package/bluez5_utils-headers/bluez5_utils_headers.hash
> new file mode 100644
> index 0000000000..b965708559
> --- /dev/null
> +++ b/package/bluez5_utils-headers/bluez5_utils_headers.hash
> @@ -0,0 +1,4 @@
> +# From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
> +sha256  5ffcaae18bbb6155f1591be8c24898dc12f062075a40b538b745bfd477481911  bluez-5.50.tar.xz
> +sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
> +sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
> diff --git a/package/bluez5_utils-headers/bluez5_utils_headers.mk b/package/bluez5_utils-headers/bluez5_utils_headers.mk
> new file mode 100644
> index 0000000000..9bc463432c
> --- /dev/null
> +++ b/package/bluez5_utils-headers/bluez5_utils_headers.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# bluez5_utils-headers
> +#
> +################################################################################
> +
> +BLUEZ5_UTILS_HEADERS_VERSION = 5.50
> +BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz

Since we are using the same source tarball as for bluez5_utils, we want
to download it and store it only once:

    BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils

Consequently, the hash file should be a symlink to the one from
bluez5_utils.

See for example mesa3d and mesa3d-headers for an example.

Regards,
Yann E. MORIN.

> +BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
> +BLUEZ5_UTILS_HEADERS_LICENSE = GPL-2.0+, LGPL-2.1+
> +BLUEZ5_UTILS_HEADERS_LICENSE_FILES = COPYING COPYING.LIB
> +
> +BLUEZ5_UTILS_HEADERS_INSTALL_STAGING = YES
> +BLUEZ5_UTILS_HEADERS_INSTALL_TARGET = NO
> +
> +define BLUEZ5_UTILS_HEADERS_INSTALL_STAGING_CMDS
> +	$(INSTALL) -d $(STAGING_DIR)/usr/include/bluetooth/
> +	$(INSTALL) -m 644 $(@D)/lib/*.h $(STAGING_DIR)/usr/include/bluetooth/
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
