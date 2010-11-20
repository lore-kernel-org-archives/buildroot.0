From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 19 Nov 2010 21:35:39 -0500
Subject: [Buildroot] [PATCH] zlib: fix shared lib logic for static-only
	targets
Message-ID: <1290220539-11242-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FLAT targets only support static libraries.  The zlib code atm though
assumes a libz.so is always created.  So have the install target check
to see if libz.so exists before trying to install it.

While we're here, also punt the package-local stripping.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 package/zlib/zlib.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 751cfc1..a4da4fa 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -72,8 +72,9 @@ endif
 
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
