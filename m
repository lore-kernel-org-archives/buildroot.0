From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Jan 2021 00:45:24 +0100
Subject: [Buildroot] [PATCH v4 2/5] package/linux4tegra: new package
In-Reply-To: <20201119075328.8599-2-christian@paral.in>
References: <20201119075328.8599-1-christian@paral.in>
 <20201119075328.8599-2-christian@paral.in>
Message-ID: <de4c5993-a9aa-64c1-76f8-11a82de5dca3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/11/2020 08:53, Christian Stewart wrote:
> NVIDIA Linux4Tegra utilities and binaries.
> 
> https://developer.nvidia.com/embedded/linux-tegra-archive
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> 
> v1 -> v2:
> 
>  - cjs: add license hashes
> 
> v2 -> v3:
> 
>  - cjs: fix broken LICENSE hash
>  - cjs: add support for t210ref
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
[snip]
> diff --git a/package/linux4tegra/Config.in b/package/linux4tegra/Config.in
> new file mode 100644
> index 0000000000..71f29494dc
> --- /dev/null
> +++ b/package/linux4tegra/Config.in
> @@ -0,0 +1,28 @@
> +config BR2_PACKAGE_LINUX4TEGRA
> +	bool "linux4tegra"

 Since this package contains binaries, you'll need at least a dependency on the
arch, probably the subarch, and most likely also on libc.

> +	help
> +	  NVIDIA Linux4Tegra utilities and binaries.
> +
> +	  https://developer.nvidia.com/embedded/linux-tegra-archive
> +
> +if BR2_PACKAGE_LINUX4TEGRA
> +
> +choice
> +	prompt "Platform"
> +	default BR2_PACKAGE_LINUX4TEGRA_PLATFORM_T186REF
> +	help
> +	  Select the platform variant for linux4tegra.
> +
> +config BR2_PACKAGE_LINUX4TEGRA_PLATFORM_T186REF
> +	bool "t186ref"
> +	help
> +	  Jetson AGX Xavier, Xavier NX, or TX2
> +
> +config BR2_PACKAGE_LINUX4TEGRA_PLATFORM_T210REF
> +	bool "t210ref"
> +	help
> +	  Jetson Nano or Jetson TX1
> +
> +endchoice
> +
> +endif # if BR2_PACKAGE_LINUX4TEGRA

[snip]
> diff --git a/package/linux4tegra/linux4tegra.mk b/package/linux4tegra/linux4tegra.mk
> new file mode 100644
> index 0000000000..48061f4c98
> --- /dev/null
> +++ b/package/linux4tegra/linux4tegra.mk
> @@ -0,0 +1,120 @@
> +################################################################################
> +#
> +# linux4tegra
> +#
> +################################################################################
> +
> +LINUX4TEGRA_VERSION = 32.4.3
> +
> +ifeq ($(BR2_PACKAGE_LINUX4TEGRA_PLATFORM_T186REF),y)
> +LINUX4TEGRA_SITE = https://developer.nvidia.com/embedded/L4T/r32_Release_v4.3/t186ref_release_aarch64
> +LINUX4TEGRA_SOURCE = Tegra186_Linux_R$(LINUX4TEGRA_VERSION)_aarch64.tbz2
> +else # ifeq ($(BR2_PACKAGE_LINUX4TEGRA_PLATFORM_T210REF),y)
> +LINUX4TEGRA_SITE = https://developer.nvidia.com/embedded/L4T/r32_Release_v4.3/t210ref_release_aarch64
> +LINUX4TEGRA_SOURCE = Tegra210_Linux_R$(LINUX4TEGRA_VERSION)_aarch64.tbz2

 Maybe it would be better as

ifeq (...)
LINUX4TEGRA_VARIANT = 186
else
LINUX4TEGRA_VARIANT = 210
endif
LINUX4TEGRA_SITE =
https://developer.nvidia.com/embedded/L4T/r32_Release_v4.3/t$(LINUX4TEGRA_VARIANT)ref_release_aarch64
LINUX4TEGRA_SOURCE =
Tegra$(LINUX4TEGRA_VARIANT)_Linux_R$(LINUX4TEGRA_VERSION)_aarch64.tbz2


 And then, actually, it would be better to move the variant to a hidden option
