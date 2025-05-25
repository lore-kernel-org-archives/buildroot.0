Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261D2C71141
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1643820CE;
	Thu, 12 Jun 2025 08:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1d1LBTBJjWDJ; Thu, 12 Jun 2025 08:39:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE4148205E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE4148205E;
	Thu, 12 Jun 2025 08:39:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02A7A1E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0FC460D8B
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r95h04F7jbYD for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F21460B60
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F21460B60
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 902718106F; Thu, 12 Jun 2025 08:38:29 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 May 2025 16:15:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 395568599c2922fc2b7bfb62a66e81db6767db38
X-Git-Newrev: e29dae109a217636381acd4f7be615a8744fe675
X-Patchwork-Hint: ignore
Message-Id: <20250612083829.902718106F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project: bump to version
 20.1.5
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0321180601591116655=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0321180601591116655==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e29dae109a217636381acd4f7be615a8744fe675
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release:
https://github.com/llvm/llvm-project/releases/tag/llvmorg-20.1.5

Major Changes and Fixes:

-- CMake 3.20 minimum required

-- Issue encountered during standalone LLVM build:
    CMake Error at CMakeLists.txt:8 (include):
      include could not find requested file:

  This error is due to the line:
    include(${LLVM_COMMON_CMAKE_UTILS}/Modules/CMakePolicy.cmake)

  Upstream commit [1] harmonized policy handling by introducing this shared include
  for all LLVM sub-projects. However, in the LLVM CMakeLists, LLVM_COMMON_CMAKE_UTILS
  is set unconditionally, preventing external override — which is required in
  Buildroot when building from separated archives.

  To solve this:
    We apply a patch to wrap the assignment of LLVM_COMMON_CMAKE_UTILS in an
    `if(NOT DEFINED ...)` block, allowing Buildroot to set the path externally.
    In the `llvm-cmake` package, we also **adjust the installation path** of the
    CMake modules: instead of installing directly into `lib/cmake/llvm`, we now
    install them under `lib/cmake/llvm/Modules` to match the expected layout.

  This ensures that:
    LLVM can include `${LLVM_COMMON_CMAKE_UTILS}/Modules/CMakePolicy.cmake`
    without errors.

-- Also the Clang build system has removed support for
   the GCC_INSTALL_PREFIX option, raising a fatal error when attempting to use it:

   CMake Error at CMakeLists.txt:211 (message):
      GCC_INSTALL_PREFIX is deprecated and will be removed.
      Use configuration files (https://clang.llvm.org/docs/UsersManual.html#configuration-files)
      to specify the default --gcc-install-dir= or --gcc-triple=.
      --gcc-toolchain= is discouraged.
      See https://github.com/llvm/llvm-project/pull/77537
      for details.

   Remove the use of GCC_INSTALL_PREFIX and replace it with a
   Clang configuration file as recommended by upstream.

   A configuration file is now automatically generated at:
   $(HOST_DIR)/lib/clang/$(CLANG_VERSION_MAJOR)/$(GNU_TARGET_NAME).cfg

   It contains:
   --gcc-install-dir=<path to external toolchain's lib/gcc/...>
   --target=<GNU target triplet>

   We dynamically detect the GCC install path by scanning
   $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/lib/gcc/<target>/<version>/

   The Clang toolchain wrapper was also updated to add --config=<file> when
   BR_CLANG_CONFIG_FILE is defined.

-- Fix LLVM_MAIN_SRC_DIR path:
   set(LLVM_MAIN_SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../llvm" CACHE PATH ...)
   This path isn't correct when using standalone archive builds. We explicitly pass
   LLVM_MAIN_SRC_DIR=$(BUILD_DIR)/llvm-$(LLVM_PROJECT_VERSION) to fix the path. [2]

-- Add LLVM_ENABLE_RUNTIMES:
   Upstream added LLVM_ENABLE_RUNTIMES for runtimes [3]

-- Removed LLVM_INCLUDE_GO_TESTS:
   Upstream dropped this option; we remove it too [4]

-- Disable TensorFlow Lite integration:
   LLVM_HAVE_TFLITE is added to the CMakelist
   We now explicitly disable it to avoid unexpected
   TensorFlow Lite dependency.

-- Clang introduced CLANG_ENABLE_LIBXML2 [5]
   We now explicitly disable it by setting CLANG_ENABLE_LIBXLM2=OFF
   since we set LLVM_ENABLE_LIBXML2 to OFF in LLVM

-- Host-python3, which is now always needed by Clang’s resource bundling
   script. [6]

-- Clang explicitly request to disable llvm tests when llvm_gtest is missing.[7]
   CMake Error at CMakeLists.txt:126 (message):
    llvm-gtest not found. Please install llvm-gtest or disable tests with
    -DLLVM_INCLUDE_TESTS=OFF

-- Also update the installation path in COMPILER_RT_SETUP_RUNTIME_LIBS
   to use CLANG_VERSION_MAJOR instead of HOST_CLANG_VERSION,
   ensuring that the runtime files are placed correctly
   in the /lib/clang/<major>/ folder. [8]

-- Add llvm-runtimes dependency
   libunwind needs runtimes [9]

-- Fix for libclc out of tree patch
   Due to upstream changes in libclc, the old patch no longer
   applies. Only the fix related to invoking './prepare_builtins'
   directly is still relevant and preserved, as it is required to avoid
   a build failure when the binary is not in PATH.

-- Upstream commit [10] removed the use of llvm-config in libclc and
   replaced it with proper use of LLVM_CMAKE_DIR. We now pass
   -DLLVM_CMAKE_DIR instead of DLLVM_CONFIG

-- Libclc expects to invoke some LLVM tools. We explicitly set
   LIBCLC_CUSTOM_LLVM_TOOLS_BINARY_DIR to ensure it finds these tools. [11]

-- Remove LLAsm_COMPILER and CLC_COMPILER [12]

-- LIBUNWIND_INSTALL_HEADERS is On by default [13]

-- Update spirv-llvm-translator to align with LLVM 20.1.5
   Release:
   https://github.com/KhronosGroup/SPIRV-LLVM-Translator/releases/tag/v20.1.2

[1]  https://github.com/llvm/llvm-project/commit/9dd01a5241dc5b46e92485e05bc345221df8938c
[2]  https://github.com/llvm/llvm-project/commit/d2b158e29eedf4a29bf8d2142f2ed21a52fc80a7
[3]  https://github.com/llvm/llvm-project/commit/176db3b3ab25ff8a9b2405f50ef5a8bd9304a6d5
[4]  https://github.com/llvm/llvm-project/commit/6ce87272487711c9f0ff408a037f5ca2e1ff5c5d
[5]  https://github.com/llvm/llvm-project/commit/df239a6c17fa51274e38f185e72ac02c2f8fb914
[6]  https://github.com/llvm/llvm-project/commit/96962d5512fbc6af0ada0f13e6be332c026529cb
[7]  https://github.com/llvm/llvm-project/commit/82169103958583d3320b3a9a1e6542e8d32ef8da
[8]  https://github.com/llvm/llvm-project/commit/e1b88c8a09be25b86b13f98755a9bd744b4dbf14
[9]  https://github.com/llvm/llvm-project/commit/0af67d167d6c811abf12ad6c27ee34ec1365e5fb
[10] https://github.com/llvm/llvm-project/commit/b264787453fd93e55154b98d18739ecb383d9b4c
[11] https://github.com/llvm/llvm-project/commit/0aeeff3059e79b86f55ed92a4488bdee8fa66e12
[12] https://github.com/llvm/llvm-project/commit/72f9881c3ffcf4be6361c3e4312d91c9c8d94a98
[13] https://github.com/llvm/llvm-project/commit/f8409af354c1398ebf4ece67a315c94ba19714b5

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Bernd: rebased, removed gcc-15 patches for llvm 15, bumped to 20.1.5]
        used 'git describe' to set the version number for spirv-llvm-translator]
