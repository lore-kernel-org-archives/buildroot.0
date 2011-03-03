From: Martin Hicks <mort@bork.org>
Date: Thu,  3 Mar 2011 15:19:16 -0500
Subject: [Buildroot] [PATCH] Add package iscsitarget
Message-ID: <1299183556-8909-1-git-send-email-mort@bork.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This software allows linux systems to export block devices
as iSCSI targets that initiators can log in to and use.

Signed-off-by: Martin Hicks <mort@bork.org>
---
 package/Config.in                                  |    1 +
 package/iscsitarget/Config.in                      |   15 ++++++++
 .../iscsitarget/iscsitarget-depmod-variable.patch  |   23 ++++++++++++
 package/iscsitarget/iscsitarget-initd-shell.patch  |    8 ++++
 package/iscsitarget/iscsitarget-install-mode.patch |   11 ++++++
 package/iscsitarget/iscsitarget.mk                 |   39 ++++++++++++++++++++
 6 files changed, 97 insertions(+), 0 deletions(-)
 create mode 100644 package/iscsitarget/Config.in
 create mode 100644 package/iscsitarget/iscsitarget-depmod-variable.patch
 create mode 100644 package/iscsitarget/iscsitarget-initd-shell.patch
 create mode 100644 package/iscsitarget/iscsitarget-install-mode.patch
 create mode 100644 package/iscsitarget/iscsitarget.mk

diff --git a/package/Config.in b/package/Config.in
index 8690d95..455602d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -388,6 +388,7 @@ source "package/iperf/Config.in"
 source "package/iproute2/Config.in"
 source "package/ipsec-tools/Config.in"
 source "package/iptables/Config.in"
+source "package/iscsitarget/Config.in"
 source "package/iw/Config.in"
 source "package/kismet/Config.in"
 source "package/xl2tp/Config.in"
