From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 21 Oct 2018 18:45:51 +0200
Subject: [Buildroot] [PATCH v2,1/1] gvfs: enable keyring
Message-ID: <20181021164551.15946-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable keyring if libsecret is available

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Peter Korsgaard):
 - Put back dependencies of http backend

 package/gvfs/gvfs.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 0fdb9e1267..47fbe0e858 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -23,7 +23,6 @@ GVFS_CONF_OPTS = \
 	--disable-gdu \
 	--disable-goa \
 	--disable-google \
-	--disable-keyring \
 	--disable-libmtp \
 	--disable-udisks2
 
@@ -119,6 +118,13 @@ else
 GVFS_CONF_OPTS += --disable-nfs
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSECRET),y)
+GVFS_DEPENDENCIES += libsecret
+GVFS_CONF_OPTS += --enable-keyring
+else
+GVFS_CONF_OPTS += --disable-keyring
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSOUP)$(BR2_PACKAGE_LIBXML2),yy)
 GVFS_DEPENDENCIES += libsoup libxml2
 GVFS_CONF_OPTS += --enable-http
-- 
2.17.1
