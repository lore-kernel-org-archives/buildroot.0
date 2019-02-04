From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 4 Feb 2019 20:44:29 +0100
Subject: [Buildroot] [git commit] testing/tests/download: test case for git
 refs
Message-ID: <20190204194318.04CE581499@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a90740488b3f981f754f422030574a4b28e95f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All upcoming tests for git refs will rely on the return code of make to
determine whether a git ref can be downloaded or not and also to
determine whether the downloaded content is correct (all of this taking
advantage of the check-hash mechanism already in place for git
packages).
So to avoid false results i.e. in the case the check-hash mechanism
become broken in the master branch, add some sanity checks before the
actual test of download git refs.

Add the minimum test case for git refs containing only sanity checks.
Reuse the commit in the static repo.
Add a br2-external with two packages to check that:
 - trying to download an invalid sha1 generates an error;
 - downloading a valid sha1 that contains unexpected content generates
   an error.

In order to ease the maintenance and review, each upcoming patch adding
checks to this test case will add at same time the commits to the static
repo, the equivalent packages to the br2-external and code to the test
case.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Cc: Arnout Vandecappelle <arnout@mind.be>
Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml                                        |  1 +
 .../tests/download/br2-external/git-refs/Config.in    |  0
 .../download/br2-external/git-refs/external.desc      |  1 +
 .../tests/download/br2-external/git-refs/external.mk  |  4 ++++
 .../package/git-wrong-content/git-wrong-content.hash  |  2 ++
 .../package/git-wrong-content/git-wrong-content.mk    | 11 +++++++++++
 .../git-refs/package/git-wrong-sha1/git-wrong-sha1.mk | 11 +++++++++++
 support/testing/tests/download/test_git.py            | 19 +++++++++++++++++++
 8 files changed, 49 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6a5a679594..f05b9d041e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -292,6 +292,7 @@ tests.core.test_timezone.TestGlibcAllTimezone: *runtime_test
 tests.core.test_timezone.TestGlibcNonDefaultLimitedTimezone: *runtime_test
 tests.core.test_timezone.TestNoTimezone: *runtime_test
 tests.download.test_git.TestGitHash: *runtime_test
+tests.download.test_git.TestGitRefs: *runtime_test
 tests.fs.test_ext.TestExt2: *runtime_test
 tests.fs.test_ext.TestExt2r1: *runtime_test
 tests.fs.test_ext.TestExt3: *runtime_test
diff --git a/support/testing/tests/download/br2-external/git-refs/Config.in b/support/testing/tests/download/br2-external/git-refs/Config.in
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/support/testing/tests/download/br2-external/git-refs/external.desc b/support/testing/tests/download/br2-external/git-refs/external.desc
new file mode 100644
index 0000000000..69f40d46c6
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/external.desc
@@ -0,0 +1 @@
+name: GIT_REFS
diff --git a/support/testing/tests/download/br2-external/git-refs/external.mk b/support/testing/tests/download/br2-external/git-refs/external.mk
new file mode 100644
index 0000000000..ab38c27eb7
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/external.mk
@@ -0,0 +1,4 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_GIT_REFS_PATH)/package/*/*.mk))
+
+# Get the git server port number from the test infra
+GITREMOTE_PORT_NUMBER ?= 9418
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash b/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
new file mode 100644
index 0000000000..47b2b8b7d7
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
@@ -0,0 +1,2 @@
+ sha256  04715901977503d1df650e0959f4d31d8e7b105e2ac99a2182e0652b8f13baa1  git-wrong-content-a238b1dfcd825d47d834af3c5223417c8411d90d.tar.gz
+ sha256  0000000000000000000000000000000000000000000000000000000000000000  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.mk b/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.mk
new file mode 100644
index 0000000000..786224dad9
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# git-wrong-content
+#
+################################################################################
+
+GIT_WRONG_CONTENT_VERSION = a238b1dfcd825d47d834af3c5223417c8411d90d
+GIT_WRONG_CONTENT_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_WRONG_CONTENT_LICENSE_FILES = file
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-wrong-sha1/git-wrong-sha1.mk b/support/testing/tests/download/br2-external/git-refs/package/git-wrong-sha1/git-wrong-sha1.mk
new file mode 100644
index 0000000000..f9d0d2226c
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-wrong-sha1/git-wrong-sha1.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# git-wrong-sha1
+#
+################################################################################
+
+GIT_WRONG_SHA1_VERSION = 0000000000000000000000000000000000000000
+GIT_WRONG_SHA1_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_WRONG_SHA1_LICENSE_FILES = file
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index 156784dc9c..64b060ba30 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -33,6 +33,15 @@ class GitTestBase(infra.basetest.BRTest):
                       "{}-source".format(package)],
                      env)
 
+    def check_download(self, package):
+        # store downloaded tarball inside the output dir so the test infra
+        # cleans it up at the end
+        env = {"BR2_DL_DIR": os.path.join(self.builddir, "dl"),
+               "GITREMOTE_PORT_NUMBER": str(self.gitremote.port)}
+        self.b.build(["{}-dirclean".format(package),
+                      "{}-legal-info".format(package)],
+                     env)
+
 
 class TestGitHash(GitTestBase):
     br2_external = [infra.filepath("tests/download/br2-external/git-hash")]
@@ -42,3 +51,13 @@ class TestGitHash(GitTestBase):
             self.check_hash("bad")
         self.check_hash("good")
         self.check_hash("nohash")
+
+
+class TestGitRefs(GitTestBase):
+    br2_external = [infra.filepath("tests/download/br2-external/git-refs")]
+
+    def test_run(self):
+        with self.assertRaises(SystemError):
+            self.check_download("git-wrong-content")
+        with self.assertRaises(SystemError):
+            self.check_download("git-wrong-sha1")
