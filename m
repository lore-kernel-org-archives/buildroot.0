From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 31 Dec 2010 08:43:05 +0100
Subject: [Buildroot] [git commit master 1/1] linux-fusion: bump to 8.1.2
Message-ID: <20101231074507.C3DD68F30B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1c962699fc4e6595d9f7ba0fe8b956b9dbbb830d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../linux-fusion-8.1.1-missing-include.patch       |   17 --------
 ...ux-fusion-8.1.2-fix-warnings-at-link-time.patch |   40 ++++++++++++++++++++
 package/linux-fusion/linux-fusion.mk               |    6 +-
 3 files changed, 43 insertions(+), 20 deletions(-)
 delete mode 100644 package/linux-fusion/linux-fusion-8.1.1-missing-include.patch
 create mode 100644 package/linux-fusion/linux-fusion-8.1.2-fix-warnings-at-link-time.patch

diff --git a/package/linux-fusion/linux-fusion-8.1.1-missing-include.patch b/package/linux-fusion/linux-fusion-8.1.1-missing-include.patch
deleted file mode 100644
index d7b6f23..0000000
--- a/package/linux-fusion/linux-fusion-8.1.1-missing-include.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-fusiondev.c does not compile due to TASK_INTERRUPTIBLE and other
-related constants not being defined.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: linux-fusion-8.1.1/linux/drivers/char/fusion/fusiondev.c
-===================================================================
---- linux-fusion-8.1.1.orig/linux/drivers/char/fusion/fusiondev.c	2010-07-16 22:49:23.000000000 +0200
-+++ linux-fusion-8.1.1/linux/drivers/char/fusion/fusiondev.c	2010-07-16 22:49:39.000000000 +0200
-@@ -32,6 +32,7 @@
- #include <linux/proc_fs.h>
- #include <linux/poll.h>
- #include <linux/init.h>
-+#include <linux/sched.h>
- #include <asm/io.h>
- #include <asm/uaccess.h>
- 
diff --git a/package/linux-fusion/linux-fusion-8.1.2-fix-warnings-at-link-time.patch b/package/linux-fusion/linux-fusion-8.1.2-fix-warnings-at-link-time.patch
new file mode 100644
index 0000000..7c46eaf
--- /dev/null
+++ b/package/linux-fusion/linux-fusion-8.1.2-fix-warnings-at-link-time.patch
@@ -0,0 +1,40 @@
+From 7884688ba7a2e4cb7772cbedb34245a7fc9bf9d9 Mon Sep 17 00:00:00 2001
+From: Lionel Landwerlin <llandwerlin@gmail.com>
+Date: Wed, 3 Nov 2010 10:25:17 +0100
+Subject: [PATCH] Fix warnings at link time
+
+Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
+---
+ linux/drivers/char/fusion/entries.c   |    2 +-
+ linux/drivers/char/fusion/fusiondev.c |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/linux/drivers/char/fusion/entries.c b/linux/drivers/char/fusion/entries.c
+index 11edd43..8d102cf 100644
+--- a/linux/drivers/char/fusion/entries.c
++++ b/linux/drivers/char/fusion/entries.c
+@@ -28,7 +28,7 @@
+ #include "fusiondev.h"
+ #include "entries.h"
+ 
+-struct timeval now;
++static struct timeval now;
+ 
+ void
+ fusion_entries_init(FusionEntries * entries,
+diff --git a/linux/drivers/char/fusion/fusiondev.c b/linux/drivers/char/fusion/fusiondev.c
+index 2457bc1..7c7680d 100644
+--- a/linux/drivers/char/fusion/fusiondev.c
++++ b/linux/drivers/char/fusion/fusiondev.c
+@@ -64,7 +64,7 @@
+ MODULE_LICENSE("GPL");
+ MODULE_AUTHOR("Denis Oliver Kropp <dok@directfb.org>");
+ 
+-struct proc_dir_entry *proc_fusion_dir;
++static struct proc_dir_entry *proc_fusion_dir;
+ 
+ static int fusion_major = FUSION_MAJOR;
+ 
+-- 
+1.6.0.6
+
diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index e7cd3e4..440b8b9 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -3,7 +3,7 @@
 # linux-fusion
 #
 #############################################################
-LINUX_FUSION_VERSION = 8.1.1
+LINUX_FUSION_VERSION = 8.1.2
 LINUX_FUSION_SOURCE = linux-fusion-$(LINUX_FUSION_VERSION).tar.gz
 LINUX_FUSION_SITE = http://directfb.org/downloads/Core/linux-fusion
 LINUX_FUSION_INSTALL_STAGING = YES
@@ -25,14 +25,14 @@ define LINUX_FUSION_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(LINUX_FUSION_MAKE_OPTS) -C $(@D)
 endef
 
-# Only the header file is needed in the staging directory
 define LINUX_FUSION_INSTALL_STAGING_CMDS
-	install -m 644 $(@D)/linux/include/linux/fusion.h $(STAGING_DIR)/usr/include/linux
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(LINUX_FUSION_MAKE_OPTS) INSTALL_MOD_PATH=$(STAGING_DIR) -C $(@D) headers_install
 endef
 
 define LINUX_FUSION_INSTALL_TARGET_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		$(LINUX_FUSION_MAKE_OPTS) \
+		INSTALL_MOD_PATH=$(TARGET_DIR) \
 		-C $(@D) install
 	mkdir -p $(LINUX_FUSION_ETC_DIR)
 	cp -dpf package/linux-fusion/40-fusion.rules $(LINUX_FUSION_ETC_DIR)
-- 
1.7.2.2
