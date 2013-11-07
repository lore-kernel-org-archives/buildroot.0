From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu,  7 Nov 2013 21:30:43 +0000
Subject: [Buildroot] [PATCH] avr32: disable kernel headers
Message-ID: <1383859843-3549-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Using kernel headers newer than 3.6.x, uclibc fails to build:

  In file included from output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/linux/rtnetlink.h:6,
                 from libc/inet/netlinkaccess.h:34,
                 from libc/inet/if_index.c:36:
  output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/linux/if_link.h:314: error: expected specifier-qualifier-list before '__be16'
  make[1]: *** [libc/inet/if_index.os] Error 1
  make[1]: Leaving directory `output/build/uclibc-0.9.31.1'
  make: *** [output/build/uclibc-0.9.31.1/.stamp_built] Error 2

Disable kernel headers newer than 3.6.x on avr32, and update atngw100 and
atstk100x defconfigs to use kernel headers that avoid the uclibc build
problem.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 configs/atngw100_defconfig           | 5 ++---
 configs/atstk100x_defconfig          | 4 ++--
 package/linux-headers/Config.in.host | 9 ++++++---
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 5490241..bcb0073 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -1,10 +1,9 @@
 # Architecture
 BR2_avr32=y
 
-# Lock down kernel headers version, to match the kernel version used
-# below.
+# Lock down kernel headers to a version for which uclibc will build.
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.9.11"
+BR2_DEFAULT_KERNEL_VERSION="3.4.68"
 
 # Filesystems
 BR2_TARGET_ROOTFS_JFFS2=y
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index f73497c..b35c9f4 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -1,9 +1,9 @@
 # Architecture
 BR2_avr32=y
 
-# Lock to same version as kernel
+# Lock down kernel headers to a version for which uclibc will build.
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.9.11"
+BR2_DEFAULT_KERNEL_VERSION="3.4.68"
 
 # U-Boot
 BR2_TARGET_UBOOT=y
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2bd8b02..e9690de 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -44,24 +44,27 @@ choice
 
 	config BR2_KERNEL_HEADERS_3_7
 		bool "Linux 3.7.x kernel headers"
-		depends on BR2_DEPRECATED && !BR2_arc
+		depends on BR2_DEPRECATED && !BR2_arc && !BR2_avr32
 
 	config BR2_KERNEL_HEADERS_3_8
 		bool "Linux 3.8.x kernel headers"
-		depends on BR2_DEPRECATED && !BR2_arc
+		depends on BR2_DEPRECATED && !BR2_arc && !BR2_avr32
 
 	config BR2_KERNEL_HEADERS_3_9
 		bool "Linux 3.9.x kernel headers"
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED && !BR2_avr32
 
 	config BR2_KERNEL_HEADERS_3_10
 		bool "Linux 3.10.x kernel headers"
+		depends on !BR2_avr32
 
 	config BR2_KERNEL_HEADERS_3_11
 		bool "Linux 3.11.x kernel headers"
+		depends on !BR2_avr32
 
 	config BR2_KERNEL_HEADERS_3_12
 		bool "Linux 3.12.x kernel headers"
+		depends on !BR2_avr32
 
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
-- 
1.8.3.2
