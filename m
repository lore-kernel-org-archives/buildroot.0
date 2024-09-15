Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF16BC35FE5
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 04:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71D1E400EF;
	Sun, 15 Sep 2024 04:55:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4e5mtbalqOpm; Sun, 15 Sep 2024 04:55:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1D7F401A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1D7F401A1;
	Sun, 15 Sep 2024 04:55:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E9F91BF383
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 04:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BAEC40169
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 04:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kt9rKFlmz96f for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 04:55:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7F574400EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F574400EF
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F574400EF
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 04:55:03 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2f759688444so29275491fa.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726376101; x=1726980901;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AulXpjNeZmTlsnaSoB/H5xKJI81vUJ8u+xwPswvjEkk=;
 b=FRVP3rF54GP7FmciQLwe4fpwzi+ioGKzEgN+iuC06pmYh5hIpqAkItFZOppa8qMLMt
 xWPaoF+k26dDT9Sp3n9E7qGfX6WIr6CnxtGuACN51jrG/kr8/fy1LrDQ5G0k0Oftf4ie
 aOUj1z/kc1MIei2BUaywQ/L+2uc/4jLKYHs0p2zNBJRNUu20a0CDHPazyyJ0yNz9IiVB
 y1xSR1dIPSuebH/rDtYp4y1eT3YyLT7twzj07QTTPq2+TeVYM+fTzjowVm7wZgtEysEK
 OonZ4jkzDxiRqKlwydqYZP1aEsX9OHi8CKKLzK4wbcCXOk9nSG39RhlXIE3DmiC0db3V
 +PEQ==
X-Gm-Message-State: AOJu0YyGab1Yati49cBIyxPrKh6YLR+JjQIAHgr4/00oGMIPlmZqkGFS
 +IsIYVjvLwZNBW+GKCFgqW60x2j1KfmnMHbSz62DQQ466c0SfaEboVMSVg==
X-Google-Smtp-Source: AGHT+IGuFTVVQ4AIFjpv5yLgGC2b0SwM/NXo+8XvyCEoWOlrjzP892sZsc76njAalvDeO0ak96SlTg==
X-Received: by 2002:a2e:f0a:0:b0:2f6:6576:ae6e with SMTP id
 38308e7fff4ca-2f787ed9065mr49302531fa.21.1726376100144; 
 Sat, 14 Sep 2024 21:55:00 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f79d30130esm4250851fa.38.2024.09.14.21.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 21:54:59 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 06:54:53 +0200
Message-ID: <20240915045455.1567220-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726376101; x=1726980901; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AulXpjNeZmTlsnaSoB/H5xKJI81vUJ8u+xwPswvjEkk=;
 b=cpDhBn9RztUYllY1ie1SpwakIMsaJsZpGQZwzgMD9AV0NPDTWt04yezLLfs9qC3NdP
 U+ihfrwGMUd+9xBckAEKACA9r0kM1aX8mRuN23G/7r+3wSExtyEEO2CEZ8uExF76kJTm
 MIiMHMlCJvbftBtngOmIUI94p1nytE/BkV9uJ33qbTXlcQgbxz+/NO4rSwx6v0uAUS3D
 +QGj3+On6JwUHB6ZdGYNaP+PTAYsLHzWwQc7DL8fnNG+wWs97IQOD35CoeabWTtHNcqT
 uUuSymTiyw+qi5GOBnrT9bTM7rUVP6vSFgVO8TtkAVm6m7vSbrr+ssyCcYUUd1ups7YV
 wBXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cpDhBn9R
Subject: [Buildroot] [PATCH v5] package/dlib: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Changes v4 -> v5:
  - drop all sub-options, and instead rely on automatic dependencies  (suggested by Thomas)
  - sort the ifeq's
  - add entry in the DEVELOPERS file as part of the patch adding the package  (suggested by Thomas)
  - convert 'OR' to lowercase in DLIB_LICENSES
  - use the most common patterns for comments in hash-files

 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/dlib/Config.in | 14 ++++++
 package/dlib/dlib.hash | 13 ++++++
 package/dlib/dlib.mk   | 99 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 128 insertions(+)
 create mode 100644 package/dlib/Config.in
 create mode 100644 package/dlib/dlib.hash
 create mode 100644 package/dlib/dlib.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f887e161c..6e5f47466e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2886,6 +2886,7 @@ F:	support/testing/tests/package/test_python_mako.py
 F:	toolchain/
 
 N:	Roy Kollen Svendsen <roykollensvendsen@gmail.com>
+F:	package/dlib/
 F:	package/qt6/
 
 N:	Rufus Segar <rhs@riseup.net>
diff --git a/package/Config.in b/package/Config.in
index 269a8cae6f..04dfca4289 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2153,6 +2153,7 @@ menu "Other"
 	source "package/cracklib/Config.in"
 	source "package/dawgdic/Config.in"
 	source "package/ding-libs/Config.in"
+	source "package/dlib/Config.in"
 	source "package/dotconf/Config.in"
 	source "package/double-conversion/Config.in"
 	source "package/eigen/Config.in"
