From: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Date: Wed, 16 Mar 2016 17:15:01 +0530
Subject: [Buildroot] [ PATCH Selinux v11] refpolicy: new package
Message-ID: <1458128701-14841-1-git-send-email-niranjan.reddy@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

The patch is for adding selinux reference policy (refpolicy).
It is a complete SELinux policy that can be used as the system policy
for a variety of systems and used as the basis for creating other policies.

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Signed-off-by: David Graziano <david.graziano@rockwellcollins.com>

---
Changes v10 -> v11:
  - Removed refpolicy-contrib package to maintain it as a seperate patch (suggested by Thomas)
  - Removed  /sbin/restorecon condition check and added comments in S00selinux( how /proc/mounts are used to
    discover tmpfs mounts)
  - Removed variable REFPOLICY_POLICY_COMPILE and made Minor Indentation changes (suggested by Thomas).

Changed v9 -> v10:
  - Removed trailing slash at the end (REFPOLICY_SITE = http://oss.tresys.com/files/refpolicy)
  - Adds new menu option to select the SELinux state to be written
    to the /etc/selinux/config file for the target (D. Graziano)

Changes v8 -> v9:
  - Minor nit picks on spacing (Suggested by Samuel)

Changes v7 -> v8:
  - Changes REFPOLICY_MAKE_CMDS to REFPOLICY_MAKE_OPTS (Suggested by
    Samuel)
  - Added a help section to the custom git repo to explain why the
    refpolicy-contrib option is needed (Suggested by Samuel)
  - Added rsync exclusions to ensure no unneeded files are copied during
    the refpolicy-contrib sync (Suggested by Samuel)

Changes v6 -> v7:
  - Moving the refpolicy patch into a version specific folder to
    prevent it from being applied to the custom git repos. (Clayton S.)

Changes v5 -> v6:
  - Fixed references to GIT in config files (Suggested by Ryan B.)
  - Removed execute permissions on files (Suggested by Ryan B.)
  - Fixed spelling error and changed staging install to always install
    the documentation (Suggested by Samuel)

Changes v4 -> v5:
  - Removed TODO and dependency on glibc (Matt W.)
  - Added lib depends to meet policycoreutils limitation on std lib
    (Matt W.)
  - Added comment for when an option is not defined (Matt W.)
  - Removed largefile, locale, and wchar dependencies (Clayton S.)
  - Remove dependancy on host-python-pyxml (Ryan B.)
  - Forced package to use $(HOST_DIR)/usr/bin/python2 for python
    executable (Ryan B.)
  - Added host-python dependency (Clayton S.)
  - Removed config menu (suggested by Thomas P.)
  - Added patch to fix awk issue (Clayton S.)

Changes v3 -> v4:
  - Added a dependency on host-gawk and correct the awk calls
    in the makefile to use $(AWK)
  - Changed the default policy name to br_policy to differentiate
    the policy generated from refpolicy
  - Added a install step to create a /.autorelabel file to cause
    the file system to be relabeled by S12SELinux init script
  - Adding a default modules.conf file with an option to specify
    a different one. This will decrease the build time for
    refpolicy by removing unused policies. (implemented by
    Thomas P.)
  - Cleaned up the configure comments (implemented by Thomas).
  - Added a check to only install the documentation if the
    Buildroot option is enabled
  - Removed the build because the install step completes the
    same process. Also removed the clean step because it is
    being removed globally from buildroot (implemented by
    Thomas P.)
  - Added more error handling to the startup script to print
    a warning if SELinux fails to install the policy if it
    exists. This can be caused by the kernel not being configured
    with SELinux enabled

Changes v2 -> v3:
  - Changes patch naming convention (suggested by Thomas P.)
  - Added dependencies on BR2_TOOLCHAIN_HAS_THREADS and
    BR2_LARGEFILE (suggested by Thomas P.)
  - Removed configure option for a specific patch folder
    (suggested by Thomas P.)
  - Removed distribution configuration option (suggested by Thomas)
  - Changed the monolithic configuration option to a modular
    configuration option (suggested by Thomas P.)
  - Removed the refpolicy name option (suggested by Thomas P.)
  - Corrected gramatical and comment errors (suggested by Thomas P.)
  - Multiple style corrections to the mk file (suggested by Thomas P.)
  - Added a comment to clairfy the usage of the the host build
    options for a target build

Changes v1 -> v2:
  - General cleanup to the mk file to conform to the standard format
  - Fixed the patch naming to match the standard 4 digit numbering
  - Changed package dependencies into selects in the config
---
 package/Config.in                                  |   1 +
 .../0001-Fix-awk-references-to-use-variable.patch  |  42 +++
 package/refpolicy/Config.in                        | 131 +++++++
 package/refpolicy/S00selinux                       | 131 +++++++
 package/refpolicy/config                           |   8 +
 package/refpolicy/modules.conf                     | 406 +++++++++++++++++++++
 package/refpolicy/refpolicy.hash                   |   2 +
 package/refpolicy/refpolicy.mk                     | 112 ++++++
 8 files changed, 833 insertions(+)
 create mode 100644 package/refpolicy/2.20130424/0001-Fix-awk-references-to-use-variable.patch
 create mode 100644 package/refpolicy/Config.in
 create mode 100644 package/refpolicy/S00selinux
 create mode 100644 package/refpolicy/config
 create mode 100644 package/refpolicy/modules.conf
 create mode 100644 package/refpolicy/refpolicy.hash
 create mode 100644 package/refpolicy/refpolicy.mk

diff --git a/package/Config.in b/package/Config.in
index 2c7dc37..ec53cfe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1512,6 +1512,7 @@ endmenu
 
 menu "Security"
 	source "package/policycoreutils/Config.in"
+	source "package/refpolicy/Config.in"
 	source "package/setools/Config.in"
 endmenu
 
diff --git a/package/refpolicy/2.20130424/0001-Fix-awk-references-to-use-variable.patch b/package/refpolicy/2.20130424/0001-Fix-awk-references-to-use-variable.patch
new file mode 100644
index 0000000..8236fa2
--- /dev/null
+++ b/package/refpolicy/2.20130424/0001-Fix-awk-references-to-use-variable.patch
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
diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
new file mode 100644
index 0000000..ec72b3f
--- /dev/null
+++ b/package/refpolicy/Config.in
@@ -0,0 +1,131 @@
+config BR2_PACKAGE_REFPOLICY
+	bool "refpolicy"
+	select BR2_PACKAGE_POLICYCOREUTILS
+	select BR2_PACKAGE_BUSYBOX_SELINUX if BR2_PACKAGE_BUSYBOX
+	depends on BR2_TOOLCHAIN_HAS_THREADS # policycoreutils
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # policycoreutils
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
+comment "refpolicy needs a toolchain w/ threads, glibc or musl"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+
+if BR2_PACKAGE_REFPOLICY
+
+choice
+prompt "SELinux policy type"
+default BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
+
+config BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
+bool "Standard"
+help
+Standard SELinux policy
+
+config BR2_PACKAGE_REFPOLICY_TYPE_MCS
+bool "MCS"
+help
+SELinux policy with multi-catagory support
+
+config BR2_PACKAGE_REFPOLICY_TYPE_MLS
+bool "MLS"
+help
+SELinux policy with multi-catagory and multi-level support
+endchoice
+
+config BR2_PACKAGE_REFPOLICY_TYPE
+	string
+	default "standard" if BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
+	default "mcs" if BR2_PACKAGE_REFPOLICY_TYPE_MCS
+	default "mls" if BR2_PACKAGE_REFPOLICY_TYPE_MLS
+
+choice
+prompt "SELinux default state"
+default BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE
+
+config BR2_PACKAGE_REFPOLICY_STATE_ENFORCE
+bool "Enforcing"
+help
+SELinux security policy is enforced
+
+config BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE
+bool "Permissive"
+help
+SELinux prints warnings instead of enforcing
+
+config BR2_PACKAGE_REFPOLICY_STATE_DISABLE
+bool "Disabled"
+help
+No SELinux policy is loaded
+endchoice
+
+config BR2_PACKAGE_REFPOLICY_STATE
+	string
+	default "permissive" if BR2_PACKAGE_REFPOLICY_STATE_PERMISSIVE
+	default "enforcing" if BR2_PACKAGE_REFPOLICY_STATE_ENFORCE
+	default "disabled" if BR2_PACKAGE_REFPOLICY_STATE_DISABLE
+
+config BR2_PACKAGE_REFPOLICY_MODULES_FILE
+	string "Refpolicy modules configuration"
+	default "package/refpolicy/modules.conf"
+	help
+	  Location of a custom modules.conf file that lists the
+	  SELinux policy modules to be included in the compiled
+	  policy. See policy/modules.conf in the refpolicy sources for
+	  the complete list of available modules.
+	  NOTE: This file is only used if a Custom Git repo is
+	  not specified.
+
+config BR2_PACKAGE_REFPOLICY_MODULAR
+	bool "Build a modular SELinux policy"
+	help
+	  Select Y to build a modular SELinux policy. By default,
+	  a monolithic policy will be built to save space on the
+	  target. A modular policy can also be built if policies
+	  need to be modified without reloading the target.
+
+config BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
+	bool "Custom Git repository"
+	select BR2_PACKAGE_REFPOLICY_CONTRIB
+	help
+	 This option allows Buildroot to get the refpolicy source
+	 code from a Git repository. This option should generally
+	 be used to add custom SELinux policy to the base refpolicy
+	 without having to deal with lots of patches.
+
+	 Please note that with the current configuration of the
+	 mainline refpolicy git repositories, a refpolicy and a
+	 refpolicy-contrib git repo must be specified. These are
+	 linked using a git submodule which does not get initialized
+	 during the Buildroot build.
+
+if BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
+
+config BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL
+	string "URL of custom repository"
+
+config BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	help
+	  Revision to use in the typical format used by Git
+	  e.g. a SHA id, a tag, branch, ..
+
+endif
+
+endif
diff --git a/package/refpolicy/S00selinux b/package/refpolicy/S00selinux
new file mode 100644
index 0000000..36d6a01
--- /dev/null
+++ b/package/refpolicy/S00selinux
@@ -0,0 +1,131 @@
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
+   # Install modules
+   semodule -v -s ${SELINUXTYPE} -b /usr/share/selinux/${SELINUXTYPE}/base.pp \
+         -i $(ls /usr/share/selinux/${SELINUXTYPE}/*.pp | grep -v base) || \
+         failed "Failed to install the base policy"
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
+   echo "0" > /selinux/enforce || failed "Failed to disable enforcing mode"
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
+   printf -n "Initializing SELinux: "
+
+   # Check to see if the default policy has been installed
+   if [ "`sestatus | grep "SELinux status" | grep enabled`" == "" ]; then
+      if [ ! -f /etc/selinux/${SELINUXTYPE}/policy/policy.* ]
+      then
+         setup_selinux
+      else
+         echo "SELinux policy install failed. Check kernel and init config"
+         exit 1
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
+   echo "OK"
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
+
+exit $?
diff --git a/package/refpolicy/config b/package/refpolicy/config
new file mode 100644
index 0000000..5eee807
--- /dev/null
+++ b/package/refpolicy/config
@@ -0,0 +1,8 @@
+# This file controls the state of SELinux on the system.
+# SELINUX= can take one of these three values:
+#     enforcing - SELinux security policy is enforced.
+#     permissive - SELinux prints warnings instead of enforcing.
+#     disabled - No SELinux policy is loaded.
+SELINUX=permissive
+# SELINUXTYPE= name of the selinux policy to use
+SELINUXTYPE=refpolicy
diff --git a/package/refpolicy/modules.conf b/package/refpolicy/modules.conf
new file mode 100644
index 0000000..58282d8
--- /dev/null
+++ b/package/refpolicy/modules.conf
@@ -0,0 +1,406 @@
+#
+# This file contains a listing of available modules.
+# To prevent a module from  being used in policy
+# creation, set the module name to "off".
+#
+# For monolithic policies, modules set to "base" and "module"
+# will be built into the policy.
+#
+# For modular policies, modules set to "base" will be
+# included in the base module.  "module" will be compiled
+# as individual loadable modules.
+#
+
+# Layer: kernel
+# Module: corecommands
+# Required in base
+#
+# Core policy for shells, and generic programs
+# in /bin, /sbin, /usr/bin, and /usr/sbin.
+#
+corecommands = base
+
+# Layer: kernel
+# Module: corenetwork
+# Required in base
+#
+# Policy controlling access to network objects
+#
+corenetwork = base
+
+# Layer: kernel
+# Module: devices
+# Required in base
+#
+# Device nodes and interfaces for many basic system devices.
+#
+devices = base
+
+# Layer: kernel
+# Module: domain
+# Required in base
+#
+# Core policy for domains.
+#
+domain = base
+
+# Layer: kernel
+# Module: files
+# Required in base
+#
+# Basic filesystem types and interfaces.
+#
+files = base
+
+# Layer: kernel
+# Module: filesystem
+# Required in base
+#
+# Policy for filesystems.
+#
+filesystem = base
+
+# Layer: kernel
+# Module: kernel
+# Required in base
+#
+# Policy for kernel threads, proc filesystem,
+# and unlabeled processes and objects.
+#
+kernel = base
+
+# Layer: kernel
+# Module: mcs
+# Required in base
+#
+# Multicategory security policy
+#
+mcs = base
+
+# Layer: kernel
+# Module: mls
+# Required in base
+#
+# Multilevel security policy
+#
+mls = base
+
+# Layer: kernel
+# Module: selinux
+# Required in base
+#
+# Policy for kernel security interface, in particular, selinuxfs.
+#
+selinux = base
+
+# Layer: kernel
+# Module: terminal
+# Required in base
+#
+# Policy for terminals.
+#
+terminal = base
+
+# Layer: kernel
+# Module: ubac
+# Required in base
+#
+# User-based access control policy
+#
+ubac = base
+
+# Layer: admin
+# Module: bootloader
+#
+# Policy for the kernel modules, kernel image, and bootloader.
+#
+bootloader = module
+
+# Layer: admin
+# Module: consoletype
+#
+# Determine of the console connected to the controlling terminal.
+#
+consoletype = module
+
+# Layer: admin
+# Module: dmesg
+#
+# Policy for dmesg.
+#
+dmesg = module
+
+# Layer: admin
+# Module: netutils
+#
+# Network analysis utilities
+#
+netutils = module
+
+# Layer: admin
+# Module: su
+#
+# Run shells with substitute user and group
+#
+su = module
+
+# Layer: admin
+# Module: sudo
+#
+# Execute a command with a substitute user
+#
+sudo = module
+
+# Layer: admin
+# Module: usermanage
+#
+# Policy for managing user accounts.
+#
+usermanage = module
+
+# Layer: apps
+# Module: seunshare
+#
+# Filesystem namespacing/polyinstantiation application.
+#
+seunshare = module
+
+# Layer: kernel
+# Module: storage
+#
+# Policy controlling access to storage devices
+#
+storage = module
+
+# Layer: roles
+# Module: auditadm
+#
+# Audit administrator role
+#
+auditadm = module
+
+# Layer: roles
+# Module: logadm
+#
+# Log administrator role
+#
+logadm = module
+
+# Layer: roles
+# Module: secadm
+#
+# Security administrator role
+#
+secadm = module
+
+# Layer: roles
+# Module: staff
+#
+# Administrator's unprivileged user role
+#
+staff = module
+
+# Layer: roles
+# Module: sysadm
+#
+# General system administration role
+#
+sysadm = module
+
+# Layer: roles
+# Module: unprivuser
+#
+# Generic unprivileged user role
+#
+unprivuser = module
+
+# Layer: services
+# Module: postgresql
+#
+# PostgreSQL relational database
+#
+postgresql = module
+
+# Layer: services
+# Module: ssh
+#
+# Secure shell client and server policy.
+#
+ssh = module
+
+# Layer: services
+# Module: xserver
+#
+# X Windows Server
+#
+xserver = module
+
+# Layer: system
+# Module: application
+#
+# Policy for user executable applications.
+#
+application = module
+
+# Layer: system
+# Module: authlogin
+#
+# Common policy for authentication and user login.
+#
+authlogin = module
+
+# Layer: system
+# Module: clock
+#
+# Policy for reading and setting the hardware clock.
+#
+clock = module
+
+# Layer: system
+# Module: fstools
+#
+# Tools for filesystem management, such as mkfs and fsck.
+#
+fstools = module
+
+# Layer: system
+# Module: getty
+#
+# Policy for getty.
+#
+getty = module
+
+# Layer: system
+# Module: hostname
+#
+# Policy for changing the system host name.
+#
+hostname = module
+
+# Layer: system
+# Module: hotplug
+#
+# Policy for hotplug system, for supporting the
+# connection and disconnection of devices at runtime.
+#
+hotplug = module
+
+# Layer: system
+# Module: init
+#
+# System initialization programs (init and init scripts).
+#
+init = module
+
+# Layer: system
+# Module: ipsec
+#
+# TCP/IP encryption
+#
+ipsec = module
+
+# Layer: system
+# Module: iptables
+#
+# Policy for iptables.
+#
+iptables = module
+
+# Layer: system
+# Module: libraries
+#
+# Policy for system libraries.
+#
+libraries = module
+
+# Layer: system
+# Module: locallogin
+#
+# Policy for local logins.
+#
+locallogin = module
+
+# Layer: system
+# Module: logging
+#
+# Policy for the kernel message logger and system logging daemon.
+#
+logging = module
+
+# Layer: system
+# Module: lvm
+#
+# Policy for logical volume management programs.
+#
+lvm = module
+
+# Layer: system
+# Module: miscfiles
+#
+# Miscelaneous files.
+#
+miscfiles = module
+
+# Layer: system
+# Module: modutils
+#
+# Policy for kernel module utilities
+#
+modutils = module
+
+# Layer: system
+# Module: mount
+#
+# Policy for mount.
+#
+mount = module
+
+# Layer: system
+# Module: netlabel
+#
+# NetLabel/CIPSO labeled networking management
+#
+netlabel = module
+
+# Layer: system
+# Module: selinuxutil
+#
+# Policy for SELinux policy and userland applications.
+#
+selinuxutil = module
+
+# Layer: system
+# Module: setrans
+#
+# SELinux MLS/MCS label translation service.
+#
+setrans = module
+
+# Layer: system
+# Module: sysnetwork
+#
+# Policy for network configuration: ifconfig and dhcp client.
+#
+sysnetwork = module
+
+# Layer: system
+# Module: udev
+#
+# Policy for udev.
+#
+udev = module
+
+# Layer: system
+# Module: unconfined
+#
+# The unconfined domain.
+#
+unconfined = module
+
+# Layer: system
+# Module: userdomain
+#
+# Policy for user domains
+#
+userdomain = module
+
diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
new file mode 100644
index 0000000..eca53d7
--- /dev/null
+++ b/package/refpolicy/refpolicy.hash
@@ -0,0 +1,2 @@
+#From https://github.com/TresysTechnology/refpolicy/wiki/DownloadRelease
+sha256 6039ba854f244a39dc727cc7db25632f7b933bb271c803772d754d4354f5aef4  refpolicy-2.20130424.tar.bz2
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
new file mode 100644
index 0000000..831d16f
--- /dev/null
+++ b/package/refpolicy/refpolicy.mk
@@ -0,0 +1,112 @@
+################################################################################
+#
+# refpolicy
+#
+################################################################################
+
+REFPOLICY_VERSION = 2.20130424
+REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
+REFPOLICY_SITE = http://oss.tresys.com/files/refpolicy
+REFPOLICY_LICENSE = GPLv2
+REFPOLICY_LICENSE_FILES = COPYING
+
+# Cannot use multiple threads to build the reference policy
+REFPOLICY_MAKE = $(TARGET_MAKE_ENV) $(MAKE1)
+
+REFPOLICY_DEPENDENCIES += host-m4 host-checkpolicy host-policycoreutils \
+	host-setools host-gawk host-python policycoreutils
+
+REFPOLICY_INSTALL_STAGING = YES
+
+REFPOLICY_POLICY_NAME = br_policy
+
+# To apply board specific customizations, create a refpolicy folder in
+# BR2_GLOBAL_PATCH_DIR.  These patches will be applied after the patches
+# in package/refpolicy
+
+# Passing the HOST_CONFIGURE_OPTS to the target build because all of the
+# build utilities are expected to be on system. This fools the make files
+# into using the host built utilities to compile the SELinux policy for
+# the target.
+#
+# Note, the TEST_TOOLCHAIN option will also set the
+# LD_LIBRARY_PATH at run time.
+REFPOLICY_MAKE_OPTS = $(HOST_CONFIGURE_OPTS) \
+	TEST_TOOLCHAIN="$(HOST_DIR)"
+
+# Build requires python2 to run
+REFPOLICY_MAKE_ENV = \
+	PYTHON="$(HOST_DIR)/usr/bin/python2" \
+	AWK="$(HOST_DIR)/usr/bin/gawk" \
+	M4="$(HOST_DIR)/usr/bin/m4"
+
+
+ifeq ($(BR2_PACKAGE_REFPOLICY_MODULAR),y)
+REFPOLICY_MONOLITHIC = n
+else
+REFPOLICY_MONOLITHIC = y
+endif
+
+ifeq ($(BR2_PACKAGE_REFPOLICY_CUSTOM_GIT),y)
+define REFPOLICY_GIT_SUBMODULE_SETUP
+	rsync -ar $(RSYNC_VCS_EXCLUSIONS) $(REFPOLICY_CONTRIB_DIR)/* \
+		$(@D)/policy/modules/contrib/
+endef
+else
+REFPOLICY_MODULES_FILE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_MODULES_FILE))
+define REFPOLICY_CUSTOM_MODULES_CONF
+	cp $(REFPOLICY_MODULES_FILE) $(@D)/policy/modules.conf
+endef
+endif
+
+define REFPOLICY_CONFIGURE_CMDS
+	$(REFPOLICY_GIT_SUBMODULE_SETUP)
+	# If an external repo is used to build refpolicy, this preserves the
+	# custom modules.conf which defines the enabled components.
+	if [ -f $(@D)/policy/modules.conf ]; then \
+		mv $(@D)/policy/modules.conf $(@D)/modules.conf.bk ; \
+	fi
+	$(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) bare \
+		$(REFPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
+	$(SED) "/TYPE/c\TYPE = $(BR2_PACKAGE_REFPOLICY_TYPE)" $(@D)/build.conf
+	$(SED) "/MONOLITHIC/c\MONOLITHIC = $(REFPOLICY_MONOLITHIC)" $(@D)/build.conf
+	$(SED) "/NAME/c\NAME = $(REFPOLICY_POLICY_NAME)" $(@D)/build.conf
+	$(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) conf \
+		$(REFPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
+	if [ -f $(@D)/modules.conf.bk ]; then \
+		echo "[Preserved modules.conf]" ; \
+		mv $(@D)/modules.conf.bk $(@D)/policy/modules.conf ; \
+	fi
+	$(REFPOLICY_CUSTOM_MODULES_CONF)
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
+	$(INSTALL) -m 0755 -D package/refpolicy/config $(TARGET_DIR)/etc/selinux/config
+	$(SED) "/^SELINUXTYPE/c\SELINUXTYPE=$(REFPOLICY_POLICY_NAME)" \
+		$(TARGET_DIR)/etc/selinux/config
+	$(SED) "/^SELINUX=/c\SELINUX=$(BR2_PACKAGE_REFPOLICY_STATE)" \
+		$(TARGET_DIR)/etc/selinux/config
+	touch $(TARGET_DIR)/.autorelabel
+	$(RM) $(TARGET_DIR)/etc/selinux/$(REFPOLICY_POLICY_NAME)/booleans
+endef
+
+define REFPOLICY_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/refpolicy/S00selinux \
+		$(TARGET_DIR)/etc/init.d/S00selinux
+endef
+
+ifeq ($(BR2_PACKAGE_REFPOLICY_MODULAR),y)
+$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(REFPOLICY_POLICY_NAME)/policy
+$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(REFPOLICY_POLICY_NAME)/modules/active/modules
+$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(REFPOLICY_POLICY_NAME)/contexts/files
+touch $(TARGET_DIR)/etc/selinux/$(REFPOLICY_POLICY_NAME)/contexts/files/file_contexts.local
+endif
+
+$(eval $(generic-package))
-- 
2.5.0
