From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 26 Aug 2017 19:20:54 -0300
Subject: [Buildroot] [next v2 5/7] testing/tests/download: add git hash tests
In-Reply-To: <20170826222056.6119-1-ricardo.martincoski@gmail.com>
References: <20170826222056.6119-1-ricardo.martincoski@gmail.com>
Message-ID: <20170826222056.6119-5-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

Add three test cases for hash of a git package:
 - correct hash;
 - wrong hash;
 - no hash file.

Besides the Python script, add some fixtures used during the tests:
 - a br2-external (git-hash) with one package for each test case;
 - a static git bare repo (repo.git) to be served using GitRemote class
   for all these test cases.

Neither the br2-external nor the check hash functionalities are the
subject of these tests per se, so for simplicity limit the check to the
error codes and don't look for the messages in the log.

Thanks to Arnout for the hint about how to add a bare repo to test.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
Changes v1 -> v2:
  - new patch
---
 .gitlab-ci.yml                                     |   3 ++
 .../tests/download/br2-external/git-hash/Config.in |   0
 .../download/br2-external/git-hash/external.desc   |   1 +
 .../download/br2-external/git-hash/external.mk     |   1 +
 .../br2-external/git-hash/package/bad/bad.hash     |   1 +
 .../br2-external/git-hash/package/bad/bad.mk       |  12 ++++++++
 .../br2-external/git-hash/package/good/good.hash   |   1 +
 .../br2-external/git-hash/package/good/good.mk     |  12 ++++++++
 .../br2-external/git-hash/package/nohash/nohash.mk |  12 ++++++++
 .../download/git-remote/repo.git/.gitattributes    |   1 +
 .../tests/download/git-remote/repo.git/HEAD        |   1 +
 .../tests/download/git-remote/repo.git/config      |   4 +++
 .../12/33c8f882d130978246a30da75892321f13e5bb      | Bin 0 -> 49 bytes
 .../74/46f8dab6cdb166aaf130aa88633dc627a4e8ad      | Bin 0 -> 153 bytes
 .../8e/27be7d6154a1f68ea9160ef0e18691d20560dc      | Bin 0 -> 20 bytes
 .../download/git-remote/repo.git/refs/heads/master |   1 +
 support/testing/tests/download/test_git_hash.py    |  34 +++++++++++++++++++++
 17 files changed, 84 insertions(+)
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
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/12/33c8f882d130978246a30da75892321f13e5bb
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/74/46f8dab6cdb166aaf130aa88633dc627a4e8ad
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/8e/27be7d6154a1f68ea9160ef0e18691d20560dc
 create mode 100644 support/testing/tests/download/git-remote/repo.git/refs/heads/master
 create mode 100644 support/testing/tests/download/test_git_hash.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fb50692976..98022b6d7f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -219,6 +219,9 @@ tests.core.test_rootfs_overlay.TestRootfsOverlay: *runtime_test
 tests.core.test_timezone.TestGlibcAllTimezone: *runtime_test
 tests.core.test_timezone.TestGlibcNonDefaultLimitedTimezone: *runtime_test
 tests.core.test_timezone.TestNoTimezone: *runtime_test
