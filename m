From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun, 19 May 2013 20:58:12 +0100
Subject: [Buildroot] [PATCH] Remove spurious POST_UNINSTALL hook usage
Message-ID: <1368993492-7353-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

A couple of patches make use of XXX_POST_UNINSTALL_TARGET_HOOKS, which
is not a hook set that Buildroot actually supports.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/ccid/ccid.mk       |  7 -------
 package/xenomai/xenomai.mk | 10 ----------
 2 files changed, 17 deletions(-)

diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index a9e58d1..51c3887 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -19,11 +19,4 @@ endef
 CCID_POST_INSTALL_TARGET_HOOKS += CCID_INSTALL_UDEV_RULES
 endif
 
-define CCID_REMOVE_UDEV_RULES
-	if test -d $(TARGET_DIR)/etc/udev/rules.d ; then \
-		rm -f $(TARGET_DIR)/etc/udev/rules.d/92_pcscd_ccid.rules ; \
-	fi;
-endef
-CCID_POST_UNINSTALL_TARGET_HOOKS += CCID_REMOVE_UDEV_RULES
-
 $(eval $(autotools-package))
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index fbf20b5..720b22d 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -108,14 +108,4 @@ endef
 XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_INSTALL_UDEV_RULES
 endif # udev
 
-define XENOMAI_REMOVE_UDEV_RULES
-	if test -d $(TARGET_DIR)/etc/udev/rules.d ; then \
-		for f in $(@D)/ksrc/nucleus/udev/*.rules ; do \
-			rm -f $(TARGET_DIR)/etc/udev/rules.d/$$f ; \
-		done ; \
-	fi;
-endef
-
-XENOMAI_POST_UNINSTALL_TARGET_HOOKS += XENOMAI_REMOVE_UDEV_RULES
-
 $(eval $(autotools-package))
-- 
1.8.1.2
