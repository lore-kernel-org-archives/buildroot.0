From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 16 Feb 2014 23:00:01 +0100
Subject: [Buildroot] [PATCH 08/11] python-numpy: add install-staging command
In-Reply-To: <1392588004-13317-1-git-send-email-s.martin49@gmail.com>
References: <1392588004-13317-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1392588004-13317-9-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages may include headers provided by python-numpy package.
So, also install it in the sysroot.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/python-numpy/python-numpy.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index c082045..ff70cfe 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -28,4 +28,21 @@ define PYTHON_NUMPY_CONFIGURE_CMDS
 		echo "    $(lib)" >> $(@D)/site.cfg ;)
 endef
 
+# Some package may include few headers from NumPy, so let's install it in the
+# staging area.
+PYTHON_NUMPY_INSTALL_STAGING = YES
+
+# This install staging commands is an adjusted and simplified version of the
+# install target commands vampirized from the python-package infrastructure.
+#
+# Note that the append '--prefix=...' parameter overrides the one set by the
+# python-package infrastructure in the PYTHON_NUMPY_INSTALL_OPT variable.
+define PYTHON_NUMPY_INSTALL_STAGING_CMDS
+	(cd $(PYTHON_NUMPY_BUILDDIR)/; \
+		$(PYTHON_NUMPY_BASE_ENV) $(PYTHON_NUMPY_ENV) \
+		$(HOST_DIR)/usr/bin/python setup.py install \
+		$(PYTHON_NUMPY_BASE_INSTALL_OPT) \
+		$(PYTHON_NUMPY_INSTALL_OPT) --prefix=$(STAGING_DIR)/usr)
+endef
+
 $(eval $(python-package))
-- 
1.8.5.4
