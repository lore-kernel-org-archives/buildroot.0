From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Tue, 8 Jun 2010 23:32:40 +0200
Subject: [Buildroot] [git commit master] lmbench: convert to generic package
	infrastructure
Message-ID: <20100608220138.BCC88909FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=415808804a1fb0f755ad9a95c2c8031f2cf58381
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1753

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    5 ++-
 package/lmbench/lmbench.mk |   49 ++++++++++++++-----------------------------
 2 files changed, 19 insertions(+), 35 deletions(-)

diff --git a/CHANGES b/CHANGES
index 365cb3e..226ffdf 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,13 +8,14 @@
 	luasocket, rings, wsapi, xavante
 
 	Updated/fixed packages: cdrkit, file, gawk, intltool,
-	iptables, libidn, netperf, openssl, php, qt, sqlite, tn5250,
-	usbutils
+	iptables, libidn, lmbench, netperf, openssl, php, qt, sqlite,
+	tn5250, usbutils
 
 	Removed packages: modutils
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#1753: lmbench: convert to generic package infrastructure
 	#1771: Fakeroot and the target/generic/device_table.txt create bad...
 	#1807: LZMA 4.32.7, Required header file(s) are missing
 	#1879: Bump iptables to 1.4.8
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index 7083527..c271ffb 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -6,42 +6,25 @@
 LMBENCH_VERSION:=3.0-a9
 LMBENCH_SOURCE:=lmbench-$(LMBENCH_VERSION).tgz
 LMBENCH_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/lmbench/development/lmbench-3.0-a9/
-LMBENCH_CAT:=$(ZCAT)
-LMBENCH_DIR:=$(BUILD_DIR)/lmbench-$(LMBENCH_VERSION)
-LMBENCH_BIN:=lmbench
-LMBENCH_TARGET_BIN:=usr/bin/$(LMBENCH_BIN)
 
-$(DL_DIR)/$(LMBENCH_SOURCE):
-	$(call DOWNLOAD,$(LMBENCH_SITE),$(LMBENCH_SOURCE))
-
-$(LMBENCH_DIR)/.unpacked: $(DL_DIR)/$(LMBENCH_SOURCE)
-	$(LMBENCH_CAT) $(DL_DIR)/$(LMBENCH_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LMBENCH_DIR) package/lmbench lmbench-$(LMBENCH_VERSION)\*.patch
-	$(CONFIG_UPDATE) $(LMBENCH_DIR)
-	sed -i 's/CFLAGS=/CFLAGS+=/g' $(LMBENCH_DIR)/src/Makefile
+define LMBENCH_CONFIGURE_CMDS
+	$(CONFIG_UPDATE) $(@D)
+	sed -i 's/CFLAGS=/CFLAGS+=/g' $(@D)/src/Makefile
+	sed -i '/cd .*doc/d' $(@D)/src/Makefile
+	sed -i '/include/d' $(@D)/src/Makefile
 	touch $@
+endef
 
-$(LMBENCH_DIR)/bin/$(ARCH)/$(LMBENCH_BIN): $(LMBENCH_DIR)/.unpacked
-	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" OS=$(ARCH) CC=$(TARGET_CC) -C $(LMBENCH_DIR)/src
-
-$(TARGET_DIR)/$(LMBENCH_TARGET_BIN): $(LMBENCH_DIR)/bin/$(ARCH)/$(LMBENCH_BIN)
-	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" OS=$(ARCH) CC=$(TARGET_CC) BASE=$(TARGET_DIR)/usr -C $(LMBENCH_DIR)/src install
-
-lmbench: $(TARGET_DIR)/$(LMBENCH_TARGET_BIN)
-
-lmbench-source: $(DL_DIR)/$(LMBENCH_SOURCE)
+define LMBENCH_BUILD_CMDS
+	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" OS=$(ARCH) CC=$(TARGET_CC) -C $(@D)/src
+endef
 
-lmbench-clean:
-	-$(MAKE) -C $(LMBENCH_DIR)/src clean
+define LMBENCH_INSTALL_TARGET_CMDS
+	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" OS=$(ARCH) CC=$(TARGET_CC) BASE=$(TARGET_DIR)/usr -C $(@D)/src install
+endef
 
-lmbench-dirclean:
-	rm -rf $(LMBENCH_DIR)
+define LMBENCH_CLEAN_CMDS
+	$(MAKE) -C $(@D)/src clean
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LMBENCH),y)
-TARGETS+=lmbench
-endif
+$(eval $(call GENTARGETS,package,lmbench))
-- 
1.6.3.3
