From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Jul 2011 23:17:39 +0200
Subject: [Buildroot] [git commit] gvfs: fix installation of gsettings schemas
Message-ID: <20110718211805.920E48ACEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b8ee6635ed6339e2676f64903d0c079cdd968c3c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install gvfs into staging and compile the installed schemas for
use on the target.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gvfs/gvfs.mk |   15 +++++++++++++--
 1 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index f208973..b0fcf3d 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -8,7 +8,7 @@ GVFS_VERSION_MINOR = 2
 GVFS_VERSION = $(GVFS_VERSION_MAJOR).$(GVFS_VERSION_MINOR)
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.gz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
-GVFS_INSTALL_STAGING = NO
+GVFS_INSTALL_STAGING = YES
 GVFS_INSTALL_TARGET = YES
 GVFS_AUTORECONF = NO
 GVFS_DEPENDENCIES = host-pkg-config host-libglib2 libglib2 dbus shared-mime-info
@@ -71,6 +71,17 @@ define GVFS_REMOVE_USELESS_BINARY
 	rm $(TARGET_DIR)/usr/bin/gvfs-less
 endef
 
-GVFS_POST_INSTALL_TARGET_HOOKS += GVFS_REMOVE_USELESS_BINARY
+define GVFS_REMOVE_TARGET_SCHEMAS
+	rm $(TARGET_DIR)/usr/share/glib-2.0/schemas/*.xml
+endef
+
+define GVFS_COMPILE_SCHEMAS
+	$(HOST_DIR)/usr/bin/glib-compile-schemas --targetdir=$(TARGET_DIR)/usr/share/glib-2.0/schemas $(STAGING_DIR)/usr/share/glib-2.0/schemas
+endef
+
+GVFS_POST_INSTALL_TARGET_HOOKS += \
+	GVFS_REMOVE_USELESS_BINARY	\
+	GVFS_REMOVE_TARGET_SCHEMAS	\
+	GVFS_COMPILE_SCHEMAS
 
 $(eval $(call AUTOTARGETS,package,gvfs))
-- 
1.7.3.4
