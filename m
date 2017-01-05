From: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
Date: Thu,  5 Jan 2017 12:10:26 -0600
Subject: [Buildroot] [PATCH 2/3] refpolicy: add default & custom
	modules.conf options
In-Reply-To: <1483639827-25678-1-git-send-email-bryce.ferguson@rockwellcollins.com>
References: <1483639827-25678-1-git-send-email-bryce.ferguson@rockwellcollins.com>
Message-ID: <1483639827-25678-2-git-send-email-bryce.ferguson@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

This patch adds the ability to specify custom paths for modules.conf
as well as provides a default file. The default file enables only a
minimal amount of modules which reduces build time.

Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
---
 package/refpolicy/Config.in    |  11 ++
 package/refpolicy/modules.conf | 430 +++++++++++++++++++++++++++++++++++++++++
 package/refpolicy/refpolicy.mk |   6 +
 3 files changed, 447 insertions(+)
 create mode 100644 package/refpolicy/modules.conf

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 6ed0bff..3701370 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -88,4 +88,15 @@ config BR2_PACKAGE_REFPOLICY_STATE
 	default "enforcing" if BR2_PACKAGE_REFPOLICY_STATE_ENFORCE
 	default "disabled" if BR2_PACKAGE_REFPOLICY_STATE_DISABLE
 
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
 endif
diff --git a/package/refpolicy/modules.conf b/package/refpolicy/modules.conf
new file mode 100644
index 0000000..2304dc4
--- /dev/null
+++ b/package/refpolicy/modules.conf
@@ -0,0 +1,430 @@
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
+# Module: alsa
+# Required in base
+#
+# alsa types and interfaces.
+#
+alsa = base
+
+# Layer: kernel
+# Module: mta
+# Required in base
+#
+# mta types and interfaces.
+#
+mta = base
+
+# Layer: kernel
+# Module: apache
+# Required in base
+#
+# apache types and interfaces.
+#
+apache = base
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
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 9b3e1c5..0ac6e4f 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -34,6 +34,11 @@ REFPOLICY_MAKE_ENV = \
 	AWK="$(HOST_DIR)/usr/bin/gawk" \
 	M4="$(HOST_DIR)/usr/bin/m4"
 
+REFPOLICY_MODULES_FILE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_MODULES_FILE))
+define REFPOLICY_CUSTOM_MODULES_CONF
+	cp $(REFPOLICY_MODULES_FILE) $(@D)/policy/modules.conf
+endef
+
 define REFPOLICY_CONFIGURE_CMDS
 	$(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) bare \
 		$(REFPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
@@ -43,6 +48,7 @@ define REFPOLICY_CONFIGURE_CMDS
 
 	$(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) conf \
 		$(REFPOLICY_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
+	$(REFPOLICY_CUSTOM_MODULES_CONF)
 endef
 
 define REFPOLICY_INSTALL_STAGING_CMDS
-- 
1.9.1
