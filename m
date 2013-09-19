From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Thu, 19 Sep 2013 08:51:14 +0200
Subject: [Buildroot] [PATCH] Add lesstif package
Message-ID: <523A9EE2.9050701@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thierry Bultel <thierry.bultel@wanadoo.fr>
---
Adds support for lesstif.
Quite old thing but useful for porting applications based on xmotif
---
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 205079c..c6d48b3 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -12,6 +12,7 @@ if BR2_PACKAGE_XORG7
  		source package/x11r7/xserver_xorg-server/Config.in
  	endmenu
  	menu "X11R7 Libraries"
+		source package/x11r7/lesstif/Config.in
  		source package/x11r7/libxcb/Config.in
  		source package/x11r7/mesa3d/Config.in
  		source package/x11r7/xcb-util/Config.in
diff --git a/package/x11r7/lesstif/Config.in b/package/x11r7/lesstif/Config.in
new file mode 100644
index 0000000..5d7cb11
--- /dev/null
+++ b/package/x11r7/lesstif/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LESSTIF
+        bool "lesstif"
+	select BR2_PACKAGE_XLIB_LIBXP
+        help
+          lesstif is the Hungry Programmers' version of OSF/Motif
+
+          http://lesstif.sourceforge.net/
diff --git a/package/x11r7/lesstif/lesstif.mk b/package/x11r7/lesstif/lesstif.mk
new file mode 100644
index 0000000..ed09581
--- /dev/null
+++ b/package/x11r7/lesstif/lesstif.mk
@@ -0,0 +1,39 @@
+
+#############################################################
+#
+# lesstif
+#
+#############################################################
+LESSTIF_VERSION = 0.95.2
+LESSTIF_SOURCE = lesstif-$(LESSTIF_VERSION).tar.bz2
+LESSTIF_SITE =  http://downloads.sourceforge.net/project/lesstif/lesstif/$(LESSTIF_VERSION)
+LESSTIF_INSTALL_STAGING = YES
+LESSTIF_INSTALL_TARGET = YES
+LESSTIF_DEPENDENCIES = xlib_libXt xlib_libXext
+
+LESSTIF_CONF_OPT = \
+	--with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config	\
+	--with-gnu-ld							\
+	--enable-debug=no						\
+	--enable-production=yes						\
+	--enable-build-tests=no
+
+# Reduces the buggy makefile to the smallest possible (and working) thing
+define LESSTIF_NOMAN2HTML
+	echo "all:" 	> $(@D)/doc/Makefile
+	echo "" 		>> $(@D)/doc/Makefile
+	echo "install:" >> $(@D)/doc/Makefile
+	echo "" 		>> $(@D)/doc/Makefile
+	echo "clean:" 	>> $(@D)/doc/Makefile
+endef
+
+# Remove the ac_find_motif.m4 that is copied on target
+define LESSTIF_FIXACLOCAL
+	rm -rf $(TARGET_DIR)/$(HOME)
+endef
+
+LESSTIF_POST_CONFIGURE_HOOKS += LESSTIF_NOMAN2HTML
+LESSTIF_POST_INSTALL_TARGET_HOOKS += LESSTIF_FIXACLOCAL
+
+$(eval $(autotools-package))
+
