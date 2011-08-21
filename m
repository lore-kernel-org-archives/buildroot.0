From: Darius Augulis <augulis.darius@gmail.com>
Date: Sun, 21 Aug 2011 19:51:54 +0300
Subject: [Buildroot] [PATCH 1/2] grub: build for host
Message-ID: <20110821165154.25078.86917.stgit@darius-desktop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build Grub for host system. It provides grub binary,
which is useful for installing bootloader to removable
media when cross-compiling.

Signed-off-by: Darius Augulis <augulis.darius@gmail.com>
---
 boot/grub/grub.mk |   20 +++++++++++++++-----
 1 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index 2ce8eab..c5f4c1d 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -8,6 +8,7 @@ GRUB_VERSION = 0.97
 GRUB_SOURCE = grub_$(GRUB_VERSION).orig.tar.gz
 GRUB_PATCH  = grub_$(GRUB_VERSION)-35.diff.gz
 GRUB_SITE   = http://snapshot.debian.org/archive/debian/20080329T000000Z/pool/main/g/grub/
+GRUB_DEPENDENCIES = host-grub
 
 GRUB_CFLAGS=-DSUPPORT_LOOPDEV
 ifeq ($(BR2_LARGEFILE),)
@@ -46,6 +47,7 @@ define GRUB_DEBIAN_PATCHES
 endef
 
 GRUB_POST_PATCH_HOOKS += GRUB_DEBIAN_PATCHES
+HOST_GRUB_POST_PATCH_HOOKS += GRUB_DEBIAN_PATCHES
 
 GRUB_CONF_ENV = \
 	CFLAGS="$(TARGET_CFLAGS) $(GRUB_CFLAGS)"
@@ -54,9 +56,12 @@ GRUB_CONF_OPT = \
 	--disable-auto-linux-mem-opt \
 	$(GRUB_CONFIG-y)
 
-define GRUB_INSTALL_STAGING_CMDS
-	install -m 0755 -D $(@D)/grub/grub $(STAGING_DIR)/sbin/grub
-endef
+HOST_GRUB_CONF_ENV = \
+	CFLAGS="$(GRUB_CFLAGS) -fno-stack-protector" \
+	grub_cv_prog_objcopy_absolute=yes
+
+HOST_GRUB_CONF_OPT = \
+	--disable-auto-linux-mem-opt
 
 ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
 define GRUB_INSTALL_SPLASH
@@ -73,8 +78,12 @@ define GRUB_INSTALL_TARGET_CMDS
 	$(GRUB_INSTALL_SPLASH)
 endef
 
-define GRUB_UNINSTALL_STAGING_CMDS
-	rm -f $(STAGING_DIR)/sbin/grub
+define HOST_GRUB_INSTALL_CMDS
+	install -m 0755 -D $(@D)/grub/grub $(HOST_DIR)/sbin/grub
+endef
+
+define HOST_GRUB_UNINSTALL_CMDS
+	rm -f $(HOST_DIR)/sbin/grub
 endef
 
 define GRUB_UNINSTALL_TARGET_CMDS
@@ -83,3 +92,4 @@ define GRUB_UNINSTALL_TARGET_CMDS
 endef
 
 $(eval $(call AUTOTARGETS,boot,grub))
+$(eval $(call AUTOTARGETS,boot,grub,host))
