From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:49 -0000
Subject: [Buildroot] [git commit branch/next] package/mono-gtksharp3: new
	package
Message-ID: <20150808105637.8111680414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a4e7176a4005830ce8a2709b09066c26a06de255
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch adds mono gtksharp3 package for mono.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |    5 +++++
 package/mono-gtksharp3/Config.in           |    8 ++++++++
 package/mono-gtksharp3/mono-gtksharp3.hash |    2 ++
 package/mono-gtksharp3/mono-gtksharp3.mk   |   17 +++++++++++++++++
 4 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 5974855..ddbf180 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -509,6 +509,11 @@ endif
 	source "package/lutok/Config.in"
 	source "package/moarvm/Config.in"
 	source "package/mono/Config.in"
+if BR2_PACKAGE_MONO
+menu "Mono libraries/modules"
+	source "package/mono-gtksharp3/Config.in"
+endmenu
+endif
 	source "package/nodejs/Config.in"
 	source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
diff --git a/package/mono-gtksharp3/Config.in b/package/mono-gtksharp3/Config.in
new file mode 100644
index 0000000..570b62c
--- /dev/null
+++ b/package/mono-gtksharp3/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_MONO_GTKSHARP3
+	bool "gtk# 3"
+	depends on BR2_PACKAGE_LIBGTK3
+	help
+	  Gtk# is a .NET language binding for the GTK+ toolkit.
+	  This package provides version 3 of the bindings.
+
+	  http://www.mono-project.com/docs/gui/gtksharp/
diff --git a/package/mono-gtksharp3/mono-gtksharp3.hash b/package/mono-gtksharp3/mono-gtksharp3.hash
new file mode 100644
index 0000000..4005051
--- /dev/null
+++ b/package/mono-gtksharp3/mono-gtksharp3.hash
@@ -0,0 +1,2 @@
+# sha256 from https://download.gnome.org/sources/gtk-sharp/2.99/gtk-sharp-2.99.3.sha256sum
+sha256 6440f571416267ae0cb5698071d087b31e3084693fa2c829b1db37ca7ea2c3a2	gtk-sharp-2.99.3.tar.xz
diff --git a/package/mono-gtksharp3/mono-gtksharp3.mk b/package/mono-gtksharp3/mono-gtksharp3.mk
new file mode 100644
index 0000000..fa63d66
--- /dev/null
+++ b/package/mono-gtksharp3/mono-gtksharp3.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# gtksharp3
+#
+################################################################################
+
+MONO_GTKSHARP3_VERSION_MAJOR = 2.99
+MONO_GTKSHARP3_VERSION = $(MONO_GTKSHARP3_VERSION_MAJOR).3
+MONO_GTKSHARP3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk-sharp/$(MONO_GTKSHARP3_VERSION_MAJOR)/
+MONO_GTKSHARP3_SOURCE = gtk-sharp-$(MONO_GTKSHARP3_VERSION).tar.xz
+MONO_GTKSHARP3_LICENSE = LGPLv2, MIT (cairo)
+MONO_GTKSHARP3_LICENSE_FILES = COPYING
+MONO_GTKSHARP3_INSTALL_STAGING = YES
+MONO_GTKSHARP3_DEPENDENCIES = mono libgtk3
+MONO_GTKSHARP3_CONF_OPTS += CSC=$(HOST_DIR)/usr/bin/mcs
+
+$(eval $(autotools-package))
