Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA321C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:43:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B336D61163
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B336D61163
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=boundarydevices.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B9B360F52;
	Wed,  6 Oct 2021 20:43:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7DLFzop1s1jq; Wed,  6 Oct 2021 20:43:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCCD260F49;
	Wed,  6 Oct 2021 20:43:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9808F1BF34F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8811184025
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:42:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=boundarydevices.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qo3xlS7kzVUF for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 20:42:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D68D84042
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 20:42:05 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id c4so2475711pls.6
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 13:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=soYK79l/C99YRANbq/54S3k+auA1zAFutF09zGEW5gI=;
 b=ghJAYBi8l24O9x6XmW8x0BiT7SLudiyPdPSZVeniXS7rnXMfgmY4azFex1q2ziq0IM
 W7QuUetw5q3Emw4PEyifu0NqsyuO2uC6pPwJGF/eVxtYt5x8H5dKwIZGDx/9DHhsyHWL
 Yrq1ua22s1hfpFB8q2fXw+fJS8qjLi3/9gQDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=soYK79l/C99YRANbq/54S3k+auA1zAFutF09zGEW5gI=;
 b=4QK/+95VWR07R3b407az3Fh19Z4plOmW0RybZTHm1zMoblXW7KqMMUumAFwWXvTWiu
 Mxa2bShL9GL1IoGVUuoX+/joSusSqR07yYjy5SvAr3WIC3pnxXNXHSrcWKkLtBaE3j+7
 KGOIqdPKP07twrv4jQCw525fm0kpxNmiXHlofrLUjjMEHgP6a1JsU+8yeOsgDPAr3TnF
 NuH6VEbtlsQiVO7Ym+40FApiIwdEKP3ErMrt6WjkuP53p/7Ec5AaheIYpMHohDxMxnHK
 Jj5bUg1ZvHv2QGMNhoehp4Mt8C1X0ERrzJQXKp9AUo2aTdRiNNiDgqLJp0al7TUzDuR9
 tMVA==
X-Gm-Message-State: AOAM532u01/yOw/bRTcUZRgO/FxbcMSLar78civYmDMQOD4XJP7jWYun
 taXqUN8EuMTHmXL1ljVJNFA4V7XWcQrduWop
X-Google-Smtp-Source: ABdhPJzEI5Srt3Lj7SYWqEn9a5QQsnQVD35PGhYlvBs4uZDNbIOJe1PVEngpDeaCy15kLzWKbgRgHA==
X-Received: by 2002:a17:90b:1e01:: with SMTP id
 pg1mr305882pjb.81.1633552924484; 
 Wed, 06 Oct 2021 13:42:04 -0700 (PDT)
Received: from chrisubuntu.hollywoodparkca.com
 ([2600:8802:604:7300:1546:3656:4c77:10ff])
 by smtp.googlemail.com with ESMTPSA id g14sm3581308pjd.24.2021.10.06.13.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:42:04 -0700 (PDT)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 13:41:32 -0700
Message-Id: <20211006204135.2813745-9-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
References: <20211006204135.2813745-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 09/12] package/freescale-imx/basler-camera: add
 package
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Basler camera binary drivers.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 package/freescale-imx/Config.in               |  1 +
 package/freescale-imx/basler-camera/Config.in |  8 ++++++
 .../basler-camera/basler-camera.hash          |  4 +++
 .../basler-camera/basler-camera.mk            | 28 +++++++++++++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 package/freescale-imx/basler-camera/Config.in
 create mode 100644 package/freescale-imx/basler-camera/basler-camera.hash
 create mode 100644 package/freescale-imx/basler-camera/basler-camera.mk

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 0f0f5c50fd..6149e4bf13 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -118,6 +118,7 @@ source "package/freescale-imx/imx-seco/Config.in"
 source "package/freescale-imx/imx-vpu-hantro-vc/Config.in"
 source "package/freescale-imx/isp-vvcam-module/Config.in"
 source "package/freescale-imx/isp-imx/Config.in"
+source "package/freescale-imx/basler-camera/Config.in"
 if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
 source "package/freescale-imx/gpu-amd-bin-mx51/Config.in"
 source "package/freescale-imx/libz160/Config.in"
diff --git a/package/freescale-imx/basler-camera/Config.in b/package/freescale-imx/basler-camera/Config.in
new file mode 100644
index 0000000000..6458dd323f
--- /dev/null
+++ b/package/freescale-imx/basler-camera/Config.in
@@ -0,0 +1,8 @@
+comment "basler camera needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_BASLER_CAMERA
+	bool "Basler Camera Driver"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Basler camera binary drivers.
diff --git a/package/freescale-imx/basler-camera/basler-camera.hash b/package/freescale-imx/basler-camera/basler-camera.hash
new file mode 100644
index 0000000000..43980d2e24
--- /dev/null
+++ b/package/freescale-imx/basler-camera/basler-camera.hash
@@ -0,0 +1,4 @@
+# Locally computed:
+sha256  3f09f7a2de290b0580faee9e180a78a322144d316fbbbc80b8a36fb83ab538b1  basler-camera-4.2.2.13.0.bin
+sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
+sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
diff --git a/package/freescale-imx/basler-camera/basler-camera.mk b/package/freescale-imx/basler-camera/basler-camera.mk
new file mode 100644
index 0000000000..743edd5b95
--- /dev/null
+++ b/package/freescale-imx/basler-camera/basler-camera.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# basler-camera
+#
+################################################################################
+
+BASLER_CAMERA_VERSION = 4.2.2.13.0
+BASLER_CAMERA_SITE = $(FREESCALE_IMX_SITE)
+BASLER_CAMERA_SOURCE = basler-camera-$(BASLER_CAMERA_VERSION).bin
+BASLER_CAMERA_DEPENDENCIES = linux
+
+BASLER_CAMERA_LICENSE = NXP Semiconductor Software License Agreement
+BASLER_CAMERA_LICENSE_FILES = EULA COPYING
+BASLER_CAMERA_REDISTRIBUTE = NO
+
+define BASLER_CAMERA_EXTRACT_CMDS
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(BASLER_CAMERA_DL_DIR)/$(BASLER_CAMERA_SOURCE))
+endef
+
+define BASLER_CAMERA_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/opt/imx8-isp/bin
+	cp -r $(@D)/opt/imx8-isp/bin/* $(TARGET_DIR)/opt/imx8-isp/bin
+	ln -sf /opt/imx8-isp/bin/DAA3840_30MC_1080P.drv $(TARGET_DIR)/usr/lib64/DAA3840_30MC_1080P.drv
+	ln -sf /opt/imx8-isp/bin/DAA3840_30MC_4K.drv $(TARGET_DIR)/usr/lib64/DAA3840_30MC_4K.drv
+	cp -r $(@D)/usr/lib/* $(TARGET_DIR)/usr/lib/
+endef
+
+$(eval $(generic-package))
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
