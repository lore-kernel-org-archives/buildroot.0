From: Wolfgang Grandegger <wg@grandegger.com>
Date: Wed,  5 Jul 2017 18:53:08 +0200
Subject: [Buildroot] [PATCH v7 3/9] core: sanitize RPATH in staging tree at
	the end of target finalization
In-Reply-To: <1499273594-12106-1-git-send-email-wg@grandegger.com>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
Message-ID: <1499273594-12106-4-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We need that pachelf utility for RPATH sanitization.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index a22e87f..cdc3a64 100644
--- a/Makefile
+++ b/Makefile
@@ -456,6 +456,9 @@ else
 export BR_NO_CCACHE
 endif
 
+# We need patchelf for RPATH sanitization
+PACKAGES += host-patchelf
+
 # Scripts in support/ or post-build scripts may need to reference
 # these locations, so export them so it is easier to use
 export BR2_CONFIG
@@ -720,6 +723,9 @@ endif
 		$(call MESSAGE,"Executing post-build script $(s)"); \
 		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
+	@$(call MESSAGE,"Sanitizing RPATH in staging tree")
+	$(TOPDIR)/support/scripts/fix-rpath staging
+
 .PHONY: target-post-image
 target-post-image: $(TARGETS_ROOTFS) target-finalize
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
-- 
2.7.4
