Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F204ECE579
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 12:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D469D6066A;
	Mon,  9 Sep 2024 12:11:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOkYq_K70KJq; Mon,  9 Sep 2024 12:11:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A76F4606CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A76F4606CE;
	Mon,  9 Sep 2024 12:11:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C72061BF366
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 12:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C141A80BCD
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 12:11:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfbH0riEvH1k for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 12:11:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5C0D480BCF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C0D480BCF
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C0D480BCF
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 12:11:25 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53660856a21so1917819e87.2
 for <buildroot@buildroot.org>; Mon, 09 Sep 2024 05:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725883883; x=1726488683;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=shW1u5lr8YAZNkjoci6X+7d8JcZDEAaFt8UWbxudvIs=;
 b=ZlmdwrzjHB/O5W1yoZIPEYtd1NCR0WIcE1UxL/HLVWigUZLglUuYAeuyXKhRCvAQxJ
 0j+WVnpz14ZGQRZK6sxGu1ailzp+WiWL0XC1piNsZ/DCT6qrRscrvcdKG9+4WC/daG/A
 k/PX0GhLEld38wJVqfqrWMeEGWOXOb/DA7qRSbQQAr0LS3ofxg4UtKFIM4Mz9ui/95bL
 8QQ7+nYJWsy+grAoc8L9wZ0Netk6dtT8+4/JY49SkTa0mfTl2gcjVxdKPe6o5jwq6Vs2
 gTmDQroe0YLlTgNxx8p3CMoBKLN9EM8K+cKjR7sasUexPFzEfuD/Zcas+CirNefCRyBf
 LJzQ==
X-Gm-Message-State: AOJu0YztSGIRjG0WJLMdvcwqZeMLKYpyqe41EG3nEg/EAHcFZohIAWZ/
 kKILccmXcoc91lJAW5TDPfbXnJ2j01uT86FnhQ53slxtxPX92UYt4j2Djg==
X-Google-Smtp-Source: AGHT+IFjcvgbP35T2OnA6+dTroTj84wBYd+FhCopH04x//wI07ngYV+HicDcp/IA6iDldO636PMRGg==
X-Received: by 2002:a05:6512:12c1:b0:52e:9382:a36 with SMTP id
 2adb3069b0e04-536587b902bmr6907580e87.30.1725883881903; 
 Mon, 09 Sep 2024 05:11:21 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f905a06sm747560e87.241.2024.09.09.05.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 05:11:21 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 Sep 2024 14:11:12 +0200
Message-ID: <20240909121115.1165942-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725883883; x=1726488683; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=shW1u5lr8YAZNkjoci6X+7d8JcZDEAaFt8UWbxudvIs=;
 b=GOqbsPq9YtRuaaYM6Nvgda8Ut3SFZpw30sUBsIZ7pPvYzEKalF5+QhTikbiDYU6pwS
 OYTd0QDvUzSTmUeAAdmfHN4YGrmB8wjO9hy3WhGXw1hTTtzZ9KPza+q+1rGU42l/Dm+H
 2/YHSMr56sHsWRqV40xRFY9vlqv+VWLo7IKj/daKB+k4B/LWR9xdlE3HUKy64JdyIKU1
 WtOmeq5bc8ZgkyL9o2Ulz78HroKZyBhFhYyFT/ABfE7jzAHmYREEl+0P29uGiY4BsaE0
 Y+NkZOKzR8qrk+7R6bZHLEqL2t2Oi/XdcJ76UtF0YbWPjk3gq9Ay3K3xFDHBBu2kOHRh
 y/ug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GOqbsPq9
Subject: [Buildroot] [PATCH v4 1/2] package/dlib: new package
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
Changes v3 -> v4:
  - sort config options
  - since this is a library install to staging
  - set DLIB_LINK_WITH_SQLITE3=OFF

Should I enforce using system libraries where alternative internal libraries exist?

Do I add too much license information here? (I assume I only need BSL-1.0)

 package/Config.in      |  1 +
 package/dlib/Config.in | 60 +++++++++++++++++++++++++
 package/dlib/dlib.hash | 12 +++++
 package/dlib/dlib.mk   | 99 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 172 insertions(+)
 create mode 100644 package/dlib/Config.in
 create mode 100644 package/dlib/dlib.hash
 create mode 100644 package/dlib/dlib.mk

diff --git a/package/Config.in b/package/Config.in
index 17855fed30..b731e8cf5e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2150,6 +2150,7 @@ menu "Other"
 	source "package/cracklib/Config.in"
 	source "package/dawgdic/Config.in"
 	source "package/ding-libs/Config.in"
+	source "package/dlib/Config.in"
 	source "package/dotconf/Config.in"
 	source "package/double-conversion/Config.in"
 	source "package/eigen/Config.in"
diff --git a/package/dlib/Config.in b/package/dlib/Config.in
new file mode 100644
index 0000000000..77ff5086ae
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
+config BR2_PACKAGE_DLIB_GUI_SUPPORT
+	bool "GUI support"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+
+config BR2_PACKAGE_DLIB_JPEG_SUPPORT
+	bool "JPEG support"
+	select BR2_PACKAGE_JPEG
+
+config BR2_PACKAGE_DLIB_JXL_SUPPORT
+	bool "JXL support"
+	select BR2_PACKAGE_LIBJXL
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
index 0000000000..5acc32e4b6
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
+	-DDLIB_LINK_WITH_SQLITE3=OFF \
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
