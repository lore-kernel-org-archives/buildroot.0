From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Sep 2010 22:52:22 +0200
Subject: [Buildroot] [git commit master 1/1] Add support for the new nconf
	configuration tool
Message-ID: <20100905213833.3C3B98A4A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8b6585a9d3adf35179c988a10edd16ffc2c15346
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                                           |   10 +++++++++-
 package/config/Makefile                            |    3 +++
 .../patches/06-br-build-system-integration.patch   |   19 +++++++++++++------
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 73d9335..fd46972 100644
--- a/Makefile
+++ b/Makefile
@@ -28,7 +28,7 @@ CONFIG_CONFIG_IN=Config.in
 CONFIG=package/config
 DATE:=$(shell date +%Y%m%d)
 
-noconfig_targets:=menuconfig gconfig xconfig config oldconfig randconfig \
+noconfig_targets:=menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig allyesconfig allnoconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
 	source-check help
@@ -490,6 +490,14 @@ menuconfig: $(BUILD_DIR)/buildroot-config/mconf
 		test -f $(CONFIG_DIR)/.config.cmd || rm -f $(CONFIG_DIR)/.config; \
 	fi
 
+nconfig: $(BUILD_DIR)/buildroot-config/nconf
+	@mkdir -p $(BUILD_DIR)/buildroot-config
+	@if ! KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
+		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
+		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< $(CONFIG_CONFIG_IN); then \
+		test -f $(CONFIG_DIR)/.config.cmd || rm -f $(CONFIG_DIR)/.config; \
+	fi
+
 config: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
diff --git a/package/config/Makefile b/package/config/Makefile
index 7e199bc..d8d44b0 100644
--- a/package/config/Makefile
+++ b/package/config/Makefile
@@ -177,6 +177,9 @@ hostprogs-y := conf qconf gconf kxgettext
 ifeq ($(MAKECMDGOALS),nconfig)
 	hostprogs-y += nconf
 endif
+ifeq ($(findstring nconf,$(MAKECMDGOALS)),nconf)
+       hostprogs-y += nconf
+endif
 
 ifeq ($(MAKECMDGOALS),menuconfig)
 	hostprogs-y += mconf
diff --git a/package/config/patches/06-br-build-system-integration.patch b/package/config/patches/06-br-build-system-integration.patch
index a2e634f..128bbc0 100644
--- a/package/config/patches/06-br-build-system-integration.patch
+++ b/package/config/patches/06-br-build-system-integration.patch
@@ -1,12 +1,19 @@
 ---
- Makefile |   11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
+ Makefile |   14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
 
-Index: config.new/Makefile
+Index: config/Makefile
 ===================================================================
---- config.new.orig/Makefile
-+++ config.new/Makefile
-@@ -181,14 +181,23 @@
+--- config.orig/Makefile
++++ config/Makefile
+@@ -177,18 +177,30 @@
+ ifeq ($(MAKECMDGOALS),nconfig)
+ 	hostprogs-y += nconf
+ endif
++ifeq ($(findstring nconf,$(MAKECMDGOALS)),nconf)
++       hostprogs-y += nconf
++endif
+ 
  ifeq ($(MAKECMDGOALS),menuconfig)
  	hostprogs-y += mconf
  endif
-- 
1.7.1
