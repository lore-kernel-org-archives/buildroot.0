From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 26 Aug 2017 19:20:56 -0300
Subject: [Buildroot] [next v2 7/7] testing/tests/download: add test for git
	submodule
In-Reply-To: <20170826222056.6119-1-ricardo.martincoski@gmail.com>
References: <20170826222056.6119-1-ricardo.martincoski@gmail.com>
Message-ID: <20170826222056.6119-7-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

Add a test that downloads a git package with recursive submodules.

Add the required support in the GitRepo class.

Use the br2-external added by the first test.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
---
Changes v1 -> v2:
  - rewrite using new git test infra;
  - this patch is part of series 1/3 of a new version of
    http://patchwork.ozlabs.org/patch/690097/
---
 .gitlab-ci.yml                                  |  1 +
 support/testing/tests/download/gitrepo.py       | 35 +++++++++++++++++++--
 support/testing/tests/download/test_git_refs.py | 42 +++++++++++++++++++++----
 3 files changed, 70 insertions(+), 8 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6d64a2c0b6..c782f66d5d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -222,6 +222,7 @@ tests.core.test_timezone.TestNoTimezone: *runtime_test
 tests.download.test_git_hash.TestGitBadHash: *runtime_test
 tests.download.test_git_hash.TestGitGoodHash: *runtime_test
 tests.download.test_git_hash.TestGitNoHash: *runtime_test
+tests.download.test_git_refs.TestGitRecursiveSubmodule: *runtime_test
 tests.download.test_git_refs.TestGitSha1InsideBranch: *runtime_test
 tests.fs.test_ext.TestExt2: *runtime_test
 tests.fs.test_ext.TestExt2r1: *runtime_test
diff --git a/support/testing/tests/download/gitrepo.py b/support/testing/tests/download/gitrepo.py
index 47bdba1b7c..5940f94522 100644
--- a/support/testing/tests/download/gitrepo.py
+++ b/support/testing/tests/download/gitrepo.py
@@ -8,8 +8,12 @@ import infra
 class GitRepo(object):
 
     def __init__(self, builddir, serveddir, logtofile):
+        self.builddir = builddir
+        self.serveddir = serveddir
+        self.logtofile = logtofile
         self.logfile = infra.open_log_file(builddir, "run", logtofile)
         self.remotedir = tempfile.mkdtemp(dir=serveddir)
+        self.submodule = None
 
     # Run a git command in the emulated remote repo
     def _git(self, git_cmd):
@@ -64,19 +68,46 @@ class GitRepo(object):
         self._git(["checkout", "-f", ref])
         return self._sha1()
 
+    def git_submodule(self, recurse=1):
+        if recurse < 1:
+            return self.git_commit()
+
+        self.submodule = GitRepo(self.builddir, self.serveddir, self.logtofile)
+        d = self.submodule.git_init()
+        ref = self.submodule.git_submodule(recurse - 1)
+
+        # make submodule commit reachable by a branch but not@its head
+        self.submodule.git_commit()
+        self.submodule.git_branch("anybranch")
+        self.submodule.git_checkout(ref)
+
+        self._git(["submodule", "add",
+                   os.path.join("..", os.path.basename(d))])
+        self._git(["commit", "-m", os.path.basename(d)])
+        return self._sha1()
+
     # Create a fresh clone of the repo to be compared to the tarball.
     # For simplicity, create this copy inside the repo itself, so all go away
     # when the test ends (when run-tests is called without -k).
-    def create_a_copy_to_compare(self):
-        self._git(["clone", self.remotedir, "copy"])
+    def create_a_copy_to_compare(self, submodules):
+        if submodules:
+            self._git(["clone", "--recursive", self.remotedir, "copy"])
+        else:
+            self._git(["clone", self.remotedir, "copy"])
         return os.path.join(self.remotedir, "copy")
 
     # Move HEAD of emulated remote away from desired commit to avoid false OK
     # when the reference under test cannot be fetched but HEAD can.
     def move_head_away_from_ref_under_test(self):
         self.git_checkout("master")
