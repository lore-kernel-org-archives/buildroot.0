Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240E9C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 21:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3EFF8308D;
	Mon,  6 Dec 2021 21:25:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id swrYTJmmpajV; Mon,  6 Dec 2021 21:25:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC8E784BCA;
	Mon,  6 Dec 2021 21:25:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC08F1BF334
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABBFE6062F
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FxPUAO8CX_-H for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 21:24:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72B426079C
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 21:24:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C57D081422; Mon,  6 Dec 2021 21:19:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Dec 2021 22:12:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b48d10f40aaba5b8e6a6796b78b85ed7522df989
X-Git-Newrev: 1ca6ab6ace3c1f9edfbfd16b57d1280b3ea2c6f5
X-Patchwork-Hint: ignore
Message-Id: <20211206211935.C57D081422@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add github download
 helper testing
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ca6ab6ace3c1f9edfbfd16b57d1280b3ea2c6f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Back in 2013, a github download helper has been introduced to cope with
changes in github download-URL's [1][2].

Since then a testing infrastructure has been introduced in Buildroot
but no tests has been added to check if the github download helper is
still working.

It was reported recently [3] that the github helper doesn't work anymore
using tags. Buildroot is not the only project having the issue, see
Github feedback discussions [4].

Add tests for direct archive download (archives uploaded by maintainers),
download from a git tag and git hash using the github helper.
Make sure that Buildroot doesn't use BR2_BACKUP_SITE
(http://sources.buildroot.net).

[1] https://bugs.busybox.net/show_bug.cgi?id=6302
[2] c7c7d0697c00e45bcfad15b027f5c66005f4c005
[3] https://bugs.busybox.net/show_bug.cgi?id=14396
[4] https://github.com/github/feedback/discussions/8149

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../tests/download/br2-external/github/Config.in   |  0
 .../download/br2-external/github/external.desc     |  1 +
 .../tests/download/br2-external/github/external.mk |  1 +
 .../github-helper-hash/github-helper-hash.hash     |  3 ++
 .../github-helper-hash/github-helper-hash.mk       | 11 ++++++
 .../github-helper-tag/github-helper-tag.hash       |  3 ++
 .../package/github-helper-tag/github-helper-tag.mk | 11 ++++++
 .../package/github-release/github-release.hash     |  3 ++
 .../package/github-release/github-release.mk       | 12 +++++++
 support/testing/tests/download/test_gitforge.py    | 41 ++++++++++++++++++++++
 10 files changed, 86 insertions(+)

diff --git a/support/testing/tests/download/br2-external/github/Config.in b/support/testing/tests/download/br2-external/github/Config.in
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/support/testing/tests/download/br2-external/github/external.desc b/support/testing/tests/download/br2-external/github/external.desc
new file mode 100644
index 0000000000..b8beea8839
--- /dev/null
+++ b/support/testing/tests/download/br2-external/github/external.desc
@@ -0,0 +1 @@
+name: GITHUB
diff --git a/support/testing/tests/download/br2-external/github/external.mk b/support/testing/tests/download/br2-external/github/external.mk
new file mode 100644
index 0000000000..e4e5524ceb
--- /dev/null
+++ b/support/testing/tests/download/br2-external/github/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_GITHUB_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/download/br2-external/github/package/github-helper-hash/github-helper-hash.hash b/support/testing/tests/download/br2-external/github/package/github-helper-hash/github-helper-hash.hash
new file mode 100644
index 0000000000..a941060b31
--- /dev/null
+++ b/support/testing/tests/download/br2-external/github/package/github-helper-hash/github-helper-hash.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  4064739881453831bceeae81af8947cbd6c1fe03e052ac17b82ae5b3360d83f8  github-helper-hash-e2fba6457bd9d9c720540332eaf0c1f8c29eab00.tar.gz
+sha256  9755181e27175cb3510b4da8629caa406fb355a19aa8e7d55f06bf8ab33323c4  COPYING
diff --git a/support/testing/tests/download/br2-external/github/package/github-helper-hash/github-helper-hash.mk b/support/testing/tests/download/br2-external/github/package/github-helper-hash/github-helper-hash.mk
new file mode 100644
index 0000000000..e1fa5aabc2
--- /dev/null
+++ b/support/testing/tests/download/br2-external/github/package/github-helper-hash/github-helper-hash.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# github-helper-hash
+#
+################################################################################
+
+GITHUB_HELPER_HASH_VERSION = e2fba6457bd9d9c720540332eaf0c1f8c29eab00
+GITHUB_HELPER_HASH_SITE = $(call github,buildroot,buildroot,$(GITHUB_HELPER_HASH_VERSION))
+GITHUB_HELPER_HASH_LICENSE_FILES = COPYING
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/github/package/github-helper-tag/github-helper-tag.hash b/support/testing/tests/download/br2-external/github/package/github-helper-tag/github-helper-tag.hash
new file mode 100644
index 0000000000..466d2ac401
--- /dev/null
+++ b/support/testing/tests/download/br2-external/github/package/github-helper-tag/github-helper-tag.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  959a953bbd91e6ed6db8d63a45a986400878b6bb486455231b2976218301c3d2  github-helper-tag-2021.02.tar.gz
+sha256  9755181e27175cb3510b4da8629caa406fb355a19aa8e7d55f06bf8ab33323c4  COPYING
diff --git a/support/testing/tests/download/br2-external/github/package/github-helper-tag/github-helper-tag.mk b/support/testing/tests/download/br2-external/github/package/github-helper-tag/github-helper-tag.mk
new file mode 100644
index 0000000000..b1ff66d817
--- /dev/null
+++ b/support/testing/tests/download/br2-external/github/package/github-helper-tag/github-helper-tag.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# github-helper-tag
+#
+################################################################################
+
+GITHUB_HELPER_TAG_VERSION = 2021.02
+GITHUB_HELPER_TAG_SITE = $(call github,buildroot,buildroot,$(GITHUB_HELPER_TAG_VERSION))
+GITHUB_HELPER_TAG_LICENSE_FILES = COPYING
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/github/package/github-release/github-release.hash b/support/testing/tests/download/br2-external/github/package/github-release/github-release.hash
new file mode 100644
index 0000000000..78a25dd271
--- /dev/null
+++ b/support/testing/tests/download/br2-external/github/package/github-release/github-release.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  f4cb17b21928e36ec27de5c5294dea6ec1de4acd7ee6c56d6ecc75319cbcaefa  systemd-bootchart-233.tar.xz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/support/testing/tests/download/br2-external/github/package/github-release/github-release.mk b/support/testing/tests/download/br2-external/github/package/github-release/github-release.mk
new file mode 100644
index 0000000000..34409e1cad
--- /dev/null
+++ b/support/testing/tests/download/br2-external/github/package/github-release/github-release.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# github-release
+#
+################################################################################
+
+GITHUB_RELEASE_VERSION = 233
+GITHUB_RELEASE_SITE = https://github.com/systemd/systemd-bootchart/releases/download/v$(GITHUB_RELEASE_VERSION)
+GITHUB_RELEASE_SOURCE = systemd-bootchart-$(GITHUB_RELEASE_VERSION).tar.xz
+GITHUB_RELEASE_LICENSE_FILES = LICENSE.LGPL2.1
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/test_gitforge.py b/support/testing/tests/download/test_gitforge.py
new file mode 100644
index 0000000000..c2d98d0853
--- /dev/null
+++ b/support/testing/tests/download/test_gitforge.py
@@ -0,0 +1,41 @@
+import os
+import shutil
+
+import infra
+
+
+class GitforgeTestBase(infra.basetest.BRConfigTest):
+    config = \
+        """
+        BR2_BACKUP_SITE=""
+        """
+
+    def setUp(self):
+        super(GitforgeTestBase, self).setUp()
+
+    def tearDown(self):
+        self.show_msg("Cleaning up")
+        if self.b and not self.keepbuilds:
+            self.b.delete()
+
+    def check_download(self, package):
+        # store downloaded tarball inside the output dir so the test infra
+        # cleans it up at the end
+        dl_dir = os.path.join(self.builddir, "dl")
+        # enforce we test the download
+        if os.path.exists(dl_dir):
+            shutil.rmtree(dl_dir)
+        env = {"BR2_DL_DIR": dl_dir}
+        self.b.build(["{}-dirclean".format(package),
+                      "{}-legal-info".format(package)],
+                     env)
+
+
+class TestGitHub(GitforgeTestBase):
+    br2_external = [infra.filepath("tests/download/br2-external/github")]
+
+    def test_run(self):
+        self.check_download("github-helper-tag")
+        self.check_download("github-helper-hash")
+        self.check_download("github-release")
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
