From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 29 Apr 2018 11:33:42 -0300
Subject: [Buildroot] [PATCH v4] testing/tests/download: test case for git
 refs
In-Reply-To: <20180429143349.24010-1-ricardo.martincoski@gmail.com>
References: <20180429143349.24010-1-ricardo.martincoski@gmail.com>
Message-ID: <20180429143349.24010-6-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

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
---
Layout of static repo with the series applied until this patch:
 $ git -C support/testing/tests/download/git-remote/repo.git \
   log --all --decorate --graph --oneline --decorate
 * a238b1d (HEAD -> master) initial

Changes v3 -> v4:
  - move useful methods to the git base class;
  - br2_external is now a list;

Changes v2 -> v3:
  - rewrite from v2, using an static repo;
  - separate on this patch the bare minimum static repo (actually reuse
    from previous commit), the next patches on the series will gradually
    add new commits to the static repo together to the equivalent
    packages and call to check_download. This approach allows better
    maintenance, even during the review of the series, because a patch
    can be more easily reworked/discarded/reordered;

Changes v1 -> v2:
  - rename the main test file to testgit (Arnout). Actually I broke it
    down to a common gitbase and the two test_git_refs and test_git_hash
    (this last one is new, in the previous patch);
  - remove some weird/wrong TODO I had in v1 code (Arnout);
  - use the same structure for test cases as used in the test infra;
  - raise an exception when the download fails (Arnout). I did not add
    code for this since I let the builder class to raise it;
  - I reimplemented git_util as gitrepo. Arnout suggested to use it as
    module and I first implemented that way locally, but then I created
    test cases for submodules and I realized now I have a reason to use
    a class (see next patch);
  - move package (now called foo) to a BR2_EXTERNAL (Arnout);
  - override BR2_DL_DIR when calling make (Arnout);
  - the test infra uses O= so I don't need to;
  - instead of removing the files in the dl/ folder, use a different dir
    as dl/ dir since now each repo has a different name;
  - open the tarball to check its contents (Arnout). I create a fresh
    clone of the repo before the test to compare against;
  - this patch is not checking for the actual sha1 anymore, it can be
    done later. But the check for the contents should cover most cases;
  - my old argument to not test only the support/download/dl-wrapper is
    not valid anymore since I mimic the logic from the scripts to know
    the name of the tarball. But I still think calling make ...-source
    has better maintenance. And also the previous patch (test for hash
    of packages with git method) can use the same base class;
  - this patch is part of series 1/3 of a new version of
    http://patchwork.ozlabs.org/patch/690097/
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
 create mode 100644 support/testing/tests/download/br2-external/git-refs/Config.in
 create mode 100644 support/testing/tests/download/br2-external/git-refs/external.desc
 create mode 100644 support/testing/tests/download/br2-external/git-refs/external.mk
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.mk
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-wrong-sha1/git-wrong-sha1.mk

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 42559e0365..26e2af3799 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -267,6 +267,7 @@ tests.core.test_timezone.TestGlibcAllTimezone: *runtime_test
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
index 14fc8e4da3..fdfc858233 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -32,6 +32,15 @@ class GitTestBase(infra.basetest.BRTest):
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
@@ -41,3 +50,13 @@ class TestGitHash(GitTestBase):
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
-- 
2.14.1
