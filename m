From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Mon, 5 Oct 2009 17:48:52 -0400
Subject: [Buildroot] [PATCH] Update liunx versions
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901DB775C@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The target/linux versions are all quite stale.  It's almost impossible
to keep this "current" but at least bring them up-to-date.

Details:

  1) Add 2.6.33 for BR2_KERNEL_NEXT_VERSION
  2) Add 2.6.32 for BR2_KERNEL_THIS_VERSION
  3) Update BR2_LINUX_2_6_STABLE to 2.6.31.2
  4) Remove MM related stuff since the mm tree is no longer available
  5) Update all the versions in Config.in.versions to the latest
     available.
  6) Add a help message for all the versions

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/target/linux/Config.in.advanced b/target/linux/Config.in.advanced
index a17e41a..c4ee2c3 100644
--- a/target/linux/Config.in.advanced
+++ b/target/linux/Config.in.advanced
@@ -33,6 +33,7 @@ source "target/linux/Config.in.versions"
 
 config BR2_KERNEL_PATCH_LEVEL
 	string
+	default $(BR2_KERNEL_LATEST_2_6_31) if BR2_LINUX_2_6_31 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default $(BR2_KERNEL_LATEST_2_6_30) if BR2_LINUX_2_6_30 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default $(BR2_KERNEL_LATEST_2_6_29) if BR2_LINUX_2_6_29 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default $(BR2_KERNEL_LATEST_2_6_28) if BR2_LINUX_2_6_28 && BR2_KERNEL_ADD_LATEST_MINORPATCH
@@ -44,6 +45,8 @@ config BR2_KERNEL_PATCH_LEVEL
 
 config BR2_KERNEL_NEXT_VERSION
 	string
+	default "2.6.33" if BR2_LINUX_2_6_32
+	default "2.6.32" if BR2_LINUX_2_6_31
 	default "2.6.31" if BR2_LINUX_2_6_30
 	default "2.6.30" if BR2_LINUX_2_6_29
 	default "2.6.29" if BR2_LINUX_2_6_28
@@ -54,6 +57,7 @@ config BR2_KERNEL_NEXT_VERSION
 
 config BR2_KERNEL_THIS_VERSION
 	string
+	default "2.6.32" if BR2_LINUX_2_6_32
 	default "2.6.31" if BR2_LINUX_2_6_31
 	default "2.6.30" if BR2_LINUX_2_6_30
 	default "2.6.29" if BR2_LINUX_2_6_29
@@ -67,19 +71,6 @@ config BR2_KERNEL_SITE
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
@@ -88,8 +79,6 @@ config BR2_KERNEL_PATCH_SITE
 	default "$(BR2_KERNEL_SITE)/testing" if 		BR2_KERNEL_ADD_RC_PATCH
 	default "$(BR2_KERNEL_SITE)/snapshots" if 		BR2_KERNEL_ADD_LATEST_SNAPSHOT
 	default "$(BR2_KERNEL_SITE)/snapshots" if 		BR2_KERNEL_ADD_SNAPSHOT
-	default "$(BR2_MM_PATCH_SITE)/$(BR2_MM_PATCH_DIR)/" if	BR2_KERNEL_ADD_LATEST_MM_PATCH
-	default "$(BR2_MM_PATCH_SITE)/$(BR2_MM_PATCH_DIR)/" if	BR2_KERNEL_ADD_MM_PATCH
 	default $(BR2_CUSTOM_LINUX26_PATCH_SITE) if 		BR2_LINUX26_CUSTOM
 
 config BR2_LINUX26_RC_VERSION
@@ -104,14 +93,6 @@ config BR2_LINUX26_RC_SNAPSHOT_VERSION
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
@@ -121,7 +102,15 @@ choice
 	  Select the specific Linux version you want to use
 
 config BR2_LINUX_2_6_STABLE
-	bool "The latest stable Linux kernel (2.6.30.2)"
+	bool "The latest stable Linux kernel (2.6.31.2)"
+
+config BR2_LINUX_2_6_32
+	bool "Linux 2.6.32"
+	select BR2_KERNEL_BASE
+
+config BR2_LINUX_2_6_31
+	bool "Linux 2.6.31"
+	select BR2_KERNEL_BASE
 
 config BR2_LINUX_2_6_30
 	bool "Linux 2.6.30"
@@ -151,10 +140,6 @@ config BR2_LINUX_2_6_24
 	bool "Linux 2.6.24"
 	select BR2_KERNEL_BASE
 
-config BR2_LINUX_2_6_31
-	bool "Linux 2.6.31"
-	select BR2_KERNEL_BASE
-
 config BR2_LINUX26_CUSTOM
 	bool "Linux <custom> version"
 
@@ -175,7 +160,7 @@ config BR2_CUSTOM_LINUX26_VERSION
 
 config BR2_CUSTOM_LINUX26_PATCH
 	string "patch name"
-	default "patch-2.6.31-rc4.bz2"
+	default "patch-2.6.32-rc3.bz2"
 	help
 	  Specify a patch to be downloaded
 
@@ -243,16 +228,6 @@ config BR2_KERNEL_ADD_SNAPSHOT
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
@@ -273,11 +248,6 @@ config BR2_KERNEL_GIT_LEVEL
 	default ""
 	depends on BR2_KERNEL_ADD_SNAPSHOT
 
-config BR2_KERNEL_MM_LEVEL
-	string "-mm patch level"
-	default ""
-	depends on BR2_KERNEL_ADD_MM_PATCH
-
 source "target/device/Config.in.linux.patches"
 
 config BR2_LINUX_BSP_PATCH
