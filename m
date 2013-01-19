From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 19 Jan 2013 08:04:43 -0300
Subject: [Buildroot] [PATCH] uboot-tools: fix build failure for the target
Message-ID: <1358593483-26071-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch to drop config.h is still required, it just needed a tweak.
Fixes:
http://autobuild.buildroot.net/results/3653c0e3ec460c710524468987d5192337cf210e/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../uboot-tools-drop-configh-from-tools.patch      | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/uboot-tools/uboot-tools-drop-configh-from-tools.patch

diff --git a/package/uboot-tools/uboot-tools-drop-configh-from-tools.patch b/package/uboot-tools/uboot-tools-drop-configh-from-tools.patch
new file mode 100644
index 0000000..21995ec
--- /dev/null
+++ b/package/uboot-tools/uboot-tools-drop-configh-from-tools.patch
@@ -0,0 +1,37 @@
+We need to build u-boot tools without a board configuration for the target.
+fw_env just uses config.h to define the default environment of the created
+image, so it really isn't mandatory.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura u-boot-2013.01.orig/tools/env/fw_env.h u-boot-2013.01/tools/env/fw_env.h
+--- u-boot-2013.01.orig/tools/env/fw_env.h	2013-01-19 07:50:53.879241660 -0300
++++ u-boot-2013.01/tools/env/fw_env.h	2013-01-19 07:58:11.897903403 -0300
+@@ -21,15 +21,6 @@
+  * MA 02111-1307 USA
+  */
+ 
+-/* Pull in the current config to define the default environment */
+-#ifndef __ASSEMBLY__
+-#define __ASSEMBLY__ /* get only #defines from config.h */
+-#include <config.h>
+-#undef	__ASSEMBLY__
+-#else
+-#include <config.h>
+-#endif
+-
+ /*
+  * To build the utility with the static configuration
+  * comment out the next line.
+diff -Nura u-boot-2013.01.orig/tools/env/Makefile u-boot-2013.01/tools/env/Makefile
+--- u-boot-2013.01.orig/tools/env/Makefile	2013-01-19 07:50:53.879241660 -0300
++++ u-boot-2013.01/tools/env/Makefile	2013-01-19 07:59:34.926486346 -0300
+@@ -26,7 +26,7 @@
+ HOSTSRCS := $(SRCTREE)/lib/crc32.c  fw_env.c  fw_env_main.c
+ HOSTSRCS += $(SRCTREE)/lib/ctype.c $(SRCTREE)/lib/linux_string.c
+ HOSTSRCS += $(SRCTREE)/common/env_attr.c $(SRCTREE)/common/env_flags.c
+-HEADERS	:= fw_env.h $(OBJTREE)/include/config.h
++HEADERS	:= fw_env.h
+ 
+ # Compile for a hosted environment on the target
+ HOSTCPPFLAGS  = -idirafter $(SRCTREE)/include \
-- 
1.7.12.4
