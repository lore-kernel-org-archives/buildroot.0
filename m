From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jan 2019 23:05:38 +0100
Subject: [Buildroot] [PATCH 16/19] core: check unique files in the
 corresponding finalize step
In-Reply-To: <cover.1546898693.git.yann.morin.1998@free.fr>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
Message-ID: <543d715864419720bee6d5d858cf4c2debd773f0.1546898693.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the check for uniq files is done all in one location, during
target-finalize. This is historical, back from when we had a single
finalize step.

But we now have one for each of target, staging, and host.

So, mnove the check to the corresponding finalize steps.

This will help, later, if/when we introduce actions specific to each
step, that would have an impact on the result of check-uniq-files.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 9f4d037cca..dcc738a1b6 100644
--- a/Makefile
+++ b/Makefile
@@ -708,19 +708,22 @@ $(TARGETS_ROOTFS): target-finalize
 # Avoid the rootfs name leaking down the dependency chain
 target-finalize: ROOTFS=
 
+.PHONY: staging-finalize
 host-finalize: $(HOST_DIR_SYMLINK)
+	# Check files that are touched by more than one package
+	./support/scripts/check-uniq-files -t host $(BUILD_DIR)/packages-file-list-host.txt
 
 .PHONY: staging-finalize
 staging-finalize:
 	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
+	# Check files that are touched by more than one package
+	./support/scripts/check-uniq-files -t staging $(BUILD_DIR)/packages-file-list-staging.txt
 
 .PHONY: target-finalize
 target-finalize: $(PACKAGES) host-finalize
 	@$(call MESSAGE,"Finalizing target directory")
 	# Check files that are touched by more than one package
 	./support/scripts/check-uniq-files -t target $(BUILD_DIR)/packages-file-list.txt
-	./support/scripts/check-uniq-files -t staging $(BUILD_DIR)/packages-file-list-staging.txt
-	./support/scripts/check-uniq-files -t host $(BUILD_DIR)/packages-file-list-host.txt
 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
-- 
2.14.1
