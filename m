From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Jul 2019 22:33:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/gvfs: fix build with NLS
Message-ID: <20190703203319.8882-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/8b061756ae6081d21d6ede8b27844f8fc3131953

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gvfs/gvfs.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 47fbe0e858..9bfe9e60fb 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -9,13 +9,16 @@ GVFS_VERSION = $(GVFS_VERSION_MAJOR).4
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
-GVFS_DEPENDENCIES = host-pkgconf host-libglib2 libglib2 dbus shared-mime-info
+GVFS_DEPENDENCIES = host-pkgconf host-libglib2 libglib2 dbus shared-mime-info \
+	$(TARGET_NLS_DEPENDENCIES)
 GVFS_LICENSE = LGPL-2.0+
 GVFS_LICENSE_FILES = COPYING
 
 # Export ac_cv_path_LIBGCRYPT_CONFIG unconditionally to prevent
 # build system from searching the host paths.
-GVFS_CONF_ENV = ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+GVFS_CONF_ENV = \
+	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
+	LIBS=$(TARGET_NLS_LIBS)
 
 # Most of these are missing library support
 GVFS_CONF_OPTS = \
-- 
2.20.1
