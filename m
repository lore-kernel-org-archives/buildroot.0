From: Noam Camus <noamc@ezchip.com>
Date: Sun, 22 Dec 2013 17:31:03 +0200
Subject: [Buildroot] [PATCH 02/29] ARC: [eznps] support OVERRIDE_SRCDIR
 feature for uclibc
Message-ID: <264C179F799EF24AB26D5319053335E80E59B737BC@ezexch.ezchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fix 2 issues:
1) need to set .config, which normally it is at post patch hook
2) need to rsync *.old directories/files excluded by --cvs-exclude

Signed-off-by: Noam Camus <noamc@ezchip.com>
---
 package/uclibc/uclibc.mk |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk index de9011f..def5388 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -457,7 +457,18 @@ define UCLIBC_SETUP_DOT_CONFIG
 		oldconfig
 endef
 
+ifeq ($(UCLIBC_OVERRIDE_SRCDIR),)
 UCLIBC_POST_PATCH_HOOKS += UCLIBC_SETUP_DOT_CONFIG
+else
+
+define UCLIBC_RSYNC_DOT_OLD_FILES
+	rsync -au --cvs-exclude --include core --include "*.old" \
+	$(UCLIBC_OVERRIDE_SRCDIR)/ $(@D)
+endef
+
+UCLIBC_PRE_CONFIGURE_HOOKS += UCLIBC_RSYNC_DOT_OLD_FILES 
+UCLIBC_PRE_CONFIGURE_HOOKS += UCLIBC_SETUP_DOT_CONFIG endif
 
 define UCLIBC_CONFIGURE_CMDS
 	$(MAKE1) -C $(UCLIBC_DIR) \
--
1.7.1
