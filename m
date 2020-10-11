From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Oct 2020 11:09:30 +0200
Subject: [Buildroot] [PATCH] package/python-pymodbus: drop asyncio files for
 python 2.x to fix pycompile issue
Message-ID: <20201011090930.24271-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pymodbus has optional support for asyncio.  Pycompile unfortunately errors
out on these files when running under Python 2.x:

../scripts/pycompile.py ..
error:   File "/usr/lib/python2.7/site-packages/pymodbus/client/asynchronous/asyncio/__init__.py", line 257
    yield from self._connect()
             ^
SyntaxError: invalid syntax

As a workaround, simply drop the unusable files from TARGET_DIR if building
for python 2.x.

Fixes:
http://autobuild.buildroot.net/results/cc4/cc48927cbe9ae6c2d8b12d65467ec40df82febf6/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pymodbus/python-pymodbus.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index d96e21a55c..9135a4d0c4 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -11,4 +11,13 @@ PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = doc/LICENSE
 
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+# only needed/valid for python 3.x
+define PYTHON_PYMODBUS_RM_PY3_FILES
+	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pymodbus/client/asynchronous/asyncio
+endef
+
+PYTHON_PYMODBUS_POST_INSTALL_TARGET_HOOKS += PYTHON_PYMODBUS_RM_PY3_FILES
+endif
+
 $(eval $(python-package))
-- 
2.20.1
