Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B797CD98E1
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 09:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6EC66F4E4;
	Tue, 16 Jun 2026 09:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id poKRZdzBdQPZ; Tue, 16 Jun 2026 09:21:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9CF06F4E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781601683;
	bh=JCmp5YA+ZLoMPc0pvfj823XxlhZiHWeCyPM/Nf6Az/g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=EpCL3z6PYyUpF2n71BcfG97AxVtyj8YmD16ac/064iyRldp4gqVYwQwyrKWIEtXtu
	 kSEwQ4rQzPoTjeK6j7Jz9cXmpSMK91mrNgAwff40mSqR0+z6irtrak0hYUs4nI7VeS
	 A41F7/A3L/gM1vm62DargdRKUEez5tx7RVrDwe0FOInsmA+W6Mqk1yORvVM+EYHZl1
	 10EcpElzRzRgiCMWSXnb+ltm2/Hf66mo+qJF/nSphHvBJTjp3xuy8nFrOL+COtvhPk
	 51dlCXA8jVs6yUu+WH2yW60CoH0qcxQEWh7kQ1UPqatYNuZar5Xo/2VPuk1E1HOhB/
	 ei2jQwVfHQi5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9CF06F4E5;
	Tue, 16 Jun 2026 09:21:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD2212F3
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 09:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEABB42D43
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 09:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wyry4Sl7nEON for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 09:21:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6E89A42D3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E89A42D3E
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E89A42D3E
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 09:21:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D12081814BE; Tue, 16 Jun 2026 11:21:15 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 16 Jun 2026 11:20:54 +0200
Message-ID: <20260616092055.1129344-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1781601676; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=VzfbW0DFFWWUyvjGG05HtmvGqAMwiiY+UvKyOkQ70BQ=;
 b=iBmFjagGahBNECeVpVnsh/Qz0XvjOKk705MwO06JUHLjPpmVdKgy5XfIU0Dk42loQeB+4Q
 vLr5CqyOs6WZ7V2GA0k+0R3vtT2PiSgl8gsoMTSl4CJv9BAJdvkVKE8q0ODI/40GwbAp5A
 gVmT0DMVDxuwnrbMYS2tc/D33Biio88=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=iBmFjagG
Subject: [Buildroot] [PATCH] package/libabseil-cpp: bump to version
 20260526.0
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Robert Rose <robertroyrose@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Francis Laniel <flaniel@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- libabseil now requires gcc >= 10
- drop patch trying to fix build with gcc <= 12 as this is now handled
  in protobuf >= 35 directly.

Changelog:
https://github.com/abseil/abseil-cpp/releases/tag/20260526.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/collectd/Config.in                    |  2 +-
 package/falcosecurity-libs/Config.in          |  2 +-
 package/grpc/Config.in                        |  6 +-
 ...SL_ATTRIBUTE_WARN_UNUSED-with-gcc-12.patch | 55 -------------------
 package/libabseil-cpp/Config.in               |  6 +-
 package/libabseil-cpp/libabseil-cpp.hash      |  2 +-
 package/libabseil-cpp/libabseil-cpp.mk        |  2 +-
 package/protobuf/Config.in                    |  6 +-
 package/re2/Config.in                         |  6 +-
 package/sysdig/Config.in                      |  6 +-
 package/tensorflow-lite/Config.in             |  6 +-
 package/webrtc-audio-processing/Config.in     |  6 +-
 12 files changed, 25 insertions(+), 80 deletions(-)
 delete mode 100644 package/libabseil-cpp/0002-base-fix-ABSL_ATTRIBUTE_WARN_UNUSED-with-gcc-12.patch

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index d1ed36ef5e..8df1f5fa9b 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -692,7 +692,7 @@ config BR2_PACKAGE_COLLECTD_GRPC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # grpc
 	depends on BR2_INSTALL_LIBSTDCPP # grpc -> protobuf
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # grpc -> protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # grpc -> libabseil-cpp
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # grpc -> libabseil-cpp
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
 	select BR2_PACKAGE_GRPC
 	help
diff --git a/package/falcosecurity-libs/Config.in b/package/falcosecurity-libs/Config.in
index 028a0ed28b..9e6c2d0227 100644
--- a/package/falcosecurity-libs/Config.in
+++ b/package/falcosecurity-libs/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_FALCOSECURITY_LIBS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp, protobuf, tbb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # grpc -> libabseil-cpp
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # grpc -> libabseil-cpp
 	depends on BR2_TOOLCHAIN_HAS_THREADS # jq, protobuf, tbb
 	depends on !BR2_STATIC_LIBS # protobuf, tbb
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # grpc
diff --git a/package/grpc/Config.in b/package/grpc/Config.in
index 7664948b40..bdb31fc899 100644
--- a/package/grpc/Config.in
+++ b/package/grpc/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_GRPC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, re2
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libabseil-cpp, re2
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # libabseil-cpp, re2
 	depends on !BR2_STATIC_LIBS # protobuf, libabseil-cpp, re2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
