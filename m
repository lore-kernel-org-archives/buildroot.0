From: Martin Banky <martin.banky@gmail.com>
Date: Tue,  5 Oct 2010 01:22:36 -0700
Subject: [Buildroot] [PATCH 03/10] lvm2: convert to autotargets and bump to
	2.02.74
In-Reply-To: <1286266963-23413-1-git-send-email-Martin.Banky@gmail.com>
References: <1286266963-23413-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1286266963-23413-3-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/lvm2/lvm2.mk |  153 +++++++++++++++++---------------------------------
 1 files changed, 51 insertions(+), 102 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 2bd6b8b..b359b97 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -3,115 +3,64 @@
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
-LVM2_DMVER=1.02
-LVM2_PATCH=50
-LVM2_VERSION=$(LVM2_BASEVER).$(LVM2_PATCH)
-LVM2_SOURCE:=LVM2.$(LVM2_VERSION).tgz
-LVM2_SITE:=ftp://sources.redhat.com/pub/lvm2
-LVM2_CAT:=$(ZCAT)
-LVM2_DIR:=$(BUILD_DIR)/LVM2.$(LVM2_VERSION)
-LVM2_SBIN:=lvchange lvcreate lvdisplay lvextend lvm lvmchange lvmdiskscan lvmsadc lvmsar lvreduce lvremove lvrename lvresize lvs lvscan pvchange pvcreate pvdisplay pvmove pvremove pvresize pvs pvscan vgcfgbackup vgcfgrestore vgchange vgck vgconvert vgcreate vgdisplay vgexport vgextend vgimport vgmerge vgmknodes vgreduce vgremove vgrename vgs vgscan vgsplit
-LVM2_DMSETUP_SBIN:=dmsetup
-LVM2_LIB:=libdevmapper.so.$(LVM2_DMVER)
-LVM2_TARGET_SBINS=$(foreach lvm2sbin, $(LVM2_SBIN), $(TARGET_DIR)/sbin/$(lvm2sbin))
-LVM2_TARGET_DMSETUP_SBINS=$(foreach lvm2sbin, $(LVM2_DMSETUP_SBIN), $(TARGET_DIR)/sbin/$(lvm2sbin))
-LVM2_TARGET_LIBS=$(foreach lvm2lib, $(LVM2_LIB), $(TARGET_DIR)/lib/$(lvm2lib))
-
-$(DL_DIR)/$(LVM2_SOURCE):
-	 $(call DOWNLOAD,$(LVM2_SITE),$(LVM2_SOURCE))
-
-lvm2-source: $(DL_DIR)/$(LVM2_SOURCE)
-
+LVM2_VERSION = 2.02.74
+LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
+LVM2_SITE = ftp://sources.redhat.com/pub/lvm2
+LVM2_INSTALL_STAGING = YES
+
+LVM2_BINS = dmsetup fsadm lvchange lvconvert lvcreate lvdisplay lvextend lvm \
+		lvmchange lvmconf lvmdiskscan lvmdump lvmsadc lvmsar lvreduce lvremove \
+		lvrename lvresize lvs lvscan pvchange pvck pvcreate pvdisplay pvmove \
+		pvremove pvresize pvs pvscan vgcfgbackup vgcfgrestore vgchange vgck \
+		vgconvert vgcreate vgdisplay vgexport vgextend vgimport vgimportclone \
+		vgmerge vgmknodes vgreduce vgremove vgrename vgs vgscan vgsplit
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
-LVM2_DEPENDENCIES+=readline
+LVM2_DEPENDENCIES += readline
 else
 # v2.02.44: disable readline usage, or binaries are linked against provider
 # of "tgetent" (=> ncurses) even if it's not used..
-LVM2_CONF_OPT+=--disable-readline
+LVM2_CONF_OPT += --disable-readline
 endif
 
