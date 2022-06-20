Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E19C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 19:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CA7540B66;
	Mon, 20 Jun 2022 19:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CA7540B66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id evCvjFjg5ri8; Mon, 20 Jun 2022 19:36:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B13F40B63;
	Mon, 20 Jun 2022 19:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B13F40B63
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC35C1BF3FD
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08CB960FF2
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:34:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08CB960FF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m10DF4TO0E-b for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 19:34:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0248D60FF0
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 19:34:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0248D60FF0
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 25FBD874DC; Mon, 20 Jun 2022 19:22:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 20 Jun 2022 21:32:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e9417e3b4a72d7c3cd00b0d7e93db47125917d6
X-Git-Newrev: 570aa425596cc1266cd9fba9af66b3e97f48fb62
X-Patchwork-Hint: ignore
Message-Id: <20220620192232.25FBD874DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] testing/tests: CLANG compiler-rt runtime
 test
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

commit: https://git.buildroot.net/buildroot/commit/?id=570aa425596cc1266cd9fba9af66b3e97f48fb62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a test case that
 1) Builds the complete LLVM and CLANG set of host tools
 2) Cross-compiles the compiler-rt runtime using CLANG
 3) Builds a cross-compiled application using CLANG and the libfuzzer
    compiler-rt library.
 4) Executes the fuzz application (part of the libfuzzer package) on
    target and checks expected output for a heap-buffer-overflow.

Note: The libfuzzer package is just a tutorial example of how to use
      the toolkit provided by llvm (Thus not adding it as a full
      Buildroot package).

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Romain Naour <romain.naour@smile.fr>
[Arnout: add Matt to DEVELOPERS]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |  2 +
 .../br2-external/clang-compiler-rt/Config.in       |  1 +
 .../br2-external/clang-compiler-rt/external.desc   |  1 +
 .../br2-external/clang-compiler-rt/external.mk     |  1 +
 .../clang-compiler-rt/package/libfuzzer/Config.in  |  8 ++++
 .../package/libfuzzer/libfuzzer.hash               |  2 +
 .../package/libfuzzer/libfuzzer.mk                 | 24 +++++++++++
 support/testing/tests/package/test_clang.py        | 46 ++++++++++++++++++++++
 8 files changed, 85 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 966751299e..63d1c3fcb6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1985,7 +1985,9 @@ F:	package/wireless_tools/
 F:	package/xen/
 F:	package/xml-security-c/
 F:	support/testing/tests/fs/test_oci.py
+F:	support/testing/tests/package/br2-external/clang-compiler-rt/
 F:	support/testing/tests/package/br2-external/openjdk/
+F:	support/testing/tests/package/test_clang.py
 F:	support/testing/tests/package/test_openjdk.py
 F:	support/testing/tests/package/test_opkg/
 F:	support/testing/tests/package/test_opkg.py
diff --git a/support/testing/tests/package/br2-external/clang-compiler-rt/Config.in b/support/testing/tests/package/br2-external/clang-compiler-rt/Config.in
new file mode 100644
index 0000000000..e1f9f8c598
--- /dev/null
+++ b/support/testing/tests/package/br2-external/clang-compiler-rt/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_CLANG_COMPILER_RT_PATH/package/libfuzzer/Config.in"
diff --git a/support/testing/tests/package/br2-external/clang-compiler-rt/external.desc b/support/testing/tests/package/br2-external/clang-compiler-rt/external.desc
new file mode 100644
index 0000000000..92df85911d
--- /dev/null
+++ b/support/testing/tests/package/br2-external/clang-compiler-rt/external.desc
@@ -0,0 +1 @@
+name: CLANG_COMPILER_RT
diff --git a/support/testing/tests/package/br2-external/clang-compiler-rt/external.mk b/support/testing/tests/package/br2-external/clang-compiler-rt/external.mk
new file mode 100644
index 0000000000..6fa55c1211
--- /dev/null
+++ b/support/testing/tests/package/br2-external/clang-compiler-rt/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_CLANG_COMPILER_RT_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/Config.in b/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/Config.in
new file mode 100644
index 0000000000..2d335fd3c7
--- /dev/null
+++ b/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBFUZZER
+	bool "libfuzzer"
+	help
+	  This project aims at hosting tutorials,
+	  examples, discussions, research proposals,
+	  and other resources related to fuzzing.
+
+	  https://github.com/google/fuzzing
diff --git a/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.hash b/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.hash
new file mode 100644
index 0000000000..0601cc02c6
--- /dev/null
+++ b/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.hash
@@ -0,0 +1,2 @@
+sha256  c71360c3b1ba1d88b28b0b3cb3a1744d251b87a12f2881224cc53ec26eb7a2db  libfuzzer-cec02db916d21baa4db5b8d262d78848b3a35f4b.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk b/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk
new file mode 100644
index 0000000000..0515b9da35
--- /dev/null
+++ b/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# libfuzzer
+#
+################################################################################
+
+LIBFUZZER_VERSION = cec02db916d21baa4db5b8d262d78848b3a35f4b
+LIBFUZZER_SITE = $(call github,google,fuzzing,$(LIBFUZZER_VERSION))
+LIBFUZZER_LICENSE = Apache-2.0
+LIBFUZZER_LICENSE_FILES = LICENSE
+LIBFUZZER_DEPENDENCIES = compiler-rt
+
+define LIBFUZZER_BUILD_CMDS
+	$(HOST_DIR)/bin/clang++ --sysroot=$(STAGING_DIR) \
+		-fsanitize=address,fuzzer \
+		$(@D)/tutorial/libFuzzer/fuzz_me.cc \
+		-o $(@D)/fuzz_me
+endef
+
+define LIBFUZZER_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/fuzz_me $(TARGET_DIR)/usr/bin/fuzz_me
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/test_clang.py b/support/testing/tests/package/test_clang.py
new file mode 100644
index 0000000000..df3990c6be
--- /dev/null
+++ b/support/testing/tests/package/test_clang.py
@@ -0,0 +1,46 @@
+import os
+
+import infra.basetest
+
+FUZZ_TIMEOUT = 120
+
+
+class TestClangCompilerRT(infra.basetest.BRTest):
+    br2_external = [infra.filepath("tests/package/br2-external/clang-compiler-rt")]
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_COMPILER_RT=y
+        BR2_PACKAGE_LLVM=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_LIBFUZZER=y
+        """
+
+    def login(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        # Sanitizers overallocate memory and the minimum that seemed to work was 512MB
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a53", "-m", "512", "-initrd", img])
+        self.emulator.login()
+
+    def test_run(self):
+        self.login()
+
+        # The test case verifies the application executes and that
+        # the symbolizer is working to decode the stack trace.
+        cmd = "fuzz_me 2>&1 | grep heap-buffer-overflow"
+        _, exit_code = self.emulator.run(cmd, FUZZ_TIMEOUT)
+        self.assertEqual(exit_code, 0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
