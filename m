From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  7 Feb 2016 14:08:35 -0300
Subject: [Buildroot] [PATCH] procps-ng: drop pidof/watch file moves
Message-ID: <1454864915-20383-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new version bumped in 8239f454 installs them correctly to /bin so this
breaks the build. Fixes:
http://autobuild.buildroot.net/results/278/278e3a30173e241561336476cc484f1224ee71f9/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/procps-ng/procps-ng.mk | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index e0e89c4..febe5fb 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -19,18 +19,6 @@ PROCPS_NG_GETTEXTIZE = YES
 # wins the fight over who gets to have their utils actually installed.
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 PROCPS_NG_DEPENDENCIES += busybox
-# Also overwrite the remaining busybox symlinks for tools which are now
-# provided by procps-ng and got installed in /usr/bin instead of /bin.
-# Currently these tools are only pidof and watch. We only need to do
-# this if the /usr/bin and /bin directories are not merged.
-ifeq ($(BR2_ROOTFS_MERGED_USR),)
-define PROCPS_NG_MOVE_BINARIES
-	for i in pidof watch; do \
-		mv $(TARGET_DIR)/usr/bin/$$i $(TARGET_DIR)/bin/; \
-	done
-endef
-PROCPS_NG_POST_INSTALL_TARGET_HOOKS += PROCPS_NG_MOVE_BINARIES
-endif
 endif
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-- 
2.4.10
