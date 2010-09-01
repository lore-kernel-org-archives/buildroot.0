From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  1 Sep 2010 14:04:53 +0200
Subject: [Buildroot] [PATCH 01/11] Remove CONFIG_DEFCONFIG
In-Reply-To: <cover.1283342666.git.thomas.petazzoni@free-electrons.com>
References: <cover.1283342666.git.thomas.petazzoni@free-electrons.com>
Message-ID: <dc9dba1509242bb9d2b2c4aa43ff3a019f02bc20.1283342666.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There's no need to have a .defconfig, when you run make menuconfig,
make xconfig or anything else for the first time, it will just start
with the default configuration anyway. This is what the kernel does.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index d37d81f..e3cebe2 100644
--- a/Makefile
+++ b/Makefile
@@ -25,7 +25,6 @@
 # absolute path
 TOPDIR:=$(shell pwd)
 CONFIG_CONFIG_IN=Config.in
-CONFIG_DEFCONFIG=.defconfig
 CONFIG=package/config
 DATE:=$(shell date +%Y%m%d)
 
@@ -465,9 +464,6 @@ export HOSTCFLAGS
 $(BUILD_DIR)/buildroot-config/%onf:
 	mkdir -p $(@D)/lxdialog
 	$(MAKE) CC="$(HOSTCC)" obj=$(@D) -C $(CONFIG) $(@F)
-	- at if [ ! -f $(CONFIG_DIR)/.config ]; then \
-		cp $(CONFIG_DEFCONFIG) $(CONFIG_DIR)/.config; \
-	fi
 
 xconfig: $(BUILD_DIR)/buildroot-config/qconf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
@@ -513,7 +509,6 @@ randconfig: $(BUILD_DIR)/buildroot-config/conf
 		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< -r $(CONFIG_CONFIG_IN)
 
 allyesconfig: $(BUILD_DIR)/buildroot-config/conf
-	cat $(CONFIG_DEFCONFIG) > $(CONFIG_DIR)/.config
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-- 
1.7.0.4
