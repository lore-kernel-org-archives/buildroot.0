Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A968ECA101F
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F74661605;
	Wed, 10 Sep 2025 21:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VN86E9ni3-xk; Wed, 10 Sep 2025 21:33:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8417615D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8417615D0;
	Wed, 10 Sep 2025 21:33:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 44B812BB3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B3A44195F
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ipJREZJVZrjF for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:33:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0621C41950
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0621C41950
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0621C41950
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 433024E40B80
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1B879606D4
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9E17D102F29D8; 
 Wed, 10 Sep 2025 23:33:33 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Sep 2025 23:32:24 +0200
Message-ID: <20250910213241.1529448-17-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757540013; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=WH5STw9obVIW33OB7zAjwBygGPEK2Rv7S+10rYVs2Q0=;
 b=tTOYYOI9kGN5x5RoeR7WbnHyh0sQYaSqdp8gSWvYaKVc+SDnAVfJK8ooPcn8WLRKGGTlbS
 QZ1XQpA+ykxh+7ZMfR22Lwaia1nxihHPR0yA68Q/el3gqpjqu+oPWozzXEMgSqykHrtIUe
 Mjojbt0wxyy9kEebHS0Dey2XxI/bH2kLL4hJtUvsySbpVGEdRZJVhU1WoCp9szoHyWhTzH
 +KNVfHQLSzfQ1HSdZFxEGiMhMX0OXya0t6TsM7ejSkDiDkZs8VQaBtMdw4AeoeMnPGyiJt
 wWTYYvfWoa02L0MbsuWqnT3RnacDfOMwRo89tIw/lGKCuH0ZV8RtiOX/ev39pw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=tTOYYOI9
Subject: [Buildroot] [PATCH 16/23] package/opencv3: drop optional dependency
 on libgtk2
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

As we're about to remove libgtk2, we need to drop libgtk2 support from
opencv3. gtk3 support remains in place.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opencv3/Config.in  |  9 ---------
 package/opencv3/opencv3.mk | 14 ++++----------
 2 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index a672497108..c4c5d22a54 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -63,15 +63,6 @@ choice
 config BR2_PACKAGE_OPENCV3_GUI_NONE
 	bool "none"
 
-config BR2_PACKAGE_OPENCV3_WITH_GTK
-	bool "gtk2"
-	depends on BR2_PACKAGE_LIBGTK2
-
-comment "gtk2 support needs libgtk2"
-	depends on BR2_USE_MMU # libgtk2 -> glib2
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_PACKAGE_LIBGTK2
-
 config BR2_PACKAGE_OPENCV3_WITH_GTK3
 	bool "gtk3"
 	depends on BR2_PACKAGE_LIBGTK3
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 218174c17e..8a862a47b1 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -215,6 +215,7 @@ OPENCV3_CONF_OPTS += \
 	-DWITH_GDAL=OFF \
 	-DWITH_GPHOTO2=OFF \
 	-DWITH_GSTREAMER_0_10=OFF \
+	-DWITH_GTK_2_X=OFF \
 	-DWITH_LAPACK=OFF \
 	-DWITH_MATLAB=OFF \
 	-DWITH_OPENCL=OFF \
@@ -244,18 +245,11 @@ else
 OPENCV3_CONF_OPTS += -DWITH_GSTREAMER=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV3_WITH_GTK)$(BR2_PACKAGE_OPENCV3_WITH_GTK3),)
-OPENCV3_CONF_OPTS += -DWITH_GTK=OFF -DWITH_GTK_2_X=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_OPENCV3_WITH_GTK),y)
-OPENCV3_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=ON
-OPENCV3_DEPENDENCIES += libgtk2
-endif
-
 ifeq ($(BR2_PACKAGE_OPENCV3_WITH_GTK3),y)
-OPENCV3_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=OFF
+OPENCV3_CONF_OPTS += -DWITH_GTK=ON
 OPENCV3_DEPENDENCIES += libgtk3
+else
+OPENCV3_CONF_OPTS += -DWITH_GTK=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV3_WITH_JASPER),y)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
