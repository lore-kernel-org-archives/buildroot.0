Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFE8C43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49900408EA;
	Sun, 19 Jun 2022 16:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49900408EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cMh4Pwv-RV4g; Sun, 19 Jun 2022 16:38:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 445834010E;
	Sun, 19 Jun 2022 16:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 445834010E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 171361BF4E7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E495560E56
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E495560E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mJgQQLoDWVCC for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:38:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 187E860C31
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 187E860C31
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:38:24 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id kq6so16933019ejb.11
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 09:38:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pFp6gz3GY4wBgTDm1uDD5o5H3N34CCvMtkDqjZ3YqKg=;
 b=GdG6a6DM6poO0XRrI7mvEpsvyd+p4FZMnl1XZy5zJ5CElN6W1uYpNBk5R6QfugNpF3
 2KWexD9qkzv82SNmwZEms86JCO7dx3mFUncC2jp2FDia3KPGGdR/SmAFdsXZ5F+/W6ZB
 kcRjnvyQHjU4WVlArs5q8P2smNIqpBobWd/WZVt7AMKjhi9yfsSa3ANSl16i73Gv0pdb
 aywlIc+WGHoK/yFAkw+qy8+SQswwXM0hZFd0h9wWOPJJZ6IMCn+G/SnxqVlBhtr0oFmA
 BtJpiaw5lmnw4ZDV+eXyoruZOf2Ptgr6xpuH0sXtOPEfOXD1aOIzelV+bNPnQ045isBn
 SuvA==
X-Gm-Message-State: AJIora/67khoYIS8s4ToHI6QOYqThIiBLFvc0+Sr8o+i3RKZq00L0NwN
 X6PQS+mIc7TK+vvmBP2mQxfHWORdSD7vwA==
X-Google-Smtp-Source: AGRyM1uJvUumykwdBGWM1rTYPrquMs7gWZFnVzXwwNFA4xmEeRBUEjFrVY8uu4xXr4ssR8LlAnKrag==
X-Received: by 2002:a17:906:3f02:b0:718:bdf7:790d with SMTP id
 c2-20020a1709063f0200b00718bdf7790dmr17606298ejj.479.1655656702213; 
 Sun, 19 Jun 2022 09:38:22 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 26-20020a170906309a00b007081c5ce04dsm4777132ejv.58.2022.06.19.09.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 09:38:21 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 18:38:13 +0200
Message-Id: <20220619163813.3730711-1-arnout@mind.be>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pFp6gz3GY4wBgTDm1uDD5o5H3N34CCvMtkDqjZ3YqKg=;
 b=iIymxZPJGAxQOSgd/btMosaK2biufrSR6R5hcOqrooc+Wye4n5HE5aZgY1YchMpi/C
 jZoXvyRh2JsLo1YQtF6vCCTo70nQRnuptNZjYdLPI6xYOWK2HNUHMC/p899Y7svNjmwV
 DDNsRoQqxZGLjU48QV3NaPP0ZQoHZ0hP+XhHLcQT5JC5uMz90qRfaYiyPZaBUF9UrZF9
 VlbB4qwjs+xTYM3vbWKPbAJreElIjnUwzDvnI4JC9DWdRnoQ55EYSl84VAOUf6aXW4mL
 AVrVoZdxTescfzZK2bSMTQ/3y6Kekly6ab/nd4i8Ffiud8AQfbWnj3momRzfmT/WZalf
 6Vsw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iIymxZPJ
Subject: [Buildroot] [PATCH] boot/uboot: remove patches to old versions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

More than five years ago, we added some patches to specific versions of
U-Boot. There is actually little point in maintaining patches for some
versions but not others. In addition, it's pretty unlikely that anyone
is using those specific old versions nowadays. Therefore, get rid of
those patches.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ake-board-selection-choices-optional.patch | 742 ------------------
 ...mcpu-XXX-instead-of-obsolete-marcXXX.patch |  39 -
 ...mcpu-XXX-instead-of-obsolete-marcXXX.patch |  39 -
 3 files changed, 820 deletions(-)
 delete mode 100644 boot/uboot/2015.07/0001-Revert-arch-Make-board-selection-choices-optional.patch
 delete mode 100644 boot/uboot/2016.07/0001-arc-Use-mcpu-XXX-instead-of-obsolete-marcXXX.patch
 delete mode 100644 boot/uboot/2016.09.01/0001-arc-Use-mcpu-XXX-instead-of-obsolete-marcXXX.patch

