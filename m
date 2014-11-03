From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Mon,  3 Nov 2014 09:42:36 -0300
Subject: [Buildroot] [RFC/PATCH] Makefile: guarantee reproducible permissions
In-Reply-To: <1415018556-28336-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1415018556-28336-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1415018556-28336-2-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the permission mode on many target rootfs files depend on the
user's umask at the time of building, and at the time of cloning the
repo. This is caused by two things:

1) Some packages and BR itself create files and directories on the
target with cp/mkdir/etc which depend on the umask at the time of
building.

2) We use rsync -a to copy the skeleton and overlay, leaving permissions
on the target exactly as they were on the host. These permissions are
not tracked by Git and depend on the user's umask at the time of cloning
(assuming no mode changes).

To fix (1), change the Makefile's $(SHELL) to always call a wrapper
script first that sets the umask to a sane fixed value (022) and then
calls the real shell.

To fix (2), use the --chmod option on rsync calls so we don't depend on
the current mode of those files.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 Makefile                         | 7 ++++---
 support/scripts/shell-wrapper.sh | 5 +++++
 2 files changed, 9 insertions(+), 3 deletions(-)
 create mode 100755 support/scripts/shell-wrapper.sh

diff --git a/Makefile b/Makefile
index 907a0fc..0f7db1e 100644
--- a/Makefile
+++ b/Makefile
@@ -203,7 +203,8 @@ else
 endif
 
 # we want bash as shell
-SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
+SHELL := $(TOPDIR)/support/scripts/shell-wrapper.sh \
+	 $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
 	 else if [ -x /bin/bash ]; then echo /bin/bash; \
 	 else echo sh; fi; fi)
 
@@ -476,7 +477,7 @@ RSYNC_VCS_EXCLUSIONS = \
 $(BUILD_DIR)/.root:
 	mkdir -p $(TARGET_DIR)
 	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
-		--chmod=Du+w --exclude .empty --exclude '*~' \
+		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
 		$(TARGET_SKELETON)/ $(TARGET_DIR)/
 	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
 	@ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
@@ -612,7 +613,7 @@ endif
 	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
 		$(call MESSAGE,"Copying overlay $(d)"); \
 		rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
-			--chmod=Du+w --exclude .empty --exclude '*~' \
+			--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
 			$(d)/ $(TARGET_DIR)$(sep))
 
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
diff --git a/support/scripts/shell-wrapper.sh b/support/scripts/shell-wrapper.sh
new file mode 100755
index 0000000..513b927
--- /dev/null
+++ b/support/scripts/shell-wrapper.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+umask 022
+
+exec "$@"
-- 
2.1.1
