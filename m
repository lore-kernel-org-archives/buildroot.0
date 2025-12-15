Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50256D5B873
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 22:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C6A940B06;
	Mon, 15 Dec 2025 22:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r3KAYmuVIfOo; Mon, 15 Dec 2025 22:50:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27FDC40B1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765839007;
	bh=dxy4PTBIS4YgcugyG5NgrSTFfFawXLfHimDkQVH3/tE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mWz7OJGE+zl8Yh/RZfxgshw2oQe4YoiB0xeEWWcagzb81c8rjY9NOwg69r7JnwmoO
	 BFVET7KouoE2WvUwHSs2UHqnN3zWfcqh6ZpF4uiLmDsS9ikwn93rnjociGAhW0ib7w
	 z+pcmztIztMmkfqDwpxj/hxWmL5jkDOywUlx90hY035K3OtRBrreHjA0Eg+HjKOEuh
	 a38QNsvpu7Hlh0h+/jxZDfJJfVLSn8H5oh1utCe1NkCBLWD2WILu30p6iWdEkQr8yK
	 CHggtVPMVTKAiA0KF/3XtXZASeIU3PaeD867z4V/4Mjn6/uaWvBWL9ju+dVUReBSxZ
	 ujTkZulL8195Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27FDC40B1A;
	Mon, 15 Dec 2025 22:50:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02390151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F05A960F2D
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IbfuJgwlSbOp for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 22:50:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E399260F25
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E399260F25
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E399260F25
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 306561A21C7
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F159960664;
 Mon, 15 Dec 2025 22:50:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8DDFE11942979; Mon, 15 Dec 2025 23:50:01 +0100 (CET)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 15 Dec 2025 23:49:35 +0100
Message-ID: <20251215224952.1253359-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
References: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765839002; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=VbpC2So0VMQmi6Iatn3WhisWND4V3W25ExLWGLCWiYI=;
 b=GPxzC38x7fI850WjFfK3tPgvsUfFnXQgorUlj1kMTTSY6WixiDEDO7B49ZL9owbEuYrSkW
 JKzMOFvfrBKt+kK4JirX7jVL2iQi/pbgUDKjqGaruNPnrgPyoZRCLQm6xiL4YeYT1DhGe2
 XwzOA8kEWmYIQJw4d47/ExbsKaFFH0wwz8spuUT9hTTIqAvq0taqfIKZoAMvlsiSo4QA15
 1qNyjSuzHyhysT16iqBARniwFTygJd2+x7bo3aF4dTy441Cqe/BpIhXhUvKe8y+ZANbeDv
 O4zV3MqQS7vaEPMz5AXRoEacSuKsmB1cXG53yImMcvrRcquO+ytA2vZ+aDmAPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=GPxzC38x
Subject: [Buildroot] [PATCH 03/13] package/ffmpeg: drop rpi-userland support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As we're about to remove the rpi-userland package, drop support for it
from package/ffmpeg.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ffmpeg/ffmpeg.mk | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 4c841d7a94..cee34eba9e 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -52,7 +52,10 @@ FFMPEG_CONF_OPTS = \
 	--disable-libilbc \
 	--disable-libvo-amrwbenc \
 	--disable-symver \
-	--disable-doc
+	--disable-doc \
+	--disable-mmal \
+	--disable-omx \
+	--disable-omx-rpi
 
 FFMPEG_DEPENDENCIES += host-pkgconf
 
@@ -284,19 +287,6 @@ else
 FFMPEG_CONF_OPTS += --disable-vdpau
 endif
 
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-FFMPEG_CONF_OPTS += --enable-omx --enable-omx-rpi \
-	--extra-cflags=-I$(STAGING_DIR)/usr/include/IL
-FFMPEG_DEPENDENCIES += rpi-userland
-ifeq ($(BR2_arm),y)
-FFMPEG_CONF_OPTS += --enable-mmal
-else
-FFMPEG_CONF_OPTS += --disable-mmal
-endif
-else
-FFMPEG_CONF_OPTS += --disable-mmal --disable-omx --disable-omx-rpi
-endif
-
 # To avoid a circular dependency only use opencv if opencv itself does
 # not depend on ffmpeg.
 ifeq ($(BR2_PACKAGE_OPENCV3_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV3_WITH_FFMPEG),yx)
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
