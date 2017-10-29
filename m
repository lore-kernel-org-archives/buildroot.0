From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 29 Oct 2017 12:06:05 -0200
Subject: [Buildroot] [PATCH v3 6/9] testing/tests/download: add git hash test
In-Reply-To: <20171029140608.26200-1-ricardo.martincoski@datacom.ind.br>
References: <20171029140608.26200-1-ricardo.martincoski@datacom.ind.br>
Message-ID: <20171029140608.26200-7-ricardo.martincoski@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add one test case to ensure the hash is checked for git packages:
 - correct hash;
 - wrong hash;
 - no hash file.

Add required infra:
 - a GitRemote class, that can start a git server in the host machine to
   emulate a remote git server under the control of the test;
 - a new base class, called GitTestBase, that inherits from BRTest and
   must be subclassed by all git test cases.
   Its setUp() method takes care of configuring the build with a
   br2-external, avoiding to hit http://sources.buildroot.net by using
   an empty BR2_BACKUP_SITE. It also avoids downloading not
   pre-installed dependencies (i.e. lzip) every time by calling 'make
   dependencies' using the common dl directory, and it instantiates the
   GitRemote object.

Besides the Python scripts, add some fixtures used during the tests:
 - a br2-external (git-hash) with one package for each part of the test
   case;
 - a static git bare repo (repo.git) to be served using GitRemote class.

Neither the br2-external nor the check hash functionalities are the
subject of these tests per se, so for simplicity limit the check to the
error codes and don't look for the messages in the log.

Thanks to Arnout for the hint about how to add a bare repo to test.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
Layout of static repo with the series applied until this patch:
 $ git -C support/testing/tests/download/git-remote/repo.git \
   log --all --decorate --graph --oneline --decorate
 * a238b1d (HEAD -> master) initial

Changes v2 -> v3:
  - renumber 5 -> 6;
  - rebase after removing patch 3 "allow to override logfile" from the
    series and adding new patches 4 "split runtime test from BRTest" and
    5 "support br2-external";
  - merge part of old patch 4 (very minimal GitTestBase) to old patch 5
    (Arnout Vandecappelle);
  - merge and tweak part of commit log from old patch 4;
  - move GITREMOTE_PORT_NUMBER to external.mk (Arnout Vandecappelle);
  - use dosctrings;
  - start git remote from __init__ (Arnout Vandecappelle), but I kept a
    separate method and call start();
  - remove dead code (Arnout Vandecappelle);
  - use the same git repo for all tests (Arnout Vandecappelle);
  - rename the file to test_git and merge the 3 test cases in one, since
    the feature "check hash for git packages" is only OK if all work
    well and also because the test does not take too much time;
  - update commit log accordingly.

Changes v1 -> v2 (patch 4):
  - new patch
Changes v1 -> v2 (patch 5):
  - use git daemon + git:// instead of ssh (Arnout);
  - remove __main__ handling since the test infra already does that;
  - use the logging support from test infra;
  - this patch is part of series 1/3 of a new version of
    http://patchwork.ozlabs.org/patch/690097/
