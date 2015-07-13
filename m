From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 13 Jul 2015 12:17:56 +0200
Subject: [Buildroot] [PATCH v3 3/4] Makefile: add TARGET_CLEAR_RPATH_HOOK to
	TARGET_FINALIZE_HOOKS
In-Reply-To: <1436782677-12557-1-git-send-email-s.martin49@gmail.com>
References: <1436782677-12557-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1436782677-12557-3-git-send-email-s.martin49@gmail.com>
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
changes v2->v3:
- move hook in Makefile (Baruch)
---
 Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Makefile b/Makefile
index ac387ea..9ae9afb 100644
--- a/Makefile
+++ b/Makefile
@@ -556,6 +556,14 @@ endef
 
 TARGET_FINALIZE_HOOKS += HOST_FIX_RPATH_HOOK
 
+define TARGET_CLEAR_RPATH_HOOK
+	$(TOPDIR)/support/scripts/fix_rpaths \
+		clear $(TARGET_DIR) \
+		--patchelf-program $(HOST_DIR)/usr/bin/patchelf
+endef
+
+TARGET_FINALIZE_HOOKS += TARGET_CLEAR_RPATH_HOOK
+
 target-finalize: $(PACKAGES)
 	@$(call MESSAGE,"Finalizing target directory")
 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
-- 
2.4.5
