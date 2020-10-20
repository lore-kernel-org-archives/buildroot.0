From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2020 14:07:21 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/xvisor: fix build
 with gcc 10
Message-ID: <20201020115542.77ABE839B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b89f8d7cf935d2ea10ec6dfce10abdd36f456d3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes:
 - http://autobuild.buildroot.org/results/b6070c0721b33824e71833ce53423979980aa598

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 51bd551700db6f2ee9322e1fcf4353036370ceb9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xvisor/0001-fix-build-with-gcc-10.patch | 64 +++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/package/xvisor/0001-fix-build-with-gcc-10.patch b/package/xvisor/0001-fix-build-with-gcc-10.patch
new file mode 100644
index 0000000000..a538558d86
--- /dev/null
+++ b/package/xvisor/0001-fix-build-with-gcc-10.patch
@@ -0,0 +1,64 @@
+From 8458abb357cd981f55d730ec2d74459a3042e571 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 6 Oct 2020 21:52:20 +0200
+Subject: [PATCH] fix build with gcc 10
+
+Define variables in header files as extern to avoid the following build failure
+with gcc 10 (which defaults to -fno-common):
+
+/home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/arm-buildroot-linux-gnueabihf-ld:
+/home/giuliobenetti/autobuild/run/instance-3/output-1/build/xvisor-0.3.0/build/drivers/mmc/core/mmc.o:/home/giuliobenetti/autobuild/run/instance-3/output-1/build/xvisor-0.3.0/drivers/mmc/core/core.h:67:
+multiple definition of `sdio_func_type';
+/home/giuliobenetti/autobuild/run/instance-3/output-1/build/xvisor-0.3.0/build/drivers/mmc/core/core.o:/home/giuliobenetti/autobuild/run/instance-3/output-1/build/xvisor-0.3.0/drivers/mmc/core/core.h:67:
+first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/b6070c0721b33824e71833ce53423979980aa598
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/xvisor/xvisor/pull/125]
+---
+ drivers/mmc/core/core.h    |  2 +-
+ emulators/display/drawfn.h | 10 +++++-----
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
+index d75d135a..e2ca3141 100644
+--- a/drivers/mmc/core/core.h
++++ b/drivers/mmc/core/core.h
+@@ -64,7 +64,7 @@ int mmc_go_idle(struct mmc_host *host);
+  * Note: Must be called with host->lock held.
+  */
+ extern struct vmm_bus sdio_bus_type;
+-struct vmm_device_type sdio_func_type;
++extern struct vmm_device_type sdio_func_type;
+ 
+ int __sdio_attach(struct mmc_host *host);
+ 
+diff --git a/emulators/display/drawfn.h b/emulators/display/drawfn.h
+index f9163cff..385deaf6 100644
+--- a/emulators/display/drawfn.h
++++ b/emulators/display/drawfn.h
+@@ -69,14 +69,14 @@ typedef void (*drawfn)(struct vmm_surface *,
+ 				 DRAWFN_ORDER_MAX * \
+ 				 DRAWFN_FORMAT_MAX)
+ 
+-drawfn drawfn_surface_fntable_8[DRAWFN_FNTABLE_SIZE];
++extern drawfn drawfn_surface_fntable_8[DRAWFN_FNTABLE_SIZE];
+ 
+-drawfn drawfn_surface_fntable_15[DRAWFN_FNTABLE_SIZE];
++extern drawfn drawfn_surface_fntable_15[DRAWFN_FNTABLE_SIZE];
+ 
+-drawfn drawfn_surface_fntable_16[DRAWFN_FNTABLE_SIZE];
++extern drawfn drawfn_surface_fntable_16[DRAWFN_FNTABLE_SIZE];
+ 
+-drawfn drawfn_surface_fntable_24[DRAWFN_FNTABLE_SIZE];
++extern drawfn drawfn_surface_fntable_24[DRAWFN_FNTABLE_SIZE];
+ 
+-drawfn drawfn_surface_fntable_32[DRAWFN_FNTABLE_SIZE];
++extern drawfn drawfn_surface_fntable_32[DRAWFN_FNTABLE_SIZE];
+ 
+ #endif
+-- 
+2.28.0
+
