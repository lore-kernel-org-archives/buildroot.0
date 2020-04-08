From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue,  7 Apr 2020 18:09:48 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-autobahn: drop python 2
 support
Message-ID: <20200408000948.52194-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream removed python 2 support so we need to depend on python 3.

Removed python 2 autobahn tests.

Removed python-six dependency which is no longer used by autobahn.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .gitlab-ci.yml                                        |  1 -
 package/python-autobahn/Config.in                     |  3 ++-
 support/testing/tests/package/test_python_autobahn.py | 10 ----------
 3 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d833ce4555..03ff010fae 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -456,7 +456,6 @@ tests.package.test_python_argh.TestPythonPy2Argh: { extends: .runtime_test }
 tests.package.test_python_argh.TestPythonPy3Argh: { extends: .runtime_test }
 tests.package.test_python_attrs.TestPythonPy2Attrs: { extends: .runtime_test }
 tests.package.test_python_attrs.TestPythonPy3Attrs: { extends: .runtime_test }
-tests.package.test_python_autobahn.TestPythonPy2Autobahn: { extends: .runtime_test }
 tests.package.test_python_autobahn.TestPythonPy3Autobahn: { extends: .runtime_test }
 tests.package.test_python_automat.TestPythonPy2Automat: { extends: .runtime_test }
 tests.package.test_python_automat.TestPythonPy3Automat: { extends: .runtime_test }
diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
index ba54d8b12f..78b16897bc 100644
--- a/package/python-autobahn/Config.in
+++ b/package/python-autobahn/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PYTHON_AUTOBAHN
 	bool "python-autobahn"
 	depends on BR2_INSTALL_LIBSTDCPP # python-cryptography -> python-pyasn
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TXAIO # runtime
 	help
 	  WebSocket client and server library, WAMP real-time
@@ -12,3 +12,4 @@ config BR2_PACKAGE_PYTHON_AUTOBAHN
 
 comment "python-autobahn needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_PYTHON3
diff --git a/support/testing/tests/package/test_python_autobahn.py b/support/testing/tests/package/test_python_autobahn.py
index af1f617d6d..a237ce465d 100644
--- a/support/testing/tests/package/test_python_autobahn.py
+++ b/support/testing/tests/package/test_python_autobahn.py
@@ -1,16 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Autobahn(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_AUTOBAHN=y
-        """
-    sample_scripts = ["tests/package/sample_python_autobahn.py"]
-
-
 class TestPythonPy3Autobahn(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
-- 
2.20.1
