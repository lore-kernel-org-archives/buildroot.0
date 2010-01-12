From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Jan 2010 00:27:23 +0100
Subject: [Buildroot] [PATCH 4/6] Move BR2_TARGET_OPTIMIZATION to Build
	Options and rename it
In-Reply-To: <cover.1263338839.git.thomas.petazzoni@free-electrons.com>
References: <cover.1263338839.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f65444d78235cfc916204001c58e0d60b591137a.1263338839.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_TARGET_OPTIMIZATION allows to add any CFLAGS for the target
packages building process. Therefore, it is more a Build Option than a
Toolchain Option, that's why we move it to the Build Options menu.

Since it is not restricted to optimization flags, we rename it to
BR2_EXTRA_TARGET_CFLAGS.

Finally, since the -Os optimization flag is already handled by other
Buildroot build options, we remove it from the default value.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                 |    7 +++++++
 package/Makefile.in       |    5 +++--
 toolchain/Config.in.2     |    6 ------
 toolchain/gcc/Makefile.in |    1 -
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/Config.in b/Config.in
index a658b40..2724045 100644
--- a/Config.in
+++ b/Config.in
@@ -1,3 +1,4 @@
+
 #
 
 mainmenu "Buildroot2 Configuration"
@@ -326,6 +327,12 @@ config BR2_VFP_FLOAT
 
 	  Most people will answer N.
 
+config BR2_EXTRA_TARGET_CFLAGS
+       string "Extra CFLAGS for target packages"
+       default "-pipe"
+       help
+         Extra CFLAGS to use when building packages for the target.
+
 config BR2_PREFER_STATIC_LIB
 	bool "prefer static libraries"
 	help
diff --git a/package/Makefile.in b/package/Makefile.in
index e643577..d23a17e 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -34,10 +34,11 @@ ifeq ($(BR2_DEBUG_3),y)
 TARGET_DEBUGGING=-g3
 endif
 
+EXTRA_TARGET_CFLAGS=$(call qstrip,$(BR2_EXTRA_TARGET_CFLAGS))
 
 #########################################################################
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) \
+TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(EXTRA_TARGET_CFLAGS) \
 	-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
 TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
@@ -91,7 +92,7 @@ TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 # else it's an external toolchain
 #########################################################################
 else
-TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) --sysroot $(STAGING_DIR)/
+TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(EXTRA_TARGET_CFLAGS) --sysroot $(STAGING_DIR)/
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 TARGET_LDFLAGS=--sysroot $(STAGING_DIR)/
 endif
diff --git a/toolchain/Config.in.2 b/toolchain/Config.in.2
index 0cb1384..e404657 100644
--- a/toolchain/Config.in.2
+++ b/toolchain/Config.in.2
@@ -116,12 +116,6 @@ config BR2_INSTALL_LIBSTDCPP
 	  support and you want to use the compiler / library then you need 
 	  to select this option.
 
-config BR2_TARGET_OPTIMIZATION
-	string "Target Optimizations"
-	default "-Os -pipe"
-	help
-	  Optimizations to use when building for the target host.
-
 if BR2_TOOLCHAIN_BUILDROOT
 source "toolchain/elf2flt/Config.in"
 source "toolchain/mklibs/Config.in"
diff --git a/toolchain/gcc/Makefile.in b/toolchain/gcc/Makefile.in
index c3e21cf..66473de 100644
--- a/toolchain/gcc/Makefile.in
+++ b/toolchain/gcc/Makefile.in
@@ -5,7 +5,6 @@
 # the top level.
 
 GCC_VERSION:=$(call qstrip,$(BR2_GCC_VERSION))
-TARGET_OPTIMIZATION:=$(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 EXTRA_GCC_CONFIG_OPTIONS:=$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
 
 ifeq ($(call qstrip,$(BR2_GCC_VERSION_SNAP)),y)
-- 
1.6.3.3
