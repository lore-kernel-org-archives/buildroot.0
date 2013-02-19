From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Feb 2013 09:36:42 +0100
Subject: [Buildroot] [git commit] libffi: bump version
Message-ID: <20130219112835.DE62C9AB89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=192efcdaeb58cdb5c0e82d6f6d34c069af1a7f82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It makes more sense to use a released version for 2013.02 rather than a
git snapshot.

The build system now correctly installs libffi.pc, so we can drop the
manual install.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libffi/libffi.mk |   27 +++++----------------------
 1 files changed, 5 insertions(+), 22 deletions(-)

diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 9fb86d7..28a2916 100644
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
@@ -22,13 +18,11 @@ LIBFFI_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -mno-compact-eh"
 endif
 
 # Move the headers to the usual location, and adjust the .pc file
-# accordingly. For some reason, the libffi build system forgets to
-# install the .pc file, so we do it manually.
+# accordingly.
 define LIBFFI_MOVE_STAGING_HEADERS
 	mv $(STAGING_DIR)/usr/lib/libffi-*/include/*.h $(STAGING_DIR)/usr/include/
-	$(INSTALL) -D -m 0644 $(@D)/libffi.pc $(STAGING_DIR)/usr/lib/pkgconfig/libffi.pc
-	$(SED) '/^includedir.*/d' $(STAGING_DIR)/usr/lib/pkgconfig/libffi.pc
-	$(SED) '/^Cflags:.*/d' $(STAGING_DIR)/usr/lib/pkgconfig/libffi.pc
+	$(SED) '/^includedir.*/d' -e '/^Cflags:.*/d' \
+		$(STAGING_DIR)/usr/lib/pkgconfig/libffi.pc
 	rm -rf $(TARGET_DIR)/usr/lib/libffi-*
 endef
 
@@ -43,18 +37,7 @@ endef
 
 LIBFFI_POST_INSTALL_TARGET_HOOKS += LIBFFI_MOVE_TARGET_HEADERS
 
-# We're using a version from Git which strangely bundles a generated
-# configure script, but it's broken (doesn't generate the libffi.pc
-# file).
 HOST_LIBFFI_AUTORECONF = YES
 
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
