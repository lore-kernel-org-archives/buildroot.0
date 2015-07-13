From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 13 Jul 2015 10:18:46 +0200
Subject: [Buildroot] [PATCH v2 3/4] package/patchelf: add
	TARGET_CLEAR_RPATH_HOOK to TARGET_FINALIZE_HOOKS
In-Reply-To: <1436775527-2484-1-git-send-email-s.martin49@gmail.com>
References: <1436775527-2484-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1436775527-2484-4-git-send-email-s.martin49@gmail.com>
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
 package/patchelf/patchelf.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/patchelf/patchelf.mk b/package/patchelf/patchelf.mk
index c831fcd..ead6396 100644
--- a/package/patchelf/patchelf.mk
+++ b/package/patchelf/patchelf.mk
@@ -22,3 +22,11 @@ define HOST_FIX_RPATH_HOOK
 endef
 
 TARGET_FINALIZE_HOOKS += HOST_FIX_RPATH_HOOK
+
+define TARGET_CLEAR_RPATH_HOOK
+	$(TOPDIR)/support/scripts/fix_rpaths \
+		clear $(TARGET_DIR) \
+		--patchelf-program $(HOST_DIR)/usr/bin/patchelf
+endef
+
+TARGET_FINALIZE_HOOKS += TARGET_CLEAR_RPATH_HOOK
-- 
2.4.5
