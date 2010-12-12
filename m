From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Dec 2010 22:53:51 +0100
Subject: [Buildroot] [PATCH 05/19] sysvint: convert to gentargets and bump
	to 2.88
In-Reply-To: <cover.1292190675.git.thomas.petazzoni@free-electrons.com>
References: <cover.1292190675.git.thomas.petazzoni@free-electrons.com>
Message-ID: <14ca596f8f9f1e1d22b568fdbc6156cf5f0425ea.1292190675.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Martin Banky <martin.banky@gmail.com>

Also, changed the site to Debian, to get the latest patches

[ Thomas: add inittab compatible with sysvinit. Minor fixes. ]

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sysvinit/inittab                    |   32 ++++++++++++
 package/sysvinit/sysvinit-2.86-gentoo.patch |    9 ---
 package/sysvinit/sysvinit.mk                |   71 +++++++++++++--------------
 3 files changed, 66 insertions(+), 46 deletions(-)
 create mode 100644 package/sysvinit/inittab
 delete mode 100644 package/sysvinit/sysvinit-2.86-gentoo.patch

diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
new file mode 100644
index 0000000..3ea534d
--- /dev/null
+++ b/package/sysvinit/inittab
@@ -0,0 +1,32 @@
+# /etc/inittab
+#
+# This inittab is a basic inittab sample for sysvinit, which mimics
+# Buildroot's default inittab for Busybox.
+id:1:initdefault:
+
+proc::sysinit:/bin/mount -t proc proc /proc
+rwmo::sysinit:/bin/mount -o remount,rw /
+dpts::sysinit:/bin/mkdir -p /dev/pts
+moun::sysinit:/bin/mount -a
+host::sysinit:/bin/hostname -F /etc/hostname
+init::sysinit:/etc/init.d/rcS
+
+1:1:respawn:/sbin/getty 38400 tty1
+2:1:respawn:/sbin/getty 38400 tty2
+
+# S0:1:respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
+
+# Logging junk
+mess::sysinit:/bin/touch /var/log/messages
+sysl:1:respawn:/sbin/syslogd -n -m 0
+klog:1:respawn:/sbin/klogd -n
+
+# Stuff to do for the 3-finger salute
+rebo::ctrlaltdel:/sbin/reboot
+
+# Stuff to do before rebooting
+sklo:6:wait:/usr/bin/killall klogd
+ssys:6:wait:/usr/bin/killall syslogd
+umou:6:wait:/bin/umount -a -r
+swap:6:wait:/sbin/swapoff -a
+
diff --git a/package/sysvinit/sysvinit-2.86-gentoo.patch b/package/sysvinit/sysvinit-2.86-gentoo.patch
deleted file mode 100644
index 06b9e15..0000000
--- a/package/sysvinit/sysvinit-2.86-gentoo.patch
+++ /dev/null
@@ -1,9 +0,0 @@
---- sysvinit/src/Makefile
-+++ sysvinit/src/Makefile
-@@ -10,5 +10,3 @@
- 
--CC	= gcc
--CFLAGS	= -Wall -O2 -fomit-frame-pointer -D_GNU_SOURCE
--LDFLAGS	= -s
-+CFLAGS	+= -Wall -D_GNU_SOURCE
- STATIC	=
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index ef7c713..b22f0f2 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -3,50 +3,47 @@
 # sysvinit
 #
 #############################################################
-SYSVINIT_VERSION:=2.86
-SYSVINIT_SOURCE:=sysvinit-$(SYSVINIT_VERSION).tar.gz
-SYSVINIT_SITE:=ftp://ftp.cistron.nl/pub/people/miquels/software
-SYSVINIT_DIR:=$(BUILD_DIR)/sysvinit-$(SYSVINIT_VERSION)
-SYSVINIT_CAT:=$(ZCAT)
-SYSVINIT_BINARY:=src/init
-SYSVINIT_TARGET_BINARY:=sbin/init
-
-$(DL_DIR)/$(SYSVINIT_SOURCE):
-	$(call DOWNLOAD,$(SYSVINIT_SITE),$(SYSVINIT_SOURCE))
-
-sysvinit-unpacked: $(SYSVINIT_DIR)/.unpacked
-$(SYSVINIT_DIR)/.unpacked: $(DL_DIR)/$(SYSVINIT_SOURCE)
-	$(SYSVINIT_CAT) $(DL_DIR)/$(SYSVINIT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(SYSVINIT_DIR) package/sysvinit/ sysvinit-\*.patch
-	touch $@
-
-$(SYSVINIT_DIR)/$(SYSVINIT_BINARY): $(SYSVINIT_DIR)/.unpacked
+SYSVINIT_VERSION = 2.88
+SYSVINIT_SOURCE  = sysvinit_$(SYSVINIT_VERSION)dsf.orig.tar.gz
+SYSVINIT_PATCH   = sysvinit_$(SYSVINIT_VERSION)dsf-13.diff.gz
+SYSVINIT_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sysvinit
+
+# Override Busybox implementations if Busybox is enabled.
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+SYSKLOGD_DEPENDENCIES = busybox
+endif
+
+define SYSVINIT_DEBIAN_PATCHES
+	if [ -d $(@D)/debian/patches ]; then \
+		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*.patch; \
+	fi
+endef
+
+SYSVINIT_POST_PATCH_HOOKS = SYSVINIT_DEBIAN_PATCHES
+
+define SYSVINIT_BUILD_CMDS
 	# Force sysvinit to link against libcrypt as it otherwise
 	# use an incorrect test to see if it's available
-	CFLAGS="$(TARGET_CFLAGS)" $(MAKE) CC="$(TARGET_CC)" LCRYPT="-lcrypt" -C $(SYSVINIT_DIR)/src
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) LCRYPT="-lcrypt" -C $(@D)/src
+endef
 
-$(TARGET_DIR)/$(SYSVINIT_TARGET_BINARY): $(SYSVINIT_DIR)/$(SYSVINIT_BINARY)
+define SYSVINIT_INSTALL_TARGET_CMDS
 	for x in halt init shutdown; do \
-		install -D $(SYSVINIT_DIR)/src/$$x $(TARGET_DIR)/sbin/$$x || exit 1; \
+		install -D -m 0755 $(@D)/src/$$x $(TARGET_DIR)/sbin/$$x || exit 1; \
 	done
+	# Override Busybox's inittab with an inittab compatible with
+	# sysvinit
+	install -D -m 0644 package/sysvinit/inittab $(TARGET_DIR)/etc/inittab
+endef
 
-sysvinit: $(TARGET_DIR)/$(SYSVINIT_TARGET_BINARY)
-
-sysvinit-source: $(DL_DIR)/$(SYSVINIT_SOURCE)
-
-sysvinit-clean:
+define SYSVINIT_UNINSTALL_TARGET_CMDS
 	for x in halt init shutdown; do \
 		rm -f $(TARGET_DIR)/sbin/$$x || exit 1; \
 	done
-	-$(MAKE) -C $(SYSVINIT_DIR) clean
+endef
 
-sysvinit-dirclean:
-	rm -rf $(SYSVINIT_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_SYSVINIT),y)
-TARGETS+=sysvinit
-endif
+define SYSVINIT_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(call GENTARGETS,package,sysvinit))
-- 
1.7.0.4
