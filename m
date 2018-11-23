From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 22:05:46 +0100
Subject: [Buildroot] [git commit] support/testing: add python-automat tests
Message-ID: <20181202071557.CBE89815BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66f99555ed29f8f615da85e61ea11d8ad7f159ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use a minimal script to check the basic usage by creating and using a
small state machine.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  2 ++
 .../testing/tests/package/sample_python_automat.py | 27 ++++++++++++++++++++++
 .../testing/tests/package/test_python_automat.py   | 23 ++++++++++++++++++
 3 files changed, 52 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 494894a782..7f311f74cf 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -322,6 +322,8 @@ tests.package.test_python_attrs.TestPythonPy2Attrs: *runtime_test
 tests.package.test_python_attrs.TestPythonPy3Attrs: *runtime_test
 tests.package.test_python_autobahn.TestPythonPy2Autobahn: *runtime_test
 tests.package.test_python_autobahn.TestPythonPy3Autobahn: *runtime_test
+tests.package.test_python_automat.TestPythonPy2Automat: *runtime_test
+tests.package.test_python_automat.TestPythonPy3Automat: *runtime_test
 tests.package.test_python_crossbar.TestPythonPy3Crossbar: *runtime_test
 tests.package.test_python_cryptography.TestPythonPy2Cryptography: *runtime_test
 tests.package.test_python_cryptography.TestPythonPy3Cryptography: *runtime_test
diff --git a/support/testing/tests/package/sample_python_automat.py b/support/testing/tests/package/sample_python_automat.py
new file mode 100644
index 0000000000..baf536f993
--- /dev/null
+++ b/support/testing/tests/package/sample_python_automat.py
@@ -0,0 +1,27 @@
+from automat import MethodicalMachine
+
+
+class Led(object):
+    _machine = MethodicalMachine()
+
+    @_machine.state()
+    def led_on(self):
+        "led is on"
+
+    @_machine.state(initial=True)
+    def led_off(self):
+        "led is off"
+
+    @_machine.input()
+    def turn_on(self):
+        "turn the led on"
+
+    @_machine.output()
+    def _light(self):
+        print("light")
+
+    led_off.upon(turn_on, enter=led_on, outputs=[_light])
+
+
+led = Led()
+led.turn_on()
diff --git a/support/testing/tests/package/test_python_automat.py b/support/testing/tests/package/test_python_automat.py
new file mode 100644
index 0000000000..00a7ed6526
--- /dev/null
+++ b/support/testing/tests/package/test_python_automat.py
@@ -0,0 +1,23 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy2Automat(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_AUTOMAT=y
+        """
+    sample_scripts = ["tests/package/sample_python_automat.py"]
+    timeout = 30
+
+
+class TestPythonPy3Automat(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_AUTOMAT=y
+        """
+    sample_scripts = ["tests/package/sample_python_automat.py"]
+    timeout = 30