+        if self.submodule:
+            self.submodule.move_head_away_from_ref_under_test()
 
     # For debug purposes, dump to the log a nice ascii art of all commits in
     # the repo, including the short sha1, commit title and the refs.
     def save_git_tree_to_log(self):
         self._git(["log", "--all", "--oneline", "--graph", "--decorate"])
+        # don't use 'git submodule foreach', it only works as expected if the
+        # desired sha1 (that contains the submodule) is checked out
+        if self.submodule:
+            self.submodule.save_git_tree_to_log()
diff --git a/support/testing/tests/download/test_git_refs.py b/support/testing/tests/download/test_git_refs.py
index 2f0709d703..a58d806924 100644
--- a/support/testing/tests/download/test_git_refs.py
+++ b/support/testing/tests/download/test_git_refs.py
@@ -41,23 +41,25 @@ class TestGitRefs(GitTestBase):
     br2_external = infra.filepath("tests/download/br2-external/git-refs")
 
     # Common preparations of the repo before the actual test
-    def _prepare_the_repo(self, ref):
+    def _prepare_the_repo(self, ref, submodules):
         # create a checkout from current commit to compare the generated
         # tarball against it later
         self.repo.git_checkout(ref)
-        self.checkoutdir = self.repo.create_a_copy_to_compare()
+        self.checkoutdir = self.repo.create_a_copy_to_compare(submodules)
         self.repo.move_head_away_from_ref_under_test()
         # save debug info about the git repos
         self.repo.save_git_tree_to_log()
 
     # Download the sources from the emulated remote
-    def _download_ref(self, ref, remotedir):
+    def _download_ref(self, ref, remotedir, submodules):
         self.dldir = os.path.join(self.builddir, "dl",
                                   os.path.basename(remotedir))
         env = {"BR2_DL_DIR": self.dldir,
                "FOO_VERSION": ref,
                "GITREMOTE_REPO": remotedir,
                "GITREMOTE_PORT_NUMBER": str(self.gitremote.port)}
+        if submodules:
+            env["FOO_GIT_SUBMODULES"] = "YES"
         # download the sources
         self.b.build(["foo-dirclean", "foo-source"], env, self.logfile)
 
@@ -77,9 +79,12 @@ class TestGitRefs(GitTestBase):
     # remotedir: local path to the repo exported by git server.
     # usually self.repo.git_init()
     #
-    def check_download(self, ref, remotedir):
-        self._prepare_the_repo(ref)
-        self._download_ref(ref, remotedir)
+    # submodules: enable git submodules support on the recipe?
+    # e.g. False
+    #
+    def check_download(self, ref, remotedir, submodules=False):
+        self._prepare_the_repo(ref, submodules)
+        self._download_ref(ref, remotedir, submodules)
         self._check_tarball(ref)
 
 
@@ -94,3 +99,28 @@ class TestGitSha1InsideBranch(TestGitRefs):
         self.repo.git_commit()
         self.repo.git_branch("mybranch")
         self.check_download(ref, remotedir)
+
+
+class TestGitRecursiveSubmodule(TestGitRefs):
+    # Repo layout under test:
+    # * sha1_3 (mybranch)
+    # * sha1_2<<< submodule_a sha1_2a
+    # * sha1_1 (HEAD -> master)
+    # submodule_a:
+    # * sha1_3a (anybranch)
+    # * sha1_2a<<< submodule_b sha1_2b
+    # * sha1_1a (HEAD -> master)
+    # submodule_b:
+    # * sha1_3b (anybranch)
+    # * sha1_2b<<< submodule_c sha1_2c
+    # * sha1_1b (HEAD -> master)
+    # submodule_c:
+    # * sha1_3c (anybranch)
+    # * sha1_2c<<<
+    # * sha1_1c (HEAD -> master)
+    def test_run(self):
+        remotedir = self.repo.git_init()
+        ref = self.repo.git_submodule(3)
+        self.repo.git_commit()
+        self.repo.git_branch("mybranch")
+        self.check_download(ref, remotedir, submodules=True)
-- 
2.13.0
