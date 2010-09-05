From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Sep 2010 22:52:22 +0200
Subject: [Buildroot] [git commit master 1/1] Remove CONFIG_DEFCONFIG
Message-ID: <20100905213832.6813D8A4A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dc9dba1509242bb9d2b2c4aa43ff3a019f02bc20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
1.7.1
