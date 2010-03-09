From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Tue, 9 Mar 2010 12:08:35 -0600
Subject: [Buildroot] [PATCH] remove -mm linux patch options
Message-ID: <0D753D10438DA54287A00B027084269763682CDACA@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The -mm tree is really no longer available since the -next tree 
was created for testing.  It's not even listed on the kernel.org
site any longer.  Plus, the last one that was published as
available was pretty old, 2.6.28-rc2-mm1.

Remove all the -mm patch stuff from Buildroot to clean up the
Linux kernel selection.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/target/linux/Config.in.advanced b/target/linux/Config.in.advanced
index 6fb39b3..ca837d1 100644
--- a/target/linux/Config.in.advanced
+++ b/target/linux/Config.in.advanced
@@ -72,19 +72,6 @@ config BR2_KERNEL_SITE
 	string
 	default "http://ftp.kernel.org/pub/linux/kernel/v2.6"
 
-config BR2_MM_PATCH_SITE
-	string
-	default "http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-
-config BR2_MM_PATCH_DIR
-	string
-	default "$(BR2_DOWNLOAD_LINUX26_VERSION)/$(LINUX26_LATEST_MM_VERSION)" if BR2_KERNEL_ADD_LATEST_MM_PATCH
-	default "$(BR2_DOWNLOAD_LINUX26_VERSION)/$(BR2_LINUX26_MM_VERSION)" if BR2_KERNEL_ADD_MM_PATCH
-
-config BR2_RC_MM_PATCH_DIR
-	string
-	default "$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
-
 config BR2_KERNEL_PATCH_SITE
 	string
 	default "$(BR2_KERNEL_SITE)" if 			BR2_KERNEL_ADD_LATEST_MINORPATCH
@@ -93,8 +80,6 @@ config BR2_KERNEL_PATCH_SITE
 	default "$(BR2_KERNEL_SITE)/testing" if 		BR2_KERNEL_ADD_RC_PATCH
 	default "$(BR2_KERNEL_SITE)/snapshots" if 		BR2_KERNEL_ADD_LATEST_SNAPSHOT
 	default "$(BR2_KERNEL_SITE)/snapshots" if 		BR2_KERNEL_ADD_SNAPSHOT
-	default "$(BR2_MM_PATCH_SITE)/$(BR2_MM_PATCH_DIR)/" if	BR2_KERNEL_ADD_LATEST_MM_PATCH
-	default "$(BR2_MM_PATCH_SITE)/$(BR2_MM_PATCH_DIR)/" if	BR2_KERNEL_ADD_MM_PATCH
 	default $(BR2_CUSTOM_LINUX26_PATCH_SITE) if 		BR2_LINUX26_CUSTOM
 
 config BR2_LINUX26_RC_VERSION
@@ -109,14 +94,6 @@ config BR2_LINUX26_RC_SNAPSHOT_VERSION
 	string
 	default "$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-git$(BR2_KERNEL_GIT_LEVEL)" if BR2_KERNEL_ADD_SNAPSHOT
 
-config BR2_LINUX26_MM_VERSION
-	string
-	default "$(BR2_KERNEL_THIS_VERSION)-mm$(BR2_KERNEL_MM_LEVEL)" if BR2_KERNEL_ADD_MM_PATCH
-
-config BR2_LINUX26_RC_MM_VERSION
-	string
-	default "$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)" if BR2_KERNEL_ADD_MM_PATCH
-
 # ---------------------------------------------------------------------------
 
 choice
@@ -252,16 +229,6 @@ config BR2_KERNEL_ADD_SNAPSHOT
 	depends on !BR2_KERNEL_ADD_LATEST
 	select BR2_KERNEL_ADD_PATCH
 
-config BR2_KERNEL_ADD_LATEST_MM_PATCH
-	bool "Add _latest_ '-mm' patch for the stable linux kernel"
-	depends on BR2_KERNEL_ADD_LATEST
-	select BR2_KERNEL_ADD_PATCH
-
-config BR2_KERNEL_ADD_MM_PATCH
-	bool "Add an '-mm#' patch for the stable linux kernel"
-	depends on !BR2_KERNEL_ADD_LATEST
-	select BR2_KERNEL_ADD_PATCH
-
 endchoice
 
 config BR2_KERNEL_ADD_PATCH
@@ -282,11 +249,6 @@ config BR2_KERNEL_GIT_LEVEL
 	default ""
 	depends on BR2_KERNEL_ADD_SNAPSHOT
 
-config BR2_KERNEL_MM_LEVEL
-	string "-mm patch level"
-	default ""
-	depends on BR2_KERNEL_ADD_MM_PATCH
-
 source "target/device/Config.in.linux.patches"
 
 config BR2_LINUX_BSP_PATCH
@@ -305,8 +267,6 @@ config BR2_KERNEL_PATCH
 	default "patch-$(BR2_LINUX26_RC_VERSION).bz2" if					BR2_KERNEL_ADD_RC_PATCH
 	default "patch-$(LINUX26_LATEST_GIT_VERSION).bz2" if					BR2_KERNEL_ADD_LATEST_SNAPSHOT
 	default "patch-$(BR2_LINUX26_SNAPSHOT_VERSION).bz2" if					BR2_KERNEL_ADD_SNAPSHOT
-	default "$(LINUX26_LATEST_MM_VERSION).bz2" if						BR2_KERNEL_ADD_LATEST_MM_PATCH
-	default "$(BR2_LINUX26_MM_VERSION).bz2"	if						BR2_KERNEL_ADD_MM_PATCH
 	default "$(BR2_CUSTOM_LINUX26_PATCH)" if						BR2_LINUX26_CUSTOM
 
 config BR2_EXTRA_VERSION
