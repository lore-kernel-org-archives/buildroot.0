From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Tue,  2 Jun 2015 08:28:22 -0500
Subject: [Buildroot] [PATCH v7 06/22] refpolicy: new package
In-Reply-To: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1433251718-3167-7-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clayton Shotwell <clshotwe@rockwellcollins.com>

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

---
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
 package/Config.in                                  |   2 +
 package/refpolicy-contrib/Config.in                |  19 +
 package/refpolicy-contrib/refpolicy-contrib.mk     |  18 +
 .../0001-Fix-awk-references-to-use-variable.patch  |  42 +++
 package/refpolicy/Config.in                        |  91 +++++
 package/refpolicy/S00selinux                       | 136 +++++++
 package/refpolicy/config                           |   8 +
 package/refpolicy/modules.conf                     | 406 +++++++++++++++++++++
 package/refpolicy/refpolicy.hash                   |   2 +
 package/refpolicy/refpolicy.mk                     | 117 ++++++
 10 files changed, 841 insertions(+)
 create mode 100644 package/refpolicy-contrib/Config.in
 create mode 100644 package/refpolicy-contrib/refpolicy-contrib.mk
 create mode 100644 package/refpolicy/2.20130424/0001-Fix-awk-references-to-use-variable.patch
 create mode 100644 package/refpolicy/Config.in
 create mode 100644 package/refpolicy/S00selinux
 create mode 100644 package/refpolicy/config
 create mode 100644 package/refpolicy/modules.conf
 create mode 100644 package/refpolicy/refpolicy.hash
 create mode 100644 package/refpolicy/refpolicy.mk

diff --git a/package/Config.in b/package/Config.in
index dfa06fc..23912c2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1340,6 +1340,8 @@ endmenu
 
 menu "Security"
 	source "package/policycoreutils/Config.in"
+	source "package/refpolicy/Config.in"
+	source "package/refpolicy-contrib/Config.in"
 	source "package/setools/Config.in"
 endmenu
 
