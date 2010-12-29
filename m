From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 Dec 2010 23:14:48 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain: drop
	BR2_CROSS_TOOLCHAIN_TARGET_UTILS option
Message-ID: <20101229221645.96EF48EE79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=17dfec8c9b92824544ba6e4e9d0e23614e2347ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's really not very useful, all it does is install a target
strace and ldd in a target_utils directory in staging.
While at it clean up the strace makefile a bit.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/arm_nptl_toolchain_defconfig      |    1 -
 configs/arm_toolchain_defconfig           |    1 -
 package/strace/strace.mk                  |   22 +++++-----------------
 target/xtensa/defconfig                   |    1 -
 toolchain/toolchain-buildroot/Config.in.2 |   12 ------------
 toolchain/uClibc/uclibc.mk                |    5 -----
 6 files changed, 5 insertions(+), 37 deletions(-)

diff --git a/configs/arm_nptl_toolchain_defconfig b/configs/arm_nptl_toolchain_defconfig
index 99c526e..1bb1193 100644
--- a/configs/arm_nptl_toolchain_defconfig
+++ b/configs/arm_nptl_toolchain_defconfig
@@ -10,7 +10,6 @@ BR2_ENABLE_LOCALE=y
 BR2_USE_WCHAR=y
 BR2_PTHREADS_NATIVE=y
 BR2_INSTALL_LIBSTDCPP=y
-BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
 # No package
 # BR2_PACKAGE_BUSYBOX is not set
diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index 455564c..e46c5c9 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -8,7 +8,6 @@ BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
 BR2_USE_WCHAR=y
 BR2_INSTALL_LIBSTDCPP=y
-BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
 # No package
 # BR2_PACKAGE_BUSYBOX is not set
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index f4a52bc..85e82c1 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -3,14 +3,12 @@
 # strace
 #
 #############################################################
-STRACE_VERSION:=4.5.20
-STRACE_SOURCE:=strace-$(STRACE_VERSION).tar.bz2
-STRACE_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/strace
-STRACE_AUTORECONF:=NO
-STRACE_INSTALL_STAGING:=NO
-STRACE_INSTALL_TARGET:=YES
 
-STRACE_CONF_ENV:= ac_cv_header_linux_if_packet_h=yes \
+STRACE_VERSION = 4.5.20
+STRACE_SOURCE = strace-$(STRACE_VERSION).tar.bz2
+STRACE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/strace
+
+STRACE_CONF_ENV = ac_cv_header_linux_if_packet_h=yes \
 		  ac_cv_header_linux_netlink_h=yes \
 	          $(if $(BR2_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no)
 
@@ -20,14 +18,4 @@ endef
 
 STRACE_POST_INSTALL_TARGET_HOOKS += STRACE_REMOVE_STRACE_GRAPH
 
-define STRACE_INSTALL_TOOLCHAIN_TARGET_UTILS
-	mkdir -p $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/target_utils
-	install -c $(TARGET_DIR)/usr/bin/strace \
-		$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/target_utils/strace
-endef
-
-ifeq ($(BR2_CROSS_TOOLCHAIN_TARGET_UTILS),y)
-STRACE_POST_INSTALL_TARGET_HOOKS += STRACE_INSTALL_TOOLCHAIN_TARGET_UTILS
-endif
-
 $(eval $(call AUTOTARGETS,package,strace))
diff --git a/target/xtensa/defconfig b/target/xtensa/defconfig
index 200ff21..0eee5c0 100644
--- a/target/xtensa/defconfig
+++ b/target/xtensa/defconfig
@@ -80,7 +80,6 @@ BR2_GDB_VERSION="6.8"
 BR2_LARGEFILE=y
 BR2_INET_RPC=y
 BR2_TARGET_OPTIMIZATION="-Os -pipe"
-BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
 
 ## Added by Maxim
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index 6a383f6..3fd433a 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -118,16 +118,4 @@ config BR2_VFP_FLOAT
 
 	  Most people will answer N.
 
-config BR2_CROSS_TOOLCHAIN_TARGET_UTILS
-	bool "Include target utils in cross toolchain"
-	default y
-	help
-	  When using buildroot to build a deployable cross toolchain,
-	  it is handy to include certain target apps with that toolchain
-	  as a convenience.
-	  Examples include ldd, gdbserver, and strace.
-
-	  Answer Y if you want these apps (if built) copied into the
-	  cross toolchain dir under <arch>-linux-uclibc/target_utils/.
-
 endif
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index ec92824..a677be7 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -479,11 +479,6 @@ $(TARGET_DIR)/usr/bin/ldd: $(cross_compiler)
 		CPP=$(TARGET_CROSS)cpp LD=$(TARGET_CROSS)ld \
 		ARCH="$(UCLIBC_TARGET_ARCH)" \
 		PREFIX=$(TARGET_DIR) utils install_utils
-ifeq ($(BR2_CROSS_TOOLCHAIN_TARGET_UTILS),y)
-	mkdir -p $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/target_utils
-	install -c $(TARGET_DIR)/usr/bin/ldd \
-		$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/target_utils/ldd
-endif
 	touch -c $@
 
 ifneq ($(BR2_PREFER_STATIC_LIB),y)
-- 
1.7.2.2
