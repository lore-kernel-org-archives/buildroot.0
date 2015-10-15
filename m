From: James Knight <james.knight@rockwellcollins.com>
Date: Thu, 15 Oct 2015 13:03:03 -0400
Subject: [Buildroot] [PATCH v4 1/1] yad: new package
Message-ID: <1444928583-2144-1-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
Changes v3 -> v4:
  - Add missing libglib2 dependencies (pointed out by Vicente Olivert
     Riera).
  - Cleanup YAD help description to maximize the 72-character limit
     space (suggested by Vicente Olivert Riera).

Changes v2 -> v3:
  - Increment to version 0.31.1 (removed need for HTML patch introduced
     in v2 change; suggested by Vicente Olivert Riera).

Changes v1 -> v2:
  - Increment to version 0.29.0 (with updated hash and patch fix).
  - Removed complex gtk library selection. Defaults to libgtk3, if
     available; elsewise, uses libgtk2 (suggested from comments by
     Baruch Siach, Thomas Petazzoni and Peter Korsgaard).
---
 package/Config.in     |  1 +
 package/yad/Config.in | 16 ++++++++++++++++
 package/yad/yad.hash  |  2 ++
 package/yad/yad.mk    | 24 ++++++++++++++++++++++++
 4 files changed, 43 insertions(+)
 create mode 100644 package/yad/Config.in
 create mode 100644 package/yad/yad.hash
 create mode 100644 package/yad/yad.mk

diff --git a/package/Config.in b/package/Config.in
index 8e3c64a..aae5ae6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -291,6 +291,7 @@ comment "X applications"
 	source "package/xscreensaver/Config.in"
 	source "package/xterm/Config.in"
 	source "package/xvkbd/Config.in"
+	source "package/yad/Config.in"
 
 comment "X libraries and helper libraries"
 	source "package/libsexy/Config.in"
diff --git a/package/yad/Config.in b/package/yad/Config.in
new file mode 100644
index 0000000..dcc50eb
--- /dev/null
+++ b/package/yad/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_YAD
+	bool "yad"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  YAD (yet another dialog) is a tool for create graphical dialogs from
+	  shell scripts.
+
+	  http://sourceforge.net/projects/yad-dialog/
+
+comment "yad needs libgtk2 or libgtk3"
+	depends on !BR2_PACKAGE_LIBGTK2 && !BR2_PACKAGE_LIBGTK3
diff --git a/package/yad/yad.hash b/package/yad/yad.hash
new file mode 100644
index 0000000..fdde908
--- /dev/null
+++ b/package/yad/yad.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 3716d71861009add49e0a8a2269b181feffd0449e4cdf4f317f873dfb8c94b82 yad-0.31.1.tar.xz
diff --git a/package/yad/yad.mk b/package/yad/yad.mk
new file mode 100644
index 0000000..7615cf6
--- /dev/null
+++ b/package/yad/yad.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# yad
+#
+################################################################################
+
+YAD_VERSION = 0.31.1
+YAD_SOURCE = yad-$(YAD_VERSION).tar.xz
+YAD_SITE = http://sourceforge.net/projects/yad-dialog/files
+YAD_LICENSE = GPLv3
+YAD_LICENSE_FILES = COPYING
+YAD_DEPENDENCIES = host-intltool host-pkgconf libglib2
+
+YAD_CONF_OPTS = --enable-html=no
+
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+YAD_DEPENDENCIES += libgtk3
+YAD_CONF_OPTS += --with-gtk=gtk3
+else
+YAD_DEPENDENCIES += libgtk2
+YAD_CONF_OPTS += --with-gtk=gtk2
+endif
+
+$(eval $(autotools-package))
-- 
1.9.5.msysgit.1
