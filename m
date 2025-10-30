Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B40FCCF9FE
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 21:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12DBF41678;
	Thu, 30 Oct 2025 21:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id awkHIvTXgjAk; Thu, 30 Oct 2025 21:02:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD68D41620
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD68D41620;
	Thu, 30 Oct 2025 21:02:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C046B2A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADD7B61546
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZAogTOQUNp85 for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 21:02:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C679E61545
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C679E61545
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E26F82A99; Thu, 30 Oct 2025 21:02:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 21:10:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01dc13adfb7486cb05e655d0b58f5490a0d046ea
X-Git-Newrev: 9468f1c099221461abaf5ab152788e692119b8dd
X-Patchwork-Hint: ignore
Message-Id: <20251030210242.9E26F82A99@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/infra/basetest.py: add
 BRHostPkgTest class
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9468f1c099221461abaf5ab152788e692119b8dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Runtime test cases are currently mostly used to test target packages,
and the BRTest class is perfect for that as we can easily feed a
Buildroot configuration, boot it under Qemu and run commands inside
the emulator.

A few tests use the more basic BRConfigTest when they have special
needs that don't match with BRTest.

However, as we are going to add a number of tests to verify the proper
functionality of some host only packages, which have no visible
menuconfig option, it makes sense to add another BRHostPkgTest class
that allows to easily trigger the build of "make host-<foo>
host-<bar>", and then run some commands on the host machine. Such
tests could be done by using BRConfigTest, but that would require a
bit of duplicated boilerplate, which BRHostPkgTest allows to remove.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/infra/basetest.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 9fb9dffc53..13f9b2d398 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -60,6 +60,28 @@ class BRConfigTest(unittest.TestCase):
             self.b.delete()
 
 
+class BRHostPkgTest(BRConfigTest):
+    """Test up to the build stage of a host package. Define hostpkgs in
+    the class to the list of host packages that should be built."""
+    config = \
+        BASIC_TOOLCHAIN_CONFIG + \
+        MINIMAL_CONFIG
+    hostpkgs = None
+
+    def __init__(self, names):
+        super(BRHostPkgTest, self).__init__(names)
+
+    def setUp(self):
+        super(BRHostPkgTest, self).setUp()
+        if not self.b.is_finished():
+            self.show_msg("Building")
+            self.b.build(make_extra_opts=self.hostpkgs)
+            self.show_msg("Building done")
+
+    def tearDown(self):
+        super(BRHostPkgTest, self).tearDown()
+
+
 class BRTest(BRConfigTest):
     """Test up to the build stage and instantiate an emulator."""
     def __init__(self, names):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
