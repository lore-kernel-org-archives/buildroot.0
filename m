Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15D2C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:42:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A68B260F39
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A68B260F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8662D60806;
	Tue, 17 Aug 2021 08:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmGNDfozNDJD; Tue, 17 Aug 2021 08:42:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6005060B62;
	Tue, 17 Aug 2021 08:42:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39E881BF2AE
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2969880F05
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:40:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ppTLIU5fIZcZ for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 08:40:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5930380C2B
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 08:40:26 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPA id F29081BF207;
 Tue, 17 Aug 2021 08:40:23 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 10:39:29 +0200
Message-Id: <20210817083930.3718711-16-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210817083930.3718711-1-herve.codina@bootlin.com>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 15/16] support/testing/tests: add test for
 file overwrite detection
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 Naumann Andreas <ANaumann@ultratronik.de>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
New patch in this v2 series

This patch is retrieved from Thomas's work.
The first version was discussed
https://patchwork.ozlabs.org/project/buildroot/patch/20200430095249.782597-12-thomas.petazzoni@bootlin.com/

Compared to the first version, as proposed by Yann in the previous
review, this patch does not launch a subprocess (grep) to find the
string.
Additionally, the strings searched were changed from a specific
file ('path/file: FAILED') to the "ERROR: package ..." overwrite
detection message.

Note also that the .gitlab-ci.yml modification present in the previous
version is not present in this patch.

Changes v2 to v3:
None

 .../br2-external/detect-overwrite/Config.in   |  1 +
 .../detect-overwrite/external.desc            |  1 +
 .../br2-external/detect-overwrite/external.mk |  1 +
 .../package/detect-overwrite/Config.in        |  5 ++
 .../detect-overwrite/detect-overwrite.mk      | 19 ++++++++
 .../testing/tests/core/test_file_overwrite.py | 48 +++++++++++++++++++
 6 files changed, 75 insertions(+)
 create mode 100644 support/testing/tests/core/br2-external/detect-overwrite/Config.in
 create mode 100644 support/testing/tests/core/br2-external/detect-overwrite/external.desc
 create mode 100644 support/testing/tests/core/br2-external/detect-overwrite/external.mk
 create mode 100644 support/testing/tests/core/br2-external/detect-overwrite/package/detect-overwrite/Config.in
 create mode 100644 support/testing/tests/core/br2-external/detect-overwrite/package/detect-overwrite/detect-overwrite.mk
 create mode 100644 support/testing/tests/core/test_file_overwrite.py

diff --git a/support/testing/tests/core/br2-external/detect-overwrite/Config.in b/support/testing/tests/core/br2-external/detect-overwrite/Config.in
new file mode 100644
index 0000000000..b5514510bd
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-overwrite/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_DETECT_OVERWRITE_PATH/package/detect-overwrite/Config.in"
diff --git a/support/testing/tests/core/br2-external/detect-overwrite/external.desc b/support/testing/tests/core/br2-external/detect-overwrite/external.desc
new file mode 100644
index 0000000000..6fedc276e8
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-overwrite/external.desc
@@ -0,0 +1 @@
+name: DETECT_OVERWRITE
diff --git a/support/testing/tests/core/br2-external/detect-overwrite/external.mk b/support/testing/tests/core/br2-external/detect-overwrite/external.mk
new file mode 100644
index 0000000000..90927b33ef
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-overwrite/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_DETECT_OVERWRITE_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/core/br2-external/detect-overwrite/package/detect-overwrite/Config.in b/support/testing/tests/core/br2-external/detect-overwrite/package/detect-overwrite/Config.in
new file mode 100644
index 0000000000..fff8b0320f
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-overwrite/package/detect-overwrite/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_DETECT_OVERWRITE
+	bool "detect-overwrite"
+
+config BR2_PACKAGE_HOST_DETECT_OVERWRITE
+	bool "host-detect-overwrite"
diff --git a/support/testing/tests/core/br2-external/detect-overwrite/package/detect-overwrite/detect-overwrite.mk b/support/testing/tests/core/br2-external/detect-overwrite/package/detect-overwrite/detect-overwrite.mk
new file mode 100644
index 0000000000..c6df2a339d
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-overwrite/package/detect-overwrite/detect-overwrite.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# detect-overwrite
+#
+################################################################################
+
+define DETECT_OVERWRITE_INSTALL_TARGET_CMDS
+	grep -q "^foo" $(TARGET_DIR)/etc/passwd || \
+		echo "foo" >> $(TARGET_DIR)/etc/passwd
+endef
+
+HOST_DETECT_OVERWRITE_DEPENDENCIES = host-pkgconf
+
+define HOST_DETECT_OVERWRITE_INSTALL_CMDS
+	$(SED) 's/manipulating/tweaking/' $(HOST_DIR)/lib/pkgconfig/libpkgconf.pc
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
diff --git a/support/testing/tests/core/test_file_overwrite.py b/support/testing/tests/core/test_file_overwrite.py
new file mode 100644
index 0000000000..96553cb483
--- /dev/null
+++ b/support/testing/tests/core/test_file_overwrite.py
@@ -0,0 +1,48 @@
+import infra
+import infra.basetest
+import subprocess
+
+
+class DetectTargetFileOverwriteTest(infra.basetest.BRConfigTest):
+    config = \
+        infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        infra.basetest.MINIMAL_CONFIG + \
+        """
+        BR2_PER_PACKAGE_DIRECTORIES=y
+        BR2_PACKAGE_DETECT_OVERWRITE=y
+        """
+    br2_external = [infra.filepath("tests/core/br2-external/detect-overwrite")]
+
+    def test_run(self):
+        with self.assertRaises(SystemError):
+            self.b.build()
+        logf_path = infra.log_file_path(self.b.builddir, "build",
+                                        infra.basetest.BRConfigTest.logtofile)
+        if logf_path:
+            s = 'ERROR: package detect-overwrite has overwritten files installed by a previous package, aborting.'
+            with open(logf_path, "r") as f:
+                lines = [l for l in f.readlines() if l.startswith(s)]
+            self.assertNotEqual(len(lines), 0)
+
+
+class DetectHostFileOverwriteTest(infra.basetest.BRConfigTest):
+    config = \
+        infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        infra.basetest.MINIMAL_CONFIG + \
+        """
+        BR2_PER_PACKAGE_DIRECTORIES=y
+        BR2_PACKAGE_HOST_DETECT_OVERWRITE=y
+        """
+    br2_external = [infra.filepath("tests/core/br2-external/detect-overwrite")]
+
+    def test_run(self):
+        with self.assertRaises(SystemError):
+            self.b.build()
+        logf_path = infra.log_file_path(self.b.builddir, "build",
+                                        infra.basetest.BRConfigTest.logtofile)
+        if logf_path:
+            s = './lib/pkgconfig/hco_libpkgconf.pc: FAILED'
+            s = 'ERROR: package host-detect-overwrite has overwritten files installed by a previous package, aborting.'
+            with open(logf_path, "r") as f:
+                lines = [l for l in f.readlines() if l.startswith(s)]
+            self.assertNotEqual(len(lines), 0)
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
