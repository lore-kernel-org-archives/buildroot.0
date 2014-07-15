From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Tue, 15 Jul 2014 17:54:15 +0200
Subject: [Buildroot] [PATCH 1/1] ti-gfx: add patch to fix build failure with
	es5.x
Message-ID: <1405439655-5843-1-git-send-email-hadrien.boutteville@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit a73fdc647417699833f22d0f239affe22e062827 in the kernel,
omap_dss_device's 'output' is renamed 'src'.

Build kernel module with es5.x fails because ti-gfx still uses 'output'.

Fix build with at least es5.x selected (AM35xx).

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 .../ti-gfx/ti-gfx-0001-fix-build-omaplfb-linux.patch   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 package/ti-gfx/ti-gfx-0001-fix-build-omaplfb-linux.patch

diff --git a/package/ti-gfx/ti-gfx-0001-fix-build-omaplfb-linux.patch b/package/ti-gfx/ti-gfx-0001-fix-build-omaplfb-linux.patch
new file mode 100644
index 0000000..98a7632
--- /dev/null
+++ b/package/ti-gfx/ti-gfx-0001-fix-build-omaplfb-linux.patch
@@ -0,0 +1,18 @@
+Since commit a73fdc647417699833f22d0f239affe22e062827 in the kernel,
+omap_dss_device's 'output' is renamed 'src'.
+
+Fix build with at least es5.x selected (AM35xx).
+
+Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
+
+--- a/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c
++++ b/GFX_Linux_KM/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c
+@@ -177,7 +177,7 @@
+ #if (LINUX_VERSION_CODE < KERNEL_VERSION(3,7,0))
+ #define OMAP_DSS_MANAGER(man, dev) struct omap_overlay_manager *man = (dev) != NULL ? (dev)->manager : NULL
+ #else
+-#define OMAP_DSS_MANAGER(man, dev) struct omap_overlay_manager *man = (dev) != NULL ? (dev)->output->manager : NULL
++#define OMAP_DSS_MANAGER(man, dev) struct omap_overlay_manager *man = (dev) != NULL ? (dev)->src->manager : NULL
+ #endif
+ 
+ #define	WAIT_FOR_VSYNC(man)	((man)->wait_for_vsync)
-- 
2.0.1
