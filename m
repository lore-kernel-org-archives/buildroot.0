From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 25 Apr 2014 14:48:08 +0400
Subject: [Buildroot] [PATCH] uboot-tools: bump to version 2014.04
Message-ID: <1398422888-10671-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In U-Boot v2014.04 new make target was implemented for separate building of
host tools only - http://git.denx.de/?p=u-boot.git;a=commit;h=4642e0022b648968c994551b087a780327079883

Now we don't need any additional patches and may just say "make tools-only".

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 .../uboot-tools-01-drop-configh-from-tools.patch   | 37 ----------------------
 .../uboot-tools-02-hostcflags-override-fix.patch   | 29 -----------------
 package/uboot-tools/uboot-tools.mk                 |  8 ++---
 3 files changed, 2 insertions(+), 72 deletions(-)
 delete mode 100644 package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch
 delete mode 100644 package/uboot-tools/uboot-tools-02-hostcflags-override-fix.patch

diff --git a/package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch b/package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch
deleted file mode 100644
index 21995ec..0000000
--- a/package/uboot-tools/uboot-tools-01-drop-configh-from-tools.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-We need to build u-boot tools without a board configuration for the target.
-fw_env just uses config.h to define the default environment of the created
-image, so it really isn't mandatory.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura u-boot-2013.01.orig/tools/env/fw_env.h u-boot-2013.01/tools/env/fw_env.h
---- u-boot-2013.01.orig/tools/env/fw_env.h	2013-01-19 07:50:53.879241660 -0300
-+++ u-boot-2013.01/tools/env/fw_env.h	2013-01-19 07:58:11.897903403 -0300
-@@ -21,15 +21,6 @@
-  * MA 02111-1307 USA
-  */
- 
--/* Pull in the current config to define the default environment */
--#ifndef __ASSEMBLY__
--#define __ASSEMBLY__ /* get only #defines from config.h */
--#include <config.h>
--#undef	__ASSEMBLY__
--#else
--#include <config.h>
--#endif
--
- /*
-  * To build the utility with the static configuration
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
index 398ce8b..de83fde 100644
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
@@ -45,11 +45,7 @@ define UBOOT_TOOLS_INSTALL_TARGET_CMDS
 endef
 
 define HOST_UBOOT_TOOLS_BUILD_CMDS
-	$(MAKE1) -C $(@D) 			\
-		HOSTCC="$(HOSTCC)"		\
-		HOSTCFLAGS="$(HOST_CFLAGS)"	\
-		HOSTLDFLAGS="$(HOST_LDFLAGS)"	\
-		tools
+	$(MAKE1) -C $(@D) tools-only
 endef
 
 define HOST_UBOOT_TOOLS_INSTALL_CMDS
-- 
1.9.0