@@ -317,8 +277,6 @@ config BR2_EXTRA_VERSION
 	default "$(BR2_KERNEL_RC_LEVEL)" if					BR2_KERNEL_ADD_RC_PATCH
 	default "$(BR2_KERNEL_GIT_LEVEL)" if					BR2_KERNEL_ADD_LATEST_SNAPSHOT
 	default "$(BR2_KERNEL_GIT_LEVEL)" if					BR2_KERNEL_ADD_SNAPSHOT
-	default	"$(BR2_KERNEL_MM_LEVEL)" if					BR2_KERNEL_ADD_LATEST_MM_PATCH
-	default	"$(BR2_KERNEL_MM_LEVEL)" if					BR2_KERNEL_ADD_MM_PATCH
 	default	"$(BR2_CUSTOM_LINUX26_VERSION)" if				BR2_LINUX26_CUSTOM
 endmenu
 
@@ -348,8 +306,6 @@ config BR2_LINUX26_VERSION
 	default "$(BR2_LINUX26_RC_VERSION)" if					BR2_KERNEL_ADD_RC_PATCH		&& BR2_KERNEL_BASE
 	default "$(LINUX26_LATEST_GIT_VERSION)" if 				BR2_KERNEL_ADD_LATEST_SNAPSHOT
 	default "$(BR2_LINUX26_SNAPSHOT_VERSION)" if				BR2_KERNEL_ADD_SNAPSHOT		&& BR2_KERNEL_BASE
-	default "$(LINUX26_LATEST_MM_VERSION)" if 				BR2_KERNEL_ADD_LATEST_MM_PATCH
-	default "$(BR2_LINUX26_MM_VERSION)" if					BR2_KERNEL_ADD_MM_PATCH		&& BR2_KERNEL_BASE
 	default "$(BR2_KERNEL_THIS_VERSION)" if				      ! BR2_KERNEL_ADD_PATCH		&& BR2_KERNEL_BASE
 	default "$(BR2_KERNEL_CURRENT_VERSION)"if				BR2_LINUX_2_6_STABLE
 	default "$(BR2_CUSTOM_LINUX26_VERSION)" if				BR2_LINUX26_CUSTOM
diff --git a/target/linux/Config.in.versions b/target/linux/Config.in.versions
index 7526bf6..c8bc09a 100644
--- a/target/linux/Config.in.versions
+++ b/target/linux/Config.in.versions
@@ -13,10 +13,6 @@ config LINUX26_LATEST_GIT_VERSION
 	string
 	default "2.6.30-rc4-git4" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
 
-config LINUX26_LATEST_MM_VERSION
-	string
-	default "2.6.28-rc2-mm1" if BR2_KERNEL_ADD_LATEST_MM_PATCH
-
 config BR2_KERNEL_CURRENT_VERSION
 	string
 	default "2.6.32.9"
diff --git a/target/linux/Makefile.in.advanced b/target/linux/Makefile.in.advanced
index 7679d1e..f87d14d 100644
--- a/target/linux/Makefile.in.advanced
+++ b/target/linux/Makefile.in.advanced
@@ -493,14 +493,12 @@ linux-status:
 	@echo BR2_LINUX_VERSION=$(BR2_LINUX_VERSION)
 	@echo BR2_LINUX26_CUSTOM=$(BR2_LINUX26_CUSTOM)
 	@echo BR2_LINUX26_VERSION=$(BR2_LINUX26_VERSION)
-	@echo BR2_KERNEL_ADD_LATEST_MM_PATCH=$(BR2_KERNEL_ADD_LATEST_MM_PATCH)
 	@echo BR2_KERNEL_ADD_LATEST_RC_PATCH=$(BR2_KERNEL_ADD_LATEST_RC_PATCH)
 	@echo BR2_KERNEL_ADD_LATEST_SNAPSHOT=$(BR2_KERNEL_ADD_LATEST_SNAPSHOT)
 	@echo BR2_KERNEL_ADD_MINORPATCH=$(BR2_KERNEL_ADD_MINORPATCH)
 	@echo BR2_KERNEL_ARCH_PATCH_DIR=$(BR2_KERNEL_ARCH_PATCH_DIR)
 	@echo BR2_KERNEL_GIT_LEVEL=$(BR2_KERNEL_GIT_LEVEL)
 	@echo BR2_KERNEL_MINORLEVEL=$(BR2_KERNEL_MINORLEVEL)
-	@echo BR2_KERNEL_MM_LEVEL=$(BR2_KERNEL_MM_LEVEL)
 	@echo BR2_KERNEL_PATCH=$(BR2_KERNEL_PATCH)
 	@echo BR2_KERNEL_PATCH_SITE=$(BR2_KERNEL_PATCH_SITE)
 	@echo BR2_KERNEL_RC_LEVEL=$(BR2_KERNEL_RC_LEVEL)
@@ -524,7 +522,6 @@ linux-status:
 	@echo LINUX26_KERNEL=$(LINUX26_KERNEL)
 	@echo LINUX26_KERNEL_NAME=$(LINUX26_KERNEL_NAME)
 	@echo LINUX26_LATEST_GIT_PATCH=$(LINUX26_LATEST_GIT_PATCH)
-	@echo LINUX26_LATEST_MM_PATCH=$(LINUX26_LATEST_MM_PATCH)
 	@echo LINUX26_LATEST_RC_PATCH=$(LINUX26_LATEST_RC_PATCH)
 	@echo LINUX26_PATCH_DIR=$(LINUX26_PATCH_DIR)
 	@echo LINUX26_SOURCE=$(LINUX26_SOURCE)
