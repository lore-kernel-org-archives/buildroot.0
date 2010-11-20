From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 19 Nov 2010 22:45:11 -0500
Subject: [Buildroot] [PATCH v2] zlib: fix shared lib logic for static-only
	targets
In-Reply-To: <1290220539-11242-1-git-send-email-vapier@gentoo.org>
References: <1290220539-11242-1-git-send-email-vapier@gentoo.org>
Message-ID: <1290224711-21643-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FLAT targets only support static libraries.  The zlib code atm though
assumes a libz.so is always created.  So have the targets check to see
if libz.so exists before trying to work with it.

While we're here, also punt the package-local stripping.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v2
	- fix all install targets

 package/zlib/zlib.mk |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 751cfc1..759ab1f 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -53,14 +53,18 @@ define ZLIB_INSTALL_STAGING_CMDS
 	$(INSTALL) -D $(@D)/libz.a $(STAGING_DIR)/usr/lib/libz.a
 	$(INSTALL) -D $(@D)/zlib.h $(STAGING_DIR)/usr/include/zlib.h
 	$(INSTALL) $(@D)/zconf.h $(STAGING_DIR)/usr/include/
-	cp -dpf $(@D)/libz.so* $(STAGING_DIR)/usr/lib/
+	if [ -e "$(@D)/libz.so" ]; then \
+		cp -dpf $(@D)/libz.so* $(STAGING_DIR)/usr/lib/; \
+	fi
 endef
 
 define HOST_ZLIB_INSTALL_CMDS
 	$(INSTALL) -D $(@D)/libz.a $(HOST_DIR)/usr/lib/libz.a
 	$(INSTALL) -D $(@D)/zlib.h $(HOST_DIR)/usr/include/zlib.h
 	$(INSTALL) $(@D)/zconf.h $(HOST_DIR)/usr/include/
-	cp -dpf $(@D)/libz.so* $(HOST_DIR)/usr/lib/
+	if [ -e "$(@D)/libz.so" ]; then \
+		cp -dpf $(@D)/libz.so* $(HOST_DIR)/usr/lib/; \
+	fi
 endef
 
 ifeq ($(BR2_HAVE_DEVFILES),y)
@@ -72,8 +76,9 @@ endif
 
 define ZLIB_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -dpf $(@D)/libz.so* $(TARGET_DIR)/usr/lib
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libz.so*
+	if [ -e "$(@D)/libz.so" ]; then \
+		cp -dpf $(@D)/libz.so* $(TARGET_DIR)/usr/lib; \
+	fi
 	$(INSTALL) -D $(@D)/libz.a $(TARGET_DIR)/usr/lib/libz.a
 	$(ZLIB_INSTALL_TARGET_HEADERS)
 endef
-- 
1.7.3.2
