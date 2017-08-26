From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 26 Aug 2017 19:20:55 -0300
Subject: [Buildroot] [next v2 6/7] testing/tests/download: add test for sha1
	as git ref
In-Reply-To: <20170826222056.6119-1-ricardo.martincoski@gmail.com>
References: <20170826222056.6119-1-ricardo.martincoski@gmail.com>
Message-ID: <20170826222056.6119-6-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

Add a test to download the package with git method and its version set
to a sha1 reachable by a branch name, but not pointed by it.
This is the most common use case for git refs in the tree.

Besides the test case Python script, add:
 - a br2-external (git-refs) with a fake package (foo) as a fixture for
   this and upcoming tests;
 - support in GitTestBase for repos created on the fly;
 - a new class GitRepo to create and manipulate repos. It is a class and
   not a simple module because it will become very useful when testing
   submodules.

After the download, compare the tarball to a checkout of the original
remote repo.

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
---
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
 .gitlab-ci.yml                                     |  1 +
 .../tests/download/br2-external/git-refs/Config.in |  0
 .../download/br2-external/git-refs/external.desc   |  1 +
 .../download/br2-external/git-refs/external.mk     |  1 +
 .../br2-external/git-refs/package/foo/foo.mk       | 13 +++
 support/testing/tests/download/gitbase.py          | 13 +++
 support/testing/tests/download/gitrepo.py          | 82 ++++++++++++++++++
 support/testing/tests/download/test_git_refs.py    | 96 ++++++++++++++++++++++
 8 files changed, 207 insertions(+)
 create mode 100644 support/testing/tests/download/br2-external/git-refs/Config.in
 create mode 100644 support/testing/tests/download/br2-external/git-refs/external.desc
 create mode 100644 support/testing/tests/download/br2-external/git-refs/external.mk
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/foo/foo.mk
 create mode 100644 support/testing/tests/download/gitrepo.py
 create mode 100644 support/testing/tests/download/test_git_refs.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 98022b6d7f..6d64a2c0b6 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -222,6 +222,7 @@ tests.core.test_timezone.TestNoTimezone: *runtime_test
 tests.download.test_git_hash.TestGitBadHash: *runtime_test
 tests.download.test_git_hash.TestGitGoodHash: *runtime_test
 tests.download.test_git_hash.TestGitNoHash: *runtime_test
+tests.download.test_git_refs.TestGitSha1InsideBranch: *runtime_test
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
index 0000000000..de1aad635f
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_GIT_REFS_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/download/br2-external/git-refs/package/foo/foo.mk b/support/testing/tests/download/br2-external/git-refs/package/foo/foo.mk
new file mode 100644
index 0000000000..01c926e177
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/foo/foo.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# foo
+#
+################################################################################
+
+# Get all the data from the test infra
+FOO_VERSION ?= 0
+GITREMOTE_PORT_NUMBER ?= 9418
+GITREMOTE_REPO ?= repo.git
+FOO_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/$(GITREMOTE_REPO)
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/gitbase.py b/support/testing/tests/download/gitbase.py
index b259914c77..b70e6400bc 100644
--- a/support/testing/tests/download/gitbase.py
+++ b/support/testing/tests/download/gitbase.py
@@ -1,6 +1,9 @@
+import os
+
 import infra.basetest
 from infra.builder import Builder
 from gitremote import GitRemote
+from gitrepo import GitRepo
 
 
 class GitTestBase(infra.basetest.BRTest):
