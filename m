From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Aug 2019 16:40:07 +0200
Subject: [Buildroot] [PATCHv2] core: ensure $BIANRES_DIR exist before
 post-image scripts
Message-ID: <20190804144007.25052-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Brent Generous <bgenerous@impinj.com>

When no filesystem is enabled, the $BINARIES_DIR is not created. Yet,
the post-image scripts are still run. When those want to generate an
image in there, they may fail as the dirctory does not exist (it did
exist before we started applying preparatory changes for top-level
parallel build, so scripts got to rely on that assumption).

Do in target-post-image as we do in the sdk rule: create the directory
before calling the scripts.

Signed-off-by: Brent Generous <bgenerous@impinj.com>
[yann.morin.1998 at free.fr:
  - create the directory before calling the scripts
  - don't drop the creation in the sdk rule
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ee382abf15..a941fc8c55 100644
--- a/Makefile
+++ b/Makefile
@@ -808,8 +808,9 @@ endif # merged /usr
 	touch $(TARGET_DIR)/usr
 
 .PHONY: target-post-image
-target-post-image: $(TARGETS_ROOTFS) target-finalize staging-finalize
+target-post-image: $(TARGETS_ROOTFS) target-finalize staging-finalize | $(BINARIES_DIR)
 	@rm -f $(ROOTFS_COMMON_TAR)
+	$(Q)mkdir -p $(BINARIES_DIR)
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
 		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
-- 
2.20.1
