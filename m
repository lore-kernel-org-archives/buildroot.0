From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 6 Oct 2015 16:34:27 +0100
Subject: [Buildroot] [PATCH] freetype: bump to version 2.6.1
Message-ID: <1444145667-24075-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump to version 2.6.1.
- Update hash file.
- Remove includes hooks since they are no longed needed.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/freetype/freetype.hash |    6 +++---
 package/freetype/freetype.mk   |   27 +--------------------------
 2 files changed, 4 insertions(+), 29 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index 16450d0..d857a38 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/freetype/files/freetype2/2.6/
-md5	5682890cb0267f6671dd3de6eabd3e69	freetype-2.6.tar.bz2
-sha1	cd2b144205dd2c61693e2d861069367aa3dde1bc	freetype-2.6.tar.bz2
+# From http://sourceforge.net/projects/freetype/files/freetype2/2.6.1/
+md5 35cb8f4d9e5906847901bb39324c2f80  freetype-2.6.1.tar.bz2
+sha1 393447fbf64c107b20a1ccc9e9a9a52f39786ae0  freetype-2.6.1.tar.bz2
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index e3c8240..1fb5b8f 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.6
+FREETYPE_VERSION = 2.6.1
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION)
 FREETYPE_INSTALL_STAGING = YES
@@ -70,31 +70,6 @@ define FREETYPE_FIX_CONFIG_FILE_LIBS
 endef
 FREETYPE_POST_INSTALL_STAGING_HOOKS += FREETYPE_FIX_CONFIG_FILE_LIBS
 
-# Version 2.5.1 reorganized headers out of freetype2/freetype.
-# It is unexpected for some packages so symlink it until it spreads
-# upstream. Note that we also have to remove the symlink prior to the
-# installation process, because the installation process of freetype
-# removes usr/include/Freetype2/freetype/config, before installing
-# something in usr/include/Freetype2/config/ which no longer exists
-# due to the symbolic link.
-define FREETYPE_REMOVE_FREETYPE_INCLUDE_SYMLINK
-	$(RM) -f $(STAGING_DIR)/usr/include/freetype2/freetype
-endef
-FREETYPE_PRE_INSTALL_STAGING_HOOKS += FREETYPE_REMOVE_FREETYPE_INCLUDE_SYMLINK
-define FREETYPE_FIX_FREETYPE_INCLUDE
-	ln -sf . $(STAGING_DIR)/usr/include/freetype2/freetype
-endef
-FREETYPE_POST_INSTALL_STAGING_HOOKS += FREETYPE_FIX_FREETYPE_INCLUDE
-
-define HOST_FREETYPE_REMOVE_FREETYPE_INCLUDE_SYMLINK
-	$(RM) -f $(HOST_DIR)/usr/include/freetype2/freetype
-endef
-HOST_FREETYPE_PRE_INSTALL_HOOKS += HOST_FREETYPE_REMOVE_FREETYPE_INCLUDE_SYMLINK
-define HOST_FREETYPE_FIX_FREETYPE_INCLUDE
-	ln -sf . $(HOST_DIR)/usr/include/freetype2/freetype
-endef
-HOST_FREETYPE_POST_INSTALL_HOOKS += HOST_FREETYPE_FIX_FREETYPE_INCLUDE
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
-- 
1.7.1
