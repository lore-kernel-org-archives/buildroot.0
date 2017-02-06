From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 14:03:55 +0100
Subject: [Buildroot] [git commit] configs/odroidc2: update boot.ini to
	5ce6bcc6d8048ba5ff351516b751d52f5cda6981
Message-ID: <20170206130440.0EF2981E9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e715914a38670af52648612ed3ee478f69a879cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

changes:
 - add multicam support
 - add the new options
 - organization and add uhs and card remove controls
 - clarify hdmi/dvi/vga selection

Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/hardkernel/odroidc2/boot.ini | 152 +++++++++++++++++++++++++++++++++----
 1 file changed, 139 insertions(+), 13 deletions(-)

diff --git a/board/hardkernel/odroidc2/boot.ini b/board/hardkernel/odroidc2/boot.ini
index 203a42a..2fdffa3 100644
--- a/board/hardkernel/odroidc2/boot.ini
+++ b/board/hardkernel/odroidc2/boot.ini
@@ -1,42 +1,169 @@
 ODROIDC2-UBOOT-CONFIG
 
-# HDMI mode
+########################################################################
+# Changes made to this are overwritten every time there's a new upgrade
+# To make your changes permanent change it on 
+# boot.ini.default
+# After changing it on boot.ini.default run the bootini command to
+# rewrite this file with your personal permanent settings.
+# Documentation: http://odroid.com/dokuwiki/doku.php?id=en:c2_persistent_bootini
+########################################################################
+
+# Possible screen resolutions
+# Uncomment only a single Line! The line with setenv written.
+# At least one mode must be selected.
+
+# Custom modeline!
+# To use custom modeline you need to disable all the below resolutions
+# and setup your own! 
+# For more information check our wiki: 
+# http://odroid.com/dokuwiki/doku.php?id=en:c2_hdmi_autosetting
+# Example below:
+# setenv m "custombuilt" 
+# setenv modeline "1920,1200,154000,74040,60,1920,1968,2000,2080,1200,1202,1208,1235,1,0,1"
+
+# 480 Lines (720x480)
+# setenv m "480i60hz" # Interlaced 60Hz
+# setenv m "480i_rpt" # Interlaced for Rear Projection Televisions 60Hz
+# setenv m "480p60hz" # 480 Progressive 60Hz
+# setenv m "480p_rpt" # 480 Progressive for Rear Projection Televisions 60Hz
+
+# 576 Lines (720x576)
+# setenv m "576i50hz" # Interlaced 50Hz
+# setenv m "576i_rpt" # Interlaced for Rear Projection Televisions 50Hz
+# setenv m "576p50hz" # Progressive 50Hz
+# setenv m "576p_rpt" # Progressive for Rear Projection Televisions 50Hz
+
+# 720 Lines (1280x720)
+# setenv m "720p50hz" # 50Hz
+# setenv m "720p60hz" # 60Hz
+
+# 1080 Lines (1920x1080)
+# setenv m "1080i60hz" # Interlaced 60Hz
 setenv m "1080p60hz" # Progressive 60Hz
+# setenv m "1080i50hz" # Interlaced 50Hz
+# setenv m "1080p50hz" # Progressive 50Hz
+# setenv m "1080p24hz" # Progressive 24Hz
+
+# 4K (3840x2160)
+# setenv m "2160p30hz"    # Progressive 30Hz
+# setenv m "2160p25hz"    # Progressive 25Hz
+# setenv m "2160p24hz"    # Progressive 24Hz
+# setenv m "smpte24hz"    # Progressive 24Hz SMPTE
+# setenv m "2160p50hz"    # Progressive 50Hz
+# setenv m "2160p60hz"    # Progressive 60Hz
+# setenv m "2160p50hz420" # Progressive 50Hz with YCbCr 4:2:0 (Requires TV/Monitor that supports it)
+# setenv m "2160p60hz420" # Progressive 60Hz with YCbCr 4:2:0 (Requires TV/Monitor that supports it)
+
+### VESA modes ###
+# setenv m "640x480p60hz"
+# setenv m "800x480p60hz"
+# setenv m "480x800p60hz"
+# setenv m "800x600p60hz"
+# setenv m "1024x600p60hz"
+# setenv m "1024x768p60hz"  
+# setenv m "1280x800p60hz"
+# setenv m "1280x1024p60hz"
+# setenv m "1360x768p60hz"
+# setenv m "1440x900p60hz"
+# setenv m "1600x900p60hz"
+# setenv m "1680x1050p60hz"
+# setenv m "1600x1200p60hz"
+# setenv m "1920x1200p60hz"
+# setenv m "2560x1080p60hz"
+# setenv m "2560x1440p60hz"
+# setenv m "2560x1600p60hz"
+# setenv m "3440x1440p60hz"
 
 # HDMI BPP Mode
 setenv m_bpp "32"
