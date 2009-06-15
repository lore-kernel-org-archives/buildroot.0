From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Jun 2009 13:54:14 +0000
Subject: [Buildroot] [git commit] LVM2 now provides device-mapper
Message-ID: <20090620051954.4C2B8772DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=03bcf762232daecdffc25a3b479da0da57d0a1c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


- Updated LVM2 to version 2.02.47
- Added option to only install dmsetup
- Updated config description - thanks Olaf Rempel
- Fixed readline issues - thanks Olaf Rempel

Signed-off-by: Nigel Kukard <nkukard@lbsd.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lvm2/Config.in |   28 +++++++++++++++++++++++-----
 package/lvm2/lvm2.mk   |   39 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 59 insertions(+), 8 deletions(-)

diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index 75f3f50..30af14e 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -1,7 +1,25 @@
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
+config BR2_PACKAGE_LVM2_DMSETUP_ONLY
+	bool "install dmsetup only"
+	depends on BR2_PACKAGE_LVM2
+	help
+	  Install dmsetup only and skip the LVM2 suite.
+
+comment "lvm2 requires a toolchain with LARGEFILE support"
+        depends on !BR2_LARGEFILE
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 1c15129..0cefaba 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -24,20 +24,35 @@
 # USA
 
 LVM2_BASEVER=2.02
-LVM2_PATCH=43
+LVM2_DMVER=1.02
+LVM2_PATCH=47
 LVM2_VERSION=$(LVM2_BASEVER).$(LVM2_PATCH)
 LVM2_SOURCE:=LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE:=ftp://sources.redhat.com/pub/lvm2
 LVM2_CAT:=$(ZCAT)
 LVM2_DIR:=$(BUILD_DIR)/LVM2.$(LVM2_VERSION)
 LVM2_SBIN:=lvchange lvcreate lvdisplay lvextend lvm lvmchange lvmdiskscan lvmsadc lvmsar lvreduce lvremove lvrename lvresize lvs lvscan pvchange pvcreate pvdisplay pvmove pvremove pvresize pvs pvscan vgcfgbackup vgcfgrestore vgchange vgck vgconvert vgcreate vgdisplay vgexport vgextend vgimport vgmerge vgmknodes vgreduce vgremove vgrename vgs vgscan vgsplit
+LVM2_DMSETUP_SBIN:=dmsetup
+LVM2_LIB:=libdevmapper.so.$(LVM2_DMVER)
 LVM2_TARGET_SBINS=$(foreach lvm2sbin, $(LVM2_SBIN), $(TARGET_DIR)/sbin/$(lvm2sbin))
+LVM2_TARGET_DMSETUP_SBINS=$(foreach lvm2sbin, $(LVM2_DMSETUP_SBIN), $(TARGET_DIR)/sbin/$(lvm2sbin))
+LVM2_TARGET_LIBS=$(foreach lvm2lib, $(LVM2_LIB), $(TARGET_DIR)/lib/$(lvm2lib))
 
 $(DL_DIR)/$(LVM2_SOURCE):
 	 $(call DOWNLOAD,$(LVM2_SITE),$(LVM2_SOURCE))
 
 lvm2-source: $(DL_DIR)/$(LVM2_SOURCE)
 
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+LVM2_DEPENDENCIES+=readline
+else
+# v2.02.44: disable readline usage, or binaries are linked against provider
+# of "tgetent" (=> ncurses) even if it's not used..
+LVM2_CONF_OPT+=--disable-readline
+endif
+
+
 $(LVM2_DIR)/.unpacked: $(DL_DIR)/$(LVM2_SOURCE)
 	$(LVM2_CAT) $(DL_DIR)/$(LVM2_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $(LVM2_DIR)/.unpacked
@@ -58,15 +73,33 @@ $(LVM2_DIR)/.configured: $(LVM2_DIR)/.unpacked
 		$(DISABLE_NLS) \
 		$(DISABLE_LARGEFILE) \
 		--with-user=$(shell id -un) --with-group=$(shell id -gn) \
+		$(LVM2_CONF_OPT) \
 	)
 	touch $(LVM2_DIR)/.configured
 
-$(LVM2_TARGET_SBINS): $(LVM2_DIR)/.configured
+
+$(LVM2_DIR)/.built: $(LVM2_DIR)/.configured
 	$(MAKE1) CC=$(TARGET_CC) RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR)
 	$(MAKE1) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR) install
+	touch $(LVM2_DIR)/.built
+
+
+$(LVM2_TARGET_SBINS): $(LVM2_DIR)/.built
 	for binary in $(LVM2_SBIN); do echo $$binary; cp -a $(STAGING_DIR)/sbin/$$binary $(TARGET_DIR)/sbin; done
 
-lvm2: uclibc dm $(LVM2_TARGET_SBINS)
+$(LVM2_TARGET_DMSETUP_SBINS): $(LVM2_DIR)/.built
+	for binary in $(LVM2_DMSETUP_SBIN); do echo $$binary; cp -a $(STAGING_DIR)/sbin/$$binary $(TARGET_DIR)/sbin; done
+
+$(LVM2_TARGET_LIBS): $(LVM2_DIR)/.built
+	for lib in $(LVM2_LIB); do echo $$lib; cp -a $(STAGING_DIR)/lib/$$lib $(TARGET_DIR)/lib; done
+
+
+ifeq ($(BR2_PACKAGE_LVM2_DMSETUP_ONLY),y)
+lvm2: uclibc $(LVM2_TARGET_DMSETUP_SBINS) $(LVM2_TARGET_LIBS)
+else
+lvm2: uclibc $(LVM2_TARGET_SBINS) $(LVM2_TARGET_DMSETUP_SBINS) $(LVM2_TARGET_LIBS)
+endif
+
 
 lvm2-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(LVM2_DIR) uninstall
-- 
1.6.0.6
