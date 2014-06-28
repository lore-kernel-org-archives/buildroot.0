From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jun 2014 23:52:20 +0200
Subject: [Buildroot] [PATCH 2/5] libffi: remove some header files installed
	in /usr/lib in the target
In-Reply-To: <1403992343-29665-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1403992343-29665-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1403992343-29665-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some reason, libffi installs some header files in
/usr/lib/libffi-<version>/include, which is a non-standard location
and therefore they do not get removed automatically by the
target-finalize logic. This commit adds a post-install hook in
libffi.mk to get rid of these unneeded headers on the target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libffi/libffi.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index dc7132d..1377b8f 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -22,6 +22,12 @@ endef
 
 LIBFFI_POST_INSTALL_STAGING_HOOKS += LIBFFI_MOVE_STAGING_HEADERS
 
+# Remove headers that are not at the usual location from the target
+define LIBFFI_REMOVE_TARGET_HEADERS
+	$(RM) -rf $(TARGET_DIR)/usr/lib/libffi-$(LIBFFI_VERSION)
+endef
+
+LIBFFI_POST_INSTALL_TARGET_HOOKS += LIBFFI_REMOVE_TARGET_HEADERS
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.0.0
