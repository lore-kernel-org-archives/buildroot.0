Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E1BC4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 09:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E8C440504;
	Sun,  5 May 2024 09:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJ3O3pCdim_W; Sun,  5 May 2024 09:16:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4F2C405E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4F2C405E6;
	Sun,  5 May 2024 09:16:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD5171BF4E7
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 09:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7AA160755
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 09:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORUbBAGk2mvO for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 09:16:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05A8A605F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05A8A605F7
 for <buildroot@buildroot.org>; Sun,  5 May 2024 09:16:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E961186563; Sun,  5 May 2024 09:16:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 May 2024 11:08:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3d91b0a83339e19594dbc12b6345fb38b00f9ea
X-Git-Newrev: 5b016de048fb5fd09b68828d07726c098c74862a
X-Patchwork-Hint: ignore
Message-Id: <20240505091608.E961186563@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add bats runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b016de048fb5fd09b68828d07726c098c74862a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tests the bats-core, bats-support, bats-assert, and bats-file packages.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
[yann.morin.1998@free.fr: fix comment of overlay]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/test_bats.py         | 33 ++++++++++++++++++++++
 .../rootfs-overlay/root/test-bats-assert.bats      | 11 ++++++++
 .../rootfs-overlay/root/test-bats-core.bats        | 11 ++++++++
 .../rootfs-overlay/root/test-bats-file.bats        | 10 +++++++
 4 files changed, 65 insertions(+)

diff --git a/support/testing/tests/package/test_bats.py b/support/testing/tests/package/test_bats.py
new file mode 100644
index 0000000000..5136484ebe
--- /dev/null
+++ b/support/testing/tests/package/test_bats.py
@@ -0,0 +1,33 @@
+import os
+
+import infra.basetest
+
+
+class TestBats(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_ENABLE_LOCALE_WHITELIST=""
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_BASH=y
+        BR2_PACKAGE_BATS_CORE=y
+        BR2_PACKAGE_BATS_ASSERT=y
+        BR2_PACKAGE_BATS_FILE=y
+        BR2_ROOTFS_OVERLAY="{}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+           # overlay to add a bats test suite
+           infra.filepath("tests/package/test_bats/rootfs-overlay"))
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        self.assertRunOk("bats --version")
+
+        self.assertRunOk("bats /root/test-bats-core.bats", timeout=5)
+        self.assertRunOk("bats /root/test-bats-assert.bats", timeout=5)
+        self.assertRunOk("bats /root/test-bats-file.bats", timeout=5)
diff --git a/support/testing/tests/package/test_bats/rootfs-overlay/root/test-bats-assert.bats b/support/testing/tests/package/test_bats/rootfs-overlay/root/test-bats-assert.bats
new file mode 100755
index 0000000000..cd0cb48290
--- /dev/null
+++ b/support/testing/tests/package/test_bats/rootfs-overlay/root/test-bats-assert.bats
@@ -0,0 +1,11 @@
+#!/usr/bin/env bats
+
+setup() {
+    bats_load_library bats-support
+    bats_load_library bats-assert
+}
+
+@test "bats-assert assert_output" {
+    run echo "Hello World"
+    assert_output "Hello World"
+}
diff --git a/support/testing/tests/package/test_bats/rootfs-overlay/root/test-bats-core.bats b/support/testing/tests/package/test_bats/rootfs-overlay/root/test-bats-core.bats
new file mode 100755
index 0000000000..54ec941e03
--- /dev/null
+++ b/support/testing/tests/package/test_bats/rootfs-overlay/root/test-bats-core.bats
@@ -0,0 +1,11 @@
+#!/usr/bin/env bats
+
+@test "bats-core true" {
+    true
+}
+
+@test "bats-core run" {
+    run echo "Hello World"
+    [ "$status" -eq 0 ]
+    [ "$output" = "Hello World" ]
+}
diff --git a/support/testing/tests/package/test_bats/rootfs-overlay/root/test-bats-file.bats b/support/testing/tests/package/test_bats/rootfs-overlay/root/test-bats-file.bats
new file mode 100755
index 0000000000..0ac2616b99
--- /dev/null
+++ b/support/testing/tests/package/test_bats/rootfs-overlay/root/test-bats-file.bats
@@ -0,0 +1,10 @@
+#!/usr/bin/env bats
+
+setup() {
+    bats_load_library bats-support
+    bats_load_library bats-file
+}
+
+@test "bats-file assert_exists" {
+    assert_exists /root/test-bats-file.bats
+}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
