From: Daniel Mack <zonque@gmail.com>
Date: Tue,  6 Dec 2011 12:45:57 +0100
Subject: [Buildroot] [PATCH 1/3] libffi: remove invalid variable
	'includedir' in .pc file
In-Reply-To: <1323171959-24873-1-git-send-email-zonque@gmail.com>
References: <1323171959-24873-1-git-send-email-zonque@gmail.com>
Message-ID: <1323171959-24873-2-git-send-email-zonque@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following error:

  Variable 'includedir' not defined in '/home/daniel/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/pkgconfig/libffi.pc'

Also, use $(SED) instead of 'sed -i'.

Signed-off-by: Daniel Mack <zonque@gmail.com>
---
 package/libffi/libffi.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 660a034..5ada36d 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -13,7 +13,8 @@ LIBFFI_INSTALL_STAGING = YES
 # accordingly
 define LIBFFI_MOVE_STAGING_HEADERS
 	mv $(STAGING_DIR)/usr/lib/libffi-*/include/*.h $(STAGING_DIR)/usr/include/
-	sed -i '/^includedir.*/d' $(STAGING_DIR)/usr/lib/pkgconfig/libffi.pc
+	$(SED) '/^includedir.*/d' $(STAGING_DIR)/usr/lib/pkgconfig/libffi.pc
+	$(SED) '/^Cflags:.*/d' $(STAGING_DIR)/usr/lib/pkgconfig/libffi.pc
 	rm -rf $(TARGET_DIR)/usr/lib/libffi-*
 endef
 
@@ -23,7 +24,8 @@ LIBFFI_POST_INSTALL_STAGING_HOOKS += LIBFFI_MOVE_STAGING_HEADERS
 define LIBFFI_MOVE_TARGET_HEADERS
 	install -d $(TARGET_DIR)/usr/include/
 	mv $(TARGET_DIR)/usr/lib/libffi-*/include/*.h $(TARGET_DIR)/usr/include/
-	sed -i '/^includedir.*/d' $(TARGET_DIR)/usr/lib/pkgconfig/libffi.pc
+	$(SED) '/^includedir.*/d' $(STAGING_DIR)/usr/lib/pkgconfig/libffi.pc
+	$(SED) '/^Cflags:.*/d' $(STAGING_DIR)/usr/lib/pkgconfig/libffi.pc
 	rm -rf $(TARGET_DIR)/usr/lib/libffi-*
 endef
 
-- 
1.7.7.3
