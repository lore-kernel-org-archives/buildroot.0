From: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
Date: Thu,  5 Jan 2017 12:10:25 -0600
Subject: [Buildroot] [PATCH 1/3] refpolicy: new package
Message-ID: <1483639827-25678-1-git-send-email-bryce.ferguson@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

The patch is for adding selinux reference policy (refpolicy).
It is a complete SELinux policy that can be used as the system policy
for a variety of systems and used as the basis for creating other policies.

Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
---
 package/Config.in                                  |   1 +
 .../0001-Fix-awk-references-to-use-variable.patch  |  42 +++++++
 .../0002-support-fc_sort-use-_FOR_BUILD.patch      |  27 +++++
 package/refpolicy/Config.in                        |  91 +++++++++++++++
 package/refpolicy/S00selinux                       | 124 +++++++++++++++++++++
 package/refpolicy/refpolicy.hash                   |   2 +
 package/refpolicy/refpolicy.mk                     |  67 +++++++++++
 7 files changed, 354 insertions(+)
 create mode 100644 package/refpolicy/0001-Fix-awk-references-to-use-variable.patch
 create mode 100644 package/refpolicy/0002-support-fc_sort-use-_FOR_BUILD.patch
 create mode 100644 package/refpolicy/Config.in
 create mode 100644 package/refpolicy/S00selinux
 create mode 100644 package/refpolicy/refpolicy.hash
 create mode 100644 package/refpolicy/refpolicy.mk

diff --git a/package/Config.in b/package/Config.in
index 6511c98..f73f529 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1679,6 +1679,7 @@ endmenu
 
 menu "Security"
 	source "package/policycoreutils/Config.in"
+	source "package/refpolicy/Config.in"
 	source "package/setools/Config.in"
 endmenu
 
