Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA77CC71141
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 11:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C0A780895;
	Sat, 14 Jun 2025 11:10:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4BsJmxXxxbY1; Sat, 14 Jun 2025 11:10:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CFAB80F87
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CFAB80F87;
	Sat, 14 Jun 2025 11:10:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C26761A4
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 11:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B43BE608C7
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 11:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVRIO4Wz-AGz for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 11:10:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CBD536081F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBD536081F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBD536081F
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 11:10:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cb5b.dip0.t-ipconnect.de [79.214.203.91])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E6859A4C0B20;
 Sat, 14 Jun 2025 13:10:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52350)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uQOlu-000000008E1-46fk;
 Sat, 14 Jun 2025 11:10:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Sat, 14 Jun 2025 13:10:02 +0200
Message-Id: <20250614111002.66221-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1749899402;
 bh=dgq4n1Xas0bAz9Gcr8y79Emq4qNAAwrMzKwyhwgpSv8=;
 h=From:To:Cc:Subject:Date:From;
 b=YTUq5QKdT8zhtv+nfUMXCNDublhWt2PJTgAXMNMYaChXizaja9KR50+HbVgrIAfIX
 I4KwyjKqv4M4Sdw9t2AujlJSnei3PIAdbKKQ/rce301IDpPO/ugR3glcchqobokah6
 y+Q8z7USNEXkhgDnipZaUtA0v6NuVJh1R9fJqme5gFqKTd8fQ5YJXgqFN/qVYiIplD
 Kt2Fo2Rs8b8FIlUqRxQOQkLGO43HEO6YHy0aZplsaNfRktWo+90mV84sm6M7EcL6SO
 cBBAbF6/cbEFdWfWl3ypjXn13DwYUr1vFLxh9U1AeUEkWMXon1OgFiV/vFOxFE86PJ
 2SLLtOqYNfHew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=YTUq5QKd
Subject: [Buildroot] [PATCH 1/1] package/libebur128: remove package
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

libebur128 was added to buildroot in July 2016 with commit
a32d29cd84789d7406022c7bb9861e5bda530013 to provide an external
dependency for ffmpeg.

ffmpeg removed this external dependency and switched to an internal
version in November 2016 with upstream commit
http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=005d058f4230f3207ebcf1131df7426d4f57392f
which was first included in ffmpeg version 3.3.

Buildroot bumped ffmpeg to version 3.3 in April 2017 with commit
21d93a1351ca8d4e5185c22a81becdaf08a9bdd3 and forgot to remove the
dependency to libebur128.

This went unnoticed until libebur128 fails to build with cmake 4.x.
Upstream saw its last commit four years ago. Instead of fixing an
unused package we removed it from buildroot.

Fixes:
https://autobuild.buildroot.org/results/e629bd151cc539f01b909e44d07e17451a29ba27/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                   |  6 ++++++
 DEVELOPERS                         |  1 -
 package/Config.in                  |  1 -
 package/ffmpeg/ffmpeg.mk           |  4 ----
 package/libebur128/Config.in       | 13 -------------
 package/libebur128/libebur128.hash |  3 ---
 package/libebur128/libebur128.mk   | 13 -------------
 7 files changed, 6 insertions(+), 35 deletions(-)
 delete mode 100644 package/libebur128/Config.in
 delete mode 100644 package/libebur128/libebur128.hash
 delete mode 100644 package/libebur128/libebur128.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 3084e7336e..c94bc1a226 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_LIBEBUR128
+	bool "libebur128 has been removed"
+	select BR2_LEGACY
+	help
+	  The libebur128 package has been removed from Buildroot.
+
 config BR2_KERNEL_HEADERS_6_14
 	bool "kernel headers version 6.14.x are no longer supported"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 0478e47c98..e664f35a28 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -412,7 +412,6 @@ F:	package/libdvbcsa/
 F:	package/libdvdcss/
 F:	package/libdvdnav/
 F:	package/libdvdread/
-F:	package/libebur128/
 F:	package/libfreeglut/
 F:	package/libfribidi/
 F:	package/libg7221/
diff --git a/package/Config.in b/package/Config.in
index 99a5e2928e..af32b39e44 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1555,7 +1555,6 @@ menu "Audio/Sound"
 	source "package/libcodec2/Config.in"
 	source "package/libcue/Config.in"
 	source "package/libcuefile/Config.in"
-	source "package/libebur128/Config.in"
 	source "package/libg7221/Config.in"
 	source "package/libgsm/Config.in"
 	source "package/libid3tag/Config.in"
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 5c00ba2dff..30cf7020de 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -243,10 +243,6 @@ FFMPEG_CONF_OPTS += --disable-openssl
 endif
 endif
 
-ifeq ($(BR2_PACKAGE_FFMPEG_GPL)$(BR2_PACKAGE_LIBEBUR128),yy)
-FFMPEG_DEPENDENCIES += libebur128
-endif
-
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
 FFMPEG_CONF_OPTS += --enable-libdrm
 FFMPEG_DEPENDENCIES += libdrm
diff --git a/package/libebur128/Config.in b/package/libebur128/Config.in
deleted file mode 100644
index 0d68b39d53..0000000000
--- a/package/libebur128/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_LIBEBUR128
-	bool "libebur128"
-	# build system has no support to disable shared linking
-	# leading to a build error with a static-only toolchain
-	depends on !BR2_STATIC_LIBS
-	help
-	  libebur128 is a library that implements the EBU R 128 standard
-	  for loudness normalization.
-
-	  https://github.com/jiixyj/libebur128
-
-comment "libebur128 needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
diff --git a/package/libebur128/libebur128.hash b/package/libebur128/libebur128.hash
deleted file mode 100644
index 9c8c9e0c31..0000000000
--- a/package/libebur128/libebur128.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  baa7fc293a3d4651e244d8022ad03ab797ca3c2ad8442c43199afe8059faa613  libebur128-1.2.6.tar.gz
-sha256  d6b4754bb67bdd08b97d5d11b2d7434997a371585a78fe77007149df3af8d09c  COPYING
diff --git a/package/libebur128/libebur128.mk b/package/libebur128/libebur128.mk
deleted file mode 100644
index b7272fa7e1..0000000000
--- a/package/libebur128/libebur128.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# libebur128
-#
-################################################################################
-
-LIBEBUR128_VERSION = 1.2.6
-LIBEBUR128_SITE = $(call github,jiixyj,libebur128,v$(LIBEBUR128_VERSION))
-LIBEBUR128_LICENSE = MIT
-LIBEBUR128_LICENSE_FILES = COPYING
-LIBEBUR128_INSTALL_STAGING = YES
-
-$(eval $(cmake-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
