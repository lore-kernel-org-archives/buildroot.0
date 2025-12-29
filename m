Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5980EE9273E
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 17:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F35D60B1E;
	Mon, 29 Dec 2025 17:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CPkf7Sw2FlIH; Mon, 29 Dec 2025 17:54:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4274360AF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767030883;
	bh=T7v+noGbPSnHr7X6SPf4YHzemg5uYkl3ke+I2Z+h+Xw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nerOb2HvCgmd3+u0k2yGUjHICboXgp8lyeGkoMUo+nSyBkJCv8DJ2pRPSiqOi/hw5
	 CwPnwCtEQqlB7ynAl25NYMmH/1ontmDdRwnpaN0uprj7x74e7kSFH9XJUC7Zc4VVdD
	 sPWxoigyBYdpzl6ToDVwmc/n08PfsCXHn+w5AHwUMIuR71EgDM1MUAByF/qsyFDYBZ
	 cwv8aM4xrYbxq+UMxEnDHsdKEfjqSI5HYXIczmnyL/HPZv1LsYv6N1uhJDjtR78kDR
	 wYu9aAQDn/o4wRQVJ3mBXLXgHkY5eL8iYu/3c4aJj6bsTu2lsHeLaIcXorT9Nw1yOD
	 vLreQb2yrA/6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4274360AF3;
	Mon, 29 Dec 2025 17:54:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DD8FD8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43BF481A5C
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P0wvNuKgzPs3 for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 17:54:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 26A36811D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26A36811D1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26A36811D1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:54:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0A0B7A4C25A5;
 Mon, 29 Dec 2025 18:52:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38202)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaHPW-0000000012P-11wo;
 Mon, 29 Dec 2025 17:52:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Mon, 29 Dec 2025 18:51:38 +0100
Message-ID: <20251229175158.3548903-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229175158.3548903-1-bernd@kuhls.net>
References: <20251229175158.3548903-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767030730;
 bh=5Jx3wyjy4jWUZOeCtROilVtS0UgS1FTa/2FYnNZdXDY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bfxzI2tuvEr/w1U8P/PJbZp0uYKQxTi5EuK6nwAeGHOdz9wr9BTKedM7xqv3Kyg3z
 TXI98X2O9PSFg1H46fTa5fvfDNUL1brod4g6Tbgin7mcKFV0AGAokay5BgJYrUrqRA
 18bR4j1NDkXeKtfnlZ7PZ2r2OpsWV7R7sb6m7o0AFxGYtnLxS0LS89J77h3oaQiZ+x
 AkP+zvktVqDuqoBPSqa/CxTD3zqhcLWVMkV3tCrdfYDdFqFt07tVbudj7oxgyflN5t
 nnmyO6zAOAcF1Bsw3FkVWE18swXOcljoWe2tWN80PAQ2GxcShBb1kaf2Jdslc2M1fw
 oE/rp+WlPgDrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=bfxzI2tu
Subject: [Buildroot] [PATCH v7 10/29] package/alure: remove package
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
index 7ff34b6801..4e27af0f00 100644
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
index ab68fd2b2c..df13cc37d0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2906,7 +2906,6 @@ F:	configs/qemu_*
 F:	configs/am574x_idk_defconfig
 F:	configs/beagleboneai64_defconfig
 F:	configs/beagley_ai_defconfig
-F:	package/alure/
 F:	package/aubio/
 F:	package/bcc/
 F:	package/binutils/
diff --git a/package/Config.in b/package/Config.in
index bef6ae7b22..7a7f80f37b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1536,7 +1536,6 @@ menu "Libraries"
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
