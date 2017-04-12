From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:39:13 +0200
Subject: [Buildroot] [PATCH 39/53] libffi: avoid $(HOST_DIR)/usr while
	moving headers
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-40-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libffi/libffi.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 38ef2d60d0..32e01e9cd1 100644
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
-- 
2.11.0
