From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  1 Sep 2010 14:04:54 +0200
Subject: [Buildroot] [PATCH 02/11] Implement %_defconfig similarly to the
	kernel
In-Reply-To: <cover.1283342666.git.thomas.petazzoni@free-electrons.com>
References: <cover.1283342666.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6f38119cbb2cf5dd9c64109ff331a3d3868460ff.1283342666.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index e3cebe2..2b5780d 100644
--- a/Makefile
+++ b/Makefile
@@ -29,7 +29,7 @@ CONFIG=package/config
 DATE:=$(shell date +%Y%m%d)
 
 noconfig_targets:=menuconfig gconfig xconfig config oldconfig randconfig \
-	defconfig allyesconfig allnoconfig release \
+	defconfig %_defconfig allyesconfig allnoconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
 	source-check help
 
@@ -553,6 +553,12 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
 		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< -d $(CONFIG_CONFIG_IN)
 
+%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig
+	@mkdir -p $(BUILD_DIR)/buildroot-config
+	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
+		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
+		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< -D $(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
+
 # check if download URLs are outdated
 source-check: allyesconfig
 	$(MAKE) $(EXTRAMAKEARGS) _source-check
@@ -580,10 +586,6 @@ endif
 flush:
 	rm -f $(BUILD_DIR)/tgt-config.cache $(BUILD_DIR)/host-config.cache
 
-%_defconfig: $(TOPDIR)/configs/%_defconfig
-	cp $^ $(CONFIG_DIR)/.config
-	@$(MAKE) $(EXTRAMAKEARGS) oldconfig
-
 configured: dirs host-sed kernel-headers uclibc-config busybox-config linux26-config
 
 prepatch:	gcc-patched binutils-patched gdb-patched uclibc-patched
-- 
1.7.0.4
