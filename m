From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 23 May 2016 18:08:03 -0300
Subject: [Buildroot] [PATCH] gsettings-desktop-schemas: new package
Message-ID: <1464037683-1354-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                                        |  1 +
 package/gsettings-desktop-schemas/Config.in              | 16 ++++++++++++++++
 .../gsettings-desktop-schemas.hash                       |  2 ++
 .../gsettings-desktop-schemas.mk                         | 16 ++++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/gsettings-desktop-schemas/Config.in
 create mode 100644 package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
 create mode 100644 package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk

diff --git a/package/Config.in b/package/Config.in
index b803b94..3d97c39 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1330,6 +1330,7 @@ menu "Miscellaneous"
 	source "package/gnuradio/Config.in"
 	source "package/googlefontdirectory/Config.in"
 	source "package/gr-osmosdr/Config.in"
+	source "package/gsettings-desktop-schemas/Config.in"
 	source "package/haveged/Config.in"
 	source "package/mcrypt/Config.in"
 	source "package/mobile-broadband-provider-info/Config.in"
diff --git a/package/gsettings-desktop-schemas/Config.in b/package/gsettings-desktop-schemas/Config.in
new file mode 100644
index 0000000..0dfffc3
--- /dev/null
+++ b/package/gsettings-desktop-schemas/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_GSETTINGS_DESKTOP_SCHEMAS
+	bool "gsettings-desktop-schemas"
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  gsettings-desktop-schemas contains a collection of GSettings
+	  schemas for settings shared by various components of a
+	  desktop.
+
+	  https://github.com/GNOME/gsettings-desktop-schemas
+
+comment "gsettings-desktop-schemas needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
new file mode 100644
index 0000000..7fed553
--- /dev/null
+++ b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
@@ -0,0 +1,2 @@
+# From http://ftp.acc.umu.se/pub/gnome/sources/gsettings-desktop-schemas/3.20/gsettings-desktop-schemas-3.20.0.sha256sum
+sha256	55a41b533c0ab955e0a36a84d73829451c88b027d8d719955d8f695c35c6d9c1	gsettings-desktop-schemas-3.20.0.tar.xz
diff --git a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
new file mode 100644
index 0000000..a8910b1
--- /dev/null
+++ b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# gsettings-desktop-schemas
+#
+################################################################################
+
+GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR = 3.20
+GSETTINGS_DESKTOP_SCHEMAS_VERSION = $(GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR).0
+GSETTINGS_DESKTOP_SCHEMAS_SOURCE = gsettings-desktop-schemas-$(GSETTINGS_DESKTOP_SCHEMAS_VERSION).tar.xz
+GSETTINGS_DESKTOP_SCHEMAS_SITE = http://ftp.gnome.org/pub/gnome/sources/gsettings-desktop-schemas/$(GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR)
+GSETTINGS_DESKTOP_SCHEMAS_INSTALL_STAGING = YES
+GSETTINGS_DESKTOP_SCHEMAS_DEPENDENCIES = host-pkgconf libglib2
+GSETTINGS_DESKTOP_SCHEMAS_LICENSE = LGPLv2.1+
+GSETTINGS_DESKTOP_SCHEMAS_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.7.3
