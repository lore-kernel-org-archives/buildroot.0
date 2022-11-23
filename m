Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62886C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 19:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8481417C6;
	Wed, 23 Nov 2022 19:55:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8481417C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Uc_LkHGuze5; Wed, 23 Nov 2022 19:55:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF386417C0;
	Wed, 23 Nov 2022 19:55:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF386417C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A7F281BF314
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90A4840647
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90A4840647
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nxbsc4G9fTKK for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 19:53:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0E5D40610
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0E5D40610
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 19:53:23 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id f3so17655212pgc.2
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 11:53:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wx5EczSbRaZDOETM3gnSPIYaqZ+/UC/Q9h1Xs1WZeQM=;
 b=sH6yhKrDpdR217S1uSKLPG8EwdMrBitpWIh7gUlXrbBplEK0P4ue+g+wmeVOFkB09x
 lrFQPbKUFAZfufPl/nveoKpCO/mg+YAwGJiHUAIh/mJhe4IeD0PQH4y+ShZ/MAiOoHCk
 7/4aiDdnc8w7rUxoMRa+zLbpWtottz0NMXFZ215q4Y2CDqE7nD5jrYNVXbYRAgvo2o0P
 A1tY5iQUlp3xu+hfrqlqb6Y7kbw+/YNx3uZSWo3d0PfANGQfJoCJqou29jDjkOZU8jqb
 ZKO19rFvsVAuQCZV4ZEsqCzQKd4fkzgl/kbw+VTNhk5QHGFKEaFmlsmztGp6k4r4pwao
 0wDA==
X-Gm-Message-State: ANoB5pk/HFwsxqRiI4LY8aGIgwQNJ/yxKtIRgNAdKsWu1hPZ9vWThhRd
 69SArD3+ox/lY420da1U4NxUDEiZX3QdOA==
X-Google-Smtp-Source: AA0mqf54o0+3Z3J7C8Pr9TsvVM7Bd9H7Qy/Onm0ej/BGPV3eNVu1Dl59/oazwyoRC49/gcwiRvTR6w==
X-Received: by 2002:a63:200a:0:b0:477:78c7:c45e with SMTP id
 g10-20020a63200a000000b0047778c7c45emr8769680pgg.169.1669233202720; 
 Wed, 23 Nov 2022 11:53:22 -0800 (PST)
Received: from chris-jammy.lan ([136.52.75.52])
 by smtp.googlemail.com with ESMTPSA id
 y129-20020a626487000000b005745a586badsm1818282pfb.218.2022.11.23.11.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 11:53:22 -0800 (PST)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 11:52:57 -0800
Message-Id: <20221123195304.1582783-7-chris.dimich@boundarydevices.com>
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
 b=O0l81Qcbz05setw5yG1KAM0yR4vNuTbZW3B25pzQcxRjQs3TbY4sCR16JnfqCGpi9d
 zwkRuNlZHXYKEPBZiRMPjeKrWykFZbYf3yjUeUL5EaN0Vvr5KxU2m+Dfaoa/4r5G1VNB
 QBO2rAKsDcSYW+UKGGomtxs5fRjazuw9i0iAA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=O0l81Qcb
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
