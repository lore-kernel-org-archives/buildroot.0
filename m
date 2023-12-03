Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D516C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 04:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32D4281E94;
	Sun,  3 Dec 2023 04:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32D4281E94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2smupsRwlnUd; Sun,  3 Dec 2023 04:19:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 281AA81EC9;
	Sun,  3 Dec 2023 04:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 281AA81EC9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B9F041BF2B9
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 04:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92E374139E
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 04:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92E374139E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id etZEMcx0Szdj for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 04:19:12 +0000 (UTC)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BB4F410A4
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 04:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BB4F410A4
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-35d6b381341so217185ab.2
 for <buildroot@buildroot.org>; Sat, 02 Dec 2023 20:19:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701577150; x=1702181950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qfgrSDGzrsyUiNB2FAOPETkqXtyaQkgm+yc3yNKAAEY=;
 b=YbrVmJUPaUIKVp9xOk+aDnc0a/6Fyt4RuFQ0e0rzUXM/ErpvLf6v8XLf9J5sbUZ3a6
 KvnBGW7931XYTdu2AFBl4Vx4BOOybKIeXXzQZa6ID4PLLYghL0VRp9vdd3Qkjm8Lo8K/
 mbRQxFF6+YUkrB8hfn/rNxbVqu3Eil+DKyCw9cAuTI8MFCc5iJ/itDiqF17ZmeXod9wQ
 p4Q1AFP9rKx3jruTWmPhjbv6VEmYX4/r/X0etzVgdo/O1rYORsJXmrgAyKVFjuI8oeUJ
 jfNDN2HrcM1YBPngAi6I91P+1tVSKVPR8vohp0zUWkcvv4QwPDrExS3ePDBpMINfE50T
 DUjw==
X-Gm-Message-State: AOJu0Yy8+oDOv898GnbXpK6g+CUTcOnAClAtOt3QMgs71FrChXCqIyJO
 nhCcstsMIbjG3owMCyg+djWkqrhy8IbRklGSCMo=
X-Google-Smtp-Source: AGHT+IFgJlNfm8PCfpQCGJdEm+X4U/SgJRA3muP/UvPL45gYJQmkrVSJYHr6+2tOeiemXYHJGS2yFA==
X-Received: by 2002:a92:90f:0:b0:35d:57de:1e42 with SMTP id
 y15-20020a92090f000000b0035d57de1e42mr2809695ilg.6.1701577150308; 
 Sat, 02 Dec 2023 20:19:10 -0800 (PST)
Received: from localhost.localdomain (75-174-247-100.bsmr.qwest.net.
 [75.174.247.100]) by smtp.gmail.com with ESMTPSA id
 j15-20020a170902da8f00b001cfc6388b5dsm5874084plx.260.2023.12.02.20.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 20:19:09 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  2 Dec 2023 21:18:37 -0700
Message-ID: <20231203041841.492885-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231203041841.492885-1-adam.duskett@amarulasolutions.com>
References: <20231203041841.492885-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701577150; x=1702181950;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qfgrSDGzrsyUiNB2FAOPETkqXtyaQkgm+yc3yNKAAEY=;
 b=JpqV/6JymGik4D0rwlPdN87TJFg2DidnCDc4xLCcaOBLkzjqfvat0mK8merHKCNxwt
 TXEzxg36WaC3sew4kbi1f9FT4q85m5IFkmghshz4DuuoV00MsBGBQ1/P06nQ+gRvI4Ww
 AVeAyG2zPUd1sjC/PHxFJ56VSZuSahTy/AJ14=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=JpqV/6Jy
