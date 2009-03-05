From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Thu,  5 Mar 2009 14:40:25 +0100
Subject: [Buildroot] device mapper + lvm2: build together
In-Reply-To: <>
References: <>
Message-ID: <1236260425-11718-1-git-send-email-razzor@kopf-tisch.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Both packages are merged upstream and are now build from one source tree.
- bump lvm2 version to 2.02.44 (contains device-mapper 1.02.30)
- fix bogous linking of ncurses when no readline support is found
- add uninstall target
- copy default config to /etc/lvm
- always build whole package but split install into two parts (device mapper and lvm2 suite)
- let all packages that selected "dm" now select "lvm2"
- remove package dm
---
 package/Config.in        |    1 -
 package/dm/Config.in     |    9 ---
 package/dm/dm.mk         |  129 ----------------------------------------------
 package/dmraid/Config.in |    2 +-
 package/dmraid/dmraid.mk |    2 +-
 package/lvm2/Config.in   |   29 +++++++++--
 package/lvm2/lvm2.mk     |  122 +++++++++++++++++++------------------------
 7 files changed, 80 insertions(+), 214 deletions(-)
 delete mode 100644 package/dm/Config.in
 delete mode 100644 package/dm/dm.mk

diff --git a/package/Config.in b/package/Config.in
index 59d2a43..7672d8b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -226,7 +226,6 @@ source "package/acpid/Config.in"
 source "package/dbus/Config.in"
 source "package/dbus-glib/Config.in"
 source "package/devmem2/Config.in"
-source "package/dm/Config.in"
 source "package/dmraid/Config.in"
 source "package/e2fsprogs/Config.in"
 source "package/eeprog/Config.in"
