From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 15 Mar 2020 13:10:33 -0700
Subject: [Buildroot] [PATCH 6/6] support/testing: add gst1-python test case
In-Reply-To: <20200315201034.1552960-1-aduskett@gmail.com>
References: <20200315201034.1552960-1-aduskett@gmail.com>
Message-ID: <20200315201034.1552960-6-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

This test case runs a simple pipeline for 100 frames to ensure that
gst1-python works properly.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 .gitlab-ci.yml                                |  1 +
 DEVELOPERS                                    |  1 +
 .../tests/package/sample_gst1_python.py       | 21 ++++++++++++++
 .../testing/tests/package/test_gst1_python.py | 29 +++++++++++++++++++
 4 files changed, 52 insertions(+)
 create mode 100644 support/testing/tests/package/sample_gst1_python.py
 create mode 100644 support/testing/tests/package/test_gst1_python.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4b84a5b709..e6363014e9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -383,6 +383,7 @@ tests.package.test_crudini.TestCrudiniPy3: { extends: .runtime_test }
 tests.package.test_docker_compose.TestDockerCompose: { extends: .runtime_test }
 tests.package.test_dropbear.TestDropbear: { extends: .runtime_test }
 tests.package.test_glxinfo.TestGlxinfo: { extends: .runtime_test }
+tests.package.test_gst1_python.TestGst1Python: { extends: .runtime_test }
 tests.package.test_ipython.TestIPythonPy3: { extends: .runtime_test }
 tests.package.test_libftdi1.TestPythonPy2Libftdi1: { extends: .runtime_test }
 tests.package.test_libftdi1.TestPythonPy3Libftdi1: { extends: .runtime_test }
diff --git a/DEVELOPERS b/DEVELOPERS
index 36b7f618aa..ec33506c08 100644
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
-- 
2.24.1
