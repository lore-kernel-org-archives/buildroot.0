From: richard.genoud at gmail.com <richard.genoud@gmail.com>
Date: Fri, 21 Jun 2013 13:56:58 +0200
Subject: [Buildroot] [PATCH 2/6] tcl: use make conditions
In-Reply-To: <1371815822-29453-1-git-send-email-y>
References: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
 <1371815822-29453-1-git-send-email-y>
Message-ID: <51c43f9e.ebbbb40a.0abf.ffffba0d@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Richard Genoud <richard.genoud@gmail.com>

As suggested by Thomas Petazzoni, make conditions should be used rather
than shell condition in Makefiles.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 package/tcl/tcl.mk |   21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index ad23b80..2526ca1 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -24,15 +24,22 @@ HOST_TCL_CONF_OPT = \
 
 define TCL_POST_INSTALL_CLEANUP
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libtcl8.4.so
-	-if [ "$(BR2_PACKAGE_TCL_DEL_ENCODINGS)" = "y" ]; then \
-	rm -Rf $(TARGET_DIR)/usr/lib/tcl$(TCL_VERSION_MAJOR)/encoding/*; \
-	fi
-	-if [ "$(BR2_PACKAGE_TCL_TCLSH)" != "y" ]; then \
-	rm -f $(TARGET_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR); \
-	fi
 endef
-
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_POST_INSTALL_CLEANUP
 
+ifeq ($(BR2_PACKAGE_TCL_DEL_ENCODINGS),y)
+define TCL_REMOVE_ENCODINGS
+	rm -rf $(TARGET_DIR)/usr/lib/tcl$(TCL_VERSION_MAJOR)/encoding/*
+endef
+TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_ENCODINGS
+endif
+
+ifneq ($(BR2_PACKAGE_TCL_TCLSH),y)
+define TCL_REMOVE_TCLSH
+	rm -f $(TARGET_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)
+endef
+TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_TCLSH
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.7.10.4