diff --git a/package/dm/Config.in b/package/dm/Config.in
deleted file mode 100644
index a6a4aaf..0000000
--- a/package/dm/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_DM
-	bool "dm"
-	depends on BR2_LARGEFILE
-	help
-	  The Device-mapper is a new component of the linux kernel that
-	  supports logical volume management. It is required by LVM2 and EVMS.
-
-comment "dm requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
diff --git a/package/dm/dm.mk b/package/dm/dm.mk
deleted file mode 100644
index 5f35aef..0000000
--- a/package/dm/dm.mk
+++ /dev/null
@@ -1,129 +0,0 @@
-#############################################################
-#
-# device-mapper
-#
-#############################################################
-# Copyright (C) 2005 by Richard Downer <rdowner@gmail.com>
-# Derived from work
-# Copyright (C) 2001-2005 by Erik Andersen <andersen@codepoet.org>
-# Copyright (C) 2002 by Tim Riker <Tim@Rikers.org>
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU Library General Public License as
-# published by the Free Software Foundation; either version 2 of the
-# License, or (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# Library General Public License for more details.
-#
-# You should have received a copy of the GNU Library General Public
-# License along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
-# USA
-
-DM_BASEVER=1.02
-DM_PATCH=28
-DM_VERSION=$(DM_BASEVER).$(DM_PATCH)
-DM_SOURCE:=device-mapper.$(DM_VERSION).tgz
-DM_SITE:=ftp://sources.redhat.com/pub/dm
-DM_CAT:=$(ZCAT)
-DM_DIR:=$(BUILD_DIR)/device-mapper.$(DM_VERSION)
-DM_STAGING_BINARY:=$(STAGING_DIR)/usr/sbin/dmsetup
-DM_TARGET_BINARY:=$(TARGET_DIR)/usr/sbin/dmsetup
-DM_STAGING_LIBRARY:=$(STAGING_DIR)/lib/libdevmapper.so
-DM_TARGET_LIBRARY:=$(TARGET_DIR)/usr/lib/libdevmapper.so
-DM_TARGET_HEADER:=$(TARGET_DIR)/usr/include/libdevmapper.h
-
-$(DL_DIR)/$(DM_SOURCE):
-	$(call DOWNLOAD,$(DM_SITE),$(DM_SOURCE))
-
-dm-source: $(DL_DIR)/$(DM_SOURCE)
-
-$(DM_DIR)/.unpacked: $(DL_DIR)/$(DM_SOURCE)
-	$(DM_CAT) $(DL_DIR)/$(DM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(DM_DIR) package/dm/ \*.patch
-	touch $@
-
-$(DM_DIR)/.configured: $(DM_DIR)/.unpacked
-	(cd $(DM_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		ac_cv_have_decl_malloc=yes \
-		gl_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_calloc_0_nonnull=yes \
-		ac_cv_func_realloc_0_nonnull=yes \
-		ac_cv_func_lstat_dereferences_slashed_symlink=yes \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--includedir=/usr/include \
-		--mandir=/usr/share/man \
-		--infodir=/usr/share/info \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-		--with-user=$(shell id -un) --with-group=$(shell id -gn) \
-	)
-	touch $@
-
-$(DM_DIR)/$(DM_BINARY): dm-build
-$(DM_DIR)/$(DM_LIBRARY): dm-build
-
-$(DM_STAGING_BINARY) $(DM_STAGING_LIBRARY): $(DM_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(DM_DIR)
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DM_DIR) install
-
-# Install dmsetup from staging to target
-$(DM_TARGET_BINARY): $(DM_STAGING_BINARY)
-	$(INSTALL) -m 0755 $? $@
-	-$(STRIPCMD) $(DM_TARGET_BINARY)
-	touch -c $@
-
-# Install libdevmapper.so.1.00 from staging to target
-$(DM_TARGET_LIBRARY).$(DM_BASEVER): $(DM_STAGING_LIBRARY)
-	$(INSTALL) -m 0644 $? $@
-	-$(STRIPCMD) $@
-	touch -c $@
-
-# Makes libdevmapper.so a symlink to libdevmapper.so.1.00
-$(DM_TARGET_LIBRARY): $(DM_TARGET_LIBRARY).$(DM_BASEVER)
-	rm -f $@
-	ln -s $(<F) $@
-	touch -c $@
-
-# Install header file
-$(DM_TARGET_HEADER): $(DM_TARGET_LIBRARY)
-	rm -f $@
-	mkdir -p $(STAGING_DIR)/usr/include
-	$(INSTALL) -m 0644 $(STAGING_DIR)/usr/include/libdevmapper.h $@
-
-dm: uclibc $(DM_TARGET_BINARY) $(DM_TARGET_LIBRARY) #$(DM_TARGET_HEADER)
-
-dm-clean:
-	rm -f $(DM_TARGET_BINARY) $(DM_TARGET_LIBRARY) \
-		$(DM_TARGET_LIBRARY).$(DM_BASEVER) $(DM_TARGET_HEADER)
-	-$(MAKE) -C $(DM_DIR) clean
-
-dm-dirclean:
-	rm -rf $(DM_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_DM),y)
-TARGETS+=dm
-endif
diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index 44025e1..7d6ecfb 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -4,7 +4,7 @@ comment "dmraid has no inherent support for AVR32"
 config BR2_PACKAGE_DMRAID
 	bool "dmraid"
 	depends on BR2_LARGEFILE
-	select BR2_PACKAGE_DM
+	select BR2_PACKAGE_LVM2
 	help
 	  dmraid discovers, activates, deactivates and displays properties
 	  of software RAID sets (eg, ATARAID) and contained DOS partitions.
diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index b5f96b5..b9b2497 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -7,7 +7,7 @@ DMRAID_VERSION:=1.0.0.rc15
 DMRAID_SOURCE:=dmraid-$(DMRAID_VERSION).tar.bz2
 DMRAID_SITE:=http://people.redhat.com/~heinzm/sw/dmraid/src
 DMRAID_SUBDIR:=$(DMRAID_VERSION)
-DMRAID_DEPENDENCIES:=dm
+DMRAID_DEPENDENCIES:=lvm2
 DMRAID_INSTALL_STAGING:=yes
 
 $(eval $(call AUTOTARGETS,package,dmraid))
diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index 75f3f50..cfcfd75 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -1,7 +1,26 @@
 config BR2_PACKAGE_LVM2
-	bool "lvm2"
-	select BR2_PACKAGE_DM
+	bool "lvm2 & device mapper"
+	depends on BR2_LARGEFILE
 	help
-	  LVM2 refers to a new userspace toolset that provide logical
-	  volume management facilities on linux. It is reasonably backwards-
-	  compatible with the original LVM toolset.
+	  This is LVM2, the rewrite of The Linux Logical Volume Manager.
+	  LVM supports enterprise level volume management of disk and disk
+	  subsystems by grouping arbitrary disks into volume groups. The total
+	  capacity of volume groups can be allocated to logical volumes, which
+	  are accessed as regular block devices.
+
+	  The Linux Kernel Device Mapper is the LVM
+	  (Linux Logical Volume Management) Team's implementation of a
+	  minimalistic kernel-space driver that handles volume management,
+	  while keeping knowledge of the underlying device layout in
+	  user-space. This makes it useful for not only LVM, but EVMS,
+	  software raid, and other drivers that create "virtual" block devices.
+
+comment "lvm2 requires a toolchain with LARGEFILE support"
+        depends on !BR2_LARGEFILE
+
+config BR2_PACKAGE_LVM2_DM_ONLY
+	bool "install device mapper only"
+	depends on BR2_PACKAGE_LVM2
+	default y
+	help
+	  Install dmsetup only and skip the LVM2 suite.
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 1c15129..5a691cf 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -3,83 +3,69 @@
 # lvm2
 #
 #############################################################
-# Copyright (C) 2005 by Richard Downer <rdowner@gmail.com>
-# Derived from work
-# Copyright (C) 2001-2005 by Erik Andersen <andersen@codepoet.org>
-# Copyright (C) 2002 by Tim Riker <Tim@Rikers.org>
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU Library General Public License as
-# published by the Free Software Foundation; either version 2 of the
-# License, or (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# Library General Public License for more details.
-#
-# You should have received a copy of the GNU Library General Public
-# License along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
-# USA
-
-LVM2_BASEVER=2.02
-LVM2_PATCH=43
-LVM2_VERSION=$(LVM2_BASEVER).$(LVM2_PATCH)
+LVM2_VERSION:=2.02.44
 LVM2_SOURCE:=LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE:=ftp://sources.redhat.com/pub/lvm2
-LVM2_CAT:=$(ZCAT)
-LVM2_DIR:=$(BUILD_DIR)/LVM2.$(LVM2_VERSION)
-LVM2_SBIN:=lvchange lvcreate lvdisplay lvextend lvm lvmchange lvmdiskscan lvmsadc lvmsar lvreduce lvremove lvrename lvresize lvs lvscan pvchange pvcreate pvdisplay pvmove pvremove pvresize pvs pvscan vgcfgbackup vgcfgrestore vgchange vgck vgconvert vgcreate vgdisplay vgexport vgextend vgimport vgmerge vgmknodes vgreduce vgremove vgrename vgs vgscan vgsplit
-LVM2_TARGET_SBINS=$(foreach lvm2sbin, $(LVM2_SBIN), $(TARGET_DIR)/sbin/$(lvm2sbin))
+LVM2_CONF_OPT:=--with-user=$(shell id -un) --with-group=$(shell id -gn)
+LVM2_TARGET_INSTALL_STAGING:=yes
 
-$(DL_DIR)/$(LVM2_SOURCE):
-	 $(call DOWNLOAD,$(LVM2_SITE),$(LVM2_SOURCE))
+LVM2_BINARIES:=fsadm lvm lvmdump
 
-lvm2-source: $(DL_DIR)/$(LVM2_SOURCE)
+ifeq ($(BR2_PACKAGE_READLINE),y)
+LVM2_DEPENDENCIES+=readline
+else
+# v2.02.44: disable readline usage, or binaries are linked against provider
+# of "tgetent" (=> ncurses) even if it's not used..
+LVM2_CONF_OPT+=--disable-readline
+endif
 
-$(LVM2_DIR)/.unpacked: $(DL_DIR)/$(LVM2_SOURCE)
-	$(LVM2_CAT) $(DL_DIR)/$(LVM2_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(LVM2_DIR)/.unpacked
+$(eval $(call AUTOTARGETS,package,lvm2))
 
-$(LVM2_DIR)/.configured: $(LVM2_DIR)/.unpacked
-	(cd $(LVM2_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		ac_cv_have_decl_malloc=yes \
-		gl_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_calloc_0_nonnull=yes \
-		ac_cv_func_realloc_0_nonnull=yes \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-		--with-user=$(shell id -un) --with-group=$(shell id -gn) \
-	)
-	touch $(LVM2_DIR)/.configured
+$(LVM2_TARGET_INSTALL_TARGET).dm: $(LVM2_TARGET_INSTALL_STAGING)
+	$(call MESSAGE,"Installing to target \(device mapper\)")
+	cp -d $(STAGING_DIR)/usr/lib/libdevmapper.so* $(TARGET_DIR)/lib
+	chmod u+w $(TARGET_DIR)/lib/libdevmapper.so*
+	$(INSTALL) -m 0755 $(STAGING_DIR)/usr/sbin/dmsetup $(TARGET_DIR)/sbin
+	touch $@
 
-$(LVM2_TARGET_SBINS): $(LVM2_DIR)/.configured
-	$(MAKE1) CC=$(TARGET_CC) RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR)
-	$(MAKE1) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR) install
-	for binary in $(LVM2_SBIN); do echo $$binary; cp -a $(STAGING_DIR)/sbin/$$binary $(TARGET_DIR)/sbin; done
+$(LVM2_HOOK_POST_INSTALL).dm: $(LVM2_TARGET_INSTALL_TARGET).dm
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/lib/libdevmapper.so* $(TARGET_DIR)/sbin/dmsetup
+	touch $@
 
-lvm2: uclibc dm $(LVM2_TARGET_SBINS)
+$(LVM2_TARGET_INSTALL_TARGET).lvm: $(LVM2_TARGET_INSTALL_STAGING)
+	$(call MESSAGE,"Installing to target \(lvm2 suite\)")
+	$(INSTALL) -m 0755 $(addprefix $(STAGING_DIR)/usr/sbin/,$(LVM2_BINARIES)) $(TARGET_DIR)/sbin
+	find $(STAGING_DIR)/usr/sbin -lname lvm -exec cp -d {} $(TARGET_DIR)/sbin \;
+	$(INSTALL) -m 644 -D $(STAGING_DIR)/etc/lvm/lvm.conf $(TARGET_DIR)/etc/lvm/lvm.conf
+	touch $@
 
-lvm2-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(LVM2_DIR) uninstall
-	-$(MAKE) -C $(LVM2_DIR) clean
+$(LVM2_HOOK_POST_INSTALL).lvm: $(LVM2_TARGET_INSTALL_TARGET).lvm
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/sbin/lvm
+	touch $@
 
-lvm2-dirclean:
-	rm -rf $(LVM2_DIR)
+ifeq ($(BR2_PACKAGE_LVM2_DM_ONLY),y)
+$(LVM2_TARGET_INSTALL_TARGET): $(LVM2_TARGET_INSTALL_TARGET).dm
+else
+$(LVM2_TARGET_INSTALL_TARGET): $(LVM2_TARGET_INSTALL_TARGET).dm $(LVM2_TARGET_INSTALL_TARGET).lvm
+endif
+.PHONY: $(LVM2_TARGET_INSTALL_TARGET)
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LVM2),y)
-TARGETS+=lvm2
+ifeq ($(BR2_ENABLE_DEBUG),)
+ifeq ($(BR2_PACKAGE_LVM2_DM_ONLY),y)
+$(LVM2_HOOK_POST_INSTALL): $(LVM2_HOOK_POST_INSTALL).dm
+else
+$(LVM2_HOOK_POST_INSTALL): $(LVM2_HOOK_POST_INSTALL).dm $(LVM2_HOOK_POST_INSTALL).lvm
+endif
+endif
+.PHONY: $(LVM2_HOOK_POST_INSTALL)
+
+$(LVM2_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -f $(TARGET_DIR)/lib/libdevmapper.so*
+	rm -f $(TARGET_DIR)/sbin/dmsetup
+ifneq ($(BR2_PACKAGE_LVM2_DM_ONLY),y)
+	rm -f $(addprefix $(TARGET_DIR)/sbin,$(LVM2_BINARIES))
+	find $(TARGET_DIR)/sbin -lname lvm -exec unlink {} \;
+	rm -rf $(TARGET_DIR)/etc/lvm
 endif
+	rm -f $(LVM2_TARGET_INSTALL_STAGING) $(LVM2_TARGET_INSTALL_TARGET)* $(LVM2_HOOK_POST_INSTALL)*
-- 
1.5.4.3
