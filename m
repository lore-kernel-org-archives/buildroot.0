From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 8 Aug 2020 10:19:41 +0300
Subject: [Buildroot] [PATCH v1 2/6] package/linux4tegra: new package
In-Reply-To: <20200801213658.33869-2-christian@paral.in>
References: <20200801213658.33869-2-christian@paral.in>
Message-ID: <CALFsTFW7Rf4BbrKrNi-aygTD0eDFFPcRxCD1WCjnRWspV8CUjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Aug 2, 2020 at 12:37 AM Christian Stewart <christian@paral.in> wrote:
>
> NVIDIA Linux4Tegra utilities and binaries.
>
> https://developer.nvidia.com/embedded/linux-tegra-archive
>
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/Config.in                             |   1 +
>  ...for-flashing-Buildroot-produced-disk.patch |  58 +++++++++
>  package/linux4tegra/Config.in                 |   6 +
>  package/linux4tegra/linux4tegra.hash          |   2 +
>  package/linux4tegra/linux4tegra.mk            | 114 ++++++++++++++++++
>  5 files changed, 181 insertions(+)
>  create mode 100644 package/linux4tegra/0001-Adjust-flash.sh-for-flashing-Buildroot-produced-disk.patch
>  create mode 100644 package/linux4tegra/Config.in
>  create mode 100644 package/linux4tegra/linux4tegra.hash
>  create mode 100644 package/linux4tegra/linux4tegra.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 3349641371..0d34824128 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -481,6 +481,7 @@ endmenu
>         source "package/libuio/Config.in"
>         source "package/linux-backports/Config.in"
>         source "package/linux-serial-test/Config.in"
> +       source "package/linux4tegra/Config.in"
>         source "package/linuxconsoletools/Config.in"
>         source "package/lirc-tools/Config.in"
>         source "package/lm-sensors/Config.in"
> diff --git a/package/linux4tegra/0001-Adjust-flash.sh-for-flashing-Buildroot-produced-disk.patch b/package/linux4tegra/0001-Adjust-flash.sh-for-flashing-Buildroot-produced-disk.patch
> new file mode 100644
> index 0000000000..4ace27bddc
> --- /dev/null
> +++ b/package/linux4tegra/0001-Adjust-flash.sh-for-flashing-Buildroot-produced-disk.patch
> @@ -0,0 +1,58 @@
> +From fbd0d35995a23351d4b50ed0b814442a6873ded2 Mon Sep 17 00:00:00 2001
> +From: Christian Stewart <christian@paral.in>
> +Date: Fri, 17 Jul 2020 13:58:43 -0700
> +Subject: [PATCH] Adjust flash.sh for flashing Buildroot-produced disk image
> +
> +Signed-off-by: Christian Stewart <christian@paral.in>
> +---
> + flash.sh | 19 ++++++++++---------
> + 1 file changed, 10 insertions(+), 9 deletions(-)
> +
> +diff --git a/flash.sh b/flash.sh
> +index 38c0cbb..c27b41b 100755
> +--- a/flash.sh
> ++++ b/flash.sh
> +@@ -1339,9 +1339,10 @@ elif [ "${target_rootdev}" == "internal" ] || \
> +               usage allunknown 1;
> +       fi
> +
> +-      cmdline+="root=PARTUUID=${rootfsuuid} rw rootwait rootfstype=ext4 "
> ++      # cmdline+="root=PARTUUID=${rootfsuuid} rw rootwait rootfstype=ext4 "
> ++      cmdline+="root=/dev/${target_rootdev} rw rootwait"
> + else
> +-      cmdline+="root=/dev/${target_rootdev} rw rootwait rootfstype=ext4 "
> ++      cmdline+="root=/dev/${target_rootdev} rw rootwait"
> + fi;
> +
> + if [ "${CMDLINE_ADD}" != "" ]; then
> +@@ -1512,11 +1513,7 @@ if [ "${write_image_name}" != "" ]; then
> +       fi
> + fi
> +
> +-if [ "${INITRD_IN_BOOTIMG}" = "yes" ]; then
> +-      ramdisk=initrd;
> +-else
> +-      ramdisk="/dev/null"
> +-fi
> ++ramdisk="/dev/null"
> + echo -n "Making Boot image... ";
> + MKBOOTARG+="--kernel ${kernel_image} ";
> + MKBOOTARG+="--ramdisk ${ramdisk} ";
> +@@ -1977,8 +1974,12 @@ if [ "${reuse_systemimg}" = "true" ] || [ "${skip_systemimg}" = "true" ]; then
> + elif [ "${rootdev_type}" = "internal" ]; then
> +       APP_TAG+="-e s/APPFILE/${localsysfile}/ ";
> +       if [ "${target_partname}" = "" -o "${target_partname}" = "APP" ]; then
> +-              build_fsimg "$localsysfile" "$fillpat" \
> +-                  "$rootfssize" "$rootfs_type" "$rootfs_dir" "$cmdline";
> ++    echo "Skipping image build and setting target_partfile to INITRD."
> ++    # target_partfile=${INITRD}
> ++    # cp ${INITRD} ./system.img
> ++    ln -fs ${INITRD} ./system.img
> ++              #build_fsimg "$localsysfile" "$fillpat" \
> ++              #    "$rootfssize" "$rootfs_type" "$rootfs_dir" "$cmdline";
> +       fi;
> + elif [ "${rootdev_type}" = "network" -o "${rootdev_type}" = "external" ]; then
> +       APP_TAG+="-e s/APPFILE/${localsysfile}/ ";
> +--
> +2.27.0
> +
> diff --git a/package/linux4tegra/Config.in b/package/linux4tegra/Config.in
> new file mode 100644
> index 0000000000..06d449e21e
> --- /dev/null
> +++ b/package/linux4tegra/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_LINUX4TEGRA
> +       bool "linux4tegra"
> +       help
> +         NVIDIA Linux4Tegra utilities and binaries.
> +
> +         https://developer.nvidia.com/embedded/linux-tegra-archive
> diff --git a/package/linux4tegra/linux4tegra.hash b/package/linux4tegra/linux4tegra.hash
> new file mode 100644
> index 0000000000..e73577a160
> --- /dev/null
> +++ b/package/linux4tegra/linux4tegra.hash
> @@ -0,0 +1,2 @@
> +# locally computed
> +sha256 9a2d13b1f4b67fef97a428d54724b23e84e14636eedfa22f338c2d1ea62558e2  Tegra186_Linux_R32.4.3_aarch64.tbz2
You should add the hash for license files too...

