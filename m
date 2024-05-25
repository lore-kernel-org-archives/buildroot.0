Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB73C25B79
	for <buildroot@archiver.kernel.org>; Sat, 25 May 2024 07:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C0CF823FB;
	Sat, 25 May 2024 07:27:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UEzyQFroV2hl; Sat, 25 May 2024 07:27:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1896E82404
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1896E82404;
	Sat, 25 May 2024 07:27:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E3991D02D3
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 07:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3ACAA82404
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 07:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJ3oi3oQhyoS for <buildroot@lists.busybox.net>;
 Sat, 25 May 2024 07:27:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 733BB823FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 733BB823FB
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 733BB823FB
 for <buildroot@buildroot.org>; Sat, 25 May 2024 07:27:47 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5785fc9c543so1463566a12.1
 for <buildroot@buildroot.org>; Sat, 25 May 2024 00:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716622065; x=1717226865;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XJz6Db84F6Dvo0D1p0UZhGlorwgWph2QZtUJ5KLkuzU=;
 b=MhLxONXpMdGc+YCRIzy8rzjMvyvTJ9PZSVAqvPeFe5zjDtvJOaIayzI3Gw4Uzia1rb
 BudNT5kEKrY24rgh2TIlYT9WepMoUeQnpnXVFXWFAHYxAyFpfZUjTaPj9Snzf28Hqq4Z
 N9CXNgIPLOWs6C39gs6IH0UilwI79HGOeGMhrcxEFT5wqiZ7Oo5+/ZT3rgvc8jf+huA1
 uAKykfCS75ucA4FyvIf8H76nh6EO5bUfO3hYzRfvdwxG0urFIC92alk/HawwKTeeVq0Y
 hZK8Q9B0viTJzwDXLRuaOCEgAInnpeoE4D9VPrwH+1IxkR3r3oXf/pfh3p7Uj96N9cmg
 MHtw==
X-Gm-Message-State: AOJu0YzahZEVxkMOlpJvoAwB8H1OgRJraFcjncUBtB5Ob83QG0ITvwvR
 97tXKarNSkBSO/LJceEUnB/vbRgi8WRkuPP7ge4UGMKJIalGs8eniQgMlC5CXDMOWGbaWQx1Pad
 mzZk=
X-Google-Smtp-Source: AGHT+IFrKV0dmy055fe5z6nAnHO2APu12/cRewQ73/CfR2Ww3qBpulx5IG0HvLe/I2r0OapZcKFUCA==
X-Received: by 2002:a50:cd9d:0:b0:579:1f36:603a with SMTP id
 4fb4d7f45d1cf-5791f366111mr604649a12.17.1716622064987; 
 Sat, 25 May 2024 00:27:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-24-92-33.retail.telecomitalia.it. [79.24.92.33])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5785234a7efsm2860054a12.4.2024.05.25.00.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 May 2024 00:27:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 25 May 2024 09:27:33 +0200
Message-ID: <20240525072733.102766-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716622065; x=1717226865;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XJz6Db84F6Dvo0D1p0UZhGlorwgWph2QZtUJ5KLkuzU=;
 b=OhLcXCyQTDc7xVsb6LvVB62F6gBmHU6e56oloqhnUDCqsIFGuFXvrznIIqDtcEjZ4D
 1Yx6Q8eNIZSI2ywNV8G8BoEbGUJ1RaIvDh1QLlcYqN1JBQ4xtCA0RSUqrSAm8oYQ0yo4
 Fv9s6ED5ez/LWG1s0TLCaS5Z6xd20UqZAj58I=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=OhLcXCyQ
