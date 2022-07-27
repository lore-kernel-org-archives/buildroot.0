Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67121C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 098BA80E48;
	Wed, 27 Jul 2022 10:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 098BA80E48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d9YCuUdMXf2z; Wed, 27 Jul 2022 10:58:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9556F80E3F;
	Wed, 27 Jul 2022 10:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9556F80E3F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A28C1BF4E6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01B6A60B8B
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:58:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01B6A60B8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m35sQGOTEdxp for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:58:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A03DB60B6C
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A03DB60B6C
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:58:11 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 r1-20020a05600c35c100b003a326685e7cso2038683wmq.1
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 03:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7d6S4tTwdFOchmCXUphrGJ263o1t/MySqgg0pKMLSew=;
 b=5VBLQ7U4FEYxStF3hMijTHTpcEOPsvlRJbacSOqHZYoY8QWfUKG/bBVrKT7c80tQke
 M8tB1LVbhqcLlhVkadYH5R5zxpoXXJ1BkmZOzdoBLaGeN/lYcEsrwvEQ/vIu1MGCBpDP
 C0CEfctJT6ENMVg6eQ32iijW8RnsKJlu0JxdRgTuAjKazZ+tZE+RbBxSnVzOls9o2saB
 VHCYeueE3vX5+VBrMVCxMKMmGZw5hRerheOg/wuVcB13GtcI4G+0AiemIAVng9b90Kc1
 gnGe43DpEuf8bSEUq5lXM+nLS1GIGulQOWJhKUyaoQz1WCkeOEc6pHrE4NRXk2FzR0e8
 fPXA==
X-Gm-Message-State: AJIora8iXdPGUWMHeD+ulz10oWpSPO/P8j93f9Ilk+NUs0MLGtiHo3gA
 8nZ2loGTAducDN77pLS1Gt7qUiEzoZ4=
X-Google-Smtp-Source: AGRyM1sh5Mx4poVFLpBV2eXu44roqnMJNN+THDfX4TqdOXjU8K9nn4zBVHBKm/iFx/80yJLXSbqvgw==
X-Received: by 2002:a05:600c:154a:b0:3a3:2fae:9bae with SMTP id
 f10-20020a05600c154a00b003a32fae9baemr2721699wmg.23.1658919489790; 
 Wed, 27 Jul 2022 03:58:09 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:2464:a3b6:9580:87a1])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a5d65cd000000b0021e47386eb8sm17005038wrw.2.2022.07.27.03.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 03:58:09 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 12:58:05 +0200
Message-Id: <ad063dad0d9c6d469d1e809b5e925a950bac712b.1658919469.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658919469.git.yann.morin.1998@free.fr>
References: <cover.1658919469.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7d6S4tTwdFOchmCXUphrGJ263o1t/MySqgg0pKMLSew=;
 b=laPU+S5T+Nfk+Uxpngs0BkE6OwHe8/Ip+Ogp6kn5TOEhIIkH1a6zd5l9UioMJAi3iX
 WrJI070oUkRwm5u0+728GSXjOio0WWWjNYFJKH9Y7yB9D4O5MWNk30MW4lyxLSNImLSN
 9uD1gnUIJlE2QUmryYWJKDog7bvzxY6W2mQRFF3nuZNF+huGSaZcNO8erXN3mSyh6jzC
 5OOQCK5YMwiSbOv2v4hsBtjrx/zXo4DKIAAmfDKIjn+pBBWUeFEedwkXQHy755uI69mn
 zSBfZdTcqQ+XOCAcCtIJ/JBQROJlpwAfC+lpl9lIz9adzScJuoKDANmE2PId0oKLKzYs
 Wytw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=laPU+S5T
Subject: [Buildroot] [PATCH 2/5] configs: drop csky defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                     |   4 -
 board/csky/gx6605s/gdbinit     |  25 ------
 board/csky/gx6605s/gx6605s.dts | 155 ---------------------------------
 board/csky/readme.txt          |  88 -------------------
 configs/csky_gx6605s_defconfig |  19 ----
 5 files changed, 291 deletions(-)
 delete mode 100644 board/csky/gx6605s/gdbinit
 delete mode 100644 board/csky/gx6605s/gx6605s.dts
 delete mode 100644 board/csky/readme.txt
 delete mode 100644 configs/csky_gx6605s_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 04c9588f34..7747cefa0d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1181,10 +1181,6 @@ F:	support/testing/tests/package/br2-external/python-pybind
 F:	support/testing/tests/package/sample_python_pybind.py
 F:	support/testing/tests/package/test_python_pybind.py
 
