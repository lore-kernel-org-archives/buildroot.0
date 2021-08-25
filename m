Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4BCC4320A
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 18:19:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5EAB610CA
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 18:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B5EAB610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 792746062B;
	Wed, 25 Aug 2021 18:19:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Japjq1DC9hRV; Wed, 25 Aug 2021 18:19:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D75F660B89;
	Wed, 25 Aug 2021 18:19:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B7BB71BF39F
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 18:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A325840506
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 18:19:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TkRfxQRHxmpL for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 18:19:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7B2340752
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 18:19:09 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id p15so276497ljn.3
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 11:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BSz8xBpWwTvuPlv5eWjqGuSAfgw/PJa4ceMrZoEFjvQ=;
 b=LHHeSk2cOyxAbLmw9jK2hiVcy11PHYzlg3C7vBoVcN0eNloqsVw/vJBvpKul63AJNd
 RvQi48/tLvffI6Vz7M8r/b+1Sn8UO3qkquDh2jywEJlnbq38gLN6zP/hFiwpgyUKwyEj
 Gby0exlrLX3U4GPYksWAjEFrADC7ezbxmuRlzjYVdb5kFlCNJ+4UJSgQ0oGxp9Hexjrp
 gFhy67hiG8mORJqVhuAfOaclRfeJJP6QQMqJVaIU0Q2dYb6+P8Kg0l20k7LJPrkyuFIx
 k4gD6pKfVyRyptgk0vIvpScNhAZuKZ56D8t0fsQdZ0Fqyz9uhuP58vrrvylEJ8bU74Q1
 007Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BSz8xBpWwTvuPlv5eWjqGuSAfgw/PJa4ceMrZoEFjvQ=;
 b=ZGAkGqNaqheDTO4m4yJJeZ9SeMNr1JXpBmoGGy0INGgKYU7xBt2NPbZ7J8Spr17UxY
 IEVCa91MWXbqP44UfM0+cCT2EOLFBkd8MKU7BYuintyGunRi2ZELTYsYq32uFnoofqcK
 fZhONnF6lVAjQU3CtUPz22Ce/MZL7wNiBRN8zQlZ7RihXC4yWUboYbjDRHVwS5qMlbK+
 2++nTsNaWzWlfQuGQYXXl2nHQjrZvGyGxzt7d5cGAJnmOmHCB5b7BjZ9N//5m6JAzYgv
 devQNaI3YCScoV4XYt8kQRL/oGgOR35kf0Eb3P1uBlGfHj6HqMDGbxTbAV7DSDy7SjJn
 YMSQ==
X-Gm-Message-State: AOAM5308XcqrRITSUDWSv3N1kjb+4+tmM1GpxlhcKErRlMZ3CN6atl1O
 NIHuuolILul6Stb5FvGMCMSct1HaZvMRICJHjtM=
X-Google-Smtp-Source: ABdhPJzlr9V13xnGJwdpBm834La+VaPsVTh+LEJY63zXINSskLvcsz6e0i6kIUJBMej4U0hea9YuRg==
X-Received: by 2002:a2e:d09:: with SMTP id 9mr36649137ljn.241.1629915547433;
 Wed, 25 Aug 2021 11:19:07 -0700 (PDT)
Received: from localhost.localdomain (m90-131-47-37.cust.tele2.lt.
 [90.131.47.37])
 by smtp.gmail.com with ESMTPSA id j20sm80125lji.41.2021.08.25.11.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 11:19:06 -0700 (PDT)
From: Yauheni Saldatsenka <eugentoo@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 25 Aug 2021 21:18:56 +0300
Message-Id: <20210825181858.801574-1-eugentoo@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] [PATCH 1/1]
 configs/stm32f469_disco_xip_defconfig: alternative defconfig for XIP
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Update STM32F469-disco configuration files to operate with new kernel.

Result of make tinyconfig was taken as a starting point to fit kernel
into flash memory.
Current setup kernel + rootfs fits in 1.6MB on-chip flash memory

