From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 26 Apr 2011 21:30:15 +0200
Subject: [Buildroot] [git commit] u-boot 2011.03: fix mkimage build failure
	when u-boot isn't configured
Message-ID: <20110426193335.0E6A682A1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4732f7aa822b70f4e5c4ba34f725a5968fb1e9a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When mkimage is built without the rest of u-boot (for kernel uImage
support), u-boot doesn't get configured for a specific board, so config.h
isn't created and the build breaks.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