-N:	Guo Ren <ren_guo@c-sky.com>
-F:	board/csky/
-F:	configs/csky_*
-
 N:	Gustavo Heinz <gustavo@gsthnz.com>
 F:	package/python-m2crypto/
 
diff --git a/board/csky/gx6605s/gdbinit b/board/csky/gx6605s/gdbinit
deleted file mode 100644
index d602aad46d..0000000000
--- a/board/csky/gx6605s/gdbinit
+++ /dev/null
@@ -1,25 +0,0 @@
-tar jtag jtag://127.0.0.1:1025
-reset
-
-# setup CCR (Cache Config Reg)
-# 0-1:MP,2:IE,3:DE,4:WB,5:RS,6:Z,7:BE
-set $cr18 = 0x7d
-
-# vendor custom setup, double cache line & preload
-set $cr30 = 0xc
-
-# pin mux for serial8250
-set *(unsigned int *) 0xa030a14c |= (1 << 22) | (1 << 23)
-
-# pass devicetree blob
-# r2 is magic
-# r3 is address
-set $r2 = 0x20150401
-set $r3 = 0x92000000
-restore gx6605s.dtb binary 0x92000000
-
-# flush cache
-set $cr17 = 0x33
-
-load
-
diff --git a/board/csky/gx6605s/gx6605s.dts b/board/csky/gx6605s/gx6605s.dts
deleted file mode 100644
index e4d46f59a0..0000000000
--- a/board/csky/gx6605s/gx6605s.dts
+++ /dev/null
@@ -1,155 +0,0 @@
-/dts-v1/;
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/input/input.h>
-
-/ {
-	model = "C-SKY gx6605s";
-	compatible = "csky,gx6605s";
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	memory {
-		device_type = "memory";
-		reg = <0x10000000 0x04000000>;
-	};
-
-	soc {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "simple-bus";
-		ranges;
-
-		dummy_apb: apb-clock {
-			compatible = "fixed-clock";
-			clock-frequency = <27000000>;
-			clock-output-names = "dummy_apb";
-			#clock-cells = <0>;
-		};
-
-		intc: interrupt-controller@500000 {
-			compatible = "csky,gx6605s-intc";
-			reg = <0x00500000 0x400>;
-			interrupt-controller;
-			#interrupt-cells = <1>;
-		};
-
-		timer@20a000 {
-			compatible = "csky,gx6605s-timer";
-			reg = <0x0020a000 0x400>;
-			clocks = <&dummy_apb>;
-			interrupts = <10>;
-			interrupt-parent = <&intc>;
-		};
-
-		ehci-hcd@900000 {
-			compatible = "generic-ehci";
-			reg = <0x00900000 0x400>;
-			interrupt-parent = <&intc>;
-			interrupts = <59>;
-		};
-
-		ohci-hcd0@a00000 {
-			compatible = "generic-ohci";
-			reg = <0x00a00000 0x400>;
-			interrupt-parent = <&intc>;
-			interrupts = <58>;
-		};
-
-		ohci-hcd1@b00000 {
-			compatible = "generic-ohci";
-			reg = <0x00b00000 0x400>;
-			interrupt-parent = <&intc>;
-			interrupts = <57>;
-		};
-
-		serial@403000 {
-			compatible = "ns16550a";
-			reg = <0x00403000 0x400>;
-			interrupt-parent = <&intc>;
-			interrupts = <15>;
-			clock-frequency = <29491200>;
-			baud = <115200>;
-			reg-shift = <2>;
-			reg-io-width = <1>;
-		};
-
-		gpio0: gpio@305000 {
-			compatible = "wd,mbl-gpio";
-			reg-names = "dirout", "dat", "set", "clr";
-			reg = <0x305000 4>, <0x305004 4>, <0x305008 4>, <0x30500c 4>;
-			bgpio-base = <0>;
-			#gpio-cells = <2>;
-			gpio-controller;
-		};
-
-		gpio_buttons {
-			compatible = "gpio-keys-polled";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			poll-interval = <100>;
-			autorepeat;
-
-			button0 {
-				label = "button8";
-				linux,code = <KEY_LEFT>;
-				gpios = <&gpio0 8 GPIO_ACTIVE_LOW>;
-			};
-
-			button1 {
-				label = "button6";
-				linux,code = <KEY_RIGHT>;
-				gpios = <&gpio0 6 GPIO_ACTIVE_LOW>;
-			};
-
-			button2 {
-				label = "button5";
-				linux,code = <KEY_UP>;
-				gpios = <&gpio0 5 GPIO_ACTIVE_LOW>;
-			};
-
-			button3 {
-				label = "button9";
-				linux,code = <KEY_DOWN>;
-				gpios = <&gpio0 9 GPIO_ACTIVE_LOW>;
-			};
-
-			button4 {
-				label = "button7";
-				linux,code = <KEY_ENTER>;
-				gpios = <&gpio0 7 GPIO_ACTIVE_LOW>;
-			};
-		};
-
-		gpio_leds {
-			compatible = "gpio-leds";
-
-			led0 {
-				label = "led10";
-				gpios = <&gpio0 10 GPIO_ACTIVE_LOW>;
-				linux,default-trigger = "heartbeat";
-			};
-
-			led1 {
-				label = "led11";
-				gpios = <&gpio0 11 GPIO_ACTIVE_LOW>;
-				linux,default-trigger = "timer";
-			};
-
-			led2 {
-				label = "led12";
-				gpios = <&gpio0 12 GPIO_ACTIVE_LOW>;
-				linux,default-trigger = "default-on";
-			};
-
-			led3 {
-				label = "led13";
-				gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
-				linux,default-trigger = "default-on";
-			};
-		};
-	};
-
-	chosen {
-		bootargs = "console=ttyS0,115200 init=/sbin/init root=/dev/sda2 rw rootwait";
-	};
-};
diff --git a/board/csky/readme.txt b/board/csky/readme.txt
deleted file mode 100644
index dc82dcc1d7..0000000000
--- a/board/csky/readme.txt
+++ /dev/null
@@ -1,88 +0,0 @@
-C-SKY Development Kit
-
-Intro
-=====
-
-C-SKY is a CPU Architecture from www.c-sky.com and has it own instruction set.
-Just like arm and mips in linux/arch, it named as 'csky'.
-
-gx6605s develop board is made by Hangzhou Nationalchip and C-SKY.
-
-Hardware Spec:
-  * CPU: ck610 up to 594Mhz
-  * Integrate with 64MB ddr2 in SOC.
-  * Integrate with hardware Jtag.
-  * Integrate with usb-to-serial chip.
-  * USB ehci controller in SOC.
-  * Power Supply: DC 5V from two micro-usb.
-
-How to build it
-===============
-
-Configure Buildroot
--------------------
-
-The csky_gx6605s_defconfig configuration is a sample configuration with
-all that is required to bring the gx6605s Development Board:
-
-  $ make csky_gx6605s_defconfig
-
-Build everything
-----------------
-
-Note: you will need to have access to the network, since Buildroot will
-download the packages' sources.
-
-  $ make
-
-Result of the build
--------------------
-
-After building, you should obtain this tree:
-
-    output/images/
-    +-- vmlinux
-    +-- rootfs.ext2
-    +-- <board name>.dtb
-
-How to run it
-=============
-
-Prepare Jtag-Server
--------------------
-
-  Download the Jtag-Server here:
-
-  https://github.com/c-sky/tools/raw/master/DebugServerConsole-linux-x86_64-V4.2.00-20161213.tar.gz
-
-  Go to the unpacked directory:
-
-  $./DebugServerConsole -ddc -rstwait 1000 -prereset -port 1025
-
-  Perhaps you need to use "sudo", which need libusb to detect c510:b210
-
-  $ sudo ./DebugServerConsole -ddc -rstwait 1000 -prereset -port 1025
-
-Prepare USB drive
------------------
-
-  You sould determine which device associated to the usb drive
-  carefully. eg:
-
-  $ cat /proc/partitions
-   8       48    1971712 sdd
-   8       49     976720 sdd1
-
-  $ sudo dd if=rootfs.ext2 of=/dev/sdd1
-  $ sudo sync
-
-Run
----
-
-  Plug the usb drive on gx6605s dev board.
-
-  Setup the Console with the rate 115200/8-N-1.
-
-  $ cd output/images
-  $ ../host/bin/csky-linux-gdb -x ../../board/csky/gx6605s/gdbinit vmlinux
-
diff --git a/configs/csky_gx6605s_defconfig b/configs/csky_gx6605s_defconfig
deleted file mode 100644
index f1f9579dca..0000000000
--- a/configs/csky_gx6605s_defconfig
+++ /dev/null
@@ -1,19 +0,0 @@
-# Architecture
-BR2_csky=y
-BR2_ck610=y
-
-# System
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-
-# Linux headers same as kernel, a 5.0 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck610.config.fragment"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/csky/gx6605s/gx6605s.dts"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