diff --git a/package/iscsitarget/Config.in b/package/iscsitarget/Config.in
new file mode 100644
index 0000000..0017822
--- /dev/null
+++ b/package/iscsitarget/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_ISCSITARGET
+	bool "iscsitarget"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  The iSCSI Enterprise Target software allows export block devices
+	  so they can be used as iSCSI Targets by other devices.
+
+	  http://sourceforge.net/apps/mediawiki/iscsitarget
+
+config BR2_PACKAGE_ISCSITARGET_KMOD
+	bool 'compile the iscsitarget kernel module'
+	depends on BR2_LINUX_KERNEL
+
+comment "iscsitarget kernel module depends on compiling a linux kernel"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/iscsitarget/iscsitarget-depmod-variable.patch b/package/iscsitarget/iscsitarget-depmod-variable.patch
new file mode 100644
index 0000000..089d045
--- /dev/null
+++ b/package/iscsitarget/iscsitarget-depmod-variable.patch
@@ -0,0 +1,23 @@
+--- iscsitarget-r402/Makefile.orig	2011-03-03 10:13:22.000000000 -0500
++++ iscsitarget-r402/Makefile	2011-03-03 10:14:00.000000000 -0500
+@@ -9,6 +9,8 @@
+ 
+ #export KSRC := /usr/src/linux
+ 
++DEPMOD = depmod
++
+ SUBDIRS := $(shell pwd)
+ 
+ ifeq ($(KSRC),)
+@@ -215,9 +217,9 @@ unpatch:
+ depmod:
+ 	@echo "Running depmod"
+ 	@if [ x$(DESTDIR) != x -o x$(INSTALL_MOD_PATH) != x ]; then \
+-		depmod -aq -b $(DESTDIR)$(INSTALL_MOD_PATH) $(KVER); \
++		$(DEPMOD) -aq -b $(DESTDIR)$(INSTALL_MOD_PATH) $(KVER); \
+ 	else \
+-		depmod -aq $(KVER); \
++		$(DEPMOD) -aq $(KVER); \
+ 	fi
+ 
+ install-files: install-usr install-etc install-doc install-kernel
diff --git a/package/iscsitarget/iscsitarget-initd-shell.patch b/package/iscsitarget/iscsitarget-initd-shell.patch
new file mode 100644
index 0000000..90e928e
--- /dev/null
+++ b/package/iscsitarget/iscsitarget-initd-shell.patch
@@ -0,0 +1,8 @@
+--- iscsitarget-r402/etc/initd/initd.orig	2011-03-03 14:33:23.000000000 -0500
++++ iscsitarget-r402/etc/initd/initd	2011-03-03 14:33:30.000000000 -0500
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ #
+ # Start the iSCSI Enterprise Target.
+ #
diff --git a/package/iscsitarget/iscsitarget-install-mode.patch b/package/iscsitarget/iscsitarget-install-mode.patch
new file mode 100644
index 0000000..5973151
--- /dev/null
+++ b/package/iscsitarget/iscsitarget-install-mode.patch
@@ -0,0 +1,11 @@
+--- iscsitarget-r402/Makefile	2011-03-03 12:08:18.000000000 -0500
++++ iscsitarget-r402.mod/Makefile	2011-03-03 12:06:31.000000000 -0500
+@@ -238,7 +238,7 @@ install-kernel: kernel/iscsi_trgt.ko
+ 				-execdir mv \{\} \{\}.orig \;; \
+ 		fi \
+ 	fi
+-	@install -vD kernel/iscsi_trgt.ko \
++	@install -vD -m 644 kernel/iscsi_trgt.ko \
+ 		$(DESTDIR)$(INSTALL_MOD_PATH)$(KMOD)/iscsi/iscsi_trgt.ko
+ 
+ install-usr: usr/ietd usr/ietadm
diff --git a/package/iscsitarget/iscsitarget.mk b/package/iscsitarget/iscsitarget.mk
new file mode 100644
index 0000000..195be24
--- /dev/null
+++ b/package/iscsitarget/iscsitarget.mk
@@ -0,0 +1,39 @@
+#
+# iscsitarget
+#
+ISCSITARGET_VERSION = r402
+ISCSITARGET_SOURCE = iscsitarget-$(ISCSITARGET_VERSION)svn.tar.gz
+ISCSITARGET_SITE_METHOD = svn
+ISCSITARGET_SITE = https://iscsitarget.svn.sourceforge.net/svnroot/iscsitarget/trunk
+
+ifeq ($(BR2_PACKAGE_ISCSITARGET_KMOD),y)
+ISCSITARGET_DEPENDENCIES = linux26
+endif
+
+define ISCSITARGET_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" CROSS_PREFIX=$(TARGET_CROSS) \
+	ARCH=$(BR2_ARCH) -C $(@D) \
+	$(if $(BR2_PACKAGE_ISCSITARGET_KMOD),KSRC="`pwd`/$(LINUX26_DIR)" kernel) \
+	usr
+endef
+
+define ISCSITARGET_INSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" \
+	ARCH=$(BR2_ARCH) -C $(@D) \
+	$(if $(BR2_PACKAGE_ISCSITARGET_KMOD), \
+		KSRC="`pwd`/$(LINUX26_DIR)" \
+		CROSS_PREFIX=$(TARGET_CROSS) \
+		DEPMOD="$(HOST_DIR)/usr/sbin/depmod" \
+		install-kernel depmod) \
+	install-usr
+	$(INSTALL) -vD -m 0640 $(@D)/etc/ietd.conf \
+		$(TARGET_DIR)/etc/iet/ietd.conf
+	$(INSTALL) -vD -m 0644 $(@D)/etc/initiators.allow \
+		$(TARGET_DIR)/etc/iet/initiators.allow
+	$(INSTALL) -vD -m 0644 $(@D)/etc/targets.allow \
+		$(TARGET_DIR)/etc/iet/targets.allow
+	$(INSTALL) -vD -m 755 $(@D)/etc/initd/initd \
+		$(TARGET_DIR)/etc/init.d/S60iscsi-target
+endef
+
+$(eval $(call GENTARGETS,package,iscsitarget))
-- 
1.5.6.5