> diff --git a/package/linux4tegra/linux4tegra.mk b/package/linux4tegra/linux4tegra.mk
> new file mode 100644
> index 0000000000..74cb19723e
> --- /dev/null
> +++ b/package/linux4tegra/linux4tegra.mk
> @@ -0,0 +1,114 @@
> +################################################################################
> +#
> +# linux4tegra
> +#
> +################################################################################
> +
> +LINUX4TEGRA_VERSION = 32.4.3
> +LINUX4TEGRA_SITE = https://developer.nvidia.com/embedded/L4T/r32_Release_v4.3/t186ref_release_aarch64
> +LINUX4TEGRA_SOURCE = Tegra186_Linux_R$(LINUX4TEGRA_VERSION)_aarch64.tbz2
> +
> +LINUX4TEGRA_LICENSE = NVIDIA Software License, GPL-2.0, LGPL, Apache-2.0, MIT
> +LINUX4TEGRA_LICENSE_FILES = \
> +       bootloader/LICENSE \
> +       bootloader/LICENSE.adsp \
> +       bootloader/LICENSE.bpmp \
> +       bootloader/LICENSE.bpmp_t194 \
> +       bootloader/LICENSE.camera-rtcpu \
> +       bootloader/LICENSE.cboot \
> +       bootloader/LICENSE.cboot_t194 \
> +       bootloader/LICENSE.chkbdinfo \
> +       bootloader/LICENSE.mce_c10_prod_cr \
> +       bootloader/LICENSE.mkbctpart \
> +       bootloader/LICENSE.mkbootimg \
> +       bootloader/LICENSE.mkgpt \
> +       bootloader/LICENSE.nv_smd_generator \
> +       bootloader/LICENSE.spe.bin \
> +       bootloader/LICENSE.spe_t194.bin \
> +       bootloader/LICENSE.tos-mon-only.img.arm-trusted-firmware \
> +       bootloader/LICENSE.tos-trusty.img.arm-trusted-firmware \
> +       bootloader/LICENSE.tos-trusty.img.trusty \
> +       bootloader/LICENSE.tos-trusty_t194.img.arm-trusted-firmware \
> +       bootloader/LICENSE.tos-trusty_t194.img.trusty \
> +       nv_tegra/LICENSE \
> +       nv_tegra/LICENSE \
> +       nv_tegra/LICENSE.brcm_patchram_plus \
> +       nv_tegra/LICENSE.l4t-usb-device-mode-filesystem.img \
> +       nv_tegra/LICENSE.libnvargus \
> +       nv_tegra/LICENSE.libnvcam_imageencoder \
> +       nv_tegra/LICENSE.libnveventlib \
> +       nv_tegra/LICENSE.libnvscf \
> +       nv_tegra/LICENSE.libnvtracebuf \
> +       nv_tegra/LICENSE.libtegrav4l2 \
> +       nv_tegra/LICENSE.minigbm \
> +       nv_tegra/LICENSE.nvbootctrl \
> +       nv_tegra/LICENSE.nvdla \
> +       nv_tegra/LICENSE.weston \
> +       nv_tegra/LICENSE.weston-data \
> +       nv_tegra/nvidia_configs/opt/nvidia/l4t-usb-device-mode/LICENSE.filesystem.img \
> +       nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.brcm_patchram_plus \
> +       nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.cypress_wifibt \
> +       nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.libnvargus \
> +       nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.libnvcam_imageencoder \
> +       nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.libnveventlib \
> +       nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.libnvtracebuf \
> +       nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.libnvv4l2 \
> +       nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.libnvv4lconvert \
> +       nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.libtegrav4l2 \
> +       nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.libvulkan1 \
> +       nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.minigbm \
> +       nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.nvdla \
> +       nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.realtek_8822ce_wifibt \
> +       nv_tegra/nvidia_drivers/usr/share/doc/nvidia-tegra/LICENSE.tegra_sensors \
> +       nv_tegra/nvidia_tools/usr/share/doc/nvidia-tegra/LICENSE.nvbootctrl \
> +       nv_tegra/nvidia_tools/usr/share/doc/nvidia-tegra/LICENSE.tipc_test
> +
> +LINUX4TEGRA_INSTALL_IMAGES = YES
> +
> +define LINUX4TEGRA_EXTRACT_NVIDIA_DRIVERS
> +       @mkdir -p $(@D)/nv_tegra/nvidia_drivers
> +       $(call suitable-extractor,nvidia_drivers.tbz2) \
> +               $(@D)/nv_tegra/nvidia_drivers.tbz2 | \
> +               $(TAR) -C $(@D)/nv_tegra/nvidia_drivers $(TAR_OPTIONS) -
> +endef
> +
> +LINUX4TEGRA_POST_EXTRACT_HOOKS += LINUX4TEGRA_EXTRACT_NVIDIA_DRIVERS
> +
> +define LINUX4TEGRA_EXTRACT_NVIDIA_CONFIGS
> +       @mkdir -p $(@D)/nv_tegra/nvidia_configs
> +       $(call suitable-extractor,config.tbz2) \
> +               $(@D)/nv_tegra/config.tbz2 | \
> +               $(TAR) -C $(@D)/nv_tegra/nvidia_configs $(TAR_OPTIONS) -
> +endef
> +
> +LINUX4TEGRA_POST_EXTRACT_HOOKS += LINUX4TEGRA_EXTRACT_NVIDIA_CONFIGS
> +
> +define LINUX4TEGRA_EXTRACT_NVIDIA_TOOLS
> +       @mkdir -p $(@D)/nv_tegra/nvidia_tools
> +       $(call suitable-extractor,nv_tools.tbz2) \
> +               $(@D)/nv_tegra/nv_tools.tbz2 | \
> +               $(TAR) -C $(@D)/nv_tegra/nvidia_tools $(TAR_OPTIONS) -
> +endef
> +
> +LINUX4TEGRA_POST_EXTRACT_HOOKS += LINUX4TEGRA_EXTRACT_NVIDIA_TOOLS
> +
> +# symlink linux4tegra to the target dir.
> +define LINUX4TEGRA_INSTALL_IMAGES_CMDS
> +       ln -fs $(@D) $(BINARIES_DIR)/linux4tegra
> +endef
I'm not sure I understand what is the purpose of that symlink on the images dir.
Who's going to use or reference that link?
Maybe a comment with a little description of this link would help.

> +
> +LINUX4TEGRA_RSYNC = \
> +       rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
> +               --chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
> +               --keep-dirlinks --exclude=ld.so.conf.d
> +
> +define LINUX4TEGRA_INSTALL_TARGET_CMDS
> +       # install nvidia_drivers
> +       $(LINUX4TEGRA_RSYNC) $(@D)/nv_tegra/nvidia_drivers/ $(TARGET_DIR)/
> +       # install nvidia_configs
> +       $(LINUX4TEGRA_RSYNC) $(@D)/nv_tegra/nvidia_configs/ $(TARGET_DIR)/
> +       # install nvidia_tools
> +       $(LINUX4TEGRA_RSYNC) $(@D)/nv_tegra/nvidia_tools/ $(TARGET_DIR)/
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.27.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,
Asaf.
