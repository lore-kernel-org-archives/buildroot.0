From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jan 2019 23:05:39 +0100
Subject: [Buildroot] [PATCH 17/19] core: check for unique target files after
 all our cleanups
In-Reply-To: <cover.1546898693.git.yann.morin.1998@free.fr>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
Message-ID: <323375d8ccd086d6c26ba97ba4f0383ba6a2b4fb.1546898693.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Packages that install info pages will update the info index when doing
so. But we do not have that file in the target, so we do not care what
content that file has, or whether it is modified by many packages.

This is basically also valid for any file that we remove as part of our
target-finalize cleanups: the files are not in target.

Consequently, we will want to check for that condition to decide whether
a file should, or should not, be reported as being touched by more than
one package.

For that, we'll need check-uniq-files to be run after all our cleanups.
We even do it after the user-provided post-build scripts, in case they
are explicitly doing some cleanups of their own in those scripts.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index dcc738a1b6..aefbdd0e78 100644
--- a/Makefile
+++ b/Makefile
@@ -722,8 +722,6 @@ staging-finalize:
 .PHONY: target-finalize
 target-finalize: $(PACKAGES) host-finalize
 	@$(call MESSAGE,"Finalizing target directory")
-	# Check files that are touched by more than one package
-	./support/scripts/check-uniq-files -t target $(BUILD_DIR)/packages-file-list.txt
 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
@@ -786,6 +784,9 @@ endif
 		$(call MESSAGE,"Executing post-build script $(s)"); \
 		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
+	# Check files that are touched by more than one package
+	./support/scripts/check-uniq-files -t target $(BUILD_DIR)/packages-file-list.txt
+
 	touch $(TARGET_DIR)/usr
 
 .PHONY: target-post-image
-- 
2.14.1
