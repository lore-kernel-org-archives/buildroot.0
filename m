Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D39C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 19:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C5A7610AF;
	Wed, 23 Nov 2022 19:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C5A7610AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBVJ6XGStSb0; Wed, 23 Nov 2022 19:56:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86162610D5;
	Wed, 23 Nov 2022 19:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86162610D5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C9CF1BF314
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3213F60BBD
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3213F60BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KwF-PQ1LGUb6 for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 19:53:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33A1261095
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33A1261095
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 19:53:32 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id d6so4071531pll.7
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 11:53:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wx5EczSbRaZDOETM3gnSPIYaqZ+/UC/Q9h1Xs1WZeQM=;
 b=hZ069XrILPzlCxgvso3vSXxNRCk1HDCr4unEJubkdVgyLz09qY0xvjgyNf3WcbpQeN
 4meivWmVi3Bz5ZQl0foGt5ElwehzSDI+/tJN6CeBhcmLEj9+lUEyHacFRekK2pFyKZMd
 f9VOD7PYuackezG/8xUAj1aY5MF3NFxf8uUnWW4gtjzDtW8EFM9n23VnmMLmowlXcEqk
 YUaR5XZbRTIje9/aSRbE/jk+naOH2yWXJcSE+N0GzMQyZdch8dMkyQ6zClws1HGevdGM
 QOnrcZpKDucS0DpVcJk7uJRfuvz7QcS+w2lCgE8U33tDKjGRcNCXunXf0VBpcxs+G3v2
 BKKg==
X-Gm-Message-State: ANoB5pm7clY0nF+kRrjNexbOggPek1xGadp3wt32+T86T/7XMMBjYM1s
 9eLuMvuZ16PPyGPi92cH7A/ZoWZu6N4MFg==
X-Google-Smtp-Source: AA0mqf5bVp+b+79u7yOVUtB1Ci3xkOzulHv2sT7ceAQYqk8cT69QksxOrRhuFvQ5TyvAzSmPHRtvqQ==
X-Received: by 2002:a17:90b:48cf:b0:205:e1af:68d1 with SMTP id
 li15-20020a17090b48cf00b00205e1af68d1mr37688537pjb.121.1669233211239; 
 Wed, 23 Nov 2022 11:53:31 -0800 (PST)
Received: from chris-jammy.lan ([136.52.75.52])
 by smtp.googlemail.com with ESMTPSA id
 y129-20020a626487000000b005745a586badsm1818282pfb.218.2022.11.23.11.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 11:53:30 -0800 (PST)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 11:53:04 -0800
Message-Id: <20221123195304.1582783-14-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
References: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wx5EczSbRaZDOETM3gnSPIYaqZ+/UC/Q9h1Xs1WZeQM=;
 b=ePvmDfLyKofV88qlNSDBI+EfbAb0bvYUCZ8Lpem8ndy95JRisv+g8fepX5YTJ432sw
 S2gwe63CInQ5BPIh2L6xonEcb6QGWgfA9HVszyRPWt8gO8zOL5DEFY+iVUaMyYfAi1Kq
 r+DT2bl/D3IVp2+n8awyrUS2RpnntHKOL12Co=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=ePvmDfLy
Subject: [Buildroot] [PATCH 7/7]
 package/freescale-imx/imx-vpu-hantro-daemon: new package
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- i.MX Hantro V4L2 Daemon. Provides the vsidaemon, which is needed for
V4L2 nodes to work.
- To match NXP 5.15.52-2.1.0 release.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 package/freescale-imx/Config.in               |  1 +
 .../imx-vpu-hantro-daemon/Config.in           | 17 +++++++++
 .../imx-vpu-hantro-daemon.hash                |  3 ++
 .../imx-vpu-hantro-daemon.mk                  | 35 +++++++++++++++++++
 4 files changed, 56 insertions(+)
 create mode 100644 package/freescale-imx/imx-vpu-hantro-daemon/Config.in
 create mode 100644 package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
 create mode 100644 package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 4a4237fb42..13d611b696 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -115,6 +115,7 @@ source "package/freescale-imx/imx-vpuwrap/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
 source "package/freescale-imx/imx-sc-firmware/Config.in"
 source "package/freescale-imx/imx-seco/Config.in"
