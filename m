From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 Dec 2010 01:35:41 +0100
Subject: [Buildroot] [git commit master 1/1] lvm2: convert to autotargets
	and bump to 2.02.78
Message-ID: <20101214003642.8F7368E2DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=564e0c7e655f4cbb225427230cf3b22be0575653
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[ Thomas: simplifications and bump to 2.02.78 ]

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    2 +-
 package/lvm2/lvm2.mk |  137 +++++++++++++------------------------------------
 2 files changed, 38 insertions(+), 101 deletions(-)

diff --git a/CHANGES b/CHANGES
index a021437..9377adc 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,7 +6,7 @@
 	Updated/fixed packages: at, busybox, bzip2, dbus,
 	direcfb-examples, dmalloc, cloop, cups, ffmpeg, gdk-pixbuf,
 	hostapd, i2c-tools, input-tools, libconfig, lsof,
-	ltp-testsuite, m4, mii-diag, mrouted, openssh, openssl,
+	ltp-testsuite, lvm2, m4, mii-diag, mrouted, openssh, openssl,
 	openvpn, pango, qt, rsync, sdl_gfx, sdl_sound, sysklogd,
 	sysvinit, udev, usbutils, xz, zlib
 
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 2bd6b8b..5c83d9d 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -3,115 +3,52 @@
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
+LVM2_VERSION = 2.02.78
+LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
+LVM2_SITE = ftp://sources.redhat.com/pub/lvm2
+LVM2_INSTALL_STAGING = YES
+
+LVM2_BINS = \
+	dmsetup fsadm lvm lvmconf lvmdump vgimportclone \
+	lvchange lvconvert lvcreate lvdisplay lvextend 	\
+	lvmchange lvmdiskscan lvmsadc lvmsar lvreduce  	\
+	lvremove lvrename lvresize lvs lvscan pvchange 	\
+	pvck pvcreate pvdisplay pvmove pvremove 	\
+	pvresize pvs pvscan vgcfgbackup vgcfgrestore 	\
+	vgchange vgck vgconvert vgcreate vgdisplay 	\
+	vgexport vgextend vgimport vgmerge vgmknodes 	\
+	vgreduce vgremove vgrename vgs vgscan vgsplit
+
+# Make sure that binaries and libraries are installed with write
+# permissions for the owner.
+LVM2_CONF_OPT += --enable-write_install
+
+# LVM2 uses autoconf, but not automake, and the build system does not
+# take into account the CC passed at configure time.
+LVM2_MAKE_ENV = CC="$(TARGET_CC)"
 
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
+LVM2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install_device-mapper
+LVM2_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install_device-mapper
 endif
 
+define LVM2_UNINSTALL_STAGING_CMDS
+	rm -f $(addprefix $(STAGING_DIR)/usr/sbin/,$(LVM2_BINS))
+	rm -f $(addprefix $(STAGING_DIR)/usr/lib/,libdevmapper.so*)
+endef
 
-lvm2-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(LVM2_DIR) uninstall
-	-$(MAKE) -C $(LVM2_DIR) clean
-
-lvm2-dirclean:
-	rm -rf $(LVM2_DIR)
+define LVM2_UNINSTALL_TARGET_CMDS
+	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(LVM2_BINS))
+	rm -f $(addprefix $(TARGET_DIR)/usr/lib/,libdevmapper.so*)
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LVM2),y)
-TARGETS+=lvm2
-endif
+$(eval $(call AUTOTARGETS,package,lvm2))
-- 
1.7.2.2
