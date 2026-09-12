Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF37C88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 10:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EA8160603;
	Sat, 12 Sep 2026 10:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B-qTcEjsAdXs; Sat, 12 Sep 2026 10:49:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D8C1160617
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789210147;
	b=Afw50DW5xIRG1cndh+h5VveqZzHCObJE/TMf+7CpE8t+tVuIu1s5ELKSmTVR8HqHGnDX
	 zfsYXp8UpG08Wckn3vPnswVWaxWH4keXDqjG0FF4eZ58KKwoledbInFDPI0T7e8wqdTEe
	 OXBa+VVWxWJO2SMvnSYr96FN9zpRqHf+c4pEW56vOB8nAHl/kKGGaDmPniYQsDXGga/Yz
	 jO5PNHwhA40R5yGoL9k3jnNoWS54GYCRbPLeGSQr0MY9ak0+Aa2rJaeiyazophXP4kSkO
	 ESlb0ySQ3I9ELrqWsQuIxEmypvWgtQDXb6qqT6ORbbqrk6HHYkR+mSGtFLdLI9Dz5vQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789210147;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eBS/f/KRKFydJ2Xr/D9lwRu9iLcVVLWKrAzSJGmoBdE=;
	b=MA6HT5tvz1lx6Z5oFAtVibz/wCWUlfnG3DZR/xsPxgNTw8PRnDUUeQujS2n7NVoJOrIc
	 9ET6ZgO9xTGwrbzOmHKAkyqejvKuuNBgWrzo59/sL0/NCTzth1+CMLPBF85Nspji4aAPV
	 cxFQFrWqE/7AC0GEeWW+xXvCRsj7grcgmUvnXqVFNP3H8IfQ+RM3fN97+GloT75MGwJxN
	 +6gKLyeRc7mdrm4XfXd3RkX1hQ/WKTcANBQ39ncyV2nRNEYs/lXBibTTIianJVNDvdL7y
	 1ByRMpnO2LpJdbeYsdSSjAL7aK3wSh3HNsep+Gn9fPmC1KvJuual81s45YMcX7A+t8Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789210146;
	bh=eBS/f/KRKFydJ2Xr/D9lwRu9iLcVVLWKrAzSJGmoBdE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qjoS1ABwnw1gyVhuMNhzj8okfGFTs6rkHNlk+RwVmsCNi7Vp0nuZe6MhLlkl/np5D
	 2f+KUMPeYwwTVi+3HXGJuAo7nVxcxz42LeR5vfhepiB+4I35j1OGFbhtAzrBwNFkQk
	 aBFog4VefZXUxvX3q6257gZihi1guHzxxYT63x0r/hdnmg3xln61YxU2PpGSzmcnE/
	 K4KUZZ1deCHyyVJbMVjZKBGUSc8fo709htU7KFnyrgCmSpl2Ms0+dG5gSpfypchhEo
	 aLAV1xa4AkVJx+5akR+N/oqmEag2YTR09MKdcjxhF0y0ljNI9F1Fn0YuwprupGojQX
	 euDuWadvxl+AQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8C1160617;
	Sat, 12 Sep 2026 10:49:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 23290701
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 10:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1532560621
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 10:49:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DGbOMWS9tivX for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 10:49:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 40B8D60603
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789210142;
 b=U/ugIOD0m+FFfEkEzDhLeNNWHwCoO+95w8MmP4s1umnmSXQrkHuWwCUM13ZJrPkpJ2Jx
 KHiekCPxKYPnkjznrlW3mCisAiAo5vh9CoPBCPnzBU6A2Q2qGBill3FI2pNeW8WPNv/dU
 //RPcZ5hriVYG063hqh1hsesXarhAvGgpo6mAneOtj0MRklcgw3ScCmzfb5nFwQ4RMyka
 0kN+01Lbgwpj+Yr/YxXpzAsbszWbgIYRQHDEb4BJ26eXu5cj0tTx58BMxlkODmJWtORRI
 t5BQGOW/os0VR4h55N7YC68JryfcVC9VQERXzSGfkwpYSbMnBa9xnF+c2ahCgMFSVMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789210142;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ojQjrV/gMtjndqqdum0h119SuuZ8XRH/U/KhZ89Knac=;
 b=fOCPY1pDGRIDg7Z71icxNZj9/svWnL1/FZ3sE8G3SYgX3wx+lZ97vYGuAA+fD/yBXIzO
 zHmFfgVzx+NV2uDDrWzhfjXfObb+gdKlKyrbGz4fkZjTBgfScTm5GtSCuYaJ8FhD3LID8
 EiBRRW9L/bCnBHmwzF9COYVFrJMkaF2oFifS+8y14ieSIQt2OQU+G8NrCZcFJ2wEBXSxR
 u3s2L70g6SweuOaxsdSHV8z/MT/tEHIc3WuQw4ZcDYH7usVdT1/+ElWdnDN0UeUj01VOY
 uoiC2lE7Un3gavctnuHt4ktdm0uUgzEkipLgtJU8J22V1ELxMy9MndpgyRh2Im9LdrA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40B8D60603
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 10:49:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3D8595584; Sat, 12 Sep 2026 10:47:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 11:24:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc1f1818d9e603b67164c20ae8dfe423e14abc4f
X-Git-Newrev: 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c
X-Patchwork-Hint: ignore
Message-Id: <20260912104757.D3D8595584@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libabseil-cpp: bump to version
 20260817.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- libabseil now requires gcc >= 10
- drop patch trying to fix build with gcc <= 12 as this is now handled
  in protobuf >= 35 directly.

Changelog:
https://github.com/abseil/abseil-cpp/releases/tag/20260817.0
https://github.com/abseil/abseil-cpp/releases/tag/20260526.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/collectd/Config.in                         |  2 +-
 package/falcosecurity-libs/Config.in               |  2 +-
 package/grpc/Config.in                             |  6 +--
 ...ix-ABSL_ATTRIBUTE_WARN_UNUSED-with-gcc-12.patch | 55 ----------------------
 package/libabseil-cpp/Config.in                    |  6 +--
 package/libabseil-cpp/libabseil-cpp.hash           |  2 +-
 package/libabseil-cpp/libabseil-cpp.mk             |  2 +-
 package/protobuf/Config.in                         |  6 +--
 package/re2/Config.in                              |  6 +--
 package/sysdig/Config.in                           |  6 +--
 package/tensorflow-lite/Config.in                  |  6 +--
 package/webrtc-audio-processing/Config.in          |  6 +--
 12 files changed, 25 insertions(+), 80 deletions(-)

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
index 2c3e702743..7a37fe92ae 100644
--- a/package/libabseil-cpp/libabseil-cpp.hash
+++ b/package/libabseil-cpp/libabseil-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4314e2a7cbac89cac25a2f2322870f343d81579756ceff7f431803c2c9090195  libabseil-cpp-20260107.1.tar.gz
+sha256  f7e05179df39c45434cad433f5783840bb3788ef322976f9138bc6b72b3a107d  libabseil-cpp-20260817.0.tar.gz
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  LICENSE
diff --git a/package/libabseil-cpp/libabseil-cpp.mk b/package/libabseil-cpp/libabseil-cpp.mk
index 2fdccee280..caa78cf869 100644
--- a/package/libabseil-cpp/libabseil-cpp.mk
+++ b/package/libabseil-cpp/libabseil-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBABSEIL_CPP_VERSION = 20260107.1
+LIBABSEIL_CPP_VERSION = 20260817.0
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
