From: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sun, 10 Jun 2018 22:48:24 -0400
Subject: [Buildroot] [PATCH v2] libusb: add an option to compile examples
In-Reply-To: <20180610220849.15558-1-gael.portay@savoirfairelinux.com>
References: <20180610220849.15558-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180611024824.7mvsemzpkb5ko254@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the missing changelog...

On Sun, Jun 10, 2018 at 06:08:49PM -0400, Ga?l PORTAY wrote:
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  package/libusb/Config.in |  7 +++++++
>  package/libusb/libusb.mk | 10 ++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/package/libusb/Config.in b/package/libusb/Config.in
> index 5238588aa8..d31a717fdf 100644
> --- a/package/libusb/Config.in
> +++ b/package/libusb/Config.in
> @@ -6,5 +6,12 @@ config BR2_PACKAGE_LIBUSB
>  
>  	  http://libusb.info/
>  
> +if BR2_PACKAGE_LIBUSB
> +
> +config BR2_PACKAGE_LIBUSB_EXAMPLES
> +	bool "build libusb examples"
> +
> +endif
> +
>  comment "libusb needs a toolchain w/ threads"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
> index aee3622f8d..2cad3dec7f 100644
> --- a/package/libusb/libusb.mk
> +++ b/package/libusb/libusb.mk
> @@ -25,5 +25,15 @@ else
>  LIBUSB_CONF_OPTS += --disable-udev
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBUSB_EXAMPLES),y)
> +LIBUSB_CONF_OPTS += --enable-examples-build
> +define LIBUSB_INSTALL_TARGET_EXAMPLES
> +	for example in listdevs xusb fxload hotplugtest testlibusb dpfp dpfp_threaded sam3u_benchmark oopps ; do \
> +		cp -dpfr $(@D)/examples/$${example} $(TARGET_DIR)/usr/bin; \
> +	done
> +endef
> +LIBUSB_POST_INSTALL_TARGET_HOOKS += LIBUSB_INSTALL_TARGET_EXAMPLES
> +endif
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> -- 
> 2.11.0
> 

Changes since v1:
 - remove presence check.

Regards,
Gael
