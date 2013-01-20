From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 21:37:40 +0100
Subject: [Buildroot] [git commit] python3: Handle properly the pyc and py
	files on the target
Message-ID: <20130120203920.1265F9A500@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ffab129a3ebc76caf7ae40caf1f6b0185f3e114
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #5690

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python3/python3.mk |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 0d54162..e7c0983 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -155,5 +155,27 @@ endef
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
