Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5382AECE577
	for <buildroot@archiver.kernel.org>; Sun,  8 Sep 2024 21:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB59D80ECE;
	Sun,  8 Sep 2024 21:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p9QPp7QlyRy5; Sun,  8 Sep 2024 21:33:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAD2F80F80
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAD2F80F80;
	Sun,  8 Sep 2024 21:33:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96F4D1BF35C
 for <buildroot@lists.busybox.net>; Sun,  8 Sep 2024 21:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83DC740386
 for <buildroot@lists.busybox.net>; Sun,  8 Sep 2024 21:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7xe7zyrO5XDu for <buildroot@lists.busybox.net>;
 Sun,  8 Sep 2024 21:33:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ED21240384
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED21240384
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED21240384
 for <buildroot@buildroot.org>; Sun,  8 Sep 2024 21:33:51 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2f759b87f83so14194641fa.2
 for <buildroot@buildroot.org>; Sun, 08 Sep 2024 14:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725831230; x=1726436030;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W7vyWTK19kxWYIJ33ZV9lKGB9UhcyvvYO8OEnZONUQ4=;
 b=qZQ7vNpw/nogrOTbG88XTbGPelhaTaQ71SEVOtQ6+PmDso0XZqRB/TY0OM4tYw1m0n
 S1Dtv+1KpeJMdwGXIwiuJQYWmpazsVqLGJNCmCi15YcmgNOgs+SPvfNr2Z2xW4N2dSRu
 LeaAZF/WXlwFAPxH0sFxWuTjyPvEZEWiQtT+fnDO8UvMfDr9IwXYRz8ITZrTWJY2HmlG
 Qz1xHX1dbvCPRxboJS3T4KCkZJf4BAcrWSQo1ApwqVaXKehfUYH/0hkohWGsKpMvmLyr
 Hy4h5f40xdrU88j7zSKLtoFNC3szPA1bISp0qCQdcvbq25CeBeSI9UtTke2cS4Yi3LFM
 /bnA==
X-Gm-Message-State: AOJu0YyHQJmy6Vl6FFL8wjNo1MfxqFtxV4u0O/+jviUZgExDR7MKxpGP
 Rg018veL08PErF4tN/prumRnkIzpejsdbWbn3msM+EuA7dayQzPEo7Mt1g==
X-Google-Smtp-Source: AGHT+IHaoETIUGuqH6tCOLiEHS+MsEG6hAjC2VZcH9D0QcgJvm7W/LBxdQfrY3MTl4si0xMMkc/S/w==
X-Received: by 2002:a05:6512:239f:b0:52e:76d5:9504 with SMTP id
 2adb3069b0e04-536587a550dmr4919545e87.3.1725831228889; 
 Sun, 08 Sep 2024 14:33:48 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f903885sm589115e87.185.2024.09.08.14.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Sep 2024 14:33:48 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Sep 2024 23:33:43 +0200
Message-ID: <20240908213345.3340026-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725831230; x=1726436030; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W7vyWTK19kxWYIJ33ZV9lKGB9UhcyvvYO8OEnZONUQ4=;
 b=bf5Kyk1DLaYxBHcyK7xcin6eRWImWLD0MVw/qFPJKelEKMOZ9jVEnu4UO1YQfJTh3F
 jw3Lvys4LUl5H4cX7ZPYNJp9rZVC7EPnvqmecYv9pIudZbb0xLtUXlxGp+vrtlC40T8x
 GYONZodB1rffg33ZtFaz2Y/9FPEw6zygox1zlBoidvD/awiX/07mqDRkXRguZgY2xl3d
 GjwVsddWeHIYxiFGin2L2NBEb7Hrq2PbVDy8hXNoJpXowI14eYMOBqT4kVZj/HXy6Kma
 oL/2MUqQ+JbjBoAu8njWGgnK6Vb7oV0IemiE13SFgYI/C4LMQcqqsMFdJI5XetUcRTvb
 ddaw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bf5Kyk1D
Subject: [Buildroot] [PATCH v3] package/dlib: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Changes v2 -> v3:
  - make options available in menuconfig
  - fix missing D in -DLIB_USE_MKL_FFT=OFF
  - remove some useless comments

Should I enforce using system libraries where alternative internal libraries exist?

Do I add too much license information here? (I assume I only need BSL-1.0)

 package/Config.in      |  1 +
 package/dlib/Config.in | 60 ++++++++++++++++++++++++++
 package/dlib/dlib.hash | 12 ++++++
 package/dlib/dlib.mk   | 97 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 170 insertions(+)
 create mode 100644 package/dlib/Config.in
 create mode 100644 package/dlib/dlib.hash
 create mode 100644 package/dlib/dlib.mk

diff --git a/package/Config.in b/package/Config.in
index f33c4780f8..ef87605b42 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2148,6 +2148,7 @@ menu "Other"
 	source "package/cracklib/Config.in"
 	source "package/dawgdic/Config.in"
 	source "package/ding-libs/Config.in"
+	source "package/dlib/Config.in"
 	source "package/dotconf/Config.in"
 	source "package/double-conversion/Config.in"
 	source "package/eigen/Config.in"
