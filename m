From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 11:55:31 +0100
Subject: [Buildroot] [git commit] support/testing: add gst1-python test case
Message-ID: <20200322130150.2061683D71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f9bf6295324b03d321cfa80772911e9322294de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This test case runs a simple pipeline for 100 frames to ensure that
gst1-python works properly.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .gitlab-ci.yml                                     |  1 +
 DEVELOPERS                                         |  1 +
 .../testing/tests/package/sample_gst1_python.py    | 21 ++++++++++++++++
 support/testing/tests/package/test_gst1_python.py  | 29 ++++++++++++++++++++++
 4 files changed, 52 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0869f325da..f5ed95f5e7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -384,6 +384,7 @@ tests.package.test_crudini.TestCrudiniPy3: { extends: .runtime_test }
 tests.package.test_docker_compose.TestDockerCompose: { extends: .runtime_test }
 tests.package.test_dropbear.TestDropbear: { extends: .runtime_test }
 tests.package.test_glxinfo.TestGlxinfo: { extends: .runtime_test }
+tests.package.test_gst1_python.TestGst1Python: { extends: .runtime_test }
 tests.package.test_ipython.TestIPythonPy3: { extends: .runtime_test }
 tests.package.test_libftdi1.TestPythonPy2Libftdi1: { extends: .runtime_test }
 tests.package.test_libftdi1.TestPythonPy3Libftdi1: { extends: .runtime_test }
diff --git a/DEVELOPERS b/DEVELOPERS
index ce4d1f9d6b..aab7d4b18a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -85,6 +85,7 @@ F:	package/setools/
 F:	package/sngrep/
 F:	package/spidermonkey/
 F:	package/systemd/
+F:	support/testing/tests/package/test_gst1_python.py
 F:	support/testing/tests/package/test_python_gobject.py
 
 N:	Adam Heinrich <adam@adamh.cz>
diff --git a/support/testing/tests/package/sample_gst1_python.py b/support/testing/tests/package/sample_gst1_python.py
new file mode 100644
index 0000000000..41eccbe5fd
--- /dev/null
+++ b/support/testing/tests/package/sample_gst1_python.py
@@ -0,0 +1,21 @@
+#!/usr/bin/env python
+"""A simple test that uses gst1-python to run a fake videotestsrc for 100 frames"""
+import sys
+import gi
+import time
+gi.require_version('Gst', '1.0')
+from gi.repository import Gst, GLib
+
+
+def main():
+    # Initializes Gstreamer
+    Gst.init(sys.argv)
+    pipeline = Gst.parse_launch("videotestsrc num-buffers=100 ! autovideosink")
+    bus = pipeline.get_bus()
+    bus.add_signal_watch()
+    pipeline.set_state(Gst.State.PLAYING)
+    loop = GLib.MainLoop()
+    bus.connect("message", on_message, loop)
+    loop.run()
+    pipeline.set_state(Gst.State.EOS)
+    exit(0)
\ No newline at end of file
diff --git a/support/testing/tests/package/test_gst1_python.py b/support/testing/tests/package/test_gst1_python.py
new file mode 100644
index 0000000000..8d6efcbe4a
--- /dev/null
+++ b/support/testing/tests/package/test_gst1_python.py
@@ -0,0 +1,29 @@
+import os
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestGst1Python(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_ARM_EABIHF=y
+        BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
+        BR2_PACKAGE_GOBJECT_INTROSPECTION=y
+        BR2_PACKAGE_GSTREAMER1=y
+        BR2_PACKAGE_GST1_PYTHON=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_GOBJECT=y
+        """
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+    sample_scripts = ["tests/package/sample_gst1_python.py"]
+
