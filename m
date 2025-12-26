Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775E0E8FDAD
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 17:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEB1960891;
	Fri, 26 Dec 2025 17:15:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JjMqu5hWAFLs; Fri, 26 Dec 2025 17:15:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 161AA6083C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766769308;
	bh=/tyxffh/1OUKxF4lHs/Pwh5oHR1eOpYJtftYY3YzRE4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OCR0sMhos65X0uIR/9wfTgyHK/Kr5XX5GVjP8z8zWCrj7yflAILDB9HRvOllW/fFK
	 Qj+vDfP+aTf4Katotfgn4qJQJC6PKkjh5I1WD+FqhaHqQ6GyZ4E1cXpCAHy3vpAlrM
	 CG9X6thga7oSElqxYZZDcxjwzISLLlMtUel3MoVFWFKzJhsmLiteT4P6eJFl05KqOe
	 HPUWQ4UxRXCSLy8yq2aIC8AP7bkhRULC9CmKxN944a5q70V0ZLCMY6vMNxmiDVI9t0
	 hrh0TH/V6hxTdH8c/rwRt1of3ec6rFkANtRHI+ywSW0LWthrsKo2V+tGxKsoNNQgtW
	 ONTYBYHFVlGzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 161AA6083C;
	Fri, 26 Dec 2025 17:15:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B728119
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18C6B81222
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PEJOmlrjz_YY for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 17:15:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 95F32812C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95F32812C4
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95F32812C4
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:15:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 2E6A7C1D187
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:14:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7573B606E4
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:15:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F36BA1197806F; Fri, 26 Dec 2025 18:15:01 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Dec 2025 18:14:46 +0100
Message-ID: <20251226171448.1213664-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251226171448.1213664-1-thomas.petazzoni@bootlin.com>
References: <20251226171448.1213664-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766769302; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=V1/LAF5LWHZ9bmPzm7jam5R/2gw1qqmk2dXrE+quYik=;
 b=KzJTLKLfXW74l2fwKgOd2E11sAwfQPSD6jKhOva7vQ6txNYEVhDx0En/OOgdUy+QkvIupO
 a9l7ndtjQz+2Vx1CYJKQ5wz6pQE/xNjQiAibo84yPWbbn6jMNoIkhb/HLOmGRe63gsTaVA
 1McoiOVD1Vlfv/q26GxdZtW9NUTC61nx5tmUWUwILyxFNwAnhUHhLdFaJKhWhC9kDiCtO6
 vIUsBTuumey7QC1mv4XTQ592XXHsDqUVlmoAny3toZUCids+KAS23hL6jMd/66yUYNFtYb
 lrKyq+z+a0nR8cmSXOFPqUIZDwiRa9ppkWHFNcJ2Phu4/zYsco9HL1vrPcsWZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=KzJTLKLf
Subject: [Buildroot] [PATCH 2/3] package/opencv3: drop support for protobuf
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

The protobuf support breaks the build, as protobuf includes
libabseil-cpp headers, which now require C++14. opencv3 doesn't have
any ENABLE_CXX14 option, so for the time being, disable protobuf
support until someone bothers enough to fix this up.

While we suspect a libabseil-cpp version bump to be responsible for
the issue, we are not 100% sure. However, the issue is definitely
present in Buildroot 2025.02.x, as it can be reproduced using the
following defconfig:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_OPENCV3=y
BR2_PACKAGE_OPENCV3_LIB_SHAPE=y
BR2_PACKAGE_OPENCV3_LIB_STITCHING=y
BR2_PACKAGE_OPENCV3_LIB_SUPERRES=y
BR2_PACKAGE_OPENCV3_LIB_TS=y
BR2_PACKAGE_OPENCV3_LIB_VIDEOSTAB=y
BR2_PACKAGE_OPENCV3_WITH_PROTOBUF=y

Fixes:

  https://autobuild.buildroot.net/results/39432e7746e6bc5224592a7d2f744ca992bd529a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy           |  7 +++++++
 package/opencv3/Config.in  | 12 ------------
 package/opencv3/opencv3.mk | 12 +-----------
 3 files changed, 8 insertions(+), 23 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7c598e0e68..03e0673fba 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_OPENCV3_WITH_PROTOBUF
+	bool "opencv3 protobuf support removed"
+	select BR2_LEGACY
+	help
+	  Support for OpenCV 3 protobuf support has been removed as it
+	  was no longer compatible with recent versions of protobuf.
+
 config BR2_PACKAGE_LIBDNET_PYTHON
 	bool "libdnet python module removed"
 	select BR2_LEGACY
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index c4c5d22a54..6c4d4e9c8a 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -278,18 +278,6 @@ config BR2_PACKAGE_OPENCV3_WITH_PNG
 	help
 	  Use shared libpng from the target system.
 
-config BR2_PACKAGE_OPENCV3_WITH_PROTOBUF
-	bool "protobuf support"
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
-	select BR2_PACKAGE_PROTOBUF
-	help
-	  Use shared protobuf from the target system.
-
-comment "protobuf support needs a toolchain w/ gcc >= 8"
-	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
-
 config BR2_PACKAGE_OPENCV3_WITH_TIFF
 	bool "tiff support"
 	select BR2_PACKAGE_TIFF
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 8a862a47b1..3fcf2543a7 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -223,6 +223,7 @@ OPENCV3_CONF_OPTS += \
 	-DWITH_OPENEXR=OFF \
 	-DWITH_OPENNI2=OFF \
 	-DWITH_OPENNI=OFF \
+	-DWITH_PROTOBUF=OFF \
 	-DWITH_UNICAP=OFF \
 	-DWITH_VA=OFF \
 	-DWITH_VA_INTEL=OFF \
@@ -282,17 +283,6 @@ else
 OPENCV3_CONF_OPTS += -DWITH_PNG=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV3_WITH_PROTOBUF),y)
-# protobuf needs c++11 (since 3.6.0)
-OPENCV3_CONF_OPTS += \
-	-DENABLE_CXX11=ON \
-	-DPROTOBUF_UPDATE_FILES=ON \
-	-DWITH_PROTOBUF=ON
-OPENCV3_DEPENDENCIES += protobuf
-else
-OPENCV3_CONF_OPTS += -DWITH_PROTOBUF=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_OPENCV3_WITH_QT5),y)
 OPENCV3_CONF_OPTS += -DWITH_QT=5
 OPENCV3_DEPENDENCIES += qt5base
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
