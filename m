From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 23 Mar 2015 11:28:49 +0100
Subject: [Buildroot] [PATCH v3 3/3] boot/uboot: Add uboot-menuconfig and
	friends
In-Reply-To: <1423088981-13255-3-git-send-email-joerg.krause@embedded.rocks>
References: <1423088981-13255-1-git-send-email-joerg.krause@embedded.rocks>
 <1423088981-13255-3-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <CAGm1_ktibDOCMvQqb4qAKGGM9SQvNnAX+Fbo0E-zq7ASW=NLyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On Wed, Feb 4, 2015 at 11:29 PM, J?rg Krause
<joerg.krause@embedded.rocks> wrote:
> Add uboot-menuconfig, uboot-spl/menuconfig, uboot-tpl/menuconfig and their
> friends as make targets.
>
> The Kconfig configuration in U-Boot is different from Linux. The biggest
> difference is that U-Boot has to configure multiple boot images per board:
> Normal, SPL, TPL. The Kconfig functions are expanded for U-Boot to handle
> multiple images.
>
> menuconfig and friends are used to configure Normal and create (or modify)
> the .config file. For SPL configuration, the configutation targets are
> prefixed with "spl/", for example "make spl/config", "make spl/menuconfig",
> etc. Those targets create or modify the spl/.config file. Likewise, run
> "make tpl/config", "make tpl/menuconfig", etc. for TPL.
>
> The target "<board>_defconfig" is used to create the .config, spl/.config
> (if CONFIG_SPL is defined) and tpl/.config (if CONFIG_TPL is defined) based
> on the file configs/<board>_defconfig.
>
> savedefconfig creates a minimal set of config based on the .config and saves
> it into the "defconfig" file. If CONFIG_SPL (and CONFIG_TPL) is defined, the
> common lines among .config, spl/.config (and tpl/.config) are coalesced
> together with a special syntax where each line has a "<condition>:" prefix.
>
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> Changes v2 -> v3:
>   - Add spl/menuconfig and tpl/menuconfig and their friends
>   - Rewrite commit log
> Changes v1 -> v2:
>   - Retain backward compatibility (Thomas)
> ---
>  boot/uboot/uboot.mk | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 2ea9c86..2c39435 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -185,6 +185,26 @@ endif
>  $(eval $(generic-package))
>
>  ifeq ($(BR2_TARGET_UBOOT),y)
> +ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
> +uboot-menuconfig uboot-xconfig uboot-gconfig uboot-nconfig: uboot-configure
> +       $(TARGET_MAKE_ENV) $(MAKE) $(UBOOT_MAKE_OPTS) -C $(UBOOT_DIR) $(subst uboot-,,$@)
> +       rm -f $(UBOOT_DIR)/.stamp_{built,target_installed,images_installed}
> +uboot-spl/menuconfig uboot-spl/xconfig uboot-spl/gconfig uboot-spl/nconfig: uboot-configure
> +       $(TARGET_MAKE_ENV) $(MAKE) $(UBOOT_MAKE_OPTS) -C $(UBOOT_DIR) $(subst uboot-,,$@)
> +       rm -f $(UBOOT_DIR)/.stamp_{built,target_installed,images_installed}
> +uboot-tpl/menuconfig uboot-tpl/xconfig uboot-tpl/gconfig uboot-tpl/nconfig: uboot-configure
> +       $(TARGET_MAKE_ENV) $(MAKE) $(UBOOT_MAKE_OPTS) -C $(UBOOT_DIR) $(subst uboot-,,$@)
> +       rm -f $(UBOOT_DIR)/.stamp_{built,target_installed,images_installed}
> +uboot-savedefconfig: uboot-configure
> +       $(TARGET_MAKE_ENV) $(MAKE) $(UBOOT_MAKE_OPTS) -C $(UBOOT_DIR) $(subst uboot-,,$@)
> +ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG_USE_CUSTOM_DEFCONFIG),y)
> +uboot-update-defconfig: uboot-savedefconfig
> +       cp -f $(UBOOT_DIR)/defconfig $(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG_CUSTOM_DEFCONFIG_FILE)
> +else
> +uboot-update-defconfig: ;
> +endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG_USE_CUSTOM_CONFIG
> +endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> +
>  # we NEED a board name unless we're at make source
>  ifeq ($(filter source,$(MAKECMDGOALS)),)

could you please rework your patches to reflect the newest U-Boot
Kconfig changes?

kconfig: switch to single .config configuration
(http://permalink.gmane.org/gmane.comp.boot-loaders.u-boot/212547)

Yegor
