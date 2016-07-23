From: Dagg Stompler <daggs@gmx.com>
Date: Sat, 23 Jul 2016 21:55:01 +0300
Subject: [Buildroot] [PATCH 3/3] odroidc2: update boot.ini
In-Reply-To: <20160723185501.12148-1-daggs@gmx.com>
References: <20160723185501.12148-1-daggs@gmx.com>
Message-ID: <20160723185501.12148-3-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 board/hardkernel/odroidc2/boot.ini | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/board/hardkernel/odroidc2/boot.ini b/board/hardkernel/odroidc2/boot.ini
index 8b67b5e..ba90bb4 100644
--- a/board/hardkernel/odroidc2/boot.ini
+++ b/board/hardkernel/odroidc2/boot.ini
@@ -1,16 +1,36 @@
 ODROIDC2-UBOOT-CONFIG
 
 # HDMI mode
-setenv m "720p60hz" # Progressive 60Hz
+setenv m "1080p60hz" # Progressive 60Hz
 
 # HDMI BPP Mode
 setenv m_bpp "32"
 
+# HDMI HotPlug Detection control
+# Allows you to force HDMI thinking that the cable is connected.
+# true = HDMI will believe that cable is always connected
+# false = will let board/monitor negotiate the connection status
+setenv hpd "true"
+
 # Default Console Device Setting
 setenv condev "console=ttyS0,115200n8"	# Serial Console
 
+# Meson Timer
+# 1 - Meson Timer
+# 0 - Arch Timer 
+# Using meson_timer improves the video playback whoever it breaks KVM (virtualization).
+# Using arch timer allows KVM/Virtualization to work however you'll experience poor video
+setenv mesontimer "1"
+
+# Server Mode (aka. No Graphics)
+# Setting nographics to 1 will disable all video subsystem
+# This mode is ideal of server type usage. (Saves ~300Mb of RAM)
+setenv nographics "0"
+
+###########################################
+
 # Boot Arguments
-setenv bootargs "root=/dev/mmcblk0p2 rootwait ro ${condev} no_console_suspend hdmimode=${m} m_bpp=${m_bpp} vout=${vout} fsck.repair=yes net.ifnames=0 elevator=noop"
+setenv bootargs "root=/dev/mmcblk0p2 rootwait ro ${condev} no_console_suspend hdmimode=${m} m_bpp=${m_bpp} vout=${vout} fsck.repair=yes net.ifnames=0 elevator=noop =${hpd}"
 
 # Load Images
 setenv loadaddr "0x11000000"
@@ -18,5 +38,13 @@ setenv dtb_loadaddr "0x10000000"
 fatload mmc 0:1 ${loadaddr} Image
 fatload mmc 0:1 ${dtb_loadaddr} meson64_odroidc2.dtb
 
+if test "${mesontimer}" = "0"; then fdt rm /meson_timer; fdt rm /cpus/cpu at 0/timer; fdt rm /cpus/cpu at 1/timer; fdt rm /cpus/cpu at 2/timer; fdt rm /cpus/cpu at 3/timer; fi
+if test "${mesontimer}" = "1"; then fdt rm /timer; fi
+
+if test "${nographics}" = "1"; then fdt rm /reserved-memory; fdt rm /aocec; fi
+if test "${nographics}" = "1"; then fdt rm /meson-fb; fdt rm /amhdmitx; fdt rm /picdec; fdt rm /ppmgr; fi
+if test "${nographics}" = "1"; then fdt rm /meson-vout; fdt rm /mesonstream; fdt rm /meson-fb; fi
+if test "${nographics}" = "1"; then fdt rm /deinterlace; fdt rm /codec_mm; fi
+
 # Booting
 booti ${loadaddr} - ${dtb_loadaddr}
-- 
2.9.2
