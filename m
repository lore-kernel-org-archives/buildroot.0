From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Oct 2015 15:03:48 +0100
Subject: [Buildroot] board: add support for ARM Juno r1 Development Board
In-Reply-To: <3abef576fe1e985dab815801a01bdec1c1014793.1443796077.git.jpinto@synopsys.com>
References: <3abef576fe1e985dab815801a01bdec1c1014793.1443796077.git.jpinto@synopsys.com>
Message-ID: <560FE044.4080405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Joao,

On 02-10-15 15:30, Joao Pinto wrote:
> The Juno r1 ARM Development Platform (ADP) is a software development
> platform for ARMv8-A, it includes the Juno r1 Versatile Express board 
> and an ARMv8-A reference software port available through Linaro.
> 
> Signed-off-by: Joao Pinto <jpinto@synopsys.com>
> ---
>  board/arm/junor1/fs-overlay/etc/inittab |  36 +++++
>  board/arm/junor1/linux-junor1-defconfig | 229 ++++++++++++++++++++++++++++++++
>  configs/snps_junor1_defconfig           |  15 +++
>  3 files changed, 280 insertions(+)
>  create mode 100644 board/arm/junor1/fs-overlay/etc/inittab
>  create mode 100644 board/arm/junor1/linux-junor1-defconfig
>  create mode 100644 configs/snps_junor1_defconfig
> 
> diff --git a/board/arm/junor1/fs-overlay/etc/inittab b/board/arm/junor1/fs-overlay/etc/inittab
> new file mode 100644
> index 0000000..0546a20
> --- /dev/null
> +++ b/board/arm/junor1/fs-overlay/etc/inittab
[snip]
> +::sysinit:/etc/init.d/rcS
> +
> +# Put a getty on the serial port
> +console::respawn:/sbin/getty -L  console 0 vt100 # GENERIC_SERIAL
> +tty1::respawn:/sbin/getty -L  tty1 0

 So why do you have a custom inittab file? Is it just to have a getty both on
serial and on the framebuffer? One of them is enough, I don't see a good reason
to have it on two ports.

 Also, I personally prefer to have it on serial only. Having a getty on tty1 is
slightly annoying when running a graphical application on framebuffer. That
said, we do put it on tty1 for some defconfigs (e.g. RaspberryPI). So I guess it
also depends on how accessible the serial port is on that board.

 Note: same comment applies to your simulator config.

> +
> +# Stuff to do for the 3-finger salute
> +::ctrlaltdel:/sbin/reboot
> +
> +# Stuff to do before rebooting
> +::shutdown:/etc/init.d/rcK
> +::shutdown:/sbin/swapoff -a
> +::shutdown:/bin/umount -a -r
> diff --git a/board/arm/junor1/linux-junor1-defconfig b/board/arm/junor1/linux-junor1-defconfig
> new file mode 100644
> index 0000000..2a1d039
> --- /dev/null
> +++ b/board/arm/junor1/linux-junor1-defconfig
> @@ -0,0 +1,229 @@
[snip]
> +CONFIG_BLK_DEV_SD=y
> +CONFIG_ATA=y
> +CONFIG_SATA_AHCI=y
> +CONFIG_SATA_AHCI_PLATFORM=y
> +CONFIG_AHCI_XGENE=y
> +CONFIG_PATA_PLATFORM=y
> +CONFIG_PATA_OF_PLATFORM=y

 Is this useful?

> +CONFIG_NETDEVICES=y
> +CONFIG_TUN=y
> +CONFIG_VIRTIO_NET=y
> +CONFIG_NET_XGENE=y
> +CONFIG_SKY2=y
> +CONFIG_SMC91X=y
> +CONFIG_SMSC911X=y
> +CONFIG_INPUT_EVDEV=y
> +CONFIG_SERIO_AMBAKMI=y
> +CONFIG_LEGACY_PTY_COUNT=16
> +CONFIG_SERIAL_8250=y
> +CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_SERIAL_8250_MT6577=y
> +CONFIG_SERIAL_AMBA_PL011=y
> +CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
> +CONFIG_SERIAL_MSM=y
> +CONFIG_SERIAL_MSM_CONSOLE=y
> +CONFIG_SERIAL_OF_PLATFORM=y
> +CONFIG_SERIAL_XILINX_PS_UART=y
> +CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=y

 Is this useful?

