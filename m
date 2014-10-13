From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 13 Oct 2014 12:03:45 +0200
Subject: [Buildroot] [PATCH] initscripts: new package
Message-ID: <1413194625-31516-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The folder init.d is currently installed by default since it's part of
our skeleton.
This patch creates a package out of it and make busybox/sysvinit depends
on it.

This way, if you chose another init, you don't end up with a useless
init.d folder.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
v1 -> v2:
    - Redo the patch using git format-patch -M
---
 package/busybox/busybox.mk                         |  6 +++++
 .../inittab => package/initscripts/busybox_inittab |  0
 .../etc => package/initscripts}/init.d/S20urandom  |  0
 .../etc => package/initscripts}/init.d/S40network  |  0
 .../etc => package/initscripts}/init.d/rcK         |  0
 .../etc => package/initscripts}/init.d/rcS         |  0
 package/initscripts/initscripts.mk                 | 28 ++++++++++++++++++++++
 .../inittab => initscripts/sysvinit_inittab}       |  0
 package/sysvinit/sysvinit.mk                       | 11 +++++++--
 9 files changed, 43 insertions(+), 2 deletions(-)
 rename system/skeleton/etc/inittab => package/initscripts/busybox_inittab (100%)
 rename {system/skeleton/etc => package/initscripts}/init.d/S20urandom (100%)
 rename {system/skeleton/etc => package/initscripts}/init.d/S40network (100%)
 rename {system/skeleton/etc => package/initscripts}/init.d/rcK (100%)
 rename {system/skeleton/etc => package/initscripts}/init.d/rcS (100%)
 create mode 100644 package/initscripts/initscripts.mk
 rename package/{sysvinit/inittab => initscripts/sysvinit_inittab} (100%)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 73a99fb..2bfd55c 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -16,6 +16,10 @@ BUSYBOX_CFLAGS = \
 BUSYBOX_LDFLAGS = \
 	$(TARGET_LDFLAGS)
 
+# initscripts contains/install only inittab and the init.d folder with base
+# scripts.
+BUSYBOX_DEPENDENCIES = initscripts
+
 # Link against libtirpc if available so that we can leverage its RPC
 # support for NFS mounting with BusyBox
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
@@ -220,8 +224,10 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 	fi
 	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
 	$(BUSYBOX_INSTALL_MDEV_CONF)
+ifeq ($(BR2_INIT_BUSYBOX),y)
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
+endif
 endef
 
 $(eval $(kconfig-package))
diff --git a/system/skeleton/etc/inittab b/package/initscripts/busybox_inittab
similarity index 100%
rename from system/skeleton/etc/inittab
rename to package/initscripts/busybox_inittab
diff --git a/system/skeleton/etc/init.d/S20urandom b/package/initscripts/init.d/S20urandom
similarity index 100%
rename from system/skeleton/etc/init.d/S20urandom
rename to package/initscripts/init.d/S20urandom
diff --git a/system/skeleton/etc/init.d/S40network b/package/initscripts/init.d/S40network
similarity index 100%
rename from system/skeleton/etc/init.d/S40network
rename to package/initscripts/init.d/S40network
diff --git a/system/skeleton/etc/init.d/rcK b/package/initscripts/init.d/rcK
similarity index 100%
rename from system/skeleton/etc/init.d/rcK
rename to package/initscripts/init.d/rcK
diff --git a/system/skeleton/etc/init.d/rcS b/package/initscripts/init.d/rcS
similarity index 100%
rename from system/skeleton/etc/init.d/rcS
rename to package/initscripts/init.d/rcS
diff --git a/package/initscripts/initscripts.mk b/package/initscripts/initscripts.mk
new file mode 100644
index 0000000..13affe8
--- /dev/null
+++ b/package/initscripts/initscripts.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# initscripts
+#
+################################################################################
+
+# source included in buildroot
+INITSCRIPTS_SOURCE =
+
+# Note: We need to override Busybox's inittab with an inittab compatible with
+# sysvinit if we want SYSVINIT as our init.
+ifeq ($(BR2_PACKAGE_SYSVINIT),y)
+define INITSCRIPTS_INSTALL_INITTAB
+	$(INSTALL) -D -m 0644 package/initscripts/sysvinit_inittab $(TARGET_DIR)/etc/inittab
+endef
+else
+define INITSCRIPTS_INSTALL_INITTAB
+	$(INSTALL) -D -m 0644 package/initscripts/busybox_inittab $(TARGET_DIR)/etc/inittab
+endef
+endif
+
+define INITSCRIPTS_INSTALL_TARGET_CMDS
+	mkdir -p  $(TARGET_DIR)/etc/init.d
+	$(INSTALL) -D -m 0755 package/initscripts/init.d/* $(TARGET_DIR)/etc/init.d/
+	$(INITSCRIPTS_INSTALL_INITTAB)
+endef
+
+$(eval $(generic-package))
diff --git a/package/sysvinit/inittab b/package/initscripts/sysvinit_inittab
similarity index 100%
rename from package/sysvinit/inittab
rename to package/initscripts/sysvinit_inittab
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index d588122..d515882 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -11,9 +11,13 @@ SYSVINIT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sysvinit
 SYSVINIT_LICENSE = GPLv2+
 SYSVINIT_LICENSE_FILES = COPYING
 
-# Override BusyBox implementations if BusyBox is enabled.
+# initscripts contains/install only inittab and the init.d folder with base
+# scripts.
+SYSVINIT_DEPENDENCIES = initscripts
+
+# Override Busybox implementations if Busybox is enabled.
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-SYSVINIT_DEPENDENCIES = busybox
+SYSVINIT_DEPENDENCIES += busybox
 endif
 
 define SYSVINIT_DEBIAN_PATCHES
@@ -34,9 +38,12 @@ define SYSVINIT_INSTALL_TARGET_CMDS
 	for x in halt init shutdown killall5; do \
 		$(INSTALL) -D -m 0755 $(@D)/src/$$x $(TARGET_DIR)/sbin/$$x || exit 1; \
 	done
+<<<<<<< HEAD
 	# Override BusyBox's inittab with an inittab compatible with
 	# sysvinit
 	$(INSTALL) -D -m 0644 package/sysvinit/inittab $(TARGET_DIR)/etc/inittab
+=======
+>>>>>>> initscripts: new package
 	ln -sf /sbin/halt $(TARGET_DIR)/sbin/reboot
 	ln -sf /sbin/halt $(TARGET_DIR)/sbin/poweroff
 	ln -sf killall5 $(TARGET_DIR)/sbin/pidof
-- 
2.1.1
