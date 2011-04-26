From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 Apr 2011 16:01:52 -0300
Subject: [Buildroot] [PATCHv2] u-boot 2011.03: fix build failure of just
	tools
Message-ID: <1303844512-16424-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When we build just u-boot for the tools, for instance for an uImage
target and no u-boot image itself we just build the tools.
When this happens we have an unconfigured u-boot target thus lacking a
config.h and the build breaks.
The config.h file isn't really needed for the tools so fix it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 boot/u-boot/u-boot-2011.03-drop-configh.patch |   27 +++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 boot/u-boot/u-boot-2011.03-drop-configh.patch

diff --git a/boot/u-boot/u-boot-2011.03-drop-configh.patch b/boot/u-boot/u-boot-2011.03-drop-configh.patch
new file mode 100644
index 0000000..bf524c9
--- /dev/null
+++ b/boot/u-boot/u-boot-2011.03-drop-configh.patch
@@ -0,0 +1,27 @@
+"make tools-all" should allow building tools such as mkimage and the new
+imximage without any config, but imximage.c currently fails to build
+with:
+imximage.h:27:20: error: config.h: No such file or directory
+
+config.h is not needed in imximage.h nor in imximage.c, and imximage.h
+is only included from imximage.c, so drop this include to fix the build.
+
+Signed-off-by: Lo?c Minier <loic.minier@linaro.org>
+---
+ tools/imximage.h |    2 --
+ 1 files changed, 0 insertions(+), 2 deletions(-)
+
+diff --git a/tools/imximage.h b/tools/imximage.h
+index 38ca6be..d126a46 100644
+--- a/tools/imximage.h
++++ b/tools/imximage.h
+@@ -24,8 +24,6 @@
+ #ifndef _IMXIMAGE_H_
+ #define _IMXIMAGE_H_
+ 
+-#include <config.h>
+-
+ #define MAX_HW_CFG_SIZE_V2 121 /* Max number of registers imx can set for v2 */
+ #define MAX_HW_CFG_SIZE_V1 60  /* Max number of registers imx can set for v1 */
+ #define APP_CODE_BARKER	0xB1
+-- 1.7.2.3
-- 
1.7.3.4
