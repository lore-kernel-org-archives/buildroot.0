Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0518EC3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA684848A7;
	Sun, 15 Sep 2024 21:41:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S78NLC73HPe4; Sun, 15 Sep 2024 21:41:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86B4B8489E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86B4B8489E;
	Sun, 15 Sep 2024 21:41:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 177C61BF94D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D505440A1B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nAYK6_mbh5bO for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED80440A3F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED80440A3F
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA01983682; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 16:00:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b2a164b7460c07471080fe565bf5da76b032e59
X-Git-Newrev: 7ec0e1c2b67ecf5554a516a69e70ae47079e8a97
X-Patchwork-Hint: ignore
Message-Id: <20240915213641.EA01983682@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add tests for Go providers
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ec0e1c2b67ecf5554a516a69e70ae47079e8a97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Test the go-bin provider of host-go to build a Go package.

The tests consist of building and installing a Go package in the root
file system of an ARM vexpress QEMU system.
The tests pass if the program runs on the target.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[yann.morin.1998@free.fr: use to flannel, which can be vendored today]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/test_go.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/support/testing/tests/package/test_go.py b/support/testing/tests/package/test_go.py
index a657a435f9..6ca436851b 100644
--- a/support/testing/tests/package/test_go.py
+++ b/support/testing/tests/package/test_go.py
@@ -13,6 +13,20 @@ class TestGoBase(infra.basetest.BRTest):
         self.emulator.login()
 
 
+class TestGoBin(TestGoBase):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_PACKAGE_HOST_GO=y
+        BR2_PACKAGE_HOST_GO_BIN=y
+        BR2_PACKAGE_FLANNEL=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.assertRunOk("/opt/bin/flanneld -h")
+
+
 class TestGoSource(TestGoBase):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
