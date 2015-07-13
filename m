From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 13 Jul 2015 23:55:09 +0200
Subject: [Buildroot] [PATCH v5 3/5] Makefile: add TARGET_SANITIZE_RPATH_HOOK
	to TARGET_FINALIZE_HOOKS
In-Reply-To: <1436824511-1601-1-git-send-email-s.martin49@gmail.com>
References: <1436824511-1601-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1436824511-1601-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces the TARGET_SANITIZE_RPATH_HOOK hook fixing the ELF
files' RPATH of the TARGET_DIR (excluding the sysroot).

After running this hook, the RPATH from any target ELF files won't
contain any occurence of the sysroot or some build locations.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v4->v5:
- target hook now sanitizes the rpath (Baruch)
- add verbose support
- update comment

changes v3->v4:
- rebase
- add comment

changes v2->v3:
- move hook in Makefile (Baruch)
---
 Makefile | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Makefile b/Makefile
index 4b88116..69c1105 100644
--- a/Makefile
+++ b/Makefile
@@ -558,6 +558,8 @@ endif
 # RPATH fixing
 # - The host hook sets RPATH in host ELF binaries, using relative paths to the
 #   library locations.
+# - The target hook sanitizes RPATH in target ELF binaries, removing pathes
+#   pointing to package's build directories or the sysroot's libdirs.
 PACKAGES += host-patchelf
 
 define HOST_FIX_RPATH_HOOK
@@ -571,6 +573,17 @@ endef
 
 TARGET_FINALIZE_HOOKS += HOST_FIX_RPATH_HOOK
 
+define TARGET_SANITIZE_RPATH_HOOK
+	$(TOPDIR)/support/scripts/fix_rpaths \
+		sanitize $(TARGET_DIR) \
+		$(if $(V),--verbose) \
+		--patchelf-program $(HOST_DIR)/usr/bin/patchelf \
+		--patterns "($(STAGING_DIR)|`readlink -f $(STAGING_DIR)`)/(usr/)?lib$$" \
+			"($(BUILD_DIR)|`readlink -f $(BUILD_DIR)`)/.*"
+endef
+
+TARGET_FINALIZE_HOOKS += TARGET_SANITIZE_RPATH_HOOK
+
 $(TARGETS_ROOTFS): target-finalize
 
 target-finalize: $(PACKAGES)
-- 
2.4.5