-
-$(LVM2_DIR)/.unpacked: $(DL_DIR)/$(LVM2_SOURCE)
-	$(LVM2_CAT) $(DL_DIR)/$(LVM2_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(LVM2_DIR)/.unpacked
-
-$(LVM2_DIR)/.configured: $(LVM2_DIR)/.unpacked
-	(cd $(LVM2_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-		--with-user=$(shell id -un) --with-group=$(shell id -gn) \
-		$(LVM2_CONF_OPT) \
-	)
-	touch $(LVM2_DIR)/.configured
-
-
-$(LVM2_DIR)/.built: $(LVM2_DIR)/.configured
-	$(MAKE1) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR)
-	$(MAKE1) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR) install
-	# Fixup write permissions so that the files can be overwritten
-	# several times in the $(TARGET_DIR)
-	chmod 755 $(STAGING_DIR)/sbin/lvm
-	chmod 755 $(STAGING_DIR)/sbin/dmsetup
-	chmod 644 $(STAGING_DIR)/lib/$(LVM2_LIB)
-	touch $(LVM2_DIR)/.built
-
-
-$(LVM2_TARGET_SBINS) $(LVM2_TARGET_DMSETUP_SBINS): $(LVM2_DIR)/.built
-	cp -a $(STAGING_DIR)/sbin/$(notdir $@) $@
-	touch $@
-
-$(LVM2_TARGET_LIBS): $(LVM2_DIR)/.built
-	cp -a $(STAGING_DIR)/lib/$(notdir $@) $@
-	touch $@
-
-
 ifeq ($(BR2_PACKAGE_LVM2_DMSETUP_ONLY),y)
-lvm2: $(LVM2_TARGET_DMSETUP_SBINS) $(LVM2_TARGET_LIBS)
-else
-lvm2: $(LVM2_TARGET_SBINS) $(LVM2_TARGET_DMSETUP_SBINS) $(LVM2_TARGET_LIBS)
+LVM2_MAKE_OPT = device-mapper
+LVM2_INSTALL_STAGING_OPT = DESTDIR=$$(STAGING_DIR) device-mapper_install
+LVM2_INSTALL_TARGET_OPT = DESTDIR=$$(STAGING_DIR) device-mapper_install
 endif
 
-
-lvm2-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(LVM2_DIR) uninstall
-	-$(MAKE) -C $(LVM2_DIR) clean
-
-lvm2-dirclean:
-	rm -rf $(LVM2_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LVM2),y)
-TARGETS+=lvm2
-endif
+define LVM2_STAGING_FILE_PERMS_FIXUP
+	chmod 755 $(STAGING_DIR)/usr/sbin/lvm
+	chmod 755 $(STAGING_DIR)/usr/sbin/fsadm
+	chmod 755 $(STAGING_DIR)/usr/sbin/dmsetup
+	chmod 755 $(STAGING_DIR)/usr/sbin/lvmconf
+	chmod 755 $(STAGING_DIR)/usr/sbin/lvmdump
+	chmod 755 $(STAGING_DIR)/usr/sbin/vgimportclone
+	chmod 644 $(STAGING_DIR)/usr/lib/libdevmapper.so
+endef
+
+LVM2_POST_INSTALL_STAGING_HOOKS += LVM2_STAGING_FILE_PERMS_FIXUP
+
+define LVM2_TARGET_FILE_PERMS_FIXUP
+	chmod 755 $(TARGET_DIR)/usr/sbin/lvm
+	chmod 755 $(TARGET_DIR)/usr/sbin/fsadm
+	chmod 755 $(TARGET_DIR)/usr/sbin/dmsetup
+	chmod 755 $(TARGET_DIR)/usr/sbin/lvmconf
+	chmod 755 $(TARGET_DIR)/usr/sbin/lvmdump
+	chmod 755 $(TARGET_DIR)/usr/sbin/vgimportclone
+	chmod 644 $(TARGET_DIR)/usr/lib/libdevmapper.so
+endef
+
+LVM2_POST_INSTALL_TARGET_HOOKS += LVM2_TARGET_FILE_PERMS_FIXUP
+
+define LVM2_UNINSTALL_STAGING_CMDS
+	rm -f $(addprefix $(STAGING_DIR)/usr/sbin/,$(LVM2_BINS))
+	rm -f $(addprefix $(STAGING_DIR)/usr/lib/,libdevmapper.so*)
+endef
+
+define LVM2_UNINSTALL_TARGET_CMDS
+	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(LVM2_BINS))
+	rm -f $(addprefix $(TARGET_DIR)/usr/lib/,libdevmapper.so*)
+endef
+
+$(eval $(call AUTOTARGETS,package,lvm2))
-- 
1.7.3.1
