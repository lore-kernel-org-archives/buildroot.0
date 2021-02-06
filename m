From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sat, 6 Feb 2021 20:40:21 +0100
Subject: [Buildroot] [RFC PATCH] stm32mp1: modify gpt partitions to fix
 BSP update
In-Reply-To: <20210130204456.793098-1-geomatsi@gmail.com>
References: <20210130204456.793098-1-geomatsi@gmail.com>
Message-ID: <dc9b6b87-af7f-d6f2-d702-9e9979489249@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sergey,

On 30.01.2021 21:44, Sergey Matyukevich wrote:
> Hi all,
>
> BSP update for stm32mp1 boards does not work right out of the box. The
> first boot is ok, but the second boot fails:
>
> NOTICE:  CPU: STM32MP157CAC Rev.B
> NOTICE:  Model: STMicroelectronics STM32MP157C-DK2 Discovery Board
> NOTICE:  Board: MB1272 Var2.0 Rev.C-01
> NOTICE:  BL2: v2.4(release):2020.11-1087-g8fac193e6d-dirty
> NOTICE:  BL2: Built : 20:58:09, Jan 27 2021
> ERROR:   Checksum: 0x5023a37 (awaited: 0x5046ea4)
> ERROR:   Header check failed
> ERROR:   BL2: Failed to load image id 5 (-12)
>
> The root cause is in changes for stm32mp1 trusted defconfig in updated
> U-Boot: see U-Boot commit 76db1681da52 ("stm32mp1: use a specific SD/eMMC
> partition for U-Boot enviromnent"). Starting from that commit, U-Boot
> environment is stored at the end of the U-Boot partition. As a result,
> saving environment changes GPT partition checksum verified by ATF.
>
> IIUC at least the following two approaches can be implemented to make
> updated BSP work smoothly.
>
> The first approach is to modify U-Boot config fragment for stm32mp1 boards
> and to re-enable saving U-Boot environment on ext4. However this choice
> implies certain restriction on rootfs ext4 features since it should be
> writable by U-Boot. See the mentioned U-Boot commit message for details.
>
> Another approach is implemented by the attached patch: keep U-Boot
> environment on a dedicated GPT partition.
>
> Thoughts ? Comments ?

I've experienced the same problems on stm32mp157c-dk2 board and I was 
going to send similar patches as you with the additional partition to 
keep env there. IMO changing the default board's config would require 
keeping synchronization between every U-Boot update what would not be so 
convenient. I was looking at the way how yocto solves this problem but I 
didn't find anything useful. Anyway - I've tested your series and there 
is a kernel crash related to the usb dwc2 driver:

[??? 1.534376] dwc2 49000000.usb-otg: supply vusb_d not found, using 
dummy regulator
[??? 1.540852] dwc2 49000000.usb-otg: supply vusb_a not found, using 
dummy regulator
[??? 1.551269] dwc2 49000000.usb-otg: Configuration mismatch. dr_mode 
forced to host
[??? 1.563905] ------------[ cut here ]------------
[??? 1.567113] WARNING: CPU: 1 PID: 42 at drivers/usb/dwc2/core.c:609 
dwc2_drd_init+0x104/0x150
[??? 1.575530] Modules linked in:
[??? 1.578570] CPU: 1 PID: 42 Comm: kworker/1:2 Not tainted 5.10.10 #1
[??? 1.584834] Hardware name: STM32 (Device Tree Support)
[??? 1.589984] Workqueue: events deferred_probe_work_func
[??? 1.595129] [<c010d4b4>] (unwind_backtrace) from [<c0109f58>] 
(show_stack+0x10/0x14)
[??? 1.602871] [<c0109f58>] (show_stack) from [<c0703dec>] 
(dump_stack+0xc4/0xd8)
[??? 1.610093] [<c0703dec>] (dump_stack) from [<c0701670>] 
(__warn+0xc0/0xd8)
[??? 1.616961] [<c0701670>] (__warn) from [<c07016ec>] 
(warn_slowpath_fmt+0x64/0xc8)
[??? 1.624454] [<c07016ec>] (warn_slowpath_fmt) from [<c0500210>] 
(dwc2_drd_init+0x104/0x150)
[??? 1.632722] [<c0500210>] (dwc2_drd_init) from [<c04ffc5c>] 
(dwc2_driver_probe+0x44c/0x6d4)
[??? 1.640991] [<c04ffc5c>] (dwc2_driver_probe) from [<c045a274>] 
(platform_drv_probe+0x48/0x98)
[??? 1.649523] [<c045a274>] (platform_drv_probe) from [<c04582d0>] 
(really_probe+0x1dc/0x3b8)
[??? 1.657789] [<c04582d0>] (really_probe) from [<c0458618>] 
(driver_probe_device+0x5c/0xb4)
[??? 1.665969] [<c0458618>] (driver_probe_device) from [<c0456748>] 
(bus_for_each_drv+0x84/0xd0)
[??? 1.674501] [<c0456748>] (bus_for_each_drv) from [<c0458080>] 
(__device_attach+0xf0/0x15c)
[??? 1.682768] [<c0458080>] (__device_attach) from [<c0457424>] 
(bus_probe_device+0x84/0x8c)
[??? 1.690949] [<c0457424>] (bus_probe_device) from [<c04578b8>] 
(deferred_probe_work_func+0x64/0x90)
[??? 1.699917] [<c04578b8>] (deferred_probe_work_func) from [<c0131474>] 
(process_one_work+0x1c8/0x424)
[??? 1.709056] [<c0131474>] (process_one_work) from [<c0131918>] 
(worker_thread+0x248/0x520)
[??? 1.717235] [<c0131918>] (worker_thread) from [<c01370b8>] 
(kthread+0x130/0x170)
[??? 1.724628] [<c01370b8>] (kthread) from [<c0100148>] 
(ret_from_fork+0x14/0x2c)
[??? 1.731841] Exception stack(0xc162dfb0 to 0xc162dff8)
[??? 1.736884] dfa0:???????????????????????????????????? 00000000 
00000000 00000000 00000000
[??? 1.745075] dfc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[??? 1.753254] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[??? 1.759856] ---[ end trace cb00fc5721509727 ]---
[??? 1.765261] dwc2 49000000.usb-otg: DWC OTG Controller
[??? 1.769716] dwc2 49000000.usb-otg: new USB bus registered, assigned 
bus number 1
[??? 1.777060] dwc2 49000000.usb-otg: irq 52, io mem 0x49000000

so IMO we should wait for the next release that will fix that issues.

There are even more errors when init is being loaded:

[??? 2.431029] hub 2-1:1.0: USB hub found
[??? 2.431165] Freeing unused kernel memory: 1024K
[??? 2.438040] hub 2-1:1.0: 4 ports detected
[??? 2.442215] Run /sbin/init as init process
mount: you must be root
mount: you must be root
mkdir: can't create directory '/dev/pts': Permission denied
mkdir: can't create directory '/dev/shm': Permission denied
mount: you must be root
hostname: sethostname: Operation not permitted
Starting syslogd: OK
Starting klogd: OK
Running sysctl: OK
Saving random seed: SKIP (read-only file system detected)
mkdir: can't create directory '/run/network': Read-only file system
Starting network: ip: RTNETLINK answers: Operation not permitted
ip: SIOCSIFFLAGS: Operation not permitted
ifup: can't open '/var/run/ifstate.new': Read-only file system
FAIL
can't open /dev/console: Permission denied
can't open /dev/console: Permission denied
can't open /dev/console: Permission denied
can't open /dev/console: Permission denied
can't open /dev/console: Permission denied
can't open /dev/console: Permission denied

Anyway you can also bump U-Boot version to the 2021.01 as it's the 
latest one.


Best
Bartek


> Regards,
> Sergey
>
> ---
>   .../common/stm32mp157/genimage.cfg.template         |  4 ++++
>   .../overlay/boot/extlinux/extlinux.conf             |  2 +-
>   .../uboot/0001-uboot-stm32mp1-uboot-env.patch       | 13 +++++++++++++
>   .../overlay/boot/extlinux/extlinux.conf             |  2 +-
>   .../uboot/0001-uboot-stm32mp1-uboot-env.patch       | 13 +++++++++++++
>   configs/stm32mp157a_dk1_defconfig                   |  9 +++++----
>   configs/stm32mp157c_dk2_defconfig                   |  9 +++++----
>   7 files changed, 42 insertions(+), 10 deletions(-)
>   create mode 100644 board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/0001-uboot-stm32mp1-uboot-env.patch
>   create mode 100644 board/stmicroelectronics/stm32mp157c-dk2/patches/uboot/0001-uboot-stm32mp1-uboot-env.patch
>
> diff --git a/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template b/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
> index f341c19f2f..12f79efa90 100644
> --- a/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
> +++ b/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
> @@ -15,6 +15,10 @@ image sdcard.img {
>   		image = "u-boot.stm32"
>   	}
>   
> +	partition env {
> +		size = 16K
> +	}
> +
>   	partition rootfs {
>   		image = "rootfs.ext4"
>   		bootable = "yes"
> diff --git a/board/stmicroelectronics/stm32mp157a-dk1/overlay/boot/extlinux/extlinux.conf b/board/stmicroelectronics/stm32mp157a-dk1/overlay/boot/extlinux/extlinux.conf
> index 437e80fdeb..62cc58d7e2 100644
> --- a/board/stmicroelectronics/stm32mp157a-dk1/overlay/boot/extlinux/extlinux.conf
> +++ b/board/stmicroelectronics/stm32mp157a-dk1/overlay/boot/extlinux/extlinux.conf
> @@ -1,4 +1,4 @@
>   label stm32mp157a-dk1-buildroot
>     kernel /boot/zImage
>     devicetree /boot/stm32mp157a-dk1.dtb
> -  append root=/dev/mmcblk0p4 rootwait
> +  append root=/dev/mmcblk0p5 rootwait
> diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/0001-uboot-stm32mp1-uboot-env.patch b/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/0001-uboot-stm32mp1-uboot-env.patch
> new file mode 100644
> index 0000000000..9582974caf
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/0001-uboot-stm32mp1-uboot-env.patch
> @@ -0,0 +1,13 @@
> +diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> +index 6787619290..85c0e1d0a3 100644
> +--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> ++++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> +@@ -16,7 +16,7 @@
> + 	config {
> + 		u-boot,boot-led = "heartbeat";
> + 		u-boot,error-led = "error";
> +-		u-boot,mmc-env-partition = "ssbl";
> ++		u-boot,mmc-env-partition = "env";
> + 		st,adc_usb_pd = <&adc1 18>, <&adc1 19>;
> + 		st,fastboot-gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
> + 		st,stm32prog-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
> diff --git a/board/stmicroelectronics/stm32mp157c-dk2/overlay/boot/extlinux/extlinux.conf b/board/stmicroelectronics/stm32mp157c-dk2/overlay/boot/extlinux/extlinux.conf
> index 5b7f56ee77..e1b3ca9f61 100644
> --- a/board/stmicroelectronics/stm32mp157c-dk2/overlay/boot/extlinux/extlinux.conf
> +++ b/board/stmicroelectronics/stm32mp157c-dk2/overlay/boot/extlinux/extlinux.conf
> @@ -1,4 +1,4 @@
>   label stm32mp157c-dk2-buildroot
>     kernel /boot/zImage
>     devicetree /boot/stm32mp157c-dk2.dtb
> -  append root=/dev/mmcblk0p4 rootwait
> +  append root=/dev/mmcblk0p5 rootwait
> diff --git a/board/stmicroelectronics/stm32mp157c-dk2/patches/uboot/0001-uboot-stm32mp1-uboot-env.patch b/board/stmicroelectronics/stm32mp157c-dk2/patches/uboot/0001-uboot-stm32mp1-uboot-env.patch
> new file mode 100644
> index 0000000000..9582974caf
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32mp157c-dk2/patches/uboot/0001-uboot-stm32mp1-uboot-env.patch
> @@ -0,0 +1,13 @@
> +diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> +index 6787619290..85c0e1d0a3 100644
> +--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> ++++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> +@@ -16,7 +16,7 @@
> + 	config {
> + 		u-boot,boot-led = "heartbeat";
> + 		u-boot,error-led = "error";
> +-		u-boot,mmc-env-partition = "ssbl";
> ++		u-boot,mmc-env-partition = "env";
> + 		st,adc_usb_pd = <&adc1 18>, <&adc1 19>;
> + 		st,fastboot-gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
> + 		st,stm32prog-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
> diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
> index 6883aaba7b..4f34456e9d 100644
> --- a/configs/stm32mp157a_dk1_defconfig
> +++ b/configs/stm32mp157a_dk1_defconfig
> @@ -1,11 +1,12 @@
>   BR2_arm=y
>   BR2_cortex_a7=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>   BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
> +BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32mp157a-dk1/patches/"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.10"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157a-dk1/linux.config"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> @@ -17,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>   # BR2_TARGET_ROOTFS_TAR is not set
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.2"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.4"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-dk1.dtb"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32"
> @@ -25,7 +26,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
>   BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32mp157a-dk1/uboot-fragment.config"
>   # BR2_TARGET_UBOOT_FORMAT_BIN is not set
> diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
> index 50d875749b..1f3028dcd1 100644
> --- a/configs/stm32mp157c_dk2_defconfig
> +++ b/configs/stm32mp157c_dk2_defconfig
> @@ -1,11 +1,12 @@
>   BR2_arm=y
>   BR2_cortex_a7=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>   BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
> +BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32mp157c-dk2/patches/"
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.10"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux.config"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> @@ -17,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>   # BR2_TARGET_ROOTFS_TAR is not set
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.2"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.4"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157c-dk2.dtb"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32"
> @@ -25,7 +26,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
>   BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32mp157c-dk2/uboot-fragment.config"
>   # BR2_TARGET_UBOOT_FORMAT_BIN is not set
