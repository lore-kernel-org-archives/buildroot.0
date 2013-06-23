From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 23 Jun 2013 21:45:02 +0200
Subject: [Buildroot] [git commit] gvfs: Depend on libgcrypt if it is selected
Message-ID: <20130623200855.C969B9B143@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=953430bc4dcf7e8691252b3a60d10d6ff72db5c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gvfs can make optional use of libgcrypt so it needs to depend on
it if it is selected. It's also necessary to set the
ac_cv_path_LIBGCRYPT_CONFIG variable to a known value in order
to prevent the AM_PATH_LIBGCRYPT macro from searching the host
paths for the libgcrypt-config script.

Fixes the following build problem when libgcrypt is installed on the
host system but the package is not selected in buildroot:

gvfsbackendafpbrowse.c:31:20: fatal error: gcrypt.h: No such file or directory

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gvfs/gvfs.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

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
