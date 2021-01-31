From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 21:29:03 +0100
Subject: [Buildroot] [git commit] package/sunxi-mali-mainline-driver: bump
 version
Message-ID: <20210131201202.8BCA8812B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=208840275351930ee81da919ab9a02e1fb4f6611
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump version and drop local patches already merged upstream. Add Linux
option needed by Linux version >= 4.20 package documentation and to .mk
file that automatically adds it to Linux config when building.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-mali-support-building-against-5.9.patch   | 269 ---------------------
 .../0002-mali-support-building-against-5.10.patch  |  98 --------
 package/sunxi-mali-mainline-driver/Config.in       |   4 +
 .../sunxi-mali-mainline-driver.hash                |   2 +-
 .../sunxi-mali-mainline-driver.mk                  |   3 +-
 5 files changed, 7 insertions(+), 369 deletions(-)

diff --git a/package/sunxi-mali-mainline-driver/0001-mali-support-building-against-5.9.patch b/package/sunxi-mali-mainline-driver/0001-mali-support-building-against-5.9.patch
deleted file mode 100644
index f4e5386b58..0000000000
--- a/package/sunxi-mali-mainline-driver/0001-mali-support-building-against-5.9.patch
+++ /dev/null
@@ -1,269 +0,0 @@
-From 66731b7ec7d36e86d772aee84a84b648f37dbf5d Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Thu, 17 Dec 2020 01:32:21 +0100
-Subject: [PATCH] mali: support building against 5.9
-
-Add patches to fix build failure with Linux version 5.9 due to
-asm/uaccess.h changes and HAVE_UNLOCKED_IOCTL macro missing in version
-r6p0 and r6p2. While for r8p1 and r9p0 patch is the same and is located
-in patches/ root and fix HAVE_UNLOCKED_IOCTL issue only.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- ...24-mali-support-building-against-5.9.patch | 36 +++++++++
- ...24-mali-support-building-against-5.9.patch | 76 +++++++++++++++++++
- patches/r6p0/series                           |  1 +
- ...24-mali-support-building-against-5.9.patch | 76 +++++++++++++++++++
- patches/r6p2/series                           |  1 +
- patches/r8p1/series                           |  1 +
- patches/r9p0/series                           |  1 +
- 7 files changed, 192 insertions(+)
- create mode 100644 patches/0024-mali-support-building-against-5.9.patch
- create mode 100644 patches/r6p0/0024-mali-support-building-against-5.9.patch
- create mode 100644 patches/r6p2/0024-mali-support-building-against-5.9.patch
-
-diff --git a/patches/0024-mali-support-building-against-5.9.patch b/patches/0024-mali-support-building-against-5.9.patch
-new file mode 100644
-index 0000000..c54dfef
---- /dev/null
-+++ b/patches/0024-mali-support-building-against-5.9.patch
-@@ -0,0 +1,36 @@
-+From f760b79bc15557a13d9bb68a9a3fb9c8e08dfbae Mon Sep 17 00:00:00 2001
-+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-+Date: Thu, 17 Dec 2020 16:41:49 +0100
-+Subject: [PATCH] mali: support building against 5.9
-+
-+Starting from Linux version 5.9.0 HAVE_UNLOCKED_IOCTL macro has been
-+removed making actual code to use .ioctl struct member resulting in a
-+build failure, so let's declare locally such macro if Linux
-+version >= 5.9.0.
-+
-+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-+---
-+ src/devicedrv/mali/linux/mali_kernel_linux.c | 7 +++++++
-+ 1 file changed, 7 insertions(+)
-+
-+diff --git a/src/devicedrv/mali/linux/mali_kernel_linux.c b/src/devicedrv/mali/linux/mali_kernel_linux.c
-+index d7893a3..9005466 100644
-+--- a/src/devicedrv/mali/linux/mali_kernel_linux.c
-++++ b/src/devicedrv/mali/linux/mali_kernel_linux.c
-+@@ -65,6 +65,13 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(mali_hw_counter);
-+ EXPORT_TRACEPOINT_SYMBOL_GPL(mali_sw_counters);
-+ #endif /* CONFIG_TRACEPOINTS */
-+ 
-++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 9, 0)
-++/* From Linux version 5.9.0 HAVE_UNLOCKED_IOCTL has been removed
-++ * so let's reintroduce it here.
-++ */
-++#define HAVE_UNLOCKED_IOCTL
-++#endif
-++
-+ #ifdef CONFIG_MALI_DEVFREQ
-+ #include "mali_devfreq.h"
-+ #include "mali_osk_mali.h"
-+-- 
-+2.25.1
-+
-diff --git a/patches/r6p0/0024-mali-support-building-against-5.9.patch b/patches/r6p0/0024-mali-support-building-against-5.9.patch
-new file mode 100644
-index 0000000..54b773b
---- /dev/null
-+++ b/patches/r6p0/0024-mali-support-building-against-5.9.patch
-@@ -0,0 +1,76 @@
-+From 44dbb7d2036ba41d5db46fadb86e0461fce0948f Mon Sep 17 00:00:00 2001
-+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-+Date: Thu, 17 Dec 2020 02:26:49 +0100
-+Subject: [PATCH] mali: support building against 5.9
-+
-+Starting from Linux version 5.9.0 HAVE_UNLOCKED_IOCTL macro has been
-+removed making actual code to use .ioctl struct member resulting in a
-+build failure, so let's declare locally such macro if Linux
-+version >= 5.9.0.
-+
-+Starting from Linux version 5.9.0 also part of <asm/uaccess.h> has been
-+moved to <linux/uaccess.h> so let's include <linux/uaccess.h> if Linux
-+version >= 5.9.0.
-+
-+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-+---
-+ src/devicedrv/mali/linux/mali_kernel_linux.c | 7 +++++++
-+ src/devicedrv/mali/linux/mali_osk_mali.c     | 5 +++++
-+ src/devicedrv/mali/linux/mali_osk_misc.c     | 5 +++++
-+ 3 files changed, 17 insertions(+)
-+
-+diff --git a/src/devicedrv/mali/linux/mali_kernel_linux.c b/src/devicedrv/mali/linux/mali_kernel_linux.c
-+index 34cb3d7..c098c77 100755
-+--- a/src/devicedrv/mali/linux/mali_kernel_linux.c
-++++ b/src/devicedrv/mali/linux/mali_kernel_linux.c
-+@@ -63,6 +63,13 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(mali_hw_counter);
-+ EXPORT_TRACEPOINT_SYMBOL_GPL(mali_sw_counters);
-+ #endif /* CONFIG_TRACEPOINTS */
-+ 
-++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 9, 0)
-++/* From Linux version 5.9.0 HAVE_UNLOCKED_IOCTL has been removed
-++ * so let's reintroduce it here.
-++ */
-++#define HAVE_UNLOCKED_IOCTL
-++#endif
-++
-+ /* from the __malidrv_build_info.c file that is generated during build */
-+ extern const char *__malidrv_build_info(void);
-+ 
-+diff --git a/src/devicedrv/mali/linux/mali_osk_mali.c b/src/devicedrv/mali/linux/mali_osk_mali.c
-+index ee82b6e..1491d10 100755
-+--- a/src/devicedrv/mali/linux/mali_osk_mali.c
-++++ b/src/devicedrv/mali/linux/mali_osk_mali.c
-+@@ -13,7 +13,12 @@
-+  * Implementation of the OS abstraction layer which is specific for the Mali kernel device driver
-+  */
-+ #include <linux/kernel.h>
-++#include <linux/version.h>
-++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 9, 0)
-++#include <linux/uaccess.h>
-++#else
-+ #include <asm/uaccess.h>
-++#endif
-+ #include <linux/platform_device.h>
-+ #include <linux/mali/mali_utgard.h>
-+ #include <linux/of.h>
-+diff --git a/src/devicedrv/mali/linux/mali_osk_misc.c b/src/devicedrv/mali/linux/mali_osk_misc.c
-+index 0a619e3..87ff192 100755
-+--- a/src/devicedrv/mali/linux/mali_osk_misc.c
-++++ b/src/devicedrv/mali/linux/mali_osk_misc.c
-+@@ -13,7 +13,12 @@
-+  * Implementation of the OS abstraction layer for the kernel device driver
-+  */
-+ #include <linux/kernel.h>
-++#include <linux/version.h>
-++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 9, 0)
-++#include <linux/uaccess.h>
-++#else
-+ #include <asm/uaccess.h>
-++#endif
-+ #include <asm/cacheflush.h>
-+ #include <linux/sched.h>
-+ #include <linux/seq_file.h>
-+-- 
-+2.25.1
-+
-diff --git a/patches/r6p0/series b/patches/r6p0/series
-index 50e54d6..4074177 100644
---- a/patches/r6p0/series
-+++ b/patches/r6p0/series
-@@ -17,3 +17,4 @@ r6p0/0013-mali-support-building-against-4.15.patch
- 0021-mali-support-building-against-5.3.patch
- r6p0/0022-mali-support-building-against-5.6.patch
- 0023-mali-support-building-against-5.7.patch
-+r6p0/0024-mali-support-building-against-5.9.patch
-diff --git a/patches/r6p2/0024-mali-support-building-against-5.9.patch b/patches/r6p2/0024-mali-support-building-against-5.9.patch
-new file mode 100644
-index 0000000..0f9ca40
---- /dev/null
-+++ b/patches/r6p2/0024-mali-support-building-against-5.9.patch
-@@ -0,0 +1,76 @@
-+From ebcecb62301c49e0dd67032e7db14c20be2df48b Mon Sep 17 00:00:00 2001
-+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-+Date: Thu, 17 Dec 2020 00:49:45 +0100
-+Subject: [PATCH] mali: support building against 5.9
-+
-+Starting from Linux version 5.9.0 HAVE_UNLOCKED_IOCTL macro has been
-+removed making actual code to use .ioctl struct member resulting in a
-+build failure, so let's declare locally such macro if Linux
-+version >= 5.9.0.
-+
-+Starting from Linux version 5.9.0 also part of <asm/uaccess.h> has been
-+moved to <linux/uaccess.h> so let's include <linux/uaccess.h> if Linux
-+version >= 5.9.0.
-+
-+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-+---
-+ src/devicedrv/mali/linux/mali_kernel_linux.c | 7 +++++++
-+ src/devicedrv/mali/linux/mali_osk_mali.c     | 5 +++++
-+ src/devicedrv/mali/linux/mali_osk_misc.c     | 5 +++++
-+ 3 files changed, 17 insertions(+)
-+
-+diff --git a/src/devicedrv/mali/linux/mali_kernel_linux.c b/src/devicedrv/mali/linux/mali_kernel_linux.c
-+index 9bfa2bd..51e5012 100755
-+--- a/src/devicedrv/mali/linux/mali_kernel_linux.c
-++++ b/src/devicedrv/mali/linux/mali_kernel_linux.c
-+@@ -69,6 +69,13 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(mali_sw_counters);
-+ #include "mali_devfreq.h"
-+ #include "mali_osk_mali.h"
-+ 
-++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 9, 0)
-++/* From Linux version 5.9.0 HAVE_UNLOCKED_IOCTL has been removed
-++ * so let's reintroduce it here.
-++ */
-++#define HAVE_UNLOCKED_IOCTL
-++#endif
-++
-+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 4, 0)
-+ #include <linux/pm_opp.h>
-+ #else
-+diff --git a/src/devicedrv/mali/linux/mali_osk_mali.c b/src/devicedrv/mali/linux/mali_osk_mali.c
-+index 272d196..fdb8952 100755
-+--- a/src/devicedrv/mali/linux/mali_osk_mali.c
-++++ b/src/devicedrv/mali/linux/mali_osk_mali.c
-+@@ -13,7 +13,12 @@
-+  * Implementation of the OS abstraction layer which is specific for the Mali kernel device driver
-+  */
-+ #include <linux/kernel.h>
-++#include <linux/version.h>
-++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 9, 0)
-++#include <linux/uaccess.h>
-++#else
-+ #include <asm/uaccess.h>
-++#endif
-+ #include <linux/platform_device.h>
-+ #include <linux/mali/mali_utgard.h>
-+ #include <linux/of.h>
-+diff --git a/src/devicedrv/mali/linux/mali_osk_misc.c b/src/devicedrv/mali/linux/mali_osk_misc.c
-+index 7dda283..58c6a4c 100755
-+--- a/src/devicedrv/mali/linux/mali_osk_misc.c
-++++ b/src/devicedrv/mali/linux/mali_osk_misc.c
-+@@ -13,7 +13,12 @@
-+  * Implementation of the OS abstraction layer for the kernel device driver
-+  */
-+ #include <linux/kernel.h>
-++#include <linux/version.h>
-++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 9, 0)
-++#include <linux/uaccess.h>
-++#else
-+ #include <asm/uaccess.h>
-++#endif
-+ #include <asm/cacheflush.h>
-+ #include <linux/sched.h>
-+ #include <linux/seq_file.h>
-+-- 
-+2.25.1
-+
-diff --git a/patches/r6p2/series b/patches/r6p2/series
-index 4c68a77..775bc6f 100644
---- a/patches/r6p2/series
-+++ b/patches/r6p2/series
-@@ -20,3 +20,4 @@ r6p2/0016-mali-support-building-against-4.16.patch
- 0021-mali-support-building-against-5.3.patch
- r6p2/0022-mali-support-building-against-5.6.patch
- 0023-mali-support-building-against-5.7.patch
-+r6p2/0024-mali-support-building-against-5.9.patch
-diff --git a/patches/r8p1/series b/patches/r8p1/series
-index a49a59b..0f15e40 100644
---- a/patches/r8p1/series
-+++ b/patches/r8p1/series
-@@ -15,3 +15,4 @@ r8p1/0017-mali-support-building-against-4.9-later.patch
- 0021-mali-support-building-against-5.3.patch
- r6p2/0022-mali-support-building-against-5.6.patch
- 0023-mali-support-building-against-5.7.patch
-+0024-mali-support-building-against-5.9.patch
-diff --git a/patches/r9p0/series b/patches/r9p0/series
-index 301177c..866e869 100644
---- a/patches/r9p0/series
-+++ b/patches/r9p0/series
-@@ -12,3 +12,4 @@ r6p2/0016-mali-support-building-against-4.16.patch
- 0021-mali-support-building-against-5.3.patch
- r6p2/0022-mali-support-building-against-5.6.patch
- 0023-mali-support-building-against-5.7.patch
-+0024-mali-support-building-against-5.9.patch
--- 
-2.25.1
-
diff --git a/package/sunxi-mali-mainline-driver/0002-mali-support-building-against-5.10.patch b/package/sunxi-mali-mainline-driver/0002-mali-support-building-against-5.10.patch
deleted file mode 100644
index d64d3af1ef..0000000000
--- a/package/sunxi-mali-mainline-driver/0002-mali-support-building-against-5.10.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From 8ea1fb65dd5db556b386a1ed726f7315d3511c2b Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Thu, 17 Dec 2020 01:54:52 +0100
-Subject: [PATCH] mali: support building against 5.10
-
-Add patch to fix build failure with Linux version 5.10 due to missing
-linux/dma-contiguous.h which content has been moved to
-linux/dma-mapping.h
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- ...5-mali-support-building-against-5.10.patch | 34 +++++++++++++++++++
- patches/r6p0/series                           |  1 +
- patches/r6p2/series                           |  1 +
- patches/r8p1/series                           |  1 +
- patches/r9p0/series                           |  1 +
- 5 files changed, 38 insertions(+)
- create mode 100644 patches/0025-mali-support-building-against-5.10.patch
-
-diff --git a/patches/0025-mali-support-building-against-5.10.patch b/patches/0025-mali-support-building-against-5.10.patch
-new file mode 100644
-index 0000000..e9070e7
---- /dev/null
-+++ b/patches/0025-mali-support-building-against-5.10.patch
-@@ -0,0 +1,34 @@
-+From 9a6b4558bb7f470152ab00692010f07fd0bfa8f8 Mon Sep 17 00:00:00 2001
-+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-+Date: Thu, 17 Dec 2020 01:19:33 +0100
-+Subject: [PATCH] mali: support building against 5.10
-+
-+Starting from Linux version 5.10.0 <linux/dma-contiguous.h> has been
-+removed and its content moved to <linux/dma-mapping.h> and this leads
-+to build failure with Linux 5.10. So let's include
-+<include/dma-contiguous.h> only if we're building with Linux
-+version < 5.10.0.
-+
-+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-+---
-+ src/devicedrv/mali/platform/sunxi/sunxi.c | 3 +++
-+ 1 file changed, 3 insertions(+)
-+
-+diff --git a/src/devicedrv/mali/platform/sunxi/sunxi.c b/src/devicedrv/mali/platform/sunxi/sunxi.c
-+index 74ebe0b..a8df0d9 100644
-+--- a/src/devicedrv/mali/platform/sunxi/sunxi.c
-++++ b/src/devicedrv/mali/platform/sunxi/sunxi.c
-+@@ -3,7 +3,10 @@
-+ #include <linux/clkdev.h>
-+ #include <linux/cma.h>
-+ #include <linux/delay.h>
-++#include <linux/version.h>
-++#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 10, 0)
-+ #include <linux/dma-contiguous.h>
-++#endif
-+ #include <linux/dma-mapping.h>
-+ #include <linux/io.h>
-+ #include <linux/kernel.h>
-+-- 
-+2.25.1
-+
-diff --git a/patches/r6p0/series b/patches/r6p0/series
-index 4074177..5d4883f 100644
---- a/patches/r6p0/series
-+++ b/patches/r6p0/series
-@@ -18,3 +18,4 @@ r6p0/0013-mali-support-building-against-4.15.patch
- r6p0/0022-mali-support-building-against-5.6.patch
- 0023-mali-support-building-against-5.7.patch
- r6p0/0024-mali-support-building-against-5.9.patch
-+0025-mali-support-building-against-5.10.patch
-diff --git a/patches/r6p2/series b/patches/r6p2/series
-index 775bc6f..e19cf11 100644
---- a/patches/r6p2/series
-+++ b/patches/r6p2/series
-@@ -21,3 +21,4 @@ r6p2/0016-mali-support-building-against-4.16.patch
- r6p2/0022-mali-support-building-against-5.6.patch
- 0023-mali-support-building-against-5.7.patch
- r6p2/0024-mali-support-building-against-5.9.patch
-+0025-mali-support-building-against-5.10.patch
-diff --git a/patches/r8p1/series b/patches/r8p1/series
-index 0f15e40..4ad43c1 100644
---- a/patches/r8p1/series
-+++ b/patches/r8p1/series
-@@ -16,3 +16,4 @@ r8p1/0017-mali-support-building-against-4.9-later.patch
- r6p2/0022-mali-support-building-against-5.6.patch
- 0023-mali-support-building-against-5.7.patch
- 0024-mali-support-building-against-5.9.patch
-+0025-mali-support-building-against-5.10.patch
-diff --git a/patches/r9p0/series b/patches/r9p0/series
-index 866e869..dca4e02 100644
---- a/patches/r9p0/series
-+++ b/patches/r9p0/series
-@@ -13,3 +13,4 @@ r6p2/0016-mali-support-building-against-4.16.patch
- r6p2/0022-mali-support-building-against-5.6.patch
- 0023-mali-support-building-against-5.7.patch
- 0024-mali-support-building-against-5.9.patch
-+0025-mali-support-building-against-5.10.patch
--- 
-2.25.1
-
diff --git a/package/sunxi-mali-mainline-driver/Config.in b/package/sunxi-mali-mainline-driver/Config.in
index 057f20db66..5db66c5bf6 100644
--- a/package/sunxi-mali-mainline-driver/Config.in
+++ b/package/sunxi-mali-mainline-driver/Config.in
@@ -22,4 +22,8 @@ config BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER
 	  - CONFIG_CMA
 	  - CONFIG_DMA_CMA
 