---
 .gitlab-ci.yml                                     |   1 +
 support/testing/tests/download/__init__.py         |   0
 .../tests/download/br2-external/git-hash/Config.in |   0
 .../download/br2-external/git-hash/external.desc   |   1 +
 .../download/br2-external/git-hash/external.mk     |   4 ++
 .../br2-external/git-hash/package/bad/bad.hash     |   1 +
 .../br2-external/git-hash/package/bad/bad.mk       |  10 ++++
 .../br2-external/git-hash/package/good/good.hash   |   1 +
 .../br2-external/git-hash/package/good/good.mk     |  10 ++++
 .../br2-external/git-hash/package/nohash/nohash.mk |  10 ++++
 .../download/git-remote/repo.git/.gitattributes    |   1 +
 .../tests/download/git-remote/repo.git/HEAD        |   1 +
 .../tests/download/git-remote/repo.git/config      |   4 ++
 .../99/f2e3e1cb15f9b52fa29f66d380dda061d917ab      | Bin 0 -> 49 bytes
 .../a2/38b1dfcd825d47d834af3c5223417c8411d90d      | Bin 0 -> 152 bytes
 .../e7/9c5e8f964493290a409888d5413a737e8e5dd5      | Bin 0 -> 23 bytes
 .../download/git-remote/repo.git/refs/heads/master |   1 +
 support/testing/tests/download/gitbase.py          |  27 +++++++++++
 support/testing/tests/download/gitremote.py        |  52 +++++++++++++++++++++
 support/testing/tests/download/test_git.py         |  23 +++++++++
 20 files changed, 147 insertions(+)
 create mode 100644 support/testing/tests/download/__init__.py
 create mode 100644 support/testing/tests/download/br2-external/git-hash/Config.in
 create mode 100644 support/testing/tests/download/br2-external/git-hash/external.desc
 create mode 100644 support/testing/tests/download/br2-external/git-hash/external.mk
 create mode 100644 support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
 create mode 100644 support/testing/tests/download/br2-external/git-hash/package/bad/bad.mk
 create mode 100644 support/testing/tests/download/br2-external/git-hash/package/good/good.hash
 create mode 100644 support/testing/tests/download/br2-external/git-hash/package/good/good.mk
 create mode 100644 support/testing/tests/download/br2-external/git-hash/package/nohash/nohash.mk
 create mode 100644 support/testing/tests/download/git-remote/repo.git/.gitattributes
 create mode 100644 support/testing/tests/download/git-remote/repo.git/HEAD
 create mode 100644 support/testing/tests/download/git-remote/repo.git/config
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/99/f2e3e1cb15f9b52fa29f66d380dda061d917ab
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/a2/38b1dfcd825d47d834af3c5223417c8411d90d
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/e7/9c5e8f964493290a409888d5413a737e8e5dd5
 create mode 100644 support/testing/tests/download/git-remote/repo.git/refs/heads/master
 create mode 100644 support/testing/tests/download/gitbase.py
 create mode 100644 support/testing/tests/download/gitremote.py
 create mode 100644 support/testing/tests/download/test_git.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ebaac7a3d9..fbbc4c0243 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -227,6 +227,7 @@ tests.core.test_rootfs_overlay.TestRootfsOverlay: *runtime_test
 tests.core.test_timezone.TestGlibcAllTimezone: *runtime_test
 tests.core.test_timezone.TestGlibcNonDefaultLimitedTimezone: *runtime_test
 tests.core.test_timezone.TestNoTimezone: *runtime_test
+tests.download.test_git.TestGitHash: *runtime_test
 tests.fs.test_ext.TestExt2: *runtime_test
 tests.fs.test_ext.TestExt2r1: *runtime_test
 tests.fs.test_ext.TestExt3: *runtime_test
