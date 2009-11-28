From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 28 Nov 2009 14:25:13 +0100
Subject: [Buildroot] [git commit master] busybox: look at kernel headers for
	include files as well
Message-ID: <20091128132801.47FE1777E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=57922bfbf324745fb486775a53725ab573bfbf12
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

E.G. for flash_* applets.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    2 +-
 package/busybox/busybox.mk |    7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index cf623e3..e5bd233 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,6 +1,6 @@
 2009.11, Not released yet:
 
-	Updated/fixed packages: dbus, gvfs
+	Updated/fixed packages: busybox, dbus, gvfs
 
 2009.11-rc1, Released November 23rd, 2009:
 
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index eb79134..7f2f171 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -18,6 +18,7 @@ BUSYBOX_SITE:=http://www.busybox.net/downloads
 endif
 
 BUSYBOX_UNZIP=$(BZCAT)
+BUSYBOX_CFLAGS=$(TARGET_CFLAGS) -I$(LINUX_HEADERS_DIR)/include
 
 ifndef BUSYBOX_CONFIG_FILE
 BUSYBOX_CONFIG_FILE=$(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
@@ -100,13 +101,13 @@ $(BUSYBOX_DIR)/busybox: $(BUSYBOX_DIR)/.config
 	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
 		ARCH=$(KERNEL_ARCH) \
-		EXTRA_CFLAGS="$(TARGET_CFLAGS)" -C $(BUSYBOX_DIR)
+		EXTRA_CFLAGS="$(BUSYBOX_CFLAGS)" -C $(BUSYBOX_DIR)
 ifeq ($(BR2_PREFER_IMA)$(BR2_PACKAGE_BUSYBOX_SNAPSHOT),yy)
 	rm -f $@
 	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
 		ARCH=$(KERNEL_ARCH) STRIP="$(STRIPCMD)" \
-		EXTRA_CFLAGS="$(TARGET_CFLAGS)" -C $(BUSYBOX_DIR) \
+		EXTRA_CFLAGS="$(BUSYBOX_CFLAGS)" -C $(BUSYBOX_DIR) \
 		-f scripts/Makefile.IMA
 endif
 
@@ -115,7 +116,7 @@ ifeq ($(BR2_PACKAGE_BUSYBOX_FULLINSTALL),y)
 	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
 		ARCH=$(KERNEL_ARCH) \
-		EXTRA_CFLAGS="$(TARGET_CFLAGS)" -C $(BUSYBOX_DIR) install
+		EXTRA_CFLAGS="$(BUSYBOX_CFLAGS)" -C $(BUSYBOX_DIR) install
 else
 	install -D -m 0755 $(BUSYBOX_DIR)/busybox $(TARGET_DIR)/bin/busybox
 endif
-- 
1.6.3.3
