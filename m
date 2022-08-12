Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB522C00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 20:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2284C41719;
	Fri, 12 Aug 2022 20:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2284C41719
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BKfrBN_P0DYY; Fri, 12 Aug 2022 20:43:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72BF641682;
	Fri, 12 Aug 2022 20:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72BF641682
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C20E11BF354
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 20:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9489441682
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 20:42:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9489441682
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rnXE3dYPOkyK for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 20:42:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0733541678
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0733541678
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 20:42:57 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 d24-20020a1c7318000000b003a5c1bf4f27so1028220wmb.4
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 13:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=S16Uv9gswKvY23hSdrmsNPTflHf99j7VE8cgt9kzR9I=;
 b=vSymxAEDi++tQG+hgjcX8Lr+Ceidu6M8ktvtpOo8GmGvewRjL52KORbwPEieGHYeh9
 uvZR1oZpOUetv3EYcG0bbDf/favFRCirUpmLRD12oELm/7tgEtNcJZIc7/8PjKj5vSdL
 aqkNlB9oX/V6DcJZYdxoebO0Ot8ucki8QXg6pVd5lflwWOhHpIXmQUOX54Vcjfysz6ju
 RkUw5l0RbxiZ059nJFyfPOgCW/HqZHwQyrbl9tzISpaHtQPSO89DWREsaCvS/hOwuA7m
 KbYQUE15I3J2GGQg08VeZAnvEf5cCQgXhRh+ySyz821ovG8bU5n+g/U+8LKsGxLgTh1g
 m0LA==
X-Gm-Message-State: ACgBeo2zdnl+80rL2ZgjLBGvy1lX1yT06mqsBVYC98tlgk5SuS05EqO/
 CEVOVMbhXhAWr5Q8LFZMyBFuehDhBYc=
X-Google-Smtp-Source: AA6agR7Y0BnurZj3VKBg6zJlSloroAykk8Ra2yH7NLRDXd29eYYBth1NOXpkwctG8IQh+cGc7KK07g==
X-Received: by 2002:a05:600c:1f11:b0:3a5:3df9:4859 with SMTP id
 bd17-20020a05600c1f1100b003a53df94859mr9647526wmb.175.1660336975786; 
 Fri, 12 Aug 2022 13:42:55 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b0001a8063f329e0108.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:1a8:63f:329e:108])
 by smtp.gmail.com with ESMTPSA id
 r8-20020adfe688000000b002205b786ab3sm385853wrm.14.2022.08.12.13.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 13:42:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Aug 2022 22:42:47 +0200
Message-Id: <20220812204247.171889-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=S16Uv9gswKvY23hSdrmsNPTflHf99j7VE8cgt9kzR9I=;
 b=DOTuK9l6XwyBzx86j/+pi9d1DdinppkOjueXUyXCGSgGY7h+wFUxuRCYtwcX7eyp/u
 cvClosua25w0S4L1UOpUkW9pOcEFwxqE/FdN095TLSPdQyKsNCbZoEuAv9Ccam2UfXYU
 ff+iixy5VoufdHiBSaBz1O4m0gUYFYdqy+DTvXDnF/vDBVe5Oh34SKDr0LbA0CaxItXP
 +ckC5y7TNv80VtH5m5VFA6IiFcR7aHoztKD4fR+vl7l+I0zIbAscfcGeidgkPDQYBJc2
 RRTW64azVRJhn9QQ58VViMD1xpqAThks9aR0SbkDDh8QoRQ1rmAD0XQpjqLh3Sc6qZu3
 hMgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DOTuK9l6
Subject: [Buildroot] [PATCH 1/1] package/llvm: needs host gcc >= 5
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with host-lld, libclc, etc. raised since
bump to version 11.1.0 in commit
456f704e6b7be147c504d53a78536938f088e8e8:

CMake Error at cmake/modules/CheckCompilerVersion.cmake:38 (message):
  Host GCC version must be at least 5.1, your version is 4.8.5.

Fixes:
 - http://autobuild.buildroot.org/results/7f120dbcbd5410477550fa8645e7d1cb0ae6cf1c
 - http://autobuild.buildroot.org/results/2382d7112618236aeafcaf581dc22a8d938824cf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/clang/Config.in        | 6 ++++--
 package/compiler-rt/Config.in  | 5 +++--
 package/libclc/Config.in       | 5 +++++
 package/lld/Config.in.host     | 5 +++++
 package/llvm/Config.in         | 6 ++++--
 package/mesa3d/Config.in       | 6 ++++--
 package/qt5/qt5tools/Config.in | 3 ++-
 7 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/package/clang/Config.in b/package/clang/Config.in
index 7c732c7af7..e4d455781e 100644
--- a/package/clang/Config.in
+++ b/package/clang/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_CLANG
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # std::wstring
+	depends on BR2_HOST_GCC_AT_LEAST_5
 	select BR2_PACKAGE_LLVM
 	help
 	  Clang is a C/C++, Objective C/C++ and OpenCL C front-end
@@ -14,11 +15,12 @@ config BR2_PACKAGE_CLANG
 
 	  http://clang.llvm.org
 
