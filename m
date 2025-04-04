Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B6EC36010
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 16:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70C9F40C4C;
	Fri,  4 Apr 2025 16:48:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lb2hXU5zloJH; Fri,  4 Apr 2025 16:48:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95E3340D58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95E3340D58;
	Fri,  4 Apr 2025 16:48:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D9AF5117
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9CA684835
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rC0zvNBE8wSv for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 16:48:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.157.188.11;
 helo=smtp-bc0b.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1A05984822
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A05984822
Received: from smtp-bc0b.mail.infomaniak.ch (smtp-bc0b.mail.infomaniak.ch
 [45.157.188.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A05984822
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 16:48:13 +0000 (UTC)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:7:10:40ca:feff:fe05:1])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZTl0T25tyzx9J;
 Fri,  4 Apr 2025 18:48:09 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4ZTl0S5wlDzhsl; Fri,  4 Apr 2025 18:48:08 +0200 (CEST)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Fri, 04 Apr 2025 18:47:32 +0200
MIME-Version: 1.0
Message-Id: <20250404-libcamera-0-5-0-v1-1-e2ca9d029aeb@cherry.de>
References: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
In-Reply-To: <20250404-libcamera-0-5-0-v1-0-e2ca9d029aeb@cherry.de>
To: buildroot@buildroot.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH 1/9] package/libcamera: remove dependency on
 boost for rpi/vc4 pipeline
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

Commit c1597f989654 ("ipa: raspberrypi: Use YamlParser to replace
dependency on boost"), part of the v0.0.1 release, removed the
dependency on boost, so let's remove it from the pipeline option and
dependency for Buildroot.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 package/libcamera/Config.in    | 2 --
 package/libcamera/libcamera.mk | 5 +----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 1df97edc41174a22c76a688b07390f5446eb598c..086a5b3758b9dbddf01170d39383fb0dacbc9186 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -63,8 +63,6 @@ config BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1
 config BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4
 	bool "rpi/vc4 pipeline"
 	depends on BR2_arm || BR2_aarch64
-	depends on BR2_USE_WCHAR # boost (already enforced for gnutls)
-	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
 	help
 	  Pipeline for Raspberry Pi devices.
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index b3132dc01658ed2fe9e5f780951f3152596dcfcf..0f52f08e39ab885a4989d337aec13fc3f88d654f 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -61,10 +61,7 @@ endif
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IMX8_ISI) += imx8-isi
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3) += ipu3
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1) += rkisp1
-ifeq ($(BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4),y)
-LIBCAMERA_PIPELINES-y += rpi/vc4
-LIBCAMERA_DEPENDENCIES += boost
-endif
+LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4) += rpi/vc4
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_SIMPLE) += simple
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_UVCVIDEO) += uvcvideo
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_VIMC) += vimc

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
