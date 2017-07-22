From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 21:51:17 +0200
Subject: [Buildroot] [git commit] system: provide package-wide system
	variables and macros
Message-ID: <20170722194727.4F7E081DDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2de968f03a76c3feb5c7693cfc05a6342fcc12ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some macros, soon some variables, currently defined in the skeleton are
going to be used by other packages.

Some of those variables will be used as Makefile conditions (e.g. in
ifeq() conditions), so they *must* be defined before being used.

Since the skeleton package, starting with an 's', is included quite
late, those variables would not be available to most packages.

Offload the existing macros into the new system/system.mk file, that is
included early, before any package is. Rename the macros to appropriate
names.

Future commits will add new macros and variables in that file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                     |  1 +
 package/skeleton/skeleton.mk | 53 ++++---------------------------------
 system/system.mk             | 62 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 48 deletions(-)

diff --git a/Makefile b/Makefile
index fc86a70..7cab6fa 100644
--- a/Makefile
+++ b/Makefile
@@ -479,6 +479,7 @@ all: world
 # may rely on it.
 include Makefile.legacy
 
+include system/system.mk
 include package/Makefile.in
 # arch/arch.mk.* must be after package/Makefile.in because it may need to
 # complement variables defined therein, like BR_NO_CHECK_HASH_FOR.
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 0a8add6..3ae37c7 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -14,34 +14,6 @@ SKELETON_ADD_SKELETON_DEPENDENCY = NO
 # The skeleton also handles the merged /usr case in the sysroot
 SKELETON_INSTALL_STAGING = YES
 
-############
-# Macros available for use by any skeleton package:
-# - SKELETON_RSYNC
-# - SKELETON_LIB_SYMLINK
-
-# This function rsyncs the skeleton directory in $(1) to the destination
-# in $(2), which should be either $(TARTGET_DIR) or $(STAGING_DIR)
-define SKELETON_RSYNC
-	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
-		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
-		$(1)/ $(2)/
-endef
-
-# Make a symlink lib32->lib or lib64->lib as appropriate.
-# MIPS64/n32 requires lib32 even though it's a 64-bit arch.
-# $(1): base dir (either staging or target)
-ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
-define SKELETON_LIB_SYMLINK
-	ln -snf lib $(1)/lib64
-	ln -snf lib $(1)/usr/lib64
-endef
-else
-define SKELETON_LIB_SYMLINK
-	ln -snf lib $(1)/lib32
-	ln -snf lib $(1)/usr/lib32
-endef
-endif
-
 ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
 
 SKELETON_PATH = $(call qstrip,$(BR2_ROOTFS_SKELETON_CUSTOM_PATH))
@@ -93,25 +65,10 @@ SKELETON_PATH = system/skeleton
 
 endif # ! custom skeleton
 
-# This function handles the merged or non-merged /usr cases
-ifeq ($(BR2_ROOTFS_MERGED_USR),y)
-define SKELETON_USR_SYMLINKS_OR_DIRS
-	ln -snf usr/bin $(1)/bin
-	ln -snf usr/sbin $(1)/sbin
-	ln -snf usr/lib $(1)/lib
-endef
-else
-define SKELETON_USR_SYMLINKS_OR_DIRS
-	$(INSTALL) -d -m 0755 $(1)/bin
-	$(INSTALL) -d -m 0755 $(1)/sbin
-	$(INSTALL) -d -m 0755 $(1)/lib
-endef
-endif
-
 define SKELETON_INSTALL_TARGET_CMDS
-	$(call SKELETON_RSYNC,$(SKELETON_PATH),$(TARGET_DIR))
-	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
-	$(call SKELETON_LIB_SYMLINK,$(TARGET_DIR))
+	$(call SYSTEM_RSYNC,$(SKELETON_PATH),$(TARGET_DIR))
+	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
+	$(call SYSTEM_LIB_SYMLINK,$(TARGET_DIR))
 	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
 		$(TARGET_DIR_WARNING_FILE)
 endef
@@ -126,8 +83,8 @@ define SKELETON_INSTALL_STAGING_CMDS
 	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/bin
 	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/sbin
 	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include
-	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
-	$(call SKELETON_LIB_SYMLINK,$(STAGING_DIR))
+	$(call SYSTEM_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
+	$(call SYSTEM_LIB_SYMLINK,$(STAGING_DIR))
 endef
 
 # The TARGET_FINALIZE_HOOKS must be sourced only if the users choose to use the
diff --git a/system/system.mk b/system/system.mk
new file mode 100644
index 0000000..cab5c1d
--- /dev/null
+++ b/system/system.mk
@@ -0,0 +1,62 @@
+################################################################################
+#
+# system-related variables and macros
+#
+################################################################################
+
+# This file exists to define variables and macros that pertain to the system
+# settings, like rsyncing a directory for skeletons, or the /lib vs. /usr/lib
+# symlink handling.
+#
+# Some variables may be used as conditions in Makefile code, so they must be
+# defined properly before they are used; this file is included early, before
+# any package is.
+
+# - SYSTEM_USR_SYMLINKS_OR_DIRS
+#   create /lib, /bin and /sbin, either as directories or as symlinks to
+#   their /usr conterparts
+#
+# - SYSTEM_RSYNC
+#   rsync $(1) to $(2), with proper exclusions and rights
+#
+# - SYSTEM_LIB_SYMLINK
+#   create the appropriate /lib{32,64} symlinks
+#
+
+# This function handles the merged or non-merged /usr cases
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+define SYSTEM_USR_SYMLINKS_OR_DIRS
+	ln -snf usr/bin $(1)/bin
+	ln -snf usr/sbin $(1)/sbin
+	ln -snf usr/lib $(1)/lib
+endef
+else
+define SYSTEM_USR_SYMLINKS_OR_DIRS
+	$(INSTALL) -d -m 0755 $(1)/bin
+	$(INSTALL) -d -m 0755 $(1)/sbin
+	$(INSTALL) -d -m 0755 $(1)/lib
+endef
+endif
+
+# This function rsyncs the skeleton directory in $(1) to the destination
+# in $(2), which should be either $(TARTGET_DIR) or $(STAGING_DIR)
+define SYSTEM_RSYNC
+	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
+		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
+		$(1)/ $(2)/
+endef
+
+# Make a symlink lib32->lib or lib64->lib as appropriate.
+# MIPS64/n32 requires lib32 even though it's a 64-bit arch.
+# $(1): base dir (either staging or target)
+ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
+define SYSTEM_LIB_SYMLINK
+	ln -snf lib $(1)/lib64
+	ln -snf lib $(1)/usr/lib64
+endef
+else
+define SYSTEM_LIB_SYMLINK
+	ln -snf lib $(1)/lib32
+	ln -snf lib $(1)/usr/lib32
+endef
+endif
