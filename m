From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 21 Jul 2020 11:01:52 +0200
Subject: [Buildroot] [PATCH v5 3/3] board: Add Kontron SMARC-sAL28
 support
In-Reply-To: <20200604221123.1850-3-michael@walle.cc>
References: <20200604221123.1850-1-michael@walle.cc>
 <20200604221123.1850-3-michael@walle.cc>
Message-ID: <CAEyMn7ZA91h7fo7SvSf6rbP+H0TKCh+DQf+srycZeMXqFWgNLg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michael,

Am Fr., 5. Juni 2020 um 00:11 Uhr schrieb Michael Walle <michael@walle.cc>:
>
> Now that upstream supports this board add buildroot support for it, too.
>
> This supports:
>  - latest upstream linux kernel. Since the support for this board and
>    its SoC is still in active development, we want to follow the
>    upstream kernel releases for now.
>  - building an image which can be installed to eMMC, SD card or USB
>    thumb drive.
>  - upstream u-boot patches are pending, therefore no support for
>    building a bootloader for now.
>
> Signed-off-by: Michael Walle <michael@walle.cc>
> Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>
> Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
> Changes since v4:
>  none
>
> Changes since v3:
>  - removed custom kernel version, instead use the latest 5.7 kernel
>
> Changes since v2:
>  - added udev rules 71-smarc-networking.rules, to rename the network
>    interfaces according to the SMARC specification.
>  - removed arm-smmu.disable_bypass=n kernel paramter, since the real fix is
>    now upstream and will be included in 5.7
>  - use full path in PARTUUID="$($HOST_DIR/bin/uuidgen)" to be sure we are
>    using our own uuidgen
>  - mention fdtfile in readme.txt
>  - fixed typo in readme.txt
>  - mention non-working network with vendor's bootloader in readme.txt
>  - set BR2_KERNEL_DTB_KEEP_DIRNAME=y
>
> Changes since v1:
>  - added readme.txt
>  - changed from u-boot boot script to extlinux.conf booting
>  - enable eudev and added udev rules to properly name network interfaces
>  - removed CONFIG_FSL_ENETC_HW_TIMESTAMPING=y
>  - added CONFIG_NET_SCH_CBS, CONFIG_NET_SCH_ETF, CONFIG_NET_SCH_TAPRIO,
>    CONFIG_FSL_ENETC_QOS and iproute2, as this it the main feature of this
>    board
>  - added var2 device tree
>  - generate PARTUUID in post-build.sh to be able to use the resulting image
>    on any block device which the board supports for booting
>  - (keep post-build.sh for consistency reasons)
>

[snip]

> +++ b/configs/kontron_smarc_sal28_defconfig
> @@ -0,0 +1,22 @@
> +BR2_aarch64=y
> +BR2_cortex_a72=y
> +BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> +BR2_ROOTFS_OVERLAY="board/kontron/smarc-sal28/rootfs_overlay"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/smarc-sal28/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/kontron/smarc-sal28/linux.fragment"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-kontron-sl28 freescale/fsl-ls1028a-kontron-sl28-var2 freescale/fsl-ls1028a-kontron-sl28-var3-ads2 freescale/fsl-ls1028a-kontron-sl28-var4 freescale/fsl-ls1028a-kontron-kbox-a-230-ls"
> +BR2_KERNEL_DTB_KEEP_DIRNAME=y

This config option should be:
BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME

This was changed due to a naming-scheme mismatch
(d8e3e939694c4777c5287e44e67772f4e5c043aa).

> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_PACKAGE_IPROUTE2=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> --
> 2.20.1
>

-- 
Heiko
