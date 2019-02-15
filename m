From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Feb 2019 22:35:49 +0100
Subject: [Buildroot] [PATCH 2/2] support/testing: introduce specific error
 classes
In-Reply-To: <20190215213549.8476-1-patrickdepinguin@gmail.com>
References: <20190215213549.8476-1-patrickdepinguin@gmail.com>
Message-ID: <20190215213549.8476-2-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Rather than using 'SystemError' with a text string, introduce specific error
classes. These can now be caught specifically, without having to check the
error string, like was done in tests.download.test_scp, or without catching
too much like in the case of tests.download.test_git.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 support/testing/infra/__init__.py           |  3 +++
 support/testing/infra/builder.py            |  4 +--
 support/testing/infra/emulator.py           |  4 +--
 support/testing/infra/exceptions.py         | 27 +++++++++++++++++++++
 support/testing/tests/download/gitremote.py |  2 +-
 support/testing/tests/download/test_git.py  |  6 ++---
 support/testing/tests/download/test_scp.py  |  8 ++----
 support/testing/tests/init/test_none.py     |  4 +--
 support/testing/tests/package/test_rust.py  |  4 +--
 9 files changed, 44 insertions(+), 18 deletions(-)
 create mode 100644 support/testing/infra/exceptions.py

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index e229e90852..0e4b871c8b 100644
--- a/support/testing/infra/__init__.py
+++ b/support/testing/infra/__init__.py
@@ -5,6 +5,9 @@ import tempfile
 import subprocess
 from urllib2 import urlopen, HTTPError, URLError
 
+# make exceptions available to all tests with just 'import infra'
+import infra.exceptions
+
 ARTIFACTS_URL = "http://autobuild.buildroot.net/artefacts/"
 
 
diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
index 018747555d..6cf6551bc5 100644
--- a/support/testing/infra/builder.py
+++ b/support/testing/infra/builder.py
@@ -45,7 +45,7 @@ class Builder(object):
         ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile,
                               env=env)
         if ret != 0:
-            raise SystemError("Cannot olddefconfig")
+            raise infra.exceptions.ConfigurationError("Cannot olddefconfig")
 
     def build(self, make_extra_opts=[], make_extra_env={}):
         """Perform the build.
@@ -72,7 +72,7 @@ class Builder(object):
         ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile,
                               env=env)
         if ret != 0:
-            raise SystemError("Build failed")
+            raise infra.exceptions.BuildError
 
         open(self.stamp_path(), 'a').close()
 
diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 802e89d4b4..5e5fc6c47b 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -84,7 +84,7 @@ class Emulator(object):
                                  timeout=60 * self.timeout_multiplier)
         if index != 0:
             self.logfile.write("==> System does not boot")
-            raise SystemError("System does not boot")
+            raise infra.exceptions.BootError
 
         self.qemu.sendline("root")
         if password:
@@ -92,7 +92,7 @@ class Emulator(object):
             self.qemu.sendline(password)
         index = self.qemu.expect(["# ", pexpect.TIMEOUT])
         if index != 0:
-            raise SystemError("Cannot login")
+            raise infra.exceptions.LoginError
         self.run("dmesg -n 1")
 
     # Run the given 'cmd' with a 'timeout' on the target
diff --git a/support/testing/infra/exceptions.py b/support/testing/infra/exceptions.py
new file mode 100644
index 0000000000..2d32d819e3
--- /dev/null
+++ b/support/testing/infra/exceptions.py
@@ -0,0 +1,27 @@
+"""Custom exception classes for use by the test suite."""
+
+class BootError(Exception):
+    """System does not boot correctly."""
+    pass
+
+
+class LoginError(Exception):
+    """Cannot login to system."""
+    pass
+
+
+class ConfigurationError(Exception):
+    """Cannot set Buildroot configuration."""
+    pass
+
+
+class BuildError(Exception):
+    """Build failed."""
+    pass
+
+
+class TestError(Exception):
+    """Something went wrong while executing a test.
+
+    The exact cause of this problem should be specified by the caller."""
+    pass
diff --git a/support/testing/tests/download/gitremote.py b/support/testing/tests/download/gitremote.py
index 3b35456dd1..874b1ff791 100644
--- a/support/testing/tests/download/gitremote.py
+++ b/support/testing/tests/download/gitremote.py
@@ -38,7 +38,7 @@ class GitRemote(object):
             if ret == 0:
                 self.port = port
                 return
-        raise SystemError("Could not find a free port to run git remote")
+        raise infra.exceptions.TestError("Could not find a free port to run git remote")
 
     def stop(self):
         if self.daemon is None:
diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index 40cf1afe05..1ce676cdd2 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -52,7 +52,7 @@ class TestGitHash(GitTestBase):
     br2_external = [infra.filepath("tests/download/br2-external/git-hash")]
 
     def test_run(self):
-        with self.assertRaises(SystemError):
+        with self.assertRaises(infra.exceptions.BuildError):
             self.check_hash("bad")
         self.check_hash("good")
         self.check_hash("nohash")
@@ -62,9 +62,9 @@ class TestGitRefs(GitTestBase):
     br2_external = [infra.filepath("tests/download/br2-external/git-refs")]
 
     def test_run(self):
-        with self.assertRaises(SystemError):
+        with self.assertRaises(infra.exceptions.BuildError):
             self.check_download("git-wrong-content")
-        with self.assertRaises(SystemError):
+        with self.assertRaises(infra.exceptions.BuildError):
             self.check_download("git-wrong-sha1")
         self.check_download("git-partial-sha1-branch-head")
         self.check_download("git-partial-sha1-reachable-by-branch")
diff --git a/support/testing/tests/download/test_scp.py b/support/testing/tests/download/test_scp.py
index 0cc9ecdd50..908b637af9 100644
--- a/support/testing/tests/download/test_scp.py
+++ b/support/testing/tests/download/test_scp.py
@@ -37,9 +37,5 @@ class TestScpPrimarySite(infra.basetest.BRConfigTest):
             self.b.build(["{}-dirclean".format(package),
                           "{}-source".format(package)],
                          env)
-        except SystemError as e: # FIXME: introduce specific Exception classes
-            if str(e) == 'Build failed':
-                self.assertFalse('Download error, search for ERROR in the log')
-            else:
-                # an unexpected error
-                raise
+        except infra.exceptions.BuildError:
+            self.assertFalse('Download error, search for ERROR in the log')
diff --git a/support/testing/tests/init/test_none.py b/support/testing/tests/init/test_none.py
index 5b9b4e43f1..5c9e8ded03 100644
--- a/support/testing/tests/init/test_none.py
+++ b/support/testing/tests/init/test_none.py
@@ -17,11 +17,11 @@ class TestInitSystemNone(InitSystemBase):
         index = self.emulator.qemu.expect(["/bin/sh: can't access tty; job control turned off", pexpect.TIMEOUT], timeout=60)
         if index != 0:
             self.emulator.logfile.write("==> System does not boot")
-            raise SystemError("System does not boot")
+            raise infra.exceptions.BootError
         index = self.emulator.qemu.expect(["#", pexpect.TIMEOUT], timeout=60)
         if index != 0:
             self.emulator.logfile.write("==> System does not boot")
-            raise SystemError("System does not boot")
+            raise infra.exceptions.BootError
 
         out, exit_code = self.emulator.run("sh -c 'echo $PPID'")
         self.assertEqual(exit_code, 0)
diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
index 9854c3692e..0ab92fddfb 100644
--- a/support/testing/tests/package/test_rust.py
+++ b/support/testing/tests/package/test_rust.py
@@ -37,7 +37,7 @@ class TestRustBase(infra.basetest.BRTest):
                               stderr=self.b.logfile,
                               env=env)
         if ret != 0:
-            raise SystemError("Cargo init failed")
+            raise infra.exceptions.TestError("Cargo init failed")
 
         cmd = [
             cargo, 'build', '-vv', '--target', self.target,
@@ -48,7 +48,7 @@ class TestRustBase(infra.basetest.BRTest):
                               stderr=self.b.logfile,
                               env=env)
         if ret != 0:
-            raise SystemError("Cargo build failed")
+            raise infra.exceptions.TestError("Cargo build failed")
 
         shutil.copy(prog, os.path.join(self.builddir, 'target', 'usr', 'bin'))
         self.b.build()
-- 
2.19.2