diff --git a/support/testing/tests/download/__init__.py b/support/testing/tests/download/__init__.py
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/support/testing/tests/download/br2-external/git-hash/Config.in b/support/testing/tests/download/br2-external/git-hash/Config.in
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/support/testing/tests/download/br2-external/git-hash/external.desc b/support/testing/tests/download/br2-external/git-hash/external.desc
new file mode 100644
index 0000000000..41316c8b25
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-hash/external.desc
@@ -0,0 +1 @@
+name: GIT_HASH
diff --git a/support/testing/tests/download/br2-external/git-hash/external.mk b/support/testing/tests/download/br2-external/git-hash/external.mk
new file mode 100644
index 0000000000..4646dfe2b0
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-hash/external.mk
@@ -0,0 +1,4 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_GIT_HASH_PATH)/package/*/*.mk))
+
+# Get the git server port number from the test infra
+GITREMOTE_PORT_NUMBER ?= 9418
diff --git a/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
new file mode 100644
index 0000000000..b9e1baec84
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
@@ -0,0 +1 @@
+sha256  0000000000000000000000000000000000000000000000000000000000000000  bad-a238b1dfcd825d47d834af3c5223417c8411d90d.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-hash/package/bad/bad.mk b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.mk
new file mode 100644
index 0000000000..5497bd6bfe
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.mk
@@ -0,0 +1,10 @@
+################################################################################
+#
+# bad
+#
+################################################################################
+
+BAD_VERSION = a238b1dfcd825d47d834af3c5223417c8411d90d
+BAD_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-hash/package/good/good.hash b/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
new file mode 100644
index 0000000000..9e92ab8ab9
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
@@ -0,0 +1 @@
+sha256  d00ae598e9e770d607621a86766030b42eaa58156cb8d482b043969da7963c23  good-a238b1dfcd825d47d834af3c5223417c8411d90d.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-hash/package/good/good.mk b/support/testing/tests/download/br2-external/git-hash/package/good/good.mk
new file mode 100644
index 0000000000..0f0eefd944
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-hash/package/good/good.mk
@@ -0,0 +1,10 @@
+################################################################################
+#
+# good
+#
+################################################################################
+
+GOOD_VERSION = a238b1dfcd825d47d834af3c5223417c8411d90d
+GOOD_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-hash/package/nohash/nohash.mk b/support/testing/tests/download/br2-external/git-hash/package/nohash/nohash.mk
new file mode 100644
index 0000000000..1da19d88c6
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-hash/package/nohash/nohash.mk
@@ -0,0 +1,10 @@
+################################################################################
+#
+# nohash
+#
+################################################################################
+
+NOHASH_VERSION = a238b1dfcd825d47d834af3c5223417c8411d90d
+NOHASH_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/git-remote/repo.git/.gitattributes b/support/testing/tests/download/git-remote/repo.git/.gitattributes
new file mode 100644
index 0000000000..eb50c64a21
--- /dev/null
+++ b/support/testing/tests/download/git-remote/repo.git/.gitattributes
@@ -0,0 +1 @@
+objects/*/* binary
diff --git a/support/testing/tests/download/git-remote/repo.git/HEAD b/support/testing/tests/download/git-remote/repo.git/HEAD
new file mode 100644
index 0000000000..cb089cd89a
--- /dev/null
+++ b/support/testing/tests/download/git-remote/repo.git/HEAD
@@ -0,0 +1 @@
+ref: refs/heads/master
diff --git a/support/testing/tests/download/git-remote/repo.git/config b/support/testing/tests/download/git-remote/repo.git/config
new file mode 100644
index 0000000000..07d359d07c
--- /dev/null
+++ b/support/testing/tests/download/git-remote/repo.git/config
@@ -0,0 +1,4 @@
+[core]
+	repositoryformatversion = 0
+	filemode = true
+	bare = true
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/99/f2e3e1cb15f9b52fa29f66d380dda061d917ab b/support/testing/tests/download/git-remote/repo.git/objects/99/f2e3e1cb15f9b52fa29f66d380dda061d917ab
new file mode 100644
index 0000000000000000000000000000000000000000..9db72668cf9374b0b85a25a19f30084fd460072d
GIT binary patch
literal 49
zcmb<m)YkO!4K*-JGB7bPFg6VIIDN)5wZcw)UHz=nDZYB`lCt5lYr9_mN?Omvz#_so
F4FHVv5b^*3

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/a2/38b1dfcd825d47d834af3c5223417c8411d90d b/support/testing/tests/download/git-remote/repo.git/objects/a2/38b1dfcd825d47d834af3c5223417c8411d90d
new file mode 100644
index 0000000000000000000000000000000000000000..31b6bcf34de247d14531c70b36e28d895ba20af3
GIT binary patch
literal 152
zcmV;J0B8Sr0j<tW4#FT1Kw;OMVlL1IsFY%i at d9r21jApQv_OKm@b)%w;oi9Y7BA10
zl&FE!)2`JJz?dk*5QMWrMPrqWC`}wkKTO<v<fHILXtWHU?OrNe$zk;cE?667R~`$&
zv3{^mUp&tVY3*G}ClHEjqx7`b(D8wDw&^y}!k==CGBv`Lu^Y`f_^!m*+1KHhS@s5O
G+F(P1IZe3$

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/e7/9c5e8f964493290a409888d5413a737e8e5dd5 b/support/testing/tests/download/git-remote/repo.git/objects/e7/9c5e8f964493290a409888d5413a737e8e5dd5
new file mode 100644
index 0000000000000000000000000000000000000000..df2037a2d2d30afb20e31cd558c92c2edabe7cf6
GIT binary patch
literal 23
fcmb<m^geacKWIb3i8H5lPWqgA$i$$b%kl;Qg;xrl

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/refs/heads/master b/support/testing/tests/download/git-remote/repo.git/refs/heads/master
new file mode 100644
index 0000000000..b6bccc1c17
--- /dev/null
+++ b/support/testing/tests/download/git-remote/repo.git/refs/heads/master
@@ -0,0 +1 @@
+a238b1dfcd825d47d834af3c5223417c8411d90d
diff --git a/support/testing/tests/download/gitbase.py b/support/testing/tests/download/gitbase.py
new file mode 100644
index 0000000000..d0a7b95e5e
--- /dev/null
+++ b/support/testing/tests/download/gitbase.py
@@ -0,0 +1,27 @@
+import infra.basetest
+from gitremote import GitRemote
+
+
+class GitTestBase(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_BACKUP_SITE=""
+        """
+    serveddir = infra.filepath("tests/download/git-remote")
+
+    def setUp(self):
+        super(GitTestBase, self).setUp()
+        if not self.b.is_finished():
+            # when running the tests in a local machine, do not download not
+            # pre-installed dependencies (i.e. lzip) every time a test runs
+            self.b.build(["dependencies"])
+
+        self.gitremote = GitRemote(self.builddir, self.serveddir,
+                                   self.logtofile)
+
+    def tearDown(self):
+        self.show_msg("Cleaning up")
+        if self.gitremote:
+            self.gitremote.stop()
+        if self.b and not self.keepbuilds:
+            self.b.delete()
diff --git a/support/testing/tests/download/gitremote.py b/support/testing/tests/download/gitremote.py
new file mode 100644
index 0000000000..b3a1357193
--- /dev/null
+++ b/support/testing/tests/download/gitremote.py
@@ -0,0 +1,52 @@
+# subprocess does not kill the child daemon when a test case fails by raising
+# an exception. So use pexpect instead.
+import pexpect
+
+import infra
+
+GIT_REMOTE_PORT_INITIAL = 9418
+GIT_REMOTE_PORT_LAST = GIT_REMOTE_PORT_INITIAL + 99
+
+
+class GitRemote(object):
+    def __init__(self, builddir, serveddir, logtofile):
+        self.daemon = None
+        self.port = None
+        self.serveddir = serveddir
+        self.logfile = infra.open_log_file(builddir, "run", logtofile)
+
+        self.start()
+
+    def start(self):
+        """
+        Start a local git server.
+
+        In order to support test cases in parallel, select the port the
+        server will listen to in runtime. Since there is no reliable way
+        to allocate the port prior to starting the server (another
+        process in the host machine can use the port between it is
+        selected from a list and it is really allocated to the server)
+        try to start the server in a port and in the case it is already
+        in use, try the next one in the allowed range.
+        """
+        daemon_cmd = ["git", "daemon", "--reuseaddr", "--verbose",
+                      "--listen=localhost", "--export-all",
+                      "--base-path={}".format(self.serveddir)]
+        for port in range(GIT_REMOTE_PORT_INITIAL, GIT_REMOTE_PORT_LAST):
+            port_arg = ["--port={}".format(port)]
+            cmd = daemon_cmd + port_arg
+            self.logfile.write("> starting git remote with '{}'\n"
+                               .format(" ".join(cmd)))
+            self.daemon = pexpect.spawn(cmd[0], cmd[1:], logfile=self.logfile)
+            ret = self.daemon.expect(["Ready to rumble",
+                                      "Address already in use"])
+            if ret == 0:
+                self.port = port
+                break
+        if not self.port:
+            raise SystemError("Could not find a free port to run git remote")
+
+    def stop(self):
+        if self.daemon is None:
+            return
+        self.daemon.terminate(force=True)
diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
new file mode 100644
index 0000000000..994a8afc52
--- /dev/null
+++ b/support/testing/tests/download/test_git.py
@@ -0,0 +1,23 @@
+import os
+
+import infra
+from gitbase import GitTestBase
+
+
+class TestGitHash(GitTestBase):
+    br2_external = infra.filepath("tests/download/br2-external/git-hash")
+
+    def check_hash(self, package):
+        # store downloaded tarball inside the output dir so the test infra
+        # cleans it up at the end
+        env = {"BR2_DL_DIR": os.path.join(self.builddir, "dl"),
+               "GITREMOTE_PORT_NUMBER": str(self.gitremote.port)}
+        self.b.build(["{}-dirclean".format(package),
+                      "{}-source".format(package)],
+                     env)
+
+    def test_run(self):
+        with self.assertRaises(SystemError):
+            self.check_hash("bad")
+        self.check_hash("good")
+        self.check_hash("nohash")
-- 
2.14.2
