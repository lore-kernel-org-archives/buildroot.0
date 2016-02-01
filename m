From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  1 Feb 2016 06:21:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/procps-ng: Fix install,
	procps-ng does not use /usr/bin anymore
Message-ID: <1454304096-22841-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We do not need to move binaries around anymore since this commit:
https://gitlab.com/procps-ng/procps/commit/430b559ba2826f80dffa840622ae0fc744000b13

Fixes
http://autobuild.buildroot.net/results/ab7/ab7ed83d60823c1b023c7b76fcbe9c20d537ed4c//

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
2.7.0
