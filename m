From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 22 Feb 2018 20:35:26 +0100
Subject: [Buildroot] [PATCH v2] 18xx-ti-utils: new package
In-Reply-To: <8239d07281c8cfecf4621067c18415f2b6a547d6.1518626634.git.baruch@tkos.co.il>
References: <8239d07281c8cfecf4621067c18415f2b6a547d6.1518626634.git.baruch@tkos.co.il>
Message-ID: <20180222193526.GB742@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Wed, Feb 14, 2018 at 06:43:54PM +0200, Baruch Siach wrote:
> These are spacial RF calibration utilities for the TI Wilink 18xx
> modules.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2:
>   * Fix the config symbol as noted by ThomasP
>   * Use STAGING_DIR for NFSROOT
> ---
>  DEVELOPERS                             |  1 +
>  package/18xx-ti-utils/18xx-ti-utils.mk | 28 ++++++++++++++++++++++++++++
>  package/18xx-ti-utils/Config.in        | 10 ++++++++++
>  package/Config.in                      |  1 +
>  4 files changed, 40 insertions(+)
>  create mode 100644 package/18xx-ti-utils/18xx-ti-utils.mk
>  create mode 100644 package/18xx-ti-utils/Config.in
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c524cb6ac505..2dc2d0665fcb 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -203,6 +203,7 @@ F:	package/pulseview/
>  F:	package/sigrok-cli/
>  
>  N:	Baruch Siach <baruch@tkos.co.il>
> +F:	package/18xx-ti-utils/
>  F:	package/daemon/
>  F:	package/dropbear/
>  F:	package/ebtables/
> diff --git a/package/18xx-ti-utils/18xx-ti-utils.mk b/package/18xx-ti-utils/18xx-ti-utils.mk
> new file mode 100644
> index 000000000000..b4af0f84dacd
> --- /dev/null
> +++ b/package/18xx-ti-utils/18xx-ti-utils.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# 18xx-ti-utils
> +#
> +################################################################################
> +
> +18XX_TI_UTILS_VERSION = R8.7_SP3
> +18XX_TI_UTILS_SITE = git://git.ti.com/wilink8-wlan/18xx-ti-utils
> +18XX_TI_UTILS_DEPENDENCIES = libnl
> +
> +18XX_TI_UTILS_CFLAGS = -I$(STAGING_DIR)/usr/include/libnl3 -DCONFIG_LIBNL32
> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +18XX_TI_UTILS_BUILD_TARGET = static
> +endif
> +
> +define 18XX_TI_UTILS_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) CROSS_COMPILE=$(TARGET_CROSS) \
> +		NFSROOT="$(STAGING_DIR)" NLVER=3 $(MAKE) -C $(@D) \
> +		CFLAGS="$(TARGET_CFLAGS) $(18XX_TI_UTILS_CFLAGS)" \
> +		$(18XX_TI_UTILS_BUILD_TARGET)
> +endef
> +
> +define 18XX_TI_UTILS_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 $(@D)/calibrator $(TARGET_DIR)/usr/bin/calibrator
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/package/18xx-ti-utils/Config.in b/package/18xx-ti-utils/Config.in
> new file mode 100644
> index 000000000000..1bfbb8dbec8f
> --- /dev/null
> +++ b/package/18xx-ti-utils/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_18XX_TI_UTILS
> +	bool "18xx-ti-utils"

You need to propagate dependencies for selected packages:

	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl

> +	select BR2_PACKAGE_LIBNL
> +	help
> +	  TI Wilink calibration utilities.
> +
> +	  CONFIG_NL80211_TESTMODE must be enabled in the kernel
> +	  configuration for this package to work.
> +
> +	  http://processors.wiki.ti.com/index.php/WL18xx_TX_Testing

A nice comment so we know why we are not able to select this package:

comment "18xx-ti-utils needs a uClibc or glibc toolchain w/ threads"
	depends on !BR2_TOOLCHAIN_HAS_THREADS 


> diff --git a/package/Config.in b/package/Config.in
> index 9cd5d9c08741..3c82f7ab00d5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -374,6 +374,7 @@ menu "Firmware"
>  	source "package/wilink-bt-firmware/Config.in"
>  	source "package/zd1211-firmware/Config.in"
>  endmenu
> +	source "package/18xx-ti-utils/Config.in"
>  	source "package/a10disp/Config.in"
>  	source "package/acpica/Config.in"
>  	source "package/acpid/Config.in"
> -- 
> 2.15.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


Thanks,
Marcus Folkesson
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180222/39314639/attachment.asc>
