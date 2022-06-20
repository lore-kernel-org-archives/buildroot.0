Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A3FC43334
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 19:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C43C40B95;
	Mon, 20 Jun 2022 19:36:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C43C40B95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04b4hz8ZUPRD; Mon, 20 Jun 2022 19:36:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7499A40B83;
	Mon, 20 Jun 2022 19:36:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7499A40B83
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF2171BF3FD
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B556360F71
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:34:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B556360F71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dM8iSWyFmLe0 for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 19:34:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8B3160FEC
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 19:34:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8B3160FEC
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 05F71874DD; Mon, 20 Jun 2022 19:22:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 20 Jun 2022 21:11:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b19126c3985c4897e96e2430c813d18eae198531
X-Git-Newrev: b1fcb596fe93f4c785f93fef58bc09ccba152406
X-Patchwork-Hint: ignore
Message-Id: <20220620192232.05F71874DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/compiler-rt: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b1fcb596fe93f4c785f93fef58bc09ccba152406
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds support for the compiler-rt (CLANG runtime) library.
It builds a set of static libraries and installs them into the
CLANG/LLVM toolchain resource folder. These libraries can then be
used by developers in the SDK for building target applications for
analysis.

What is fuzzing and why libfuzzer?
https://www.moritz.systems/blog/an-introduction-to-llvm-libfuzzer/

The compiler-rt fuzzer and address sanitizer tools require additional
LLVM binary tools installed to allow stack trace decoding actively during
executable analysis.  This patch conditionally enables these tools.
https://github.com/google/sanitizers/wiki/AddressSanitizerCallStack

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Cc: Romain Naour <romain.naour@smile.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
Cc: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/compiler-rt/Config.in        | 14 ++++++++++++++
 package/compiler-rt/compiler-rt.hash |  3 +++
 package/compiler-rt/compiler-rt.mk   | 37 ++++++++++++++++++++++++++++++++++++
 package/llvm/llvm.mk                 | 21 ++++++++++++++++----
 6 files changed, 73 insertions(+), 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 62191e554c..966751299e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1903,6 +1903,7 @@ F:	package/bridge-utils/
 F:	package/checkpolicy/
 F:	package/checksec/
 F:	package/cgroupfs-mount/
+F:	package/compiler-rt/
 F:	package/crda/
 F:	package/cunit/
 F:	package/dacapo/
diff --git a/package/Config.in b/package/Config.in
index 8b4f5570c4..0e3eb11b24 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1934,6 +1934,7 @@ menu "Other"
 	source "package/cereal/Config.in"
 	source "package/clang/Config.in"
 	source "package/cmocka/Config.in"
+	source "package/compiler-rt/Config.in"
 	source "package/cppcms/Config.in"
 	source "package/cracklib/Config.in"
 	source "package/dawgdic/Config.in"
