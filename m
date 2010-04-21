From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Apr 2010 10:40:30 +0200
Subject: [Buildroot] [git commit master] busybox: make sure architecture
	flags are used at link time
Message-ID: <20100421084101.AA87E20E9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=55098e50488eeb163af8f63445bd3e7c52850410
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When compiling Busybox, according to readelf -A, all object files were
properly compiled according to the select architecture (-march=armv4t
for example), but the final busybox binary could be of a different
architecture (ARMv5t even if ARMv4t was selected).

This patch changes the way we configure/compile Busybox so that our
CFLAGS aren't anymore passed through the make EXTRA_CFLAGS variable,
but through the .config CONFIG_EXTRA_CFLAGS variable. Unfortunately,
those variables don't have exactly the same semantic for the Busybox
build system.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox-1.13.x.config |    1 +
 package/busybox/busybox.mk            |    8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/busybox/busybox-1.13.x.config b/package/busybox/busybox-1.13.x.config
index ee59162..059a0b3 100644
--- a/package/busybox/busybox-1.13.x.config
+++ b/package/busybox/busybox-1.13.x.config
@@ -47,6 +47,7 @@ CONFIG_FEATURE_SYSLOG=y
 # CONFIG_FEATURE_SHARED_BUSYBOX is not set
 # CONFIG_LFS is not set
 CONFIG_CROSS_COMPILER_PREFIX=""
+CONFIG_EXTRA_CFLAGS=""
 
 #
 # Debugging Options
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index c93f33a..05a6d94 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -45,6 +45,8 @@ $(BUSYBOX_DIR)/.config: $(BUSYBOX_DIR)/.unpacked $(BUSYBOX_CONFIG_FILE)
 	cp -f $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_DIR)/.config
 	$(SED) s,^CONFIG_PREFIX=.*,CONFIG_PREFIX=\"$(TARGET_DIR)\", \
 		$(BUSYBOX_DIR)/.config
+	$(SED) 's,^CONFIG_EXTRA_CFLAGS=.*,CONFIG_EXTRA_CFLAGS=\"$(BUSYBOX_CFLAGS)\",' \
+		$(BUSYBOX_DIR)/.config
 # id applet breaks on >=1.13.0 with old uclibc unless the bb pwd routines are used
 ifeq ($(BR2_BUSYBOX_VERSION_1_13_X)$(BR2_BUSYBOX_VERSION_1_14_X)$(BR2_UCLIBC_VERSION_0_9_28_3)$(BR2_UCLIBC_VERSION_0_9_29),yy)
 	if grep -q 'CONFIG_ID=y' $(BUSYBOX_DIR)/.config; \
@@ -105,15 +107,13 @@ endif
 $(BUSYBOX_DIR)/busybox: $(BUSYBOX_DIR)/.config
 	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
-		ARCH=$(KERNEL_ARCH) \
-		EXTRA_CFLAGS="$(BUSYBOX_CFLAGS)" -C $(BUSYBOX_DIR)
+		ARCH=$(KERNEL_ARCH) -C $(BUSYBOX_DIR)
 
 $(TARGET_DIR)/bin/busybox: $(BUSYBOX_DIR)/busybox
 ifeq ($(BR2_PACKAGE_BUSYBOX_FULLINSTALL),y)
 	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
-		ARCH=$(KERNEL_ARCH) \
-		EXTRA_CFLAGS="$(BUSYBOX_CFLAGS)" -C $(BUSYBOX_DIR) install
+		ARCH=$(KERNEL_ARCH) -C $(BUSYBOX_DIR) install
 else
 	install -D -m 0755 $(BUSYBOX_DIR)/busybox $(TARGET_DIR)/bin/busybox
 endif
-- 
1.6.3.3
