Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FC8C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 23:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0569E418F5;
	Tue, 22 Mar 2022 23:24:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tC35i-C0GjOc; Tue, 22 Mar 2022 23:24:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3C48418E7;
	Tue, 22 Mar 2022 23:24:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 907171BF427
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 23:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E33740194
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 23:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XXlmzaG7oYJ3 for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 23:22:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED92240AFA
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 23:22:39 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id k25so21959016iok.8
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 16:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MGk1WCmn4wDRAfdTUJQTI0/iQc0SFilqeAXvkitQqQw=;
 b=U9BauPBeijaYJOwE0Vh7O+zz9MHhBurlgmmW+L3CFekdHgSA+AAoG0GOn883GvZcA5
 ewt8yTTkYDfJ2epMbarOunhcliSw/tXA/ZNEr9Q2lgtWKcR7fUKahdU19Ts3uBnh54w4
 VanF7azp22LXeFMrXbjbcVInnDlA2xUP2UgPuA+P2pK2NdqAzW9fHlsv/y+Lpgg3cqDO
 XJMoXav6AdtqHyEXy43F7Qh1XrwAaxJGmeCm0ONxPV+L0CBqdOeD9JRGQOLDNZakPMf1
 5RJMpsRC/m+6QfvWHJU66j0gmM2bTcNBVZzXDJcVUzQp7mEYiVCcxcV7ee52jsnAY7sg
 bq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MGk1WCmn4wDRAfdTUJQTI0/iQc0SFilqeAXvkitQqQw=;
 b=53SW7zPTVNdtxfpK6Ypyjb5wGqMa/1vY2dxgiU3T9WrfIfpWjKoex9FyZjqdmQ5nhY
 MTPBLbA5g6cJZBvyjtpiup8GGFofzOpxmCYMHLUK67Wb3e9YTtjX53VYVqX0iwmrWa4o
 kuwGT66Z/4pecIve9GLuKpbktyWcbEKYrCDdBQGokSUEpT8QUnKyIVp+wNMtCuVhhOM7
 xTEVvGPIBngTDpxFeS1/2tdBqIQ85BDvtbAyS1QXosbl0O6z2daFqI21uHNiAdRQ1Y7G
 VYHvo1hx4tdpKdFbxdWx93QOfNr/XIe0FJb/x2JsJg/CnquwfQiUzWERlpUGW9ET1VcJ
 8dfg==
X-Gm-Message-State: AOAM531b8sPa7Jf6NwOJBaPusdIPVjTrRzjqk3WKKYg8O3zchpjnyJAz
 SNTiGuanrIoJKcPY34lZrL/twBXR29EiveJ3
X-Google-Smtp-Source: ABdhPJyiZ6tFiYCIU0UzsEqhg8Ofzjzu5DXNMrkQxdfVzmGyTxOKQJyD8QvhMYBgA0MQ6QQ7HJdVbQ==
X-Received: by 2002:a05:6638:33a3:b0:321:27c4:db69 with SMTP id
 h35-20020a05663833a300b0032127c4db69mr8582535jav.260.1647991358740; 
 Tue, 22 Mar 2022 16:22:38 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 i81-20020a6bb854000000b00649c1b67a6csm2006324iof.28.2022.03.22.16.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 16:22:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 17:22:21 -0600
Message-Id: <20220322232224.2842266-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322232224.2842266-1-james.hilliard1@gmail.com>
References: <20220322232224.2842266-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v12 08/11] testing/tests: CLANG compiler-rt
 runtime test
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>, Romain Naour <romain.naour@smile.fr>,
 Matt Weber <matthew.weber@rockwellcollins.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Matt Weber <matthew.weber@rockwellcollins.com>

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

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Romain Naour <romain.naour@smile.fr>
---
Changes
v1 -> v2
[Ricardo
 - updated yml with test case
 - moved emulator launch cmd to test case from infra
 - defconfig in the order provided by savedefconfig
 - indent defconfig
 - add full package for test code to the test br2-external
 - consolidated to one class only

v2 -> v3
 - Added Review/tested by Ricardo's
   [with the entire series applied on next branch:
    https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/121908178
    NOTE: this test case takes longer than test_rust, ~2 hours in my host
    machine with all tarballs previously downloaded]

v4
 - None

v5
 - Rebased post 2018.11 on master

v6
 - Testing of LLVM/Clang bump

v7
 - Rebase on master and testing of LLVM/Clang bump to 8.0
 - Updated hashes for archive and legal info (legal info changed
   because of spelling cleanup)

v8
 - Cleaned up wording the 4th item of the message above.

[Romain
 - Removes a hardcoded toolchain/sysroot path "b option" for libfuzzer
   pkg build, however requires this series applied.
   http://patchwork.ozlabs.org/project/buildroot/list/?series=129565
 - updated test case to check for heap overflow string to keep arch
   generic
 - Removed the fixed mcpu arg from clang++ build and dropped --sysroot
   as cross compiler wrapper now provides this for libfuzzer build

v9
 - Rebased post 2020.05

v10
 - Updated site for libfuzzer test case and bumped version
 - Switched back to have no dependency on clang as cross compiler series
   - Fixed a libfuzzer link time gcc ld error by adding sysroot and -B
     to the BUILD_CMDS since we don't depend on the cross wrapper.
 - Tested against master[8640e8ffde3f61c583] using
   support/testing/run-tests -o runtest -k \
        tests.package.test_clang.TestClangCompilerRT

v11
 - Updated compiler-rt version to 11.1.0
---
 .../br2-external/clang-compiler-rt/Config.in  |  1 +
 .../clang-compiler-rt/external.desc           |  1 +
 .../clang-compiler-rt/external.mk             |  1 +
 .../package/libfuzzer/Config.in               |  8 ++++
 .../package/libfuzzer/libfuzzer.hash          |  2 +
 .../package/libfuzzer/libfuzzer.mk            | 24 ++++++++++
 support/testing/tests/package/test_clang.py   | 46 +++++++++++++++++++
 7 files changed, 83 insertions(+)
 create mode 100644 support/testing/tests/package/br2-external/clang-compiler-rt/Config.in
 create mode 100644 support/testing/tests/package/br2-external/clang-compiler-rt/external.desc
 create mode 100644 support/testing/tests/package/br2-external/clang-compiler-rt/external.mk
 create mode 100644 support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/Config.in
 create mode 100644 support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.hash
 create mode 100644 support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk
 create mode 100644 support/testing/tests/package/test_clang.py

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
index 0000000000..9287005ed9
--- /dev/null
+++ b/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.hash
@@ -0,0 +1,2 @@
+sha256 c71360c3b1ba1d88b28b0b3cb3a1744d251b87a12f2881224cc53ec26eb7a2db  libfuzzer-cec02db916d21baa4db5b8d262d78848b3a35f4b.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk b/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk
new file mode 100644
index 0000000000..6c6371bea7
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
+		-B $(HOST_DIR)/opt/ext-toolchain -fsanitize=address,fuzzer \
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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
