Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C57E81E09
	for <buildroot@archiver.kernel.org>; Fri,  6 Oct 2023 15:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 490E683C35;
	Fri,  6 Oct 2023 15:32:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 490E683C35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bork0Ea1KkgC; Fri,  6 Oct 2023 15:32:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EA6983C2C;
	Fri,  6 Oct 2023 15:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EA6983C2C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EDBFD1BF997
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 15:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C81846FA6A
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 15:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C81846FA6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i6k78DE_oqwJ for <buildroot@lists.busybox.net>;
 Fri,  6 Oct 2023 15:32:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C80FC6FA67
 for <buildroot@buildroot.org>; Fri,  6 Oct 2023 15:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C80FC6FA67
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B7D4D84300; Fri,  6 Oct 2023 15:32:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Oct 2023 17:31:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0fd6954fcb2b922ff95779420a36e99229e75f92
X-Git-Newrev: 3a1b68955cf06d7aaa32f02f324931ed30141068
X-Patchwork-Hint: ignore
Message-Id: <20231006153223.B7D4D84300@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests/package/test_nodejs:
 test both host-nodejs-bin and host-nodejs-src
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3a1b68955cf06d7aaa32f02f324931ed30141068
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The TestNodeJSModule test triggers the build of host-nodejs to be able
to install third party modules. Now that host-nodejs has two
providers, it makes sense to test both cases, so we duplicate
TestNodeJSModule into TestNodeJsModuleHostBin (which tests the
host-nodejs-bin) and TestNodeJSModuleHostSrc (which tests the
host-nodejs-src).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/testing/tests/package/test_nodejs.py | 29 +++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_nodejs.py b/support/testing/tests/package/test_nodejs.py
index 9463c76b72..b63d44c97e 100644
--- a/support/testing/tests/package/test_nodejs.py
+++ b/support/testing/tests/package/test_nodejs.py
@@ -27,7 +27,7 @@ class TestNodeJSBasic(infra.basetest.BRTest):
         self.assertRunOk("node sample_nodejs_basic.js")
 
 
-class TestNodeJSModule(infra.basetest.BRTest):
+class TestNodeJSModuleHostBin(infra.basetest.BRTest):
     config = \
         """
         BR2_arm=y
@@ -36,6 +36,33 @@ class TestNodeJSModule(infra.basetest.BRTest):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_PACKAGE_NODEJS=y
         BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="lodash"
+        BR2_PACKAGE_HOST_NODEJS_BIN=y
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
+
+
+class TestNodeJSModuleHostSrc(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_PACKAGE_NODEJS=y
+        BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="lodash"
+        BR2_PACKAGE_HOST_NODEJS_SRC=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
