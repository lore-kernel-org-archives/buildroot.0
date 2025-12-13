Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E03D5B154
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 14:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B6ED40901;
	Sat, 13 Dec 2025 14:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cLoEwS85DwlV; Sat, 13 Dec 2025 14:32:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7936A40909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765636335;
	bh=BDgK2XzjXFCyYGBdT3cxX2lR/RNtSzUGUtV+i1ngDQ8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P8PQH/OIxig5urwl/ukGw8fKQPWg6htdhHISDIb++TCtSHvymwcqiTnZH5O8r517n
	 1a7sQQVE8i04Do9g3pqn4+ZNINbBcNv9kXrKpNrIN6hGmGPrHAX7sAVXZTxYFeYAr2
	 QmvNJNP4BAi81+5ITsEYm43NEJdrBg/I0sQ1nbzpe6GYgus+QayLNBMCn0ymBelM1B
	 6F8H8ba98qdsOEWBkis2GzUJlfQ8v3UQJkkNJecII837bsdpysoZLrt87LGBSNcg+C
	 /H+BDuuqjB1fFGC9spdCjxw73RlLBVQUfXN2GIZWJY8YCTzGVeNZlqp3CsSeKmPXyL
	 BBxg5EBk15aMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7936A40909;
	Sat, 13 Dec 2025 14:32:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 49C3413D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C64581C58
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vl8VLES9ubPD for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 14:32:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 23E3881445
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23E3881445
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23E3881445
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:32:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8751BA4C407E
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 15:30:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56096)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUQdO-000000000dj-0aqV
 for buildroot@buildroot.org; Sat, 13 Dec 2025 14:30:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 15:30:01 +0100
Message-ID: <20251213143008.1329736-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213143008.1329736-1-bernd@kuhls.net>
References: <20251213143008.1329736-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765636216;
 bh=+ZduOXNcVaZYTUUYhFZslylmzgAKkJML1AiaQWhbYcc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=ty2CbcrdBCITVMNl4tPkYnb1W/krCKEAZsliOQPfq82XwW8gvR1VIkroft6hE5i28
 eUHZOKh7KNiCVako/cWD5KC717EmRcy5Ftj3tknWZzAxIGjlc7f2DL+xONGn8Re/ky
 eWkwGmAKDZMTxleQhokUH+oxio2yn0VGYMi50cmU57VQ8tp02SXUfkm3BMcMK8q8iP
 A9urMv9zOC1xLvYQiUN107NP17e1KF43piw58/UCvG0WRPssHyG1joeICCBLWI7cNM
 n8y7dkTBkLObXK7OdfWqmoXgKKP7s7tyQvYJKKapOBm2/l+UF3vOBvRiZH3VyUfbvm
 LGNId2F6vxuQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ty2Cbcrd
Subject: [Buildroot] [PATCH 10/16] package/alure: remove package
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
index 7e5ea66c5d..29cdd9a4d8 100644
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
index 5617322415..463de5bd13 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2890,7 +2890,6 @@ F:	configs/qemu_*
 F:	configs/am574x_idk_defconfig
 F:	configs/beagleboneai64_defconfig
 F:	configs/beagley_ai_defconfig
-F:	package/alure/
 F:	package/aubio/
 F:	package/bcc/
 F:	package/binutils/
diff --git a/package/Config.in b/package/Config.in
index fad36a022b..372ea1cc6f 100644
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
