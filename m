Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D76C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A721E4012F;
	Mon,  5 Feb 2024 21:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A721E4012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dCgCR69CrBd2; Mon,  5 Feb 2024 21:42:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3C73403A2;
	Mon,  5 Feb 2024 21:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3C73403A2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 590001BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3348D60ED0
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3348D60ED0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7C5Ou-PlM6HD for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:42:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61BA060ECE
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:42:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61BA060ECE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D3B786E2C; Mon,  5 Feb 2024 21:42:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 22:42:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5647d5c1900bde13cedd36efd09404ea5763c0fb
X-Git-Newrev: cc2ff8a38e72487f3fd6c7a2700ca664f7828545
X-Patchwork-Hint: ignore
Message-Id: <20240205214224.4D3B786E2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add fping runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc2ff8a38e72487f3fd6c7a2700ca664f7828545
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
[Peter: scale delay with timout_multiplier]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_fping.py | 45 +++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f8737621b3..187c8eeca7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1771,6 +1771,7 @@ F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_dos2unix.py
 F:	support/testing/tests/package/test_fluidsynth.py
 F:	support/testing/tests/package/test_fluidsynth/
+F:	support/testing/tests/package/test_fping.py
 F:	support/testing/tests/package/test_gawk.py
 F:	support/testing/tests/package/test_glslsandbox_player.py
 F:	support/testing/tests/package/test_glslsandbox_player/
diff --git a/support/testing/tests/package/test_fping.py b/support/testing/tests/package/test_fping.py
new file mode 100644
index 0000000000..507c4ce73b
--- /dev/null
+++ b/support/testing/tests/package/test_fping.py
@@ -0,0 +1,45 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestFping(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_FPING=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check the program can execute.
+        self.assertRunOk("fping --version")
+
+        # Fping v5.1 need to wait few seconds after a kernel booted
+        # before starting. This sleep time can be removed when the
+        # issue will be closed and the package updated. See:
+        # https://github.com/schweikert/fping/issues/288
+        time.sleep(5 * self.timeout_multiplier)
+
+        # Run 3 pings on localhost.
+        self.assertRunOk("fping -e -c 3 localhost")
+
+        # Run pings on a local subnet and print statistics.
+        self.assertRunOk("fping -s -g 127.0.0.0/28")
+
+        # Test an IPv6 ping.
+        self.assertRunOk("fping -6 ::1")
+
+        # Create a prohibited route to make fping fail.
+        self.assertRunOk("ip route add to prohibit 192.168.12.0/24")
+
+        # We expect fping to fail when pinging the prohibited network.
+        _, ret = self.emulator.run("fping 192.168.12.34")
+        self.assertNotEqual(ret, 0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
