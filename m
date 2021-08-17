Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D9DC4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:43:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BF5360EFE
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0BF5360EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D581D40521;
	Tue, 17 Aug 2021 08:43:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ajB_lkw7ozW; Tue, 17 Aug 2021 08:43:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD4C34052A;
	Tue, 17 Aug 2021 08:43:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD6131BF2AE
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA28340272
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:40:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LoXcJrBdm3tH for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 08:40:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 947BA404EC
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 08:40:24 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPA id 428601BF203;
 Tue, 17 Aug 2021 08:40:22 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 10:39:28 +0200
Message-Id: <20210817083930.3718711-15-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210817083930.3718711-1-herve.codina@bootlin.com>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 14/16] support/testing/tests: add test for
 check_bin_arch
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

This tests build a bogus package that installs a binary built for the
host architecture into $(TARGET_DIR), which should cause a build
failure, at least as long as the host architecture isn't ARM.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
New patch in this v2 series

This patch is retrieved from Thomas's work.
The first version was discussed
https://patchwork.ozlabs.org/project/buildroot/patch/20200430095249.782597-10-thomas.petazzoni@bootlin.com/

Compared to the first version, as proposed by Yann in the previous
review, this patch does not launch a subprocess (grep) to search the
string.

Note also that the .gitlab-ci.yml modification present in the previous
version is not present in this patch.

Changes v2 to v3:
- Fixed the test (https://lore.kernel.org/buildroot/20210707140708.259208a1@bootlin.com/)

 .../br2-external/detect-bad-arch/Config.in    |  1 +
 .../detect-bad-arch/external.desc             |  1 +
 .../br2-external/detect-bad-arch/external.mk  |  1 +
 .../package/detect-bad-arch/Config.in         |  4 ++++
 .../detect-bad-arch/detect-bad-arch.mk        | 15 +++++++++++++++
 support/testing/tests/core/test_bad_arch.py   | 19 +++++++++++++++++++
 6 files changed, 41 insertions(+)
 create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/Config.in
 create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/external.desc
 create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/external.mk
 create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/Config.in
 create mode 100644 support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/detect-bad-arch.mk
 create mode 100644 support/testing/tests/core/test_bad_arch.py

diff --git a/support/testing/tests/core/br2-external/detect-bad-arch/Config.in b/support/testing/tests/core/br2-external/detect-bad-arch/Config.in
new file mode 100644
index 0000000000..530c077bbe
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-bad-arch/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_DETECT_BAD_ARCH_PATH/package/detect-bad-arch/Config.in"
diff --git a/support/testing/tests/core/br2-external/detect-bad-arch/external.desc b/support/testing/tests/core/br2-external/detect-bad-arch/external.desc
new file mode 100644
index 0000000000..3c4232c90d
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-bad-arch/external.desc
@@ -0,0 +1 @@
+name: DETECT_BAD_ARCH
diff --git a/support/testing/tests/core/br2-external/detect-bad-arch/external.mk b/support/testing/tests/core/br2-external/detect-bad-arch/external.mk
new file mode 100644
index 0000000000..71b9821ddc
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-bad-arch/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_DETECT_BAD_ARCH_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/Config.in b/support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/Config.in
new file mode 100644
index 0000000000..9893e9afc1
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_DETECT_BAD_ARCH
+	bool
+	default y
+
diff --git a/support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/detect-bad-arch.mk b/support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/detect-bad-arch.mk
new file mode 100644
index 0000000000..5e78c55f1f
--- /dev/null
+++ b/support/testing/tests/core/br2-external/detect-bad-arch/package/detect-bad-arch/detect-bad-arch.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# detect-bad-arch
+#
+################################################################################
+
+define DETECT_BAD_ARCH_BUILD_CMDS
+	echo "int main(void) { return 0; }" | $(HOSTCC) -x c -o $(@D)/foo -
+endef
+
+define DETECT_BAD_ARCH_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/foo $(TARGET_DIR)/usr/bin/foo
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/core/test_bad_arch.py b/support/testing/tests/core/test_bad_arch.py
new file mode 100644
index 0000000000..76acba3711
--- /dev/null
+++ b/support/testing/tests/core/test_bad_arch.py
@@ -0,0 +1,19 @@
+import infra
+import infra.basetest
+import subprocess
+
+
+class DetectBadArchTest(infra.basetest.BRConfigTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + infra.basetest.MINIMAL_CONFIG
+    br2_external = [infra.filepath("tests/core/br2-external/detect-bad-arch")]
+
+    def test_run(self):
+        with self.assertRaises(SystemError):
+            self.b.build()
+        logf_path = infra.log_file_path(self.b.builddir, "build",
+                                        infra.basetest.BRConfigTest.logtofile)
+        if logf_path:
+            s = 'ERROR: architecture for "/usr/bin/foo" is'
+            with open(logf_path, "r") as f:
+                lines = [l for l in f.readlines() if l.startswith(s)]
+            self.assertEqual(len(lines), 1)
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