+tests.download.test_git_hash.TestGitBadHash: *runtime_test
+tests.download.test_git_hash.TestGitGoodHash: *runtime_test
+tests.download.test_git_hash.TestGitNoHash: *runtime_test
 tests.fs.test_ext.TestExt2: *runtime_test
 tests.fs.test_ext.TestExt2r1: *runtime_test
 tests.fs.test_ext.TestExt3: *runtime_test
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
index 0000000000..b69746e06e
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-hash/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_GIT_HASH_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
new file mode 100644
index 0000000000..90bfb63085
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
@@ -0,0 +1 @@
+sha256  0000000000000000000000000000000000000000000000000000000000000000  bad-7446f8dab6cdb166aaf130aa88633dc627a4e8ad.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-hash/package/bad/bad.mk b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.mk
new file mode 100644
index 0000000000..2ad06fa47f
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# bad
+#
+################################################################################
+
+BAD_VERSION = 7446f8dab6cdb166aaf130aa88633dc627a4e8ad
+# Get the git server port number from the test infra
+GITREMOTE_PORT_NUMBER ?= 9418
+BAD_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-hash/package/good/good.hash b/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
new file mode 100644
index 0000000000..ccb2efbffe
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
@@ -0,0 +1 @@
+sha256  9302294b11ac6742c97eec6b7fd677fc3ac79b3f9348fbb1a46ba3ccb5287f9f  good-7446f8dab6cdb166aaf130aa88633dc627a4e8ad.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-hash/package/good/good.mk b/support/testing/tests/download/br2-external/git-hash/package/good/good.mk
new file mode 100644
index 0000000000..0e82e0e6c6
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-hash/package/good/good.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# good
+#
+################################################################################
+
+GOOD_VERSION = 7446f8dab6cdb166aaf130aa88633dc627a4e8ad
+# Get the git server port number from the test infra
+GITREMOTE_PORT_NUMBER ?= 9418
+GOOD_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-hash/package/nohash/nohash.mk b/support/testing/tests/download/br2-external/git-hash/package/nohash/nohash.mk
new file mode 100644
index 0000000000..4e3943211c
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-hash/package/nohash/nohash.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# nohash
+#
+################################################################################
+
+NOHASH_VERSION = 7446f8dab6cdb166aaf130aa88633dc627a4e8ad
+# Get the git server port number from the test infra
+GITREMOTE_PORT_NUMBER ?= 9418
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
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/12/33c8f882d130978246a30da75892321f13e5bb b/support/testing/tests/download/git-remote/repo.git/objects/12/33c8f882d130978246a30da75892321f13e5bb
new file mode 100644
index 0000000000000000000000000000000000000000..9f711b51ca36f85619d9cff0226e163f84a9d232
GIT binary patch
literal 49
zcmb<m)YkO!4K*-JGB7bPFg6VIIDN)5^+oXg@YxcZK1AR5GTg_{e_Jgs$#(}c19v6=
Fb^xfh5%K^4

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/74/46f8dab6cdb166aaf130aa88633dc627a4e8ad b/support/testing/tests/download/git-remote/repo.git/objects/74/46f8dab6cdb166aaf130aa88633dc627a4e8ad
new file mode 100644
index 0000000000000000000000000000000000000000..f25a70acdb1fe93d61fa64cee624b3eaee653adf
GIT binary patch
literal 153
zcmV;K0A~Mq0j<ux4Z<)GKw)Z6aSJ4}eKD~SLM%W76I}cQC*oK#reJ#_QP3mWuXuXC
z<jf89=r*m!2udS*o2=DAp>(6w!<JA68jW=twMq)3nI=Kcb}JRm?5TzVC#sDXUmkac
zef?mczj(Z6;<@)FA3zPx8Dpg}&`Fe1th!FL_@|tp5Fqg!g}Cr_iJ>bgb<=D2%dL0=
HR6}0pH2X&9

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/8e/27be7d6154a1f68ea9160ef0e18691d20560dc b/support/testing/tests/download/git-remote/repo.git/objects/8e/27be7d6154a1f68ea9160ef0e18691d20560dc
new file mode 100644
index 0000000000000000000000000000000000000000..a8e78a9d1b29e6afe9554cd3ac26c33ab697b782
GIT binary patch
literal 20
bcmb<m^geacKgb|e!*i|1Lna2vt;|ONPIm`P

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/refs/heads/master b/support/testing/tests/download/git-remote/repo.git/refs/heads/master
new file mode 100644
index 0000000000..0180a4d15f
--- /dev/null
+++ b/support/testing/tests/download/git-remote/repo.git/refs/heads/master
@@ -0,0 +1 @@
+7446f8dab6cdb166aaf130aa88633dc627a4e8ad
diff --git a/support/testing/tests/download/test_git_hash.py b/support/testing/tests/download/test_git_hash.py
new file mode 100644
index 0000000000..1d483844fa
--- /dev/null
+++ b/support/testing/tests/download/test_git_hash.py
@@ -0,0 +1,34 @@
+import os
+
+import infra
+from gitbase import GitTestBase
+
+
+class TestGitHash(GitTestBase):
+    br2_external = infra.filepath("tests/download/br2-external/git-hash")
+    serveddir = infra.filepath("tests/download/git-remote")
+
+    def check_hash(self, package):
+        # store downloaded tarball inside the output dir so the test infra
+        # cleans it up@the end
+        env = {"BR2_DL_DIR": os.path.join(self.builddir, "dl"),
+               "GITREMOTE_PORT_NUMBER": str(self.gitremote.port)}
+        self.b.build(["{}-dirclean".format(package),
+                      "{}-source".format(package)],
+                     env, self.logfile)
+
+
+class TestGitGoodHash(TestGitHash):
+    def test_run(self):
+        self.check_hash("good")
+
+
+class TestGitBadHash(TestGitHash):
+    def test_run(self):
+        with self.assertRaises(SystemError):
+            self.check_hash("bad")
+
+
+class TestGitNoHash(TestGitHash):
+    def test_run(self):
+        self.check_hash("nohash")
-- 
2.13.0