[Mehdi: changed llvm-runtimes version to $(LLVM_PROJECT_VERSION)]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  2 -
 ...ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch | 78 ----------------------
 package/llvm-project/clang/Config.in               |  1 +
 package/llvm-project/clang/clang.hash              |  2 +-
 package/llvm-project/clang/clang.mk                | 27 ++++++--
 package/llvm-project/compiler-rt/Config.in         |  1 +
 package/llvm-project/compiler-rt/compiler-rt.hash  |  2 +-
 package/llvm-project/compiler-rt/compiler-rt.mk    |  9 +--
 .../libclc/0001-support-out-of-tree-build.patch    | 77 ++++++---------------
 package/llvm-project/libclc/Config.in              |  1 +
 package/llvm-project/libclc/libclc.hash            |  2 +-
 package/llvm-project/libclc/libclc.mk              |  5 +-
 package/llvm-project/lld/Config.in.host            |  1 +
 package/llvm-project/lld/lld.hash                  |  2 +-
 package/llvm-project/lld/lld.mk                    |  2 +
 package/llvm-project/llvm-cmake/llvm-cmake.hash    |  2 +-
 package/llvm-project/llvm-cmake/llvm-cmake.mk      |  5 +-
 .../llvm-libunwind/llvm-libunwind.hash             |  2 +-
 .../llvm-project/llvm-libunwind/llvm-libunwind.mk  |  5 +-
 package/llvm-project/llvm-project.mk               |  4 +-
 .../llvm-project/llvm-runtimes/llvm-runtimes.hash  |  2 +-
 .../llvm-project/llvm-runtimes/llvm-runtimes.mk    |  6 +-
 ...001-ADT-Add-cstdint-to-SmallVector-101761.patch | 35 ----------
 .../llvm/0001-Fix-standalone-build-for-llvm.patch  | 49 ++++++++++++++
 ...lude-cstdint-in-AMDGPUMCTargetDesc-101766.patch | 31 ---------
 .../0003-Another-gcc-15-fix-from-Sam-James.patch   | 31 ---------
 package/llvm-project/llvm/Config.in                |  1 +
 package/llvm-project/llvm/llvm.hash                |  2 +-
 package/llvm-project/llvm/llvm.mk                  | 14 +++-
 .../spirv-llvm-translator.hash                     |  2 +-
 .../spirv-llvm-translator/spirv-llvm-translator.mk |  4 +-
 toolchain/toolchain-wrapper.c                      |  3 +
 32 files changed, 141 insertions(+), 269 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b9e3b42915..bf532f5b6b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -743,8 +743,6 @@ package/lirc-tools/0002-configure-add-disable-doc-option.patch lib_patch.Upstrea
 package/lirc-tools/S25lircd lib_sysv.Indent lib_sysv.Variables
 package/live555/0001-Add-a-pkg-config-file-for-the-shared-libraries.patch lib_patch.Upstream
 package/lldpd/S60lldpd Shellcheck lib_sysv.Indent lib_sysv.Variables
-package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch lib_patch.Upstream
-package/llvm-project/libclc/0001-support-out-of-tree-build.patch lib_patch.Upstream
 package/lm-sensors/0001-static-build.patch lib_patch.Upstream
 package/lm-sensors/0002-no-host-ldconfig.patch lib_patch.Upstream
 package/lmbench/0001-scripts-build-use-bin-bash-as-shell.patch lib_patch.Upstream
