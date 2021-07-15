From: Yauheni Saldatsenka <eugentoo@gmail.com>
Date: Thu, 15 Jul 2021 09:42:06 +0300
Subject: [Buildroot] [PATCH 1/1] board/stm32f469-disco: update board
 configuration
In-Reply-To: <CADj5-AzDN-d7wNDMWTJWPk8ZRd70c_9HQXyE0aL6qYrSe8YDcA@mail.gmail.com>
References: <20210709173644.21392-1-eugentoo@gmail.com>
 <AM0PR10MB28172210D91744F9B4566880E3159@AM0PR10MB2817.EURPRD10.PROD.OUTLOOK.COM>
 <8320b3d7-6ce4-d562-efa3-c4d887b78bfb@foss.st.com>
 <CADj5-AzDN-d7wNDMWTJWPk8ZRd70c_9HQXyE0aL6qYrSe8YDcA@mail.gmail.com>
Message-ID: <CADj5-Aykdt1vTt6pOsKtxZALFJMxyfc5CgBB_D2Pym0pxkAWFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi!
A friendly reminder.


Best regards,
Yauheni Saldatsenka

??, 12 ???. 2021 ?. ? 21:56, Yauheni Saldatsenka <eugentoo@gmail.com>:

> Greetings!
>
> I share your thoughts about u-boot as a generic starting point for
> everyone who tries to bootstrap linux on such type of no-mmu.
> On the other hand, spending the whole 2 MB flash partition is a little bit
> of blasphemy for a low-memory footprint device ;)
>
> I can propose the following scenario.
> We can keep both configurations in tree:
>
>    1. U-boot config in flash, kernel and rootfs in external memory device
>    like QSPI or MMC
>    2. Keep afboot, kernel and rootfs in flash memory. I've already
>    achieved a setup which occupies of flash ~1.2 MB
>
> The second one requires some actions with the current patch from my side.
>
> Best regards,
> Yauheni Saldatsenka
>
>
>
>
>
> ??, 12 ???. 2021 ?. ? 12:43, Christophe Priouzeau <
> christophe.priouzeau at foss.st.com>:
>
>> Hi,
>> With the increase size of the kernel and support of stm32f4
>> board on U-Boot, I prefer to use U-Boot as first boot stage instead of
>> afboot.
>> The usage of U-Boot, permit to be more generic and permit to have more
>> functionnality (like support of network, boot on sdcard, use external
>> storage, ...).
>> To goal of this boards configuration are to provide a generic way to
>> boot a linux on stm32f469 board.
>> The usage of XIP kernel can be interesting but given the size of the
>> kernel and the potential increase size due to addition of driver, the
>> xip kernel usage are a specific configuration which are no interest to
>> be on generic bsp configuration but on specific configuration.
>>
>> Regards
>> Christophe
>> > ------------------------------------------------------------------------
>> > *From:* Ygenks <eugentoo@gmail.com>
>> > *Sent:* Friday, July 9, 2021 7:36 PM
>> > *To:*
>> > *Cc:* Christophe PRIOUZEAU <christophe.priouzeau@st.com>; Ygenks
>> > <eugentoo@gmail.com>
>> > *Subject:* [PATCH 1/1] board/stm32f469-disco: update board configuration
>> > From: Ygenks <eugentoo@gmail.com>
>> >
>> > Update STM32F469-disco configuration files to operate with new kernel.
>> >
>> > Result of make tinyconfig was taken as a starting point to fit kernel
>> > into flash memory.
>> > Current setup fits in 2MB on-chip flash memory with rootfs
>> > offloaded to MMC card.
>> >
>> > Kernel features enabled:
>> >      - MMC card driver
>> >      - DRM MIPI-DSI drivers
>> >      - Random number generator
>> > Fixes:
>> >      - Move kernel to new flash bank due to growth of dtb size
>> >      - Fix kernel start address in bootloader
>> >      - Remove outdated path which doesn't affect normal operation mode
>> >
>> > Signed-off-by: Yauheni Saldatsenka <eugentoo@gmail.com>
>> > Signed-off-by: Ygenks <eugentoo@gmail.com>
>> > ---
>> >   .../common/stm32f4xx/genimage.cfg.template    |  10 +
>> >   .../common/stm32f4xx/stm32-post-build.sh      |   7 +
>> >   .../stm32f469-disco/flash.sh                  |   4 +-
>> >   .../stm32f469-disco/linux/defconfig           | 133 ++++++++++
>> >   .../stm32f469-disco/linux/stm32f469-disco.dts | 240 ++++++++++++++++++
>> >   .../0002-kernel-start-address.patch           |  21 ++
>> >   .../patches/afboot-stm32/0003-no-mpu.patch    |  22 ++
>> >   configs/stm32f469_disco_defconfig             |  31 +--
>> >   8 files changed, 452 insertions(+), 16 deletions(-)
>> >   create mode 100644
>> > board/stmicroelectronics/common/stm32f4xx/genimage.cfg.template
>> >   create mode 100644
>> > board/stmicroelectronics/stm32f469-disco/linux/defconfig
>> >   create mode 100644
>> > board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.dts
>> >   create mode 100644
>> >
>> board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0002-kernel-start-address.patch
>> >   create mode 100644
>> >
>> board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0003-no-mpu.patch
>> >
>> > diff --git
>> > a/board/stmicroelectronics/common/stm32f4xx/genimage.cfg.template
>> > b/board/stmicroelectronics/common/stm32f4xx/genimage.cfg.template
>> > new file mode 100644
>> > index 0000000000..771b9dc8a1
>> > --- /dev/null
>> > +++ b/board/stmicroelectronics/common/stm32f4xx/genimage.cfg.template
>> > @@ -0,0 +1,10 @@
>> > +image sdcard.img {
>> > +       hdimage {
>> > +               gpt = true
>> > +       }
>> > +
>> > +       partition rootfs {
>> > +               image = "rootfs.ext2"
>> > +               bootable = "yes"
>> > +       }
>> > +}
>> > diff --git
>> > a/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
>> > b/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
>> > index e324afe59a..6a31f7d872 100755
>> > --- a/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
>> > +++ b/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
>> > @@ -6,3 +6,10 @@ sed -i '/^devpts/d' ${TARGET_DIR}/etc/fstab
>> >   # Kernel is built without network support
>> >   rm -f ${TARGET_DIR}/etc/init.d/S40network
>> >   rm -rf ${TARGET_DIR}/etc/network/
>> > +
>> > +GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
>> > +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
>> > +
>> > +support/scripts/genimage.sh -c ${GENIMAGE_CFG}
>> > +
>> > +rm -f ${GENIMAGE_CFG}
>> > diff --git a/board/stmicroelectronics/stm32f469-disco/flash.sh
>> > b/board/stmicroelectronics/stm32f469-disco/flash.sh
>> > index 984d2b2599..1f223c2ad7 100755
>> > --- a/board/stmicroelectronics/stm32f469-disco/flash.sh
>> > +++ b/board/stmicroelectronics/stm32f469-disco/flash.sh
>> > @@ -13,6 +13,8 @@ ${OUTPUT_DIR}/host/bin/openocd -f
>> > board/stm32f469discovery.cfg \
>> >     -c "reset init" \
>> >     -c "flash probe 0" \
>> >     -c "flash info 0" \
>> > -  -c "flash write_image erase ${OUTPUT_DIR}/images/u-boot.bin
>> 0x08000000" \
>> > +  -c "flash write_image erase
>> ${OUTPUT_DIR}/images/stm32f469i-disco.bin
>> > 0x08000000" \
>> > +  -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f469-disco.dtb
>> > 0x08004000" \
>> > +  -c "flash write_image erase ${OUTPUT_DIR}/images/xipImage
>> 0x08010000" \
>> >     -c "reset run" \
>> >     -c "shutdown"
>> > diff --git a/board/stmicroelectronics/stm32f469-disco/linux/defconfig
>> > b/board/stmicroelectronics/stm32f469-disco/linux/defconfig
>> > new file mode 100644
>> > index 0000000000..52441d12d0
>> > --- /dev/null
>> > +++ b/board/stmicroelectronics/stm32f469-disco/linux/defconfig
>> > @@ -0,0 +1,133 @@
>> > +# CONFIG_LOCALVERSION_AUTO is not set
>> > +CONFIG_KERNEL_XZ=y
>> > +CONFIG_NO_HZ_IDLE=y
>> > +CONFIG_HIGH_RES_TIMERS=y
>> > +CONFIG_PREEMPT=y
>> > +CONFIG_LOG_BUF_SHIFT=12
>> > +CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=10
>> > +CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>> > +# CONFIG_MULTIUSER is not set
>> > +# CONFIG_SYSFS_SYSCALL is not set
>> > +# CONFIG_FHANDLE is not set
>> > +# CONFIG_POSIX_TIMERS is not set
>> > +# CONFIG_BUG is not set
>> > +# CONFIG_BASE_FULL is not set
>> > +# CONFIG_FUTEX is not set
>> > +# CONFIG_EPOLL is not set
>> > +# CONFIG_SIGNALFD is not set
>> > +# CONFIG_TIMERFD is not set
>> > +# CONFIG_EVENTFD is not set
>> > +# CONFIG_AIO is not set
>> > +# CONFIG_IO_URING is not set
>> > +# CONFIG_ADVISE_SYSCALLS is not set
>> > +# CONFIG_MEMBARRIER is not set
>> > +# CONFIG_KALLSYMS is not set
>> > +# CONFIG_RSEQ is not set
>> > +CONFIG_EMBEDDED=y
>> > +# CONFIG_VM_EVENT_COUNTERS is not set
>> > +# CONFIG_COMPAT_BRK is not set
>> > +CONFIG_SLOB=y
>> > +# CONFIG_SLAB_MERGE_DEFAULT is not set
>> > +# CONFIG_MMU is not set
>> > +CONFIG_ARCH_STM32=y
>> > +# CONFIG_MACH_STM32F429 is not set
>> > +# CONFIG_MACH_STM32F746 is not set
>> > +# CONFIG_MACH_STM32F769 is not set
>> > +# CONFIG_MACH_STM32H743 is not set
>> > +CONFIG_CPU_V7M_NUM_IRQ=240
>> > +# CONFIG_ARM_DMA_MEM_BUFFERABLE is not set
>> > +CONFIG_SET_MEM_PARAM=y
>> > +CONFIG_DRAM_BASE=0xc0000000
>> > +CONFIG_DRAM_SIZE=0x01000000
>> > +CONFIG_HZ_1000=y
>> > +# CONFIG_ATAGS is not set
>> > +CONFIG_XIP_KERNEL=y
>> > +CONFIG_XIP_PHYS_ADDR=0x08010000
>> > +CONFIG_XIP_DEFLATED_DATA=y
>> > +# CONFIG_SUSPEND is not set
>> > +# CONFIG_STACKPROTECTOR is not set
>> > +# CONFIG_COMPAT_32BIT_TIME is not set
>> > +# CONFIG_GCC_PLUGINS is not set
>> > +# CONFIG_BLK_DEV_BSG is not set
>> > +CONFIG_BINFMT_FLAT=y
>> > +CONFIG_BINFMT_SHARED_FLAT=y
>> > +# CONFIG_COREDUMP is not set
>> > +CONFIG_DEVTMPFS=y
>> > +CONFIG_DEVTMPFS_MOUNT=y
>> > +# CONFIG_STANDALONE is not set
>> > +# CONFIG_PREVENT_FIRMWARE_BUILD is not set
>> > +# CONFIG_FW_LOADER is not set
>> > +# CONFIG_ALLOW_DEV_COREDUMP is not set
>> > +# CONFIG_BLK_DEV is not set
>> > +CONFIG_EEPROM_93CX6=y
>> > +# CONFIG_CONSOLE_TRANSLATIONS is not set
>> > +# CONFIG_UNIX98_PTYS is not set
>> > +# CONFIG_LEGACY_PTYS is not set
>> > +# CONFIG_LDISC_AUTOLOAD is not set
>> > +CONFIG_SERIAL_STM32=y
>> > +CONFIG_SERIAL_STM32_CONSOLE=y
>> > +CONFIG_SERIAL_NONSTANDARD=y
>> > +# CONFIG_DEVMEM is not set
>> > +CONFIG_I2C_CHARDEV=y
>> > +CONFIG_I2C_STM32F4=y
>> > +CONFIG_I2C_STM32F7=y
>> > +CONFIG_GPIO_STMPE=y
>> > +# CONFIG_HWMON is not set
>> > +CONFIG_WATCHDOG=y
>> > +CONFIG_MFD_STMPE=y
>> > +CONFIG_REGULATOR=y
>> > +CONFIG_REGULATOR_FIXED_VOLTAGE=y
>> > +CONFIG_DRM=y
>> > +CONFIG_DRM_STM=y
>> > +CONFIG_DRM_STM_DSI=y
>> > +CONFIG_DRM_PANEL_SIMPLE=y
>> > +CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
>> > +CONFIG_LCD_CLASS_DEVICE=y
>> > +CONFIG_BACKLIGHT_CLASS_DEVICE=y
>> > +CONFIG_FRAMEBUFFER_CONSOLE=y
>> > +# CONFIG_USB_SUPPORT is not set
>> > +CONFIG_MMC=y
>> > +# CONFIG_PWRSEQ_EMMC is not set
>> > +CONFIG_MMC_ARMMMCI=y
>> > +CONFIG_NEW_LEDS=y
>> > +CONFIG_LEDS_CLASS=y
>> > +CONFIG_LEDS_GPIO=y
>> > +CONFIG_LEDS_TRIGGERS=y
>> > +CONFIG_LEDS_TRIGGER_HEARTBEAT=y
>> > +CONFIG_RTC_CLASS=y
>> > +CONFIG_RTC_DRV_STM32=y
>> > +CONFIG_DMADEVICES=y
>> > +CONFIG_STM32_DMA=y
>> > +CONFIG_STM32_DMAMUX=y
>> > +CONFIG_STM32_MDMA=y
>> > +# CONFIG_VIRTIO_MENU is not set
>> > +# CONFIG_VHOST_MENU is not set
>> > +CONFIG_IIO=y
>> > +CONFIG_STM32_ADC_CORE=y
>> > +CONFIG_STM32_ADC=y
>> > +CONFIG_EXT2_FS=y
>> > +# CONFIG_FILE_LOCKING is not set
>> > +# CONFIG_DNOTIFY is not set
>> > +# CONFIG_INOTIFY_USER is not set
>> > +# CONFIG_PROC_SYSCTL is not set
>> > +CONFIG_CONFIGFS_FS=y
>> > +# CONFIG_MISC_FILESYSTEMS is not set
>> > +CONFIG_NLS=y
>> > +CONFIG_CRYPTO=y
>> > +CONFIG_CRYPTO_CRC32C=y
>> > +CONFIG_CRC16=y
>> > +CONFIG_CRC_ITU_T=y
>> > +CONFIG_CRC7=y
>> > +CONFIG_PRINTK_TIME=y
>> > +CONFIG_CONSOLE_LOGLEVEL_DEFAULT=15
>> > +CONFIG_CONSOLE_LOGLEVEL_QUIET=15
>> > +CONFIG_MESSAGE_LOGLEVEL_DEFAULT=7
>> > +# CONFIG_SYMBOLIC_ERRNAME is not set
>> > +CONFIG_DEBUG_INFO=y
>> > +# CONFIG_ENABLE_MUST_CHECK is not set
>> > +# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
>> > +CONFIG_DEBUG_FS=y
>> > +# CONFIG_DEBUG_MISC is not set
>> > +# CONFIG_SCHED_DEBUG is not set
>> > +# CONFIG_RCU_TRACE is not set
>> > +# CONFIG_RUNTIME_TESTING_MENU is not set
>> > diff --git
>> > a/board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.dts
>> > b/board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.dts
>> > new file mode 100644
>> > index 0000000000..4c32d18d0e
>> > --- /dev/null
>> > +++ b/board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.dts
>> > @@ -0,0 +1,240 @@
>> > +/*
>> > + * Copyright 2016 - Lee Jones <lee.jones@linaro.org>
>> > + *
>> > + * This file is dual-licensed: you can use it either under the terms
>> > + * of the GPL or the X11 license, at your option. Note that this dual
>> > + * licensing only applies to this file, and not this project as a
>> > + * whole.
>> > + *
>> > + *  a) This file is free software; you can redistribute it and/or
>> > + *     modify it under the terms of the GNU General Public License as
>> > + *     published by the Free Software Foundation; either version 2 of
>> the
>> > + *     License, or (at your option) any later version.
>> > + *
>> > + *     This file is distributed in the hope that it will be useful,
>> > + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
>> > + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> > + *     GNU General Public License for more details.
>> > + *
>> > + *     You should have received a copy of the GNU General Public
>> > + *     License along with this file; if not, write to the Free
>> > + *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
>> > + *     MA 02110-1301 USA
>> > + *
>> > + * Or, alternatively,
>> > + *
>> > + *  b) Permission is hereby granted, free of charge, to any person
>> > + *     obtaining a copy of this software and associated documentation
>> > + *     files (the "Software"), to deal in the Software without
>> > + *     restriction, including without limitation the rights to use,
>> > + *     copy, modify, merge, publish, distribute, sublicense, and/or
>> > + *     sell copies of the Software, and to permit persons to whom the
>> > + *     Software is furnished to do so, subject to the following
>> > + *     conditions:
>> > + *
>> > + *     The above copyright notice and this permission notice shall be
>> > + *     included in all copies or substantial portions of the Software.
>> > + *
>> > + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> > + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>> > + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>> > + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>> > + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>> > + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>> > + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> > + *     OTHER DEALINGS IN THE SOFTWARE.
>> > + */
>> > +
>> > +/dts-v1/;
>> > +#include "stm32f469.dtsi"
>> > +#include "stm32f469-pinctrl.dtsi"
>> > +#include <dt-bindings/gpio/gpio.h>
>> > +#include <dt-bindings/input/input.h>
>> > +
>> > +/ {
>> > +       model = "STMicroelectronics STM32F469i-DISCO board";
>> > +       compatible = "st,stm32f469i-disco", "st,stm32f469";
>> > +
>> > +       chosen {
>> > +               bootargs = "root=/dev/mmcblk0 rw fbcon=map:0";
>> > +               stdout-path = "serial0:115200n8";
>> > +       };
>> > +
>> > +       memory at c0000000 {
>> > +               device_type = "memory";
>> > +               reg = <0xc0000000 0x1000000>;
>> > +       };
>> > +
>> > +       aliases {
>> > +               serial0 = &usart3;
>> > +       };
>> > +
>> > +       mmc_vcard: mmc_vcard {
>> > +               compatible = "regulator-fixed";
>> > +               regulator-name = "mmc_vcard";
>> > +               regulator-min-microvolt = <3300000>;
>> > +               regulator-max-microvolt = <3300000>;
>> > +       };
>> > +
>> > +       vdd_dsi: vdd-dsi {
>> > +               compatible = "regulator-fixed";
>> > +               regulator-name = "vdd_dsi";
>> > +               regulator-min-microvolt = <3300000>;
>> > +               regulator-max-microvolt = <3300000>;
>> > +       };
>> > +
>> > +       soc {
>> > +               dma-ranges = <0xc0000000 0xc0000000 0x10000000>;
>> > +       };
>> > +
>> > +       leds {
>> > +               compatible = "gpio-leds";
>> > +               led-green {
>> > +                       gpios = <&gpiog 6 GPIO_ACTIVE_LOW>;
>> > +                       linux,default-trigger = "heartbeat";
>> > +               };
>> > +               led-orange {
>> > +                       gpios = <&gpiod 4 GPIO_ACTIVE_LOW>;
>> > +               };
>> > +               led-red {
>> > +                       gpios = <&gpiod 5 GPIO_ACTIVE_LOW>;
>> > +               };
>> > +               led-blue {
>> > +                       gpios = <&gpiok 3 GPIO_ACTIVE_LOW>;
>> > +               };
>> > +       };
>> > +
>> > +       gpio_keys {
>> > +               compatible = "gpio-keys";
>> > +               #address-cells = <1>;
>> > +               #size-cells = <0>;
>> > +               autorepeat;
>> > +               button at 0 {
>> > +                       label = "User";
>> > +                       linux,code = <KEY_WAKEUP>;
>> > +                       gpios = <&gpioa 0 GPIO_ACTIVE_HIGH>;
>> > +               };
>> > +       };
>> > +
>> > +       /* This turns on vbus for otg for host mode (dwc2) */
>> > +       vcc5v_otg: vcc5v-otg-regulator {
>> > +               compatible = "regulator-fixed";
>> > +               enable-active-high;
>> > +               gpio = <&gpiob 2 GPIO_ACTIVE_HIGH>;
>> > +               regulator-name = "vcc5_host1";
>> > +               regulator-always-on;
>> > +       };
>> > +};
>> > +
>> > +&rcc {
>> > +       compatible = "st,stm32f469-rcc", "st,stm32f42xx-rcc",
>> > "st,stm32-rcc";
>> > +};
>> > +
>> > +&clk_hse {
>> > +       clock-frequency = <8000000>;
>> > +};
>> > +
>> > +&dsi {
>> > +       #address-cells = <1>;
>> > +       #size-cells = <0>;
>> > +       status = "okay";
>> > +
>> > +       ports {
>> > +               #address-cells = <1>;
>> > +               #size-cells = <0>;
>> > +
>> > +               port at 0 {
>> > +                       reg = <0>;
>> > +                       dsi_in: endpoint {
>> > +                               remote-endpoint = <&ltdc_out_dsi>;
>> > +                       };
>> > +               };
>> > +
>> > +               port at 1 {
>> > +                       reg = <1>;
>> > +                       dsi_out: endpoint {
>> > +                               remote-endpoint = <&dsi_panel_in>;
>> > +                       };
>> > +               };
>> > +       };
>> > +
>> > +       panel-dsi at 0 {
>> > +               compatible = "orisetech,otm8009a";
>> > +               reg = <0>; /* dsi virtual channel (0..3) */
>> > +               reset-gpios = <&gpioh 7 GPIO_ACTIVE_LOW>;
>> > +               power-supply = <&vdd_dsi>;
>> > +               status = "okay";
>> > +
>> > +               port {
>> > +                       dsi_panel_in: endpoint {
>> > +                               remote-endpoint = <&dsi_out>;
>> > +                       };
>> > +               };
>> > +       };
>> > +};
>> > +
>> > +&ltdc {
>> > +       status = "okay";
>> > +
>> > +       port {
>> > +               ltdc_out_dsi: endpoint at 0 {
>> > +                       remote-endpoint = <&dsi_in>;
>> > +               };
>> > +       };
>> > +};
>> > +
>> > +&rtc {
>> > +       status = "okay";
>> > +};
>> > +
>> > +&timers1 {
>> > +       status = "okay";
>> > +
>> > +       pwm {
>> > +               pinctrl-0 = <&pwm1_pins>;
>> > +               pinctrl-names = "default";
>> > +               status = "okay";
>> > +       };
>> > +
>> > +       timer at 0 {
>> > +               status = "okay";
>> > +       };
>> > +};
>> > +
>> > +&timers3 {
>> > +       status = "okay";
>> > +
>> > +       pwm {
>> > +               pinctrl-0 = <&pwm3_pins>;
>> > +               pinctrl-names = "default";
>> > +               status = "okay";
>> > +       };
>> > +
>> > +       timer at 2 {
>> > +               status = "okay";
>> > +       };
>> > +};
>> > +
>> > +&sdio {
>> > +       status = "okay";
>> > +       vmmc-supply = <&mmc_vcard>;
>> > +       cd-gpios = <&gpiog 2 GPIO_ACTIVE_LOW>;
>> > +       broken-cd;
>> > +       pinctrl-names = "default", "opendrain";
>> > +       pinctrl-0 = <&sdio_pins>;
>> > +       pinctrl-1 = <&sdio_pins_od>;
>> > +       bus-width = <4>;
>> > +};
>> > +
>> > +&usart3 {
>> > +       pinctrl-0 = <&usart3_pins_a>;
>> > +       pinctrl-names = "default";
>> > +       status = "okay";
>> > +};
>> > +
>> > +&usbotg_fs {
>> > +       dr_mode = "host";
>> > +       pinctrl-0 = <&usbotg_fs_pins_a>;
>> > +       pinctrl-names = "default";
>> > +       status = "okay";
>> > +};
>> > diff --git
>> >
>> a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0002-kernel-start-address.patch
>>
>> >
>> b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0002-kernel-start-address.patch
>> > new file mode 100644
>> > index 0000000000..614effa85b
>> > --- /dev/null
>> > +++
>> >
>> b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0002-kernel-start-address.patch
>> > @@ -0,0 +1,21 @@
>> > +diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c
>> > +index 2da1f4b65f..96e4dff65e 100644
>> > +--- a/stm32f469i-disco.c
>> > ++++ b/stm32f469i-disco.c
>> > +@@ -6,6 +6,7 @@
>> > + #include "gpio.h"
>> > + #include "mpu.h"
>> > +
>> > ++#define KERNEL_ADDR     0x08010000
>> > + #define CONFIG_HSE_HZ 8000000
>> > + #define CONFIG_PLL_M  8
>> > + #define CONFIG_PLL_N  360
>> > +@@ -85,7 +86,7 @@ static void fmc_wait_busy(void)
>> > +
>> > + void start_kernel(void)
>> > + {
>> > +-      void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) =
>> > (void (*)(uint32_t, uint32_t, uint32_t))(0x08008000 | 1);
>> > ++      void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) =
>> > (void (*)(uint32_t, uint32_t, uint32_t))(KERNEL_ADDR | 1);
>> > +
>> > +        kernel(0, ~0UL, 0x08004000);
>> > + }
>> > diff --git
>> >
>> a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0003-no-mpu.patch
>>
>> >
>> b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0003-no-mpu.patch
>> > new file mode 100644
>> > index 0000000000..bc66d2d0ef
>> > --- /dev/null
>> > +++
>> >
>> b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0003-no-mpu.patch
>> > @@ -0,0 +1,22 @@
>> > +diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c
>> > +index d4d0909831..03f823f288 100644
>> > +--- a/stm32f469i-disco.c
>> > ++++ b/stm32f469i-disco.c
>> > +@@ -127,7 +127,7 @@ int main(void)
>> > +
>> > +        int i;
>> > +
>> > +-      mpu_config(0x0);
>> > ++      mpu_config(0xc0000000);
>> > +
>> > +        if (*FLASH_CR & FLASH_CR_LOCK) {
>> > +                *FLASH_KEYR = 0x45670123;
>> > +@@ -229,7 +229,7 @@ int main(void)
>> > +        usart_setup(usart_base, 45000000);
>> > +        usart_putch(usart_base, '.');
>> > +
>> > +-      *SYSCFG_MEMRMP = 0x4;
>> > ++      /* *SYSCFG_MEMRMP = 0x4; */
>> > +
>> > +        start_kernel();
>> > +
>> > diff --git a/configs/stm32f469_disco_defconfig
>> > b/configs/stm32f469_disco_defconfig
>> > index e538a664e2..b8fba2524c 100644
>> > --- a/configs/stm32f469_disco_defconfig
>> > +++ b/configs/stm32f469_disco_defconfig
>> > @@ -1,25 +1,26 @@
>> >   BR2_arm=y
>> >   BR2_cortex_m4=y
>> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
>> >
>> -BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
>>
>> > board/stmicroelectronics/stm32f469-disco/post-build.sh"
>> > -BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>> > -BR2_ROOTFS_POST_SCRIPT_ARGS="-c
>> > board/stmicroelectronics/stm32f469-disco/genimage.cfg"
>> > +BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
>> > +BR2_KERNEL_HEADERS_5_13=y
>> > +# BR2_UCLIBC_INSTALL_UTILS is not set
>> > +BR2_GCC_VERSION_11_X=y
>> > +BR2_GCC_ENABLE_LTO=y
>> >
>> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
>> >   BR2_LINUX_KERNEL=y
>> > -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.11"
>> > -BR2_LINUX_KERNEL_DEFCONFIG="stm32"
>> >
>> -BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config
>>
>> > board/stmicroelectronics/stm32f469-disco/linux.fragment"
>> > +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>> >
>> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux/defconfig"
>> >   BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
>> > -BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
>> > +BR2_LINUX_KERNEL_XZ=y
>> > +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
>> >   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>> >   BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
>> >
>> +BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.dts"
>> >   BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
>> > +BR2_PACKAGE_FB_TEST_APP=y
>> > +BR2_PACKAGE_FBV=y
>> >   BR2_TARGET_ROOTFS_EXT2=y
>> > -BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
>> > +BR2_TARGET_ROOTFS_EXT2_2r0=y
>> > +BR2_TARGET_ROOTFS_EXT2_SIZE="100M"
>> >   # BR2_TARGET_ROOTFS_TAR is not set
>> > -BR2_TARGET_UBOOT=y
>> > -BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
>> > -BR2_PACKAGE_HOST_DOSFSTOOLS=y
>> > -BR2_PACKAGE_HOST_GENIMAGE=y
>> > -BR2_PACKAGE_HOST_MTOOLS=y
>> > +BR2_TARGET_AFBOOT_STM32=y
>> >   BR2_PACKAGE_HOST_OPENOCD=y
>> > --
>> > 2.32.0
>> >
>> >
>> > ST Restricted
>> >
>>
>>
>> --
>> Best regards / Cordialement,
>>
>> Christophe Priouzeau | Tel: +33 244027320
>> STMicroelectronics
>> ST online: www.st.com<http://www.st.com/>
>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210715/2c977975/attachment-0001.html>