@@ -296,8 +266,6 @@ config BR2_KERNEL_PATCH
 	default "patch-$(BR2_LINUX26_RC_VERSION).bz2" if					BR2_KERNEL_ADD_RC_PATCH
 	default "patch-$(LINUX26_LATEST_GIT_VERSION).bz2" if					BR2_KERNEL_ADD_LATEST_SNAPSHOT
 	default "patch-$(BR2_LINUX26_SNAPSHOT_VERSION).bz2" if					BR2_KERNEL_ADD_SNAPSHOT
-	default "$(LINUX26_LATEST_MM_VERSION).bz2" if						BR2_KERNEL_ADD_LATEST_MM_PATCH
-	default "$(BR2_LINUX26_MM_VERSION).bz2"	if						BR2_KERNEL_ADD_MM_PATCH
 	default "$(BR2_CUSTOM_LINUX26_PATCH)" if						BR2_LINUX26_CUSTOM
 
 config BR2_EXTRA_VERSION
@@ -308,8 +276,6 @@ config BR2_EXTRA_VERSION
 	default "$(BR2_KERNEL_RC_LEVEL)" if					BR2_KERNEL_ADD_RC_PATCH
 	default "$(BR2_KERNEL_GIT_LEVEL)" if					BR2_KERNEL_ADD_LATEST_SNAPSHOT
 	default "$(BR2_KERNEL_GIT_LEVEL)" if					BR2_KERNEL_ADD_SNAPSHOT
-	default	"$(BR2_KERNEL_MM_LEVEL)" if					BR2_KERNEL_ADD_LATEST_MM_PATCH
-	default	"$(BR2_KERNEL_MM_LEVEL)" if					BR2_KERNEL_ADD_MM_PATCH
 	default	"$(BR2_CUSTOM_LINUX26_VERSION)" if				BR2_LINUX26_CUSTOM
 endmenu
 
@@ -339,8 +305,6 @@ config BR2_LINUX26_VERSION
 	default "$(BR2_LINUX26_RC_VERSION)" if					BR2_KERNEL_ADD_RC_PATCH		&& BR2_KERNEL_BASE
 	default "$(LINUX26_LATEST_GIT_VERSION)" if 				BR2_KERNEL_ADD_LATEST_SNAPSHOT
 	default "$(BR2_LINUX26_SNAPSHOT_VERSION)" if				BR2_KERNEL_ADD_SNAPSHOT		&& BR2_KERNEL_BASE
-	default "$(LINUX26_LATEST_MM_VERSION)" if 				BR2_KERNEL_ADD_LATEST_MM_PATCH
-	default "$(BR2_LINUX26_MM_VERSION)" if					BR2_KERNEL_ADD_MM_PATCH		&& BR2_KERNEL_BASE
 	default "$(BR2_KERNEL_THIS_VERSION)" if				      ! BR2_KERNEL_ADD_PATCH		&& BR2_KERNEL_BASE
 	default "$(BR2_KERNEL_CURRENT_VERSION)"if				BR2_LINUX_2_6_STABLE
 	default "$(BR2_CUSTOM_LINUX26_VERSION)" if				BR2_LINUX26_CUSTOM
diff --git a/target/linux/Config.in.versions b/target/linux/Config.in.versions
index d71504d..7f424b7 100644
--- a/target/linux/Config.in.versions
+++ b/target/linux/Config.in.versions
@@ -5,48 +5,66 @@
 
 config LINUX26_LATEST_RC_VERSION
 	string
-	default "2.6.31-rc4" if BR2_KERNEL_ADD_LATEST_RC_PATCH
+	default "2.6.32-rc3" if BR2_KERNEL_ADD_LATEST_RC_PATCH
 	help
-	  Not really available as of 20090103
+	  Released 2009-Oct-05.
 
 config LINUX26_LATEST_GIT_VERSION
 	string
-	default "2.6.30-rc4-git4" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
+	default "2.6.32-rc1-git7" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
+	help
+	  Released 2009-Oct-05.
 
-config LINUX26_LATEST_MM_VERSION
+config BR2_KERNEL_CURRENT_VERSION
 	string
-	default "2.6.28-rc2-mm1" if BR2_KERNEL_ADD_LATEST_MM_PATCH
+	default "2.6.31.2"
+	help
+	  This is the latest stable kernel (including minor version).
 
-config BR2_KERNEL_CURRENT_VERSION
+config BR2_KERNEL_LATEST_2_6_31
 	string
-	default "2.6.30.2"
+	default "2"
 	help
-	  This is the latest stable kernel (including minor version)
+	  Released 2009-Oct-05.
 
 config BR2_KERNEL_LATEST_2_6_30
 	string
-	default "2"
+	default "9"
+	help
+	  Released 2009-Oct-05, this is the last .30-stable release.
 
 config BR2_KERNEL_LATEST_2_6_29
 	string
 	default "6"
+	help
+	  Released 2009-Sep-09, this is the last .29-stable release.
 
 config BR2_KERNEL_LATEST_2_6_28
 	string
 	default "10"
+	help
+	  Released 2009-May-02, this is the last .28-stable release.
 
 config BR2_KERNEL_LATEST_2_6_27
 	string
-	default "27"
+	default "36"
+	help
+	  Released 2009-Oct-05.
 
 config BR2_KERNEL_LATEST_2_6_26
 	string
 	default "8"
+	help
+	  Released 2008-Nov-10, this is the last .26-stable release.
 
 config BR2_KERNEL_LATEST_2_6_25
 	string
-	default "19"
+	default "20"
+	help
+	  Released 2008-Nov-10.
 
 config BR2_KERNEL_LATEST_2_6_24
 	string
 	default "7"
+	help
+	  Released 2008-May-07.
diff --git a/target/linux/Makefile.in.advanced b/target/linux/Makefile.in.advanced
index b4774ca..6ad4130 100644
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
