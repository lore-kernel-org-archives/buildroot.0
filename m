From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 18:03:50 +0200
Subject: [Buildroot] [git commit] gvfs: enable admin backend
Message-ID: <20181020160911.77F3B84381@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f595f3cf6af9867322b2b631cec3dbda42a43c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable admin backend if libcap and polkit are available

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gvfs/gvfs.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 82683d7da1..4ad66b8a6a 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -20,7 +20,6 @@ GVFS_CONF_ENV = ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-con
 # Most of these are missing library support
 GVFS_CONF_OPTS = \
 	--disable-afc \
-	--disable-admin \
 	--disable-cdda \
 	--disable-gcr \
 	--disable-gdu \
@@ -66,6 +65,13 @@ else
 GVFS_CONF_OPTS += --disable-bluray
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP)$(BR2_PACKAGE_POLKIT),yy)
+GVFS_DEPENDENCIES += libcap polkit
+GVFS_CONF_OPTS += --enable-admin
+else
+GVFS_CONF_OPTS += --disable-admin
+endif
+
 ifeq ($(BR2_PACKAGE_LIBFUSE),y)
 GVFS_DEPENDENCIES += libfuse
 GVFS_CONF_OPTS += --enable-fuse