Subject: [Buildroot] [PATCH 1/1] configs/at91sam9x5ek_dev_defconfig: fix
 Linux compilation error
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adapts the Linux commit 790756c7e0229 ("ARM: 8933/1: replace
Sun/Solaris style flag on section directive") to fix compilation errors.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...ce-Sun-Solaris-style-flag-on-section.patch | 71 +++++++++++++++++++
 configs/at91sam9x5ek_dev_defconfig            |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 board/atmel/at91sam9x5ek_dev/patches/linux/0001-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch

diff --git a/board/atmel/at91sam9x5ek_dev/patches/linux/0001-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch b/board/atmel/at91sam9x5ek_dev/patches/linux/0001-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
new file mode 100644
index 000000000000..8bc5919b0411
--- /dev/null
+++ b/board/atmel/at91sam9x5ek_dev/patches/linux/0001-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
@@ -0,0 +1,71 @@
+From 25d046fbe70400c709cb00855d7f18c6000d1325 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Fri, 24 May 2024 19:10:07 +0200
+Subject: [PATCH] ARM: 8933/1: replace Sun/Solaris style flag on section
+ directive
+
+The patch is an adaptation of Linux commit 790756c7e0229 ("ARM: 8933/1:
+replace Sun/Solaris style flag on section directive").
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: N/A [Buildroot specific]
+---
+ arch/arm/boot/compressed/head.S  | 2 +-
+ arch/arm/boot/compressed/piggy.S | 2 +-
+ arch/arm/mm/proc-arm920.S        | 2 +-
+ arch/arm/mm/proc-arm926.S        | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
+index e205bbbe2794..8527e7fa80c1 100644
+--- a/arch/arm/boot/compressed/head.S
++++ b/arch/arm/boot/compressed/head.S
+@@ -114,7 +114,7 @@
+ #endif
+ 		.endm
+ 
+-		.section ".start", #alloc, #execinstr
++		.section ".start", "ax"
+ /*
+  * sort out different calling conventions
+  */
+diff --git a/arch/arm/boot/compressed/piggy.S b/arch/arm/boot/compressed/piggy.S
+index 0284f84dcf38..27577644ee72 100644
+--- a/arch/arm/boot/compressed/piggy.S
++++ b/arch/arm/boot/compressed/piggy.S
+@@ -1,5 +1,5 @@
+ /* SPDX-License-Identifier: GPL-2.0 */
+-	.section .piggydata,#alloc
++	.section .piggydata, "a"
+ 	.globl	input_data
+ input_data:
+ 	.incbin	"arch/arm/boot/compressed/piggy_data"
+diff --git a/arch/arm/mm/proc-arm920.S b/arch/arm/mm/proc-arm920.S
+index 7a14bd4414c9..5d4319708362 100644
+--- a/arch/arm/mm/proc-arm920.S
++++ b/arch/arm/mm/proc-arm920.S
+@@ -448,7 +448,7 @@ arm920_crval:
+ 
+ 	.align
+ 
+-	.section ".proc.info.init", #alloc
++	.section ".proc.info.init", "a"
+ 
+ 	.type	__arm920_proc_info,#object
+ __arm920_proc_info:
+diff --git a/arch/arm/mm/proc-arm926.S b/arch/arm/mm/proc-arm926.S
+index fb827c633693..8cf78c608c42 100644
+--- a/arch/arm/mm/proc-arm926.S
++++ b/arch/arm/mm/proc-arm926.S
+@@ -474,7 +474,7 @@ arm926_crval:
+ 
+ 	.align
+ 
+-	.section ".proc.info.init", #alloc
++	.section ".proc.info.init", "a"
+ 
+ 	.type	__arm926_proc_info,#object
+ __arm926_proc_info:
+-- 
+2.43.0
+
diff --git a/configs/at91sam9x5ek_dev_defconfig b/configs/at91sam9x5ek_dev_defconfig
index 824aa8b1f7f3..bc034019b441 100644
--- a/configs/at91sam9x5ek_dev_defconfig
+++ b/configs/at91sam9x5ek_dev_defconfig
@@ -8,6 +8,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 # System Configuration
+BR2_GLOBAL_PATCH_DIR="board/atmel/at91sam9x5ek_dev/patches"
 # Needed for usb-utils
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
