From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Feb 2011 23:01:44 +0100
Subject: [Buildroot] [git commit master 1/1] e2fsprogs: bump to 1.41.14 and
	fixup
Message-ID: <20110209220223.D68778F47E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8d3e6abc6b7120e7d2b84cac07237e67429e2283
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump e2fsprogs to version 1.41.14

Also export libblkid properly for util-linux to use.

[Peter: install pkg-config files]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/e2fsprogs/e2fsprogs.mk |   24 +++++++++++++++++-------
 1 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index f525804..cf1a6b8 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -3,15 +3,10 @@
 # e2fsprogs
 #
 #############################################################
-E2FSPROGS_VERSION:=1.41.12
-E2FSPROGS_SOURCE=e2fsprogs-$(E2FSPROGS_VERSION).tar.gz
-E2FSPROGS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/e2fsprogs
-
-E2FSPROGS_AUTORECONF = NO
-E2FSPROGS_LIBTOOL_PATCH = NO
 
+E2FSPROGS_VERSION = 1.41.14
+E2FSPROGS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/e2fsprogs
 E2FSPROGS_INSTALL_STAGING = YES
-E2FSPROGS_INSTALL_TARGET = YES
 
 E2FSPROGS_CONF_OPT = \
 	--disable-tls \
@@ -112,11 +107,26 @@ endif
 
 define E2FSPROGS_STAGING_LIBUUID_INSTALL
 	install -D $(@D)/lib/uuid/uuid.h $(STAGING_DIR)/usr/include/uuid/uuid.h
+	install -D $(@D)/lib/uuid/uuid.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/uuid.pc
 endef
 
 ifeq ($(BR2_PACKAGE_E2FSPROGS_LIBUUID),y)
 E2FSPROGS_POST_INSTALL_STAGING_HOOKS += E2FSPROGS_STAGING_LIBUUID_INSTALL
 endif
 
+define E2FSPROGS_STAGING_LIBBLKID_INSTALL
+	install -D $(@D)/lib/blkid/blkid.h \
+		$(STAGING_DIR)/usr/include/blkid/blkid.h
+	install -D $(@D)/lib/blkid/blkid_types.h \
+		$(STAGING_DIR)/usr/include/blkid/blkid_types.h
+	install -D $(@D)/lib/blkid/blkid.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/blkid.pc
+endef
+
+ifeq ($(BR2_PACKAGE_E2FSPROGS_LIBBLKID),y)
+E2FSPROGS_POST_INSTALL_STAGING_HOOKS += E2FSPROGS_STAGING_LIBBLKID_INSTALL
+endif
+
 $(eval $(call AUTOTARGETS,package,e2fsprogs))
 $(eval $(call AUTOTARGETS,package,e2fsprogs,host))
-- 
1.7.3.4
