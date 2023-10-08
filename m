Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5803EE95A82
	for <buildroot@archiver.kernel.org>; Sun,  8 Oct 2023 18:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 026C440864;
	Sun,  8 Oct 2023 18:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 026C440864
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w7mkq0F5yO54; Sun,  8 Oct 2023 18:30:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4712041701;
	Sun,  8 Oct 2023 18:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4712041701
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A97041BF8A8
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 18:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 834A640B5F
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 18:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 834A640B5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vv4JnyNN1amx for <buildroot@lists.busybox.net>;
 Sun,  8 Oct 2023 18:29:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36CED4014B
 for <buildroot@buildroot.org>; Sun,  8 Oct 2023 18:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36CED4014B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 253DD843AA; Sun,  8 Oct 2023 18:29:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 8 Oct 2023 20:15:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10c637ab06d935bbce4c833c4ab9695cdb32b6c8
X-Git-Newrev: 083e65a67c84f83a3403c92c51d89f8c94907c55
X-Patchwork-Hint: ignore
Message-Id: <20231008182952.253DD843AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add systemd tests for
 factory and overlayfs
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

commit: https://git.buildroot.net/buildroot/commit/?id=083e65a67c84f83a3403c92c51d89f8c94907c55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[Arnout:
 - use a simple mount unit for
   TestInitSystemSystemdRoFullOverlayfsVarBacking;
 - change the test of TestInitSystemSystemdRoFullOverlayfsVarBacking to
   check that the exact expected mount was performed;
 - add a test of var backing with fstab instead of mount unit.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../testing/conf/overlayfs-kernel-fragment.config  |   1 +
 .../systemd/system/run-buildroot-mounts-var.mount  |  13 ++
 support/testing/tests/init/test_systemd.py         | 233 ++++++++++++++++++++-
 3 files changed, 238 insertions(+), 9 deletions(-)

diff --git a/support/testing/conf/overlayfs-kernel-fragment.config b/support/testing/conf/overlayfs-kernel-fragment.config
new file mode 100644
index 0000000000..9122238993
--- /dev/null
+++ b/support/testing/conf/overlayfs-kernel-fragment.config
@@ -0,0 +1 @@
+CONFIG_OVERLAY_FS=y
diff --git a/support/testing/tests/init/systemd-overlay-mount-unit/usr/lib/systemd/system/run-buildroot-mounts-var.mount b/support/testing/tests/init/systemd-overlay-mount-unit/usr/lib/systemd/system/run-buildroot-mounts-var.mount
new file mode 100644
index 0000000000..520cd6d9da
--- /dev/null
+++ b/support/testing/tests/init/systemd-overlay-mount-unit/usr/lib/systemd/system/run-buildroot-mounts-var.mount
@@ -0,0 +1,13 @@
+[Unit]
+Description=Variable permanent storage overlay
+ConditionPathIsSymbolicLink=!/var
+DefaultDependencies=no
+After=local-fs-pre.target
+
+[Mount]
+# Rather than creating an actual writable partition, we just create
+# another tmpfs. For tmpfs, the What is not relevant - but we use it in
+# the test to distinguish it from other tmpfses
+What=other-var-backing-store
+Where=/run/buildroot/mounts/var
+Type=tmpfs
diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index ddc32b0838..79061a86d7 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -1,7 +1,15 @@
 import infra.basetest
+import re
 from tests.init.base import InitSystemBase as InitSystemBase
 
 
+# In the following tests, the read-only cases use the default settings,
+# which historically used both a factory to populate a tmpfs on /var,
+# and pre-populated /var at buildtime. Since these are the default
+# settings, and they proved to generate a system that ultimately boots,
+# we still want to keep testing that. See later, below, for the
+# specialised test cases.
+
 class InitSystemSystemdBase(InitSystemBase):
     config = \
         """
@@ -17,7 +25,10 @@ class InitSystemSystemdBase(InitSystemBase):
         """
 
     def check_systemd(self, fs):
-        self.start_emulator(fs)
+        if "BR2_LINUX_KERNEL=y" in self.config:
+            self.start_emulator(fs, "zImage", "vexpress-v2p-ca9")
+        else:
+            self.start_emulator(fs)
         self.check_init("/lib/systemd/systemd")
 
         # Test all units are OK