Fixes:
    - Move kernel to new flash bank due to growth of dtb size
    - Fix kernel start address in bootloader
    - Remove outdated path which doesn't affect normal operation mode

Signed-off-by: Yauheni Saldatsenka <eugentoo@gmail.com>
---
 .../stm32f469-disco/flash.sh                  |  47 +++-
 .../stm32f469-disco/linux/defconfig           | 120 +++++++++
 .../stm32f469-disco/linux/stm32f469-disco.dts | 240 ++++++++++++++++++
 .../0002-kernel-start-address.patch           |  21 ++
 .../patches/afboot-stm32/0003-no-mpu.patch    |  22 ++
 configs/stm32f469_disco_xip_defconfig         |  24 ++
 6 files changed, 465 insertions(+), 9 deletions(-)
 create mode 100644 board/stmicroelectronics/stm32f469-disco/linux/defconfig
 create mode 100644 board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.dts
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0002-kernel-start-address.patch
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0003-no-mpu.patch
 create mode 100644 configs/stm32f469_disco_xip_defconfig

diff --git a/board/stmicroelectronics/stm32f469-disco/flash.sh b/board/stmicroelectronics/stm32f469-disco/flash.sh
index 984d2b2599..176e1c9d2c 100755
--- a/board/stmicroelectronics/stm32f469-disco/flash.sh
+++ b/board/stmicroelectronics/stm32f469-disco/flash.sh
@@ -1,18 +1,47 @@
 #!/bin/bash
 
 OUTPUT_DIR=$1
+BUILD_TYPE=$2
 
-if ! test -d "${OUTPUT_DIR}" ; then
+if ! test -d "${OUTPUT_DIR}"
+then
     echo "ERROR: no output directory specified."
     echo "Usage: $0 OUTPUT_DIR"
     exit 1
 fi
 