Subject: [Buildroot] [PATCH 4/6]
 support/testing/tests/package/test_google_breakpad.py: new runtime test
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Pascal Huerst <pascal.huerst@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a test that does the following:

  - Builds the example code found here:
    https://chromium.googlesource.com/breakpad/breakpad/+/master/docs/linux_starter_guide.md

  - runs the google-breakpad-example program and checks to ensure the exit
    code is 139 (SIGSEGV)

  - Runs the minidump_stackwalk tool against the google-breakpad-example
    symbols and checks for the following:
    - That the google-breakpad-examples symbols loaded properly.
    - That the crash() method in the google-breakpad-example.cpp file is
      printed.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../br2-external/google-breakpad/Config.in    |  1 +
 .../google-breakpad/external.desc             |  1 +
 .../br2-external/google-breakpad/external.mk  |  1 +
 .../package/google-breakpad-example/Config.in |  7 +++
 .../google-breakpad-example.cpp               | 22 ++++++++
 .../google-breakpad-example.mk                | 24 +++++++++
 .../google-breakpad/post-build.sh             |  5 ++
 .../tests/package/test_google_breakpad.py     | 50 +++++++++++++++++++
 8 files changed, 111 insertions(+)
 create mode 100644 support/testing/tests/package/br2-external/google-breakpad/Config.in
 create mode 100644 support/testing/tests/package/br2-external/google-breakpad/external.desc
 create mode 100644 support/testing/tests/package/br2-external/google-breakpad/external.mk
 create mode 100644 support/testing/tests/package/br2-external/google-breakpad/package/google-breakpad-example/Config.in
 create mode 100644 support/testing/tests/package/br2-external/google-breakpad/package/google-breakpad-example/google-breakpad-example.cpp
 create mode 100644 support/testing/tests/package/br2-external/google-breakpad/package/google-breakpad-example/google-breakpad-example.mk
 create mode 100755 support/testing/tests/package/br2-external/google-breakpad/post-build.sh
 create mode 100644 support/testing/tests/package/test_google_breakpad.py

