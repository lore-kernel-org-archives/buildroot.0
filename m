From: Andreas Naumann <dev@andin.de>
Date: Wed, 5 Dec 2018 16:23:13 +0100
Subject: [Buildroot] [PATCH next v6 10/10] package/pkg-kconfig: handle
 KCONFIG_DEPENDENCIES with per-package directories
In-Reply-To: <20181123145815.13008-11-thomas.petazzoni@bootlin.com>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-11-thomas.petazzoni@bootlin.com>
Message-ID: <64e9a50c-97d4-c90a-fac5-eae91cb8ae8e@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am 23.11.18 um 15:58 schrieb Thomas Petazzoni:
> The pkg-kconfig infrastructure hijacks the regular chain of build
> steps to insert its own step to prepare the configuration of kconfig
> packages. This additional step may have dependencies of its own, such
> as host-flex, host-bison or toolchain.
> 
> In the context of per-package directory support, those dependencies
> must be copied to the per-package directory of the current package
> prior to doing the config preparation. This commit implements this
> logic by adding a call to prepare-per-package-directory at the right
> spot.
> 
> Reported-by: Andreas Naumann <anaumann@ultratronik.de>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>   package/pkg-kconfig.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index d6c95b897e..bf43632adc 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -113,6 +113,7 @@ endef
>   # Since the file could be a defconfig file it needs to be expanded to a
>   # full .config first.
>   $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG): $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
> +	$$(call prepare-per-package-folder,$$($(2)_KCONFIG_DEPENDENCIES))
>   	$$(Q)$$(if $$($(2)_KCONFIG_DEFCONFIG), \
>   		$$($(2)_KCONFIG_MAKE) $$($(2)_KCONFIG_DEFCONFIG), \
>   		$$(INSTALL) -m 0644 -D $$($(2)_KCONFIG_FILE) $$(@))
> 

Finally I could test this and found an issue. Because I use ccache, the 
linux/uboot kconfig steps fail, because ccache apparently is not part of 
UBOOT/LINUX_KCONFIG_DEPENDENCIES.
Instead of conditionally adding it, my simple proposal would be to not 
use it, e.g.:

  # $(HOST_DIR)/lib/libncurses.so (which is not).  We don't actually
  # need any host-package for kconfig, so remove the HOSTCC/HOSTLDFLAGS
  # override again.
-UBOOT_KCONFIG_OPTS = $(UBOOT_MAKE_OPTS) HOSTCC="$(HOSTCC)" HOSTLDFLAGS=""
+UBOOT_KCONFIG_OPTS = $(UBOOT_MAKE_OPTS) HOSTCC="$(HOSTCC_NOCCACHE)" 
HOSTLDFLAGS=""

So after this, I'm not sure if there really was a need for above fix 
since the fixup/.config creation may not even need the only kconfig 
dependencies set so far: host-flex and host-bison..


regards,
Andreas