diff --git a/boot/uboot/2015.07/0001-Revert-arch-Make-board-selection-choices-optional.patch b/boot/uboot/2015.07/0001-Revert-arch-Make-board-selection-choices-optional.patch
deleted file mode 100644
index 8b814f2d69..0000000000
--- a/boot/uboot/2015.07/0001-Revert-arch-Make-board-selection-choices-optional.patch
+++ /dev/null
@@ -1,742 +0,0 @@
-From ee11fed43e2bd029f71af1e72ab9bb5652f5fc54 Mon Sep 17 00:00:00 2001
-From: Alexey Brodkin <abrodkin@synopsys.com>
-Date: Wed, 29 Jul 2015 20:32:59 +0300
-Subject: [PATCH] Revert "arch: Make board selection choices optional"
-
-This reverts commit a26cd04920dc069fd6e91abb785426cf6c29f45f.
-
-Reverted commit caused an issue with "make oldconfig" - default prompt
-for target selection was set as No that lead to missing platform
-selection by automated scripts like that:
------------------->8------------------
-"yes "" | make oldconfig" on defconfig
------------------->8------------------
-
-And that lead to build failure:
------------------->8------------------
-$ make
-scripts/kconfig/conf --silentoldconfig Kconfig
-  CHK     include/config.h
-  UPD     include/config.h
-  GEN     include/autoconf.mk
-In file included from ./include/common.h:18:0:
-include/config.h:5:22: fatal error: configs/.h: No such file or directory
- #include <configs/.h>
-                      ^
-compilation terminated.
-scripts/Makefile.autoconf:72: recipe for target 'include/autoconf.mk' failed
-make[1]: *** [include/autoconf.mk] Error 1
------------------->8------------------
-
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- arch/arc/Kconfig                     | 1 -
- arch/arm/Kconfig                     | 1 -
- arch/arm/cpu/armv7/exynos/Kconfig    | 1 -
- arch/arm/cpu/armv7/mx5/Kconfig       | 1 -
- arch/arm/cpu/armv7/mx6/Kconfig       | 1 -
- arch/arm/cpu/armv7/omap3/Kconfig     | 1 -
- arch/arm/cpu/armv7/omap4/Kconfig     | 1 -
- arch/arm/cpu/armv7/omap5/Kconfig     | 1 -
- arch/arm/cpu/armv7/rmobile/Kconfig   | 1 -
- arch/arm/cpu/armv7/s5pc1xx/Kconfig   | 1 -
- arch/arm/mach-at91/Kconfig           | 1 -
- arch/arm/mach-bcm283x/Kconfig        | 1 -
- arch/arm/mach-davinci/Kconfig        | 1 -
- arch/arm/mach-integrator/Kconfig     | 2 --
- arch/arm/mach-keystone/Kconfig       | 1 -
- arch/arm/mach-kirkwood/Kconfig       | 1 -
- arch/arm/mach-nomadik/Kconfig        | 1 -
- arch/arm/mach-orion5x/Kconfig        | 1 -
- arch/arm/mach-socfpga/Kconfig        | 1 -
- arch/arm/mach-tegra/Kconfig          | 1 -
- arch/arm/mach-tegra/tegra114/Kconfig | 1 -
- arch/arm/mach-tegra/tegra124/Kconfig | 1 -
- arch/arm/mach-tegra/tegra20/Kconfig  | 1 -
- arch/arm/mach-tegra/tegra30/Kconfig  | 1 -
- arch/arm/mach-zynq/Kconfig           | 1 -
- arch/avr32/Kconfig                   | 1 -
- arch/blackfin/Kconfig                | 1 -
- arch/m68k/Kconfig                    | 1 -
- arch/microblaze/Kconfig              | 1 -
- arch/mips/Kconfig                    | 1 -
- arch/nds32/Kconfig                   | 1 -
- arch/nios2/Kconfig                   | 1 -
- arch/openrisc/Kconfig                | 1 -
- arch/powerpc/Kconfig                 | 1 -
- arch/powerpc/cpu/mpc512x/Kconfig     | 1 -
- arch/powerpc/cpu/mpc5xx/Kconfig      | 1 -
- arch/powerpc/cpu/mpc5xxx/Kconfig     | 1 -
- arch/powerpc/cpu/mpc8260/Kconfig     | 1 -
- arch/powerpc/cpu/mpc83xx/Kconfig     | 1 -
- arch/powerpc/cpu/mpc85xx/Kconfig     | 1 -
- arch/powerpc/cpu/mpc86xx/Kconfig     | 1 -
- arch/powerpc/cpu/mpc8xx/Kconfig      | 1 -
- arch/powerpc/cpu/ppc4xx/Kconfig      | 1 -
- arch/sh/Kconfig                      | 1 -
- arch/sparc/Kconfig                   | 1 -
- board/amcc/canyonlands/Kconfig       | 1 -
- board/coreboot/Kconfig               | 1 -
- board/dbau1x00/Kconfig               | 1 -
- board/google/Kconfig                 | 1 -
- board/intel/Kconfig                  | 1 -
- board/micronas/vct/Kconfig           | 1 -
- board/seco/Kconfig                   | 2 --
- board/sunxi/Kconfig                  | 1 -
- 53 files changed, 55 deletions(-)
-
-diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
-index 925e312..640cda8 100644
---- a/arch/arc/Kconfig
-+++ b/arch/arc/Kconfig
-@@ -129,7 +129,6 @@ config ARC_CACHE_LINE_SHIFT
- 
- choice
- 	prompt "Target select"
--	optional
- 
- config TARGET_TB100
- 	bool "Support tb100"
-diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index 9908b43..8eeb46c 100644
---- a/arch/arm/Kconfig
-+++ b/arch/arm/Kconfig
-@@ -64,7 +64,6 @@ config SEMIHOSTING
- 
- choice
- 	prompt "Target select"
--	optional
- 
- config ARCH_AT91
- 	bool "Atmel AT91"
-diff --git a/arch/arm/cpu/armv7/exynos/Kconfig b/arch/arm/cpu/armv7/exynos/Kconfig
-index 4a7d82f..f2fe748 100644
---- a/arch/arm/cpu/armv7/exynos/Kconfig
-+++ b/arch/arm/cpu/armv7/exynos/Kconfig
-@@ -2,7 +2,6 @@ if ARCH_EXYNOS
- 
- choice
- 	prompt "EXYNOS board select"
--	optional
- 
- config TARGET_SMDKV310
- 	select SUPPORT_SPL
-diff --git a/arch/arm/cpu/armv7/mx5/Kconfig b/arch/arm/cpu/armv7/mx5/Kconfig
-index 9f250c6..2d6c0ce 100644
---- a/arch/arm/cpu/armv7/mx5/Kconfig
-+++ b/arch/arm/cpu/armv7/mx5/Kconfig
-@@ -12,7 +12,6 @@ config MX53
- 
- choice
- 	prompt "MX5 board select"
--	optional
- 
- config TARGET_USBARMORY
- 	bool "Support USB armory"
-diff --git a/arch/arm/cpu/armv7/mx6/Kconfig b/arch/arm/cpu/armv7/mx6/Kconfig
-index 10908c4..662596f 100644
---- a/arch/arm/cpu/armv7/mx6/Kconfig
-+++ b/arch/arm/cpu/armv7/mx6/Kconfig
-@@ -27,7 +27,6 @@ config MX6SX
- 
- choice
- 	prompt "MX6 board select"
--	optional
- 
- config TARGET_SECOMX6
- 	bool "Support secomx6 boards"
-diff --git a/arch/arm/cpu/armv7/omap3/Kconfig b/arch/arm/cpu/armv7/omap3/Kconfig
-index b32a6b0..cc82c50 100644
---- a/arch/arm/cpu/armv7/omap3/Kconfig
-+++ b/arch/arm/cpu/armv7/omap3/Kconfig
-@@ -2,7 +2,6 @@ if OMAP34XX
- 
- choice
- 	prompt "OMAP3 board select"
--	optional
- 
- config TARGET_AM3517_EVM
- 	bool "AM3517 EVM"
-diff --git a/arch/arm/cpu/armv7/omap4/Kconfig b/arch/arm/cpu/armv7/omap4/Kconfig
-index df27ea1..eccf897 100644
---- a/arch/arm/cpu/armv7/omap4/Kconfig
-+++ b/arch/arm/cpu/armv7/omap4/Kconfig
-@@ -2,7 +2,6 @@ if OMAP44XX
- 
- choice
- 	prompt "OMAP4 board select"
--	optional
- 
- config TARGET_DUOVERO
- 	bool "OMAP4430 Gumstix Duovero"
-diff --git a/arch/arm/cpu/armv7/omap5/Kconfig b/arch/arm/cpu/armv7/omap5/Kconfig
-index 20c3bd9..aca862d 100644
---- a/arch/arm/cpu/armv7/omap5/Kconfig
-+++ b/arch/arm/cpu/armv7/omap5/Kconfig
-@@ -2,7 +2,6 @@ if OMAP54XX
- 
- choice
- 	prompt "OMAP5 board select"
--	optional
- 
- config TARGET_CM_T54
- 	bool "CompuLab CM-T54"
-diff --git a/arch/arm/cpu/armv7/rmobile/Kconfig b/arch/arm/cpu/armv7/rmobile/Kconfig
-index ef56286..638b63d 100644
---- a/arch/arm/cpu/armv7/rmobile/Kconfig
-+++ b/arch/arm/cpu/armv7/rmobile/Kconfig
-@@ -2,7 +2,6 @@ if RMOBILE
- 
- choice
- 	prompt "Renesus ARM SoCs board select"
--	optional
- 
- config TARGET_ARMADILLO_800EVA
- 	bool "armadillo 800 eva board"
-diff --git a/arch/arm/cpu/armv7/s5pc1xx/Kconfig b/arch/arm/cpu/armv7/s5pc1xx/Kconfig
-index 792ef59..65cc9eb 100644
---- a/arch/arm/cpu/armv7/s5pc1xx/Kconfig
-+++ b/arch/arm/cpu/armv7/s5pc1xx/Kconfig
-@@ -2,7 +2,6 @@ if ARCH_S5PC1XX
- 
- choice
- 	prompt "S5PC1XX board select"
--	optional
- 
- config TARGET_S5P_GONI
- 	bool "S5P Goni board"
-diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
-index bbf4228..5dc2cb2 100644
---- a/arch/arm/mach-at91/Kconfig
-+++ b/arch/arm/mach-at91/Kconfig
-@@ -2,7 +2,6 @@ if ARCH_AT91
- 
- choice
- 	prompt "Atmel AT91 board select"
--	optional
- 
- config TARGET_AT91RM9200EK
- 	bool "Atmel AT91RM9200 evaluation kit"
-diff --git a/arch/arm/mach-bcm283x/Kconfig b/arch/arm/mach-bcm283x/Kconfig
-index 2315a13..d40f505 100644
---- a/arch/arm/mach-bcm283x/Kconfig
-+++ b/arch/arm/mach-bcm283x/Kconfig
-@@ -3,7 +3,6 @@ menu "Broadcom BCM283X family"
- 
- choice
- 	prompt "Broadcom BCM283X board select"
--	optional
- 
- config TARGET_RPI
- 	bool "Raspberry Pi"
-diff --git a/arch/arm/mach-davinci/Kconfig b/arch/arm/mach-davinci/Kconfig
-index e6cb390..3ef55d3 100644
---- a/arch/arm/mach-davinci/Kconfig
-+++ b/arch/arm/mach-davinci/Kconfig
-@@ -2,7 +2,6 @@ if ARCH_DAVINCI
- 
- choice
- 	prompt "DaVinci board select"
--	optional
- 
- config TARGET_ENBW_CMC
- 	bool "EnBW CMC board"
-diff --git a/arch/arm/mach-integrator/Kconfig b/arch/arm/mach-integrator/Kconfig
-index c54d69d..8ffc544 100644
---- a/arch/arm/mach-integrator/Kconfig
-+++ b/arch/arm/mach-integrator/Kconfig
-@@ -3,7 +3,6 @@ menu "Integrator Options"
- 
- choice
- 	prompt "Integrator platform select"
--	optional
- 
- config ARCH_INTEGRATOR_AP
- 	bool "Support Integrator/AP platform"
-@@ -19,7 +18,6 @@ config ARCH_CINTEGRATOR
- 
- choice
- 	prompt "Integrator core module select"
--	optional
- 
- config CM720T
- 	bool "Core Module for ARM720T"
-diff --git a/arch/arm/mach-keystone/Kconfig b/arch/arm/mach-keystone/Kconfig
-index 67f1a33..134ae87 100644
---- a/arch/arm/mach-keystone/Kconfig
-+++ b/arch/arm/mach-keystone/Kconfig
-@@ -2,7 +2,6 @@ if ARCH_KEYSTONE
- 
- choice
- 	prompt "TI Keystone board select"
--	optional
- 
- config TARGET_K2HK_EVM
- 	bool "TI Keystone 2 Kepler/Hawking EVM"
-diff --git a/arch/arm/mach-kirkwood/Kconfig b/arch/arm/mach-kirkwood/Kconfig
-index 1261885..45c6687 100644
---- a/arch/arm/mach-kirkwood/Kconfig
-+++ b/arch/arm/mach-kirkwood/Kconfig
-@@ -2,7 +2,6 @@ if KIRKWOOD
- 
- choice
- 	prompt "Marvell Kirkwood board select"
--	optional
- 
- config TARGET_OPENRD
- 	bool "Marvell OpenRD Board"
-diff --git a/arch/arm/mach-nomadik/Kconfig b/arch/arm/mach-nomadik/Kconfig
-index ba72a41..265f336 100644
---- a/arch/arm/mach-nomadik/Kconfig
-+++ b/arch/arm/mach-nomadik/Kconfig
-@@ -2,7 +2,6 @@ if ARCH_NOMADIK
- 
- choice
- 	prompt "Nomadik board select"
--	optional
- 
- config NOMADIK_NHK8815
- 	bool "ST 8815 Nomadik Hardware Kit"
-diff --git a/arch/arm/mach-orion5x/Kconfig b/arch/arm/mach-orion5x/Kconfig
-index 7644b8d..291c511 100644
---- a/arch/arm/mach-orion5x/Kconfig
-+++ b/arch/arm/mach-orion5x/Kconfig
-@@ -2,7 +2,6 @@ if ORION5X
- 
- choice
- 	prompt "Marvell Orion board select"
--	optional
- 
- config TARGET_EDMINIV2
- 	bool "LaCie Ethernet Disk mini V2"
-diff --git a/arch/arm/mach-socfpga/Kconfig b/arch/arm/mach-socfpga/Kconfig
-index e46c348..204efca 100644
---- a/arch/arm/mach-socfpga/Kconfig
-+++ b/arch/arm/mach-socfpga/Kconfig
-@@ -2,7 +2,6 @@ if ARCH_SOCFPGA
- 
- choice
- 	prompt "Altera SOCFPGA board select"
--	optional
- 
- config TARGET_SOCFPGA_ARRIA5
- 	bool "Altera SOCFPGA Arria V"
-diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
-index 54bd648..ef77c84 100644
---- a/arch/arm/mach-tegra/Kconfig
-+++ b/arch/arm/mach-tegra/Kconfig
-@@ -2,7 +2,6 @@ if TEGRA
- 
- choice
- 	prompt "Tegra SoC select"
--	optional
- 
- config TEGRA20
- 	bool "Tegra20 family"
-diff --git a/arch/arm/mach-tegra/tegra114/Kconfig b/arch/arm/mach-tegra/tegra114/Kconfig
-index 1047b92..31012bc 100644
---- a/arch/arm/mach-tegra/tegra114/Kconfig
-+++ b/arch/arm/mach-tegra/tegra114/Kconfig
-@@ -2,7 +2,6 @@ if TEGRA114
- 
- choice
- 	prompt "Tegra114 board select"
--	optional
- 
- config TARGET_DALMORE
- 	bool "NVIDIA Tegra114 Dalmore evaluation board"
-diff --git a/arch/arm/mach-tegra/tegra124/Kconfig b/arch/arm/mach-tegra/tegra124/Kconfig
-index f3324ff..86c1301 100644
---- a/arch/arm/mach-tegra/tegra124/Kconfig
-+++ b/arch/arm/mach-tegra/tegra124/Kconfig
-@@ -2,7 +2,6 @@ if TEGRA124
- 
- choice
- 	prompt "Tegra124 board select"
--	optional
- 
- config TARGET_JETSON_TK1
- 	bool "NVIDIA Tegra124 Jetson TK1 board"
-diff --git a/arch/arm/mach-tegra/tegra20/Kconfig b/arch/arm/mach-tegra/tegra20/Kconfig
-index 1bb8dff..7f09f81 100644
---- a/arch/arm/mach-tegra/tegra20/Kconfig
-+++ b/arch/arm/mach-tegra/tegra20/Kconfig
-@@ -2,7 +2,6 @@ if TEGRA20
- 
- choice
- 	prompt "Tegra20 board select"
--	optional
- 
- config TARGET_HARMONY
- 	bool "NVIDIA Tegra20 Harmony evaluation board"
-diff --git a/arch/arm/mach-tegra/tegra30/Kconfig b/arch/arm/mach-tegra/tegra30/Kconfig
-index e78331e..3abdc7b 100644
---- a/arch/arm/mach-tegra/tegra30/Kconfig
-+++ b/arch/arm/mach-tegra/tegra30/Kconfig
-@@ -2,7 +2,6 @@ if TEGRA30
- 
- choice
- 	prompt "Tegra30 board select"
--	optional
- 
- config TARGET_APALIS_T30
- 	bool "Toradex Apalis T30 board"
-diff --git a/arch/arm/mach-zynq/Kconfig b/arch/arm/mach-zynq/Kconfig
-index 1de5b07..6b0e295 100644
---- a/arch/arm/mach-zynq/Kconfig
-+++ b/arch/arm/mach-zynq/Kconfig
-@@ -10,7 +10,6 @@ config ZYNQ_CUSTOM_INIT
- 
- choice
- 	prompt "Xilinx Zynq board select"
--	optional
- 
- config TARGET_ZYNQ_ZED
- 	bool "Zynq ZedBoard"
-diff --git a/arch/avr32/Kconfig b/arch/avr32/Kconfig
-index eb33774..801b9cc 100644
---- a/arch/avr32/Kconfig
-+++ b/arch/avr32/Kconfig
-@@ -6,7 +6,6 @@ config SYS_ARCH
- 
- choice
- 	prompt "Target select"
--	optional
- 
- config TARGET_ATNGW100
- 	bool "Support atngw100"
-diff --git a/arch/blackfin/Kconfig b/arch/blackfin/Kconfig
-index 0a2fb4d..31913fe 100644
---- a/arch/blackfin/Kconfig
-+++ b/arch/blackfin/Kconfig
-@@ -6,7 +6,6 @@ config SYS_ARCH
- 
- choice
- 	prompt "Target select"
--	optional
- 
- config TARGET_BCT_BRETTL2
- 	bool "Support bct-brettl2"
-diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
-index 26509b7..69cb0f7 100644
---- a/arch/m68k/Kconfig
-+++ b/arch/m68k/Kconfig
-@@ -114,7 +114,6 @@ config M548x
- 
- choice
- 	prompt "Target select"
--	optional
- 
- config TARGET_M52277EVB
- 	bool "Support M52277EVB"
-diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
-index 077b2a7..6f419f0 100644
---- a/arch/microblaze/Kconfig
-+++ b/arch/microblaze/Kconfig
-@@ -6,7 +6,6 @@ config SYS_ARCH
- 
- choice
- 	prompt "Target select"
--	optional
- 
- config TARGET_MICROBLAZE_GENERIC
- 	bool "Support microblaze-generic"
-diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
-index 7f7e258..87b94ac 100644
---- a/arch/mips/Kconfig
-+++ b/arch/mips/Kconfig
-@@ -10,7 +10,6 @@ config SYS_CPU
- 
- choice
- 	prompt "Target select"
--	optional
- 
- config TARGET_QEMU_MIPS
- 	bool "Support qemu-mips"
-diff --git a/arch/nds32/Kconfig b/arch/nds32/Kconfig
-index 98b0282..81b0a01 100644
---- a/arch/nds32/Kconfig
-+++ b/arch/nds32/Kconfig
-@@ -6,7 +6,6 @@ config SYS_ARCH
- 
- choice
- 	prompt "Target select"
--	optional
- 
- config TARGET_ADP_AG101
- 	bool "Support adp-ag101"
-diff --git a/arch/nios2/Kconfig b/arch/nios2/Kconfig
-index 8ae7f6e..b3be7b5 100644
---- a/arch/nios2/Kconfig
-+++ b/arch/nios2/Kconfig
-@@ -6,7 +6,6 @@ config SYS_ARCH
- 
- choice
- 	prompt "Target select"
--	optional
- 
- config TARGET_NIOS2_GENERIC
- 	bool "Support nios2-generic"
-diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
-index 11014d1..4d62b4c 100644
---- a/arch/openrisc/Kconfig
-+++ b/arch/openrisc/Kconfig
-@@ -6,7 +6,6 @@ config SYS_ARCH
- 
- choice
- 	prompt "Target select"
--	optional
- 
- config TARGET_OPENRISC_GENERIC
- 	bool "Support openrisc-generic"
-diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
-index 3b3f446..8e5a3e2 100644
---- a/arch/powerpc/Kconfig
-+++ b/arch/powerpc/Kconfig
-@@ -6,7 +6,6 @@ config SYS_ARCH
- 
- choice
- 	prompt "CPU select"
--	optional
- 
- config MPC512X
- 	bool "MPC512X"
-diff --git a/arch/powerpc/cpu/mpc512x/Kconfig b/arch/powerpc/cpu/mpc512x/Kconfig
-index 53450ae..a0f0ede 100644
---- a/arch/powerpc/cpu/mpc512x/Kconfig
-+++ b/arch/powerpc/cpu/mpc512x/Kconfig
-@@ -6,7 +6,6 @@ config SYS_CPU
- 
- choice
- 	prompt "Target select"
--	optional
- 
- config TARGET_PDM360NG
- 	bool "Support pdm360ng"
-diff --git a/arch/powerpc/cpu/mpc5xx/Kconfig b/arch/powerpc/cpu/mpc5xx/Kconfig
-index 5275447..aad4a7c 100644
---- a/arch/powerpc/cpu/mpc5xx/Kconfig
-+++ b/arch/powerpc/cpu/mpc5xx/Kconfig
-@@ -6,7 +6,6 @@ config SYS_CPU
- 
- choice
- 	prompt "Target select"
--	optional
- 
- config TARGET_CMI_MPC5XX
- 	bool "Support cmi_mpc5xx"
-diff --git a/arch/powerpc/cpu/mpc5xxx/Kconfig b/arch/powerpc/cpu/mpc5xxx/Kconfig
-index 5d49228..eec9d7d 100644
---- a/arch/powerpc/cpu/mpc5xxx/Kconfig
-+++ b/arch/powerpc/cpu/mpc5xxx/Kconfig
-@@ -6,7 +6,6 @@ config SYS_CPU
- 
- choice
- 	prompt "Target select"
--	optional
- 
- config TARGET_A3M071
- 	bool "Support a3m071"
-diff --git a/arch/powerpc/cpu/mpc8260/Kconfig b/arch/powerpc/cpu/mpc8260/Kconfig
-index e93732d..55941c8 100644
---- a/arch/powerpc/cpu/mpc8260/Kconfig
-+++ b/arch/powerpc/cpu/mpc8260/Kconfig
-@@ -6,7 +6,6 @@ config SYS_CPU
- 
- choice
- 	prompt "Target select"
--	optional
- 
- config TARGET_KM82XX
- 	bool "Support km82xx"
-diff --git a/arch/powerpc/cpu/mpc83xx/Kconfig b/arch/powerpc/cpu/mpc83xx/Kconfig
-index 3fb901f..88a3bd6 100644
---- a/arch/powerpc/cpu/mpc83xx/Kconfig
-+++ b/arch/powerpc/cpu/mpc83xx/Kconfig
-@@ -6,7 +6,6 @@ config SYS_CPU
- 
- choice
- 	prompt "Target select"
--	optional
- 
- config TARGET_MPC8308_P1M
- 	bool "Support mpc8308_p1m"
-diff --git a/arch/powerpc/cpu/mpc85xx/Kconfig b/arch/powerpc/cpu/mpc85xx/Kconfig
-index 3e8d0b1..aff5fdb 100644
---- a/arch/powerpc/cpu/mpc85xx/Kconfig
-+++ b/arch/powerpc/cpu/mpc85xx/Kconfig
-@@ -6,7 +6,6 @@ config SYS_CPU
- 
- choice
- 	prompt "Target select"
--	optional
- 
- config TARGET_SBC8548
- 	bool "Support sbc8548"
-diff --git a/arch/powerpc/cpu/mpc86xx/Kconfig b/arch/powerpc/cpu/mpc86xx/Kconfig
-index fe1859d..14e8b1a 100644
---- a/arch/powerpc/cpu/mpc86xx/Kconfig
-+++ b/arch/powerpc/cpu/mpc86xx/Kconfig
-@@ -6,7 +6,6 @@ config SYS_CPU
- 
- choice
- 	prompt "Target select"
--	optional
- 
- config TARGET_SBC8641D
- 	bool "Support sbc8641d"
-diff --git a/arch/powerpc/cpu/mpc8xx/Kconfig b/arch/powerpc/cpu/mpc8xx/Kconfig
-index 79cee35..e8bcbe9 100644
---- a/arch/powerpc/cpu/mpc8xx/Kconfig
-+++ b/arch/powerpc/cpu/mpc8xx/Kconfig
-@@ -6,7 +6,6 @@ config SYS_CPU
- 
- choice
- 	prompt "Target select"
--	optional
- 
- config TARGET_TQM823L
- 	bool "Support TQM823L"
-diff --git a/arch/powerpc/cpu/ppc4xx/Kconfig b/arch/powerpc/cpu/ppc4xx/Kconfig
-index 10b86e0..4d5954a 100644
---- a/arch/powerpc/cpu/ppc4xx/Kconfig
-+++ b/arch/powerpc/cpu/ppc4xx/Kconfig
-@@ -6,7 +6,6 @@ config SYS_CPU
- 
- choice
- 	prompt "Target select"
--	optional
- 
- config TARGET_CSB272
- 	bool "Support csb272"
-diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
-index 6ac22af..ff8f5b5 100644
---- a/arch/sh/Kconfig
-+++ b/arch/sh/Kconfig
-@@ -29,7 +29,6 @@ config SH_32BIT
- 
- choice
- 	prompt "Target select"
--	optional
- 
- config TARGET_RSK7203
- 	bool "RSK+ 7203"
-diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
-index 04dc08f..2df09b2 100644
---- a/arch/sparc/Kconfig
-+++ b/arch/sparc/Kconfig
-@@ -14,7 +14,6 @@ config LEON3
- 
- choice
- 	prompt "Board select"
--	optional
- 
- config TARGET_GRSIM_LEON2
- 	bool "GRSIM simulating a LEON2 board"
-diff --git a/board/amcc/canyonlands/Kconfig b/board/amcc/canyonlands/Kconfig
-index a655dbc..ef66ad4 100644
---- a/board/amcc/canyonlands/Kconfig
-+++ b/board/amcc/canyonlands/Kconfig
-@@ -11,7 +11,6 @@ config SYS_CONFIG_NAME
- 
- choice BOARD_TYPE
- 	prompt "Select which board to build for"
--	optional
- 
- config CANYONLANDS
- 	bool "Glacier"
-diff --git a/board/coreboot/Kconfig b/board/coreboot/Kconfig
-index ede6065..dc9b70f 100644
---- a/board/coreboot/Kconfig
-+++ b/board/coreboot/Kconfig
-@@ -8,7 +8,6 @@ if VENDOR_COREBOOT
- 
- choice
- 	prompt "Mainboard model"
--	optional
- 
- config TARGET_COREBOOT
- 	bool "coreboot"
-diff --git a/board/dbau1x00/Kconfig b/board/dbau1x00/Kconfig
-index b813adb..1286e45 100644
---- a/board/dbau1x00/Kconfig
-+++ b/board/dbau1x00/Kconfig
-@@ -13,7 +13,6 @@ menu "dbau1x00 board options"
- 
- choice
- 	prompt "Select au1x00 SoC type"
--	optional
- 
- config DBAU1100
- 	bool "Select AU1100"
-diff --git a/board/google/Kconfig b/board/google/Kconfig
-index e9559c9..302f68e 100644
---- a/board/google/Kconfig
-+++ b/board/google/Kconfig
-@@ -8,7 +8,6 @@ if VENDOR_GOOGLE
- 
- choice
- 	prompt "Mainboard model"
--	optional
- 
- config TARGET_CHROMEBOOK_LINK
- 	bool "Chromebook link"
-diff --git a/board/intel/Kconfig b/board/intel/Kconfig
-index 3d9ecf0..7fe21b9 100644
---- a/board/intel/Kconfig
-+++ b/board/intel/Kconfig
-@@ -8,7 +8,6 @@ if VENDOR_INTEL
- 
- choice
- 	prompt "Mainboard model"
--	optional
- 
- config TARGET_CROWNBAY
- 	bool "Crown Bay"
-diff --git a/board/micronas/vct/Kconfig b/board/micronas/vct/Kconfig
-index c518079..288a1ae 100644
---- a/board/micronas/vct/Kconfig
-+++ b/board/micronas/vct/Kconfig
-@@ -13,7 +13,6 @@ menu "vct board options"
- 
- choice
- 	prompt "Board variant"
--	optional
- 
- config VCT_PLATINUM
- 	bool "Enable VCT_PLATINUM"
-diff --git a/board/seco/Kconfig b/board/seco/Kconfig
-index af16697..dcb1ac8 100644
---- a/board/seco/Kconfig
-+++ b/board/seco/Kconfig
-@@ -2,7 +2,6 @@ if TARGET_SECOMX6
- 
- choice
- 	prompt "SECO i.MX6 Board variant"
--	optional
- 
- config SECOMX6_Q7
- 	bool "Q7"
-@@ -17,7 +16,6 @@ endchoice
- 
- choice
- 	prompt "SECO i.MX6 SoC variant"
--	optional
- 
- config SECOMX6Q
- 	bool "i.MX6Q"
-diff --git a/board/sunxi/Kconfig b/board/sunxi/Kconfig
-index 2a1cd3c..808de26 100644
---- a/board/sunxi/Kconfig
-+++ b/board/sunxi/Kconfig
-@@ -18,7 +18,6 @@ config SUNXI_GEN_SUN6I
- 
- choice
- 	prompt "Sunxi SoC Variant"
--	optional
- 
- config MACH_SUN4I
- 	bool "sun4i (Allwinner A10)"
--- 
-2.4.3
-
diff --git a/boot/uboot/2016.07/0001-arc-Use-mcpu-XXX-instead-of-obsolete-marcXXX.patch b/boot/uboot/2016.07/0001-arc-Use-mcpu-XXX-instead-of-obsolete-marcXXX.patch
deleted file mode 100644
index eded9a3128..0000000000
--- a/boot/uboot/2016.07/0001-arc-Use-mcpu-XXX-instead-of-obsolete-marcXXX.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 7c8d81605302e7d7fdd3e7d8eb69302bddc64a2c Mon Sep 17 00:00:00 2001
-From: Alexey Brodkin <abrodkin@synopsys.com>
-Date: Fri, 16 Sep 2016 12:12:26 +0300
-Subject: [PATCH] arc: Use -mcpu=XXX instead of obsolete -marcXXX
-
-With newer ARC tools old way of CPU specification gets obsolete,
-so we're switching to newer and more common way of setting "-mcpu".
-
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- arch/arc/config.mk | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/arch/arc/config.mk b/arch/arc/config.mk
-index 7c974f0..13676bd 100644
---- a/arch/arc/config.mk
-+++ b/arch/arc/config.mk
-@@ -31,15 +31,15 @@ CONFIG_MMU = 1
- endif
- 
- ifdef CONFIG_CPU_ARC750D
--PLATFORM_CPPFLAGS += -marc700
-+PLATFORM_CPPFLAGS += -mcpu=arc700
- endif
- 
- ifdef CONFIG_CPU_ARC770D
--PLATFORM_CPPFLAGS += -marc700 -mlock -mswape
-+PLATFORM_CPPFLAGS += -mcpu=arc700 -mlock -mswape
- endif
- 
- ifdef CONFIG_CPU_ARCEM6
--PLATFORM_CPPFLAGS += -marcem
-+PLATFORM_CPPFLAGS += -mcpu=arcem
- endif
- 
- ifdef CONFIG_CPU_ARCHS34
--- 
-2.7.4
-
diff --git a/boot/uboot/2016.09.01/0001-arc-Use-mcpu-XXX-instead-of-obsolete-marcXXX.patch b/boot/uboot/2016.09.01/0001-arc-Use-mcpu-XXX-instead-of-obsolete-marcXXX.patch
deleted file mode 100644
index eded9a3128..0000000000
--- a/boot/uboot/2016.09.01/0001-arc-Use-mcpu-XXX-instead-of-obsolete-marcXXX.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 7c8d81605302e7d7fdd3e7d8eb69302bddc64a2c Mon Sep 17 00:00:00 2001
-From: Alexey Brodkin <abrodkin@synopsys.com>
-Date: Fri, 16 Sep 2016 12:12:26 +0300
-Subject: [PATCH] arc: Use -mcpu=XXX instead of obsolete -marcXXX
-
-With newer ARC tools old way of CPU specification gets obsolete,
-so we're switching to newer and more common way of setting "-mcpu".
-
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- arch/arc/config.mk | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/arch/arc/config.mk b/arch/arc/config.mk
-index 7c974f0..13676bd 100644
---- a/arch/arc/config.mk
-+++ b/arch/arc/config.mk
-@@ -31,15 +31,15 @@ CONFIG_MMU = 1
- endif
- 
- ifdef CONFIG_CPU_ARC750D
--PLATFORM_CPPFLAGS += -marc700
-+PLATFORM_CPPFLAGS += -mcpu=arc700
- endif
- 
- ifdef CONFIG_CPU_ARC770D
--PLATFORM_CPPFLAGS += -marc700 -mlock -mswape
-+PLATFORM_CPPFLAGS += -mcpu=arc700 -mlock -mswape
- endif
- 
- ifdef CONFIG_CPU_ARCEM6
--PLATFORM_CPPFLAGS += -marcem
-+PLATFORM_CPPFLAGS += -mcpu=arcem
- endif
- 
- ifdef CONFIG_CPU_ARCHS34
--- 
-2.7.4
-
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
