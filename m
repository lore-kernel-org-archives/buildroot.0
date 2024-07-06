Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A8EC2BD09
	for <buildroot@archiver.kernel.org>; Sat,  6 Jul 2024 20:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82A9740A0C;
	Sat,  6 Jul 2024 20:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e60r_xtFASuL; Sat,  6 Jul 2024 20:48:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11F3D409E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11F3D409E4;
	Sat,  6 Jul 2024 20:48:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 105A91BF27C
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 20:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 072B0404F8
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 20:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Cj5Ou1-q2rn for <buildroot@lists.busybox.net>;
 Sat,  6 Jul 2024 20:48:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6CCA402F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6CCA402F4
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 20:48:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB40383C92; Sat,  6 Jul 2024 20:48:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 6 Jul 2024 22:39:15 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 94808d630df4f6f3437a3e3bb3d490ee8375e48f
X-Git-Newrev: db309fb4faec1cffb491f87daf7ec7cece8d512a
X-Patchwork-Hint: ignore
Message-Id: <20240706204839.CB40383C92@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] support/testing: add ntp
 runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=db309fb4faec1cffb491f87daf7ec7cece8d512a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit c986928affc59f5bbefae8c7af963eaf45fdc8c8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_ntp.py          | 86 ++++++++++++++++++++++
 .../package/test_ntp/rootfs-overlay/etc/ntp.conf   | 10 +++
 3 files changed, 98 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 805b8215ec..bb346b3619 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1870,6 +1870,8 @@ F:	support/testing/tests/package/test_netsnmp/
 F:	support/testing/tests/package/test_nftables.py
 F:	support/testing/tests/package/test_nftables/
 F:	support/testing/tests/package/test_ngrep.py
+F:	support/testing/tests/package/test_ntp.py
+F:	support/testing/tests/package/test_ntp/
 F:	support/testing/tests/package/test_numactl.py
 F:	support/testing/tests/package/test_numactl/
 F:	support/testing/tests/package/test_octave.py
diff --git a/support/testing/tests/package/test_ntp.py b/support/testing/tests/package/test_ntp.py
new file mode 100644
index 0000000000..13fff6419b
--- /dev/null
+++ b/support/testing/tests/package/test_ntp.py
@@ -0,0 +1,86 @@
+import os
+import re
+import time
+
+import infra.basetest
+
+
+class TestNtp(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_ntp/rootfs-overlay")
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_NTP=y
+        BR2_PACKAGE_NTP_NTPD=y
+        BR2_PACKAGE_NTP_NTPQ=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def dict_from_ntpq_output(self, output):
+        d = {}
+        for line in output:
+            if ':' not in line:
+                continue
+            fields = re.split(r":", line, maxsplit=2)
+            name = fields[0].strip()
+            value = fields[1].strip()
+            d[name] = value
+        return d
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check our binaries can execute.
+        self.assertRunOk("ntpd --version")
+        self.assertRunOk("ntpq --version")
+
+        # The ntp daemon is expected to be started from init startup
+        # scripts, for the Buildroot package recipe. We wait a bit
+        # here to let the daemon settle. The next test step checks for
+        # the local peer to be the system peer (by checking the
+        # '*'). If querying the peers too soon after startup the peer
+        # will not be marked as such.
+        time.sleep(3 * self.timeout_multiplier)
+
+        # We query the ntp daemon peers. From our test configuration
+        # file, we should have exactly one.
+        out, ret = self.emulator.run("ntpq --peers")
+        self.assertEqual(ret, 0)
+        # ntpq --peers produces two lines of headers. So we check we
+        # have at least 3 lines of output.
+        self.assertGreaterEqual(len(out), 3)
+        # We check we see our undisciplined local clock and it's the
+        # system peer.
+        self.assertTrue(out[2].startswith("*LOCAL(0)"))
+
+        # We query the refid variable. We expect to see our
+        # undisciplined local clock.
+        out, ret = self.emulator.run("ntpq -c 'readvar 0 refid'")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "refid=LOCAL(0)")
+
+        # We query the ntp system info. We check the reference ID is
+        # the same as in the test configuration file.
+        out, ret = self.emulator.run("ntpq -c sysinfo")
+        self.assertEqual(ret, 0)
+        sysinfo = self.dict_from_ntpq_output(out)
+        refid = "reference ID"
+        self.assertIn(refid, sysinfo)
+        self.assertEqual(sysinfo[refid], "127.127.1.0")
+
+        # Finally, we query the ntp system statistics. We check we can
+        # see some uptime. We waited a bit at the beginning of this
+        # test, plus the few queries we previously did should have
+        # accumulated some uptime.
+        out, ret = self.emulator.run("ntpq -c sysstats")
+        self.assertEqual(ret, 0)
+        sysstats = self.dict_from_ntpq_output(out)
+        up = "uptime"
+        self.assertIn(up, sysstats)
+        self.assertGreater(int(sysstats[up]), 0)
diff --git a/support/testing/tests/package/test_ntp/rootfs-overlay/etc/ntp.conf b/support/testing/tests/package/test_ntp/rootfs-overlay/etc/ntp.conf
new file mode 100644
index 0000000000..2ead3deb6a
--- /dev/null
+++ b/support/testing/tests/package/test_ntp/rootfs-overlay/etc/ntp.conf
@@ -0,0 +1,10 @@
+# Set an undisciplined local clock for testing without the need of
+# network connectivity.
+server 127.127.1.0 iburst prefer
+fudge  127.127.1.0 stratum 10
+
+# Keep standard access control setup. The test is doing local queries
+# from 127.0.0.1.
+restrict default nomodify nopeer noquery limited kod
+restrict 127.0.0.1
+restrict [::1]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
