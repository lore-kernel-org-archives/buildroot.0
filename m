From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sat, 12 Jun 2021 15:08:54 +0200
Subject: [Buildroot] [PATCH] package/python-esptool: bump version to 3.1
Message-ID: <20210612130854.185167-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 ...-wheel-only-when-installing-from-pip.patch | 36 +++++++++++++++++++
 package/python-esptool/python-esptool.hash    |  4 +--
 package/python-esptool/python-esptool.mk      |  4 +--
 3 files changed, 40 insertions(+), 4 deletions(-)
 create mode 100644 package/python-esptool/0001-setup.py-require-wheel-only-when-installing-from-pip.patch

diff --git a/package/python-esptool/0001-setup.py-require-wheel-only-when-installing-from-pip.patch b/package/python-esptool/0001-setup.py-require-wheel-only-when-installing-from-pip.patch
new file mode 100644
index 0000000000..3318fa7b26
--- /dev/null
+++ b/package/python-esptool/0001-setup.py-require-wheel-only-when-installing-from-pip.patch
@@ -0,0 +1,36 @@
+From 3f2746ad05067aad960f7a08e53f6e72c5eecd07 Mon Sep 17 00:00:00 2001
+From: Bartosz Bilas <b.bilas@grinn-global.com>
+Date: Sat, 12 Jun 2021 13:50:15 +0200
+Subject: [PATCH] setup.py: require wheel only when installing from pip
+
+Fix the build from sources (that don't require wheel)
+in environments where this module is not available.
+
+Signed-off-by: Bartosz Bilas <bartosz.bilas@hotmail.com>
+Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
+---
+ Upstream status: https://github.com/espressif/esptool/pull/632
+
+ setup.py | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 2b17b28..1a8421d 100644
+--- a/setup.py
++++ b/setup.py
+@@ -110,7 +110,11 @@ setup(
+         'Programming Language :: Python :: 3.8',
+         'Programming Language :: Python :: 3.9',
+     ],
+-    setup_requires=['wheel'] if sys.version_info[0:2] not in [(3, 4), (3, 5)] else [],
++    setup_requires=(
++        ['wheel']
++        if 'bdist_wheel' in sys.argv and sys.version_info[0:2] not in [(3, 4), (3, 5)] else
++        []
++    ),
+     extras_require={
+         "dev": [
+             'flake8>=3.2.0',
+-- 
+2.32.0
+
diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
index 3b030ec75b..7a707d34c6 100644
--- a/package/python-esptool/python-esptool.hash
+++ b/package/python-esptool/python-esptool.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/esptool/json
-md5	ccd2855e14c298712aeb37ac063baad5  esptool-3.0.tar.gz
-sha256	87953d235fed2c9adb1292b3769df0149686c9afdb1896dd963f730453cbc934  esptool-3.0.tar.gz
+md5	d62d71041896d105d7abd9e9c40f1995  esptool-3.1.tar.gz
+sha256	ec6b943c53b4d71f87f98776333d5b4b99905766898a7002c28a9090b92b2de4  esptool-3.1.tar.gz
 # Locally computed sha256 checksums
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index e9e3eb6b59..92f9bfce18 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ESPTOOL_VERSION = 3.0
+PYTHON_ESPTOOL_VERSION = 3.1
 PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
-PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/dd/3d/d1d4c004927e6e6807c441ce70330ed969c725d2906053fbd2ff994b4439
+PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/9c/c8/28f21b3d3b5e1f1d249be52cdd91793c8c3f7c4f4f255ece7d50984fb05d
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
-- 
2.32.0