in the Config.in (but that's a bit more advanced).

> +endif
> +
> +LINUX4TEGRA_LICENSE = NVIDIA Software License, GPL-2.0, LGPL, Apache-2.0, MIT

 LGPL -> LGPL-2.0 (or whatever version it is)

 Also check if there are any -or-later variants.

> +LINUX4TEGRA_LICENSE_FILES = \
> +	bootloader/LICENSE \
> +	bootloader/LICENSE.adsp \
> +	bootloader/LICENSE.bpmp \
> +	bootloader/LICENSE.bpmp_t194 \
> +	bootloader/LICENSE.camera-rtcpu \
> +	bootloader/LICENSE.cboot \
> +	bootloader/LICENSE.cboot_t194 \
> +	bootloader/LICENSE.chkbdinfo \
> +	bootloader/LICENSE.mce_c10_prod_cr \
> +	bootloader/LICENSE.mkbctpart \
> +	bootloader/LICENSE.mkbootimg \
> +	bootloader/LICENSE.mkgpt \
> +	bootloader/LICENSE.nv_smd_generator \
> +	bootloader/LICENSE.spe.bin \
> +	bootloader/LICENSE.spe_t194.bin \
> +	bootloader/LICENSE.tos-mon-only.img.arm-trusted-firmware \
> +	bootloader/LICENSE.tos-trusty.img.arm-trusted-firmware \
> +	bootloader/LICENSE.tos-trusty.img.trusty \
> +	bootloader/LICENSE.tos-trusty_t194.img.arm-trusted-firmware \
> +	bootloader/LICENSE.tos-trusty_t194.img.trusty \
> +	nv_tegra/LICENSE \
> +	nv_tegra/LICENSE \
> +	nv_tegra/LICENSE.brcm_patchram_plus \
> +	nv_tegra/LICENSE.l4t-usb-device-mode-filesystem.img \
> +	nv_tegra/LICENSE.libnvargus \
> +	nv_tegra/LICENSE.libnvcam_imageencoder \
> +	nv_tegra/LICENSE.libnveventlib \
> +	nv_tegra/LICENSE.libnvscf \
> +	nv_tegra/LICENSE.libnvtracebuf \
> +	nv_tegra/LICENSE.libtegrav4l2 \
> +	nv_tegra/LICENSE.minigbm \
> +	nv_tegra/LICENSE.nvbootctrl \
> +	nv_tegra/LICENSE.nvdla \
> +	nv_tegra/LICENSE.weston \
> +	nv_tegra/LICENSE.weston-data \
> +	nv_tegra/nvidia_configs/opt/nvidia/l4t-usb-device-mode/LICENSE.filesystem.img \
> +	nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.brcm_patchram_plus \
> +	nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.cypress_wifibt \
> +	nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.libnvargus \
> +	nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.libnvcam_imageencoder \
> +	nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.libnveventlib \
> +	nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.libnvtracebuf \
> +	nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.libnvv4l2 \
> +	nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.libnvv4lconvert \
> +	nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.libtegrav4l2 \
> +	nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.libvulkan1 \
> +	nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.minigbm \
> +	nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.nvdla \
> +	nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.realtek_8822ce_wifibt \
> +	nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.tegra_sensors \
> +	nv_tegra/nvidia_tools/usr/share/doc/nvidia-tegra/LICENSE.nvbootctrl \
> +	nv_tegra/nvidia_tools/usr/share/doc/nvidia-tegra/LICENSE.tipc_test
> +
> +LINUX4TEGRA_INSTALL_IMAGES = YES
> +
> +define LINUX4TEGRA_EXTRACT_NVIDIA_DRIVERS
> +	@mkdir -p $(@D)/nv_tegra/nvidia_drivers
> +	$(call suitable-extractor,nvidia_drivers.tbz2) \
> +		$(@D)/nv_tegra/nvidia_drivers.tbz2 | \
> +		$(TAR) -C $(@D)/nv_tegra/nvidia_drivers $(TAR_OPTIONS) -
> +endef
> +
> +LINUX4TEGRA_POST_EXTRACT_HOOKS += LINUX4TEGRA_EXTRACT_NVIDIA_DRIVERS
> +
> +define LINUX4TEGRA_EXTRACT_NVIDIA_CONFIGS
> +	@mkdir -p $(@D)/nv_tegra/nvidia_configs
> +	$(call suitable-extractor,config.tbz2) \
> +		$(@D)/nv_tegra/config.tbz2 | \
> +		$(TAR) -C $(@D)/nv_tegra/nvidia_configs $(TAR_OPTIONS) -
> +endef
> +
> +LINUX4TEGRA_POST_EXTRACT_HOOKS += LINUX4TEGRA_EXTRACT_NVIDIA_CONFIGS
> +
> +define LINUX4TEGRA_EXTRACT_NVIDIA_TOOLS
> +	@mkdir -p $(@D)/nv_tegra/nvidia_tools
> +	$(call suitable-extractor,nv_tools.tbz2) \
> +		$(@D)/nv_tegra/nv_tools.tbz2 | \
> +		$(TAR) -C $(@D)/nv_tegra/nvidia_tools $(TAR_OPTIONS) -
> +endef

 It would be nicer to summarize those three in a single foreach loop. Something
like:

	$(foreach tarball,nvidia_drivers configs nv_tools,\
		@mkdir -p $(@D)/nv_tegra/$(tarball)$(sep) \
		$(BZCAT) $(@D)/nv_tegra/$(tarball).tbz2 | \
		$(TAR) -C $(@D)/nv_tegra/$(tarball) $(TAR_OPTIONS) - $(sep))

(note that the directory names are changed here, but they're anyway internal).
(Note that suitable-extractor is not needed since we explicitly say it's bz2
anyway.)

> +
> +LINUX4TEGRA_POST_EXTRACT_HOOKS += LINUX4TEGRA_EXTRACT_NVIDIA_TOOLS
> +
> +# copy linux4tegra to the target dir
> +define LINUX4TEGRA_INSTALL_IMAGES_CMDS
> +	cp -r $(@D)/. $(BINARIES_DIR)/linux4tegra

 Do we really want to install *everything*, including the tbz2 files and the
libraries, into the images directory?

> +endef
> +
> +LINUX4TEGRA_RSYNC = \
> +	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
> +		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
> +		--keep-dirlinks --exclude=ld.so.conf.d

 I think most of these options are not relevant here.

 And actually, we could just extract everything directly to target directory
instead of first going to build directory and then copying, no?


> +
> +define LINUX4TEGRA_INSTALL_TARGET_CMDS
> +	# install nvidia_drivers
> +	$(LINUX4TEGRA_RSYNC) $(@D)/nv_tegra/nvidia_drivers/ $(TARGET_DIR)/
> +	# install nvidia_configs
> +	$(LINUX4TEGRA_RSYNC) $(@D)/nv_tegra/nvidia_configs/ $(TARGET_DIR)/
> +	# install nvidia_tools
> +	$(LINUX4TEGRA_RSYNC) $(@D)/nv_tegra/nvidia_tools/ $(TARGET_DIR)/
> +endef

 Since some of these are libraries, shouldn't they be installed to staging as well?

 Regards,
 Arnout

> +
> +$(eval $(generic-package))
> 
