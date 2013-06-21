From: Markos Chandras <markos.chandras@gmail.com>
Date: Fri, 21 Jun 2013 15:41:31 +0100
Subject: [Buildroot] [PATCH] gvfs: Depend on libgcrypt if it is selected
Message-ID: <1371825691-27746-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

gvfs can make optional use of libgcrypt so it needs to depend on
it if it is selected. It's also necessary to set the
ac_cv_path_LIBGCRYPT_CONFIG variable to a known value in order
to prevent the AM_PATH_LIBGCRYPT macro from searching the host
paths for the libgcrypt-config script.

Fixes the following build problem when libgcrypt is installed on the
host system but the package is not selected in buildroot:

gvfsbackendafpbrowse.c:31:20: fatal error: gcrypt.h: No such file or directory

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/gvfs/gvfs.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index d99c784..6e88f6e 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -12,6 +12,10 @@ GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
 GVFS_DEPENDENCIES = host-pkgconf host-libglib2 libglib2 dbus shared-mime-info
 
+# Export ac_cv_path_LIBGCRYPT_CONFIG unconditionally to prevent
+# build system from searching the host paths.
+GVFS_CONF_ENV = ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+
 GVFS_CONF_OPT = \
 	--disable-gconf			\
 	--disable-cdda			\
@@ -42,6 +46,10 @@ else
 GVFS_CONF_OPT += --disable-fuse
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+GVFS_DEPENDENCIES += libgcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSOUP),y)
 GVFS_DEPENDENCIES += libsoup
 GVFS_CONF_OPT += --enable-http
-- 
1.8.2.1
