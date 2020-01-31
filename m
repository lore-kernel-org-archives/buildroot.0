From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Jan 2020 08:05:21 +0100
Subject: [Buildroot] [git commit] support/testing: add python-can test case
Message-ID: <20200131065647.7F6F286AC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96bbea75a3ddcb8ff6824a384aedfac82cba77f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml                                     |  2 ++
 DEVELOPERS                                         |  1 +
 support/testing/tests/package/sample_python_can.py |  6 ++++++
 support/testing/tests/package/test_python_can.py   | 23 ++++++++++++++++++++++
 4 files changed, 32 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b953e1998c..d5a2a06b6e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -441,6 +441,8 @@ tests.package.test_python_automat.TestPythonPy3Automat: { extends: .runtime_test
 tests.package.test_python_avro.TestPythonAvro: { extends: .runtime_test }
 tests.package.test_python_bitstring.TestPythonPy2Bitstring: { extends: .runtime_test }
 tests.package.test_python_bitstring.TestPythonPy3Bitstring: { extends: .runtime_test }
+tests.package.test_python_can.TestPythonPy2Can: { extends: .runtime_test }
+tests.package.test_python_can.TestPythonPy3Can: { extends: .runtime_test }
 tests.package.test_python_cbor.TestPythonPy2Cbor: { extends: .runtime_test }
 tests.package.test_python_cbor.TestPythonPy3Cbor: { extends: .runtime_test }
 tests.package.test_python_click.TestPythonPy2Click: { extends: .runtime_test }
diff --git a/DEVELOPERS b/DEVELOPERS
index e0a85579ef..32c28d62fd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2617,6 +2617,7 @@ F:	package/ti-utils/
 F:	package/x11r7/xapp_xconsole/
 F:	package/x11r7/xapp_xinput-calibrator/
 F:	package/zlog/
+F:	support/testing/tests/package/test_python_can.py
 F:	utils/scanpypi
 
 N:	Zoltan Gyarmati <zgyarmati@zgyarmati.de>
diff --git a/support/testing/tests/package/sample_python_can.py b/support/testing/tests/package/sample_python_can.py
new file mode 100644
index 0000000000..c5808be619
--- /dev/null
+++ b/support/testing/tests/package/sample_python_can.py
@@ -0,0 +1,6 @@
+import can
+
+msg = can.Message(arbitration_id=0xc0ffee,
+                  data=[0, 25, 0, 1, 3, 1, 4, 1],
+                  is_extended_id=True)
+assert(msg is not None)
diff --git a/support/testing/tests/package/test_python_can.py b/support/testing/tests/package/test_python_can.py
new file mode 100644
index 0000000000..d509d05dbb
--- /dev/null
+++ b/support/testing/tests/package/test_python_can.py
@@ -0,0 +1,23 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy2Can(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_CAN=y
+        """
+    sample_scripts = ["tests/package/sample_python_can.py"]
+    timeout = 40
+
+
+class TestPythonPy3Can(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_CAN=y
+        """
+    sample_scripts = ["tests/package/sample_python_can.py"]
+    timeout = 40
