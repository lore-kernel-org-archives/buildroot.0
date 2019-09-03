From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:36 -0000
Subject: [Buildroot] [git commit] support/testing: factor out run_cmd_on_host
Message-ID: <20190903133619.3BC4C81413@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=620c98a214dd2acc4b599de46eb959fb4a57b965
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently many test cases call subprocess.check_output on their own.
Factor out that code to an infra method so the call get standardized.

This will be handful when switching the test infra to use Python 3.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/infra/__init__.py            | 13 +++++++++++--
 support/testing/tests/core/test_hardening.py |  6 +-----
 support/testing/tests/fs/test_ext.py         |  6 +-----
 support/testing/tests/fs/test_f2fs.py        |  5 +----
 support/testing/tests/fs/test_jffs2.py       |  6 ++----
 support/testing/tests/fs/test_squashfs.py    |  4 +---
 support/testing/tests/fs/test_ubi.py         |  4 +---
 7 files changed, 18 insertions(+), 26 deletions(-)

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index 1d4d18bbe9..43045d0173 100644
--- a/support/testing/infra/__init__.py
+++ b/support/testing/infra/__init__.py
@@ -55,6 +55,15 @@ def download(dldir, filename):
     return finalpath
 
 
+def run_cmd_on_host(builddir, cmd):
+    """Call subprocess.check_output and return the text output."""
+    out = subprocess.check_output(cmd,
+                                  stderr=open(os.devnull, "w"),
+                                  cwd=builddir,
+                                  env={"LANG": "C"})
+    return out
+
+
 def get_elf_arch_tag(builddir, prefix, fpath, tag):
     """
     Runs the cross readelf on 'fpath', then extracts the value of tag 'tag'.
@@ -66,7 +75,7 @@ def get_elf_arch_tag(builddir, prefix, fpath, tag):
     """
     cmd = ["host/bin/{}-readelf".format(prefix),
            "-A", os.path.join("target", fpath)]
-    out = subprocess.check_output(cmd, cwd=builddir, env={"LANG": "C"})
+    out = run_cmd_on_host(builddir, cmd)
     regexp = re.compile("^  {}: (.*)$".format(tag))
     for line in out.splitlines():
         m = regexp.match(line)
