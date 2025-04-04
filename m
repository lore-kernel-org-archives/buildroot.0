Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E80C369A1
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 16:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0534381FF6;
	Fri,  4 Apr 2025 16:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cdCLV80CMA3n; Fri,  4 Apr 2025 16:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36A948483C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36A948483C;
	Fri,  4 Apr 2025 16:48:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44DC1117
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B0AD40C1A
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h8DJZTTd-F3E for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 16:48:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.157.188.11;
 helo=smtp-bc0b.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 78AB94200A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78AB94200A
Received: from smtp-bc0b.mail.infomaniak.ch (smtp-bc0b.mail.infomaniak.ch
 [45.157.188.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78AB94200A
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:48:16 +0000 (UTC)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:7:10:40ca:feff:fe05:1])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZTl0Y0QgMzxW4;
 Fri,  4 Apr 2025 18:48:13 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4ZTl0X4NwTzkjb; Fri,  4 Apr 2025 18:48:12 +0200 (CEST)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Fri, 04 Apr 2025 18:47:40 +0200
MIME-Version: 1.0
Message-Id: <20250404-libcamera-0-5-0-v1-9-e2ca9d029aeb@cherry.de>
References: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
In-Reply-To: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
To: buildroot@buildroot.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH 9/9] package/libcamera: add support for PiSP
 pipeline
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

From: Quentin Schulz <quentin.schulz@cherry.de>

v0.5.0 brought support for the ISP found on the Raspberry Pi 5, named
PiSP.

Let's add knobs for it. Note that it has a hard dependency on librt.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 package/libcamera/Config.in    | 9 +++++++++
 package/libcamera/libcamera.mk | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 92361bbade9bb6f1cf1d152aa27d861470dd9115..9f5427e0e22e8df2d9d921397bb72e274616b5ec 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -67,6 +67,15 @@ config BR2_PACKAGE_LIBCAMERA_PIPELINE_MALI_C55
 	help
 	  Pipeline for Arm Mali-C55 ISP.
 
+config BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_PISP
+	bool "rpi/pisp pipeline"
+	depends on BR2_arm || BR2_aarch64
+	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
+	select BR2_PACKAGE_LIBPISP
+	help
+	  Pipeline for Raspberry Pi devices with PiSP (Raspberry Pi 5).
+	  Requires librt.
+
 config BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4
 	bool "rpi/vc4 pipeline"
 	depends on BR2_arm || BR2_aarch64
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index d7324240154944e60ec546bf1968e9723b79c041..6877662bdf02df1c7f8ff37039b3096e96e52481 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -58,6 +58,10 @@ LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IMX8_ISI) += imx8-isi
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3) += ipu3
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_MALI_C55) += mali-c55
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1) += rkisp1
+ifeq ($(BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_PISP),y)
+LIBCAMERA_PIPELINES-y += rpi/pisp
+LIBCAMERA_DEPENDENCIES += libpisp
+endif
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4) += rpi/vc4
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_SIMPLE) += simple
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_UVCVIDEO) += uvcvideo

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
