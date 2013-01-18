From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 18 Jan 2013 15:06:14 +0100
Subject: [Buildroot] [PATCH 3/3] python3: Handle properly the pyc and py
	files on the target
In-Reply-To: <1358517974-30956-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1358517974-30956-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <1358517974-30956-3-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes #5690

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/python3/python3.mk |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index c7e70f6..f62ed43 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -162,5 +162,27 @@ endef
 ifneq ($(BR2_PACKAGE_PYTHON),y)
 PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_INSTALL_SYMLINK
 endif
+
+ifeq ($(BR2_PACKAGE_PYTHON3_PY_ONLY),y)
+define PYTHON3_REMOVE_MODULES_FILES
+	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) \
+		 -name __pycache__` ; do \
+		rm -rf $$i ; \
+	done
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
+define PYTHON3_REMOVE_MODULES_FILES
+	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) \
+		 -name *.py` ; do \
+		rm -f $$i ; \
+	done
+endef
+endif
+
+PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_REMOVE_MODULES_FILES
+
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.7.10.4
