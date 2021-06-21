From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Jun 2021 22:34:55 +0200
Subject: [Buildroot] [PATCH 2/2]
 support/testing/tests/package/test_python_augeas: new test
In-Reply-To: <20210621203456.361929-1-thomas.petazzoni@bootlin.com>
References: <20210621203456.361929-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210621203456.361929-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                          |  4 ++++
 .../testing/tests/package/sample_python_augeas.py   |  9 +++++++++
 support/testing/tests/package/test_python_augeas.py | 13 +++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_augeas.py
 create mode 100644 support/testing/tests/package/test_python_augeas.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 06d311a085..9ff590978c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1987,6 +1987,8 @@ F:	configs/galileo_defconfig
 N:	Nicolas Carrier <nicolas.carrier@orolia.com>
 F:	package/php-xdebug/
 F:	package/python-augeas/
+F:	support/testing/tests/package/sample_python_augeas.py
+F:	support/testing/tests/package/test_python_augeas.py
 
 N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 F:	package/libgit2/
@@ -2687,6 +2689,8 @@ F:	package/squashfs/
 F:	package/wayland/
 F:	package/weston/
 F:	support/testing/tests/boot/test_syslinux.py
+F:	support/testing/tests/package/sample_python_augeas.py
+F:	support/testing/tests/package/test_python_augeas.py
 F:	toolchain/
 
 N:	Timo Ketola <timo.ketola@exertus.fi>
diff --git a/support/testing/tests/package/sample_python_augeas.py b/support/testing/tests/package/sample_python_augeas.py
new file mode 100644
index 0000000000..d62afa564e
--- /dev/null
+++ b/support/testing/tests/package/sample_python_augeas.py
@@ -0,0 +1,9 @@
+import augeas
+
+a = augeas.Augeas(root="/")
+hosts = a.match("/files/etc/hosts/*")
+assert(hosts is not None)
+assert(len(hosts) == 2)
+
+assert(a.get("/files/etc/hosts/1/ipaddr") == "127.0.0.1")
+assert(a.get("/files/etc/hosts/1/canonical") == "localhost")
diff --git a/support/testing/tests/package/test_python_augeas.py b/support/testing/tests/package/test_python_augeas.py
new file mode 100644
index 0000000000..c1424668d6
--- /dev/null
+++ b/support/testing/tests/package/test_python_augeas.py
@@ -0,0 +1,13 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonAugeas(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_AUGEAS=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_AUGEAS=y
+        """
+    sample_scripts = ["tests/package/sample_python_augeas.py"]
+    timeout = 60
-- 
2.31.1
