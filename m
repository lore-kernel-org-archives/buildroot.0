From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 09:51:17 +0100
Subject: [Buildroot] [git commit] package/gvfs: fix static build with
 libarchive
Message-ID: <20191027084534.E0C4088D40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b66547108adba61c017e347dd44aa150e2ccad4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use pkg-config to retrieve static dependencies of libarchive in gvfs.mk
instead of patching configure.ac as upstream switched to meson

Fixes:
 - http://autobuild.buildroot.org/results/486187bb7b8800f44a8c173af518b84e68e53584

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gvfs/gvfs.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 9bfe9e60fb..c380a710fb 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -13,12 +13,13 @@ GVFS_DEPENDENCIES = host-pkgconf host-libglib2 libglib2 dbus shared-mime-info \
 	$(TARGET_NLS_DEPENDENCIES)
 GVFS_LICENSE = LGPL-2.0+
 GVFS_LICENSE_FILES = COPYING
+GVFS_LIBS = $(TARGET_NLS_LIBS)
 
 # Export ac_cv_path_LIBGCRYPT_CONFIG unconditionally to prevent
 # build system from searching the host paths.
 GVFS_CONF_ENV = \
 	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
-	LIBS=$(TARGET_NLS_LIBS)
+	LIBS="$(GVFS_LIBS)"
 
 # Most of these are missing library support
 GVFS_CONF_OPTS = \
@@ -60,6 +61,7 @@ GVFS_CONF_OPTS += \
 	--enable-archive \
 	--with-archive-includes=$(STAGING_DIR)/usr \
 	--with-archive-libs=$(STAGING_DIR)/usr
+GVFS_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libarchive`
 else
 GVFS_CONF_OPTS += --disable-archive
 endif
