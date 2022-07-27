Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E380C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A1BC8141F;
	Wed, 27 Jul 2022 15:03:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A1BC8141F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JUHm2_O1iRkB; Wed, 27 Jul 2022 15:03:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ED7F81406;
	Wed, 27 Jul 2022 15:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ED7F81406
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FABD1BF4E4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB799402C6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:03:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB799402C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oXXwsyjEK9gw for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:03:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE4E5402AD
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:03:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE4E5402AD
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8BE87866D5; Wed, 27 Jul 2022 14:49:55 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 17:03:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0defd5391b549ea2d23285927f61510f2b02e60b
X-Git-Newrev: 78727d83e6b8dc0447d3c37af043b56bc7565e20
X-Patchwork-Hint: ignore
Message-Id: <20220727144955.8BE87866D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testsuite: de-duplicate the
 systemd runtime tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=78727d83e6b8dc0447d3c37af043b56bc7565e20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The first three lines of all systemd runtime tests are identical, and
they already call into a common function. Therefore, move those lines
into the common function as well.

We need to pass an additional argument for the rootfs type. This changes
the signature, which could create confustion with
InitSystemBase.check_init() that has a different signature. Therefore,
rename the function to check_systemd(). That also allows us to call
self.check_init() directly instead of going through super().

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/init/test_systemd.py | 32 +++++++++++-------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index f0cc52bac8..80c6776f59 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -21,8 +21,9 @@ class InitSystemSystemdBase(InitSystemBase):
         # BR2_TARGET_ROOTFS_TAR is not set
         """.format(infra.filepath("conf/binfmt-misc-kernel-fragment.config"))
 
-    def check_init(self):
-        super(InitSystemSystemdBase, self).check_init("/lib/systemd/systemd")
+    def check_systemd(self, fs):
+        self.start_emulator(fs, "zImage", "vexpress-v2p-ca9")
+        self.check_init("/lib/systemd/systemd")
 
         # Test all units are OK
         output, _ = self.emulator.run("systemctl --no-pager --failed --no-legend")
@@ -35,6 +36,9 @@ class InitSystemSystemdBase(InitSystemBase):
         output, _ = self.emulator.run("journalctl --no-pager --lines 1 --quiet")
         self.assertEqual(len(output), 1)
 
+        # Check the network is up
+        self.check_network("eth0")
+
 
 class TestInitSystemSystemdRoNetworkd(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
@@ -46,9 +50,7 @@ class TestInitSystemSystemdRoNetworkd(InitSystemSystemdBase):
         """.format(infra.filepath("tests/init/systemd-factory"))
 
     def test_run(self):
-        self.start_emulator("squashfs", "zImage", "vexpress-v2p-ca9")
-        self.check_init()
-        self.check_network("eth0")
+        self.check_systemd("squashfs")
 
         # This one must be executed on the target, to check that
         # the factory feature works as expected
@@ -65,9 +67,7 @@ class TestInitSystemSystemdRwNetworkd(InitSystemSystemdBase):
         """
 
     def test_run(self):
-        self.start_emulator("ext2", "zImage", "vexpress-v2p-ca9")
-        self.check_init()
-        self.check_network("eth0")
+        self.check_systemd("ext2")
 
 
 class TestInitSystemSystemdRoIfupdown(InitSystemSystemdBase):
@@ -80,9 +80,7 @@ class TestInitSystemSystemdRoIfupdown(InitSystemSystemdBase):
         """
 
     def test_run(self):
-        self.start_emulator("squashfs", "zImage", "vexpress-v2p-ca9")
-        self.check_init()
-        self.check_network("eth0")
+        self.check_systemd("squashfs")
 
 
 class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
@@ -94,9 +92,7 @@ class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
         """
 
     def test_run(self):
-        self.start_emulator("ext2", "zImage", "vexpress-v2p-ca9")
-        self.check_init()
-        self.check_network("eth0")
+        self.check_systemd("ext2")
 
 
 class TestInitSystemSystemdRoFull(InitSystemSystemdBase):
@@ -125,9 +121,7 @@ class TestInitSystemSystemdRoFull(InitSystemSystemdBase):
         """
 
     def test_run(self):
-        self.start_emulator("squashfs", "zImage", "vexpress-v2p-ca9")
-        self.check_init()
-        self.check_network("eth0")
+        self.check_systemd("squashfs")
 
 
 class TestInitSystemSystemdRwFull(InitSystemSystemdBase):
@@ -155,6 +149,4 @@ class TestInitSystemSystemdRwFull(InitSystemSystemdBase):
         """
 
     def test_run(self):
-        self.start_emulator("ext2", "zImage", "vexpress-v2p-ca9")
-        self.check_init()
-        self.check_network("eth0")
+        self.check_systemd("ext2")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
