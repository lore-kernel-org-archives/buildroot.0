From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon,  6 Jun 2016 13:30:11 +0200
Subject: [Buildroot] [PATCH] python-serial: fix Python 2.7.x related
	compilation error
Message-ID: <1465212611-2210-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

aio.py is an experimental module, that is compatible with
Python 3 only, so remove it for Python 2 environment or it
will cause compilation errors.

Fixes:
http://autobuild.buildroot.org/results/f26/f26351da925d6ef3adea8053dc7fc24061554daf/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-serial/python-serial.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/python-serial/python-serial.mk b/package/python-serial/python-serial.mk
index 696e207..4b3ffad 100644
--- a/package/python-serial/python-serial.mk
+++ b/package/python-serial/python-serial.mk
@@ -11,4 +11,14 @@ PYTHON_SERIAL_LICENSE = Python Software Foundation License
 PYTHON_SERIAL_LICENSE_FILES = LICENSE.txt
 PYTHON_SERIAL_SETUP_TYPE = setuptools
 
+# aio.py is an experimental module, that is compatible only with
+# Python 3, so remove it for Python 2 environment or it will
+# cause compilation errors
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+define PYTHON_SERIAL_REMOVE_AIO_PY
+	rm $(@D)/serial/aio.py
+endef
+PYTHON_SERIAL_POST_EXTRACT_HOOKS = PYTHON_SERIAL_REMOVE_AIO_PY
+endif
+
 $(eval $(python-package))
-- 
2.1.4