diff --git a/package/compiler-rt/Config.in b/package/compiler-rt/Config.in
new file mode 100644
index 0000000000..9afc0d9d60
--- /dev/null
+++ b/package/compiler-rt/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_COMPILER_RT
+	bool "compiler-rt"
+	depends on BR2_PACKAGE_LLVM
+	depends on BR2_TOOLCHAIN_USES_GLIBC # asan lib requires
+	help
+	  A collection of runtime libraries primarily used by clang and
+	  llvm to provide builtins, sanitizer runtimes, and profiling
+	  at runtime.
+
+	  https://compiler-rt.llvm.org/
+
+comment "compiler-rt requires llvm to be enabled and a glibc toolchain"
+	depends on !BR2_PACKAGE_LLVM
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/compiler-rt/compiler-rt.hash b/package/compiler-rt/compiler-rt.hash
new file mode 100644
index 0000000000..8ee010ac5a
--- /dev/null
+++ b/package/compiler-rt/compiler-rt.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  def1fc00c764cd3abbba925c712ac38860a756a43b696b291f46fee09e453274  compiler-rt-11.1.0.src.tar.xz
+sha256  1a8f1058753f1ba890de984e48f0242a3a5c29a6a8f2ed9fd813f36985387e8d  LICENSE.TXT
diff --git a/package/compiler-rt/compiler-rt.mk b/package/compiler-rt/compiler-rt.mk
new file mode 100644
index 0000000000..57f9c26854
--- /dev/null
+++ b/package/compiler-rt/compiler-rt.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# compiler-rt
+#
+################################################################################
+
+# Compiler-RT should be bumped together with LLVM and Clang as the run-time is
+# tied to the version of those tools
+COMPILER_RT_VERSION = 11.1.0
+COMPILER_RT_SOURCE = compiler-rt-$(COMPILER_RT_VERSION).src.tar.xz
+COMPILER_RT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(COMPILER_RT_VERSION)
+COMPILER_RT_LICENSE = NCSA MIT
+COMPILER_RT_LICENSE_FILES = LICENSE.TXT
+COMPILER_RT_DEPENDENCIES = host-clang llvm
+
+COMPILER_RT_INSTALL_STAGING = YES
+COMPILER_RT_INSTALL_TARGET = NO
+
+COMPILER_RT_CONF_OPTS=-DCOMPILER_RT_STANDALONE_BUILD=OFF \
+	-DCOMPILER_RT_STANDALONE_BUILD=ON \
+	-DCOMPILER_RT_DEFAULT_TARGET_TRIPLE=$(GNU_TARGET_NAME) \
+	-DLLVM_CONFIG_PATH=$(HOST_DIR)/usr/bin/llvm-config
+
+# The installation of the target runtime libraries defaults to DESTDIR, however
+# host-clang resources directory needs a link so Clang can find the runtime
+# libraries in the same location they would be if built as part of the Clang
+# build. The "resources" directory is loosely documented and seems to be
+# assumed, as compiler-rt is usually build at the same time as Clang and not
+# standalone.
+define COMPILER_RT_SETUP_RUNTIME_LIBS
+	mkdir -p $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/lib
+	ln -sf ../../../../$(GNU_TARGET_NAME)/sysroot/usr/lib/linux $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/lib/linux
+	ln -sf ../../../../$(GNU_TARGET_NAME)/sysroot/usr/share $(HOST_DIR)/lib/clang/$(HOST_CLANG_VERSION)/share
+endef
+COMPILER_RT_POST_INSTALL_STAGING_HOOKS += COMPILER_RT_SETUP_RUNTIME_LIBS
+
+$(eval $(cmake-package))
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 825de96392..4670773ca3 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -214,8 +214,7 @@ HOST_LLVM_CONF_OPTS += \
 # We need to activate LLVM_INCLUDE_TOOLS, otherwise it does not generate
 # libLLVM.so
 LLVM_CONF_OPTS += \
-	-DLLVM_INCLUDE_TOOLS=ON \
-	-DLLVM_BUILD_TOOLS=OFF
+	-DLLVM_INCLUDE_TOOLS=ON
 
 ifeq ($(BR2_PACKAGE_LLVM_RTTI),y)
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_RTTI=ON
@@ -278,11 +277,25 @@ LLVM_CONF_OPTS += \
 # directories from STAGING_DIR.
 # output/staging/usr/bin/llvm-config --includedir
 # output/staging/usr/include
-define HOST_LLVM_COPY_LLVM_CONFIG_TO_STAGING_DIR
+define LLVM_COPY_LLVM_CONFIG_TO_STAGING_DIR
 	$(INSTALL) -D -m 0755 $(HOST_DIR)/bin/llvm-config \
 		$(STAGING_DIR)/usr/bin/llvm-config
 endef
-HOST_LLVM_POST_INSTALL_HOOKS = HOST_LLVM_COPY_LLVM_CONFIG_TO_STAGING_DIR
+HOST_LLVM_POST_INSTALL_HOOKS = LLVM_COPY_LLVM_CONFIG_TO_STAGING_DIR
+
+# The llvm-symbolizer binary is used by the Compiler-RT Fuzzer
+# and AddressSanitizer tools on the target for stack traces.
+# If we set -DLLVM_BUILD_TOOLS=ON this will also install the llvm-config
+# target binary to STAGING_DIR, which means we can no longer run it.
+# Therefore, overwrite it again with the host llvm-config.
+ifeq ($(BR2_PACKAGE_COMPILER_RT),y)
+LLVM_CONF_OPTS += \
+	-DLLVM_BUILD_TOOLS=ON
+LLVM_POST_INSTALL_STAGING_HOOKS = LLVM_COPY_LLVM_CONFIG_TO_STAGING_DIR
+else
+LLVM_CONF_OPTS += \
+	-DLLVM_BUILD_TOOLS=OFF
+endif
 
 # By default llvm-tblgen is built and installed on the target but it is
 # not necessary. Also erase LLVMHello.so from /usr/lib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