> +CONFIG_VIRTIO_CONSOLE=y
> +CONFIG_SPI=y
> +CONFIG_SPI_PL022=y
> +CONFIG_PINCTRL_MSM8916=y
> +CONFIG_GPIO_PL061=y
> +CONFIG_GPIO_XGENE=y
> +CONFIG_POWER_RESET_XGENE=y
> +CONFIG_POWER_RESET_SYSCON=y
> +CONFIG_REGULATOR=y
> +CONFIG_REGULATOR_FIXED_VOLTAGE=y
> +CONFIG_FB=y
> +CONFIG_FB_ARMCLCD=y
> +CONFIG_FRAMEBUFFER_CONSOLE=y
> +CONFIG_LOGO=y
> +CONFIG_VIDEOMODE_HELPERS=y
> +CONFIG_HDMI=y
> +CONFIG_VEXPRESS_DVI_CONTROL=y

 Is this useful?

> +CONFIG_USB=y
> +CONFIG_USB_EHCI_HCD=y
> +CONFIG_USB_EHCI_HCD_PLATFORM=y
> +CONFIG_USB_OHCI_HCD=y
> +CONFIG_USB_OHCI_HCD_PLATFORM=y
> +CONFIG_USB_STORAGE=y
> +CONFIG_USB_ISP1760=y
> +CONFIG_USB_ULPI=y
> +CONFIG_USB_SUPPORT=y
> +CONFIG_USB_HID=y
> +CONFIG_USB_MASS_STORAGE=m
> +CONFIG_USB_GADGET=m
> +CONFIG_USB_LIBCOMPOSITE=y
> +CONFIG_USB_F_MASS_STORAGE=y
> +CONFIG_NOP_USB_XCEIV=y
> +CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
> +CONFIG_USB_XHCI_HCD=m
> +CONFIG_USB_XHCI_PLATFORM=m
> +CONFIG_USB_XHCI_PCI=m
> +CONFIG_USB_XHCI_HCD_DEBUGGING=y
> +CONFIG_USB_ARCH_HAS_XHCI=y
> +CONFIG_USB_ARCH_HAS_EHCI=y
> +CONFIG_USB_DWC3=m
> +CONFIG_USB_DWC3_PCI=m
> +CONFIG_USB_DUMMY_HCD=m
> +CONFIG_PPS=m
> +CONFIG_PL330_DMA=y
> +CONFIG_DMADEVICES=y
> +PTP_1588_CLOCK_IXP46X=m
> +PTP_1588_CLOCK_GIANFAR=m
> +CONFIG_PTP_1588_CLOCK=m
> +PTP_1588_CLOCK=m
> +CONFIG_MMC=y
> +CONFIG_MMC_ARMMMCI=y
> +CONFIG_MMC_SDHCI=y
> +CONFIG_MMC_SDHCI_PLTFM=y
> +CONFIG_MMC_SPI=y

 Is this useful?

> +CONFIG_RTC_CLASS=y
> +CONFIG_RTC_DRV_EFI=y
> +CONFIG_RTC_DRV_XGENE=y
> +CONFIG_VIRTIO_PCI=y
> +CONFIG_VIRTIO_BALLOON=y
> +CONFIG_VIRTIO_MMIO=y

 Is this useful?

> +CONFIG_COMMON_CLK_QCOM=y
> +CONFIG_MSM_GCC_8916=y
> +CONFIG_PHY_XGENE=y
> +CONFIG_EXT2_FS=y
> +CONFIG_EXT3_FS=y

 Ext3 is definitely not useful, ext2 probably not really.

> +CONFIG_EXT4_FS=y
> +CONFIG_FANOTIFY=y
> +CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
> +CONFIG_QUOTA=y

[snip]

 Probably more things that are not so useful. OTOH, it's not a big deal if you
want to keep them.

> diff --git a/configs/snps_junor1_defconfig b/configs/snps_junor1_defconfig
> new file mode 100644
> index 0000000..654b884
> --- /dev/null
> +++ b/configs/snps_junor1_defconfig
> @@ -0,0 +1,15 @@
> +BR2_aarch64=y

 You should fixate the kernel headers:

BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="4.2.2"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y

> +BR2_TARGET_GENERIC_HOSTNAME="junor1-buildroot"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Juno r1 by Buildroot"
> +BR2_ROOTFS_OVERLAY="board/arm/junor1/fs-overlay"

 So if you remove the custom inittab, this can go as well.

> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="http://git.linaro.org/landing-teams/working/arm/kernel.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="integration-linaro-vexpress"

 That's a branch. You should use a tag or git commit hash so the build is
reproducible.

 Also, this is based on 4.3-rc3, while we usually base our defconfigs on
released kernels. Isn't there anything more stable?

> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/arm/junor1/linux-junor1-defconfig"

 Note that you can also use the in-tree defconfig and an additional
BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES with the things you want to add or remove
from it.

> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/juno-r1"
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y

 This should be removed.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
