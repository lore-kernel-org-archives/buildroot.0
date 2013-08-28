From: Nicolas =?utf-8?B?TcOpbsOpZ2FsZQ==?= <nicolas.menegale@openwide.fr>
Date: Wed, 28 Aug 2013 11:48:59 +0200 (CEST)
Subject: [Buildroot] [PATCH v2 1/1] libffi: minor corrections in post
	install hooks
Message-ID: <1493594999.5624151.1377683339178.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to be sure that we just deal with the includes related with
the actual package described into libffi.mk it is better to explicitly
specify the version of the libffi we deal with into the post install
hook.
As dev files are deprecated in target rootfs target post install
hook was also deleted.

Signed-off-by: Nicolas M?n?gale <nicolas.menegale@openwide.fr>
---
v2: third commit
Commit log was clarified.
Also the post install target hook was removed due to the reason
explained in the current commit log.
---
 package/libffi/libffi.mk |   11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

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
-- 
1.7.9.5
