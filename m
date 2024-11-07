Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE5ED5D685
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 19:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C180341E82;
	Thu,  7 Nov 2024 19:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UI3JM2WjHxQa; Thu,  7 Nov 2024 19:18:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C96CB41E83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C96CB41E83;
	Thu,  7 Nov 2024 19:18:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B49BC0
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 19:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 694AF6110F
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 19:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVm_QBBa_CNS for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 19:18:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF83E6113D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF83E6113D
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF83E6113D
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 19:18:09 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-83ac4dacaf9so49077039f.2
 for <buildroot@buildroot.org>; Thu, 07 Nov 2024 11:18:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731007088; x=1731611888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E1ryL/+sJjSZJOPMFY3wJdL3eNnPQEK7bRIIGdqvU3Q=;
 b=mNhTbbTqXO2V64RduPzZC0yejFDVgBMrOyZFOjy8fEX2fSF7RSijq5FO1phLhayiqU
 TLc85RgwO9BLODAAya1BhfGT5k2kTeMgwp5eQg8eIQ9kZfY8jr1y/y9POjqXZONlGxiz
 ixfnA3opXL3PUQg02iqSXbvfhGjFU2QQRdr9DhlV9LK0wDt3/0g1VFG2vKLxMWtY5qCE
 aUn+gGwwXlIXDKFmrMY6ziUQf1tqCNXXbpWCzNZv1R0xfxtZA/4fTesYRKr02Tuo84pj
 W+i/N6RLK8RgH1UNz/RDqqMerOeMuWlaw6nAnITHqNbOsikutpzbQaS9SYnyIbKVKn0g
 j6bQ==
X-Gm-Message-State: AOJu0Yzoz8965tLKl/r6sNm4F2h5KR4sJZ8RZ/va6DygcljtZmKniWPQ
 8Dj61ekVALJDzLL/5FDPkt/blXXRKEO2+PG1VfdifydIgT9aFlkGBX5FLQ==
X-Google-Smtp-Source: AGHT+IEnul958jbbHfkzm4EMmLj6jRziWNTtuKhn3dDdNXEkQS2iWUDOwXSfPKda/qGlpHkYAojKpQ==
X-Received: by 2002:a05:6602:3fd0:b0:83a:639b:bc44 with SMTP id
 ca18e2360f4ac-83e03289e44mr4292639f.3.1731007088458; 
 Thu, 07 Nov 2024 11:18:08 -0800 (PST)