diff --git a/package/dlib/Config.in b/package/dlib/Config.in
new file mode 100644
index 0000000000..54b2cb5e4c
--- /dev/null
+++ b/package/dlib/Config.in
@@ -0,0 +1,60 @@
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
+if BR2_PACKAGE_DLIB
+
+config BR2_PACKAGE_DLIB_GIF_SUPPORT
+	bool "GIF support"
+	select BR2_PACKAGE_GIFLIB
+
+config BR2_PACKAGE_DLIB_JPEG_SUPPORT
+	bool "JPEG support"
+	select BR2_PACKAGE_JPEG
+
+config BR2_PACKAGE_DLIB_JXL_SUPPORT
+	bool "JXL support"
+	select BR2_PACKAGE_LIBJXL
+
+config BR2_PACKAGE_DLIB_GUI_SUPPORT
+	bool "GUI support"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+
+config BR2_PACKAGE_DLIB_PNG_SUPPORT
+	bool "PNG support"
+	select BR2_PACKAGE_LIBPNG
+
+config BR2_PACKAGE_DLIB_USE_BLAS
+	bool "use openblas"
+	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
+	select BR2_PACKAGE_OPENBLAS
+
+config BR2_PACKAGE_DLIB_USE_FFMPEG
+	bool "use ffmpeg"
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_SWSCALE
+
+config BR2_PACKAGE_DLIB_USE_LAPACK
+	bool "use lapack"
+	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_PACKAGE_LAPACK
+
+config BR2_PACKAGE_DLIB_WEBP_SUPPORT
+	bool "WEBP support"
+	select BR2_PACKAGE_WEBP
+
+endif
+
+comment "dlib needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dlib/dlib.hash b/package/dlib/dlib.hash
new file mode 100644
index 0000000000..3bb5a540d0
--- /dev/null
+++ b/package/dlib/dlib.hash
@@ -0,0 +1,12 @@
+sha256  22513c353ec9c153300c394050c96ca9d088e02966ac0f639e989e50318c82d6  dlib-19.24.6.tar.gz
+
+# Hashes for license files:
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
index 0000000000..e182dc754b
--- /dev/null
+++ b/package/dlib/dlib.mk
@@ -0,0 +1,97 @@
+################################################################################
+#
+# dlib
+#
+################################################################################
+
+DLIB_VERSION = 19.24.6
+DLIB_SITE = $(call github,davisking,dlib,v$(DLIB_VERSION))
+DLIB_CMAKE_BACKEND = ninja
+DLIB_SUPPORTS_IN_SOURCE_BUILD = NO
+
+DLIB_LICENSE = \
+	BSD-3-Clause (kissfft, pybind11) \
+	BSL-1.0 (dlib, tools) \
+	CC0-1.0 (examples) \
+	libpng-2.0 (libpng) \
+	MIT OR CC0-1.0 (JoinPaths.cmake)
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
+	-DDLIB_USE_CUDA=OFF \
+	-DDLIB_USE_MKL_FFT=OFF
+
+ifeq ($(BR2_PACKAGE_DLIB_GIF_SUPPORT),y)
+DLIB_CONF_OPTS += -DDLIB_GIF_SUPPORT=ON
+DLIB_DEPENDENCIES += giflib
+else
+DLIB_CONF_OPTS += -DDLIB_GIF_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_DLIB_GUI_SUPPORT),y)
+DLIB_CONF_OPTS += -DDLIB_NO_GUI_SUPPORT=OFF
+DLIB_DEPENDENCIES += xlib_libX11
+else
+DLIB_CONF_OPTS += -DDLIB_NO_GUI_SUPPORT=ON
+endif
+
+ifeq ($(BR2_PACKAGE_DLIB_JPEG_SUPPORT),y)
+DLIB_CONF_OPTS += -DDLIB_JPEG_SUPPORT=ON
+DLIB_DEPENDENCIES += jpeg
+else
+DLIB_CONF_OPTS += -DDLIB_JPEG_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_DLIB_JXL_SUPPORT),y)
+DLIB_CONF_OPTS += -DDLIB_JXL_SUPPORT=ON
+DLIB_DEPENDENCIES += libjxl
+else
+DLIB_CONF_OPTS += -DDLIB_JXL_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_DLIB_PNG_SUPPORT),y)
+DLIB_CONF_OPTS += -DDLIB_PNG_SUPPORT=ON
+DLIB_DEPENDENCIES += libpng
+else
+DLIB_CONF_OPTS += -DDLIB_PNG_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_DLIB_USE_BLAS),y)
+DLIB_CONF_OPTS += -DDLIB_USE_BLAS=ON
+DLIB_DEPENDENCIES += openblas
+else
+DLIB_CONF_OPTS += -DDLIB_USE_BLAS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_DLIB_USE_FFMPEG),y)
+DLIB_CONF_OPTS += -DDLIB_USE_FFMPEG=ON
+DLIB_DEPENDENCIES += ffmpeg
+else
+DLIB_CONF_OPTS += -DDLIB_USE_FFMPEG=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_DLIB_USE_LAPACK),y)
+DLIB_CONF_OPTS += -DDLIB_USE_LAPACK=ON
+DLIB_DEPENDENCIES += lapack
+else
+DLIB_CONF_OPTS += -DDLIB_USE_LAPACK=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_DLIB_WEBP_SUPPORT),y)
+DLIB_CONF_OPTS += -DDLIB_WEBP_SUPPORT=ON
+DLIB_DEPENDENCIES += webp
+else
+DLIB_CONF_OPTS += -DDLIB_WEBP_SUPPORT=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