diff --git a/package/refpolicy/0001-Fix-awk-references-to-use-variable.patch b/package/refpolicy/0001-Fix-awk-references-to-use-variable.patch
new file mode 100644
index 0000000..8236fa2
--- /dev/null
+++ b/package/refpolicy/0001-Fix-awk-references-to-use-variable.patch
@@ -0,0 +1,42 @@
+From 1d4c826e8de366bccb93f167cd9be834ab5911c8 Mon Sep 17 00:00:00 2001
+From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+Date: Fri, 8 May 2015 14:13:00 -0500
+Subject: [PATCH] Fix awk references to use variable
+
+Ensure all awk calls use the variable setup in the makefile rather than
+relying on the system.
+
+Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+---
+ Makefile | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 85d4cfb..3aa4b51 100644
+--- a/Makefile
++++ b/Makefile
+@@ -292,9 +292,9 @@ cmdline_mods := $(addsuffix .te,$(APPS_MODS))
+ cmdline_off := $(addsuffix .te,$(APPS_OFF))
+ 
+ # extract settings from modules.conf
+-mod_conf_base := $(addsuffix .te,$(sort $(shell awk '/^[[:blank:]]*[[:alpha:]]/{ if ($$3 == "$(configbase)") print $$1 }' $(mod_conf) 2> /dev/null)))
+-mod_conf_mods := $(addsuffix .te,$(sort $(shell awk '/^[[:blank:]]*[[:alpha:]]/{ if ($$3 == "$(configmod)") print $$1 }' $(mod_conf) 2> /dev/null)))
+-mod_conf_off := $(addsuffix .te,$(sort $(shell awk '/^[[:blank:]]*[[:alpha:]]/{ if ($$3 == "$(configoff)") print $$1 }' $(mod_conf) 2> /dev/null)))
++mod_conf_base := $(addsuffix .te,$(sort $(shell $(AWK) '/^[[:blank:]]*[[:alpha:]]/{ if ($$3 == "$(configbase)") print $$1 }' $(mod_conf) 2> /dev/null)))
++mod_conf_mods := $(addsuffix .te,$(sort $(shell $(AWK) '/^[[:blank:]]*[[:alpha:]]/{ if ($$3 == "$(configmod)") print $$1 }' $(mod_conf) 2> /dev/null)))
++mod_conf_off := $(addsuffix .te,$(sort $(shell $(AWK) '/^[[:blank:]]*[[:alpha:]]/{ if ($$3 == "$(configoff)") print $$1 }' $(mod_conf) 2> /dev/null)))
+ 
+ base_mods := $(cmdline_base)
+ mod_mods := $(cmdline_mods)
+@@ -308,7 +308,7 @@ off_mods += $(filter-out $(cmdline_off) $(cmdline_base) $(cmdline_mods), $(mod_c
+ off_mods += $(filter-out $(base_mods) $(mod_mods) $(off_mods),$(notdir $(detected_mods)))
+ 
+ # filesystems to be used in labeling targets
+-filesystems = $(shell mount | grep -v "context=" | egrep -v '\((|.*,)bind(,.*|)\)' | awk '/(ext[234]|btrfs| xfs| jfs).*rw/{print $$3}';)
++filesystems = $(shell mount | grep -v "context=" | egrep -v '\((|.*,)bind(,.*|)\)' | $(AWK) '/(ext[234]|btrfs| xfs| jfs).*rw/{print $$3}';)
+ fs_names := "btrfs ext2 ext3 ext4 xfs jfs"
+ 
+ ########################################
+-- 
+1.9.1
+
diff --git a/package/refpolicy/0002-support-fc_sort-use-_FOR_BUILD.patch b/package/refpolicy/0002-support-fc_sort-use-_FOR_BUILD.patch
new file mode 100644
index 0000000..a8322e6
--- /dev/null
+++ b/package/refpolicy/0002-support-fc_sort-use-_FOR_BUILD.patch
@@ -0,0 +1,27 @@
+From bbd4bd5407cccda7e29e1943c7c8ad5309c90d2f Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Fri, 23 Dec 2016 13:14:58 -0600
+Subject: [PATCH] refpolicy: support/fc_sort use *_FOR_BUILD
+Updates the one C based tool to use the CC_FOR_BUILD
+and respective flags variable as a full host build
+isn't required..
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+diff --git a/Makefile b/Makefile
+index 4feba89..3643d48 100644
+--- a/Makefile
++++ b/Makefile
+@@ -400,7 +400,7 @@ $(mod_conf) $(booleans): $(polxml)
+ # Generate the fc_sort program
+ #
+ $(fcsort) : $(support)/fc_sort.c
+-	$(verbose) $(CC) $(CFLAGS) $^ -o $@
++	$(verbose) $(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $^ -o $@
+ 
+ ########################################
+ #
+-- 
+1.9.1
+
diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
new file mode 100644
index 0000000..6ed0bff
--- /dev/null
+++ b/package/refpolicy/Config.in
@@ -0,0 +1,91 @@
+config BR2_PACKAGE_REFPOLICY
+	bool "refpolicy"
+	select BR2_PACKAGE_POLICYCOREUTILS
+	select BR2_PACKAGE_BUSYBOX_SELINUX if BR2_PACKAGE_BUSYBOX
+	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS # libsemanage
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libsemanage
+	depends on !BR2_STATIC_LIBS #libsemanage
+	depends on !BR2_arc # libsemanage
+	depends on BR2_TOOLCHAIN_USES_GLIBC # libsemanage
+	help
+	  The SELinux Reference Policy project (refpolicy) is a
+	  complete SELinux policy that can be used as the system
+	  policy for a variety of systems and used as the basis
+	  for creating other policies. Reference Policy was originally
+	  based on the NSA example policy, but aims to accomplish
+	  many additional goals.
+
+	  The current refpolicy does not fully support Buildroot
+	  and needs modifications to work with the default system
+	  file layout. These changes should be added as patches to
+	  the refpolicy that modify a single SELinux policy.
+
+	  The refpolicy works for the most part in permissive mode. Only the
+	  basic set of utilities are enabled in the example policy config and
+	  some of the pathing in the policies is not correct. Individual
+	  policies would need to be tweaked to get everything functioning
+	  properly.
+
+comment "refpolicy needs a glibc toolchain w/ thread, dynamic library"
+	depends on !BR2_arc
+	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_USES_GLIBC
+
+if BR2_PACKAGE_REFPOLICY
+
+choice
+	prompt "SELinux policy type"
+	default BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
+
+config BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
+	bool "Standard"
+	help
+	  Standard SELinux policy enabling type enforcement only
+
+config BR2_PACKAGE_REFPOLICY_TYPE_MCS
+	bool "MCS"
+	help
+	  SELinux policy with multi-category support
+
+config BR2_PACKAGE_REFPOLICY_TYPE_MLS
+	bool "MLS"
+	help
+	  SELinux policy with multi-category and multi-level support
+
+endchoice
+
+config BR2_PACKAGE_REFPOLICY_TYPE
+	string
+	default "standard" if BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
+	default "mcs" if BR2_PACKAGE_REFPOLICY_TYPE_MCS
+	default "mls" if BR2_PACKAGE_REFPOLICY_TYPE_MLS
+
+choice
+	prompt "SELinux default state"
+	default BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE
+
+config BR2_PACKAGE_REFPOLICY_STATE_ENFORCE
+	bool "Enforcing"
+	help
+	  SELinux security policy is enforced
+
+config BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE
+	bool "Permissive"
+	help
+	  SELinux prints warnings instead of enforcing
+
+config BR2_PACKAGE_REFPOLICY_STATE_DISABLE
+	bool "Disabled"
+	help
+	  No SELinux policy is loaded
+
+endchoice
+
+config BR2_PACKAGE_REFPOLICY_STATE
+	string
+	default "permissive" if BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE
+	default "enforcing" if BR2_PACKAGE_REFPOLICY_STATE_ENFORCE
+	default "disabled" if BR2_PACKAGE_REFPOLICY_STATE_DISABLE
+
+endif
diff --git a/package/refpolicy/S00selinux b/package/refpolicy/S00selinux
new file mode 100644
index 0000000..ea4fbfb
--- /dev/null
+++ b/package/refpolicy/S00selinux
@@ -0,0 +1,124 @@
+#!/bin/sh
+################################################################################
+#
+# This file labels the security contexts of memory based filesystems such as
+# /dev/ and checks for auto relabel request if '/.autorelabel' file exists.
+#
+# This script is a heavily stripped down and modified version of the one used
+# in CentOS 6.2
+#
+################################################################################
+
+failed()
+{
+   echo $1
+   exit 1
+}
+
+# Get SELinux config env vars
+. /etc/selinux/config || failed "Failed to source the SELinux config"
+
+setup_selinux() {
+   # Create required directories
+   mkdir -p /etc/selinux/${SELINUXTYPE}/policy/ ||
+         failed "Failed to create the policy folder"
+   mkdir -p /etc/selinux/${SELINUXTYPE}/modules/active/modules || \
+         failed "Failed to create the modules folder"
+   if [ ! -f /etc/selinux/${SELINUXTYPE}/contexts/files/file_contexts.local ]
+   then
+      touch /etc/selinux/${SELINUXTYPE}/contexts/files/file_contexts.local || \
+            failed "Failed to create the file_contexts.local file"
+   fi
+
+   # Load the policy to activate it
+   load_policy -i || failed "Failed to load the SELinux policy"
+}
+
+relabel_selinux() {
+   # if /sbin/init is not labeled correctly this process is running in the
+   # wrong context, so a reboot will be required after relabel
+   AUTORELABEL=
+
+   # Switch to Permissive mode
+   echo "0" > /sys/fs/selinux/enforce || failed "Failed to disable enforcing mode"
+
+   echo
+   echo "*** Warning -- SELinux ${SELINUXTYPE} policy relabel is required."
+   echo "*** Relabeling could take a very long time, depending on file"
+   echo "*** system size and speed of hard drives."
+
+   # Relabel mount points
+   restorecon $(awk '!/^#/ && $4 !~ /noauto/ && $2 ~ /^\// { print $2 }' /etc/fstab) \
+         >/dev/null 2>&1 || failed "Failed to relabel the mount points"
+
+   # Relabel file system
+   echo "Relabeling file systems"
+   restorecon -R -F / || failed "Failed to relabel the file system"
+
+   # Remove label
+   rm -f  /.autorelabel || failed "Failed to remove the autorelabel flag"
+
+   # Reboot to activate relabeled file system
+   echo "Automatic reboot in progress."
+   reboot -f
+}
+
+start() {
+   printf "Initializing SELinux: "
+
+   # Check to see if the default policy has been installed
+   if [ "`sestatus | grep "SELinux status" | grep enabled`" == "" ]; then
+      if [ ! -f /etc/selinux/${SELINUXTYPE}/policy/policy.* ]
+      then
+         setup_selinux
+      else
+           # Load the policy to activate it
+           load_policy -i || failed "Failed to load the SELinux policy"
+      fi
+   fi
+
+   # Check SELinux status
+   SELINUX_STATE=
+   if [ -e "/selinux/enforce" ] && [ "$(cat /proc/self/attr/current)" != "kernel" ]; then
+      if [ -r "/selinux/enforce" ] ; then
+         SELINUX_STATE=$(cat "/selinux/enforce")
+      else
+         # assume enforcing if you can't read it
+         SELINUX_STATE=1
+      fi
+   fi
+
+   # Context Label /dev/
+      /sbin/restorecon -R -F /dev 2>/dev/null
+
+   # Context Label tmpfs mounts.
+   # using /proc/mounts to discover tmpfs mounts
+      /sbin/restorecon -R -F $(awk '!/^#/ && $4 !~ /noauto/ && $2 ~ /^\// && $3 =="tmpfs" { print $2 }' /etc/fstab) >/dev/null 2>&1
+
+   # Clean up SELinux labels
+      restorecon -F /etc/mtab /etc/ld.so.cache /etc/resolv.conf >/dev/null 2>&1
+
+   # Check for filesystem relabel request
+   if [ -f /.autorelabel ] ; then
+      relabel_selinux
+   fi
+
+   echo "OK"
+}
+stop() {
+   # There is nothing to do
+   :
+}
+
+case "$1" in
+   start)
+      start
+      ;;
+   stop)
+      stop
+      ;;
+   *)
+      echo "Usage: $0 {start|stop}"
+      exit 1
+      ;;
+esac
diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
new file mode 100644
index 0000000..3ff37dc
--- /dev/null
+++ b/package/refpolicy/refpolicy.hash
@@ -0,0 +1,2 @@
+#From https://github.com/TresysTechnology/refpolicy/wiki/DownloadRelease
+sha256 2dd2f45a7132137afe8302805c3b7839739759b9ab73dd1815c01afe34ac99de  refpolicy-RELEASE_2_20151208.tar.gz
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
new file mode 100644
index 0000000..9b3e1c5
--- /dev/null
+++ b/package/refpolicy/refpolicy.mk
@@ -0,0 +1,67 @@
+################################################################################
+#
+# refpolicy
+#
+################################################################################
+
+REFPOLICY_VERSION = RELEASE_2_20151208
+
+# Do not use GitHub helper as git submodules are needed for refpolicy-contrib
+REFPOLICY_SITE = https://github.com/TresysTechnology/refpolicy.git
+REFPOLICY_SITE_METHOD = git
+REFPOLICY_GIT_SUBMODULES = y # Required for refpolicy-contrib
+REFPOLICY_LICENSE = GPLv2
+REFPOLICY_LICENSE_FILES = COPYING
+
+# Cannot use multiple threads to build the reference policy
+REFPOLICY_MAKE = $(TARGET_MAKE_ENV) $(MAKE1)
+
+REFPOLICY_DEPENDENCIES += host-m4 host-checkpolicy host-policycoreutils \
+						host-gawk host-python
+
+REFPOLICY_INSTALL_STAGING = YES
+
+REFPOLICY_POLICY_NAME = br_policy
+
+# Note, the TEST_TOOLCHAIN option will also set the
+# LD_LIBRARY_PATH at run time.
+REFPOLICY_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) \
+	TEST_TOOLCHAIN="$(HOST_DIR)"
+
+# Build requires python2 to run
+REFPOLICY_MAKE_ENV = \
+	PYTHON="$(HOST_DIR)/usr/bin/python2" \
+	AWK="$(HOST_DIR)/usr/bin/gawk" \
+	M4="$(HOST_DIR)/usr/bin/m4"
+
+define REFPOLICY_CONFIGURE_CMDS
+	$(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) bare \
+		$(REFPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
+	$(SED) "/TYPE/c\TYPE = $(BR2_PACKAGE_REFPOLICY_TYPE)" $(@D)/build.conf
+	$(SED) "/MONOLITHIC/c\MONOLITHIC = y" $(@D)/build.conf
+	$(SED) "/NAME/c\NAME = $(REFPOLICY_POLICY_NAME)" $(@D)/build.conf
+
+	$(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) conf \
+		$(REFPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
+endef
+
+define REFPOLICY_INSTALL_STAGING_CMDS
+	$(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) install-src install-headers \
+		install-docs $(REFPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
+endef
+
+define REFPOLICY_INSTALL_TARGET_CMDS
+	$(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) install \
+		$(REFPOLICY_MAKE_OPTS) DESTDIR=$(TARGET_DIR)
+	echo SELINUX=$(BR2_PACKAGE_REFPOLICY_STATE) > $(TARGET_DIR)/etc/selinux/config
+	echo SELINUXTYPE=$(REFPOLICY_POLICY_NAME) >> $(TARGET_DIR)/etc/selinux/config
+	touch $(TARGET_DIR)/.autorelabel
+	$(RM) $(TARGET_DIR)/etc/selinux/$(REFPOLICY_POLICY_NAME)/booleans
+endef
+
+define REFPOLICY_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/refpolicy/S00selinux \
+		$(TARGET_DIR)/etc/init.d/S00selinux
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
