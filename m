From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 4 Feb 2019 16:52:58 +0100
Subject: [Buildroot] [git commit] testing/tests/download: add git hash test
Message-ID: <20190204155230.9917783A4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f284b5e7a1618f0f3f2eec0876a0da8d5848b0fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[Arnout: split long line; reorder imports to satisfy flake8]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml                                     |   1 +
 support/testing/tests/download/__init__.py         |   0
 .../tests/download/br2-external/git-hash/Config.in |   0
 .../download/br2-external/git-hash/external.desc   |   1 +
 .../download/br2-external/git-hash/external.mk     |   4 ++
 .../br2-external/git-hash/package/bad/bad.hash     |   1 +
 .../br2-external/git-hash/package/bad/bad.mk       |  10 +++++
 .../br2-external/git-hash/package/good/good.hash   |   1 +
 .../br2-external/git-hash/package/good/good.mk     |  10 +++++
 .../br2-external/git-hash/package/nohash/nohash.mk |  10 +++++
 .../download/git-remote/repo.git/.gitattributes    |   1 +
 .../tests/download/git-remote/repo.git/HEAD        |   1 +
 .../tests/download/git-remote/repo.git/config      |   4 ++
 .../99/f2e3e1cb15f9b52fa29f66d380dda061d917ab      | Bin 0 -> 49 bytes
 .../a2/38b1dfcd825d47d834af3c5223417c8411d90d      |   1 +
 .../e7/9c5e8f964493290a409888d5413a737e8e5dd5      | Bin 0 -> 23 bytes
 .../download/git-remote/repo.git/refs/heads/master |   1 +
 support/testing/tests/download/gitremote.py        |  46 +++++++++++++++++++++
 support/testing/tests/download/test_git.py         |  44 ++++++++++++++++++++
 19 files changed, 136 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 8f1e4ae804..6a5a679594 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -291,6 +291,7 @@ tests.core.test_rootfs_overlay.TestRootfsOverlay: *runtime_test
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
index 0000000000..9db72668cf
Binary files /dev/null and b/support/testing/tests/download/git-remote/repo.git/objects/99/f2e3e1cb15f9b52fa29f66d380dda061d917ab differ
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/a2/38b1dfcd825d47d834af3c5223417c8411d90d b/support/testing/tests/download/git-remote/repo.git/objects/a2/38b1dfcd825d47d834af3c5223417c8411d90d
new file mode 100644
index 0000000000..31b6bcf34d
--- /dev/null
+++ b/support/testing/tests/download/git-remote/repo.git/objects/a2/38b1dfcd825d47d834af3c5223417c8411d90d
@@ -0,0 +1 @@
+x??M? @a??b.???b??n??_??@????6q????/???????????(???BEc??(MG?L?{???Fh???^*\?a?.XeW??~?O_<?	i?]I'?k???????s??6???r?25????9????????Y?l?`C
\ No newline@end of file
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/e7/9c5e8f964493290a409888d5413a737e8e5dd5 b/support/testing/tests/download/git-remote/repo.git/objects/e7/9c5e8f964493290a409888d5413a737e8e5dd5
new file mode 100644
index 0000000000..df2037a2d2
Binary files /dev/null and b/support/testing/tests/download/git-remote/repo.git/objects/e7/9c5e8f964493290a409888d5413a737e8e5dd5 differ
diff --git a/support/testing/tests/download/git-remote/repo.git/refs/heads/master b/support/testing/tests/download/git-remote/repo.git/refs/heads/master
new file mode 100644
index 0000000000..b6bccc1c17
--- /dev/null
+++ b/support/testing/tests/download/git-remote/repo.git/refs/heads/master
@@ -0,0 +1 @@
+a238b1dfcd825d47d834af3c5223417c8411d90d
diff --git a/support/testing/tests/download/gitremote.py b/support/testing/tests/download/gitremote.py
new file mode 100644
index 0000000000..a6e69a1ef1
--- /dev/null
+++ b/support/testing/tests/download/gitremote.py
@@ -0,0 +1,46 @@
+# subprocess does not kill the child daemon when a test case fails by raising
+# an exception. So use pexpect instead.
+import infra
+
+import pexpect
+
+
+GIT_REMOTE_PORT_INITIAL = 9418
+GIT_REMOTE_PORT_LAST = GIT_REMOTE_PORT_INITIAL + 99
+
+
+class GitRemote(object):
+    def __init__(self, builddir, serveddir, logtofile):
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
+        self.daemon = None
+        self.port = None
+        self.logfile = infra.open_log_file(builddir, "gitremote", logtofile)
+
+        daemon_cmd = ["git", "daemon", "--reuseaddr", "--verbose", 
+                      "--listen=localhost", "--export-all", 
+                      "--base-path={}".format(serveddir)]
+        for port in range(GIT_REMOTE_PORT_INITIAL, GIT_REMOTE_PORT_LAST + 1):
+            cmd = daemon_cmd + ["--port={port}".format(port=port)]
+            self.logfile.write("> starting git remote with '{}'\n".format(" ".join(cmd)))
+            self.daemon = pexpect.spawn(cmd[0], cmd[1:], logfile=self.logfile)
+            ret = self.daemon.expect(["Ready to rumble",
+                                      "Address already in use"])
+            if ret == 0:
+                self.port = port
+                return
+        raise SystemError("Could not find a free port to run git remote")
+
+    def stop(self):
+        if self.daemon is None:
+            return
+        self.daemon.terminate(force=True)
diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
new file mode 100644
index 0000000000..156784dc9c
--- /dev/null
+++ b/support/testing/tests/download/test_git.py
@@ -0,0 +1,44 @@
+import os
+
+from gitremote import GitRemote
+
+import infra
+
+
+class GitTestBase(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_BACKUP_SITE=""
+        """
+    gitremotedir = infra.filepath("tests/download/git-remote")
+    gitremote = None
+
+    def setUp(self):
+        super(GitTestBase, self).setUp()
+        self.gitremote = GitRemote(self.builddir, self.gitremotedir, self.logtofile)
+
+    def tearDown(self):
+        self.show_msg("Cleaning up")
+        if self.gitremote:
+            self.gitremote.stop()
+        if self.b and not self.keepbuilds:
+            self.b.delete()
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
+
+class TestGitHash(GitTestBase):
+    br2_external = [infra.filepath("tests/download/br2-external/git-hash")]
+
+    def test_run(self):
+        with self.assertRaises(SystemError):
+            self.check_hash("bad")
+        self.check_hash("good")
+        self.check_hash("nohash")