diff --git a/package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch b/package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
deleted file mode 100644
index ffdd5d187f..0000000000
--- a/package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From fe21cede3939a435d62efbd5799547fab6af1b0a Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Mon, 5 Aug 2019 16:06:48 +0200
-Subject: [PATCH] lib/Driver/ToolChains/Gnu: Use GCC_INSTALL_PREFIX in the set
- of prefixes for searching the gcc toolchain
-
-By default, the Gnu Toolchains driver is looking at the parent
-directory while looking for the gcc toolchain when clang is installed
-at "D.InstalledDir"
-
-But this doesn't work with Buildroot since the external
-toolchain is installed in host/opt/ext-toolchain and the sysroot is
-moved to host/<arch>-buildroot-linux-gnu/sysroot/ directory.
-
-We tried by setting GCC_INSTALL_PREFIX in clang.mk for host-clang
-but it doesn't work since we already provide a sysroot [1].
-
-Help the Gnu Toolchains driver by using GCC_INSTALL_PREFIX path.
-
-Since we want to be able to relocate the clang toolchain,
-allow to use a relative path with GCC_INSTALL_PREFIX.
-
-Buildroot will provide such relative path by using:
-HOST_CLANG_CONF_OPTS += -DGCC_INSTALL_PREFIX:PATH=`realpath --relative-to=$(HOST_DIR)/bin/ $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)`
-
-Doing so allow to use clang without providing additional search
-paths with -B option on the clang's command line.
-
-[1] https://reviews.llvm.org/D49244
-[2] http://lists.busybox.net/pipermail/buildroot/2019-August/256204.html
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
-Pending, access to llvm mailing lists to submit it is pending. They
-seem to be having issues with their listserv.
----
- lib/Driver/ToolChains/Gnu.cpp | 17 +++++++++++++++++
- 1 file changed, 17 insertions(+)
-
-diff --git a/lib/Driver/ToolChains/Gnu.cpp b/lib/Driver/ToolChains/Gnu.cpp
-index 2ad45097dc..90d6b5b748 100644
---- a/lib/Driver/ToolChains/Gnu.cpp
-+++ b/lib/Driver/ToolChains/Gnu.cpp
-@@ -1725,6 +1725,8 @@ void Generic_GCC::GCCInstallationDetector::init(
- 
-     Prefixes.push_back(std::string(GCCToolchainDir));
-   } else {
-+    StringRef GccIinstallPrefix = GCC_INSTALL_PREFIX;
-+
-     // If we have a SysRoot, try that first.
-     if (!D.SysRoot.empty()) {
-       Prefixes.push_back(D.SysRoot);
-@@ -1734,6 +1736,21 @@ void Generic_GCC::GCCInstallationDetector::init(
-     // Then look for gcc installed alongside clang.
-     Prefixes.push_back(D.InstalledDir + "/..");
- 
-+    // Use GCC_INSTALL_PREFIX if provided by the buildsystem.
-+    if (!GccIinstallPrefix.empty())
-+    {
-+        if (llvm::sys::path::is_relative(GccIinstallPrefix))
-+        {
-+            // Use a relative path to gcc from clang install path.
-+            Prefixes.push_back(D.InstalledDir + "/" + GccIinstallPrefix.str());
-+        }
-+        else
-+        {
-+            // Hardcode the absolute path provided by GCC_INSTALL_PREFIX.
-+            Prefixes.push_back(GCC_INSTALL_PREFIX);
-+        }
-+    }
-+
-     // Next, look for prefix(es) that correspond to distribution-supplied gcc
-     // installations.
-     if (D.SysRoot.empty()) {
--- 
-2.20.1
-
diff --git a/package/llvm-project/clang/Config.in b/package/llvm-project/clang/Config.in
index 2e23888720..4eda9391dd 100644
--- a/package/llvm-project/clang/Config.in
+++ b/package/llvm-project/clang/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_CLANG
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # std::wstring
 	depends on BR2_HOST_GCC_AT_LEAST_7
+	select BR2_HOST_CMAKE_AT_LEAST_3_20 # cmake required version at least 3.20
 	select BR2_PACKAGE_LLVM
 	help
 	  Clang is a C/C++, Objective C/C++ and OpenCL C front-end
diff --git a/package/llvm-project/clang/clang.hash b/package/llvm-project/clang/clang.hash
index 33b50af6bf..d44ea9a3b3 100644
--- a/package/llvm-project/clang/clang.hash
+++ b/package/llvm-project/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  a6b673ef15377fb46062d164e8ddc4d05c348ff8968f015f7f4af03f51000067  clang-15.0.7.src.tar.xz
+sha256  97025772b25c6694db049d3c4be5a72d926299aa1a9b861f490d66750e31c9dd  clang-20.1.5.src.tar.xz
 sha256  ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47  LICENSE.TXT
diff --git a/package/llvm-project/clang/clang.mk b/package/llvm-project/clang/clang.mk
index 0bafd6461b..25d5688a80 100644
--- a/package/llvm-project/clang/clang.mk
+++ b/package/llvm-project/clang/clang.mk
@@ -14,9 +14,12 @@ CLANG_CPE_ID_VENDOR = llvm
 CLANG_SUPPORTS_IN_SOURCE_BUILD = NO
 CLANG_INSTALL_STAGING = YES
 
-HOST_CLANG_DEPENDENCIES = host-llvm host-libxml2
+HOST_CLANG_DEPENDENCIES = host-llvm host-libxml2 host-python3
 CLANG_DEPENDENCIES = llvm host-clang
 
+# since we have LLVM_ENABLE_LIBXML2=OFF, set CLANG_ENABLE_LIBXML2=OFF
+CLANG_CONF_OPTS += -DCLANG_ENABLE_LIBXML2=OFF
+
 # This option is needed, otherwise multiple shared libs
 # (libclangAST.so, libclangBasic.so, libclangFrontend.so, etc.) will
 # be generated. As a final shared lib containing all these components
@@ -45,12 +48,14 @@ CLANG_CONF_OPTS += -DCLANG_BUILD_TOOLS=ON
 HOST_CLANG_CONF_OPTS += \
 	-DCLANG_BUILD_EXAMPLES=OFF \
 	-DCLANG_INCLUDE_DOCS=OFF \
-	-DCLANG_INCLUDE_TESTS=OFF
+	-DCLANG_INCLUDE_TESTS=OFF \
+	-DLLVM_INCLUDE_TESTS=OFF
 
 CLANG_CONF_OPTS += \
 	-DCLANG_BUILD_EXAMPLES=OFF \
 	-DCLANG_INCLUDE_DOCS=OFF \
-	-DCLANG_INCLUDE_TESTS=OFF
+	-DCLANG_INCLUDE_TESTS=OFF \
+	-DLLVM_INCLUDE_TESTS=OFF
 
 HOST_CLANG_CONF_OPTS += -DLLVM_DIR=$(HOST_DIR)/lib/cmake/llvm \
 	-DCLANG_DEFAULT_LINKER=$(TARGET_LD)
@@ -59,6 +64,12 @@ CLANG_CONF_OPTS += -DLLVM_DIR=$(STAGING_DIR)/usr/lib/cmake/llvm \
 	-DCLANG_TABLEGEN:FILEPATH=$(HOST_DIR)/bin/clang-tblgen \
 	-DLLVM_TABLEGEN_EXE:FILEPATH=$(HOST_DIR)/bin/llvm-tblgen
 
+HOST_CLANG_CONF_OPTS += -DLLVM_COMMON_CMAKE_UTILS=$(HOST_DIR)/lib/cmake/llvm
+CLANG_CONF_OPTS += -DLLVM_COMMON_CMAKE_UTILS=$(HOST_DIR)/lib/cmake/llvm
+
++HOST_CLANG_CONF_OPTS += -DLLVM_MAIN_SRC_DIR=$(BUILD_DIR)/llvm-$(LLVM_PROJECT_VERSION)
++CLANG_CONF_OPTS += -DLLVM_MAIN_SRC_DIR=$(BUILD_DIR)/llvm-$(LLVM_PROJECT_VERSION)
+
 # Clang can't be used as compiler on the target since there are no
 # development files (headers) and other build tools. So remove clang
 # binaries and some other unnecessary files from target.
@@ -102,7 +113,15 @@ CLANG_CONF_OPTS += -DLLVM_DYLIB_COMPONENTS=all
 # installation directory to the external toolchain installation directory in order to
 # not hardcode the toolchain absolute path.
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
-HOST_CLANG_CONF_OPTS += -DGCC_INSTALL_PREFIX:PATH=`realpath --relative-to=$(HOST_DIR)/bin/ $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)`
+define HOST_CLANG_INSTALL_CONFIG_FILE
+	mkdir -p $(HOST_DIR)/lib/clang/$(CLANG_VERSION_MAJOR)
+	touch $(HOST_DIR)/lib/clang/$(CLANG_VERSION_MAJOR)/$(GNU_TARGET_NAME).cfg
+	echo "--gcc-install-dir=$(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/lib/gcc/$$(ls $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/lib/gcc/)/$$(ls $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/lib/gcc/$$(ls $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/lib/gcc/)/)" > $(HOST_DIR)/lib/clang/$(CLANG_VERSION_MAJOR)/$(GNU_TARGET_NAME).cfg
+	echo "--target=$(GNU_TARGET_NAME)" >> $(HOST_DIR)/lib/clang/$(CLANG_VERSION_MAJOR)/$(GNU_TARGET_NAME).cfg
+endef
+
+HOST_CLANG_POST_INSTALL_HOOKS += HOST_CLANG_INSTALL_CONFIG_FILE
+HOST_CLANG_TOOLCHAIN_WRAPPER_ARGS += -DBR_CLANG_CONFIG_FILE="\"--config=$(HOST_DIR)/lib/clang/$(CLANG_VERSION_MAJOR)/$(GNU_TARGET_NAME).cfg\""
 endif
 
 define HOST_CLANG_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
diff --git a/package/llvm-project/compiler-rt/Config.in b/package/llvm-project/compiler-rt/Config.in
index 10f5d796b3..b665165516 100644
--- a/package/llvm-project/compiler-rt/Config.in
+++ b/package/llvm-project/compiler-rt/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_COMPILER_RT
 	depends on BR2_TOOLCHAIN_USES_GLIBC # asan lib requires
 	depends on BR2_HOST_GCC_AT_LEAST_7 # host-clang
 	select BR2_PACKAGE_LIBXCRYPT
+	select BR2_HOST_CMAKE_AT_LEAST_3_20 # cmake required version at least 3.20
 	help
 	  A collection of runtime libraries primarily used by clang and
 	  llvm to provide builtins, sanitizer runtimes, and profiling
diff --git a/package/llvm-project/compiler-rt/compiler-rt.hash b/package/llvm-project/compiler-rt/compiler-rt.hash
index f84a8a33a7..5816e91702 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.hash
+++ b/package/llvm-project/compiler-rt/compiler-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  353832c66cce60931ea0413b3c071faad59eefa70d02c97daa8978b15e4b25b7  compiler-rt-15.0.7.src.tar.xz
+sha256  bdcebca627f377ffcff5405cd5694efbddb14c89ad7d0ea481b1646a42bfeca3  compiler-rt-20.1.5.src.tar.xz
 sha256  1a8f1058753f1ba890de984e48f0242a3a5c29a6a8f2ed9fd813f36985387e8d  LICENSE.TXT
diff --git a/package/llvm-project/compiler-rt/compiler-rt.mk b/package/llvm-project/compiler-rt/compiler-rt.mk
index cbd2e6cb8b..ff3205f216 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.mk
+++ b/package/llvm-project/compiler-rt/compiler-rt.mk
@@ -20,7 +20,8 @@ COMPILER_RT_CONF_OPTS = \
 	-DCOMPILER_RT_STANDALONE_BUILD=ON \
 	-DCOMPILER_RT_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME) \
 	-DLLVM_CONFIG_PATH=$(HOST_DIR)/bin/llvm-config \
-	-DCMAKE_MODULE_PATH=$(HOST_DIR)/lib/cmake/llvm
+	-DCMAKE_MODULE_PATH=$(HOST_DIR)/lib/cmake/llvm \
+	-DLLVM_COMMON_CMAKE_UTILS=$(HOST_DIR)/lib/cmake/llvm
 
 # The installation of the target runtime libraries defaults to DESTDIR, however
 # host-clang resources directory needs a link so Clang can find the runtime
@@ -29,9 +30,9 @@ COMPILER_RT_CONF_OPTS = \
 # assumed, as compiler-rt is usually build at the same time as Clang and not
 # standalone.
 define COMPILER_RT_SETUP_RUNTIME_LIBS
-	mkdir -p $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/lib
-	ln -sf ../../../../$(GNU_TARGET_NAME)/sysroot/usr/lib/linux $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/lib/linux
-	ln -sf ../../../../$(GNU_TARGET_NAME)/sysroot/usr/share $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/share
+	mkdir -p $(HOST_DIR)/lib/clang/$(CLANG_VERSION_MAJOR)/lib
+	ln -sf ../../../../$(GNU_TARGET_NAME)/sysroot/usr/lib/linux $(HOST_DIR)/lib/clang/$(CLANG_VERSION_MAJOR)/lib/linux
+	ln -sf ../../../../$(GNU_TARGET_NAME)/sysroot/usr/share $(HOST_DIR)/lib/clang/$(CLANG_VERSION_MAJOR)/share
 endef
 COMPILER_RT_POST_INSTALL_STAGING_HOOKS += COMPILER_RT_SETUP_RUNTIME_LIBS
 
diff --git a/package/llvm-project/libclc/0001-support-out-of-tree-build.patch b/package/llvm-project/libclc/0001-support-out-of-tree-build.patch
index de7207bedb..d2cde4de0a 100644
--- a/package/llvm-project/libclc/0001-support-out-of-tree-build.patch
+++ b/package/llvm-project/libclc/0001-support-out-of-tree-build.patch
@@ -1,71 +1,32 @@
-From 495491e9d53bfb184c15753b5187e4bb55b19511 Mon Sep 17 00:00:00 2001
-From: Matt Weber <matthew.weber@rockwellcollins.com>
-Date: Tue, 9 Mar 2021 15:55:17 -0600
+From a435f3c9318935ba29b04dabe7342cd6160711e0 Mon Sep 17 00:00:00 2001
+From: El Mehdi YOUNES <elmehdi.younes@smile.fr>
+Date: Thu, 15 May 2025 10:02:12 +0200
 Subject: [PATCH] support out of tree build
 
-(1) The package has a prepare_builtins tool which is built
+prepare_builtins tool is built
 but not placed in the path for later use in the build. This
 fix allows the later build steps to use the binary in-place.
 
-(2) With cmake, find_file() when used for non-host builds is
-limited by CMAKE_FIND_ROOT_PATH* scope.
+Upstream: Not submitted
 
-In $(HOST_DIR)/share/buildroot/toolchainfile.cmake we set the
-following target settings for CMAKE_FIND_ROOT_PATH* which
-limit the scope.
-set(CMAKE_FIND_ROOT_PATH "${RELOCATED_HOST_DIR}/aarch64-buildroot-linux-gnu/sysroot")
-set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
-set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
-set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
-set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
-
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
 ---
- CMakeLists.txt                          | 2 +-
- cmake/CMakeDetermineCLCCompiler.cmake   | 4 ++++
- cmake/CMakeDetermineLLAsmCompiler.cmake | 4 ++++
- 3 files changed, 9 insertions(+), 1 deletion(-)
+ libclc/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9472f19..a784519 100644
+index d651a9bf506b..18bd7efe8217 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -279,7 +279,7 @@ foreach( t ${LIBCLC_TARGETS_TO_BUILD} )
- 
-			# Add prepare target
-			add_custom_command( OUTPUT "${obj_suffix}"
--				            COMMAND prepare_builtins -o
-+				            COMMAND ./prepare_builtins -o
-					    "${obj_suffix}"
-					    "builtins.opt.${obj_suffix}"
-					    DEPENDS "opt.${obj_suffix}"
-diff --git a/cmake/CMakeDetermineCLCCompiler.cmake b/cmake/CMakeDetermineCLCCompiler.cmake
-index 94d85d9..5de6a48 100644
---- a/cmake/CMakeDetermineCLCCompiler.cmake
-+++ b/cmake/CMakeDetermineCLCCompiler.cmake
-@@ -12,7 +12,7 @@ mark_as_advanced(CMAKE_CLC_ARCHIVE)
- 
- set(CMAKE_CLC_COMPILER_ENV_VAR "CLC_COMPILER")
- set(CMAKE_CLC_ARCHIVE_ENV_VAR "CLC_LINKER")
--find_file(clc_comp_in CMakeCLCCompiler.cmake.in PATHS ${CMAKE_ROOT}/Modules ${CMAKE_MODULE_PATH})
-+set(clc_comp_in "${CMAKE_MODULE_PATH}/CMakeCLCCompiler.cmake.in" )
- # configure all variables set in this file
- configure_file(${clc_comp_in} ${CMAKE_PLATFORM_INFO_DIR}/CMakeCLCCompiler.cmake @ONLY)
- mark_as_advanced(clc_comp_in)
-diff --git a/cmake/CMakeDetermineLLAsmCompiler.cmake b/cmake/CMakeDetermineLLAsmCompiler.cmake
-index 1c424c7..dd3bfb6 100644
---- a/cmake/CMakeDetermineLLAsmCompiler.cmake
-+++ b/cmake/CMakeDetermineLLAsmCompiler.cmake
-@@ -18,7 +18,7 @@ mark_as_advanced(CMAKE_LLAsm_ARCHIVE)
- set(CMAKE_LLAsm_PREPROCESSOR_ENV_VAR "LL_PREPROCESSOR")
- set(CMAKE_LLAsm_COMPILER_ENV_VAR "LL_ASSEMBLER")
- set(CMAKE_LLAsm_ARCHIVE_ENV_VAR "LL_LINKER")
--find_file(ll_comp_in CMakeLLAsmCompiler.cmake.in PATHS ${CMAKE_ROOT}/Modules ${CMAKE_MODULE_PATH})
-+set(ll_comp_in "${CMAKE_MODULE_PATH}/CMakeLLAsmCompiler.cmake.in" )
- # configure all variables set in this file
- configure_file(${ll_comp_in} ${CMAKE_PLATFORM_INFO_DIR}/CMakeLLAsmCompiler.cmake @ONLY)
- mark_as_advanced(ll_comp_in)
+@@ -180,7 +180,7 @@ set(LLVM_LINK_COMPONENTS
+ )
+ if( LIBCLC_STANDALONE_BUILD )
+   add_llvm_executable( prepare_builtins utils/prepare-builtins.cpp )
+-  set( prepare_builtins_exe prepare_builtins )
++  set( prepare_builtins_exe ./prepare_builtins )
+   set( prepare_builtins_target prepare_builtins )
+ else()
+   add_llvm_utility( prepare_builtins utils/prepare-builtins.cpp )
 -- 
-2.17.1
+2.43.0
 
diff --git a/package/llvm-project/libclc/Config.in b/package/llvm-project/libclc/Config.in
index 85eb888578..6b92357e0f 100644
--- a/package/llvm-project/libclc/Config.in
+++ b/package/llvm-project/libclc/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBCLC
 	bool "libclc"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
+	select BR2_HOST_CMAKE_AT_LEAST_3_20 # cmake required version at least 3.20
 	help
 	  libclc is an open source, BSD licensed implementation of
 	  the library requirements of the OpenCL C programming language,
diff --git a/package/llvm-project/libclc/libclc.hash b/package/llvm-project/libclc/libclc.hash
index 5ee088a379..cfce638f6e 100644
--- a/package/llvm-project/libclc/libclc.hash
+++ b/package/llvm-project/libclc/libclc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  35731fea7be224f21acf5bf3cd9f0ed058bf4ada5eceaf7f10ee96e139bd3389  libclc-15.0.7.src.tar.xz
+sha256  7aabcc31eff12bc54778c38752192939df8d983002c961cb1ac97f57e50ccff1  libclc-20.1.5.src.tar.xz
 sha256  3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479  LICENSE.TXT
diff --git a/package/llvm-project/libclc/libclc.mk b/package/llvm-project/libclc/libclc.mk
index cfa978a8ac..399878bf0b 100644
--- a/package/llvm-project/libclc/libclc.mk
+++ b/package/llvm-project/libclc/libclc.mk
@@ -27,8 +27,6 @@ LIBCLC_CONF_OPTS = \
 	-DCMAKE_SYSROOT="" \
 	-DCMAKE_C_COMPILER_FORCED=ON \
 	-DCMAKE_CXX_COMPILER_FORCED=ON \
-	-DCMAKE_CLC_COMPILER_FORCED=ON \
-	-DCMAKE_LLAsm_COMPILER_FORCED=ON \
 	-DCMAKE_INSTALL_DATADIR="share" \
 	-DCMAKE_FIND_ROOT_PATH="$(HOST_DIR)" \
 	-DCMAKE_C_FLAGS="$(HOST_CFLAGS)" \
@@ -38,7 +36,8 @@ LIBCLC_CONF_OPTS = \
 	-DCMAKE_MODULE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
 	-DCMAKE_C_COMPILER="$(CMAKE_HOST_C_COMPILER)" \
 	-DCMAKE_CXX_COMPILER="$(CMAKE_HOST_CXX_COMPILER)" \
-	-DLLVM_CONFIG="$(HOST_DIR)/bin/llvm-config"
+	-DLLVM_CMAKE_DIR="$(HOST_DIR)/lib/cmake/llvm" \
+	-DLIBCLC_CUSTOM_LLVM_TOOLS_BINARY_DIR="$(HOST_DIR)/bin"
 
 HOST_LIBCLC_CONF_OPTS = \
 	-DLIBCLC_TARGETS_TO_BUILD=spirv64-mesa3d-
diff --git a/package/llvm-project/lld/Config.in.host b/package/llvm-project/lld/Config.in.host
index 3bed364a79..63f9f68558 100644
--- a/package/llvm-project/lld/Config.in.host
+++ b/package/llvm-project/lld/Config.in.host
@@ -2,6 +2,7 @@ config BR2_PACKAGE_HOST_LLD
 	bool "host lld"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # llvm
 	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
+	select BR2_HOST_CMAKE_AT_LEAST_3_20 # cmake required version at least 3.20
 	help
 	  LLD is a linker from the LLVM project that is a drop-in
 	  replacement for system linkers, and runs much faster than
diff --git a/package/llvm-project/lld/lld.hash b/package/llvm-project/lld/lld.hash
index b30e38f02b..971eec6372 100644
--- a/package/llvm-project/lld/lld.hash
+++ b/package/llvm-project/lld/lld.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  dba5c70c3fe88b3a38b9180df82fbc9d1dfd55d68f41fddd6a90f9e17f8e5df9  lld-15.0.7.src.tar.xz
+sha256  4e084130cc51a8b900737cec40578eab867f7e8017121409940d96550784ff12  lld-20.1.5.src.tar.xz
 sha256  f7891568956e34643eb6a0db1462db30820d40d7266e2a78063f2fe233ece5a0  LICENSE.TXT
diff --git a/package/llvm-project/lld/lld.mk b/package/llvm-project/lld/lld.mk
index 539dd0bd71..c9a2d3796b 100644
--- a/package/llvm-project/lld/lld.mk
+++ b/package/llvm-project/lld/lld.mk
@@ -15,6 +15,8 @@ HOST_LLD_DEPENDENCIES = host-llvm host-llvm-libunwind
 # build as static libs as is done in llvm & clang
 HOST_LLD_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
 
+HOST_LLD_CONF_OPTS += -DLLVM_COMMON_CMAKE_UTILS=$(HOST_DIR)/lib/cmake/llvm
+
 # GCC looks for tools in a different path from LLD's default installation path
 define HOST_LLD_CREATE_SYMLINKS
 	mkdir -p $(HOST_DIR)/$(GNU_TARGET_NAME)/bin
diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.hash b/package/llvm-project/llvm-cmake/llvm-cmake.hash
index 756404cdd9..962633f665 100644
--- a/package/llvm-project/llvm-cmake/llvm-cmake.hash
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.hash
@@ -1,2 +1,2 @@
 # locally calculated
-sha256  8986f29b634fdaa9862eedda78513969fe9788301c9f2d938f4c10a3e7a3e7ea  cmake-15.0.7.src.tar.xz
+sha256  1b5abaa2686c6c0e1f394113d0b2e026ff3cb9e11b6a2294c4f3883f1b02c89c  cmake-20.1.5.src.tar.xz
diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.mk b/package/llvm-project/llvm-cmake/llvm-cmake.mk
index 33b6ba8339..26dc04dcd7 100644
--- a/package/llvm-project/llvm-cmake/llvm-cmake.mk
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.mk
@@ -10,8 +10,9 @@ LLVM_CMAKE_SOURCE = cmake-$(LLVM_CMAKE_VERSION).src.tar.xz
 LLVM_CMAKE_LICENSE = Apache-2.0 with exceptions
 
 define HOST_LLVM_CMAKE_INSTALL_CMDS
-	mkdir -p $(HOST_DIR)/lib/cmake/llvm
-	cp -Rv $(@D)/Modules/* $(HOST_DIR)/lib/cmake/llvm
+	mkdir -p $(HOST_DIR)/lib/cmake/llvm/Modules
+	cp -Rv $(@D)/Modules/* $(HOST_DIR)/lib/cmake/llvm/Modules
+	ln -sf $(HOST_DIR)/lib/cmake/llvm/Modules/* $(HOST_DIR)/lib/cmake/llvm/
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
index 58a3230301..d95fa17622 100644
--- a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  406d199ae3a16add84017f40458a5e7c31f9412937fcb518715af0a0eeafbc0c  libunwind-15.0.7.src.tar.xz
+sha256  f0555603222189d8d2ff2d02747c63a3bbeb291fa72ce042c1a6d26399150baf  libunwind-20.1.5.src.tar.xz
 sha256  b5efebcaca80879234098e52d1725e6d9eb8fb96a19fce625d39184b705f7b6d  LICENSE.TXT
diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.mk b/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
index b293c7ccc2..e7b59a9dcf 100644
--- a/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.mk
@@ -11,9 +11,8 @@ LLVM_LIBUNWIND_LICENSE = Apache-2.0 with exceptions
 LLVM_LIBUNWIND_LICENSE_FILES = LICENSE.TXT
 LLVM_LIBUNWIND_SUPPORTS_IN_SOURCE_BUILD = NO
 
-HOST_LLVM_LIBUNWIND_DEPENDENCIES = host-llvm-cmake
+HOST_LLVM_LIBUNWIND_DEPENDENCIES = host-llvm-cmake host-llvm-runtimes
 HOST_LLVM_LIBUNWIND_CONF_OPTS += \
-	-DCMAKE_MODULE_PATH="$(HOST_DIR)/lib/cmake/llvm" \
-	-DLIBUNWIND_INSTALL_HEADERS=ON
+	-DCMAKE_MODULE_PATH="$(HOST_DIR)/lib/cmake/llvm"
 
 $(eval $(host-cmake-package))
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 6f075793a5..fdbfcbadc9 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LLVM_PROJECT_VERSION_MAJOR = 15
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).0.7
+LLVM_PROJECT_VERSION_MAJOR = 20
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.5
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 
 include $(sort $(wildcard package/llvm-project/*/*.mk))
diff --git a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
index 66d9e1f336..93077efaba 100644
--- a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
+++ b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
@@ -1,2 +1,2 @@
 # locally calculated
-sha256  6394d8f111288c918421756037c10c4f8471325992e37c44cf8811b4e3dde00b  runtimes-20.1.3.src.tar.xz
+sha256  8b3255668594ca3450ac5c041ac52c3c33300873d033cda49529e7fe1d4257e6  runtimes-20.1.5.src.tar.xz
diff --git a/package/llvm-project/llvm-runtimes/llvm-runtimes.mk b/package/llvm-project/llvm-runtimes/llvm-runtimes.mk
index 34ac9ece31..1886ff3a14 100644
--- a/package/llvm-project/llvm-runtimes/llvm-runtimes.mk
+++ b/package/llvm-project/llvm-runtimes/llvm-runtimes.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-LLVM_RUNTIMES_VERSION = 20.1.3
+LLVM_RUNTIMES_VERSION = $(LLVM_PROJECT_VERSION)
 LLVM_RUNTIMES_SITE = $(LLVM_PROJECT_SITE)
 LLVM_RUNTIMES_SOURCE = runtimes-$(LLVM_RUNTIMES_VERSION).src.tar.xz
 LLVM_RUNTIMES_LICENSE = Apache-2.0 with exceptions
 
 define HOST_LLVM_RUNTIMES_INSTALL_CMDS
-        mkdir -p $(HOST_DIR)/lib/cmake/llvm/Modules
-        cp -Rv $(@D)/cmake/Modules/* $(HOST_DIR)/lib/cmake/llvm
+	mkdir -p $(HOST_DIR)/lib/cmake/llvm/Modules
+	cp -Rv $(@D)/cmake/Modules/* $(HOST_DIR)/lib/cmake/llvm
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/llvm-project/llvm/0001-ADT-Add-cstdint-to-SmallVector-101761.patch b/package/llvm-project/llvm/0001-ADT-Add-cstdint-to-SmallVector-101761.patch
deleted file mode 100644
index eea83c27a8..0000000000
--- a/package/llvm-project/llvm/0001-ADT-Add-cstdint-to-SmallVector-101761.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 51d88407c1ae86c3b3c7b497d049f8980f2a3510 Mon Sep 17 00:00:00 2001
-From: Sam James <sam@gentoo.org>
-Date: Fri, 2 Aug 2024 23:07:21 +0100
-Subject: [PATCH] [ADT] Add `<cstdint>` to SmallVector (#101761)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-SmallVector uses `uint32_t`, `uint64_t` without including `<cstdint>`
-which fails to build w/ GCC 15 after a change in libstdc++ [0]
-
-[0] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=3a817a4a5a6d94da9127af3be9f84a74e3076ee2
-
-Gentoo-Component: llvm
-Signed-off-by: Michał Górny <mgorny@gentoo.org>
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://bugs.gentoo.org/939498
----
- include/llvm/ADT/SmallVector.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/llvm/ADT/SmallVector.h b/include/llvm/ADT/SmallVector.h
-index e34702bdbb3c..1c0f3465b2a9 100644
---- a/include/llvm/ADT/SmallVector.h
-+++ b/include/llvm/ADT/SmallVector.h
-@@ -19,6 +19,7 @@
- #include <algorithm>
- #include <cassert>
- #include <cstddef>
-+#include <cstdint>
- #include <cstdlib>
- #include <cstring>
- #include <functional>
--- 
-2.46.0
diff --git a/package/llvm-project/llvm/0001-Fix-standalone-build-for-llvm.patch b/package/llvm-project/llvm/0001-Fix-standalone-build-for-llvm.patch
new file mode 100644
index 0000000000..cbb15599cb
--- /dev/null
+++ b/package/llvm-project/llvm/0001-Fix-standalone-build-for-llvm.patch
@@ -0,0 +1,49 @@
+From 255068deb7f3d18837ed30e739aa92c111ab450a Mon Sep 17 00:00:00 2001
+From: El Mehdi YOUNES <elmehdi.younes@smile.fr>
+Date: Sat, 10 May 2025 12:55:07 +0200
+Subject: [PATCH] Fix standalone build for llvm
+
+Upstream commit 9dd01a5241dc ("Harmonize cmake_policy() across standalone builds of all projects")
+moved the `cmake_policy()` settings from `llvm/CMakeLists.txt` into a shared
+`cmake/modules/CMakePolicy.cmake`, and included it from all relevant projects
+(Clang, LLD, LLDB, etc.) to harmonize standalone builds.
+
+However, in `llvm/CMakeLists.txt`, unlike other components, the line:
+    set(LLVM_COMMON_CMAKE_UTILS ...)
+was left **without** the usual:
+    if(NOT DEFINED LLVM_COMMON_CMAKE_UTILS)
+
+This prevents external build systems (e.g., when using separate source archives)
+from overriding the `LLVM_COMMON_CMAKE_UTILS` variable, since the value is
+always reset unconditionally.
+
+This patch adds the missing `if(NOT DEFINED LLVM_COMMON_CMAKE_UTILS)` guard,
+in the same way as it is already done in Clang, LLD, etc., to make
+`LLVM_COMMON_CMAKE_UTILS` properly overridable.
+
+Upstream: Not submitted
+
+Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
+---
+ llvm/CMakeLists.txt | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f5293e866324..d861233f299f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -4,7 +4,10 @@ cmake_minimum_required(VERSION 3.20.0)
+ 
+ include(CMakeDependentOption)
+ 
+-set(LLVM_COMMON_CMAKE_UTILS ${CMAKE_CURRENT_SOURCE_DIR}/../cmake)
++if(NOT DEFINED LLVM_COMMON_CMAKE_UTILS)
++  set(LLVM_COMMON_CMAKE_UTILS ${CMAKE_CURRENT_SOURCE_DIR}/../cmake)
++endif()
++
+ include(${LLVM_COMMON_CMAKE_UTILS}/Modules/CMakePolicy.cmake
+   NO_POLICY_SCOPE)
+ 
+-- 
+2.49.0
+
diff --git a/package/llvm-project/llvm/0002-AMDGPU-Include-cstdint-in-AMDGPUMCTargetDesc-101766.patch b/package/llvm-project/llvm/0002-AMDGPU-Include-cstdint-in-AMDGPUMCTargetDesc-101766.patch
deleted file mode 100644
index 73beab6c23..0000000000
--- a/package/llvm-project/llvm/0002-AMDGPU-Include-cstdint-in-AMDGPUMCTargetDesc-101766.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 000f92beb459096534a7bfaa8c5e99d77b7594c1 Mon Sep 17 00:00:00 2001
-From: Sam James <sam@gentoo.org>
-Date: Sat, 3 Aug 2024 06:36:43 +0100
-Subject: [PATCH] [AMDGPU] Include `<cstdint>` in AMDGPUMCTargetDesc
- (#101766)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Gentoo-Component: llvm
-Signed-off-by: Michał Górny <mgorny@gentoo.org>
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://bugs.gentoo.org/939498
----
- lib/Target/AMDGPU/MCTargetDesc/AMDGPUMCTargetDesc.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/Target/AMDGPU/MCTargetDesc/AMDGPUMCTargetDesc.h b/lib/Target/AMDGPU/MCTargetDesc/AMDGPUMCTargetDesc.h
-index c2e2563c3989..53aac8934100 100644
---- a/lib/Target/AMDGPU/MCTargetDesc/AMDGPUMCTargetDesc.h
-+++ b/lib/Target/AMDGPU/MCTargetDesc/AMDGPUMCTargetDesc.h
-@@ -15,6 +15,7 @@
- #ifndef LLVM_LIB_TARGET_AMDGPU_MCTARGETDESC_AMDGPUMCTARGETDESC_H
- #define LLVM_LIB_TARGET_AMDGPU_MCTARGETDESC_AMDGPUMCTARGETDESC_H
- 
-+#include <cstdint>
- #include <memory>
- 
- namespace llvm {
--- 
-2.46.0
diff --git a/package/llvm-project/llvm/0003-Another-gcc-15-fix-from-Sam-James.patch b/package/llvm-project/llvm/0003-Another-gcc-15-fix-from-Sam-James.patch
deleted file mode 100644
index bc958bb056..0000000000
--- a/package/llvm-project/llvm/0003-Another-gcc-15-fix-from-Sam-James.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 67fc0069c285b37f09d408aae43c37b8afdf11f7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Micha=C5=82=20G=C3=B3rny?= <mgorny@gentoo.org>
-Date: Sat, 3 Aug 2024 12:01:20 +0200
-Subject: [PATCH] Another gcc-15 fix from Sam James
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Bug: https://bugs.gentoo.org/937164
-Gentoo-Component: llvm
-Signed-off-by: Michał Górny <mgorny@gentoo.org>
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://bugs.gentoo.org/939498
----
- lib/Target/X86/MCTargetDesc/X86MCTargetDesc.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/Target/X86/MCTargetDesc/X86MCTargetDesc.h b/lib/Target/X86/MCTargetDesc/X86MCTargetDesc.h
-index d0530bd4d650..10b59462aebe 100644
---- a/lib/Target/X86/MCTargetDesc/X86MCTargetDesc.h
-+++ b/lib/Target/X86/MCTargetDesc/X86MCTargetDesc.h
-@@ -13,6 +13,7 @@
- #ifndef LLVM_LIB_TARGET_X86_MCTARGETDESC_X86MCTARGETDESC_H
- #define LLVM_LIB_TARGET_X86_MCTARGETDESC_X86MCTARGETDESC_H
- 
-+#include <cstdint>
- #include <memory>
- #include <string>
- 
--- 
-2.46.0
diff --git a/package/llvm-project/llvm/Config.in b/package/llvm-project/llvm/Config.in
index 4ee84b3bcc..fcf6417a33 100644
--- a/package/llvm-project/llvm/Config.in
+++ b/package/llvm-project/llvm/Config.in
@@ -24,6 +24,7 @@ config BR2_PACKAGE_LLVM
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # std::wstring
 	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
+	select BR2_HOST_CMAKE_AT_LEAST_3_20 # cmake required version at least 3.20
 	help
 	  The LLVM Project is a collection of modular and reusable
 	  compiler and toolchain technologies.
diff --git a/package/llvm-project/llvm/llvm.hash b/package/llvm-project/llvm/llvm.hash
index 4325da6f6b..bc46117ec6 100644
--- a/package/llvm-project/llvm/llvm.hash
+++ b/package/llvm-project/llvm/llvm.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  4ad8b2cc8003c86d0078d15d987d84e3a739f24aae9033865c027abae93ee7a4  llvm-15.0.7.src.tar.xz
+sha256  9a9a80ca4c0d902531f2b43e9e4d6c36b57cdd5702430e0b54567bf273bd32c1  llvm-20.1.5.src.tar.xz
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm/llvm.mk b/package/llvm-project/llvm/llvm.mk
index b0515474d8..7552e3590c 100644
--- a/package/llvm-project/llvm/llvm.mk
+++ b/package/llvm-project/llvm/llvm.mk
@@ -20,11 +20,19 @@ LLVM_DEPENDENCIES = host-llvm
 HOST_LLVM_CONF_OPTS += -DCMAKE_MODULE_PATH=$(HOST_DIR)/lib/cmake/llvm
 LLVM_CONF_OPTS += -DCMAKE_MODULE_PATH=$(HOST_DIR)/lib/cmake/llvm
 
+HOST_LLVM_CONF_OPTS += -DLLVM_COMMON_CMAKE_UTILS=$(HOST_DIR)/lib/cmake/llvm
+LLVM_CONF_OPTS += -DLLVM_COMMON_CMAKE_UTILS=$(HOST_DIR)/lib/cmake/llvm
+
 # Don't build clang libcxx libcxxabi lldb compiler-rt lld polly as llvm subprojects
 # This flag assumes that projects are checked out side-by-side and not nested
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_PROJECTS=""
 LLVM_CONF_OPTS += -DLLVM_ENABLE_PROJECTS=""
 
+# LLVM_ENABLE_RUNTIMES for runtime components libcxx etc
+
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_RUNTIMES=""
+LLVM_CONF_OPTS += -DLLVM_ENABLE_RUNTIMES=""
+
 HOST_LLVM_CONF_OPTS += -DLLVM_CCACHE_BUILD=$(if $(BR2_CCACHE),ON,OFF)
 LLVM_CONF_OPTS += -DLLVM_CCACHE_BUILD=$(if $(BR2_CCACHE),ON,OFF)
 
@@ -151,6 +159,10 @@ LLVM_CONF_OPTS += -DLLVM_ENABLE_Z3_SOLVER=OFF
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_PIC=ON
 LLVM_CONF_OPTS += -DLLVM_ENABLE_PIC=ON
 
+# Disable TFTLite integration
+HOST_LLVM_CONF_OPTS += -DLLVM_HAVE_TFLITE=""
+LLVM_CONF_OPTS += -DLLVM_HAVE_TFLITE=""
+
 # Default is Debug build, which requires considerably more disk space and
 # build time. Release build is selected for host and target because the linker
 # can run out of memory in Debug mode.
@@ -261,7 +273,6 @@ HOST_LLVM_CONF_OPTS += \
 	-DLLVM_ENABLE_SPHINX=OFF \
 	-DLLVM_INCLUDE_EXAMPLES=OFF \
 	-DLLVM_INCLUDE_DOCS=OFF \
-	-DLLVM_INCLUDE_GO_TESTS=OFF \
 	-DLLVM_INCLUDE_TESTS=OFF \
 	-DLLVM_INCLUDE_BENCHMARKS=OFF
 LLVM_CONF_OPTS += \
@@ -273,7 +284,6 @@ LLVM_CONF_OPTS += \
 	-DLLVM_ENABLE_SPHINX=OFF \
 	-DLLVM_INCLUDE_EXAMPLES=OFF \
 	-DLLVM_INCLUDE_DOCS=OFF \
-	-DLLVM_INCLUDE_GO_TESTS=OFF \
 	-DLLVM_INCLUDE_TESTS=OFF \
 	-DLLVM_INCLUDE_BENCHMARKS=OFF
 
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index 4500fc4f62..6cd47762f7 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  0a00a72a5b004eeb73f9c96c9c6ba2d6de232cbf3c22a7b322047604d24402ba  spirv-llvm-translator-v15.0.0-46-ge82ecc2bd7295604fcf1824e47c95fa6a09c6e63.tar.gz
+sha256  ca89c35cbc55cfe69ab9fa1a2f3ee585d30cb285e01e2cae309fe0e1f1dfd79e  spirv-llvm-translator-v20.1.2-7-g834db1a1985ac36d5a3e1b4b34dc1ca3f919ad5b.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index ffc8a63b89..6ba58c392f 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # Generate version string using:
-#   git describe --tags --match 'v15*' --abbrev=40 origin/llvm_release_150
-SPIRV_LLVM_TRANSLATOR_VERSION = v15.0.0-46-ge82ecc2bd7295604fcf1824e47c95fa6a09c6e63
+#   git describe --tags --match 'v20*' --abbrev=40 origin/llvm_release_200
+SPIRV_LLVM_TRANSLATOR_VERSION = v20.1.2-7-g834db1a1985ac36d5a3e1b4b34dc1ca3f919ad5b
 SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index e644c1e7bb..9970cad5e1 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -62,6 +62,9 @@ static char *predef_args[] = {
 #endif
 	path,
 	"--sysroot", sysroot,
+#ifdef BR_CLANG_CONFIG_FILE
+	BR_CLANG_CONFIG_FILE,
+#endif
 #ifdef BR_ABI
 	"-mabi=" BR_ABI,
 #endif

--===============0321180601591116655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0321180601591116655==--
