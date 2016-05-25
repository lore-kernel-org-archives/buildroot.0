From: Dagg <daggs@gmx.com>
Date: Wed, 25 May 2016 20:46:32 +0300
Subject: [Buildroot] [PATCH v2 3/3] - allow building of odroid mali GL libs
	when using defconfig. - add S50display which sets the odroid
	mali fb.
In-Reply-To: <20160525174632.7086-1-daggs@gmx.com>
References: <20160525174632.7086-1-daggs@gmx.com>
Message-ID: <20160525174632.7086-3-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 .../odroidc2/fs-overlay/etc/init.d/S50display      | 103 +++++++++++++++++++++
 configs/odroidc2_defconfig                         |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 board/hardkernel/odroidc2/fs-overlay/etc/init.d/S50display

diff --git a/board/hardkernel/odroidc2/fs-overlay/etc/init.d/S50display b/board/hardkernel/odroidc2/fs-overlay/etc/init.d/S50display
new file mode 100644
index 0000000..68f8c6c
--- /dev/null
+++ b/board/hardkernel/odroidc2/fs-overlay/etc/init.d/S50display
@@ -0,0 +1,103 @@
+#!/bin/sh
+
+export mode=`cat /proc/cmdline | sed -rn 's/.+(hdmimode=)(\S+)\s.+/\2/p'`
+export bpp=`cat /proc/cmdline | sed -rn 's/.+(m_bpp=)(\S+)\s.+/\2/p'`
+
+common_display_setup() {
+	M="0 0 $(($X - 1)) $(($Y - 1))"
+	Y_VIRT=$(($Y * 2))
+	fbset -fb /dev/fb0 -g $X $Y $X $Y_VIRT $bpp
+	fbset -fb /dev/fb1 -g 32 32 32 32 32
+	echo $mode > /sys/class/display/mode
+	echo 0 > /sys/class/graphics/fb0/free_scale
+	echo 1 > /sys/class/graphics/fb0/freescale_mode
+	echo $M > /sys/class/graphics/fb0/free_scale_axis
+	echo $M > /sys/class/graphics/fb0/window_axis
+	echo 0 > /sys/class/graphics/fb1/free_scale
+}
+
+case $mode in
+	480*) 
+		export X=720 
+		export Y=480 
+		;;
+	576*)
+		export X=720
+		export Y=576
+		;;
+	720p*)
+		export X=1280
+		export Y=720
+		;;
+	1080*)
+		export X=1920
+		export Y=1080
+		;;
+	2160p*)
+		export X=3840
+		export Y=2160
+		;;
+	smpte24hz*)
+		export X=3840
+		export Y=2160
+		;;
+	640x480p60hz*)
+		export X=640
+		export Y=480
+		;;
+	800x480p60hz*)
+		export X=800
+		export Y=480
+		;;
+	800x600p60hz*)
+		export X=800
+		export Y=600
+		;;
+	1024x600p60hz*)
+		export X=1024
+		export Y=600
+		;;
+	1024x768p60hz*)
+		export X=1024
+		export Y=768
+		;;
+	1280x800p60hz*)
+		export X=1280
+		export Y=800
+		;;
+	1280x1024p60hz*)
+		export X=1280
+		export Y=1024
+		;;
+	1360x768p60hz*)
+		export X=1360
+		export Y=768
+		;;
+	1366x768p60hz*)
+		export X=1366
+		export Y=768
+		;;
+	1440x900p60hz*)
+		export X=1440
+		export Y=900
+		;;
+	1600x900p60hz*)
+		export X=1600
+		export Y=900
+		;;
+	1680x1050p60hz*)
+		export X=1680
+		export Y=1050
+		;;
+	1920x1200p60hz*)
+		export X=1920
+		export Y=1200
+		;;
+esac
+
+common_display_setup
+
+echo 0 > /sys/class/graphics/fb0/blank
+echo 0 > /sys/class/graphics/fb1/blank
+
+exit $?
diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index 1945983..590d54c 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -6,6 +6,7 @@ BR2_TARGET_GENERIC_HOSTNAME="odroidc2"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/hardkernel/odroidc2/post-image.sh"
+BR2_ROOTFS_OVERLAY="board/hardkernel/odroidc2/fs-overlay"
 
 # Kernel
 BR2_KERNEL_HEADERS_VERSION=y
-- 
2.8.3