@@ -19,9 +19,9 @@ config BR2_PACKAGE_GRPC
 
 	  http://github.com/grpc/grpc
 
-comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 8"
+comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 10"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
diff --git a/package/libabseil-cpp/0002-base-fix-ABSL_ATTRIBUTE_WARN_UNUSED-with-gcc-12.patch b/package/libabseil-cpp/0002-base-fix-ABSL_ATTRIBUTE_WARN_UNUSED-with-gcc-12.patch
deleted file mode 100644
index 8f5e255795..0000000000
--- a/package/libabseil-cpp/0002-base-fix-ABSL_ATTRIBUTE_WARN_UNUSED-with-gcc-12.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 77326826119439c06e341c9d090633ecd9b520d6 Mon Sep 17 00:00:00 2001
-From: Julien Olivain <ju.o@free.fr>
-Date: Mon, 27 Apr 2026 19:38:19 +0200
-Subject: [PATCH] base: fix ABSL_ATTRIBUTE_WARN_UNUSED with gcc <= 12
-
-Gcc <= 12 does not support mixing standard C++ attributes with
-GNU attributes. See [1].
-
-This can lead to build failures such as [2] [3] and [4]. In those
-situations, the compilation fails with error such as:
-
-    /usr/include/absl/base/attributes.h:1076:36: error: expected identifier before '[' token
-
-Gcc maintainers mentioned in [1] comment 9 that this bugfix will
-not be backported in Gcc 12. Gcc 12 is still used in LTS
-distributions. For example, it is included in Debian 12 (Bookworm),
-which is still supported until 2028. See [5].
-
-This commit adds a workaround for gcc <= 12 which uses
-__attribute__ in that case, which fixes the compilation failure.
-
-[1] https://gcc.gnu.org/PR69585
-[2] https://github.com/protocolbuffers/protobuf/issues/26383
-[3] https://autobuild.buildroot.org/results/33f6cfd37cb48c15a53b3e7123d5ce8388a0f2ab/build-end.log
-[4] https://gitlab.com/buildroot.org/buildroot/-/jobs/13904066346
-[5] https://www.debian.org/releases/bookworm/
-
-Upstream: https://github.com/abseil/abseil-cpp/pull/2044
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- absl/base/attributes.h | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/absl/base/attributes.h b/absl/base/attributes.h
-index 5887fcaf..a26143e1 100644
---- a/absl/base/attributes.h
-+++ b/absl/base/attributes.h
-@@ -1092,7 +1092,14 @@ struct AbslInternal_YouForgotToExplicitlyInitializeAField {
- // See https://clang.llvm.org/docs/AttributeReference.html#warn-unused and
- // https://gcc.gnu.org/onlinedocs/gcc/C_002b_002b-Attributes.html#index-warn_005funused-type-attribute
- #if ABSL_HAVE_CPP_ATTRIBUTE(gnu::warn_unused)
-+// Only GCC >= 13 allows mixing standard and gnu attributes.
-+// In case of gcc < 13, fallback on using __attribute__.
-+// https://gcc.gnu.org/PR69585
-+#if defined(__GNUC__) && !defined(__clang__) && __GNUC__ < 13
-+#define ABSL_ATTRIBUTE_WARN_UNUSED __attribute__((warn_unused))
-+#else
- #define ABSL_ATTRIBUTE_WARN_UNUSED [[gnu::warn_unused]]
-+#endif
- #else
- #define ABSL_ATTRIBUTE_WARN_UNUSED
- #endif
--- 
-2.54.0
-
diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
index 6bbe9518b2..d13bf6e663 100644
--- a/package/libabseil-cpp/Config.in
+++ b/package/libabseil-cpp/Config.in
@@ -18,7 +18,7 @@ config BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 config BR2_PACKAGE_LIBABSEIL_CPP
 	bool "libabseil-cpp"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++17
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # uses dlfcn.h
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
@@ -31,7 +31,7 @@ config BR2_PACKAGE_LIBABSEIL_CPP
 
 	  https://github.com/abseil/abseil-cpp
 
-comment "libabseil-cpp needs a toolchain w/ gcc >= 8, C++, threads, dynamic library"
+comment "libabseil-cpp needs a toolchain w/ gcc >= 10, C++, threads, dynamic library"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
diff --git a/package/libabseil-cpp/libabseil-cpp.hash b/package/libabseil-cpp/libabseil-cpp.hash
index 2c3e702743..c1603b7d70 100644
--- a/package/libabseil-cpp/libabseil-cpp.hash
+++ b/package/libabseil-cpp/libabseil-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4314e2a7cbac89cac25a2f2322870f343d81579756ceff7f431803c2c9090195  libabseil-cpp-20260107.1.tar.gz
+sha256  6e1aee535473414164bf83e4ebc40240dec71a4701f8a642d906e95bea1aea0c  libabseil-cpp-20260526.0.tar.gz
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  LICENSE
diff --git a/package/libabseil-cpp/libabseil-cpp.mk b/package/libabseil-cpp/libabseil-cpp.mk
index 2fdccee280..f239f8872e 100644
--- a/package/libabseil-cpp/libabseil-cpp.mk
+++ b/package/libabseil-cpp/libabseil-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBABSEIL_CPP_VERSION = 20260107.1
+LIBABSEIL_CPP_VERSION = 20260526.0
 LIBABSEIL_CPP_SITE = $(call github,abseil,abseil-cpp,$(LIBABSEIL_CPP_VERSION))
 LIBABSEIL_CPP_LICENSE = Apache-2.0
 LIBABSEIL_CPP_LICENSE_FILES = LICENSE
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 633201b38c..ae4044ea32 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -45,7 +45,7 @@ config BR2_PACKAGE_PROTOBUF
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libabseil-cpp
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # libabseil-cpp
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBABSEIL_CPP
 	help
@@ -55,7 +55,7 @@ config BR2_PACKAGE_PROTOBUF
 
 	  https://developers.google.com/protocol-buffers
 
-comment "protobuf needs a toolchain w/ C++, threads, dynamic library, gcc >= 8"
+comment "protobuf needs a toolchain w/ C++, threads, dynamic library, gcc >= 10"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
diff --git a/package/re2/Config.in b/package/re2/Config.in
index acc4bdbe46..b2de476bad 100644
--- a/package/re2/Config.in
+++ b/package/re2/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_RE2
 	bool "re2"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++17, libabseil-cpp
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # libabseil-cpp
 	select BR2_PACKAGE_LIBABSEIL_CPP
@@ -14,8 +14,8 @@ config BR2_PACKAGE_RE2
 
 	  https://github.com/google/re2
 
-comment "re2 needs a toolchain w/ C++, threads, dynamic library, gcc >= 8"
+comment "re2 needs a toolchain w/ C++, threads, dynamic library, gcc >= 10"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 3a3670f5cb..a6e6809d82 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SYSDIG
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # falcosecurity-libs
 	depends on BR2_LINUX_KERNEL # falcosecurity-libs
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # falcosecurity-libs -> grpc -> libabseil-cpp
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # falcosecurity-libs -> grpc -> libabseil-cpp
 	depends on BR2_TOOLCHAIN_HAS_THREADS # falcosecurity-libs
 	depends on !BR2_STATIC_LIBS # falcosecurity-libs
 	depends on BR2_TOOLCHAIN_USES_GLIBC # falcosecurity-libs
@@ -23,12 +23,12 @@ config BR2_PACKAGE_SYSDIG
 
 	  https://github.com/draios/sysdig/wiki
 
-comment "sysdig needs a glibc toolchain w/ C++, threads, gcc >= 8, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
+comment "sysdig needs a glibc toolchain w/ C++, threads, gcc >= 10, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_USES_GLIBC \
 		|| !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
diff --git a/package/tensorflow-lite/Config.in b/package/tensorflow-lite/Config.in
index 99d219622d..751b963b22 100644
--- a/package/tensorflow-lite/Config.in
+++ b/package/tensorflow-lite/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_TENSORFLOW_LITE
 	bool "tensorflow-lite"
 	depends on BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libabseil-cpp
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # libabseil-cpp
 	depends on BR2_TOOLCHAIN_HAS_THREADS # cpuinfo
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_SHARED_LIBS
@@ -30,9 +30,9 @@ config BR2_PACKAGE_TENSORFLOW_LITE
 
 	  https://www.tensorflow.org/
 
-comment "tensorflow-lite needs a toolchain w/ gcc >= 8, C++, threads"
+comment "tensorflow-lite needs a toolchain w/ gcc >= 10, C++, threads"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP || \
-			!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_HAS_THREADS
+			!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "tensorflow-lite needs a toolchain w/ shared libraries"
 	depends on !BR2_SHARED_LIBS
diff --git a/package/webrtc-audio-processing/Config.in b/package/webrtc-audio-processing/Config.in
index cb3b21367b..051985f5e3 100644
--- a/package/webrtc-audio-processing/Config.in
+++ b/package/webrtc-audio-processing/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
 	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libabseil-cpp
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # libabseil-cpp
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # libabseil-cpp
@@ -18,8 +18,8 @@ config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
 
 	  http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/
 
-comment "webrtc-audio-processing needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 8"
+comment "webrtc-audio-processing needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 10"
 	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
