From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 26 Nov 2015 23:13:41 +0100
Subject: [Buildroot] [PATCH 2/2] package/skeleton: also handle merged /usr
	in the staging
In-Reply-To: <cover.1448575841.git.yann.morin.1998@free.fr>
References: <cover.1448575841.git.yann.morin.1998@free.fr>
Message-ID: <0934812eeec64cb2cdc2b7600879b53695859652.1448575841.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the target uses a merged /usr setup, gdbserver will only report
paths in /lib to the remote gdb, which in turn will only look libraries
in staging/lib and never in staging/usr/lib.

So. the mreged (or non-merged) /usr setup must be replicated in the
staging.

The best solution where to do so is in the skeleton package, since it
is guaranteed to come before any package that installs things in the
staging, and even before the (internal or external) toolchain as well.

Reported-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                     |  9 ++-------
 package/skeleton/skeleton.mk | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 71c6836..2809e00 100644
--- a/Makefile
+++ b/Makefile
@@ -456,14 +456,9 @@ else
 LIB_SYMLINK = lib32
 endif
 
+# Populating the staging with the base directories in handled by the skeleton package
 $(STAGING_DIR):
-	@mkdir -p $(STAGING_DIR)/bin
-	@mkdir -p $(STAGING_DIR)/lib
-	@ln -snf lib $(STAGING_DIR)/$(LIB_SYMLINK)
-	@mkdir -p $(STAGING_DIR)/usr/lib
-	@ln -snf lib $(STAGING_DIR)/usr/$(LIB_SYMLINK)
-	@mkdir -p $(STAGING_DIR)/usr/include
-	@mkdir -p $(STAGING_DIR)/usr/bin
+	@mkdir -p $(STAGING_DIR)
 	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
 
 RSYNC_VCS_EXCLUSIONS = \
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index b296cbd..205687c 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -13,6 +13,9 @@ SKELETON_SOURCE =
 # on skeleton.
 SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
 
+# The skeleton also handles the merged /usr case in the sysroot
+SKELETON_INSTALL_STAGING = YES
+
 ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
 
 SKELETON_PATH = $(call qstrip,$(BR2_ROOTFS_SKELETON_CUSTOM_PATH))
@@ -85,6 +88,21 @@ define SKELETON_INSTALL_TARGET_CMDS
 		$(TARGET_DIR_WARNING_FILE)
 endef
 
+# For the staging dir, we don't really care about /bin and /sbin.
+# But for consistency with the target dir, and to simplify the code,
+# we still handle them for the merged or non-merged /usr cases.
+# Since the toolchain is not yet available, the staging is not yet
+# populated, so we need to create the directories in /usr
+define SKELETON_INSTALL_STAGING_CMDS
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/lib
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/bin
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/sbin
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include
+	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
+	ln -snf lib $(STAGING_DIR)/$(LIB_SYMLINK)
+	ln -snf lib $(STAGING_DIR)/usr/$(LIB_SYMLINK)
+endef
+
 SKELETON_TARGET_GENERIC_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
 SKELETON_TARGET_GENERIC_ISSUE = $(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
 SKELETON_TARGET_GENERIC_ROOT_PASSWD = $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
-- 
1.9.1
