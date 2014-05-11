From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 May 2014 00:01:13 +0200
Subject: [Buildroot] [git commit] uboot-tools: bump to version 2014.04
Message-ID: <20140511220251.6D65A9CB33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81b23d02fc1047c783e8acaaa123e3fda7ec03e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

U-Boot v2014.04 introduced significant changes in its build infrastrcture.

Among things related to buildroot are:
1. Special new target ("tools-only") was added for building host tools alone

2. Tools cross-building for target is no longer possible with substitution of
HOSTxx with TARGETxx because host binaries won't be built. Instead we just set
CROSS_COMPILE and CROSS_BUILD_TOOLS variables.

3. Most of make targets now require U-Boot to be configured before building.
So for building generic "fw_printenv" we now need to make "env" target config-
independent.

4. HOSTCPPFLAGS are not used anywhere, so dropping
"uboot-tools-02-hostcflags-override-fix.patch"

Also due to lincese boilerplate change in sources
"uboot-tools-01-drop-configh-from-tools.patch" required subtle changes.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../uboot-tools-01-drop-configh-from-tools.patch   |   26 +++++-------------
 .../uboot-tools-02-hostcflags-override-fix.patch   |   29 --------------------
 package/uboot-tools/uboot-tools.mk                 |   19 ++++++++-----
 3 files changed, 19 insertions(+), 55 deletions(-)

diff --git a/package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch b/package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch
index 21995ec..a36332f 100644
--- a/package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch
+++ b/package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch
@@ -4,11 +4,12 @@ image, so it really isn't mandatory.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-diff -Nura u-boot-2013.01.orig/tools/env/fw_env.h u-boot-2013.01/tools/env/fw_env.h
---- u-boot-2013.01.orig/tools/env/fw_env.h	2013-01-19 07:50:53.879241660 -0300
-+++ u-boot-2013.01/tools/env/fw_env.h	2013-01-19 07:58:11.897903403 -0300
-@@ -21,15 +21,6 @@
-  * MA 02111-1307 USA
+diff --git a/tools/env/fw_env.h b/tools/env/fw_env.h
+index aff471b..dfe7439 100644
+--- a/tools/env/fw_env.h
++++ b/tools/env/fw_env.h
+@@ -5,14 +5,6 @@
+  * SPDX-License-Identifier:	GPL-2.0+
   */
  
 -/* Pull in the current config to define the default environment */
@@ -19,19 +20,6 @@ diff -Nura u-boot-2013.01.orig/tools/env/fw_env.h u-boot-2013.01/tools/env/fw_en
 -#else
 -#include <config.h>
 -#endif
--
+ 
  /*
   * To build the utility with the static configuration
-  * comment out the next line.
-diff -Nura u-boot-2013.01.orig/tools/env/Makefile u-boot-2013.01/tools/env/Makefile
---- u-boot-2013.01.orig/tools/env/Makefile	2013-01-19 07:50:53.879241660 -0300
-+++ u-boot-2013.01/tools/env/Makefile	2013-01-19 07:59:34.926486346 -0300
-@@ -26,7 +26,7 @@
- HOSTSRCS := $(SRCTREE)/lib/crc32.c  fw_env.c  fw_env_main.c
- HOSTSRCS += $(SRCTREE)/lib/ctype.c $(SRCTREE)/lib/linux_string.c
- HOSTSRCS += $(SRCTREE)/common/env_attr.c $(SRCTREE)/common/env_flags.c
--HEADERS	:= fw_env.h $(OBJTREE)/include/config.h
-+HEADERS	:= fw_env.h
- 
- # Compile for a hosted environment on the target
- HOSTCPPFLAGS  = -idirafter $(SRCTREE)/include \
diff --git a/package/uboot-tools/uboot-tools-02-hostcflags-override-fix.patch b/package/uboot-tools/uboot-tools-02-hostcflags-override-fix.patch
deleted file mode 100644
index 0202eda..0000000
--- a/package/uboot-tools/uboot-tools-02-hostcflags-override-fix.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-[PATCH] Fix tools build with custom HOSTCFLAGS
-
-We always need to append HOSTCPPFLAGS, even if HOSTCFLAGS have been
-overridden on the cmdline.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- config.mk |    6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-Index: u-boot-2011.03/config.mk
-===================================================================
---- u-boot-2011.03.orig/config.mk
-+++ u-boot-2011.03/config.mk
-@@ -46,10 +46,12 @@
- 
- #########################################################################
- 
--HOSTCFLAGS	= -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer \
--		  $(HOSTCPPFLAGS)
-+HOSTCFLAGS	= -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer
- HOSTSTRIP	= strip
- 
-+# append CPPFLAGS even if CFLAGS has been overridden on cmdline
-+override HOSTCFLAGS += $(HOSTCPPFLAGS)
-+
- #
- # Mac OS X / Darwin's C preprocessor is Apple specific.  It
- # generates numerous errors and warnings.  We want to bypass it
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 398ce8b..0a3d711 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBOOT_TOOLS_VERSION = 2014.01
+UBOOT_TOOLS_VERSION = 2014.04
 UBOOT_TOOLS_SOURCE  = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPLv2+
@@ -12,11 +12,16 @@ UBOOT_TOOLS_LICENSE_FILES = Licenses/gpl-2.0.txt
 
 define UBOOT_TOOLS_BUILD_CMDS
 	$(MAKE) -C $(@D) 			\
-		HOSTCC="$(TARGET_CC)"		\
-		HOSTCFLAGS="$(TARGET_CFLAGS)"	\
-		HOSTLDFLAGS="$(TARGET_LDFLAGS)"	\
-		HOSTSTRIP=true			\
-		tools env
+		CROSS_COMPILE="$(TARGET_CROSS)"	\
+		CFLAGS="$(TARGET_CFLAGS)"	\
+		LDFLAGS="$(TARGET_LDFLAGS)"	\
+		CROSS_BUILD_TOOLS=y		\
+		tools-only
+	$(MAKE) -C $(@D) 			\
+		CROSS_COMPILE="$(TARGET_CROSS)"	\
+		CFLAGS="$(TARGET_CFLAGS)"	\
+		LDFLAGS="$(TARGET_LDFLAGS)"	\
+		env no-dot-config-targets=env
 endef
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE),y)
@@ -49,7 +54,7 @@ define HOST_UBOOT_TOOLS_BUILD_CMDS
 		HOSTCC="$(HOSTCC)"		\
 		HOSTCFLAGS="$(HOST_CFLAGS)"	\
 		HOSTLDFLAGS="$(HOST_LDFLAGS)"	\
-		tools
+		tools-only
 endef
 
 define HOST_UBOOT_TOOLS_INSTALL_CMDS
