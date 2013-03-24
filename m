From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 20:39:07 +0100
Subject: [Buildroot] [git commit] xcursor-transparent-theme: new package
Message-ID: <20130324194037.C2ED89B28F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c415c33959d15b5632708c051acb4fcdacaa90a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on work originally done by Aleksandar Zivkovic at
http://patchwork.ozlabs.org/patch/171109/.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/Config.in                            |    1 +
 package/x11r7/xcursor-transparent-theme/Config.in  |    7 ++++
 .../x11r7/xcursor-transparent-theme/index.theme    |    2 +
 ...cursor-transparent-theme-0001-fix-symlink.patch |   37 ++++++++++++++++++++
 .../xcursor-transparent-theme.mk                   |   18 +++++++++
 5 files changed, 65 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 5d0f991..7b32ac7 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -268,6 +268,7 @@ if BR2_PACKAGE_XORG7
 	menu "X11R7 Other data"
 		source package/x11r7/xdata_xbitmaps/Config.in
 		source package/x11r7/xdata_xcursor-themes/Config.in
+		source package/x11r7/xcursor-transparent-theme/Config.in
 		source package/x11r7/xkeyboard-config/Config.in
 	endmenu
 endif
diff --git a/package/x11r7/xcursor-transparent-theme/Config.in b/package/x11r7/xcursor-transparent-theme/Config.in
new file mode 100644
index 0000000..8282db8
--- /dev/null
+++ b/package/x11r7/xcursor-transparent-theme/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XCURSOR_TRANSPARENT_THEME
+	bool "xcursor-transparent-theme"
+	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	help
+	  Completely transparent theme for hiding the X11 cursor.
+
+	  No upstream site.
diff --git a/package/x11r7/xcursor-transparent-theme/index.theme b/package/x11r7/xcursor-transparent-theme/index.theme
new file mode 100644
index 0000000..5300850
--- /dev/null
+++ b/package/x11r7/xcursor-transparent-theme/index.theme
@@ -0,0 +1,2 @@
+[Icon Theme]
+Inherits=xcursor-transparent
diff --git a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme-0001-fix-symlink.patch b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme-0001-fix-symlink.patch
new file mode 100644
index 0000000..9cf351f
--- /dev/null
+++ b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme-0001-fix-symlink.patch
@@ -0,0 +1,37 @@
+Do not symlink to a host directory
+
+The installation of xcursor-transparent-theme creates many symbolic
+links to the 'transp' cursor file, but it does so using an absolute
+directory, that happens to point to the installation location, which
+is incorrect when cross-compiling.
+
+Also add the -f option so that the package can be reinstalled even if
+it has already been installed.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/cursors/Makefile.am
+===================================================================
+--- a/cursors/Makefile.am
++++ b/cursors/Makefile.am
+@@ -91,6 +91,6 @@
+ 	$(INSTALL_DATA) $(CURSOR_REAL) $(DESTDIR)$(CURSOR_DIR)/ 
+ 	for CURSOR in $(CURSOR_NAMES); do \
+ 		echo '-- Installing cursor '$$CURSOR; \
+-		ln -s $(DESTDIR)$(CURSOR_DIR)/transp $(DESTDIR)$(CURSOR_DIR)/$$CURSOR; \
++		ln -sf transp $(DESTDIR)$(CURSOR_DIR)/$$CURSOR; \
+ 	done
+ 
+Index: b/cursors/Makefile.in
+===================================================================
+--- a/cursors/Makefile.in
++++ b/cursors/Makefile.in
+@@ -177,7 +177,7 @@
+ 	$(INSTALL_DATA) $(CURSOR_REAL) $(DESTDIR)$(CURSOR_DIR)/ 
+ 	for CURSOR in $(CURSOR_NAMES); do \
+ 		echo '-- Installing cursor '$$CURSOR; \
+-		ln -s $(DESTDIR)$(CURSOR_DIR)/transp $(DESTDIR)$(CURSOR_DIR)/$$CURSOR; \
++		ln -sf transp $(DESTDIR)$(CURSOR_DIR)/$$CURSOR; \
+ 	done
+ 
+ # Tell versions [3.59,3.63) of GNU make to not export all variables.
diff --git a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
new file mode 100644
index 0000000..3ad985b
--- /dev/null
+++ b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# xcursor-transparent-theme - No description available
+#
+#############################################################
+
+XCURSOR_TRANSPARENT_THEME_VERSION = 0.1.1
+XCURSOR_TRANSPARENT_THEME_SITE = http://downloads.yoctoproject.org/releases/matchbox/utils/
+XCURSOR_TRANSPARENT_THEME_DEPENDENCIES = xlib_libXcursor host-xapp_xcursorgen
+
+define ICONS_DEFAULT_CONFIG_INSTALL
+        $(INSTALL) -m 0755 -D package/x11r7/xcursor-transparent-theme/index.theme \
+		$(TARGET_DIR)/usr/share/icons/default/index.theme
+endef
+
+XCURSOR_TRANSPARENT_THEME_POST_INSTALL_TARGET_HOOKS += ICONS_DEFAULT_CONFIG_INSTALL
+
+$(eval $(autotools-package))
