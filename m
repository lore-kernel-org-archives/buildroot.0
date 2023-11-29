Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369D3C4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 17:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA4F782317;
	Wed, 29 Nov 2023 17:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA4F782317
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e5Bc979ZopL2; Wed, 29 Nov 2023 17:27:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05139814B7;
	Wed, 29 Nov 2023 17:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05139814B7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C2A831BF31E
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8A5B817FD
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:26:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8A5B817FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x9rmxrUzWnwG for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 17:26:40 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10B2681517
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 17:26:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10B2681517
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50bc7706520so66930e87.3
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 09:26:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701278797; x=1701883597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TC0btN1ZlJxOIytvbk+pOL2AoNoMjK95Ijq++Tnr/Y8=;
 b=gWRGgv+IMnS53jxjFg0lqi298io4FjnJloK1AUXYJJmjd9Wv4h92iwFhwBgjAMlHG8
 zSc1126gPgai8jDdTn+EYnakdXkPm1uYaKrkbpXY6h010amNNAlrDQM0BbVyVEKcni2d
 +9am95/5GBrSMUvj+q94Z/nhYHdEZO8/gPqokiMQQBvdIqU5fXM5AvLO/GibMgDu/APQ
 /dBuchFUCNcqASaBrnn6s9EQpQtBHIBnZ/DkhiOJZNfIMfBSDTw6HYDURGU0aAtRraoL
 2wcrscIaGiOn0WM5TwGT7qLIwZA2+2sX0Rlq6VmaZcffSHp22mp6cOUlh06jjYrVQE7s
 WI9Q==
X-Gm-Message-State: AOJu0Yy1OruyExqsZYa8sWzy2p3s+rGGAGRAb8w0KwUkDItdbQ1NnwNM
 YuH8sK+7TR+4Q3kPA5mI5XmkpAbM6xMiDEsFIil82Q==
X-Google-Smtp-Source: AGHT+IFYx8/Mr1MnH1lZ90YSdG4ckrVtfVlqj34+x3U3r2rKHoka6B/m6coq2tMzJ78OoD1h/BL+iA==
X-Received: by 2002:a05:6512:2211:b0:50b:c88d:e861 with SMTP id
 h17-20020a056512221100b0050bc88de861mr1328828lfu.54.1701278797265; 
 Wed, 29 Nov 2023 09:26:37 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-244-100-54.retail.telecomitalia.it. [95.244.100.54])
 by smtp.gmail.com with ESMTPSA id
 dv19-20020a170906b81300b009a9fbeb15f2sm8104620ejb.62.2023.11.29.09.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 09:26:36 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 18:26:05 +0100
Message-ID: <20231129172615.1683565-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
References: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701278797; x=1701883597;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TC0btN1ZlJxOIytvbk+pOL2AoNoMjK95Ijq++Tnr/Y8=;
 b=BmseSXUUU81Wc+U3w49i1BTL59ta/JXNv7o51pvGVz8NoWSCBIQx8CK7CiM29lqayV
 D+RjE2PaZU0upTzaKl8hruRCuwKdOdBLP2Y9n3QDsN1/mZ0SfbTX+0wIRfXLxrCpmZsu
 w9U0V8cM7x1FvN1eKj2E797I69nujx/uqteGo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=BmseSXUU
Subject: [Buildroot] [PATCH 01/11] boot/ti-k3-core-secdev: new package
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a security development package containing tools for
High-Security(HS) TI K3 platform devices.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS                                    |  1 +
 boot/Config.in                                |  1 +
 boot/ti-k3-core-secdev/Config.in              |  9 +++++++++
 boot/ti-k3-core-secdev/ti-k3-core-secdev.hash |  3 +++
 boot/ti-k3-core-secdev/ti-k3-core-secdev.mk   | 19 +++++++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 boot/ti-k3-core-secdev/Config.in
 create mode 100644 boot/ti-k3-core-secdev/ti-k3-core-secdev.hash
 create mode 100644 boot/ti-k3-core-secdev/ti-k3-core-secdev.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f26e9bc81e2..c3ca54a89514 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -754,6 +754,7 @@ F:	package/xinetd/
 N:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
 F:	board/bsh/
 F:	board/stmicroelectronics/stm32f769-disco/
+F:	boot/ti-k3-core-secdev/
 F:	configs/imx8mn_bsh_smm_s2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
 F:	configs/stm32f769_disco_sd_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index e5fdf7ad439e..18a7d268f95a 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -20,6 +20,7 @@ source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/ti-k3-boot-firmware/Config.in"
+source "boot/ti-k3-core-secdev/Config.in"
 source "boot/ti-k3-image-gen/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
diff --git a/boot/ti-k3-core-secdev/Config.in b/boot/ti-k3-core-secdev/Config.in
new file mode 100644
index 000000000000..1749b7ab5fd9
--- /dev/null
+++ b/boot/ti-k3-core-secdev/Config.in
@@ -0,0 +1,9 @@
+config BR2_TARGET_TI_K3_CORE_SECDEV
+	bool "ti-k3-core-secdev"
+	depends on BR2_aarch64
+	help
+	  This package downloads and installs development tools for
+	  High-Security(HS) TI K3 platforms (which include AM62x,
+	  AM64x, AM65x and more).
+
+	  https://git.ti.com/cgit/security-development-tools/core-secdev-k3/
diff --git a/boot/ti-k3-core-secdev/ti-k3-core-secdev.hash b/boot/ti-k3-core-secdev/ti-k3-core-secdev.hash
new file mode 100644
index 000000000000..0460cff6c59f
--- /dev/null
+++ b/boot/ti-k3-core-secdev/ti-k3-core-secdev.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  b6d3bca0d561d055c6869c5564b06f2fb1b9f67e4ef180c2baf8a14a6a6afa06  core-secdev-k3-08.06.00.007.tar.xz
+sha256  3e5cf4f5ab9f0333f46cd68fabede3f21e55de1a9e3c6ad673f241f4514d8369  k3-secdev-0.2-manifest.html
diff --git a/boot/ti-k3-core-secdev/ti-k3-core-secdev.mk b/boot/ti-k3-core-secdev/ti-k3-core-secdev.mk
new file mode 100644
index 000000000000..0127e6503d4d
--- /dev/null
+++ b/boot/ti-k3-core-secdev/ti-k3-core-secdev.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# ti-k3-core-secdev
+#
+################################################################################
+
+TI_K3_CORE_SECDEV_VERSION = 08.06.00.007
+TI_K3_CORE_SECDEV_SITE = https://git.ti.com/cgit/security-development-tools/core-secdev-k3/snapshot
+TI_K3_CORE_SECDEV_SOURCE = core-secdev-k3-$(TI_K3_CORE_SECDEV_VERSION).tar.xz
+TI_K3_CORE_SECDEV_INSTALL_IMAGES = YES
+TI_K3_CORE_SECDEV_LICENSE = TI Text File, Apache-2.0
+TI_K3_CORE_SECDEV_LICENSE_FILES = k3-secdev-0.2-manifest.html
+
+define TI_K3_CORE_SECDEV_INSTALL_IMAGES_CMDS
+	cp -dpfr $(@D)/keys $(BINARIES_DIR)/
+	cp -dpfr $(@D)/scripts $(BINARIES_DIR)/
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
