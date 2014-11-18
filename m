From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 18 Nov 2014 21:07:28 +0200
Subject: [Buildroot] [PATCH] coreutils: avoid prompt on rebuild
Message-ID: <4ec5cf7dfd067f650364a485e746d1c97021e729.1416337648.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mode bits of coreutils installed binaries are 555. As a result, on
rebuild mv prompts the user to confirm overwrite of non writable binaries.
Force overwrite to skip this prompt.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/coreutils/coreutils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index e06510e096fe..db0d8a941f5a 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -102,12 +102,12 @@ endif
 define COREUTILS_POST_INSTALL
 	# some things go in root rather than usr
 	for f in $(COREUTILS_BIN_PROGS); do \
-		mv $(TARGET_DIR)/usr/bin/$$f $(TARGET_DIR)/bin/$$f; \
+		mv -f $(TARGET_DIR)/usr/bin/$$f $(TARGET_DIR)/bin/$$f; \
 	done
 	# link for archaic shells
 	ln -fs test $(TARGET_DIR)/usr/bin/[
 	# gnu thinks chroot is in bin, debian thinks it's in sbin
-	mv $(TARGET_DIR)/usr/bin/chroot $(TARGET_DIR)/usr/sbin/chroot
+	mv -f $(TARGET_DIR)/usr/bin/chroot $(TARGET_DIR)/usr/sbin/chroot
 endef
 
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_POST_INSTALL
-- 
2.1.3
