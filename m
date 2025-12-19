Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384FAD7879F
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 17:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C90B612EA;
	Fri, 19 Dec 2025 17:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ygI2AYqCRbtl; Fri, 19 Dec 2025 17:54:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1EEE60D96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766166855;
	bh=xIH0QJ1pFPKVS+NpRGD1yhSPha/BIccNEfC8kHomTSQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rDecgWfmLc24YIfcdqEqOS5qKD2a0LMoIOdvASF4sSRFv07ITxREb5OenIFXPVtWS
	 EQvSjof3LER6HZBsfMnSXyYbc2BCr5Uw90usYu8varDjIq4seFMDVMGvxGjnKzYwrz
	 9cQxI29IIBHSzfmYq28JWFv6oOjKI6T70RLXnkPd3aOHCH/9hLn40Nl7gzJ3bb6INL
	 CeMzrmmBGgbxQapZR7baAxvoxkOE6qrsyzeWucmOGULAVKgFeutCsQ4Isektk7u3aC
	 ct9y5ysseQqzX5+WyCjfuXG0zdltfnT5iHLi/bklGtapDMhjXk7QBupP0noD0X1y85
	 +7HcvqFGwrB8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1EEE60D96;
	Fri, 19 Dec 2025 17:54:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4392C119
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 17:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3516183B77
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 17:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5tw7c3YtjgF2 for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 17:54:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1412D83B88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1412D83B88
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1412D83B88
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 17:54:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a05d4.dip0.t-ipconnect.de [91.58.5.212])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 077E5A4C4B13;
 Fri, 19 Dec 2025 18:52:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38748)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vWedp-000000002KQ-2etJ;
 Fri, 19 Dec 2025 17:51:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Fri, 19 Dec 2025 18:51:29 +0100
Message-ID: <20251219175141.1907408-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219175141.1907408-1-bernd@kuhls.net>
References: <20251219175141.1907408-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766166722;
 bh=5zR4hweba9HiHAOYTsR8R09hEu3rx1GtZCF1KL1TZE0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Pn3ObOOwKE5Ll32fXh6e5JWkQIdWJQ9xBpIHh72P7H2ppEdxnprWD9cJLU06ESkq7
 nMkHqspmtLKW43d01BcsQdwgI7+E/P93p3tTFM7eAgDz2K27GY7XhJAdX+YCNjRduH
 cRPYuTLNru67cDYUaJakqcf5zW3oW9rUjx6by2WJNbiUYYguyMpglla91OvdsWcZS9
 pRq/3Ul0XKpcli4RTJsrtKIgZ2WyLpZTrFvvWpBKiiRfZ3bfxU2JPuBrWzQ7hd0mva
 8Y8hvq6xs9LgjRDZvrQJPohwWDNXB9WxSYPh4GxTlewswfNYakNKmqNlRYqYRlwzIG
 l8ScDE4xk1Tjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Pn3ObOOw
Subject: [Buildroot] [PATCH v4 10/20] package/alure: remove package
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

Analysis of https://github.com/kcat/alure:
last commit: Feb 2020
last bug report: Oct 2020
last pull request: 0 open

The package is broken with cmake 4 and no other package depends on it.

The upstream site kcat.strangesoft.net has no DNS record anymore, the
main site strangesoft.net serves content unrelated to alure.

Although the cmake error is easy to fix we remove this unsupported
package instead.

Fixes:
https://autobuild.buildroot.net/results/d5a/d5a275f2d282c9dd2e3053667c79be11d48e918d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Romain Naour <romain.naour@gmail.com>
---
 Config.in.legacy         |  6 ++++
 DEVELOPERS               |  1 -
 package/Config.in        |  1 -
 package/alure/Config.in  | 56 ----------------------------------
 package/alure/alure.hash |  3 --
 package/alure/alure.mk   | 65 ----------------------------------------
 6 files changed, 6 insertions(+), 126 deletions(-)
 delete mode 100644 package/alure/Config.in
 delete mode 100644 package/alure/alure.hash
 delete mode 100644 package/alure/alure.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 76e8a213ca..1f7ac7d4b8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_ALURE
+	bool "alure has been removed"
+	select BR2_LEGACY
+	help
+	  alure is unmaintained and has been removed
+
 config BR2_PACKAGE_LIBUWSC
 	bool "libuwsc has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 60d6ff858f..3b18c745bf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2889,7 +2889,6 @@ F:	configs/qemu_*
 F:	configs/am574x_idk_defconfig
 F:	configs/beagleboneai64_defconfig
 F:	configs/beagley_ai_defconfig
-F:	package/alure/
 F:	package/aubio/
 F:	package/bcc/
 F:	package/binutils/
diff --git a/package/Config.in b/package/Config.in
index 0e11fe4bae..6d1b78cbfc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1533,7 +1533,6 @@ menu "Libraries"
 menu "Audio/Sound"
 	source "package/alsa-lib/Config.in"
 	source "package/alsa-plugins/Config.in"
-	source "package/alure/Config.in"
 	source "package/aubio/Config.in"
 	source "package/bcg729/Config.in"
 	source "package/caps/Config.in"
