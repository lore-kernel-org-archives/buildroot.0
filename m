From: Stephan Hoffmann <sho@relinux.de>
Date: Sat, 27 Oct 2012 12:34:25 +0200
Subject: [Buildroot] [PATCH] Add "make target-clean" to clean TARGET_DIR
In-Reply-To: <508BAD52.4030000@free.fr>
References: <508BAD52.4030000@free.fr>
Message-ID: <1351334065-8602-1-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
 Makefile |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 0128839..01d232b 100644
--- a/Makefile
+++ b/Makefile
@@ -367,7 +367,7 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
 world: prepare dirs dependencies $(BASE_TARGETS) $(TARGETS_ALL)
 
-.PHONY: all world dirs clean distclean source outputmakefile \
+.PHONY: all world dirs clean distclean source outputmakefile target-clean \
 	legal-info legal-info-prepare legal-info-clean \
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
@@ -655,6 +655,15 @@ ifeq ($(NEED_WRAPPER),y)
 	$(Q)$(TOPDIR)/support/scripts/mkmakefile $(TOPDIR) $(O)
 endif
 
+target-clean:
+	rm -rf $(TARGET_DIR)
+	rm -f $(BUILD_DIR)/.root
+	find $(STAMP_DIR) -name ".stamp_target_installed*" -print | xargs rm -f
+	find $(STAMP_DIR) -name ".stamp_staging_installed*" -print | xargs rm -f
+	find $(BUILD_DIR) -name ".stamp_target_installed*" -print | xargs rm -f
+	find $(BUILD_DIR) -name ".stamp_staging_installed*" -print | xargs rm -f
+	rm $(STAMP_DIR)/ext-toolchain-installed
+
 clean:
 	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
 		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging \
-- 
1.7.0.4
