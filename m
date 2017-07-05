From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:37 +0200
Subject: [Buildroot] [git commit] libffi: avoid $(HOST_DIR)/usr while moving
	headers
Message-ID: <20170705141336.AA2727FB34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a82680a61871f5fb96e307a1dfb28a0a330e98d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libffi/libffi.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 38ef2d6..32e01e9 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -14,13 +14,13 @@ LIBFFI_AUTORECONF = YES
 # Move the headers to the usual location, and adjust the .pc file
 # accordingly.
 define LIBFFI_MOVE_HEADERS
-	mv $(1)/usr/lib/libffi-$(LIBFFI_VERSION)/include/*.h $(1)/usr/include/
+	mv $(1)/lib/libffi-$(LIBFFI_VERSION)/include/*.h $(1)/include/
 	$(SED) '/^includedir.*/d' -e '/^Cflags:.*/d' \
-		$(1)/usr/lib/pkgconfig/libffi.pc
-	rm -rf $(1)/usr/lib/libffi-*
+		$(1)/lib/pkgconfig/libffi.pc
+	rm -rf $(1)/lib/libffi-*
 endef
 
-LIBFFI_MOVE_STAGING_HEADERS = $(call LIBFFI_MOVE_HEADERS,$(STAGING_DIR))
+LIBFFI_MOVE_STAGING_HEADERS = $(call LIBFFI_MOVE_HEADERS,$(STAGING_DIR)/usr)
 LIBFFI_POST_INSTALL_STAGING_HOOKS += LIBFFI_MOVE_STAGING_HEADERS
 
 HOST_LIBFFI_MOVE_HOST_HEADERS = $(call LIBFFI_MOVE_HEADERS,$(HOST_DIR))
