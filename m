Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C64E8FDAC
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 17:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 973F5812D9;
	Fri, 26 Dec 2025 17:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9fEMiJkfT5vJ; Fri, 26 Dec 2025 17:15:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0D0C812C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766769310;
	bh=I9/GTtn0FBUc6Ltcbjqv234haSuudnGPiJOHJ1Bkcjg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S8j5Ay1lQ41tUrWdPi/8LMf8N3Ent3lLa2yecB/Oz2KmZkpcK1Nbk2xfnwZ7Sw0xi
	 EDRXQRBZB8PlFDqwuY0At/lU4MivLPS6GCYnMVrxXMOLaFZDrQTR6KYesjHk0uxpqz
	 ZX+h6nogpHfjIlq7V8RQ0xF/iwmERsc92a6XEVWUIUNSR3Mi886VB3YBeyCMrvTm0/
	 5mPQl6ks0i2cLK321ojED/izNEgkcWG+ytT0mdijD+0naEyak+DNNrjLq27zVVhDIa
	 jLZfzFPdzdPbWnw5IR1UOKQjT8HZBuBopIYSwyFgzE5UwhsuJH5QeX2yGncDd7bor6
	 6DXDwZTZ9htDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0D0C812C4;
	Fri, 26 Dec 2025 17:15:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B3B56EC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 999DC6083C
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id siMshKWmvyAE for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 17:15:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8AC4260830
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AC4260830
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8AC4260830
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:15:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 5587AC1D188;
 Fri, 26 Dec 2025 17:14:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 96B3A606E4;
 Fri, 26 Dec 2025 17:15:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CB22E11978070; Fri, 26 Dec 2025 18:15:02 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Fri, 26 Dec 2025 18:14:47 +0100
Message-ID: <20251226171448.1213664-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251226171448.1213664-1-thomas.petazzoni@bootlin.com>
References: <20251226171448.1213664-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766769304; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=0rMzZAAhVvk6w46px6xna8nc6IBWDvmYJhcW1sOFW84=;
 b=M5jhfNCE00Tt0CT507F4rL5s5NeC8Z56mzYLIfhrlN+E2E2yMote4vvG3AxVZcLSiZC/LM
 zwvvHWNqt1hoBDOGUDoH0yut0z47049eCKhS8xvBY+ZkmowQM7MqD3I359IuCyUYyZi2aw
 B04QpskGaYs6E7eg+vgXkT+uxSQa/qfQTeFV46CsZ7NRFkWL4TcChQarayf7i7oZbqXQ9v
 fbmWwyNY0xF17x6jrgzA8OgGi/LxljFqSeK9TiEx7gTXl2tk+ntbl/zCWElS4Kygqo1BrF
 cT+Vl6ayZZBbVkQkPcbX1Nw6dFrhGVHduhsexh4Z8b2SqK4LP5aBl2MQSkgQig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=M5jhfNCE
Subject: [Buildroot] [PATCH 3/3] package/opencv3: drop support for ffmpeg
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

opencv3's code is not compatible with newer versions of ffmpeg, and
opencv3 is no longer maintained, so we have no choice but to disable
its ffmpeg support.

Fixes:

  https://autobuild.buildroot.net/results/9ae3911583cccb6362f33cd82e5eaafb059fdc76/

It's not clear which ffmpeg version bump broken the build exactly, but
this issue is definitely present in 2025.02.x as the following
defconfig fails to build in a similar way on 2025.02.x:

 BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_PACKAGE_FFMPEG_NONFREE=y
 # BR2_PACKAGE_FFMPEG_FFMPEG is not set
 # BR2_PACKAGE_FFMPEG_INDEVS is not set
 # BR2_PACKAGE_FFMPEG_OUTDEVS is not set
 BR2_PACKAGE_OPENCV3=y
 BR2_PACKAGE_OPENCV3_LIB_VIDEOIO=y
 BR2_PACKAGE_OPENCV3_BUILD_PERF_TESTS=y
 BR2_PACKAGE_OPENCV3_WITH_FFMPEG=y
 BR2_PACKAGE_OPENCV3_INSTALL_DATA=y

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy           | 7 +++++++
 package/ffmpeg/ffmpeg.mk   | 6 +++---
 package/opencv3/Config.in  | 9 ---------
 package/opencv3/opencv3.mk | 8 +-------
 4 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 03e0673fba..51f77ad312 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_OPENCV3_WITH_FFMPEG
