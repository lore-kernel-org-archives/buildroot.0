From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 14:48:45 +0200
Subject: [Buildroot] [git commit] package/python-txaio: drop python 2 support
Message-ID: <20200411123601.0EA568E509@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7d251293a20e420f14b23c2027238c85c031de0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As of upstream commit 735eb608637e7bbab4082a541ac802cc919fec22,
available since version v20.1.1, support for Python 2.x has been
dropped, and Python >= 3.5 is required. So we make python-txaio depend
on python3, and remove the python2 test of python-txaio.

We also remove the python-six dependency which is no longer used by
txaio, since upstream commit 62b0e7eaa22769687df1de8f57374cb0a42bdc4d.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  1 -
 package/python-txaio/Config.in                     |  2 +-
 support/testing/tests/package/test_python_txaio.py | 11 -----------
 3 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 03ff010fae..31d3dac48d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -496,7 +496,6 @@ tests.package.test_python_treq.TestPythonPy2Treq: { extends: .runtime_test }
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