+source "package/freescale-imx/imx-vpu-hantro-daemon/Config.in"
 source "package/freescale-imx/imx-vpu-hantro-vc/Config.in"
 if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
 source "package/freescale-imx/gpu-amd-bin-mx51/Config.in"
diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/Config.in b/package/freescale-imx/imx-vpu-hantro-daemon/Config.in
new file mode 100644
index 0000000000..663ed4346b
--- /dev/null
+++ b/package/freescale-imx/imx-vpu-hantro-daemon/Config.in
@@ -0,0 +1,17 @@
+comment "imx-vpu-hantro-daemon needs an i.MX-specific Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+comment "imx-vpu-hantro-daemon needs an i.MX platform with Hantro VPU"
+	depends on BR2_LINUX_KERNEL
+	depends on !BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
+
+config BR2_PACKAGE_IMX_VPU_HANTRO_DAEMON
+	bool "imx-vpu-hantro-daemon"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
+	select BR2_PACKAGE_IMX_VPU_HANTRO
+	select BR2_PACKAGE_IMX_VPU_HANTRO_VC if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
+	help
+	  i.MX Hantro V4L2 Daemon specific for the NXP i.MX SoC
+	  integrating a Hantro Video Processing Unit (VPU) such as the
+	  i.MX8MQ/i.MX8MM/i.MX8MP.
diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
new file mode 100644
index 0000000000..e952491a60
--- /dev/null
+++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  83ba2798564702d74ab65f6238f95f59247d983b846de1de4c19bdfaf6dabeb8  imx-vpu-hantro-daemon-1.1.4.tar.gz
+sha256  bb645f02b260955f333348100e40af76253e2cd8b116bac047230439dd53ec5a  LICENSE.txt
diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
new file mode 100644
index 0000000000..bf9088b065
--- /dev/null
+++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# imx-vpu-hantro-daemon
+#
+################################################################################
+
+IMX_VPU_HANTRO_DAEMON_VERSION = 1.1.4
+IMX_VPU_HANTRO_DAEMON_SITE = $(FREESCALE_IMX_SITE)
+IMX_VPU_HANTRO_DAEMON_SOURCE = imx-vpu-hantro-daemon-$(IMX_VPU_HANTRO_DAEMON_VERSION).tar.gz
+IMX_VPU_HANTRO_DAEMON_LICENSE = NXP Semiconductor Software License Agreement
+IMX_VPU_HANTRO_DAEMON_LICENSE_FILES = LICENSE.txt
+IMX_VPU_HANTRO_DAEMON_REDISTRIBUTE = NO
+IMX_VPU_HANTRO_DAEMON_DEPENDENCIES = imx-vpu-hantro linux
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP),y)
+IMX_VPU_HANTRO_DAEMON_DEPENDENCIES += imx-vpu-hantro-vc
+endif
+
+IMX_VPU_HANTRO_DAEMON_MAKE_ENV = \
+	$(TARGET_MAKE_ENV) \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	SDKTARGETSYSROOT=$(STAGING_DIR) \
+	LINUX_KERNEL_ROOT=$(LINUX_DIR) \
+	CTRLSW_HDRPATH="$(STAGING_DIR)/usr/include" \
+	PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM)
+
+define IMX_VPU_HANTRO_DAEMON_BUILD_CMDS
+	$(MAKE) -C $(@D) $(IMX_VPU_HANTRO_DAEMON_MAKE_ENV)
+endef
+
+define IMX_VPU_HANTRO_DAEMON_INSTALL_TARGET_CMDS
+	$(IMX_VPU_HANTRO_DAEMON_MAKE_ENV) $(MAKE) -C $(@D) \
+		DEST_DIR=$(TARGET_DIR) libdir=/usr/lib install
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
