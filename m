Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77464CAC583
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4479861C6F;
	Mon,  8 Sep 2025 10:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7JR3JKuFbIz; Mon,  8 Sep 2025 10:39:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49A3661C74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49A3661C74;
	Mon,  8 Sep 2025 10:39:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 498F9186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BEE141F41
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GgYrnFZJYwUq for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:39:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65D7742B94
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65D7742B94
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6429583A90; Mon,  8 Sep 2025 10:39:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Sep 2025 17:20:04 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f54e0595fb3124adaaab77ddff735a7ddab8fbf6
X-Git-Newrev: 3a5940bc46389bf386002108439395cb35ea3f0a
X-Patchwork-Hint: ignore
Message-Id: <20250908103908.6429583A90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing: use
 again the default BR2_BACKUP_SITE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3a5940bc46389bf386002108439395cb35ea3f0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This reverts commit 559bb33ae71dd2358ca2314ccb24b56cc3809fc1, which
was disabling BR2_BACKUP_SITE in our tests with the following
reasoning:

    support/testing: do not use s.b.o

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

However, not using the backup site is causing a LOT of random failures
in Gitlab CI, making the results barely usable. Since it's more
important to get real failures than random ones due to download
issues, let's re-enable BR2_BACKUP_SITE in our testing infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit d26f3717588cfec10ab8572aa5ffa0a8ae471341)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/infra/basetest.py               | 1 -
 support/testing/tests/download/test_git.py      | 5 ++++-
 support/testing/tests/download/test_gitforge.py | 5 ++++-
 support/testing/tests/download/test_ssh.py      | 4 +++-
 support/testing/tests/package/test_rust.py      | 1 +
 5 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 1ae6232da8..12d96415da 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -37,7 +37,6 @@ class BRConfigTest(unittest.TestCase):
         super(BRConfigTest, self).__init__(names)
         self.testname = self.__class__.__name__
         self.builddir = self.outputdir and os.path.join(self.outputdir, self.testname)
-        self.config += '\nBR2_BACKUP_SITE=""\n'
         self.config += '\nBR2_DL_DIR="{}"\n'.format(self.downloaddir)
         self.config += "\nBR2_JLEVEL={}\n".format(self.jlevel)
 
diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index 3cf98f6456..ba52e03ef5 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -7,7 +7,10 @@ import infra
 
 
 class GitTestBase(infra.basetest.BRConfigTest):
-    config = ""
+    config = \
+        """
+        BR2_BACKUP_SITE=""
+        """
     gitremotedir = infra.filepath("tests/download/git-remote")
     gitremote = None
 
diff --git a/support/testing/tests/download/test_gitforge.py b/support/testing/tests/download/test_gitforge.py
index 477c365a34..e1ac35ec67 100644
--- a/support/testing/tests/download/test_gitforge.py
+++ b/support/testing/tests/download/test_gitforge.py
@@ -5,7 +5,10 @@ import infra
 
 
 class GitforgeTestBase(infra.basetest.BRConfigTest):
-    config = ""
+    config = \
+        """
+        BR2_BACKUP_SITE=""
+        """
 
     def setUp(self):
         super(GitforgeTestBase, self).setUp()
diff --git a/support/testing/tests/download/test_ssh.py b/support/testing/tests/download/test_ssh.py
index 7d6ac3aaf7..126002a355 100644
--- a/support/testing/tests/download/test_ssh.py
+++ b/support/testing/tests/download/test_ssh.py
@@ -7,7 +7,9 @@ import infra
 
 
 class SSHTestBase(infra.basetest.BRConfigTest):
-    config = infra.basetest.MINIMAL_CONFIG
+    config = infra.basetest.MINIMAL_CONFIG + '''
+BR2_BACKUP_SITE=""
+'''
     sshd_test_dir = infra.filepath("tests/download/sshd")
     sshd = None
 
diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
index 8160cb6053..763125ca20 100644
--- a/support/testing/tests/package/test_rust.py
+++ b/support/testing/tests/package/test_rust.py
@@ -70,6 +70,7 @@ class TestRustVendoring(infra.basetest.BRConfigTest):
         BR2_PACKAGE_RIPGREP=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
+        BR2_BACKUP_SITE=""
         """
 
     def setUp(self):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