+	bool "opencv3 ffmpeg support removed"
+	select BR2_LEGACY
+	help
+	  Support for OpenCV 3 ffmpeg support has been removed as it
+	  was no longer compatible with recent versions of ffmpeg.
+
 config BR2_PACKAGE_OPENCV3_WITH_PROTOBUF
 	bool "opencv3 protobuf support removed"
 	select BR2_LEGACY
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index cee34eba9e..f3b76f69b5 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -287,11 +287,11 @@ else
 FFMPEG_CONF_OPTS += --disable-vdpau
 endif
 
-# To avoid a circular dependency only use opencv if opencv itself does
-# not depend on ffmpeg.
-ifeq ($(BR2_PACKAGE_OPENCV3_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV3_WITH_FFMPEG),yx)
+ifeq ($(BR2_PACKAGE_OPENCV3_LIB_IMGPROC),y)
 FFMPEG_CONF_OPTS += --enable-libopencv
 FFMPEG_DEPENDENCIES += opencv3
+# To avoid a circular dependency only use opencv if opencv itself does
+# not depend on ffmpeg.
 else ifeq ($(BR2_PACKAGE_OPENCV4_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV4_WITH_FFMPEG),yx)
 FFMPEG_CONF_OPTS += --enable-libopencv \
 	--extra-cflags=-I$(STAGING_DIR)/usr/include/opencv4
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index 6c4d4e9c8a..ad8a075729 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -232,15 +232,6 @@ config BR2_PACKAGE_OPENCV3_BUILD_PERF_TESTS
 
 comment "3rd party support"
 
-config BR2_PACKAGE_OPENCV3_WITH_FFMPEG
-	bool "ffmpeg support"
-	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	select BR2_PACKAGE_BZIP2
-	select BR2_PACKAGE_FFMPEG
-	select BR2_PACKAGE_FFMPEG_SWSCALE
-	help
-	  Use ffmpeg from the target system.
-
 config BR2_PACKAGE_OPENCV3_WITH_GSTREAMER1
 	bool "gstreamer-1.x"
 	depends on BR2_USE_MMU # gstreamer1 -> libglib2
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 3fcf2543a7..9e488bed0c 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -212,6 +212,7 @@ OPENCV3_CONF_OPTS += \
 	-DWITH_1394=OFF \
 	-DWITH_CLP=OFF \
 	-DWITH_EIGEN=OFF \
+	-DWITH_FFMPEG=OFF \
 	-DWITH_GDAL=OFF \
 	-DWITH_GPHOTO2=OFF \
 	-DWITH_GSTREAMER_0_10=OFF \
@@ -232,13 +233,6 @@ OPENCV3_CONF_OPTS += \
 
 OPENCV3_DEPENDENCIES += host-pkgconf zlib
 
-ifeq ($(BR2_PACKAGE_OPENCV3_WITH_FFMPEG),y)
-OPENCV3_CONF_OPTS += -DWITH_FFMPEG=ON
-OPENCV3_DEPENDENCIES += ffmpeg bzip2
-else
-OPENCV3_CONF_OPTS += -DWITH_FFMPEG=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_OPENCV3_WITH_GSTREAMER1),y)
 OPENCV3_CONF_OPTS += -DWITH_GSTREAMER=ON
 OPENCV3_DEPENDENCIES += gstreamer1 gst1-plugins-base
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