diff --git a/support/testing/tests/package/br2-external/google-breakpad/Config.in b/support/testing/tests/package/br2-external/google-breakpad/Config.in
new file mode 100644
index 0000000000..34c28ab03f
--- /dev/null
+++ b/support/testing/tests/package/br2-external/google-breakpad/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_GOOGLE_BREAKPAD_PATH/package/google-breakpad-example/Config.in"
diff --git a/support/testing/tests/package/br2-external/google-breakpad/external.desc b/support/testing/tests/package/br2-external/google-breakpad/external.desc
new file mode 100644
index 0000000000..2bab54cfc1
--- /dev/null
+++ b/support/testing/tests/package/br2-external/google-breakpad/external.desc
@@ -0,0 +1 @@
+name: GOOGLE_BREAKPAD
diff --git a/support/testing/tests/package/br2-external/google-breakpad/external.mk b/support/testing/tests/package/br2-external/google-breakpad/external.mk
new file mode 100644
index 0000000000..44f7ccfc82
--- /dev/null
+++ b/support/testing/tests/package/br2-external/google-breakpad/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_GOOGLE_BREAKPAD_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/package/br2-external/google-breakpad/package/google-breakpad-example/Config.in b/support/testing/tests/package/br2-external/google-breakpad/package/google-breakpad-example/Config.in
new file mode 100644
index 0000000000..bab1d0d02c
--- /dev/null
+++ b/support/testing/tests/package/br2-external/google-breakpad/package/google-breakpad-example/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_GOOGLE_BREAKPAD_EXAMPLE
+	bool "google breakpad example"
+	depends on BR2_PACKAGE_GOOGLE_BREAKPAD
+	help
+	  Example google-breakpad code
+
+	  https://chromium.googlesource.com/breakpad/breakpad/+/master/docs/linux_starter_guide.md
diff --git a/support/testing/tests/package/br2-external/google-breakpad/package/google-breakpad-example/google-breakpad-example.cpp b/support/testing/tests/package/br2-external/google-breakpad/package/google-breakpad-example/google-breakpad-example.cpp
new file mode 100644
index 0000000000..9349dd2e5b
--- /dev/null
+++ b/support/testing/tests/package/br2-external/google-breakpad/package/google-breakpad-example/google-breakpad-example.cpp
@@ -0,0 +1,22 @@
+/*
+ * This code is from https://chromium.googlesource.com/breakpad/breakpad/+/master/docs/linux_starter_guide.md
+*/
+#include <stdio.h>
+#include <client/linux/handler/exception_handler.h>
+
+static bool dumpCallback(const google_breakpad::MinidumpDescriptor& descriptor, void* context, bool succeeded) {
+  printf("Dump path: %s\n", descriptor.path());
+  return succeeded;
+}
+
+void crash() { 
+  volatile int *a = (int*)(NULL);
+  *a = 1; 
+}
+
+int main(int argc, char* argv[]) {
+  google_breakpad::MinidumpDescriptor descriptor("/tmp");
+  google_breakpad::ExceptionHandler eh(descriptor, NULL, dumpCallback, NULL, true, -1);
+  crash();
+  return 0;
+}
diff --git a/support/testing/tests/package/br2-external/google-breakpad/package/google-breakpad-example/google-breakpad-example.mk b/support/testing/tests/package/br2-external/google-breakpad/package/google-breakpad-example/google-breakpad-example.mk
new file mode 100644
index 0000000000..17ddd68716
--- /dev/null
+++ b/support/testing/tests/package/br2-external/google-breakpad/package/google-breakpad-example/google-breakpad-example.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# google-breakpad-example
+#
+################################################################################
+
+GOOGLE_BREAKPAD_EXAMPLE_DEPENDENCIES = google-breakpad
+
+define GOOGLE_BREAKPAD_EXAMPLE_BUILD_CMDS
+	$(INSTALL) -D $(GOOGLE_BREAKPAD_EXAMPLE_PKGDIR)/google-breakpad-example.cpp \
+		$(@D)/google-breakpad-example.cpp
+
+	$(TARGET_MAKE_ENV) $(TARGET_CXX) $(TARGET_CPPFLAGS) \
+		-I$(STAGING_DIR)/usr/include/breakpad \
+		$(@D)/google-breakpad-example.cpp \
+		$(STAGING_DIR)/usr/lib/libbreakpad_client.a -o $(@D)/google-breakpad-example
+endef
+
+define GOOGLE_BREAKPAD_EXAMPLE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/google-breakpad-example \
+		$(TARGET_DIR)/usr/bin/google-breakpad-example
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/br2-external/google-breakpad/post-build.sh b/support/testing/tests/package/br2-external/google-breakpad/post-build.sh
new file mode 100755
index 0000000000..6778aae339
--- /dev/null
+++ b/support/testing/tests/package/br2-external/google-breakpad/post-build.sh
@@ -0,0 +1,5 @@
+#!/usr/bin/env bash
+set -e
+
+# We are going to run the minidump_stackwalk tool in the qemu instance.
+cp -rf "${STAGING_DIR}"/usr/share/google-breakpad-symbols "${TARGET_DIR}"/root/
diff --git a/support/testing/tests/package/test_google_breakpad.py b/support/testing/tests/package/test_google_breakpad.py
new file mode 100644
index 0000000000..646bdf6ee3
--- /dev/null
+++ b/support/testing/tests/package/test_google_breakpad.py
@@ -0,0 +1,50 @@
+import os
+import infra.basetest
+
+
+class GoogelBreakPadBase(infra.basetest.BRTest):
+    br2_external = [infra.filepath("tests/package/br2-external/google-breakpad")]
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_ENABLE_DEBUG=y
+        BR2_ROOTFS_POST_BUILD_SCRIPT="support/testing/tests/package/br2-external/google-breakpad/post-build.sh"
+        BR2_STRIP_EXCLUDE_FILES="google-breakpad-example"
+        BR2_GOOGLE_BREAKPAD_ENABLE=y
+        BR2_GOOGLE_BREAKPAD_INCLUDE_FILES="/usr/bin/google-breakpad-example"
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_PACKAGE_GOOGLE_BREAKPAD=y
+        BR2_PACKAGE_GOOGLE_BREAKPAD_TOOLS=y
+        BR2_PACKAGE_GOOGLE_BREAKPAD_EXAMPLE=y
+        """
+
+    def check_google_breakpad(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+        output, exit_code = self.emulator.run("google-breakpad-example")
+
+        # google-breakpad-example is expected to exit SIGSEGV.
+        self.assertEqual(exit_code, 139)
+        dump_path = output[0].split(' ')[2]
+        output, exit_code = self.emulator.run(f"minidump_stackwalk {dump_path} /root/google-breakpad-symbols/")
+        self.assertEqual(exit_code, 0)
+
+        # Ensure that minidump_stackwalk properly loaded the google-breakpad-example symbols
+        if not any("Loading symbols for module /usr/bin/google-breakpad-example" in line for line in output):
+            self.fail("Failed to load symbols from /usr/bin/google-breakpad-example")
+
+        # Ensure that the crash method is found and printed by minidump_stackwalk
+        if not any("google-breakpad-example!crash()" in line for line in output):
+            self.fail("google-breakpad-example!crash() not in minidump_stackwalk output!")
+
+
+class TestGoogleBreakPadGlibC(GoogelBreakPadBase):
+    config = GoogelBreakPadBase.config + "BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y"
+
+    def test_run(self):
+        self.check_google_breakpad()
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
