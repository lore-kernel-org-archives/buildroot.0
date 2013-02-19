From: Markos Chandras <markos.chandras@gmail.com>
Date: Tue, 19 Feb 2013 10:55:47 +0000
Subject: [Buildroot] [PATCH] libffi: Revert git changes and bump to 3.0.12
Message-ID: <1361271347-21435-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/libffi/libffi.mk |   25 +++----------------------
 1 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 9fb86d7..99f56c6 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -4,15 +4,11 @@
 #
 #############################################################
 
-LIBFFI_VERSION = bcc0c28001b6d427d5cd8037d2e3c892babc6b4c
-LIBFFI_SITE    = http://github.com/atgreen/libffi/tarball/$(LIBFFI_VERSION)
+LIBFFI_VERSION = 3.0.12
+LIBFFI_SITE    = ftp://sourceware.org/pub/libffi/
 LIBFFI_LICENSE = MIT
 LIBFFI_LICENSE_FILES = LICENSE
 LIBFFI_INSTALL_STAGING = YES
-
-# We're using a version from Git which strangely bundles a generated
-# configure script, but it's broken (doesn't generate the libffi.pc
-# file).
 LIBFFI_AUTORECONF = YES
 
 # Newer CS MIPS toolchains use a different (compact) eh_frame format
@@ -22,11 +18,9 @@ LIBFFI_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -mno-compact-eh"
 endif
 
 # Move the headers to the usual location, and adjust the .pc file
-# accordingly. For some reason, the libffi build system forgets to
-# install the .pc file, so we do it manually.
+# accordingly.
 define LIBFFI_MOVE_STAGING_HEADERS
 	mv $(STAGING_DIR)/usr/lib/libffi-*/include/*.h $(STAGING_DIR)/usr/include/
-	$(INSTALL) -D -m 0644 $(@D)/libffi.pc $(STAGING_DIR)/usr/lib/pkgconfig/libffi.pc
 	$(SED) '/^includedir.*/d' $(STAGING_DIR)/usr/lib/pkgconfig/libffi.pc
 	$(SED) '/^Cflags:.*/d' $(STAGING_DIR)/usr/lib/pkgconfig/libffi.pc
 	rm -rf $(TARGET_DIR)/usr/lib/libffi-*
@@ -43,18 +37,5 @@ endef
 
 LIBFFI_POST_INSTALL_TARGET_HOOKS += LIBFFI_MOVE_TARGET_HEADERS
 
-# We're using a version from Git which strangely bundles a generated
-# configure script, but it's broken (doesn't generate the libffi.pc
-# file).
-HOST_LIBFFI_AUTORECONF = YES
-
-# For some reason, the libffi build system forgets to install the .pc
-# file, so we do it manually.
-define HOST_LIBFFI_INSTALL_PC_FILE
-	$(INSTALL) -D $(@D)/libffi.pc $(HOST_DIR)/usr/lib/pkgconfig/libffi.pc
-endef
-
-HOST_LIBFFI_POST_INSTALL_HOOKS += HOST_LIBFFI_INSTALL_PC_FILE
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.7.1
