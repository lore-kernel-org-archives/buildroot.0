Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932A5C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:31:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E703600EF
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E703600EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E5A284208;
	Wed,  4 Aug 2021 00:31:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jHrOkytO9YdC; Wed,  4 Aug 2021 00:31:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E49A842C5;
	Wed,  4 Aug 2021 00:31:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 597C21BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A86A341508
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8n_u9XGpnBBV for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDC4140F40
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3177C83FBA; Tue,  3 Aug 2021 21:10:16 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 23:29:21 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 82712c5862badbc905346afb6ad08c4d4ff47dfb
X-Git-Newrev: db1ded10846f25ee93d2010394c3ba0fecad6719
X-Patchwork-Hint: ignore
Message-Id: <20210803211016.3177C83FBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: add polkit
 tests
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=db1ded10846f25ee93d2010394c3ba0fecad6719
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This test script tests polkit with and without systemd.

The Systemd test does the following:
  - The brtest user attempts to restart the systemd-timesyncd service and is
    denied.

  - A systemd-timesyncd-restart.rules file provided by polkit-rules-test
    is copied from /root/ to /etc/polkit-1/rules.d

  - The brtest user attempts to restart the systemd-timesyncd service and should
    now succeed.

The initd test does the following:
- The brtest user attempts to run the test application "hello-polkit" with the
  command "pkexec hello-polkit" and is denied.

- A hello-polkit.rules file provided by polkit-rules-test is copied from /root/
  to /etc/polkit-1/rules.d

- The brtest user attempts to re-run the test hello-polkit binary with
  "pkexec hello-polkit" and succeeds.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../tests/package/br2-external/polkit/Config.in    |  1 +
 .../package/br2-external/polkit/external.desc      |  1 +
 .../tests/package/br2-external/polkit/external.mk  |  1 +
 .../polkit/package/polkit-rules-test/Config.in     |  6 ++
 .../package/polkit-rules-test/initd/hello-polkit.c |  6 ++
 .../polkit-rules-test/initd/hello-polkit.policy    | 14 +++++
 .../polkit-rules-test/initd/hello-polkit.rules     |  6 ++
 .../package/polkit-rules-test/polkit-rules-test.mk | 38 ++++++++++++
 .../systemd/systemd-timesyncd-restart.rules        |  7 +++
 support/testing/tests/package/test_polkit.py       | 70 ++++++++++++++++++++++
 10 files changed, 150 insertions(+)

