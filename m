Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CB9D3C92D
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 20:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 804F5405B6;
	Sat, 19 Oct 2024 20:16:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OHGvHfNEaAPi; Sat, 19 Oct 2024 20:16:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0087B40507
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0087B40507;
	Sat, 19 Oct 2024 20:16:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FA894961
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E49640151
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:16:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IquIwv0TO0-x for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 20:16:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2730540114
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2730540114
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:16:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 139B686086; Sat, 19 Oct 2024 20:16:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 19 Oct 2024 22:10:23 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 57094b432210cd9e543563a87fff7b9074de5897
X-Git-Newrev: 86c4680bebfc9d1266671f59121bd2ec8e58ec6e
X-Patchwork-Hint: ignore
Message-Id: <20241019201637.139B686086@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] support/testing: add new
 test for dtc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=86c4680bebfc9d1266671f59121bd2ec8e58ec6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Add a test that runs the dtc commandline tools. To test devicetree
compilation, we use an example devicetree from the dtc project. The
example source is GPL-2.0+ licensed.

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 9b690341602388b54c596c4510d770f58f4ad227)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_dtc.py          | 39 ++++++++++++++++++
 .../package/test_dtc/rootfs-overlay/test_tree1.dts | 48 ++++++++++++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/support/testing/tests/package/test_dtc.py b/support/testing/tests/package/test_dtc.py
new file mode 100644
index 0000000000..47a1d75916
--- /dev/null
+++ b/support/testing/tests/package/test_dtc.py
@@ -0,0 +1,39 @@
+import os
+
+import infra.basetest
+
+
+class TestDtc(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_DTC=y
+        BR2_PACKAGE_DTC_PROGRAMS=y
+        BR2_ROOTFS_OVERLAY="{}"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_TARGET_ROOTFS_CPIO=y
+        """.format(
+           # overlay to add a bats test suite
+           infra.filepath("tests/package/test_dtc/rootfs-overlay"))
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+
+        self.emulator.login()
+
+        # Test 'dtc'
+        self.assertRunOk("dtc -I dts -O dtb -o /tmp/test_tree1.dtb /test_tree1.dts")
+
+        # Test 'fdtdump'
+        self.assertRunOk("fdtdump /tmp/test_tree1.dtb")
+
+        # Test 'fdtget'
+        out, exit_code = self.emulator.run("fdtget -t s /tmp/test_tree1.dtb / compatible")
+        self.assertEqual(out[0].strip(), "test_tree1")
+
+        # Test 'fdtput'
+        self.assertRunOk("fdtput -t s /tmp/test_tree1.dtb / compatible 'test set compatible'")
+        out, exit_code = self.emulator.run("fdtget -t s /tmp/test_tree1.dtb / compatible")
+        self.assertEqual(out[0].strip(), "test set compatible")
diff --git a/support/testing/tests/package/test_dtc/rootfs-overlay/test_tree1.dts b/support/testing/tests/package/test_dtc/rootfs-overlay/test_tree1.dts
new file mode 100644
index 0000000000..6649e7cc0f
--- /dev/null
+++ b/support/testing/tests/package/test_dtc/rootfs-overlay/test_tree1.dts
@@ -0,0 +1,48 @@
+/* From https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/tests/test_tree1.dts?id=99031e3a4a6e479466ae795790b44727434ca27d */
+
+/dts-v1/;
+
+/memreserve/ 0xdeadbeef00000000 0x100000;
+/memreserve/ 123456789 010000;
+
+/ {
+	compatible = "test_tree1";
+	prop-int = <0xdeadbeef>;
+	prop-int64 = /bits/ 64 <0xdeadbeef01abcdef>;
+	prop-str = "hello world";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	subnode@1 {
+		compatible = "subnode1";
+		reg = <1>;
+		prop-int = [deadbeef];
+
+		subsubnode {
+			compatible = "subsubnode1", "subsubnode";
+			placeholder = "this is a placeholder string", "string2";
+			prop-int = <0xdeadbeef>;
+		};
+
+		ss1 {
+		};
+	};
+
+	subnode@2 {
+		reg = <2>;
+		linux,phandle = <0x2000>;
+		prop-int = <123456789>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ssn0: subsubnode@0 {
+			reg = <0>;
+			phandle = <0x2001>;
+			compatible = "subsubnode2", "subsubnode";
+			prop-int = <0726746425>;
+		};
+
+		ss2 {
+		};
+	};
+};
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