-${OUTPUT_DIR}/host/bin/openocd -f board/stm32f469discovery.cfg \
-  -c "init" \
-  -c "reset init" \
-  -c "flash probe 0" \
-  -c "flash info 0" \
-  -c "flash write_image erase ${OUTPUT_DIR}/images/u-boot.bin 0x08000000" \
-  -c "reset run" \
-  -c "shutdown"
+if  [[ -z "${BUILD_TYPE}" ]]
+then
+    echo "ERROR: no build type specified, please select 'xip' or 'uboot'."
+    echo "Usage: $0 OUTPUT_DIR $1 BUILD_TYPE"
+    exit 1
+fi
+
+case "${BUILD_TYPE}" in
+	"xip")
+		${OUTPUT_DIR}/host/bin/openocd -f board/stm32f469discovery.cfg \
+					 -c "init" \
+					 -c "reset init" \
+					 -c "flash probe 0" \
+					 -c "flash info 0" \
+					 -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f469i-disco.bin 0x08000000" \
+					 -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f469-disco.dtb 0x08004000" \
+					 -c "flash write_image erase ${OUTPUT_DIR}/images/xipImage 0x08010000" \
+					 -c "reset run" \
+					 -c "shutdown"
+		;;
+	"uboot")
+		FLASH_COMMAND=
+		${OUTPUT_DIR}/host/bin/openocd -f board/stm32f469discovery.cfg \
+					 -c "init" \
+					 -c "reset init" \
+					 -c "flash probe 0" \
+					 -c "flash info 0" \
+					 -c "flash write_image erase ${OUTPUT_DIR}/images/u-boot.bin 0x08000000" \
+					 -c "reset run" \
+					 -c "shutdown"
+	    ;;
+	*)
+		echo "Wrong build type. Please select from: xip, uboot"
+		;;
+esac
diff --git a/board/stmicroelectronics/stm32f469-disco/linux/defconfig b/board/stmicroelectronics/stm32f469-disco/linux/defconfig
new file mode 100644
index 0000000000..2d0ce59b31
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/linux/defconfig
@@ -0,0 +1,120 @@
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_KERNEL_XZ=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
+CONFIG_LOG_BUF_SHIFT=12
+CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=10
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="${BR_BINARIES_DIR}/rootfs.cpio"
+# CONFIG_RD_GZIP is not set
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+# CONFIG_RD_XZ is not set
+# CONFIG_RD_LZO is not set
+# CONFIG_RD_LZ4 is not set
+# CONFIG_RD_ZSTD is not set
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+# CONFIG_MULTIUSER is not set
+# CONFIG_SYSFS_SYSCALL is not set
+# CONFIG_FHANDLE is not set
+# CONFIG_POSIX_TIMERS is not set
+# CONFIG_BUG is not set
+# CONFIG_BASE_FULL is not set
+# CONFIG_FUTEX is not set
+# CONFIG_EPOLL is not set
+# CONFIG_SIGNALFD is not set
+# CONFIG_TIMERFD is not set
+# CONFIG_EVENTFD is not set
+# CONFIG_AIO is not set
+# CONFIG_IO_URING is not set
+# CONFIG_ADVISE_SYSCALLS is not set
+# CONFIG_MEMBARRIER is not set
+# CONFIG_KALLSYMS is not set
+CONFIG_KCMP=y
+# CONFIG_RSEQ is not set
+CONFIG_EMBEDDED=y
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SLOB=y
+# CONFIG_SLAB_MERGE_DEFAULT is not set
+# CONFIG_MMU is not set
+CONFIG_ARCH_STM32=y
+# CONFIG_MACH_STM32F429 is not set
+# CONFIG_MACH_STM32F746 is not set
+# CONFIG_MACH_STM32F769 is not set
+# CONFIG_MACH_STM32H743 is not set
+CONFIG_CPU_V7M_NUM_IRQ=240
+# CONFIG_ARM_DMA_MEM_BUFFERABLE is not set
+CONFIG_SET_MEM_PARAM=y
+CONFIG_DRAM_BASE=0xc0000000
+CONFIG_DRAM_SIZE=0x01000000
+CONFIG_HZ_1000=y
+# CONFIG_ATAGS is not set
+CONFIG_XIP_KERNEL=y
+CONFIG_XIP_PHYS_ADDR=0x08010000
+CONFIG_XIP_DEFLATED_DATA=y
+# CONFIG_SUSPEND is not set
+# CONFIG_STACKPROTECTOR is not set
+# CONFIG_COMPAT_32BIT_TIME is not set
+# CONFIG_GCC_PLUGINS is not set
+# CONFIG_BLOCK is not set
+CONFIG_BINFMT_FLAT=y
+CONFIG_BINFMT_SHARED_FLAT=y
+# CONFIG_COREDUMP is not set
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_STANDALONE is not set
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+# CONFIG_FW_LOADER is not set
+# CONFIG_ALLOW_DEV_COREDUMP is not set
+CONFIG_EEPROM_93CX6=y
+# CONFIG_INPUT is not set
+# CONFIG_VT is not set
+# CONFIG_UNIX98_PTYS is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_LDISC_AUTOLOAD is not set
+CONFIG_SERIAL_STM32=y
+CONFIG_SERIAL_STM32_CONSOLE=y
+# CONFIG_DEVMEM is not set
+# CONFIG_HWMON is not set
+CONFIG_WATCHDOG=y
+CONFIG_MFD_STM32_TIMERS=y
+# CONFIG_USB_SUPPORT is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_STM32=y
+CONFIG_DMADEVICES=y
+CONFIG_STM32_DMA=y
+CONFIG_STM32_DMAMUX=y
+CONFIG_STM32_MDMA=y
+CONFIG_SYNC_FILE=y
+# CONFIG_VIRTIO_MENU is not set
+# CONFIG_VHOST_MENU is not set
+CONFIG_IIO=y
+CONFIG_IIO_BUFFER=y
+CONFIG_IIO_TRIGGERED_BUFFER=y
+CONFIG_IIO_STM32_TIMER_TRIGGER=y
+# CONFIG_FILE_LOCKING is not set
+# CONFIG_DNOTIFY is not set
+# CONFIG_INOTIFY_USER is not set
+# CONFIG_PROC_SYSCTL is not set
+CONFIG_CONFIGFS_FS=y
+# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_NLS=y
+CONFIG_PRINTK_TIME=y
+CONFIG_CONSOLE_LOGLEVEL_DEFAULT=15
+CONFIG_CONSOLE_LOGLEVEL_QUIET=15
+CONFIG_MESSAGE_LOGLEVEL_DEFAULT=7
+# CONFIG_SYMBOLIC_ERRNAME is not set
+CONFIG_DEBUG_INFO=y
+# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
+CONFIG_DEBUG_FS=y
+# CONFIG_DEBUG_MISC is not set
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_RCU_TRACE is not set
+# CONFIG_RUNTIME_TESTING_MENU is not set
diff --git a/board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.dts b/board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.dts
new file mode 100644
index 0000000000..83fe71bbc6
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.dts
@@ -0,0 +1,240 @@
+/*
+ * Copyright 2016 - Lee Jones <lee.jones@linaro.org>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ *     You should have received a copy of the GNU General Public
+ *     License along with this file; if not, write to the Free
+ *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
+ *     MA 02110-1301 USA
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/dts-v1/;
+#include "stm32f469.dtsi"
+#include "stm32f469-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "STMicroelectronics STM32F469i-DISCO board";
+	compatible = "st,stm32f469i-disco", "st,stm32f469";
+
+	chosen {
+		bootargs = "root=/dev/ram fbcon=map:0";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@c0000000 {
+		device_type = "memory";
+		reg = <0xc0000000 0x1000000>;
+	};
+
+	aliases {
+		serial0 = &usart3;
+	};
+
+	mmc_vcard: mmc_vcard {
+		compatible = "regulator-fixed";
+		regulator-name = "mmc_vcard";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	vdd_dsi: vdd-dsi {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_dsi";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	soc {
+		dma-ranges = <0xc0000000 0xc0000000 0x10000000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		led-green {
+			gpios = <&gpiog 6 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+		led-orange {
+			gpios = <&gpiod 4 GPIO_ACTIVE_LOW>;
+		};
+		led-red {
+			gpios = <&gpiod 5 GPIO_ACTIVE_LOW>;
+		};
+		led-blue {
+			gpios = <&gpiok 3 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio_keys {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		autorepeat;
+		button@0 {
+			label = "User";
+			linux,code = <KEY_WAKEUP>;
+			gpios = <&gpioa 0 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	/* This turns on vbus for otg for host mode (dwc2) */
+	vcc5v_otg: vcc5v-otg-regulator {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpiob 2 GPIO_ACTIVE_HIGH>;
+		regulator-name = "vcc5_host1";
+		regulator-always-on;
+	};
+};
+
+&rcc {
+	compatible = "st,stm32f469-rcc", "st,stm32f42xx-rcc", "st,stm32-rcc";
+};
+
+&clk_hse {
+	clock-frequency = <8000000>;
+};
+
+&dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dsi_in: endpoint {
+				remote-endpoint = <&ltdc_out_dsi>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dsi_out: endpoint {
+				remote-endpoint = <&dsi_panel_in>;
+			};
+		};
+	};
+
+	panel-dsi@0 {
+		compatible = "orisetech,otm8009a";
+		reg = <0>; /* dsi virtual channel (0..3) */
+		reset-gpios = <&gpioh 7 GPIO_ACTIVE_LOW>;
+		power-supply = <&vdd_dsi>;
+		status = "okay";
+
+		port {
+			dsi_panel_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
+};
+
+&ltdc {
+	status = "okay";
+
+	port {
+		ltdc_out_dsi: endpoint@0 {
+			remote-endpoint = <&dsi_in>;
+		};
+	};
+};
+
+&rtc {
+	status = "okay";
+};
+
+&timers1 {
+	status = "okay";
+
+	pwm {
+		pinctrl-0 = <&pwm1_pins>;
+		pinctrl-names = "default";
+		status = "okay";
+	};
+
+	timer@0 {
+		status = "okay";
+	};
+};
+
+&timers3 {
+	status = "okay";
+
+	pwm {
+		pinctrl-0 = <&pwm3_pins>;
+		pinctrl-names = "default";
+		status = "okay";
+	};
+
+	timer@2 {
+		status = "okay";
+	};
+};
+
+&sdio {
+	status = "okay";
+	vmmc-supply = <&mmc_vcard>;
+	cd-gpios = <&gpiog 2 GPIO_ACTIVE_LOW>;
+	broken-cd;
+	pinctrl-names = "default", "opendrain";
+	pinctrl-0 = <&sdio_pins>;
+	pinctrl-1 = <&sdio_pins_od>;
+	bus-width = <4>;
+};
+
+&usart3 {
+	pinctrl-0 = <&usart3_pins_a>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usbotg_fs {
+	dr_mode = "host";
+	pinctrl-0 = <&usbotg_fs_pins_a>;
+	pinctrl-names = "default";
+	status = "okay";
+};
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0002-kernel-start-address.patch b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0002-kernel-start-address.patch
new file mode 100644
index 0000000000..614effa85b
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0002-kernel-start-address.patch
@@ -0,0 +1,21 @@
+diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c
+index 2da1f4b65f..96e4dff65e 100644
+--- a/stm32f469i-disco.c
++++ b/stm32f469i-disco.c
+@@ -6,6 +6,7 @@
+ #include "gpio.h"
+ #include "mpu.h"
+ 
++#define KERNEL_ADDR     0x08010000
+ #define CONFIG_HSE_HZ	8000000
+ #define CONFIG_PLL_M	8
+ #define CONFIG_PLL_N	360
+@@ -85,7 +86,7 @@ static void fmc_wait_busy(void)
+ 
+ void start_kernel(void)
+ {
+-	void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) = (void (*)(uint32_t, uint32_t, uint32_t))(0x08008000 | 1);
++	void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) = (void (*)(uint32_t, uint32_t, uint32_t))(KERNEL_ADDR | 1);
+ 
+ 	kernel(0, ~0UL, 0x08004000);
+ }
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0003-no-mpu.patch b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0003-no-mpu.patch
new file mode 100644
index 0000000000..bc66d2d0ef
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0003-no-mpu.patch
@@ -0,0 +1,22 @@
+diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c
+index d4d0909831..03f823f288 100644
+--- a/stm32f469i-disco.c
++++ b/stm32f469i-disco.c
+@@ -127,7 +127,7 @@ int main(void)
+ 
+ 	int i;
+ 
+-	mpu_config(0x0);
++	mpu_config(0xc0000000); 
+ 
+ 	if (*FLASH_CR & FLASH_CR_LOCK) {
+ 		*FLASH_KEYR = 0x45670123;
+@@ -229,7 +229,7 @@ int main(void)
+ 	usart_setup(usart_base, 45000000);
+ 	usart_putch(usart_base, '.');
+ 
+-	*SYSCFG_MEMRMP = 0x4;
++	/* *SYSCFG_MEMRMP = 0x4; */
+ 
+ 	start_kernel();
+ 
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
new file mode 100644
index 0000000000..81bdb0d6d6
--- /dev/null
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -0,0 +1,24 @@
+BR2_arm=y
+BR2_cortex_m4=y
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
+BR2_KERNEL_HEADERS_5_13=y
+# BR2_UCLIBC_INSTALL_UTILS is not set
+BR2_GCC_VERSION_11_X=y
+BR2_GCC_ENABLE_LTO=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux/defconfig"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_XZ=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.dts"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+BR2_PACKAGE_ZLIB=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_AFBOOT_STM32=y
+BR2_PACKAGE_HOST_OPENOCD=y
+BR2_PACKAGE_HOST_UTIL_LINUX=y
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
