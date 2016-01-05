From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue,  5 Jan 2016 08:17:22 +0100
Subject: [Buildroot] [PATCH v2 1/3] libffi: fix headers location for
	host-libffi
In-Reply-To: <1451978244-15878-1-git-send-email-yegorslists@googlemail.com>
References: <1451978244-15878-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1451978244-15878-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

There is a special hook for target-libffi, that moves headers
from /usr/lib/libffi-version/include to /usr/include. This patch
adds the same procedure for host-libffi.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libffi/libffi.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 8f0f72d..47de8cd 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -22,6 +22,17 @@ endef
 
 LIBFFI_POST_INSTALL_STAGING_HOOKS += LIBFFI_MOVE_STAGING_HEADERS
 
+# Move the headers to the usual location, and adjust the .pc file
+# accordingly.
+define HOST_LIBFFI_MOVE_HOST_HEADERS
+	mv $(HOST_DIR)/usr/lib/libffi-$(LIBFFI_VERSION)/include/*.h $(HOST_DIR)/usr/include/
+	$(SED) '/^includedir.*/d' -e '/^Cflags:.*/d' \
+		$(HOST_DIR)/usr/lib/pkgconfig/libffi.pc
+	rm -rf $(HOST_DIR)/usr/lib/libffi-*
+endef
+
+HOST_LIBFFI_POST_INSTALL_HOOKS += HOST_LIBFFI_MOVE_HOST_HEADERS
+
 # Remove headers that are not at the usual location from the target
 define LIBFFI_REMOVE_TARGET_HEADERS
 	$(RM) -rf $(TARGET_DIR)/usr/lib/libffi-$(LIBFFI_VERSION)
-- 
2.1.4
