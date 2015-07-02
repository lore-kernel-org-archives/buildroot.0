From: James Knight <james.knight@rockwellcollins.com>
Date: Thu,  2 Jul 2015 18:09:27 -0400
Subject: [Buildroot] [PATCH 1/1] yad: new package
Message-ID: <1435874967-6416-1-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/Config.in     |  1 +
 package/yad/Config.in | 23 +++++++++++++++++++++++
 package/yad/yad.hash  |  2 ++
 package/yad/yad.mk    | 24 ++++++++++++++++++++++++
 4 files changed, 50 insertions(+)
 create mode 100644 package/yad/Config.in
 create mode 100644 package/yad/yad.hash
 create mode 100644 package/yad/yad.mk

diff --git a/package/Config.in b/package/Config.in
index 13a7e74..351bb9a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -289,6 +289,7 @@ comment "X applications"
 	source "package/xscreensaver/Config.in"
 	source "package/xterm/Config.in"
 	source "package/xvkbd/Config.in"
+	source "package/yad/Config.in"
 
 comment "X libraries and helper libraries"
 	source "package/libsexy/Config.in"
diff --git a/package/yad/Config.in b/package/yad/Config.in
new file mode 100644
index 0000000..ead2c44
--- /dev/null
+++ b/package/yad/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_YAD
+	bool "yad"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  YAD (yet another dialog) is a tool for create graphical dialogs
+	  from shell scripts.
+
+	  http://sourceforge.net/projects/yad-dialog/
+
+if BR2_PACKAGE_YAD
+
+config BR2_PACKAGE_YAD_FORCE_LIBGTK2
+	bool "Force libgtk2"
+	depends on BR2_PACKAGE_LIBGTK2 && BR2_PACKAGE_LIBGTK3
+	help
+	  Force YAD to be built with libgtk2.
+
+endif
+
+comment "yad needs libgtk2 or libgtk3"
+	depends on !BR2_PACKAGE_LIBGTK2 && !BR2_PACKAGE_LIBGTK3
diff --git a/package/yad/yad.hash b/package/yad/yad.hash
new file mode 100644
index 0000000..b86b815
--- /dev/null
+++ b/package/yad/yad.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 c7b79ff8189222a642e90052590e3ceb6c3d70623346096c1987f695ebf694b1 yad-0.28.1.tar.xz
diff --git a/package/yad/yad.mk b/package/yad/yad.mk
new file mode 100644
index 0000000..630d3b3
--- /dev/null
+++ b/package/yad/yad.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# yad
+#
+################################################################################
+
+YAD_VERSION = 0.28.1
+YAD_SOURCE = yad-$(YAD_VERSION).tar.xz
+YAD_SITE = http://sourceforge.net/projects/yad-dialog/files
+YAD_LICENSE = GPLv3
+YAD_LICENSE_FILES = COPYING
+YAD_DEPENDENCIES = host-intltool host-pkgconf libglib2
+
+YAD_CONF_OPTS = --enable-html=no
+
+ifeq ($(BR2_PACKAGE_LIBGTK3)$(BR2_PACKAGE_YAD_FORCE_LIBGTK2),y)
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
