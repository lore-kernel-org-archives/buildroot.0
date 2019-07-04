From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Jul 2019 07:51:45 +0200
Subject: [Buildroot] [git commit] package/python-can: bump to version 3.3.0
Message-ID: <20190704060000.7349B7FC8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1b489fe74f2e5bd7cecc886d6dfde131296578f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://github.com/hardbyte/python-can/releases

Also add a patch removing the pytest-runner dependency.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...require-pytest-runner-only-when-necessary.patch | 49 ++++++++++++++++++++++
 package/python-can/python-can.hash                 |  2 +-
 package/python-can/python-can.mk                   |  4 +-
 3 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/package/python-can/0001-setup.py-require-pytest-runner-only-when-necessary.patch b/package/python-can/0001-setup.py-require-pytest-runner-only-when-necessary.patch
new file mode 100644
index 0000000000..7fda1e3d57
--- /dev/null
+++ b/package/python-can/0001-setup.py-require-pytest-runner-only-when-necessary.patch
@@ -0,0 +1,49 @@
+From 3da4873bcdcb7d8bd47e275b97bbb6f1c134b3b9 Mon Sep 17 00:00:00 2001
+From: Pierre-Jean Texier <pjtexier@koncepto.io>
+Date: Sat, 29 Jun 2019 21:19:08 +0200
+Subject: [PATCH] setup.py: require pytest-runner only when necessary
+
+This optimizes setup.py for cases when pytest-runner is not needed,
+using the approach that is suggested upstream:
+
+https://pypi.python.org/pypi/pytest-runner#conditional-requirement
+
+[Upstream status: https://github.com/hardbyte/python-can/pull/633]
+Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
+---
+ setup.py | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 221c030..6e1778a 100644
+--- a/setup.py
++++ b/setup.py
+@@ -11,6 +11,7 @@ from os import listdir
+ from os.path import isfile, join
+ import re
+ import logging
++import sys
+ from setuptools import setup, find_packages
+ 
+ logging.basicConfig(level=logging.WARNING)
+@@ -40,6 +41,8 @@ tests_require = [
+ 
+ extras_require["test"] = tests_require
+ 
++needs_pytest = {'pytest', 'test', 'ptr'}.intersection(sys.argv)
++pytest_runner = ['pytest-runner'] if needs_pytest else []
+ 
+ setup(
+     # Description
+@@ -96,7 +99,7 @@ setup(
+         'windows-curses;platform_system=="Windows"',
+         "filelock",
+     ],
+-    setup_requires=["pytest-runner"],
++    setup_requires=pytest_runner,
+     extras_require=extras_require,
+     tests_require=tests_require,
+ )
+-- 
+2.7.4
+
diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
index 7e8a07fb4e..813ecf4419 100644
--- a/package/python-can/python-can.hash
+++ b/package/python-can/python-can.hash
@@ -1,4 +1,4 @@
 # sha256 from https://pypi.org/pypi/python-can/json
-sha256	99c06d05f8aa6fa9a84f39a11987c303c030411c3280e39bef0b5cd2242ad09f  python-can-3.1.1.tar.gz
+sha256	2a7e9f658b5db16319bbebb2cdd82b1fc0a390ca939b47829affd07c832357ec  python-can-3.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index 86ece99b08..33449aa451 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CAN_VERSION = 3.1.1
-PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/c1/b0/72d7ed7840692ace5b55dd1155409cd86fd83cee4ded75e3d1102c08750a
+PYTHON_CAN_VERSION = 3.3.0
+PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/9c/1e/a10b6f038a4a4bdd89d13ecc5fba36b71ab716fbd9eae9feda1d975d9504
 PYTHON_CAN_SETUP_TYPE = setuptools
 PYTHON_CAN_LICENSE = LGPL-3.0
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
