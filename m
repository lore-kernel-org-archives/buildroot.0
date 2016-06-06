From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Jun 2016 21:42:54 +0200
Subject: [Buildroot] [git commit] python-serial: fix Python 2.7.x related
	compilation error
Message-ID: <20160606195009.1338D818FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=042a79f0738cf432c622c1099942b36863663ae8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

aio.py is an experimental module, that is compatible with
Python 3 only, so remove it for Python 2 environment or it
will cause compilation errors.

Fixes:
http://autobuild.buildroot.org/results/f26/f26351da925d6ef3adea8053dc7fc24061554daf/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
