From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Apr 2010 23:40:57 +0200
Subject: [Buildroot] [PATCH 16/19] Remove BR2_GNU_TARGET_SUFFIX and compute
	GNU_TARGET_NAME
In-Reply-To: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
References: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3e832d4442a3260a0c82c33a63196ee22bae373c.1272490772.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of asking the user about the GNU target suffix, just compute
it automatically from the other configuration options.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in           |   18 ------------------
 Makefile            |    1 +
 package/Makefile.in |   21 +++++++++++++++++----
 3 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/Config.in b/Config.in
index bc4fec2..b051a37 100644
--- a/Config.in
+++ b/Config.in
@@ -103,24 +103,6 @@ config BR2_STAGING_DIR
 
 source	"target/device/Config.in.mirrors"
 
-config BR2_GNU_TARGET_SUFFIX
-	string "GNU target suffix"
-	default "linux-uclibcgnueabi" if BR2_ARM_EABI
-	default "linux-uclibc"
-	help
-	  The string used to pass to configure scripts via the
-	  --target= option.  Just specify the suffix here, the leading
-	  arch will be filled in automatically.
-
-	  Most users will want to stick with the default setting, though
-	  other users (most notably ARM EABI) like to add on to this in
-	  order to stay in line with gcc conventions.
-
-	  Default options are:
-	      linux-uclibcgnueabi for ARM EABI
-	      linux-uclibc for the rest
-	      gnuhurd-uclibc for the hurd
-
 config BR2_JLEVEL
 	int "Number of jobs to run simultaneously"
 	default "2"
diff --git a/Makefile b/Makefile
index 271db9c..607ec6d 100644
--- a/Makefile
+++ b/Makefile
@@ -214,6 +214,7 @@ ARCH:=$(call qstrip,$(BR2_ARCH))
 ifeq ($(ARCH),xtensa)
 ARCH:=$(ARCH)_$(call qstrip,$(BR2_xtensa_core_name))
 endif
+
 WGET:=$(call qstrip,$(BR2_WGET)) $(SPIDER) $(QUIET)
 SVN_CO:=$(call qstrip,$(BR2_SVN_CO)) $(QUIET)
 SVN_UP:=$(call qstrip,$(BR2_SVN_UP)) $(QUIET)
diff --git a/package/Makefile.in b/package/Makefile.in
index 5f7af99..acba382 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -96,19 +96,32 @@ TARGET_LDFLAGS=--sysroot $(STAGING_DIR)/
 endif
 #########################################################################
 
+# Compute GNU_TARGET_NAME and REAL_GNU_TARGET_NAME
+GNU_TARGET_NAME=$(ARCH)-linux
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+LIBC=uclibc
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
+LIBC=uclibc
+else
+LIBC=glibc
+endif
+
+ifeq ($(BR2_ARM_EABI),y)
+ABI=gnueabi
+endif
+
+REAL_GNU_TARGET_NAME=$(ARCH)-unknown-linux-$(LIBC)$(ABI)
+
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 
 # Quotes are needed for spaces et al in path components.
 TARGET_PATH="$(TOOLCHAIN_DIR)/bin:$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/bin:$(PATH)"
-GNU_TARGET_NAME=$(ARCH)-linux
-REAL_GNU_TARGET_NAME=$(ARCH)$(GNU_TARGET_SUFFIX)
 TARGET_CROSS=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 TOOLCHAIN_EXTERNAL_PREFIX:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
 TOOLCHAIN_EXTERNAL_PATH:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
 TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(TOOLCHAIN_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
-REAL_GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
-GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
 TARGET_CROSS=$(TOOLCHAIN_EXTERNAL_PATH)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
 endif
 TARGET_AR=$(TARGET_CROSS)ar
-- 
1.6.3.3