+	  starting from Linux Kernel >= 4.20 following options must be
+	  enabled:
+	  - CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM
+
 	  https://github.com/mripard/sunxi-mali/blob/master/README.md
diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
index 9f4b1a6694..f08e80f114 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a2bb43ed2e64cb081e3bc814941c4de02e785f9984783061cf486d2b0b92407b  sunxi-mali-mainline-driver-a588b22f6b3d40ad18070c699f90f36ed21c9f7d.tar.gz
+sha256  0197271dbf503e866dd4873091f61bb3de1f2c3031701aac1ba205d1e2f267ac  sunxi-mali-mainline-driver-e4a91c95096bb31450b556fcb13f3c4ba79f60b4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
index 3bb899041e..feffaa7ae6 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_MAINLINE_DRIVER_VERSION = a588b22f6b3d40ad18070c699f90f36ed21c9f7d
+SUNXI_MALI_MAINLINE_DRIVER_VERSION = e4a91c95096bb31450b556fcb13f3c4ba79f60b4
 SUNXI_MALI_MAINLINE_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_MAINLINE_DRIVER_VERSION))
 SUNXI_MALI_MAINLINE_DRIVER_DEPENDENCIES = linux
 SUNXI_MALI_MAINLINE_DRIVER_LICENSE = GPL-2.0
@@ -35,6 +35,7 @@ endef
 define SUNXI_MALI_MAINLINE_DRIVER_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CMA)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_DMA_CMA)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
 endef
 
 $(eval $(generic-package))
