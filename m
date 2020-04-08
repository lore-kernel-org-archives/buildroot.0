From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue,  7 Apr 2020 18:19:25 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-txaio: drop python 2 support
Message-ID: <20200408001925.52913-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream removed python 2 support so we need to depend on python 3.

Removed python 2 txaio tests.

Removed python-six dependency which is no longer used by txaio.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .gitlab-ci.yml                                     |  1 -
 package/python-txaio/Config.in                     |  2 +-
 support/testing/tests/package/test_python_txaio.py | 11 -----------
 3 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d833ce4555..3963258628 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -497,7 +497,6 @@ tests.package.test_python_treq.TestPythonPy2Treq: { extends: .runtime_test }
 tests.package.test_python_treq.TestPythonPy3Treq: { extends: .runtime_test }
 tests.package.test_python_twisted.TestPythonPy2Twisted: { extends: .runtime_test }
 tests.package.test_python_twisted.TestPythonPy3Twisted: { extends: .runtime_test }
-tests.package.test_python_txaio.TestPythonPy2Txaio: { extends: .runtime_test }
 tests.package.test_python_txaio.TestPythonPy3Txaio: { extends: .runtime_test }
 tests.package.test_python_txtorcon.TestPythonPy2Txtorcon: { extends: .runtime_test }
 tests.package.test_python_txtorcon.TestPythonPy3Txtorcon: { extends: .runtime_test }
diff --git a/package/python-txaio/Config.in b/package/python-txaio/Config.in
index 9d4238215e..19a318a902 100644
--- a/package/python-txaio/Config.in
+++ b/package/python-txaio/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_TXAIO
 	bool "python-txaio"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Compatibility API between asyncio/Twisted/Trollius.
 
diff --git a/support/testing/tests/package/test_python_txaio.py b/support/testing/tests/package/test_python_txaio.py
index 7bff1bc23c..f1bb2c79a6 100644
--- a/support/testing/tests/package/test_python_txaio.py
+++ b/support/testing/tests/package/test_python_txaio.py
@@ -1,17 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Txaio(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_TXAIO=y
-        BR2_PACKAGE_PYTHON_TWISTED=y
-        """
-    sample_scripts = ["tests/package/sample_python_txaio_twisted.py"]
-
-
 class TestPythonPy3Txaio(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
-- 
2.20.1
