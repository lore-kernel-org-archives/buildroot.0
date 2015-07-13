From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 13 Jul 2015 12:54:29 +0200
Subject: [Buildroot] [PATCH v4 3/4] Makefile: add TARGET_CLEAR_RPATH_HOOK to
	TARGET_FINALIZE_HOOKS
In-Reply-To: <1436784870-17417-1-git-send-email-s.martin49@gmail.com>
References: <1436784870-17417-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1436784870-17417-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces the TARGET_CLEAR_RPATH_HOOK hook fixing the ELF
files' RPATH of the host tree (excluding the sysroot).

After running this hook, the RPATH from any target ELF files is empty.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v3->v4:
- rebase
- add comment

changes v2->v3:
- move hook in Makefile (Baruch)
---
 Makefile | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Makefile b/Makefile
index c161a33..d4913dc 100644
--- a/Makefile
+++ b/Makefile
@@ -545,6 +545,7 @@ endif
 # RPATH fixing
 # - The host hook sets RPATH in host ELF binaries, using relative paths to the
 #   library locations.
+# - The target hook empties RPATH in target ELF binaries.
 PACKAGES += host-patchelf
 
 define HOST_FIX_RPATH_HOOK
@@ -557,6 +558,14 @@ endef
 
 TARGET_FINALIZE_HOOKS += HOST_FIX_RPATH_HOOK
 
+define TARGET_CLEAR_RPATH_HOOK
+	$(TOPDIR)/support/scripts/fix_rpaths \
+		clear $(TARGET_DIR) \
+		--patchelf-program $(HOST_DIR)/usr/bin/patchelf
+endef
+
+TARGET_FINALIZE_HOOKS += TARGET_CLEAR_RPATH_HOOK
+
 $(TARGETS_ROOTFS): target-finalize
 
 target-finalize: $(PACKAGES)
-- 
2.4.5