diff --git a/package/dlib/Config.in b/package/dlib/Config.in
new file mode 100644
index 0000000000..2419af967b
--- /dev/null
+++ b/package/dlib/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_DLIB
+	bool "dlib"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Dlib is a modern C++ toolkit containing machine learning
+	  algorithms and tools for creating complex software in C++ to
+	  solve real world problems.
+
+	  http://dlib.net
+
+comment "dlib needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dlib/dlib.hash b/package/dlib/dlib.hash
new file mode 100644
index 0000000000..af206386b8
--- /dev/null
+++ b/package/dlib/dlib.hash
@@ -0,0 +1,13 @@
+# Locally computed
+sha256  22513c353ec9c153300c394050c96ca9d088e02966ac0f639e989e50318c82d6  dlib-19.24.6.tar.gz
+
+# Hashes for license files
+sha256  50c1c5978d490c7f13062d91c4b89affc83774f87bc4568a714f748b62a5b216  dlib/external/libjpeg/README
+sha256  debfae299fa4118b0a586af4cf7ac8d38aae81ac4e9995c935862aaee6eb0362  dlib/external/libpng/LICENSE
+sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  dlib/external/pybind11/LICENSE
+sha256  8d8291caf1cee26d23acf3eb67c9f9a2d58f1c681b16a4fbe8cbfb9e3c0b5a9b  dlib/LICENSE.txt
+sha256  908b0b565ae9bf61b7b41447cb0b83564f320375723bcc884ec30e5537a0d5dc  dlib/test/ffmpeg_data/LICENSE.TXT
+sha256  78515536a4b0d896745b6483fccc561987e8e2f2d014dc81d7c2e97c497a0a69  examples/LICENSE_FOR_EXAMPLE_PROGRAMS.txt
+sha256  a0e7b40719ba74630debe9fae1cb847ee436215451123254a690171d09fb036e  examples/video_frames/license.txt
+sha256  8d8291caf1cee26d23acf3eb67c9f9a2d58f1c681b16a4fbe8cbfb9e3c0b5a9b  LICENSE.txt
+sha256  8acb12b218fdb5e071f25eda9ac990d04888388b65095867d9007c278a9f993b  python_examples/LICENSE_FOR_EXAMPLE_PROGRAMS.txt
diff --git a/package/dlib/dlib.mk b/package/dlib/dlib.mk
new file mode 100644
index 0000000000..4eb0002775
--- /dev/null
+++ b/package/dlib/dlib.mk
@@ -0,0 +1,99 @@
+################################################################################
+#
+# dlib
+#
+################################################################################
+
+DLIB_VERSION = 19.24.6
+DLIB_SITE = $(call github,davisking,dlib,v$(DLIB_VERSION))
+DLIB_CMAKE_BACKEND = ninja
+DLIB_INSTALL_STAGING = YES
+DLIB_SUPPORTS_IN_SOURCE_BUILD = NO
+
+DLIB_LICENSE = \
+	BSD-3-Clause (kissfft, pybind11) \
+	BSL-1.0 (dlib, tools) \
+	CC0-1.0 (examples) \
+	libpng-2.0 (libpng) \
+	MIT or CC0-1.0 (JoinPaths.cmake)
+
+DLIB_LICENSE_FILES = \
+	dlib/external/libjpeg/README \
+	dlib/external/libpng/LICENSE \
+	dlib/external/pybind11/LICENSE \
+	dlib/LICENSE.txt \
+	dlib/test/ffmpeg_data/LICENSE.TXT \
+	examples/LICENSE_FOR_EXAMPLE_PROGRAMS.txt \
+	examples/video_frames/license.txt \
+	LICENSE.txt \
+	python_examples/LICENSE_FOR_EXAMPLE_PROGRAMS.txt
+
+DLIB_CONF_OPTS = \
+	-DDLIB_LINK_WITH_SQLITE3=OFF \
+	-DDLIB_USE_CUDA=OFF \
+	-DDLIB_USE_MKL_FFT=OFF
+
+ifeq ($(BR2_PACKAGE_FFMPEG)$(BR2_PACKAGE_FFMPEG_SWSCALE),yy)
+DLIB_CONF_OPTS += -DDLIB_USE_FFMPEG=ON
+DLIB_DEPENDENCIES += ffmpeg
+else
+DLIB_CONF_OPTS += -DDLIB_USE_FFMPEG=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_GIFLIB),y)
+DLIB_CONF_OPTS += -DDLIB_GIF_SUPPORT=ON
+DLIB_DEPENDENCIES += giflib
+else
+DLIB_CONF_OPTS += -DDLIB_GIF_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+DLIB_CONF_OPTS += -DDLIB_JPEG_SUPPORT=ON
+DLIB_DEPENDENCIES += jpeg
+else
+DLIB_CONF_OPTS += -DDLIB_JPEG_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LAPACK),y)
+DLIB_CONF_OPTS += -DDLIB_USE_LAPACK=ON
+DLIB_DEPENDENCIES += lapack
+else
+DLIB_CONF_OPTS += -DDLIB_USE_LAPACK=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBJXL),y)
+DLIB_CONF_OPTS += -DDLIB_JXL_SUPPORT=ON
+DLIB_DEPENDENCIES += libjxl
+else
+DLIB_CONF_OPTS += -DDLIB_JXL_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+DLIB_CONF_OPTS += -DDLIB_PNG_SUPPORT=ON
+DLIB_DEPENDENCIES += libpng
+else
+DLIB_CONF_OPTS += -DDLIB_PNG_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENBLAS),y)
+DLIB_CONF_OPTS += -DDLIB_USE_BLAS=ON
+DLIB_DEPENDENCIES += openblas
+else
+DLIB_CONF_OPTS += -DDLIB_USE_BLAS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_WEBP),y)
+DLIB_CONF_OPTS += -DDLIB_WEBP_SUPPORT=ON
+DLIB_DEPENDENCIES += webp
+else
+DLIB_CONF_OPTS += -DDLIB_WEBP_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+DLIB_CONF_OPTS += -DDLIB_NO_GUI_SUPPORT=OFF
+DLIB_DEPENDENCIES += xlib_libX11
+else
+DLIB_CONF_OPTS += -DDLIB_NO_GUI_SUPPORT=ON
+endif
+
+$(eval $(cmake-package))
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
