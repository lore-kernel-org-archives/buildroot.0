From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Feb 2016 22:22:01 +0100
Subject: [Buildroot] [git commit] libffi: fix staging headers cleanup
Message-ID: <20160203213539.37EE8807D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b73538920107b6c020ce5c4c8d9f7f672549bb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The LIBFFI_MOVE_STAGING_HEADERS function is responsible for moving
around libffi headers to a standard location. Once this is done, it
removes the no longer used directory, but does so in $(TARGET_DIR) and
not $(STAGING_DIR). This directory is already cleaned up in
$(TARGET_DIR) in the LIBFFI_REMOVE_TARGET_HEADERS post-install target
hook.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libffi/libffi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 8f0f72d..3373c17 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -17,7 +17,7 @@ define LIBFFI_MOVE_STAGING_HEADERS
 	mv $(STAGING_DIR)/usr/lib/libffi-$(LIBFFI_VERSION)/include/*.h $(STAGING_DIR)/usr/include/
 	$(SED) '/^includedir.*/d' -e '/^Cflags:.*/d' \
 		$(STAGING_DIR)/usr/lib/pkgconfig/libffi.pc
-	rm -rf $(TARGET_DIR)/usr/lib/libffi-*
+	rm -rf $(STAGING_DIR)/usr/lib/libffi-*
 endef
 
 LIBFFI_POST_INSTALL_STAGING_HOOKS += LIBFFI_MOVE_STAGING_HEADERS
