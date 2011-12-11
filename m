From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Dec 2011 23:34:48 +0100
Subject: [Buildroot] [git commit] libffi: remove invalid variable
	'includedir' in .pc file
Message-ID: <20111211224225.126848F8FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=22acade2ec3116021304f82d157b3c09ab22f45e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following error:

  Variable 'includedir' not defined in '/home/daniel/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/pkgconfig/libffi.pc'

Also, use $(SED) instead of 'sed -i'.

Signed-off-by: Daniel Mack <zonque@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
 