diff --git a/support/testing/tests/package/br2-external/polkit/Config.in b/support/testing/tests/package/br2-external/polkit/Config.in
new file mode 100644
index 0000000000..2d11756193
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_POLKIT_PATH/package/polkit-rules-test/Config.in"
diff --git a/support/testing/tests/package/br2-external/polkit/external.desc b/support/testing/tests/package/br2-external/polkit/external.desc
new file mode 100644
index 0000000000..ecef48692b
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/external.desc
@@ -0,0 +1 @@
+name: POLKIT
diff --git a/support/testing/tests/package/br2-external/polkit/external.mk b/support/testing/tests/package/br2-external/polkit/external.mk
new file mode 100644
index 0000000000..64e369cce4
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_POLKIT_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/Config.in b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/Config.in
new file mode 100644
index 0000000000..0fe125ec8f
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_POLKIT_RULES_TEST
+	bool "polkit rules test"
+	depends on BR2_PACKAGE_POLKIT
+	help
+	  Simple test to ensure polkit is loading and enforcing rules
+	  correctly.
diff --git a/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.c b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.c
new file mode 100644
index 0000000000..cf5343cd75
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.c
@@ -0,0 +1,6 @@
+#include <stdio.h>
+
+int main(void){
+    printf("Hello polkit!\n");
+    return 0;
+}
diff --git a/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.policy b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.policy
new file mode 100644
index 0000000000..8220293175
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.policy
@@ -0,0 +1,14 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<!DOCTYPE policyconfig PUBLIC
+ "-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN"
+ "http://www.freedesktop.org/software/polkit/policyconfig-1.dtd">
+<policyconfig>
+  <action id="org.freedesktop.policykit.pkexec.hello-polkit">
+    <message>Authentication is required to run the hello world test program</message>
+    <defaults>
+      <allow_inactive>no</allow_inactive>
+      <allow_active>no</allow_active>
+    </defaults>
+    <annotate key="org.freedesktop.policykit.exec.path">/usr/bin/hello-polkit</annotate>
+  </action>
+</policyconfig>
diff --git a/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.rules b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.rules
new file mode 100644
index 0000000000..a0a66f644d
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.rules
@@ -0,0 +1,6 @@
+polkit.addRule(function(action, subject) {
+   if (action.id == "org.freedesktop.policykit.pkexec.hello-polkit" &&
+       subject.user == "brtest") {
+       return polkit.Result.YES;
+   }
+});
diff --git a/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/polkit-rules-test.mk b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/polkit-rules-test.mk
new file mode 100644
index 0000000000..4ec3805ee3
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/polkit-rules-test.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# polkit-rules-test
+#
+################################################################################
+
+POLKIT_RULES_TEST_DEPENDENCIES = polkit
+
+define POLKIT_RULES_TEST_USERS
+	brtest  -1  brtest  -1   =password  /home/brtest /bin/sh brtest
+endef
+
+define POLKIT_RULES_TEST_BUILD_CMDS
+	$(INSTALL) -D $(POLKIT_RULES_TEST_PKGDIR)/initd/hello-polkit.c $(@D)/hello-polkit.c
+	$(TARGET_CC) $(@D)/hello-polkit.c -o $(@D)/hello-polkit
+endef
+
+# Install the rules file to /root. Test_polkit.py first tests that restarting
+# timesyncd as a user fails, then moves the rules file and confirmes restarting
+# timesyncd as a user succeeds.
+define POLKIT_RULES_TEST_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/polkit-1/rules.d
+	$(INSTALL) -D $(POLKIT_RULES_TEST_PKGDIR)/systemd/systemd-timesyncd-restart.rules \
+		$(TARGET_DIR)/root/systemd-timesyncd-restart.rules
+endef
+
+define POLKIT_RULES_TEST_INSTALL_INIT_SYSV
+	mkdir -p $(TARGET_DIR)/usr/share/polkit-1/actions/
+	$(INSTALL) -D $(@D)/hello-polkit $(TARGET_DIR)/usr/bin/hello-polkit
+
+	$(INSTALL) -D $(POLKIT_RULES_TEST_PKGDIR)/initd/hello-polkit.policy \
+		$(TARGET_DIR)/usr/share/polkit-1/actions/hello-polkit.policy
+
+	$(INSTALL) -D $(POLKIT_RULES_TEST_PKGDIR)/initd/hello-polkit.rules \
+		$(TARGET_DIR)/root/hello-polkit.rules
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/systemd/systemd-timesyncd-restart.rules b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/systemd/systemd-timesyncd-restart.rules
new file mode 100644
index 0000000000..9461195091
--- /dev/null
+++ b/support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/systemd/systemd-timesyncd-restart.rules
@@ -0,0 +1,7 @@
+polkit.addRule(function(action, subject) {
+    if (action.id == "org.freedesktop.systemd1.manage-units" &&
+        action.lookup("unit") == "systemd-timesyncd.service" &&
+        subject.user == "brtest") {
+        return polkit.Result.YES;
+    }
+});
diff --git a/support/testing/tests/package/test_polkit.py b/support/testing/tests/package/test_polkit.py
new file mode 100644
index 0000000000..502d38d13e
--- /dev/null
+++ b/support/testing/tests/package/test_polkit.py
@@ -0,0 +1,70 @@
+import os
+import infra.basetest
+
+
+class TestPolkitInfra(infra.basetest.BRTest):
+    br2_external = [infra.filepath("tests/package/br2-external/polkit")]
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_PACKAGE_POLKIT=y
+        BR2_PACKAGE_POLKIT_RULES_TEST=y
+        """
+
+    def base_test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7", kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+
+class TestPolkitSystemd(TestPolkitInfra):
+    config = \
+        """
+        {}
+        BR2_INIT_SYSTEMD=y
+        BR2_PACKAGE_SYSTEMD_POLKIT=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(TestPolkitInfra.config)
+
+    def test_run(self):
+        TestPolkitInfra.base_test_run(self)
+
+        cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
+        _, exit_code = self.emulator.run(cmd, 10)
+        self.assertEqual(exit_code, 1)
+
+        cmd = "mv /root/systemd-timesyncd-restart.rules /etc/polkit-1/rules.d"
+        _, exit_code = self.emulator.run(cmd, 10)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
+        _, exit_code = self.emulator.run(cmd, 10)
+        self.assertEqual(exit_code, 0)
+
+
+class TestPolkitInitd(TestPolkitInfra):
+    config = TestPolkitInfra.config
+
+    def test_run(self):
+        TestPolkitInfra.base_test_run(self)
+
+        cmd = "su brtest -c 'pkexec hello-polkit'"
+        output, exit_code = self.emulator.run(cmd, 10)
+        self.assertEqual(exit_code, 127)
+        self.assertEqual(output[0], "Error executing command as another user: Not authorized")
+
+        cmd = "mv /root/hello-polkit.rules /etc/polkit-1/rules.d/hello-polkit.rules"
+        _, exit_code = self.emulator.run(cmd, 10)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "su brtest -c 'pkexec hello-polkit'"
+        output, exit_code = self.emulator.run(cmd, 10)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "Hello polkit!")
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
