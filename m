From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 13 Jul 2015 12:17:55 +0200
Subject: [Buildroot] [PATCH v3 2/4] Makefile: add HOST_FIX_RPATH_HOOK to
	TARGET_FINALIZE_HOOKS
In-Reply-To: <1436782677-12557-1-git-send-email-s.martin49@gmail.com>
References: <1436782677-12557-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1436782677-12557-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds host-patchelf as a target-finalize dependency, and
introduces the HOST_FIX_RPATH_HOOK hook fixing the ELF files' RPATH of
the host tree (excluding the sysroot).

After running this hook, the RPATH from any host ELF files is relative to
the binary location itself.

Note that, we avoid to fix RPATH in the sysroot, and in the external
toolcahin installation location.

As a first step toward a fully relocatable SDK, this change allows to get
the toolchain relocatable, but not yet the whole SDK.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v2->v3:
- move hook in Makefile (Baruch)
---
 Makefile | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Makefile b/Makefile
index daf692e..ac387ea 100644
--- a/Makefile
+++ b/Makefile
@@ -544,6 +544,18 @@ endif
 
 $(TARGETS_ROOTFS): target-finalize
 
+target-finalize: host-patchelf
+
+define HOST_FIX_RPATH_HOOK
+	$(TOPDIR)/support/scripts/fix_rpaths \
+		set $(HOST_DIR) \
+		--patchelf-program $(HOST_DIR)/usr/bin/patchelf \
+		--libdirs $(HOST_DIR)/usr/lib \
+		--exclude-dirs sysroot opt/ext-toolchain
+endef
+
+TARGET_FINALIZE_HOOKS += HOST_FIX_RPATH_HOOK
+
 target-finalize: $(PACKAGES)
 	@$(call MESSAGE,"Finalizing target directory")
 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
-- 
2.4.5
