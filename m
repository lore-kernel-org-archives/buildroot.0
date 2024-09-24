Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB322CF9C72
	for <buildroot@archiver.kernel.org>; Tue, 24 Sep 2024 02:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14E4841814;
	Tue, 24 Sep 2024 02:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jf3Lswk0E2u; Tue, 24 Sep 2024 02:39:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03F6D4187E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03F6D4187E;
	Tue, 24 Sep 2024 02:39:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BED21BF37A
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 02:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A09481E59
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 02:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cYiSU51RX_Uq for <buildroot@lists.busybox.net>;
 Tue, 24 Sep 2024 02:39:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BCDA181E58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCDA181E58
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCDA181E58
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 02:39:33 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-82aa4fd82a4so191406739f.2
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 19:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727145572; x=1727750372;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1kpDMIYx9WDfV79uXSPx2C0HT2LL/cgyOOXCVgJBMxc=;
 b=vxM6p2t7N76HffhqUxOjlitfijkOkFI9yXy1WHt/u+zseqyhrH8NWjjrx7aJXm16Vt
 9t9ycmumOJsYrFN/fdA5pncCP1i8vKPVyFU9jvxtzZvd4ytjk6s9gsNru8ZijKyMNV4P
 6/QRdbN+uz6MF6U+EonP1ogsXB0NoCNxQXa0NiheywG2E/YvC+++1C+AOWT8U5g+r1Xs
 EbdDpOi/7jHV6bN8U5dwb3qkKkp83BXdA/wuU0HutHuXZaeaeBdwa/4QGtTn9LW5arMD
 3y3Z2LKiH6PQUU1PE5081SvDrEA4GSGD97Vx6neXxE+8r1o+hHXyEyl7ROv+Wf4dgFuo
 j63Q==
X-Gm-Message-State: AOJu0YybBgmuUTRx8vOWkYMB7mt5ukl75RYAjxvVe8t58nb/r+yxBpJX
 DCFsarxmyHsWvIeLgCMYpfCtZRQ7kE3+s0PL6zH8oVjkbSrP7WKztt8PsQ==
X-Google-Smtp-Source: AGHT+IHJEWeTUC2T7QqdgLAE1NOt1Bx5tII9XAYCDXZCijA7sN4rEjuCioa9sEFpMRa/odXBgsmoRw==
X-Received: by 2002:a05:6602:1589:b0:82d:821:969d with SMTP id
 ca18e2360f4ac-83209d322e1mr1048189239f.9.1727145572235; 
 Mon, 23 Sep 2024 19:39:32 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8323f5eacc4sm15459339f.19.2024.09.23.19.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 19:39:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Sep 2024 20:39:17 -0600
Message-Id: <20240924023919.1502635-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727145572; x=1727750372; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1kpDMIYx9WDfV79uXSPx2C0HT2LL/cgyOOXCVgJBMxc=;
 b=h0EgG6gszMZWRIeGw5XrB9idyEhwZ16CA2sM7TLsbL+k6xEYiE+9SjxZMUHQM86BaM
 y/C/J9KcnFby4Bor8vXCXFsicsWTOlSJe2jBUG9z4j8Sip5ilDp2danDOBLRoaXu7imo
 0QZsFsInngWDJtFFKBD8sc0rRWcw674GOt1JUaCHGuQUHrRIsE03n5eNmQwMN8brC1DJ
 dj32vDBJWh/JoTnUoDN+hHfeQQmAOl7ZTrthgz9GoQ++w7hLwZoVzxY5lcevi7LiDTQX
 I9vHMYMmA5zdDf7bRdN1WSDQZ+YvGs7rDxRIMXTmSLQZ0X52HPGctc29gtDU0kVOWs3X
 1uKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=h0EgG6gs
Subject: [Buildroot] [PATCH v2 1/3] package/{python-}protobuf: bump to
 version 28.1
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Christian Stewart <christian@aperture.us>,
 Robert Rose <robertroyrose@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate protobuf build from autotools to cmake.

