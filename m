From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Feb 2016 22:31:14 +0100
Subject: [Buildroot] [git commit] libffi: fix headers location for
	host-libffi
Message-ID: <20160203213539.4C7D3800EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f41091176bb3e8da6cf78760b69f188e9868a259
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is a special hook for target-libffi, that moves headers
from /usr/lib/libffi-version/include to /usr/include. This patch
adds the same procedure for host-libffi.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas:
 - factorize code between the staging headers cleanup and the host
   headers cleanup.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libffi/libffi.mk | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 3373c17..38ef2d6 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -13,15 +13,19 @@ LIBFFI_AUTORECONF = YES
 
 # Move the headers to the usual location, and adjust the .pc file
 # accordingly.
-define LIBFFI_MOVE_STAGING_HEADERS
-	mv $(STAGING_DIR)/usr/lib/libffi-$(LIBFFI_VERSION)/include/*.h $(STAGING_DIR)/usr/include/
+define LIBFFI_MOVE_HEADERS
+	mv $(1)/usr/lib/libffi-$(LIBFFI_VERSION)/include/*.h $(1)/usr/include/
 	$(SED) '/^includedir.*/d' -e '/^Cflags:.*/d' \
-		$(STAGING_DIR)/usr/lib/pkgconfig/libffi.pc
-	rm -rf $(STAGING_DIR)/usr/lib/libffi-*
+		$(1)/usr/lib/pkgconfig/libffi.pc
+	rm -rf $(1)/usr/lib/libffi-*
 endef
 
+LIBFFI_MOVE_STAGING_HEADERS = $(call LIBFFI_MOVE_HEADERS,$(STAGING_DIR))
 LIBFFI_POST_INSTALL_STAGING_HOOKS += LIBFFI_MOVE_STAGING_HEADERS
 
+HOST_LIBFFI_MOVE_HOST_HEADERS = $(call LIBFFI_MOVE_HEADERS,$(HOST_DIR))
+HOST_LIBFFI_POST_INSTALL_HOOKS += HOST_LIBFFI_MOVE_HOST_HEADERS
+
 # Remove headers that are not at the usual location from the target
 define LIBFFI_REMOVE_TARGET_HEADERS
 	$(RM) -rf $(TARGET_DIR)/usr/lib/libffi-$(LIBFFI_VERSION)
