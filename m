From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Jun 2009 13:52:13 +0000
Subject: [Buildroot] [git commit] Remove device-mapper
Message-ID: <20090620051954.B4460772DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ddb260707a88a261d1a5b9f6ef3dc64f7c7ea333
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Device mapper is now provided by lvm2

Signed-off-by: Nigel Kukard <nkukard@lbsd.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in    |    1 -
 package/dm/Config.in |    9 ----
 package/dm/dm.mk     |  129 --------------------------------------------------
 3 files changed, 0 insertions(+), 139 deletions(-)
 delete mode 100644 package/dm/Config.in
 delete mode 100644 package/dm/dm.mk

diff --git a/package/Config.in b/package/Config.in
index 08b16ed..0b09277 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -230,7 +230,6 @@ source "package/dbus/Config.in"
 source "package/dbus-glib/Config.in"
 source "package/dbus-python/Config.in"
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
-- 
1.6.0.6
