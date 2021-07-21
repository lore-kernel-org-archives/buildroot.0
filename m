Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056EBC6377A
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 21:45:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B291061264
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 21:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B291061264
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B8FE605A2;
	Wed, 21 Jul 2021 21:45:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mk3jEfc2gXSX; Wed, 21 Jul 2021 21:45:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77B3E605D2;
	Wed, 21 Jul 2021 21:45:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CCF181C1187
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 21:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9B6E605D2
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 21:45:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9yPPA6dWg2DN for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 21:45:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EAFB605A2
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 21:45:24 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so2615076pjo.3
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 14:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sndVMwlq5okpwhEjDDR05hsJ4bmO9zOgwddpj4geWPs=;
 b=i8DbBvUIfjWskj986gr6glkeFQU4PF8d28RpTc1dLVum5EQjVYKADR8dpfU1S7EXcr
 VklTAPPbhFyuZl5v6+qDumzBJmDSiZUyJva3wMQ2kKLEKeGq45n9gCMGETGTCduIjF0I
 ZxDgDZoARdNSePtj0m1/OwgMgFwUodP0f5G1tH3sAsSbGsxrQ24ey44DmRijCLJd98I1
 LFPsyb8T4q9MlWi3P2U3ZoKLCWf9O4GPWAvpkLtEZNIlIloR5fioMu1LGRmSHRTBAHma
 zaXOKAMOEK9LXVDurNBNksIO+eSudmFaPb10bC3LLl2mb8FyncTWOWRhZKjdlK+RP9z0
 mVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sndVMwlq5okpwhEjDDR05hsJ4bmO9zOgwddpj4geWPs=;
 b=opdgIHtaYyyveZK9lNwAT+YRqm8f+LM8I3cIJbCbvRbp2vMnUkXJS65DeryKUHr55q
 6/4umRhua/9v8V4HVzigZDjRMFtPVq2ER22wP/PMY4HvvVXe03XJVHfT60JRPIpEEZEg
 ZHGF+k3QKQuUW76w2QwfmeMHgV4GwOwo0DpAyqeuhXgA+ZB567PBfP499VSJY4LDREjR
 /IsH6akuuUFMvb1b9QVry4FSj4cPQXaQCSdTZfT5y35mvW/3XThbnV9PBHCLJSnXFlb+
 8vWDYlZtLjh731JmWK13qUtkmHt5Zz3jB0pRMseiww+qDqHggnKninLYvln7jPHxzMBU
 j2aQ==
X-Gm-Message-State: AOAM533bWE833Wa83Nmig8RjxdCFfFybBmnJNsh5Yu5+DeZIgIQDlcc8
 AfmzQ9Fuc7z4CJOQDlyWqGn9IQYdv94=
X-Google-Smtp-Source: ABdhPJxSumitUxEIaP6athkc6cBIjAcwRxVy4e3CYb5BldlIaUozoWxuRO4tKfLFcL2ZjzNCf8Mn2Q==
X-Received: by 2002:a17:90a:f0d4:: with SMTP id
 fa20mr5902649pjb.22.1626903923917; 
 Wed, 21 Jul 2021 14:45:23 -0700 (PDT)
Received: from adam.duskett ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id t37sm28266330pfg.14.2021.07.21.14.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 14:45:23 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 14:45:17 -0700
Message-Id: <20210721214518.227254-3-aduskett@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721214518.227254-1-aduskett@gmail.com>
References: <20210721214518.227254-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/4] support/testing: add polkit tests
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
Cc: Marek Belisko <marek.belisko@open-nandra.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>, Adam Duskett <aduskett@gmail.com>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

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
---
 .../package/br2-external/polkit/Config.in     |  1 +
 .../package/br2-external/polkit/external.desc |  1 +
 .../package/br2-external/polkit/external.mk   |  1 +
 .../package/polkit-rules-test/Config.in       |  6 ++
 .../polkit-rules-test/initd/hello-polkit.c    |  6 ++
 .../initd/hello-polkit.policy                 | 14 ++++
 .../initd/hello-polkit.rules                  |  6 ++
 .../polkit-rules-test/polkit-rules-test.mk    | 38 ++++++++++
 .../systemd/systemd-timesyncd-restart.rules   |  7 ++
 support/testing/tests/package/test_polkit.py  | 70 +++++++++++++++++++
 10 files changed, 150 insertions(+)
 create mode 100644 support/testing/tests/package/br2-external/polkit/Config.in
 create mode 100644 support/testing/tests/package/br2-external/polkit/external.desc
 create mode 100644 support/testing/tests/package/br2-external/polkit/external.mk
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/Config.in
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.c
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.policy
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/initd/hello-polkit.rules
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/polkit-rules-test.mk
 create mode 100644 support/testing/tests/package/br2-external/polkit/package/polkit-rules-test/systemd/systemd-timesyncd-restart.rules
 create mode 100644 support/testing/tests/package/test_polkit.py

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
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
