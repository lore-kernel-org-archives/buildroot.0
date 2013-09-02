From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Sep 2013 22:44:19 +0200
Subject: [Buildroot] [git commit] libffi: minor corrections in post install
	hooks
Message-ID: <20130902213321.E4ECA9B6B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b5bd3a6ddd04cf32dce82485116f87c614a5ce4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to be sure that we just deal with the includes related with
the actual package described into libffi.mk it is better to explicitly
specify the version of the libffi we deal with into the post install
hook.
As dev files are deprecated in target rootfs target post install
hook was also deleted.

Signed-off-by: Nicolas M??n??gale <nicolas.menegale@openwide.fr>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libffi/libffi.mk |   11 +----------
 1 files changed, 1 insertions(+), 10 deletions(-)

diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 0ad5c84..8c84924 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -14,7 +14,7 @@ LIBFFI_AUTORECONF = YES
 # Move the headers to the usual location, and adjust the .pc file
 # accordingly.
 define LIBFFI_MOVE_STAGING_HEADERS
-	mv $(STAGING_DIR)/usr/lib/libffi-*/include/*.h $(STAGING_DIR)/usr/include/
+	mv $(STAGING_DIR)/usr/lib/libffi-$(LIBFFI_VERSION)/include/*.h $(STAGING_DIR)/usr/include/
 	$(SED) '/^includedir.*/d' -e '/^Cflags:.*/d' \
 		$(STAGING_DIR)/usr/lib/pkgconfig/libffi.pc
 	rm -rf $(TARGET_DIR)/usr/lib/libffi-*
@@ -22,15 +22,6 @@ endef
 
 LIBFFI_POST_INSTALL_STAGING_HOOKS += LIBFFI_MOVE_STAGING_HEADERS
 
-# Similar for target headers
-define LIBFFI_MOVE_TARGET_HEADERS
-	install -d $(TARGET_DIR)/usr/include/
-	mv $(TARGET_DIR)/usr/lib/libffi-*/include/*.h $(TARGET_DIR)/usr/include/
-	rm -rf $(TARGET_DIR)/usr/lib/libffi-*
-endef
-
-LIBFFI_POST_INSTALL_TARGET_HOOKS += LIBFFI_MOVE_TARGET_HEADERS
-
 HOST_LIBFFI_AUTORECONF = YES
 
 $(eval $(autotools-package))
