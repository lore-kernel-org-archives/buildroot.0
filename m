From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 Dec 2010 01:35:41 +0100
Subject: [Buildroot] [git commit master 1/1] memtester: convert to
	gentargets and bump to 4.2.1
Message-ID: <20101214003642.B19F78E2DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=39f7af961aa422c87ccd24be60f3882bb0d9707b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also, memtester requires largefile support

[ Thomas: add patch to fix memtester's Makefile at installation
  stage. Bump to 4.2.1. ]

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    6 +-
 package/memtester/Config.in                        |    4 ++
 .../memtester/memtester-4.2.1-makefile-fix.patch   |   23 ++++++++
 package/memtester/memtester.mk                     |   54 +++++++-------------
 4 files changed, 48 insertions(+), 39 deletions(-)
 create mode 100644 package/memtester/memtester-4.2.1-makefile-fix.patch

diff --git a/CHANGES b/CHANGES
index 9377adc..d53192b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,9 +6,9 @@
 	Updated/fixed packages: at, busybox, bzip2, dbus,
 	direcfb-examples, dmalloc, cloop, cups, ffmpeg, gdk-pixbuf,
 	hostapd, i2c-tools, input-tools, libconfig, lsof,
-	ltp-testsuite, lvm2, m4, mii-diag, mrouted, openssh, openssl,
-	openvpn, pango, qt, rsync, sdl_gfx, sdl_sound, sysklogd,
-	sysvinit, udev, usbutils, xz, zlib
+	ltp-testsuite, lvm2, m4, memtester, mii-diag, mrouted,
+	openssh, openssl, openvpn, pango, qt, rsync, sdl_gfx,
+	sdl_sound, sysklogd, sysvinit, udev, usbutils, xz, zlib
 
 	New packages: dhrystone, fbgrab, lsuio, rsh-redone, whetstone
 
diff --git a/package/memtester/Config.in b/package/memtester/Config.in
index 7a504dc..82769f5 100644
--- a/package/memtester/Config.in
+++ b/package/memtester/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_MEMTESTER
 	bool "memtester"
+	depends on BR2_LARGEFILE
 	help
 	  A userspace utility for testing the memory subsystem for faults.
 
 	  http://pyropus.ca/software/memtester/
+
+comment "memtester requires a toolchain with LARGEFILE support"
+       depends on !BR2_LARGEFILE
diff --git a/package/memtester/memtester-4.2.1-makefile-fix.patch b/package/memtester/memtester-4.2.1-makefile-fix.patch
new file mode 100644
index 0000000..6f1481b
--- /dev/null
+++ b/package/memtester/memtester-4.2.1-makefile-fix.patch
@@ -0,0 +1,23 @@
+The a/{b,c} construct doesn't work within make, so let's split the
+creation of the installation directories in two commands.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+Index: memtester-4.2.1/Makefile
+===================================================================
+--- memtester-4.2.1.orig/Makefile
++++ memtester-4.2.1/Makefile
+@@ -25,8 +25,9 @@
+ all: memtester
+ 
+ install: all
+-	mkdir -m 755 -p $(INSTALLPATH)/{bin,man/man8}
++	mkdir -m 755 -p $(INSTALLPATH)/bin
+ 	install -m 755 memtester $(INSTALLPATH)/bin/
++	mkdir -m 755 -p $(INSTALLPATH)/man/man8
+ 	gzip -c memtester.8 >memtester.8.gz ; install -m 644 memtester.8.gz $(INSTALLPATH)/man/man8/
+ 
+ auto-ccld.sh: \
diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index ed8470b..a92c5d2 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -3,45 +3,27 @@
 # memtester
 #
 #############################################################
-MEMTESTER_VERSION:=4.0.6
-MEMTESTER_SOURCE:=memtester-$(MEMTESTER_VERSION).tar.gz
-MEMTESTER_SITE:=http://pyropus.ca/software/memtester/old-versions/
-MEMTESTER_DIR:=$(BUILD_DIR)/memtester-$(MEMTESTER_VERSION)
-MEMTESTER_BINARY:=memtester
-MEMTESTER_TARGET_BINARY:=usr/bin/memtester
+MEMTESTER_VERSION = 4.2.1
+MEMTESTER_SOURCE = memtester-$(MEMTESTER_VERSION).tar.gz
+MEMTESTER_SITE = http://pyropus.ca/software/memtester/old-versions/
 
-$(DL_DIR)/$(MEMTESTER_SOURCE):
-	 $(call DOWNLOAD,$(MEMTESTER_SITE),$(MEMTESTER_SOURCE))
+MEMTESTER_TARGET_INSTALL_OPTS = INSTALLPATH=$(TARGET_DIR)/usr
 
-memtester-source: $(DL_DIR)/$(MEMTESTER_SOURCE)
+define MEMTESTER_BUILD_CMDS
+	$(SED) "s,cc,$(TARGET_CC)," $(@D)/conf-*
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
 
-$(MEMTESTER_DIR)/.unpacked: $(DL_DIR)/$(MEMTESTER_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(MEMTESTER_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	#toolchain/patch-kernel.sh $(MEMTESTER_DIR) package/memtester/ memtester\*.patch
-	$(SED) "s,cc,$(TARGET_CC)," $(MEMTESTER_DIR)/conf-*
-	touch $(MEMTESTER_DIR)/.unpacked
+define MEMTESTER_INSTALL_TARGET_CMDS
+	$(MAKE) $(MEMTESTER_TARGET_INSTALL_OPTS) -C $(@D) install
+endef
 
-$(MEMTESTER_DIR)/$(MEMTESTER_BINARY): $(MEMTESTER_DIR)/.unpacked
-	$(MAKE) -C $(MEMTESTER_DIR)
-	$(STRIPCMD) $(MEMTESTER_DIR)/$(MEMTESTER_BINARY)
+define MEMTESTER_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/memtester
+endef
 
-$(TARGET_DIR)/$(MEMTESTER_TARGET_BINARY): $(MEMTESTER_DIR)/$(MEMTESTER_BINARY)
-	$(INSTALL) -m 0755 -D $(MEMTESTER_DIR)/$(MEMTESTER_BINARY) $(TARGET_DIR)/$(MEMTESTER_TARGET_BINARY)
+define MEMTESTER_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
 
-memtester: $(TARGET_DIR)/$(MEMTESTER_TARGET_BINARY)
-
-memtester-clean:
-	rm -f $(TARGET_DIR)/$(MEMTESTER_TARGET_BINARY)
-	-$(MAKE) -C $(MEMTESTER_DIR) clean
-
-memtester-dirclean:
-	rm -rf $(MEMTESTER_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_MEMTESTER),y)
-TARGETS+=memtester
-endif
+$(eval $(call GENTARGETS,package,memtester))
-- 
1.7.2.2
