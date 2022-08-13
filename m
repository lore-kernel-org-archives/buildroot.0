Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE42C19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 11:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00BF340936;
	Sat, 13 Aug 2022 11:00:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00BF340936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id efD0nuGyTyPU; Sat, 13 Aug 2022 10:59:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6929A416D4;
	Sat, 13 Aug 2022 10:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6929A416D4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1DA001BF215
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 10:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC8D3405BD
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 10:59:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC8D3405BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f2LebCwnomeP for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 10:59:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF332404DF
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 10:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF332404DF
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4060886E63; Sat, 13 Aug 2022 10:45:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Aug 2022 12:59:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88ae4ebd21d6996ae85ff47a9259325c43c1280a
X-Git-Newrev: b0470c503982e865bec92e037a305bfb66119a25
X-Patchwork-Hint: ignore
Message-Id: <20220813104530.4060886E63@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm: needs host gcc >= 5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b0470c503982e865bec92e037a305bfb66119a25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with host-lld, libclc, etc. raised since
bump to version 11.1.0 in commit
456f704e6b7be147c504d53a78536938f088e8e8:

CMake Error at cmake/modules/CheckCompilerVersion.cmake:38 (message):
  Host GCC version must be at least 5.1, your version is 4.8.5.

Fixes:
 - http://autobuild.buildroot.org/results/7f120dbcbd5410477550fa8645e7d1cb0ae6cf1c
 - http://autobuild.buildroot.org/results/2382d7112618236aeafcaf581dc22a8d938824cf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
index 23d70d63b0..40f7009492 100644
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