diff --git a/package/refpolicy-contrib/Config.in b/package/refpolicy-contrib/Config.in
new file mode 100644
index 0000000..b518248
--- /dev/null
+++ b/package/refpolicy-contrib/Config.in
@@ -0,0 +1,19 @@
+if BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
+
+comment "A refpolicy contrib repository is required if using a refpolicy repo. (Contrib is a Git submodule of refpolicy)"
+
+config BR2_PACKAGE_REFPOLICY_CONTRIB
+	bool "refpolicy-contrib"
+	help
+	  A Git submodule of the refpolicy package.
+
+config BR2_PACKAGE_REFPOLICY_CONTRIB_CUSTOM_REPO_URL
+	string "URL of custom contrib submodule repository"
+
+config BR2_PACKAGE_REFPOLICY_CONTRIB_CUSTOM_REPO_VERSION
+	string "Custom contrib submodule repository version"
+	help
+	  Revision to use in the typical format used by Git
+	  e.g. a SHA id, a tag, branch, ..
+
+endif
diff --git a/package/refpolicy-contrib/refpolicy-contrib.mk b/package/refpolicy-contrib/refpolicy-contrib.mk
new file mode 100644
index 0000000..3d1c53e
--- /dev/null
+++ b/package/refpolicy-contrib/refpolicy-contrib.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# refpolicy-contrib
+#
+################################################################################
+
+ifeq ($(BR2_PACKAGE_REFPOLICY_CUSTOM_GIT),y)
+REFPOLICY_CONTRIB_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CONTRIB_CUSTOM_REPO_URL))
+REFPOLICY_CONTRIB_VERSION = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CONTRIB_CUSTOM_REPO_VERSION))
+REFPOLICY_CONTRIB_SITE_METHOD = git
+
+# Inherits license from refpolicy as normally this is a submodule
+REFPOLICY_CONTRIB_LICENSE = GPLv2
+endif
+
+# If refpolicy is from release archive, this contrib content is part of it.
+
+$(eval $(generic-package))
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
index 0000000..14d3d5b
--- /dev/null
+++ b/package/refpolicy/Config.in
@@ -0,0 +1,91 @@
+config BR2_PACKAGE_REFPOLICY
+	bool "refpolicy"
+	select BR2_PACKAGE_POLICYCOREUTILS
+	select BR2_PACKAGE_BUSYBOX_SELINUX
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
+	  file layout.  These changes should be added as patches to
+	  the refpolicy that modify a single SELinux policy.
+
+comment "refpolicy needs a toolchain w/ threads, glibc or musl"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+
+if BR2_PACKAGE_REFPOLICY
+
+choice
+	prompt "SELinux policy type"
+	default BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
+
+	config BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
+		bool "Standard"
+		help
+		  Standard SELinux policy
+
+	config BR2_PACKAGE_REFPOLICY_TYPE_MCS
+		bool "MCS"
+		help
+		  SELinux policy with multi-catagory support
+
+	config BR2_PACKAGE_REFPOLICY_TYPE_MLS
+		bool "MLS"
+		help
+		  SELinux policy with multi-catagory and multi-level support
+endchoice
+
+config BR2_PACKAGE_REFPOLICY_TYPE
+	string
+	default "standard" if BR2_PACKAGE_REFPOLICY_TYPE_STANDARD
+	default "mcs" if BR2_PACKAGE_REFPOLICY_TYPE_MCS
+	default "mls" if BR2_PACKAGE_REFPOLICY_TYPE_MLS
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
+	  a monolithing policy will be built to save space on the
+	  target. A modular policy can also be built if policies
+	  need to be modified without reloading the target.
+
+config BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
+	bool "Custom Git repository"
+	select BR2_PACKAGE_REFPOLICY_CONTRIB
+	help
+	 This option allows Buildroot to get the refpolicy source
+	 code from a Git repository.
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
index 0000000..f2ac2e6
--- /dev/null
+++ b/package/refpolicy/S00selinux
@@ -0,0 +1,136 @@
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
+   echo -n "Initializing SELinux: "
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
+   if [ -n "$SELINUX_STATE" -a -x /sbin/restorecon ] && fgrep " /dev " /proc/mounts >/dev/null 2>&1 ; then
+      /sbin/restorecon -R -F /dev 2>/dev/null
+   fi
+
+   # Context Label tmpfs mounts
+   if [ -n "$SELINUX_STATE" -a -x /sbin/restorecon ]; then
+      /sbin/restorecon -R -F $(awk '!/^#/ && $4 !~ /noauto/ && $2 ~ /^\// && $3 =="tmpfs" { print $2 }' /etc/fstab) >/dev/null 2>&1
+   fi
+
+   # Clean up SELinux labels
+   if [ -n "$SELINUX_STATE" -a -x /sbin/restorecon ]; then
+      restorecon -F /etc/mtab /etc/ld.so.cache /etc/resolv.conf >/dev/null 2>&1
+   fi
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
index 0000000..7956aaa
--- /dev/null
+++ b/package/refpolicy/refpolicy.mk
@@ -0,0 +1,117 @@
+################################################################################
+#
+# refpolicy
+#
+################################################################################
+
+ifeq ($(BR2_PACKAGE_REFPOLICY_CUSTOM_GIT),y)
+REFPOLICY_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL))
+REFPOLICY_VERSION = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_VERSION))
+REFPOLICY_SITE_METHOD = git
+REFPOLICY_DEPENDENCIES += refpolicy-contrib
+else
+REFPOLICY_VERSION = 2.20130424
+REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
+REFPOLICY_SITE = http://oss.tresys.com/files/refpolicy/
+endif
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
+# Pointing to the host compiler to build a sort application during the build.
+# The host compiler tools are not used for any part of the refpolicy build.
+# Note, the TEST_TOOLCHAIN option will also set the
+# LD_LIBRARY_PATH at run time.
+REFPOLICY_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
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
+	REFPOLICY_MONOLITHIC = n
+else
+	REFPOLICY_MONOLITHIC = y
+endif
+
+ifeq ($(BR2_PACKAGE_REFPOLICY_CUSTOM_GIT),y)
+define REFPOLICY_GIT_SUBMODULE_SETUP
+	rsync -ar $(REFPOLICY_CONTRIB_DIR)/* $(@D)/policy/modules/contrib/
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
+		$(REFPOLICY_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
+	$(SED) "/TYPE/c\TYPE = $(BR2_PACKAGE_REFPOLICY_TYPE)" $(@D)/build.conf
+	$(SED) "/MONOLITHIC/c\MONOLITHIC = $(REFPOLICY_MONOLITHIC)" $(@D)/build.conf
+	$(SED) "/NAME/c\NAME = $(REFPOLICY_POLICY_NAME)" $(@D)/build.conf
+	$(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) conf \
+		$(REFPOLICY_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
+	if [ -f $(@D)/modules.conf.bk ]; then \
+		echo "[Preserved modules.conf]" ; \
+		mv $(@D)/modules.conf.bk $(@D)/policy/modules.conf ; \
+	fi
+	$(REFPOLICY_CUSTOM_MODULES_CONF)
+endef
+
+define REFPOLICY_INSTALL_STAGING_CMDS
+	$(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) install-src install-headers \
+		install-docs $(REFPOLICY_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
+endef
+
+define REFPOLICY_INSTALL_TARGET_CMDS
+	$(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) install \
+		$(REFPOLICY_MAKE_CMDS) DESTDIR=$(TARGET_DIR)
+	$(INSTALL) -m 0755 -D package/refpolicy/config $(TARGET_DIR)/etc/selinux/config
+	$(SED) "/^SELINUXTYPE/c\SELINUXTYPE=$(REFPOLICY_POLICY_NAME)" \
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
+define REFPOLICY_POLICY_COMPILE
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(REFPOLICY_POLICY_NAME)/policy
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(REFPOLICY_POLICY_NAME)/modules/active/modules
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/selinux/$(REFPOLICY_POLICY_NAME)/contexts/files
+	touch $(TARGET_DIR)/etc/selinux/$(REFPOLICY_POLICY_NAME)/contexts/files/file_contexts.local
+endef
+
+ifeq ($(BR2_PACKAGE_REFPOLICY_MODULAR),y)
+	REFPOLICY_POST_INSTALL_TARGET_HOOKS += REFPOLICY_POLICY_COMPILE
+endif
+
+$(eval $(generic-package))
-- 
1.9.1
