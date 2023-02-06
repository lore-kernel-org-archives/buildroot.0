Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5931C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 21:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E84A60C2A;
	Mon,  6 Feb 2023 21:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E84A60C2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3G6aAoInjkqE; Mon,  6 Feb 2023 21:47:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88A4660C25;
	Mon,  6 Feb 2023 21:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88A4660C25
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0E171BF2A4
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B84BD40386
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B84BD40386
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yxcAM_O-N69x for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 21:46:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76D7940352
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 21:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76D7940352
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6272D83DAD; Mon,  6 Feb 2023 21:46:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 22:46:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb6e466c102306cfcb1b459d91aa5440f6b8a621
X-Git-Newrev: 557c68fbd29551f4db6215ab03abfaaa54c6f78f
X-Patchwork-Hint: ignore
Message-Id: <20230206214646.6272D83DAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/tests/cpio: extend runtime tests
 for extra dract modules
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=557c68fbd29551f4db6215ab03abfaaa54c6f78f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a basic module that installs a single file, to check that it is
properly accounted for.

Reported-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/fs/test_cpio.py                         |  5 ++++-
 .../tests/fs/test_cpio/modules/99cramfs/module-setup.sh       | 11 +++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_cpio.py b/support/testing/tests/fs/test_cpio.py
index 8c0d357994..172af579bb 100644
--- a/support/testing/tests/fs/test_cpio.py
+++ b/support/testing/tests/fs/test_cpio.py
@@ -41,9 +41,11 @@ class TestCpioDracutBase(infra.basetest.BRTest):
         BR2_PACKAGE_PV=y
         BR2_TARGET_ROOTFS_CPIO=y
         BR2_TARGET_ROOTFS_CPIO_DRACUT=y
+        BR2_TARGET_ROOTFS_CPIO_DRACUT_MODULES="{}"
         BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES="{}"
         # BR2_TARGET_ROOTFS_TAR is not set
-        """.format(" ".join(["fs/cpio/dracut.conf",
+        """.format("support/testing/tests/fs/test_cpio/modules",
+                   " ".join(["fs/cpio/dracut.conf",
                              "support/testing/tests/fs/test_cpio/dracut-cramfs.conf"]))
 
     def check_dracut(self):
@@ -57,6 +59,7 @@ class TestCpioDracutBase(infra.basetest.BRTest):
         self.assertEqual(out.find("bin/pv"), -1)
         # libz should be, because of cramfs
         self.assertNotEqual(out.find("usr/bin/mkcramfs"), -1)
+        self.assertNotEqual(out.find("usr/bin/cramfsck"), -1)
         self.assertNotEqual(out.find("usr/lib/libz.so"), -1)
 
         exit_code = boot_img(self.emulator,
diff --git a/support/testing/tests/fs/test_cpio/modules/99cramfs/module-setup.sh b/support/testing/tests/fs/test_cpio/modules/99cramfs/module-setup.sh
new file mode 100755
index 0000000000..60706c8bd9
--- /dev/null
+++ b/support/testing/tests/fs/test_cpio/modules/99cramfs/module-setup.sh
@@ -0,0 +1,11 @@
+check() {
+    return 0
+}
+
+depends() {
+    return 0
+}
+
+install() {
+    inst_multiple /usr/bin/cramfsck
+}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