diff --git a/package/alure/Config.in b/package/alure/Config.in
deleted file mode 100644
index c831bba913..0000000000
--- a/package/alure/Config.in
+++ /dev/null
@@ -1,56 +0,0 @@
-config BR2_PACKAGE_ALURE
-	bool "alure"
-	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # openal
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
-	depends on BR2_USE_WCHAR # use wchar_t
-	select BR2_PACKAGE_OPENAL
-	help
-	  Alure is a C++ 3D audio API. It uses OpenAL for audio
-	  rendering, and provides common higher-level features such as
-	  file loading and decoding, buffer caching, background
-	  streaming, and source management for virtually unlimited
-	  sound source handles.
-
-	  https://kcat.strangesoft.net/alure.html
-
-if BR2_PACKAGE_ALURE
-
-config BR2_PACKAGE_ALURE_FLAC_DECODER
-	bool "flac decoder"
-	help
-	  Enables the built-in FLAC decoder.
-
-config BR2_PACKAGE_ALURE_MINIMP3_DECODER
-	bool "minimp3 decoder"
-	help
-	  Enables the built-in minimp3 decoder.
-
-config BR2_PACKAGE_ALURE_OPUS_DECODER
-	bool "opus decoder"
-	select BR2_PACKAGE_LIBOGG
-	select BR2_PACKAGE_OPUS
-	help
-	  Enables the built-in libopusfile decoder.
-
-config BR2_PACKAGE_ALURE_SNDFILE_DECODER
-	bool "sndfile decoder"
-	select BR2_PACKAGE_LIBSNDFILE
-	help
-	  Enables the built-in libsndfile decoder.
-
-config BR2_PACKAGE_ALURE_VORBIS_DECODER
-	bool "vorbis decoder"
-	select BR2_PACKAGE_LIBOGG
-	select BR2_PACKAGE_LIBVORBIS
-	help
-	  Enables the built-in libvorbis decoder.
-
-endif
-
-comment "alure needs a toolchain w/ C++, gcc >= 9, NPTL, wchar"
-	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_9 \
-		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
diff --git a/package/alure/alure.hash b/package/alure/alure.hash
deleted file mode 100644
index 0d4c36c4ae..0000000000
--- a/package/alure/alure.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  9b808e5b5a54d156348221dc86704c7831115047d5238691e6088f8c4814b2ca  alure-14beed2a86d5a36030e907b21c46614d505f07cd.tar.gz
-sha256  7331ddc67daaf1a283c81e8dc17bac8dc40f54ed3fab3d3964616f4bd502a0a3  LICENSE
diff --git a/package/alure/alure.mk b/package/alure/alure.mk
deleted file mode 100644
index fe27bfd12b..0000000000
--- a/package/alure/alure.mk
+++ /dev/null
@@ -1,65 +0,0 @@
-################################################################################
-#
-# alure
-#
-################################################################################
-
-ALURE_VERSION = 14beed2a86d5a36030e907b21c46614d505f07cd
-ALURE_SITE = $(call github,kcat,alure,$(ALURE_VERSION))
-ALURE_LICENSE = Zlib, Public Domain (src/decoders/dr_flac.h)
-ALURE_LICENSE_FILES = LICENSE
-ALURE_INSTALL_STAGING = YES
-
-ALURE_DEPENDENCIES = openal
-
-# Disabling alure examples removes the dependencies on physfs and dump
-# libraries. Enable at least one built-in decoder (wave).
-ALURE_CONF_OPTS = -DALURE_INSTALL=ON \
-	-DALURE_BUILD_EXAMPLES=OFF \
-	-DALURE_ENABLE_WAVE=ON
-
-ifeq ($(BR2_PACKAGE_ALURE_FLAC_DECODER),y)
-ALURE_CONF_OPTS += -DALURE_ENABLE_FLAC=ON
-else
-ALURE_CONF_OPTS += -DALURE_ENABLE_FLAC=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_ALURE_MINIMP3_DECODER),y)
-ALURE_CONF_OPTS += -DALURE_ENABLE_MINIMP3=ON
-else
-ALURE_CONF_OPTS += -DALURE_ENABLE_MINIMP3=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_ALURE_OPUS_DECODER),y)
-ALURE_CONF_OPTS += -DALURE_ENABLE_OPUS=ON
-ALURE_DEPENDENCIES += libogg opus
-else
-ALURE_CONF_OPTS += -DALURE_ENABLE_OPUS=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_ALURE_SNDFILE_DECODER),y)
-ALURE_CONF_OPTS += -DALURE_ENABLE_SNDFILE=ON
-ALURE_DEPENDENCIES += libsndfile
-else
-ALURE_CONF_OPTS += -DALURE_ENABLE_SNDFILE=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_ALURE_VORBIS_DECODER),y)
-ALURE_CONF_OPTS += -DALURE_ENABLE_VORBIS=ON
-ALURE_DEPENDENCIES += libogg libvorbis
-else
-ALURE_CONF_OPTS += -DALURE_ENABLE_VORBIS=OFF
-endif
-
-ifeq ($(BR2_STATIC_LIBS),y)
-ALURE_CONF_OPTS += -DALURE_BUILD_SHARED=OFF \
-	-DALURE_BUILD_STATIC=ON
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-ALURE_CONF_OPTS += -DALURE_BUILD_SHARED=ON \
-	-DALURE_BUILD_STATIC=ON
-else
-ALURE_CONF_OPTS += -DALURE_BUILD_SHARED=ON \
-	-DALURE_BUILD_STATIC=OFF
-endif
-
-$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
