From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 18:04:09 +0200
Subject: [Buildroot] [git commit] gvfs: enable cdda backend
Message-ID: <20181020160911.7FBBD84381@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7aef10f631d62b031e37f231d3ed9d0b5f28d6f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable cdda if libcdio-paranoia and libgudev are available

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gvfs/gvfs.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 4ad66b8a6a..b0722ffb00 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -20,7 +20,6 @@ GVFS_CONF_ENV = ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-con
 # Most of these are missing library support
 GVFS_CONF_OPTS = \
 	--disable-afc \
-	--disable-cdda \
 	--disable-gcr \
 	--disable-gdu \
 	--disable-goa \
@@ -72,6 +71,13 @@ else
 GVFS_CONF_OPTS += --disable-admin
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCDIO_PARANOIA)$(BR2_PACKAGE_LIBGUDEV),yy)
+GVFS_DEPENDENCIES += libcdio-paranoia libgudev
+GVFS_CONF_OPTS += --enable-cdda
+else
+GVFS_CONF_OPTS += --disable-cdda
+endif
+
 ifeq ($(BR2_PACKAGE_LIBFUSE),y)
 GVFS_DEPENDENCIES += libfuse
 GVFS_CONF_OPTS += --enable-fuse
