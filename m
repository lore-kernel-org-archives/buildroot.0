Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754C3C36010
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 16:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 354C1412D3;
	Fri,  4 Apr 2025 16:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id khlIg9bbge9r; Fri,  4 Apr 2025 16:55:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 611E241235
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 611E241235;
	Fri,  4 Apr 2025 16:55:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E6592117
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD304411F7
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MwTeGjny0Kzq for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 16:55:12 +0000 (UTC)
X-Greylist: delayed 420 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 04 Apr 2025 16:55:11 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E366410E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E366410E3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:7:10::190d;
 helo=smtp-190d.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
Received: from smtp-190d.mail.infomaniak.ch (smtp-190d.mail.infomaniak.ch
 [IPv6:2001:1600:7:10::190d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E366410E3
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:55:11 +0000 (UTC)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:7:10:40ca:feff:fe05:1])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZTl0W52J8zwgh;
 Fri,  4 Apr 2025 18:48:11 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4ZTl0W1fyPzkpY; Fri,  4 Apr 2025 18:48:11 +0200 (CEST)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Fri, 04 Apr 2025 18:47:37 +0200
MIME-Version: 1.0
Message-Id: <20250404-libcamera-0-5-0-v1-6-e2ca9d029aeb@cherry.de>
References: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
In-Reply-To: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
To: buildroot@buildroot.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH 6/9] package/libcamera: add support for Arm
 Mali-C55 ISP pipeline
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

Support was added in v0.4.0 so let's add the knobs for building the
pipeline.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 package/libcamera/Config.in    | 7 +++++++
 package/libcamera/libcamera.mk | 1 +
 2 files changed, 8 insertions(+)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 086a5b3758b9dbddf01170d39383fb0dacbc9186..92361bbade9bb6f1cf1d152aa27d861470dd9115 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -60,6 +60,13 @@ config BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1
 	help
 	  Pipeline for Rockchip ISP1.
 
+config BR2_PACKAGE_LIBCAMERA_PIPELINE_MALI_C55
+	bool "mali-c55 pipeline"
+	depends on BR2_arm || BR2_aarch64
+	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
+	help
+	  Pipeline for Arm Mali-C55 ISP.
+
 config BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4
 	bool "rpi/vc4 pipeline"
 	depends on BR2_arm || BR2_aarch64
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index b5b17a5c946490e9798073f51fc03e939a4c8dc1..449f66ee36b3d5f97780c1bb374a7c2ad9160c0b 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -58,6 +58,7 @@ endif
 
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IMX8_ISI) += imx8-isi
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3) += ipu3
+LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_MALI_C55) += mali-c55
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1) += rkisp1
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4) += rpi/vc4
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_SIMPLE) += simple

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