Migrate protobuf-python to use pypi sources which are now required
for setup.py builds:
https://github.com/protocolbuffers/protobuf/tree/v28.1/python#building-from-setuppy

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/criu/Config.in                       |  2 +-
 package/kismet/Config.in                     | 12 +++--
 package/mosh/Config.in                       |  6 +--
 package/netdata/Config.in                    |  6 +--
 package/ola/Config.in                        |  5 ++-
 package/opencv3/Config.in                    |  6 +--
 package/opencv4/Config.in                    |  9 +++-
 package/protobuf/Config.in                   |  8 ++--
 package/protobuf/protobuf.hash               |  2 +-
 package/protobuf/protobuf.mk                 | 46 ++++++++++++++------
 package/python-protobuf/python-protobuf.hash |  6 ++-
 package/python-protobuf/python-protobuf.mk   |  5 +--
 package/usbguard/Config.in                   |  2 +-
 13 files changed, 74 insertions(+), 41 deletions(-)

diff --git a/package/criu/Config.in b/package/criu/Config.in
index 30b131cd30..90bb18d355 100644
--- a/package/criu/Config.in
+++ b/package/criu/Config.in
@@ -19,7 +19,7 @@ config BR2_PACKAGE_CRIU
 	bool "criu"
 	depends on BR2_PACKAGE_CRIU_ARCH_SUPPORTS
 	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # -march=armv7-a+fp
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # -march=armv7-a+fp, protobuf
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 # rseq.h
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no aio.h
 	depends on !BR2_STATIC_LIBS # protobuf, libbsd
diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index 2e1e0cfbd0..e2a2385f38 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -35,6 +35,7 @@ config BR2_PACKAGE_KISMET_PYTHON_TOOLS
 	bool "Install python tools"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
 	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_STATIC_LIBS # protobuf
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
@@ -52,26 +53,29 @@ comment "python tools needs python3"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 
-comment "python tools needs a glibc or musl toolchain w/ dynamic library"
+comment "python tools needs a glibc or musl toolchain w/ dynamic library, gcc >= 8"
 	depends on BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_KISMET_SERVER
 	bool "Install server"
 	default y
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_USE_WCHAR
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PROTOBUF
 
-comment "server needs a toolchain w/ dynamic library, wchar"
+comment "server needs a toolchain w/ dynamic library, wchar, gcc >= 8"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 comment "server needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/mosh/Config.in b/package/mosh/Config.in
index 5b90358cac..7ca5259ecb 100644
--- a/package/mosh/Config.in
+++ b/package/mosh/Config.in
@@ -1,7 +1,7 @@
-comment "mosh needs a toolchain w/ C++, threads, dynamic library, wchar, gcc >= 4.8"
+comment "mosh needs a toolchain w/ C++, threads, dynamic library, wchar, gcc >= 8"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 config BR2_PACKAGE_MOSH
@@ -9,7 +9,7 @@ config BR2_PACKAGE_MOSH
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
 	depends on !BR2_STATIC_LIBS # protobuf
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_PROTOBUF
diff --git a/package/netdata/Config.in b/package/netdata/Config.in
index d17b5e89aa..3603eb071c 100644
--- a/package/netdata/Config.in
+++ b/package/netdata/Config.in
@@ -23,15 +23,15 @@ config BR2_PACKAGE_NETDATA_PROMETHEUS
 	bool "prometheus remote write backend"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf, snappy
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_SNAPPY
 	help
 	  Enable prometheus remote write backend
 
-comment "prometheus remote write backend needs a toolchain w/ C++, gcc >= 4.8"
+comment "prometheus remote write backend needs a toolchain w/ C++, gcc >= 8"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 endif
diff --git a/package/ola/Config.in b/package/ola/Config.in
index dd0be6f35e..1766f5bd76 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -1,7 +1,7 @@
 comment "ola needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 menuconfig BR2_PACKAGE_OLA
@@ -10,7 +10,7 @@ menuconfig BR2_PACKAGE_OLA
 	depends on !BR2_STATIC_LIBS # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
@@ -35,6 +35,7 @@ config BR2_PACKAGE_OLA_WEB
 config BR2_PACKAGE_OLA_PYTHON_BINDINGS
 	bool "python bindings"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_PROTOBUF
 	help
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index 2ce548f095..a672497108 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -290,14 +290,14 @@ config BR2_PACKAGE_OPENCV3_WITH_PNG
 config BR2_PACKAGE_OPENCV3_WITH_PROTOBUF
 	bool "protobuf support"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
 	select BR2_PACKAGE_PROTOBUF
 	help
 	  Use shared protobuf from the target system.
 
