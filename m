Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17578C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 17:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC96D8321B;
	Sun, 25 Sep 2022 17:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC96D8321B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VBv9cXuUoMP5; Sun, 25 Sep 2022 17:20:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5115831A5;
	Sun, 25 Sep 2022 17:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5115831A5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 662A11BF48B
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 17:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40C6241626
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 17:19:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40C6241626
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vkTElDZVqWKw for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 17:19:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C41C04088F
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C41C04088F
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 17:19:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 0458C200008;
 Sun, 25 Sep 2022 17:19:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Sun, 25 Sep 2022 19:19:32 +0200
Message-Id: <20220925171932.1630739-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220925171932.1630739-1-thomas.petazzoni@bootlin.com>
References: <20220925171932.1630739-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664126385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X6Ok0szclO5VksJCVi7bQ6THboChftqoxE3LbAioktg=;
 b=Gb/fPMkbym+HX9g05V7EQI6rcCMmP35JPnPUgv6TROtY0mp2wH3wo1u7soK2Ke7pXFdOO0
 73chk3bwa39s5rphl4McGfEnE/KNxUWeqz8pKWTuGx9Zl0BoFpMcCZf/rL0eqtZJw53kw+
 4y0DIkdsbGD7nuAfT344LOSRKBvAg1nD+Nz8jw0aoMVo6bVPeVRzM24Lt3T+LQKsowSzOW
 fxiOdfA0Gs0/rF6dg4ATevqfurTiGuPpc6gqkBQDXahbnd8RhMEF/NQFDV9BXU89y/MHdi
 0sQybATfnZp1NqGHh7WFJfMazLw47m/MeqqgiPLO67ckoRw4PlhfZ1yXKA0yGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Gb/fPMkb
Subject: [Buildroot] [PATCH 4/4] support/testing/tests: add NodeJS tests
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
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds two new test cases:

 - TestNodeJSBasic which builds a target configuration with just
   NodeJS enabled, and which runs a very simple NodeJS script on the
   target.

 - TestNodeJSModule, which builds a target configuration with NodeJS
   enabled + the installation of one extra module, which means npm on
   the host (from host-nodejs) is used, and which runs a very simple
   NodeJS script on the target that uses this extra module.

Having both tests separately allows to validate that both nodejs-only
and nodejs+host-nodejs configurations behave correctly, at least in
minimal scenarios.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                    |  3 ++
 .../tests/package/sample_nodejs_basic.js      |  3 ++
 .../tests/package/sample_nodejs_module.js     |  7 +++
 support/testing/tests/package/test_nodejs.py  | 52 +++++++++++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 support/testing/tests/package/sample_nodejs_basic.js
 create mode 100644 support/testing/tests/package/sample_nodejs_module.js
 create mode 100644 support/testing/tests/package/test_nodejs.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 51d025173a..564149de0f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2927,11 +2927,14 @@ F:	package/weston/
 F:	support/testing/tests/boot/test_grub.py
 F:	support/testing/tests/boot/test_grub/
 F:	support/testing/tests/boot/test_syslinux.py
+F:	support/testing/tests/package/sample_nodejs_basic.js
+F:	support/testing/tests/package/sample_nodejs_module.js
 F:	support/testing/tests/package/sample_python_augeas.py
 F:	support/testing/tests/package/sample_python_flask.py
 F:	support/testing/tests/package/sample_python_flask_expects_json.py
 F:	support/testing/tests/package/sample_python_git.py
 F:	support/testing/tests/package/sample_python_unittest_xml_reporting.py
+F:	support/testing/tests/package/test_nodejs.py
 F:	support/testing/tests/package/test_python_augeas.py
 F:	support/testing/tests/package/test_python_flask.py
 F:	support/testing/tests/package/test_python_flask_expects_json.py
diff --git a/support/testing/tests/package/sample_nodejs_basic.js b/support/testing/tests/package/sample_nodejs_basic.js
new file mode 100644
index 0000000000..7633173c64
--- /dev/null
+++ b/support/testing/tests/package/sample_nodejs_basic.js
@@ -0,0 +1,3 @@
+var assert = require('assert');
+assert.strictEqual(1, 1);
+console.log("Hello World");
diff --git a/support/testing/tests/package/sample_nodejs_module.js b/support/testing/tests/package/sample_nodejs_module.js
new file mode 100644
index 0000000000..57aee73408
--- /dev/null
+++ b/support/testing/tests/package/sample_nodejs_module.js
@@ -0,0 +1,7 @@
+var assert = require('assert');
+var lodash = require('lodash');
+result = lodash.chunk(['a', 'b', 'c', 'd'], 2);
+expected = [ [ 'a', 'b' ], [ 'c', 'd' ] ];
+assert.deepStrictEqual(result, expected)
+
+
diff --git a/support/testing/tests/package/test_nodejs.py b/support/testing/tests/package/test_nodejs.py
new file mode 100644
index 0000000000..9463c76b72
--- /dev/null
+++ b/support/testing/tests/package/test_nodejs.py
@@ -0,0 +1,52 @@
+import os
+
+import infra.basetest
+
+
+class TestNodeJSBasic(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_PACKAGE_NODEJS=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
+        """.format(infra.filepath("tests/package/copy-sample-script-to-target.sh"),
+                   infra.filepath("tests/package/sample_nodejs_basic.js"))
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+        self.assertRunOk("node sample_nodejs_basic.js")
+
+
+class TestNodeJSModule(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_PACKAGE_NODEJS=y
+        BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="lodash"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
+        """.format(infra.filepath("tests/package/copy-sample-script-to-target.sh"),
+                   infra.filepath("tests/package/sample_nodejs_module.js"))
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+        self.assertRunOk("node sample_nodejs_module.js")
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
