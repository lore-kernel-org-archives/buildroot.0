From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 19:11:20 +0200
Subject: [Buildroot] [git commit] gvfs: enable keyring
Message-ID: <20181021170959.C47B188430@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=861d1efae4e724da6b924940d749c078eb9c6259
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable keyring if libsecret is available

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
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
