Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB839C3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A46084A48;
	Sun, 15 Sep 2024 21:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hfJDa65Wmmgh; Sun, 15 Sep 2024 21:43:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BD7684A42
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BD7684A42;
	Sun, 15 Sep 2024 21:43:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 656971BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B719E608D5
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNEgyqlsJCzU for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD38360D89
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD38360D89
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B662383682; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 15:58:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06b1f1fbd36b063ef5c2322817ee78b43dd1c7b3
X-Git-Newrev: 559bb33ae71dd2358ca2314ccb24b56cc3809fc1
X-Patchwork-Hint: ignore
Message-Id: <20240915213641.B662383682@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: do not use s.b.o
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

commit: https://git.buildroot.net/buildroot/commit/?id=559bb33ae71dd2358ca2314ccb24b56cc3809fc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the runtime tests will use the sources.buildroot.org backup
mirror, which is the default setup.

However, in some cases we do not want to use the backup site, because we
want to ensure that the download actually works.

This is the case for vendored packages, like cargo or golang packages,
for whbich we want to check that gthe download still works when we
update the rust or go versions, or when our download helpers change.

So, disable the use of the backup site in all runtime tests, and drop
the no-longer needed special cases.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/infra/basetest.py               | 1 +
 support/testing/tests/download/test_git.py      | 5 +----
 support/testing/tests/download/test_gitforge.py | 5 +----
 support/testing/tests/download/test_ssh.py      | 4 +---
 support/testing/tests/package/test_rust.py      | 1 -
 5 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 12d96415da..1ae6232da8 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -37,6 +37,7 @@ class BRConfigTest(unittest.TestCase):
         super(BRConfigTest, self).__init__(names)
         self.testname = self.__class__.__name__
         self.builddir = self.outputdir and os.path.join(self.outputdir, self.testname)
+        self.config += '\nBR2_BACKUP_SITE=""\n'
         self.config += '\nBR2_DL_DIR="{}"\n'.format(self.downloaddir)
         self.config += "\nBR2_JLEVEL={}\n".format(self.jlevel)
 
diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index ba52e03ef5..3cf98f6456 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -7,10 +7,7 @@ import infra
 
 
 class GitTestBase(infra.basetest.BRConfigTest):
-    config = \
-        """
-        BR2_BACKUP_SITE=""
-        """
+    config = ""
     gitremotedir = infra.filepath("tests/download/git-remote")
     gitremote = None
 
diff --git a/support/testing/tests/download/test_gitforge.py b/support/testing/tests/download/test_gitforge.py
index e1ac35ec67..477c365a34 100644
--- a/support/testing/tests/download/test_gitforge.py
+++ b/support/testing/tests/download/test_gitforge.py
@@ -5,10 +5,7 @@ import infra
 
 
 class GitforgeTestBase(infra.basetest.BRConfigTest):
-    config = \
-        """
-        BR2_BACKUP_SITE=""
-        """
+    config = ""
 
     def setUp(self):
         super(GitforgeTestBase, self).setUp()
diff --git a/support/testing/tests/download/test_ssh.py b/support/testing/tests/download/test_ssh.py
index 126002a355..7d6ac3aaf7 100644
--- a/support/testing/tests/download/test_ssh.py
+++ b/support/testing/tests/download/test_ssh.py
@@ -7,9 +7,7 @@ import infra
 
 
 class SSHTestBase(infra.basetest.BRConfigTest):
-    config = infra.basetest.MINIMAL_CONFIG + '''
-BR2_BACKUP_SITE=""
-'''
+    config = infra.basetest.MINIMAL_CONFIG
     sshd_test_dir = infra.filepath("tests/download/sshd")
     sshd = None
 
diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
index 763125ca20..8160cb6053 100644
--- a/support/testing/tests/package/test_rust.py
+++ b/support/testing/tests/package/test_rust.py
@@ -70,7 +70,6 @@ class TestRustVendoring(infra.basetest.BRConfigTest):
         BR2_PACKAGE_RIPGREP=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
-        BR2_BACKUP_SITE=""
         """
 
     def setUp(self):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
