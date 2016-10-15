From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Oct 2016 12:47:19 +0200
Subject: [Buildroot] [PATCH v4 2/3] arm-trusted-firmware: new package
In-Reply-To: <1476518623-30654-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1476518623-30654-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1476518623-30654-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20161015104719.GD3668@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Joao, All,

On 2016-10-15 10:03 +0200, Thomas Petazzoni spake thusly:
> From: Joao Pinto <jpinto@synopsys.com>
> 
> Signed-off-by: Joao Pinto <jpinto@synopsys.com>
> [Thomas:
>  - Rename the package from atfirmware to arm-trusted-firmware, in order
>    to match upstream.
>  - Remove option to apply custom patches. We no longer add such options,
>    and use the global patch directory instead.
>  - Rename the repo URL/version options, in order to not be Git specific,
>    in case support for fetching from other VCS is added later. This is
>    consistent with how other bootloaders handle this.
>  - Add license information.
>  - Do not add a weird dependency on the vexpress-firmware package in
>    Config.in. Instead, simply use it if it's available. Of course, some
>    configurations (such as the juno configuration) will fail to build if
>    vexpress-image is not enabled, but it's the responsibility of the
>    user to create a config that builds.
>  - Simplify misc aspects in the .mk file.]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  boot/Config.in                                     |  1 +
>  boot/arm-trusted-firmware/Config.in                | 65 ++++++++++++++++++++
>  .../arm-trusted-firmware/arm-trusted-firmware.hash |  3 +
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk  | 69 ++++++++++++++++++++++
>  4 files changed, 138 insertions(+)
>  create mode 100644 boot/arm-trusted-firmware/Config.in
>  create mode 100644 boot/arm-trusted-firmware/arm-trusted-firmware.hash
>  create mode 100644 boot/arm-trusted-firmware/arm-trusted-firmware.mk
[--SNIP--]
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> new file mode 100644
> index 0000000..5acfab3
> --- /dev/null
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -0,0 +1,69 @@
> +################################################################################
> +#
> +# arm-trusted-firmware
> +#
> +################################################################################
> +
> +ARM_TRUSTED_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION))
> +ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3c
> +ARM_TRUSTED_FIRMWARE_LICENSE_FILES = license.md
> +
> +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += uboot
> +
> +ifeq ($(ARM_TRUSTED_FIRMWARE_VERSION),custom)
> +# Handle custom ATF tarballs as specified by the configuration
> +ARM_TRUSTED_FIRMWARE_TARBALL = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION))
> +ARM_TRUSTED_FIRMWARE_SITE = $(patsubst %/,%,$(dir $(ARM_TRUSTED_FIRMWARE_TARBALL)))
> +ARM_TRUSTED_FIRMWARE_SOURCE = $(notdir $(ARM_TRUSTED_FIRMWARE_TARBALL))
> +BR_NO_CHECK_HASH_FOR += $(ARM_TRUSTED_FIRMWARE_SOURCE)
> +else ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT),y)
> +ARM_TRUSTED_FIRMWARE_SITE = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL))
> +ARM_TRUSTED_FIRMWARE_SITE_METHOD = git
> +else
> +ARM_TRUSTED_FIRMWARE_SITE = $(call github,ARM-software,arm-trusted-firmware,$(ARM_TRUSTED_FIRMWARE_VERSION))
> +endif
> +
> +ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES = YES
> +
> +ARM_TRUSTED_FIRMWARE_PLATFORM = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM))
> +
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
> +	CROSS_COMPILE="$(TARGET_CROSS)" \
> +	BL33=$(BINARIES_DIR)/u-boot.bin \
> +	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
> +	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM) \
> +	all fip
> +
> +ifeq ($(BR2_TARGET_VEXPRESS_FIRMWARE),y)
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += SCP_BL2=$(BINARIES_DIR)/scp-fw.bin
> +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += vexpress-firmware
> +endif
> +
> +define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) \
> +		$(MAKE) -C $(@D) $(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
> +			$(ARM_TRUSTED_FIRMWARE_MAKE_TARGET)
> +endef
> +
> +define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
> +	cp -dpf $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/release/*.bin $(BINARIES_DIR)/

Usually, we do create the destination directory before copying a bunch
files in there. But that one directory, we do guarantee it exists.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +endef
> +
> +# Configuration ckeck
> +ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE)$(BR_BUILDING),yy)
> +
> +ifeq ($(ARM_TRUSTED_FIRMWARE_VERSION),custom)
> +ifeq ($(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION))),)
> +$(error No tarball location specified. Please check BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION))
> +endif
> +endif
> +
> +ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT),y)
> +ifeq ($(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL)),)
> +$(error No repository specified. Please check BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL)
> +endif
> +endif
> +
> +endif
> +
> +$(eval $(generic-package))
> -- 
> 2.7.4
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
