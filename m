From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 13 Jul 2011 18:54:48 +0200
Subject: [Buildroot] [PATCH 2/3] gvfs: drop dbus-glib dependency
In-Reply-To: <1310576089-9207-1-git-send-email-s.neumann@raumfeld.com>
References: <1310576089-9207-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1310576089-9207-2-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop the dbus-glib dependency as gvfs uses dbus directly.

Also change dependency on the XML parser for dbus to be more
in sync with the dbus package.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/gvfs/Config.in |    6 ++++--
 package/gvfs/gvfs.mk   |    2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
index 04fce93..38eb093 100644
--- a/package/gvfs/Config.in
+++ b/package/gvfs/Config.in
@@ -2,10 +2,9 @@ config BR2_PACKAGE_GVFS
 	bool "gvfs"
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_EXPAT || BR2_PACKAGE_LIBXML2 # dbus
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_EXPAT # needed by dbus(-glib)
 	select BR2_PACKAGE_DBUS
-	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_SHARED_MIME_INFO
 	help
 	  gvfs is a userspace virtual filesystem where mount runs as a
@@ -18,3 +17,6 @@ config BR2_PACKAGE_GVFS
 
 comment "gvfs requires a toolchain with LARGEFILE and WCHAR support"
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
+
+comment "gvfs requires expat or libxml2 (for dbus)"
+	depends on !BR2_PACKAGE_EXPAT && !BR2_PACKAGE_LIBXML2
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index bd370b5..f208973 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -11,7 +11,7 @@ GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = NO
 GVFS_INSTALL_TARGET = YES
 GVFS_AUTORECONF = NO
-GVFS_DEPENDENCIES = host-pkg-config host-libglib2 libglib2 dbus-glib shared-mime-info
+GVFS_DEPENDENCIES = host-pkg-config host-libglib2 libglib2 dbus shared-mime-info
 
 GVFS_CONF_OPT = \
 	--disable-gconf			\
-- 
1.7.1
