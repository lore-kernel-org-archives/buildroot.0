Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FE6C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 22:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23B9D403B8;
	Wed, 27 Jul 2022 22:50:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23B9D403B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vv9jUkJwwHQf; Wed, 27 Jul 2022 22:50:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2235F40195;
	Wed, 27 Jul 2022 22:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2235F40195
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7DFB11BF834
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 22:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64B97827D9
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 22:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64B97827D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8-r_XLhadwbA for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 22:50:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4318C826FF
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 22:50:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4318C826FF
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3EA7F8677A; Wed, 27 Jul 2022 22:36:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 00:48:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3f1c960be9f9a814ba2a7010ad78c7ba9d11839
X-Git-Newrev: 50e398e2d9f7e01ddcddb00929041546d750d32a
X-Patchwork-Hint: ignore
Message-Id: <20220727223652.3EA7F8677A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/run-test: add test for systemd
 using dbus-broker
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

commit: https://git.buildroot.net/buildroot/commit/?id=50e398e2d9f7e01ddcddb00929041546d750d32a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add four new tests for systemd (rw and ro in each case):
  - use dbus-broker instead of the original dbus
  - use the original dbus, with dbus-broker installed

The first two extend the existing IfUpDown test cases by just enabling
dbus-broker; the second ones extend this further, by explicitly enabling
the original dbus.

For one of the tests, we overload the test_run() function to test that
the dbus-broker daemon is indeed running as root. We need not replicate
that check in the other dbus-broker-only test, and it does not make
sense to test that in tests that have the original dbus enabled.

Presence of the original dbus and dbus-broker on the same system is
valid: the original dbus is used as the default system bus daemon. We do
not test switching between the two at runtime, though as this is really
too corner-case specific. We just test to ensure the original dbus
system bus daemon is not impacted by the presence of dbus-broker.

Note: the 'full' test-case enables all systemd options, and some of them
do pull the original dbus package, so we can't use that to test the
integration of dbus-broker; instead, we extend the ifupdown case, which
does not enable the original dbus.

The default external toolchain for cortex-A9 is the old ARM toolchain
which has kernel headers 4.10 Since dbus-broker needs toolchain headers
>= 4.17, it can't be selected with this toolchain. Switch the systemd
tests to the Bootlin toolchains instead. We switch all of them to make
things easier. Note that we will need to take care in the future that
the headers version used in the bootlin toolchain doesn't get bigger
than the kernel that is used. The kernel is currently 5.10, the headers
in the bleeding edge bootlin toolchain are 5.4.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/init/test_systemd.py | 47 ++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index be28209ba0..06c42736ae 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -9,6 +9,7 @@ class InitSystemSystemdBase(InitSystemBase):
         BR2_cortex_a9=y
         BR2_ARM_ENABLE_VFP=y
         BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_INIT_SYSTEMD=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         # BR2_TARGET_ROOTFS_TAR is not set
@@ -76,6 +77,29 @@ class TestInitSystemSystemdRoIfupdown(InitSystemSystemdBase):
         self.check_systemd("squashfs")
 
 
+class TestInitSystemSystemdRoIfupdownDbusbroker(TestInitSystemSystemdRoIfupdown):
+    config = TestInitSystemSystemdRoIfupdown.config + \
+        """
+        BR2_PACKAGE_DBUS_BROKER=y
+        """
+
+    def test_run(self):
+        # Parent class' test_run() method does exactly that, no more:
+        self.check_systemd("squashfs")
+
+        # Check that the dbus-broker daemon is running as non-root
+        cmd = "find /proc/$(pidof dbus-broker) -maxdepth 1 -name exe -user dbus"
+        out, _ = self.emulator.run(cmd)
+        self.assertEqual(len(out), 1)
+
+
+class TestInitSystemSystemdRoIfupdownDbusbrokerDbus(TestInitSystemSystemdRoIfupdownDbusbroker):
+    config = TestInitSystemSystemdRoIfupdownDbusbroker.config + \
+        """
+        BR2_PACKAGE_DBUS=y
+        """
+
+
 class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
@@ -88,6 +112,29 @@ class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
         self.check_systemd("ext2")
 
 
+class TestInitSystemSystemdRwIfupdownDbusbroker(TestInitSystemSystemdRwIfupdown):
+    config = TestInitSystemSystemdRwIfupdown.config + \
+        """
+        BR2_PACKAGE_DBUS_BROKER=y
+        """
+
+    def test_run(self):
+        # Parent class' test_run() method does exactly that, no more:
+        self.check_systemd("ext2")
+
+        # Check that the dbus-broker daemon is running as non-root
+        cmd = "find /proc/$(pidof dbus-broker) -maxdepth 1 -name exe -user dbus"
+        out, _ = self.emulator.run(cmd)
+        self.assertEqual(len(out), 1)
+
+
+class TestInitSystemSystemdRwIfupdownDbusbrokerDbus(TestInitSystemSystemdRwIfupdownDbusbroker):
+    config = TestInitSystemSystemdRwIfupdownDbusbroker.config + \
+        """
+        BR2_PACKAGE_DBUS=y
+        """
+
+
 class TestInitSystemSystemdRoFull(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
