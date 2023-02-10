Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0574C05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 23:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ABF061207;
	Fri, 10 Feb 2023 23:14:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ABF061207
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aIwcP7QS95g5; Fri, 10 Feb 2023 23:14:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59BEB611FA;
	Fri, 10 Feb 2023 23:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59BEB611FA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3353F1BF473
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 23:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2DBA82342
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 23:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2DBA82342
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aTzbLbYoMJqG for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 23:14:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E478F82338
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 23:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E478F82338
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC01A852E0; Fri, 10 Feb 2023 23:14:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 00:13:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0de216f95fc28c57cc430f39f011d5f88ead083b
X-Git-Newrev: f25b0b6d1dcc8580f6b880eb57872b5c4064b89f
X-Patchwork-Hint: ignore
Message-Id: <20230210231402.CC01A852E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests: add NodeJS tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=f25b0b6d1dcc8580f6b880eb57872b5c4064b89f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Tested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  3 ++
 .../testing/tests/package/sample_nodejs_basic.js   |  3 ++
 .../testing/tests/package/sample_nodejs_module.js  |  7 +++
 support/testing/tests/package/test_nodejs.py       | 52 ++++++++++++++++++++++
 4 files changed, 65 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0af1323340..ae698f87c5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2944,11 +2944,14 @@ F:	package/weston/
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
