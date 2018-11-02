From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri,  2 Nov 2018 01:12:32 -0300
Subject: [Buildroot] [PATCH v2 03/12] support/testing: create intermediate
 class per Python version
In-Reply-To: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
References: <20181102041241.28910-1-ricardo.martincoski@gmail.com>
Message-ID: <20181102041241.28910-4-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently all test cases for python packages add BR2_PACKAGE_PYTHON=y or
BR2_PACKAGE_PYTHON3=y by their own.

Move those configs to two intermediate classes named TestPythonBase2 and
TestPythonBase3, and change all test cases that need those configs to
get them through the new classes.
A few classes still need to inherit directly from TestPythonBase.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
  - new patch to gradually prepare the current python test cases to
    receive the new class TestPythonPackageBase (see review of
    http://patchwork.ozlabs.org/patch/984425/);
---
 support/testing/tests/package/test_ipython.py | 12 ++++-----
 support/testing/tests/package/test_python.py  | 26 ++++++++++++-------
 .../tests/package/test_python_autobahn.py     | 12 ++++-----
 .../tests/package/test_python_cryptography.py | 12 ++++-----
 .../tests/package/test_python_incremental.py  | 12 ++++-----
 .../tests/package/test_python_twisted.py      | 12 ++++-----
 .../tests/package/test_python_txaio.py        | 12 ++++-----
 .../tests/package/test_python_txtorcon.py     | 12 ++++-----
 8 files changed, 51 insertions(+), 59 deletions(-)

diff --git a/support/testing/tests/package/test_ipython.py b/support/testing/tests/package/test_ipython.py
index da2b7f4682..83bbd5c8a0 100644
--- a/support/testing/tests/package/test_ipython.py
+++ b/support/testing/tests/package/test_ipython.py
@@ -1,4 +1,4 @@
-from tests.package.test_python import TestPythonInterpreter, TestPythonBase
+from tests.package.test_python import TestPythonInterpreter, TestPythonBase2, TestPythonBase3
 #
 # The following pythong tests are not being used here:
 #
@@ -17,17 +17,15 @@ class TestIPython(TestPythonInterpreter):
         self.libc_time_test(40)
 
 
-class TestIPythonPy2(TestIPython, TestPythonBase):
-    config = TestPythonBase.config + \
+class TestIPythonPy2(TestIPython, TestPythonBase2):
+    config = TestPythonBase2.config + \
         """
-        BR2_PACKAGE_PYTHON=y
         BR2_PACKAGE_PYTHON_IPYTHON=y
         """
 
 
-class TestIPythonPy3(TestIPython, TestPythonBase):
-    config = TestPythonBase.config + \
+class TestIPythonPy3(TestIPython, TestPythonBase3):
+    config = TestPythonBase3.config + \
         """
-        BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_IPYTHON=y
         """
diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index f9237f719d..e4679233df 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -19,6 +19,20 @@ class TestPythonBase(infra.basetest.BRTest):
         self.emulator.login()
 
 
+class TestPythonBase2(TestPythonBase):
+    config = TestPythonBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        """
+
+
+class TestPythonBase3(TestPythonBase):
+    config = TestPythonBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        """
+
+
 class TestPythonInterpreter():
     version_string = None
 
@@ -53,17 +67,9 @@ class TestPythonInterpreter():
         self.zlib_test()
 
 
-class TestPython2(TestPythonInterpreter, TestPythonBase):
-    config = TestPythonBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        """
+class TestPython2(TestPythonInterpreter, TestPythonBase2):
     version_string = "Python 2"
 
 
-class TestPython3(TestPythonInterpreter, TestPythonBase):
-    config = TestPythonBase.config + \
-        """
-        BR2_PACKAGE_PYTHON3=y
-        """
+class TestPython3(TestPythonInterpreter, TestPythonBase3):
     version_string = "Python 3"
diff --git a/support/testing/tests/package/test_python_autobahn.py b/support/testing/tests/package/test_python_autobahn.py
index 2bc0f0cccf..5e514c24c5 100644
--- a/support/testing/tests/package/test_python_autobahn.py
+++ b/support/testing/tests/package/test_python_autobahn.py
@@ -1,4 +1,4 @@
-from tests.package.test_python import TestPythonBase
+from tests.package.test_python import TestPythonBase, TestPythonBase2, TestPythonBase3
 
 
 class TestPythonAutobahn(TestPythonBase):
@@ -8,10 +8,9 @@ class TestPythonAutobahn(TestPythonBase):
         self.assertEqual(exit_code, 0)
 
 
-class TestPythonPy2Autobahn(TestPythonAutobahn):
-    config = TestPythonBase.config + \
+class TestPythonPy2Autobahn(TestPythonAutobahn, TestPythonBase2):
+    config = TestPythonBase2.config + \
         """
-        BR2_PACKAGE_PYTHON=y
         BR2_PACKAGE_PYTHON_AUTOBAHN=y
         """
 
@@ -20,10 +19,9 @@ class TestPythonPy2Autobahn(TestPythonAutobahn):
         self.import_test()
 
 
-class TestPythonPy3Autobahn(TestPythonAutobahn):
-    config = TestPythonBase.config + \
+class TestPythonPy3Autobahn(TestPythonAutobahn, TestPythonBase3):
+    config = TestPythonBase3.config + \
         """
-        BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_AUTOBAHN=y
         """
 
diff --git a/support/testing/tests/package/test_python_cryptography.py b/support/testing/tests/package/test_python_cryptography.py
index 78c3ef55b3..2a8ce1d8f7 100644
--- a/support/testing/tests/package/test_python_cryptography.py
+++ b/support/testing/tests/package/test_python_cryptography.py
@@ -1,4 +1,4 @@
-from tests.package.test_python import TestPythonBase
+from tests.package.test_python import TestPythonBase, TestPythonBase2, TestPythonBase3
 
 
 class TestPythonCryptography(TestPythonBase):
@@ -10,10 +10,9 @@ class TestPythonCryptography(TestPythonBase):
         self.assertEqual(exit_code, 0)
 
 
-class TestPythonPy2Cryptography(TestPythonCryptography):
-    config = TestPythonBase.config + \
+class TestPythonPy2Cryptography(TestPythonCryptography, TestPythonBase2):
+    config = TestPythonBase2.config + \
         """
-        BR2_PACKAGE_PYTHON=y
         BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
         """
 
@@ -22,10 +21,9 @@ class TestPythonPy2Cryptography(TestPythonCryptography):
         self.fernet_test(40)
 
 
-class TestPythonPy3Cryptography(TestPythonCryptography):
-    config = TestPythonBase.config + \
+class TestPythonPy3Cryptography(TestPythonCryptography, TestPythonBase3):
+    config = TestPythonBase3.config + \
         """
-        BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
         """
 
diff --git a/support/testing/tests/package/test_python_incremental.py b/support/testing/tests/package/test_python_incremental.py
index acf743cdd2..5a98efc666 100644
--- a/support/testing/tests/package/test_python_incremental.py
+++ b/support/testing/tests/package/test_python_incremental.py
@@ -1,4 +1,4 @@
-from tests.package.test_python import TestPythonBase
+from tests.package.test_python import TestPythonBase, TestPythonBase2, TestPythonBase3
 
 
 class TestPythonIncremental(TestPythonBase):
@@ -10,10 +10,9 @@ class TestPythonIncremental(TestPythonBase):
         self.assertEqual(exit_code, 0)
 
 
-class TestPythonPy2Incremental(TestPythonIncremental):
-    config = TestPythonBase.config + \
+class TestPythonPy2Incremental(TestPythonIncremental, TestPythonBase2):
+    config = TestPythonBase2.config + \
         """
-        BR2_PACKAGE_PYTHON=y
         BR2_PACKAGE_PYTHON_INCREMENTAL=y
         """
 
@@ -22,10 +21,9 @@ class TestPythonPy2Incremental(TestPythonIncremental):
         self.str_test()
 
 
-class TestPythonPy3Incremental(TestPythonIncremental):
-    config = TestPythonBase.config + \
+class TestPythonPy3Incremental(TestPythonIncremental, TestPythonBase3):
+    config = TestPythonBase3.config + \
         """
-        BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_INCREMENTAL=y
         """
 
diff --git a/support/testing/tests/package/test_python_twisted.py b/support/testing/tests/package/test_python_twisted.py
index ccee07d61d..74b32fbd62 100644
--- a/support/testing/tests/package/test_python_twisted.py
+++ b/support/testing/tests/package/test_python_twisted.py
@@ -1,4 +1,4 @@
-from tests.package.test_python import TestPythonBase
+from tests.package.test_python import TestPythonBase, TestPythonBase2, TestPythonBase3
 
 TEST_SCRIPT = """
 from twisted.internet import protocol, reactor, endpoints
@@ -30,10 +30,9 @@ class TestPythonTwisted(TestPythonBase):
         self.assertEqual(exit_code, 0)
 
 
-class TestPythonPy2Twisted(TestPythonTwisted):
-    config = TestPythonBase.config + \
+class TestPythonPy2Twisted(TestPythonTwisted, TestPythonBase2):
+    config = TestPythonBase2.config + \
         """
-        BR2_PACKAGE_PYTHON=y
         BR2_PACKAGE_PYTHON_TWISTED=y
         """
 
@@ -42,10 +41,9 @@ class TestPythonPy2Twisted(TestPythonTwisted):
         self.import_test()
 
 
-class TestPythonPy3Twisted(TestPythonTwisted):
-    config = TestPythonBase.config + \
+class TestPythonPy3Twisted(TestPythonTwisted, TestPythonBase3):
+    config = TestPythonBase3.config + \
         """
-        BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_TWISTED=y
         """
 
diff --git a/support/testing/tests/package/test_python_txaio.py b/support/testing/tests/package/test_python_txaio.py
index af93e031b5..6b285fb083 100644
--- a/support/testing/tests/package/test_python_txaio.py
+++ b/support/testing/tests/package/test_python_txaio.py
@@ -1,10 +1,9 @@
-from tests.package.test_python import TestPythonBase
+from tests.package.test_python import TestPythonBase2, TestPythonBase3
 
 
-class TestPythonPy2Txaio(TestPythonBase):
-    config = TestPythonBase.config + \
+class TestPythonPy2Txaio(TestPythonBase2):
+    config = TestPythonBase2.config + \
         """
-        BR2_PACKAGE_PYTHON=y
         BR2_PACKAGE_PYTHON_TXAIO=y
         BR2_PACKAGE_PYTHON_TWISTED=y
         """
@@ -18,10 +17,9 @@ class TestPythonPy2Txaio(TestPythonBase):
         self.assertEqual(exit_code, 0)
 
 
-class TestPythonPy3Txaio(TestPythonBase):
-    config = TestPythonBase.config + \
+class TestPythonPy3Txaio(TestPythonBase3):
+    config = TestPythonBase3.config + \
         """
-        BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_TXAIO=y
         """
 
diff --git a/support/testing/tests/package/test_python_txtorcon.py b/support/testing/tests/package/test_python_txtorcon.py
index 352ff67825..2e10b37c55 100644
--- a/support/testing/tests/package/test_python_txtorcon.py
+++ b/support/testing/tests/package/test_python_txtorcon.py
@@ -1,4 +1,4 @@
-from tests.package.test_python import TestPythonBase
+from tests.package.test_python import TestPythonBase, TestPythonBase2, TestPythonBase3
 
 
 class TestPythonTxtorcon(TestPythonBase):
@@ -8,10 +8,9 @@ class TestPythonTxtorcon(TestPythonBase):
         self.assertEqual(exit_code, 0)
 
 
-class TestPythonPy2Txtorcon(TestPythonTxtorcon):
-    config = TestPythonBase.config + \
+class TestPythonPy2Txtorcon(TestPythonTxtorcon, TestPythonBase2):
+    config = TestPythonBase2.config + \
         """
-        BR2_PACKAGE_PYTHON=y
         BR2_PACKAGE_PYTHON_TXTORCON=y
         """
 
@@ -20,10 +19,9 @@ class TestPythonPy2Txtorcon(TestPythonTxtorcon):
         self.import_test()
 
 
-class TestPythonPy3Txtorcon(TestPythonTxtorcon):
-    config = TestPythonBase.config + \
+class TestPythonPy3Txtorcon(TestPythonTxtorcon, TestPythonBase3):
+    config = TestPythonBase3.config + \
         """
-        BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_TXTORCON=y
         """
 
-- 
2.17.1
