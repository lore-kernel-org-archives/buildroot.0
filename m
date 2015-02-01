From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Feb 2015 23:18:54 +0100
Subject: [Buildroot] [PATCH] package/benejson: only buid static/shared as
	needed
Message-ID: <1422829134-25652-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.org/results/56a/56a721885c890f3d62bf9e13d712767e66937c51/
    http://autobuild.buildroot.org/results/7c5/7c54dce4801a53bec378b422edfa42dfa990eabe/
    [...]

Patch-from: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/benejson/benejson.mk | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/benejson/benejson.mk b/package/benejson/benejson.mk
index 2b8d09d..680e5b5 100644
--- a/package/benejson/benejson.mk
+++ b/package/benejson/benejson.mk
@@ -20,13 +20,10 @@ endef
 BENEJSON_POST_PATCH_HOOKS += BENEJSON_DISABLE_WCHAR
 endif
 
-define BENEJSON_BUILD_CMDS
-	(cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS) CROSS=$(TARGET_CROSS) \
-		$(SCONS))
-endef
+BENEJSON_SCONS_TARGETS = include
 
 ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+BENEJSON_SCONS_TARGETS += lib/libbenejson.a
 define BENEJSON_INSTALL_STATIC_LIB
 	$(INSTALL) -D -m 0644 $(@D)/lib/libbenejson.a \
 		$(1)/usr/lib/libbenejson.a
@@ -34,12 +31,19 @@ endef
 endif # Static enabled
 
 ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+BENEJSON_SCONS_TARGETS += lib/libbenejson.so
 define BENEJSON_INSTALL_SHARED_LIB
 	$(INSTALL) -D -m 0644 $(@D)/lib/libbenejson.so \
 		$(1)/usr/lib/libbenejson.so
 endef
 endif # Shared enabled
 
+define BENEJSON_BUILD_CMDS
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) CROSS=$(TARGET_CROSS) \
+		$(SCONS) $(BENEJSON_SCONS_TARGETS))
+endef
+
 define BENEJSON_INSTALL_STAGING_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/include/benejson/benejson.h \
 		$(STAGING_DIR)/usr/include/benejson/benejson.h; \
-- 
1.9.1