Received: from james-x399.localdomain (97-118-149-1.hlrn.qwest.net.
 [97.118.149.1]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de5f8cdd00sm441546173.108.2024.11.07.11.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 11:18:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Nov 2024 12:16:32 -0700
Message-Id: <20241107191634.378670-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107191634.378670-1-james.hilliard1@gmail.com>
References: <20241107191634.378670-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731007088; x=1731611888; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E1ryL/+sJjSZJOPMFY3wJdL3eNnPQEK7bRIIGdqvU3Q=;
 b=ePOQ4FBC/cT1sB1/N/4rq3NWnRiD+uVQ2LhwT4D8XOcLUxhoviM5BbyZVTj7hg4pr7
 aHZnnI/6ZaUSN4QtIHg+MW8NyPooI/xM/LSh9ESCFT/n8S4/BjAMm3kywKlfBoVfxpI+
 UB2+dGTgF5+Qu50XDF26+zSCxCI6E51q8FlegGhAC+jdbed+nxdtGAlpRVpJx5aXVSyV
 ytYKNC/MoC/gl8XoU8HKiSDPI2ctHYU1dsVZvZObEBMrNA6jPI7DfiXhB70uhrO+NH85
 Z5CyWWmSexxFs1csZ5ZGyWZLj/OOm8JCMeBjTGASWR9Hyjbt+znA04b8VNpSQWtji2k0
 6ETw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ePOQ4FBC
Subject: [Buildroot] [PATCH v5 2/4] package/{python-}protobuf: bump to
 version 28.1
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Julien Olivain <ju.o@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
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

The BR2_or1k workaround is removed, as protobuf depends on
libabseil-cpp, which isn't available on OpenRISC.

The BR2_TOOLCHAIN_HAS_GCC_BUG_85180 workaround is removed, as this
workaround is for Microblaze, and protobuf depends on libabseil-cpp,
which isn't avialable on Microblaze.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v4 -> v5:
  - fixup some autotools -> cmake migration issues
---
 package/criu/Config.in                       |  2 +-
 package/kismet/Config.in                     | 12 ++--
 package/mosh/Config.in                       |  6 +-
 package/netbird/netbird.hash                 |  3 +
 package/netbird/netbird.mk                   | 25 ++++++++
 package/netdata/Config.in                    |  6 +-
 package/ola/Config.in                        |  5 +-
 package/opencv3/Config.in                    |  6 +-
 package/opencv4/Config.in                    |  9 ++-
 package/protobuf/Config.in                   |  8 ++-
 package/protobuf/protobuf.hash               |  2 +-
 package/protobuf/protobuf.mk                 | 60 +++++++++++---------
 package/python-protobuf/python-protobuf.hash |  6 +-
 package/python-protobuf/python-protobuf.mk   |  5 +-
 package/usbguard/Config.in                   |  2 +-
 15 files changed, 103 insertions(+), 54 deletions(-)
 create mode 100644 package/netbird/netbird.hash
 create mode 100644 package/netbird/netbird.mk

diff --git a/package/criu/Config.in b/package/criu/Config.in
index fc6897c4d0..a56dbe56ff 100644
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
index aa05e045d5..65c17baeaf 100644
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
@@ -51,26 +52,29 @@ comment "python tools needs python3"
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
diff --git a/package/netbird/netbird.hash b/package/netbird/netbird.hash
new file mode 100644
index 0000000000..24d9e74c0d
--- /dev/null
+++ b/package/netbird/netbird.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  c736d7d3796eb7a5446ff0ccc562e4f79d8fa6f33e11047e4af9cb3202a4c7e3  netbird-0.31.0-go2.tar.gz
+sha256  c9f34c452ac8f054df592e3eeca0e271b91e8010c0fc6cf8c76aabf547a9388d  LICENSE
diff --git a/package/netbird/netbird.mk b/package/netbird/netbird.mk
new file mode 100644
index 0000000000..228639dba0
--- /dev/null
+++ b/package/netbird/netbird.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# netbird
+#
+################################################################################
+
+NETBIRD_VERSION = 0.31.0
+NETBIRD_SITE = $(call github,netbirdio,netbird,v$(NETBIRD_VERSION))
+NETBIRD_LICENSE = BSD-3-Clause
+NETBIRD_LICENSE_FILES = LICENSE
+NETBIRD_GOMOD = github.com/netbirdio/netbird
+NETBIRD_BUILD_TARGETS = client
+NETBIRD_LDFLAGS = \
+	-X github.com/netbirdio/netbird/version.version=$(NETBIRD_VERSION)
+
+define NETBIRD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/client $(TARGET_DIR)/usr/bin/netbird
+endef
+
+define NETBIRD_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIREGUARD)
+endef
+
+$(eval $(golang-package))
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
index 8cd4e99e06..ffed3166c7 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,45 +7,53 @@
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
-
-PROTOBUF_CXXFLAGS = $(TARGET_CXXFLAGS)
-
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
-PROTOBUF_CXXFLAGS += -O0
-endif
-
-ifeq ($(BR2_or1k),y)
-PROTOBUF_CXXFLAGS += -mcmodel=large
-endif
-
-PROTOBUF_CONF_ENV = CXXFLAGS="$(PROTOBUF_CXXFLAGS)"
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
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-PROTOBUF_CONF_ENV += LIBS=-latomic
+PROTOBUF_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif
 
 PROTOBUF_INSTALL_STAGING = YES
 
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