@@ -40,19 +51,12 @@ class TestInitSystemSystemdRoNetworkd(InitSystemSystemdBase):
         """
         BR2_SYSTEM_DHCP="eth0"
         # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
-        BR2_ROOTFS_OVERLAY="{}"
         BR2_TARGET_ROOTFS_SQUASHFS=y
-        """.format(infra.filepath("tests/init/systemd-factory"))
+        """
 
     def test_run(self):
         self.check_systemd("squashfs")
 
-        # This one must be executed on the target, to check that
-        # the factory feature works as expected
-        out, exit_code = self.emulator.run("cat /var/foo/bar")
-        self.assertEqual(exit_code, 0)
-        self.assertEqual(out[0], "foobar")
-
 
 class TestInitSystemSystemdRwNetworkd(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
@@ -191,3 +195,214 @@ class TestInitSystemSystemdRwFull(InitSystemSystemdBase):
 
     def test_run(self):
         self.check_systemd("ext2")
+
+
+# The following tests are all about read-only rootfs, and exercise either
+# using an un-populated factory for /var, or an overlaysfs ontop of a
+# pre-populated /var. They all specialise the TestInitSystemSystemdRo*
+# test cases above.
+
+
+# Helper class for factory-based tests
+class InitSystemSystemdBaseFactory():
+    config = \
+        """
+        # BR2_INIT_SYSTEMD_POPULATE_TMPFILES is not set
+        BR2_ROOTFS_OVERLAY="{}"
+        """.format(infra.filepath("tests/init/systemd-factory"))
+
+    def test_run(self):
+        super().test_run()
+
+        # This one must be executed on the target, to check that
+        # the factory feature works as expected
+        out, exit_code = self.emulator.run("cat /var/foo/bar")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(out[0], "foobar")
+
+        # /var/foo/bar is from the /var factory
+        _, exit_code = self.emulator.run("test -e /usr/share/factory/var/foo/bar")
+        self.assertEqual(exit_code, 0)
+
+        # We can write in /var/foo/bar
+        _, exit_code = self.emulator.run("echo barfoo >/var/foo/bar")
+        self.assertEqual(exit_code, 0)
+        # ... and it contains the new content
+        out, exit_code = self.emulator.run("cat /var/foo/bar")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(out[0], "barfoo")
+        # ... but the factory is umodified
+        out, exit_code = self.emulator.run("cat /usr/share/factory/var/foo/bar")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(out[0], "foobar")
+
+
+class TestInitSystemSystemdRoNetworkdFactory(
+    InitSystemSystemdBaseFactory,
+    TestInitSystemSystemdRoNetworkd,
+):
+    config = InitSystemSystemdBaseFactory.config + \
+        TestInitSystemSystemdRoNetworkd.config
+
+
+class TestInitSystemSystemdRoIfupdownFactory(
+    InitSystemSystemdBaseFactory,
+    TestInitSystemSystemdRoIfupdown,
+):
+    config = InitSystemSystemdBaseFactory.config + \
+        TestInitSystemSystemdRoIfupdown.config
+
+
+class TestInitSystemSystemdRoIfupdownDbusbrokerFactory(
+    InitSystemSystemdBaseFactory,
+    TestInitSystemSystemdRoIfupdownDbusbroker,
+):
+    config = InitSystemSystemdBaseFactory.config + \
+        TestInitSystemSystemdRoIfupdownDbusbroker.config
+
+
+class TestInitSystemSystemdRoIfupdownDbusbrokerDbusFactory(
+    InitSystemSystemdBaseFactory,
+    TestInitSystemSystemdRoIfupdownDbusbrokerDbus,
+):
+    config = InitSystemSystemdBaseFactory.config + \
+        TestInitSystemSystemdRoIfupdownDbusbrokerDbus.config
+
+
+class TestInitSystemSystemdRoFullFactory(
+    InitSystemSystemdBaseFactory,
+    TestInitSystemSystemdRoFull,
+):
+    config = InitSystemSystemdBaseFactory.config + \
+        TestInitSystemSystemdRoFull.config
+
+
+# Helper class for overlayfs-based tests
+class InitSystemSystemdBaseOverlayfs():
+    config = \
+        """
+        # BR2_INIT_SYSTEMD_VAR_FACTORY is not set
+        BR2_INIT_SYSTEMD_VAR_OVERLAYFS=y
+        BR2_ROOTFS_OVERLAY="{}"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
+        BR2_LINUX_KERNEL_DTS_SUPPORT=y
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        """.format(infra.filepath("tests/init/systemd-factory"),
+                   infra.filepath("conf/overlayfs-kernel-fragment.config"))
+
+    def test_run(self):
+        super().test_run()
+
+        # This one must be executed on the target, to check that
+        # the tmpfiles pre-populate works as expected
+        out, exit_code = self.emulator.run("cat /var/foo/bar")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(out[0], "foobar")
+
+        # /var/foo/bar is from the pre-populated /var, so it should
+        # not be present in the upper of the overlay
+        _, exit_code = self.emulator.run("test -e /run/buildroot/mounts/var/upper/foo/bar")
+        self.assertNotEqual(exit_code, 0)
+
+        # We can write in /var/foo/bar
+        _, exit_code = self.emulator.run("echo barfoo >/var/foo/bar")
+        self.assertEqual(exit_code, 0)
+        # ... and it contains the new content
+        out, exit_code = self.emulator.run("cat /var/foo/bar")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(out[0], "barfoo")
+        # ... and it to appears in the upper
+        _, exit_code = self.emulator.run("test -e /run/buildroot/mounts/var/upper/foo/bar")
+        self.assertEqual(exit_code, 0)
+        # ... with the new content
+        out, exit_code = self.emulator.run("cat /run/buildroot/mounts/var/upper/foo/bar")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(out[0], "barfoo")
+        # ... while the lower still has the oldcontent
+        out, exit_code = self.emulator.run("cat /run/buildroot/mounts/var/lower/foo/bar")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(out[0], "foobar")
+
+
+class TestInitSystemSystemdRoNetworkdOverlayfs(
+    InitSystemSystemdBaseOverlayfs,
+    TestInitSystemSystemdRoNetworkd,
+):
+    config = InitSystemSystemdBaseOverlayfs.config + \
+        TestInitSystemSystemdRoNetworkd.config
+
+
+class TestInitSystemSystemdRoIfupdownOverlayfs(
+    InitSystemSystemdBaseOverlayfs,
+    TestInitSystemSystemdRoIfupdown,
+):
+    config = InitSystemSystemdBaseOverlayfs.config + \
+        TestInitSystemSystemdRoIfupdown.config
+
+
+class TestInitSystemSystemdRoIfupdownDbusbrokerOverlayfs(
+    InitSystemSystemdBaseOverlayfs,
+    TestInitSystemSystemdRoIfupdownDbusbroker,
+):
+    config = InitSystemSystemdBaseOverlayfs.config + \
+        TestInitSystemSystemdRoIfupdownDbusbroker.config
+
+
+class TestInitSystemSystemdRoIfupdownDbusbrokerDbusOverlayfs(
+    InitSystemSystemdBaseOverlayfs,
+    TestInitSystemSystemdRoIfupdownDbusbrokerDbus,
+):
+    config = InitSystemSystemdBaseOverlayfs.config + \
+        TestInitSystemSystemdRoIfupdownDbusbrokerDbus.config
+
+
+class TestInitSystemSystemdRoFullOverlayfs(
+    InitSystemSystemdBaseOverlayfs,
+    TestInitSystemSystemdRoFull,
+):
+    config = InitSystemSystemdBaseOverlayfs.config + \
+        TestInitSystemSystemdRoFull.config
+
+
+class InitSystemSystemdBaseOverlayfsVarBacking(InitSystemBase):
+    @classmethod
+    def gen_config(cls, overlaydir: str) -> str:
+        return re.sub(
+            r'^\s*BR2_ROOTFS_OVERLAY="(.*)"$',
+            'BR2_ROOTFS_OVERLAY="\\1 {}"'.format(infra.filepath(overlaydir)),
+            TestInitSystemSystemdRoFullOverlayfs.config,
+            flags=re.MULTILINE,
+        )
+
+    def check_var_mounted(self):
+        self.assertRunOk("grep '^other-var-backing-store /run/buildroot/mounts/var tmpfs' /proc/mounts")
+
+
+class TestInitSystemSystemdRoFullOverlayfsVarBackingMountUnit(
+    TestInitSystemSystemdRoFullOverlayfs,
+    InitSystemSystemdBaseOverlayfsVarBacking,
+):
+    config = InitSystemSystemdBaseOverlayfsVarBacking.gen_config(
+        'tests/init/systemd-overlay-mount-unit',
+    )
+
+    def test_run(self):
+        super().test_run()
+        self.check_var_mounted()
+
+
+class TestInitSystemSystemdRoFullOverlayfsVarBackingFstab(
+    TestInitSystemSystemdRoFullOverlayfs,
+    InitSystemSystemdBaseOverlayfsVarBacking,
+):
+    config = InitSystemSystemdBaseOverlayfsVarBacking.gen_config(
+        'tests/init/systemd-overlay-fstab',
+    )
+
+    def test_run(self):
+        super().test_run()
+        self.check_var_mounted()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
