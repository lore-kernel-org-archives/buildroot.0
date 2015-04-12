From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Apr 2015 18:37:50 +0200
Subject: [Buildroot] [PATCHv2 06/21] Makefile: use <pkg>-all-legal-info to
	implement the legal-info target
In-Reply-To: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1428856685-4403-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit changes the implementation of the global 'legal-info'
target to use the newly introduced per-package <pkg>-all-legal-info
target. This allows to avoid using the $(TARGET_HOST_DEPS) and
$(HOST_DEPS) variables that we are trying to remove.

It is worth mentionning that this commit might change the output of
'make legal-info' by making it more correct than it was. With the
existing implementations, we could be missing packages if they were
host packages, or target packages not properly selected in terms of
Config.in dependencies, and with a more than a two-level deep
dependency from a target package properly selected at the Config.in
level. This is because our previous logic was simply taking all
packages in the "TARGETS" (now called "PACKAGES") variable, which are
only the target packages explicitly selected in the .config file, and
doing a two-level deep recursion in the dependencies.

With this commit, we switch legal-info to use proper make-based
dependencies, so we no longer have the limitations we used to
have. For this reason, the output of 'make legal-info' after this
patch may contain *more* entries than before this patch, but it is
really because it is now correct.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index f4deec3..a22d99b 100644
--- a/Makefile
+++ b/Makefile
@@ -410,9 +410,6 @@ HOST_DEPS = $(sort $(foreach dep,\
 		$($(dep))))
 HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
 
-PACKAGES_LEGAL_INFO := $(patsubst %,%-legal-info,\
-		$(PACKAGES) $(TARGETS_HOST_DEPS) $(HOST_DEPS))
-
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR)
 
@@ -631,7 +628,7 @@ legal-info-prepare: $(LEGAL_INFO_DIR)
 	@$(call legal-warning,the toolchain has not been saved)
 	@cp $(BR2_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
 
-legal-info: dirs legal-info-clean legal-info-prepare $(PACKAGES_LEGAL_INFO) \
+legal-info: dirs legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p)-all-legal-info) \
 		$(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST)
 	@cat support/legal-info/README.header >>$(LEGAL_REPORT)
 	@if [ -r $(LEGAL_WARNINGS) ]; then \
-- 
2.1.0