@@ -9,6 +12,7 @@ class GitTestBase(infra.basetest.BRTest):
         BR2_BACKUP_SITE=""
         """
     br2_external = None
+    repo = None
     serveddir = None
     gitremote = None
     logfile = None
@@ -27,6 +31,15 @@ class GitTestBase(infra.basetest.BRTest):
             # time a test runs
             self.b.build(["dependencies"])
 
+        # for the case we are dinamically creating repos
+        if self.serveddir is None:
+            # place the repo in the images/ dir so it appears as an artifact
+            # when the test runs in gitlab infra
+            self.serveddir = os.path.join(self.builddir, "images")
+            if not os.path.exists(self.serveddir):  # for run-tests -k
+                os.mkdir(self.serveddir)
+            self.repo = GitRepo(self.builddir, self.serveddir, self.logtofile)
+
         self.gitremote = GitRemote(self.builddir, self.serveddir,
                                    self.logtofile)
         # send output from the test to the logfile created by GitRemote
diff --git a/support/testing/tests/download/gitrepo.py b/support/testing/tests/download/gitrepo.py
new file mode 100644
index 0000000000..47bdba1b7c
--- /dev/null
+++ b/support/testing/tests/download/gitrepo.py
@@ -0,0 +1,82 @@
+import os
+import subprocess
+import tempfile
+
+import infra
+
+
+class GitRepo(object):
+
+    def __init__(self, builddir, serveddir, logtofile):
+        self.logfile = infra.open_log_file(builddir, "run", logtofile)
+        self.remotedir = tempfile.mkdtemp(dir=serveddir)
+
+    # Run a git command in the emulated remote repo
+    def _git(self, git_cmd):
+        cmd = ["git"] + git_cmd
+        self.logfile.write("> Running command '{}' @ '{}'\n"
+                           .format(" ".join(cmd), self.remotedir))
+        self.logfile.flush()
+        r = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile,
+                            cwd=self.remotedir)
+        if r != 0:
+            raise SystemError("'{}' returned {}".format(" ".join(cmd), r))
+
+    def _sha1(self, ref="HEAD"):
+        cmd = ["git", "rev-parse", ref]
+        out = subprocess.check_output(cmd, stderr=self.logfile,
+                                      cwd=self.remotedir)
+        sha1 = out.strip()
+        self.logfile.write("> {}\n".format(sha1))
+        return sha1
+
+    # Initialize a repo with an initial commit. Git by default gives us the
+    # master branch pointing to this commit. Leave it there by detaching the
+    # HEAD before creating any more commits. It will become handy before we
+    # start the actual download test, since we can checkout this branch to move
+    # HEAD away from the ref to be tested, thus avoiding false OK in the case
+    # the HEAD can be checked out but the ref doesn't.
+    def git_init(self):
+        self._git(["init"])
+        # Ensure git know us before commit (needed to run in the docker image)
+        self._git(["config", "user.email", "'you at example.com'"])
+        self._git(["config", "user.name", "'Your Name'"])
+        self.git_commit()
+        self.git_checkout("HEAD~0")
+        return os.path.basename(self.remotedir)
+
+    # Create a commit with random data (actually a randomly named empty file).
+    # This way the tarball can be checked by comparing the contents of a clone
+    # of the repo against the contents of the tarball.
+    # Use the name of the new file as the commit message so when the git tree
+    # is dumped to the logfile, it displays useful info.
+    def git_commit(self):
+        _, f = tempfile.mkstemp(dir=self.remotedir)
+        self._git(["add", os.path.basename(f)])
+        self._git(["commit", "-m", os.path.basename(f)])
+        return self._sha1()
+
+    def git_branch(self, branch):
+        self._git(["branch", branch])
+        return self._sha1()
+
+    def git_checkout(self, ref):
+        self._git(["checkout", "-f", ref])
+        return self._sha1()
+
+    # Create a fresh clone of the repo to be compared to the tarball.
+    # For simplicity, create this copy inside the repo itself, so all go away
+    # when the test ends (when run-tests is called without -k).
+    def create_a_copy_to_compare(self):
+        self._git(["clone", self.remotedir, "copy"])
+        return os.path.join(self.remotedir, "copy")
+
+    # Move HEAD of emulated remote away from desired commit to avoid false OK
+    # when the reference under test cannot be fetched but HEAD can.
+    def move_head_away_from_ref_under_test(self):
+        self.git_checkout("master")
+
+    # For debug purposes, dump to the log a nice ascii art of all commits in
+    # the repo, including the short sha1, commit title and the refs.
+    def save_git_tree_to_log(self):
+        self._git(["log", "--all", "--oneline", "--graph", "--decorate"])
diff --git a/support/testing/tests/download/test_git_refs.py b/support/testing/tests/download/test_git_refs.py
new file mode 100644
index 0000000000..2f0709d703
--- /dev/null
+++ b/support/testing/tests/download/test_git_refs.py
@@ -0,0 +1,96 @@
+import os
+import tarfile
+
+import infra
+from gitbase import GitTestBase
+
+
+def files_from_tarball(tarball):
+    filelist = None
+    with tarfile.open(tarball) as tf:
+        filelist = tf.getnames()
+    path_inside_tarball = os.path.basename(tarball).split('.')[0]
+    files = [os.path.relpath(f, start=path_inside_tarball) for f in filelist]
+    return sorted(files)
+
+
+def files_from_checkout(checkout):
+    filelist = []
+    for dirpath, dirnames, filenames in os.walk(checkout):
+        if '.git' in dirnames:
+            dirnames.remove('.git')
+        filelist += [os.path.join(dirpath, f) for f in filenames]
+    files = [os.path.relpath(f, start=checkout) for f in filelist]
+    return sorted(files)
+
+
+def compare_tarball_with_checkout(tarball, checkout, logfile):
+    t_files = files_from_tarball(tarball)
+    c_files = files_from_checkout(checkout)
+    only_in_t = [f for f in t_files if f not in c_files]
+    only_in_c = [f for f in c_files if f not in t_files]
+    common = [f for f in t_files if f in c_files]
+    logfile.write("> Comparing resulting tarball with a checkout of the repo\n"
+                  "> only in tarball: " + " ".join(only_in_t) + "\n"
+                  "> missing from tarball: " + " ".join(only_in_c) + "\n"
+                  "> common files: " + " ".join(common) + "\n")
+    return len(only_in_t + only_in_c)
+
+
+class TestGitRefs(GitTestBase):
+    br2_external = infra.filepath("tests/download/br2-external/git-refs")
+
+    # Common preparations of the repo before the actual test
+    def _prepare_the_repo(self, ref):
+        # create a checkout from current commit to compare the generated
+        # tarball against it later
+        self.repo.git_checkout(ref)
+        self.checkoutdir = self.repo.create_a_copy_to_compare()
+        self.repo.move_head_away_from_ref_under_test()
+        # save debug info about the git repos
+        self.repo.save_git_tree_to_log()
+
+    # Download the sources from the emulated remote
+    def _download_ref(self, ref, remotedir):
+        self.dldir = os.path.join(self.builddir, "dl",
+                                  os.path.basename(remotedir))
+        env = {"BR2_DL_DIR": self.dldir,
+               "FOO_VERSION": ref,
+               "GITREMOTE_REPO": remotedir,
+               "GITREMOTE_PORT_NUMBER": str(self.gitremote.port)}
+        # download the sources
+        self.b.build(["foo-dirclean", "foo-source"], env, self.logfile)
+
+    # Check the tarball files against a clone of the emulated remote repo
+    def _check_tarball(self, ref):
+        tarball = os.path.join(self.dldir,
+                               "foo-{}.tar.gz".format(ref.replace('/', '_')))
+        ret = compare_tarball_with_checkout(tarball, self.checkoutdir,
+                                            self.logfile)
+        self.assertEqual(ret, 0, "downloaded source does not match")
+
+    # Download the sources and check
+    #
+    # ref: the git reference to be tested (tag, branch, sha1, special ref).
+    # e.g. "mybranch"
+    #
+    # remotedir: local path to the repo exported by git server.
+    # usually self.repo.git_init()
+    #
+    def check_download(self, ref, remotedir):
+        self._prepare_the_repo(ref)
+        self._download_ref(ref, remotedir)
+        self._check_tarball(ref)
+
+
+class TestGitSha1InsideBranch(TestGitRefs):
+    # Repo layout under test:
+    # * sha1_3 (mybranch)
+    # * sha1_2<<<
+    # * sha1_1 (HEAD -> master)
+    def test_run(self):
+        remotedir = self.repo.git_init()
+        ref = self.repo.git_commit()
+        self.repo.git_commit()
+        self.repo.git_branch("mybranch")
+        self.check_download(ref, remotedir)
-- 
2.13.0