-comment "clang needs a toolchain w/ wchar, threads, C++, gcc >= 5, dynamic library"
+comment "clang needs a toolchain w/ wchar, threads, C++, gcc >= 5, dynamic library, host gcc >= 5"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
-		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
+		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
+		|| !BR2_HOST_GCC_AT_LEAST_5
 
 comment "clang needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
diff --git a/package/compiler-rt/Config.in b/package/compiler-rt/Config.in
index 9afc0d9d60..02169b66c0 100644
--- a/package/compiler-rt/Config.in
+++ b/package/compiler-rt/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_COMPILER_RT
 	bool "compiler-rt"
 	depends on BR2_PACKAGE_LLVM
 	depends on BR2_TOOLCHAIN_USES_GLIBC # asan lib requires
+	depends on BR2_HOST_GCC_AT_LEAST_5 # host-clang
 	help
 	  A collection of runtime libraries primarily used by clang and
 	  llvm to provide builtins, sanitizer runtimes, and profiling
@@ -9,6 +10,6 @@ config BR2_PACKAGE_COMPILER_RT
 
 	  https://compiler-rt.llvm.org/
 
-comment "compiler-rt requires llvm to be enabled and a glibc toolchain"
+comment "compiler-rt requires llvm to be enabled, a glibc toolchain, host gcc >= 5"
 	depends on !BR2_PACKAGE_LLVM
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_TOOLCHAIN_USES_GLIBC ||	!BR2_HOST_GCC_AT_LEAST_5
diff --git a/package/libclc/Config.in b/package/libclc/Config.in
index 797f090bfc..938933fdd3 100644
--- a/package/libclc/Config.in
+++ b/package/libclc/Config.in
@@ -1,9 +1,14 @@
 config BR2_PACKAGE_LIBCLC
 	bool "libclc"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on BR2_HOST_GCC_AT_LEAST_5 # host-llvm
 	help
 	  libclc is an open source, BSD licensed implementation of
 	  the library requirements of the OpenCL C programming language,
 	  as specified by the OpenCL 1.1 Specification.
 
 	  http://libclc.llvm.org/
+
+comment "libclc needs host gcc >= 5"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_5
diff --git a/package/lld/Config.in.host b/package/lld/Config.in.host
index f016f3445e..d015fdd520 100644
--- a/package/lld/Config.in.host
+++ b/package/lld/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_LLD
 	bool "host lld"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # llvm
+	depends on BR2_HOST_GCC_AT_LEAST_5 # host-llvm
 	help
 	  LLD is a linker from the LLVM project that is a drop-in
 	  replacement for system linkers, and runs much faster than
@@ -8,3 +9,7 @@ config BR2_PACKAGE_HOST_LLD
 	  toolchain developers.
 
 	  https://lld.llvm.org/
+
+comment "host lld needs host gcc >= 5"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_5
diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index 768af4971e..d9d30a5ba5 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -23,6 +23,7 @@ config BR2_PACKAGE_LLVM
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # std::wstring
+	depends on BR2_HOST_GCC_AT_LEAST_5 # host-llvm
 	help
 	  The LLVM Project is a collection of modular and reusable
 	  compiler and toolchain technologies.
@@ -58,11 +59,12 @@ config BR2_PACKAGE_LLVM_BPF
 
 endif
 
-comment "llvm needs a toolchain w/ wchar, threads, C++, gcc >= 5, dynamic library"
+comment "llvm needs a toolchain w/ wchar, threads, C++, gcc >= 5, dynamic library, host gcc >= 5"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
-		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
+		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
+		|| !BR2_HOST_GCC_AT_LEAST_5
 
 comment "llvm needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 0a00e9d085..7b3fe928d1 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -30,13 +30,15 @@ config BR2_PACKAGE_MESA3D_LLVM
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # std::wstring
+	depends on BR2_HOST_GCC_AT_LEAST_5 # host-llvm
 	select BR2_PACKAGE_LLVM
 
-comment "llvm support needs a toolchain w/ wchar, threads, C++, gcc >= 5, dynamic library"
+comment "llvm support needs a toolchain w/ wchar, threads, C++, gcc >= 5, dynamic library, host gcc >= 5"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
-		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
+		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
+		|| !BR2_HOST_GCC_AT_LEAST_5
 
 comment "llvm support needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
diff --git a/package/qt5/qt5tools/Config.in b/package/qt5/qt5tools/Config.in
index 428413d5e2..46585e1e04 100644
--- a/package/qt5/qt5tools/Config.in
+++ b/package/qt5/qt5tools/Config.in
@@ -23,12 +23,13 @@ config BR2_PACKAGE_QT5TOOLS_QDOC_TOOL
 	# currently supported in Buildroot, unless the target is
 	# already supported by llvm.
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # llvm, clang
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # llvm, clang
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # llvm, clang
 	depends on BR2_TOOLCHAIN_HAS_THREADS # llvm, clang
 	depends on BR2_INSTALL_LIBSTDCPP # llvm, clang
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # llvm, clang
 	depends on !BR2_STATIC_LIBS # llvm, clang
 	depends on BR2_USE_WCHAR # llvm, clang
+	depends on BR2_HOST_GCC_AT_LEAST_5 # llvm, clang
 	help
 	  This option enables the qdoc host tool.
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
