From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 11 Feb 2015 13:21:25 +0100
Subject: [Buildroot] [PATCH v2] package/gtksharp: new package
Message-ID: <1423657285-14235-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds gtksharp package for mono.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/Config.in            |  5 +++++
 package/gtksharp/Config.in   |  9 +++++++++
 package/gtksharp/gtksharp.mk | 15 +++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/gtksharp/Config.in
 create mode 100644 package/gtksharp/gtksharp.mk

diff --git a/package/Config.in b/package/Config.in
index fe3d3d0..27daf2a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -464,6 +464,11 @@ menu "Lua libraries/modules"
 endmenu
 endif
 	source "package/mono/Config.in"
+if BR2_PACKAGE_MONO
+menu "Mono libraries/modules"
+	source "package/gtksharp/Config.in"
+endmenu
+endif
 	source "package/nodejs/Config.in"
 	source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
diff --git a/package/gtksharp/Config.in b/package/gtksharp/Config.in
new file mode 100644
index 0000000..8f3af2e
--- /dev/null
+++ b/package/gtksharp/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_GTKSHARP
+	bool "gtk#"
+	depends on BR2_PACKAGE_MONO
+	select BR2_PACKAGE_LIBGTK3
+	select BR2_TARGET_TZ_INFO
+	help
+	  Gtk# is a .NET language binding for the GTK+ toolkit.
+
+	  http://ftp.gnome.org/pub/gnome/sources/gtk-sharp/2.99/
diff --git a/package/gtksharp/gtksharp.mk b/package/gtksharp/gtksharp.mk
new file mode 100644
index 0000000..948db19
--- /dev/null
+++ b/package/gtksharp/gtksharp.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# gtksharp
+#
+#############################################################
+
+GTKSHARP_VERSION = 2.99.3
+GTKSHARP_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk-sharp/2.99/
+GTKSHARP_SOURCE = gtk-sharp-$(GTKSHARP_VERSION).tar.xz
+GTKSHARP_LICENSE = LGPLv2
+GTKSHARP_LICENSE_FILES = COPYING
+GTKSHARP_INSTALL_STAGING = YES
+GTKSHARP_DEPENDENCIES += mono libgtk3
+
+$(eval $(autotools-package))
-- 
1.9.1