-comment "protobuf support needs a toolchain w/ gcc >= 4.8"
+comment "protobuf support needs a toolchain w/ gcc >= 8"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_OPENCV3_WITH_TIFF
 	bool "tiff support"
diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index f6976d8fb5..f71ceba2c5 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -35,14 +35,16 @@ config BR2_PACKAGE_OPENCV4_LIB_DNN
 	# dnn needs fenv.h which is not provided by uclibc
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	select BR2_PACKAGE_OPENCV4_WITH_PROTOBUF
 	help
 	  Include opencv_dnn (Deep Neural Networks) module into the
 	  OpenCV build.
 
-comment "dnn needs a glibc or musl toolchain"
+comment "dnn needs a glibc or musl toolchain, gcc >= 8"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_HOST_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_OPENCV4_LIB_FEATURES2D
 	bool "features2d"
@@ -155,6 +157,7 @@ config BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
 	bool "objdetect"
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # dnn support
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # dnn support
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # dnn support
 	# opencv_core dependency is already enabled
 	select BR2_PACKAGE_OPENCV4_LIB_CALIB3D
 	select BR2_PACKAGE_OPENCV4_LIB_DNN
@@ -204,6 +207,7 @@ config BR2_PACKAGE_OPENCV4_LIB_SHAPE
 config BR2_PACKAGE_OPENCV4_LIB_STITCHING
 	bool "stitching"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # objdetect
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # objdetect
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # objdetect
 	select BR2_PACKAGE_OPENCV4_LIB_CALIB3D
 	select BR2_PACKAGE_OPENCV4_LIB_FEATURES2D
@@ -333,6 +337,7 @@ config BR2_PACKAGE_OPENCV4_WITH_PNG
 config BR2_PACKAGE_OPENCV4_WITH_PROTOBUF
 	bool "protobuf support"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
 	select BR2_PACKAGE_PROTOBUF
 	help
 	  Use shared protobuf from the target system.
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 47e987fa2b..633201b38c 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -37,6 +37,7 @@ config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	default y if BR2_sparc64
 	default y if BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # fork()
 
 config BR2_PACKAGE_PROTOBUF
@@ -44,8 +45,9 @@ config BR2_PACKAGE_PROTOBUF
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libabseil-cpp
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBABSEIL_CPP
 	help
 	  Protocol buffers are Google's language-neutral,
 	  platform-neutral, extensible mechanism for serializing
@@ -53,7 +55,7 @@ config BR2_PACKAGE_PROTOBUF
 
 	  https://developers.google.com/protocol-buffers
 
-comment "protobuf needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
+comment "protobuf needs a toolchain w/ C++, threads, dynamic library, gcc >= 8"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index b092c9303f..06f4924394 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  4eab9b524aa5913c6fffb20b2a8abf5ef7f95a80bc0701f3a6dbb4c607f73460  protobuf-cpp-3.21.12.tar.gz
+sha256  3b8bf6e96499a744bd014c60b58f797715a758093abf859f1d902194b8e1f8c9  protobuf-28.1.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 8cd4e99e06..6c9017b316 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,16 +7,40 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 21.12
-PROTOBUF_SOURCE = protobuf-cpp-3.$(PROTOBUF_VERSION).tar.gz
+PROTOBUF_VERSION = 28.1
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
 PROTOBUF_CPE_ID_VENDOR = google
 
 # N.B. Need to use host protoc during cross compilation.