+# setenv m_bpp "24"
+# setenv m_bpp "16"
+
+# HDMI DVI/VGA modes
+# By default its set to HDMI, if needed change below.
+# Uncomment only a single Line.
+# setenv vout "dvi"
+# setenv vout "vga"
 
 # HDMI HotPlug Detection control
 # Allows you to force HDMI thinking that the cable is connected.
 # true = HDMI will believe that cable is always connected
 # false = will let board/monitor negotiate the connection status
 setenv hpd "true"
+# setenv hpd "false"
 
-# Default Console Device Setting
-setenv condev "console=ttyS0,115200n8 console=tty0"   # on both
+# Monitor output
+# Controls if HDMI PHY should output anything to the monitor
+setenv monitor_onoff "false" # true or false
+
+# Server Mode (aka. No Graphics)
+# Setting nographics to 1 will disable all video subsystem
+# This mode is ideal of server type usage. (Saves ~300Mb of RAM)
+setenv nographics "0"
 
 # Meson Timer
 # 1 - Meson Timer
-# 0 - Arch Timer
-# Using meson_timer improves the video playback whoever it breaks KVM (virtualization).
+# 0 - Arch Timer 
+# Using meson_timer improves the video playback however it breaks KVM (virtualization).
 # Using arch timer allows KVM/Virtualization to work however you'll experience poor video
 setenv mesontimer "1"
 
-# Server Mode (aka. No Graphics)
-# Setting nographics to 1 will disable all video subsystem
-# This mode is ideal of server type usage. (Saves ~300Mb of RAM)
-setenv nographics "0"
+# UHS (Ultra High Speed) MicroSD mode enable/disable
+setenv disableuhs "false"
+
+# MicroSD Card Detection enable/disable
+# Force the MMC controlled to believe that a card is connected.
+setenv mmc_removable "true"
+
+# USB Multi WebCam tweak
+# Only enable this if you use it.
+setenv usbmulticam "false"
+
+# Default Console Device Setting
+setenv condev "console=ttyS0,115200n8 console=tty0"   # on both
+
+# CPU Frequency / Cores control
+###########################################
+### WARNING!!! WARNING!!! WARNING!!!
+# Before changing anything here please read the wiki entry: 
+# http://odroid.com/dokuwiki/doku.php?id=en:c2_set_cpu_freq
+#
+# MAX CPU's
+# setenv maxcpus "1"
+# setenv maxcpus "2"
+# setenv maxcpus "3"
+setenv maxcpus "4"
+
+# MAX Frequency
+# setenv max_freq "2016"  # 2.016GHz
+# setenv max_freq "1944"  # 1.944GHz
+# setenv max_freq "1944"  # 1.944GHz
+# setenv max_freq "1920"  # 1.920GHz
+# setenv max_freq "1896"  # 1.896GHz
+# setenv max_freq "1752"  # 1.752GHz
+# setenv max_freq "1680"  # 1.680GHz
+# setenv max_freq "1656"  # 1.656GHz
+setenv max_freq "1536"  # 1.536GHz
+
+
 
 ###########################################
 
 # Boot Arguments
-setenv bootargs "root=/dev/mmcblk0p2 rootwait ro ${condev} no_console_suspend hdmimode=${m} m_bpp=${m_bpp} vout=${vout} fsck.repair=yes net.ifnames=0 elevator=noop disablehpd=${hpd}"
+if test "${m}" = "custombuilt"; then setenv cmode "modeline=${modeline}"; fi
+
+setenv bootargs "root=/dev/mmcblk0p2 rootwait ro ${condev} no_console_suspend hdmimode=${m} ${cmode} m_bpp=${m_bpp} vout=${vout} fsck.repair=yes net.ifnames=0 elevator=noop disablehpd=${hpd} max_freq=${max_freq} maxcpus=${maxcpus} monitor_onoff=${monitor_onoff} disableuhs=${disableuhs} mmc_removable=${mmc_removable} usbmulticam=${usbmulticam}"
+
+# Booting
 
-# Load Images
 setenv loadaddr "0x11000000"
-setenv dtb_loadaddr "0x10000000"
+setenv dtb_loadaddr "0x1000000"
+setenv initrd_loadaddr "0x13000000"
+
 fatload mmc 0:1 ${loadaddr} Image
 fatload mmc 0:1 ${dtb_loadaddr} meson64_odroidc2.dtb
+fdt addr ${dtb_loadaddr}
 
 if test "${mesontimer}" = "0"; then fdt rm /meson_timer; fdt rm /cpus/cpu at 0/timer; fdt rm /cpus/cpu at 1/timer; fdt rm /cpus/cpu at 2/timer; fdt rm /cpus/cpu at 3/timer; fi
 if test "${mesontimer}" = "1"; then fdt rm /timer; fi
@@ -46,5 +173,4 @@ if test "${nographics}" = "1"; then fdt rm /meson-fb; fdt rm /amhdmitx; fdt rm /
 if test "${nographics}" = "1"; then fdt rm /meson-vout; fdt rm /mesonstream; fdt rm /meson-fb; fi
 if test "${nographics}" = "1"; then fdt rm /deinterlace; fdt rm /codec_mm; fi
 
-# Booting
 booti ${loadaddr} - ${dtb_loadaddr}
