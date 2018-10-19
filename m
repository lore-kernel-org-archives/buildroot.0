From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 19 Oct 2018 22:13:13 +0200
Subject: [Buildroot] [PATCH 4/6] gvfs: enable cdda backend
In-Reply-To: <20181019201315.15922-1-fontaine.fabrice@gmail.com>
References: <20181019201315.15922-1-fontaine.fabrice@gmail.com>
Message-ID: <20181019201315.15922-4-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable cdda if libcdio-paranoia and libgudev are available

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.17.1