@@ -93,7 +102,7 @@ def get_elf_prog_interpreter(builddir, prefix, fpath):
     """
     cmd = ["host/bin/{}-readelf".format(prefix),
            "-l", os.path.join("target", fpath)]
-    out = subprocess.check_output(cmd, cwd=builddir, env={"LANG": "C"})
+    out = run_cmd_on_host(builddir, cmd)
     regexp = re.compile("^ *\[Requesting program interpreter: (.*)\]$")
     for line in out.splitlines():
         m = regexp.match(line)
diff --git a/support/testing/tests/core/test_hardening.py b/support/testing/tests/core/test_hardening.py
index 4d19b9f96d..edfb3315db 100644
--- a/support/testing/tests/core/test_hardening.py
+++ b/support/testing/tests/core/test_hardening.py
@@ -1,5 +1,4 @@
 import os
-import subprocess
 import json
 
 import infra.basetest
@@ -30,10 +29,7 @@ class TestHardeningBase(infra.basetest.BRTest):
                "--file={}".format(filepath)]
         # Checksec is being used for elf file analysis only.  There are no
         # assumptions of target/run-time checks as part of this testing.
-        ret = subprocess.check_output(cmd,
-                                      stderr=open(os.devnull, "w"),
-                                      cwd=self.builddir,
-                                      env={"LANG": "C"})
+        ret = infra.run_cmd_on_host(self.builddir, cmd)
         return json.loads(ret)
 
 
diff --git a/support/testing/tests/fs/test_ext.py b/support/testing/tests/fs/test_ext.py
index f5f9e9fdf1..16b308cf6d 100644
--- a/support/testing/tests/fs/test_ext.py
+++ b/support/testing/tests/fs/test_ext.py
@@ -1,5 +1,4 @@
 import os
-import subprocess
 
 import infra.basetest
 
@@ -15,10 +14,7 @@ CHECK_FS_TYPE_CMD = "mount | grep '/dev/root on / type {}'"
 
 def dumpe2fs_run(builddir, image):
     cmd = ["host/sbin/dumpe2fs", os.path.join("images", image)]
-    ret = subprocess.check_output(cmd,
-                                  stderr=open(os.devnull, "w"),
-                                  cwd=builddir,
-                                  env={"LANG": "C"})
+    ret = infra.run_cmd_on_host(builddir, cmd)
     return ret.strip().splitlines()
 
 
diff --git a/support/testing/tests/fs/test_f2fs.py b/support/testing/tests/fs/test_f2fs.py
index 819c619a36..950d4cf25b 100644
--- a/support/testing/tests/fs/test_f2fs.py
+++ b/support/testing/tests/fs/test_f2fs.py
@@ -1,5 +1,4 @@
 import os
-import subprocess
 
 import infra.basetest
 
@@ -29,9 +28,7 @@ class TestF2FS(infra.basetest.BRTest):
 
     def test_run(self):
         img = os.path.join(self.builddir, "images", "rootfs.f2fs")
-        out = subprocess.check_output(["host/sbin/dump.f2fs", img],
-                                      cwd=self.builddir,
-                                      env={"LANG": "C"})
+        out = infra.run_cmd_on_host(self.builddir, ["host/sbin/dump.f2fs", img])
         out = out.splitlines()
         prop = dumpf2fs_getprop(out, "Info: total sectors")
         self.assertEqual(prop, "262144 (128 MB)")
diff --git a/support/testing/tests/fs/test_jffs2.py b/support/testing/tests/fs/test_jffs2.py
index 2ff5099180..f5066ff01f 100644
--- a/support/testing/tests/fs/test_jffs2.py
+++ b/support/testing/tests/fs/test_jffs2.py
@@ -1,5 +1,4 @@
 import os
-import subprocess
 
 import infra.basetest
 
@@ -30,9 +29,8 @@ class TestJffs2(infra.basetest.BRTest):
 
     def test_run(self):
         img = os.path.join(self.builddir, "images", "rootfs.jffs2")
-        out = subprocess.check_output(["host/sbin/jffs2dump", "-c", img],
-                                      cwd=self.builddir,
-                                      env={"LANG": "C"})
+        cmd = ["host/sbin/jffs2dump", "-c", img]
+        out = infra.run_cmd_on_host(self.builddir, cmd)
         out = out.splitlines()
         self.assertTrue(jffs2dump_find_file(out, "busybox"))
 
diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
index 066c054342..234f4944be 100644
--- a/support/testing/tests/fs/test_squashfs.py
+++ b/support/testing/tests/fs/test_squashfs.py
@@ -15,9 +15,7 @@ class TestSquashfs(infra.basetest.BRTest):
 
     def test_run(self):
         unsquashfs_cmd = ["host/bin/unsquashfs", "-s", "images/rootfs.squashfs"]
-        out = subprocess.check_output(unsquashfs_cmd,
-                                      cwd=self.builddir,
-                                      env={"LANG": "C"})
+        out = infra.run_cmd_on_host(self.builddir, unsquashfs_cmd)
         out = out.splitlines()
         self.assertEqual(out[0],
                          "Found a valid SQUASHFS 4:0 superblock on images/rootfs.squashfs.")
diff --git a/support/testing/tests/fs/test_ubi.py b/support/testing/tests/fs/test_ubi.py
index e024d417df..7321f83da9 100644
--- a/support/testing/tests/fs/test_ubi.py
+++ b/support/testing/tests/fs/test_ubi.py
@@ -21,9 +21,7 @@ class TestUbi(infra.basetest.BRTest):
     # To be investigated.
     def test_run(self):
         img = os.path.join(self.builddir, "images", "rootfs.ubi")
-        out = subprocess.check_output(["file", img],
-                                      cwd=self.builddir,
-                                      env={"LANG": "C"})
+        out = infra.run_cmd_on_host(self.builddir, ["file", img])
         out = out.splitlines()
         self.assertIn("UBI image, version 1", out[0])
 
