From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jul 2013 16:19:53 +0200
Subject: [Buildroot] [git commit] tcl: use make conditions
Message-ID: <20130728142001.1134A9ACCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=224187cc7c03edc0018d250e7ac5dbb694f4bd89
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by Thomas Petazzoni, make conditions should be used rather
than shell condition in Makefiles.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tcl/tcl.mk |   21 ++++++++++++++-------
 1 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 4528d54..7c08ee6 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -24,15 +24,22 @@ HOST_TCL_CONF_OPT = \
 
 define TCL_POST_INSTALL_CLEANUP
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libtcl8.4.so
-	-if [ "$(BR2_PACKAGE_TCL_DEL_ENCODINGS)" = "y" ]; then \
-	rm -Rf $(TARGET_DIR)/usr/lib/tcl$(TCL_VERSION_MAJOR)/encoding/*; \
-	fi
-	-if [ "$(BR2_PACKAGE_TCL_SHLIB_ONLY)" = "y" ]; then \
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
+ifeq ($(BR2_PACKAGE_TCL_SHLIB_ONLY),y)
+define TCL_REMOVE_TCLSH
+	rm -f $(TARGET_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)
+endef
+TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_TCLSH
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