-PROTOBUF_DEPENDENCIES = host-protobuf
-PROTOBUF_CONF_OPTS = --with-protoc=$(HOST_DIR)/bin/protoc
+PROTOBUF_DEPENDENCIES = host-protobuf libabseil-cpp
+PROTOBUF_CONF_OPTS = \
+	-Dprotobuf_ABSL_PROVIDER=package \
+	-Dprotobuf_ALLOW_CCACHE=ON \
+	-Dprotobuf_BUILD_CONFORMANCE=OFF \
+	-Dprotobuf_BUILD_LIBPROTOC=OFF \
+	-Dprotobuf_BUILD_LIBUPB=ON \
+	-Dprotobuf_BUILD_PROTOBUF_BINARIES=ON \
+	-Dprotobuf_BUILD_PROTOC_BINARIES=OFF \
+	-Dprotobuf_BUILD_TESTS=OFF \
+	-Dprotobuf_DISABLE_RTTI=OFF \
+	-Dprotobuf_INSTALL=ON \
+	-DWITH_PROTOC=$(HOST_DIR)/bin/protoc
+
+HOST_PROTOBUF_DEPENDENCIES = host-libabseil-cpp
+HOST_PROTOBUF_CONF_OPTS = \
+	-Dprotobuf_ABSL_PROVIDER=package \
+	-Dprotobuf_ALLOW_CCACHE=ON \
+	-Dprotobuf_BUILD_CONFORMANCE=OFF \
+	-Dprotobuf_BUILD_LIBPROTOC=ON \
+	-Dprotobuf_BUILD_LIBUPB=OFF \
+	-Dprotobuf_BUILD_PROTOBUF_BINARIES=ON \
+	-Dprotobuf_BUILD_PROTOC_BINARIES=ON \
+	-Dprotobuf_BUILD_TESTS=OFF \
+	-Dprotobuf_DISABLE_RTTI=OFF \
+	-Dprotobuf_INSTALL=ON \
+	-Dprotobuf_WITH_ZLIB=OFF
 
 PROTOBUF_CXXFLAGS = $(TARGET_CXXFLAGS)
 
@@ -38,14 +62,10 @@ PROTOBUF_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 PROTOBUF_DEPENDENCIES += zlib
+PROTOBUF_CONF_OPTS += -Dprotobuf_WITH_ZLIB=ON
+else
+PROTOBUF_CONF_OPTS += -Dprotobuf_WITH_ZLIB=OFF
 endif
 
-define PROTOBUF_REMOVE_UNNECESSARY_TARGET_FILES
-	rm -rf $(TARGET_DIR)/usr/bin/protoc
-	rm -rf $(TARGET_DIR)/usr/lib/libprotoc.so*
-endef
-
-PROTOBUF_POST_INSTALL_TARGET_HOOKS += PROTOBUF_REMOVE_UNNECESSARY_TARGET_FILES
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index e7af678b97..8ce6039449 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,3 +1,5 @@
-# Locally calculated
-sha256  e2b976e67d6fcf7078f799143a73f2a4d9cf3126ca68a1a6f1bda30fe5f3585c  protobuf-python-4.21.12.tar.gz
+# md5, sha256 from https://pypi.org/pypi/protobuf/json
+md5  44b076f3564d3561067bcc2c455e008a  protobuf-5.28.1.tar.gz
+sha256  42597e938f83bb7f3e4b35f03aa45208d49ae8d5bcb4bc10b9fc825e0ab5e423  protobuf-5.28.1.tar.gz
+# Locally computed sha256 checksums
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index df90254670..02bf2a1d70 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -5,12 +5,11 @@
 ################################################################################
 
 PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
-PYTHON_PROTOBUF_SOURCE = protobuf-python-4.$(PYTHON_PROTOBUF_VERSION).tar.gz
-PYTHON_PROTOBUF_SITE = $(PROTOBUF_SITE)
+PYTHON_PROTOBUF_SOURCE = protobuf-5.$(PYTHON_PROTOBUF_VERSION).tar.gz
+PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/3c/0b/7a997c8939f698d72bdea14d57116e43d3051fffb3b2964c30938c4a08e6
 PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
 PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
 PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf
 PYTHON_PROTOBUF_SETUP_TYPE = setuptools
-PYTHON_PROTOBUF_SUBDIR = python
 
 $(eval $(python-package))
diff --git a/package/usbguard/Config.in b/package/usbguard/Config.in
index f207fa6826..254209ff64 100644
--- a/package/usbguard/Config.in
+++ b/package/usbguard/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_USBGUARD
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libqb, protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf, C++17 filesystem
 	depends on !BR2_STATIC_LIBS # libqb, protobuf
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	select BR2_PACKAGE_PROTOBUF
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
