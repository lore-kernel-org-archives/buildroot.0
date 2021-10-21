Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD41BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:59:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3603E610D0
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3603E610D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A1A9404F6;
	Thu, 21 Oct 2021 20:59:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vNf4XWIOAHeQ; Thu, 21 Oct 2021 20:59:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7503B404BF;
	Thu, 21 Oct 2021 20:59:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E6E91BF318
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F238740491
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:58:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dq_1Pk2onMdR for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 20:58:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 566CB40489
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 20:58:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F3A06883BB; Thu, 21 Oct 2021 20:55:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Oct 2021 22:48:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 41f982f7438728aabb32224fbbc58b54cf0f8abf
X-Git-Newrev: 1e363383b6f80f90e02239a276a48e00fb7054af
X-Patchwork-Hint: ignore
Message-Id: <20211021205547.F3A06883BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_python_pyndiff: new test
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e363383b6f80f90e02239a276a48e00fb7054af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A simple test that runs nmap twice to create the files scanme-1.xml and
scanme2.xml, then runs pyndiff on both files.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../testing/tests/package/test_python_pyndiff.py   | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/support/testing/tests/package/test_python_pyndiff.py b/support/testing/tests/package/test_python_pyndiff.py
new file mode 100644
index 0000000000..86d6c38f8f
--- /dev/null
+++ b/support/testing/tests/package/test_python_pyndiff.py
@@ -0,0 +1,29 @@
+import os
+import infra.basetest
+
+
+class TestPyNdiff(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_NMAP=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYNDIFF=y
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
+        cmd = "nmap -F 127.0.0.1 -oX scanme-1.xml"
+        self.assertRunOk(cmd)
+
+        cmd = "nmap -F 127.0.0.1 -oX scanme-2.xml"
+        self.assertRunOk(cmd)
+
+        cmd = "pyndiff -f1 scanme-1.xml -f2 scanme-2.xml -t txt"
+        self.assertRunOk(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
