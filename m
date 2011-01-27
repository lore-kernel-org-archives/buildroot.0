From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Jan 2011 11:21:26 -0300
Subject: [Buildroot] [PATCH 1/9] e2fsprogs: bump to 1.41.14 and fixup
Message-ID: <1296138094-502-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump e2fsprogs to version 1.41.14

Also export libblkid properly for util-linux to use.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/e2fsprogs/e2fsprogs.mk |   20 +++++++++++++-------
 1 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index f525804..13c94ba 100644
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
@@ -118,5 +113,16 @@ ifeq ($(BR2_PACKAGE_E2FSPROGS_LIBUUID),y)
 E2FSPROGS_POST_INSTALL_STAGING_HOOKS += E2FSPROGS_STAGING_LIBUUID_INSTALL
 endif
 
+define E2FSPROGS_STAGING_LIBBLKID_INSTALL
+	install -D $(@D)/lib/blkid/blkid.h \
+		$(STAGING_DIR)/usr/include/blkid/blkid.h
+	install -D $(@D)/lib/blkid/blkid_types.h \
+		$(STAGING_DIR)/usr/include/blkid/blkid_types.h
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
