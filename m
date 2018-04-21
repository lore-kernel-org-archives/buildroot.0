From: Aleksey Kislitsa <aleksey.kislitsa@gmail.com>
Date: Sat, 21 Apr 2018 15:19:00 +0300
Subject: [Buildroot] [PATCH 1/1] Has been added configs for OrangePI-2G-IOT
Message-ID: <20180421121900.16492-1-aleksey.kislitsa@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Aleksey Kislitsa <aleksey.kislitsa@gmail.com>
---
 .gitignore                                         |   2 +
 board/orangepi/orangepi-2g-iot/boot.cmd            |  18 +++
 board/orangepi/orangepi-2g-iot/genimage.cfg        |  36 +++++
 .../linux/0002-linux-add-support-for-gcc6.patch    |  82 +++++++++++
 .../linux/0003-linux-use-static-inline.patch       |  38 +++++
 ...ux-removed-defined-but-not-used-functions.patch | 153 +++++++++++++++++++++
 .../u-boot/0001-orangepi2giot-fatload.patch        |  22 +++
 board/orangepi/orangepi-2g-iot/post-build.sh       |  15 ++
 board/orangepi/orangepi-2g-iot/post-image.sh       |  14 ++
 board/orangepi/orangepi-2g-iot/readme.txt          |  29 ++++
 configs/orangepi_2g-iot_defconfig                  |  44 ++++++
 11 files changed, 453 insertions(+)
 create mode 100644 board/orangepi/orangepi-2g-iot/boot.cmd
 create mode 100644 board/orangepi/orangepi-2g-iot/genimage.cfg
 create mode 100644 board/orangepi/orangepi-2g-iot/patches/linux/0002-linux-add-support-for-gcc6.patch
 create mode 100644 board/orangepi/orangepi-2g-iot/patches/linux/0003-linux-use-static-inline.patch
 create mode 100644 board/orangepi/orangepi-2g-iot/patches/linux/0004-linux-removed-defined-but-not-used-functions.patch
 create mode 100644 board/orangepi/orangepi-2g-iot/patches/u-boot/0001-orangepi2giot-fatload.patch
 create mode 100755 board/orangepi/orangepi-2g-iot/post-build.sh
 create mode 100755 board/orangepi/orangepi-2g-iot/post-image.sh
 create mode 100644 board/orangepi/orangepi-2g-iot/readme.txt
 create mode 100644 configs/orangepi_2g-iot_defconfig

diff --git a/.gitignore b/.gitignore
index bb02d9f572..5484c84449 100644
--- a/.gitignore
+++ b/.gitignore
@@ -13,3 +13,5 @@
 *.rej
 *~
 *.pyc
+/build-*
+/outgoing
diff --git a/board/orangepi/orangepi-2g-iot/boot.cmd b/board/orangepi/orangepi-2g-iot/boot.cmd
new file mode 100644
index 0000000000..2951de6f00
--- /dev/null
+++ b/board/orangepi/orangepi-2g-iot/boot.cmd
@@ -0,0 +1,18 @@
+if test "${boot_device}" = "mmc"; then
+
+	setenv rootdev "/dev/mmcblk0p2"
+	setenv rootfstype "ext4"
+
+	setenv bootargs "root=${rootdev} rootwait rootfstype=${rootfstype} console=ttyS0,921600 kgdboc=ttyS0,921600 panic=10 consoleblank=0 earlyprintk"
+
+	fatload mmc 0:1 ${kernel_addr} zImage
+	fatload mmc 0:1 ${modem_addr} modem.bin
+else
+	echo "NAND boot is not implemented yet"
+fi
+
+# modem init is mandatory according to u-boot sources
+mdcom_loadm ${modem_addr}
+mdcom_check 1
+
+bootz ${kernel_addr}
diff --git a/board/orangepi/orangepi-2g-iot/genimage.cfg b/board/orangepi/orangepi-2g-iot/genimage.cfg
new file mode 100644
index 0000000000..aca758633a
--- /dev/null
+++ b/board/orangepi/orangepi-2g-iot/genimage.cfg
@@ -0,0 +1,36 @@
+# Minimal SD card image for the OrangePi Zero
+#
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"modem.bin",
+			"boot.scr"
+		}
+	}
+	size = 64M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot.rda"
+		offset = 131072
+		size = 1966080 # 2MB - 131072
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/board/orangepi/orangepi-2g-iot/patches/linux/0002-linux-add-support-for-gcc6.patch b/board/orangepi/orangepi-2g-iot/patches/linux/0002-linux-add-support-for-gcc6.patch
new file mode 100644
index 0000000000..f674211c62
--- /dev/null
+++ b/board/orangepi/orangepi-2g-iot/patches/linux/0002-linux-add-support-for-gcc6.patch
@@ -0,0 +1,82 @@
+From 8ae7d1e028c8adb1db187d1940d31fc7aebae15e Mon Sep 17 00:00:00 2001
+From: Leo Soares <leojrfs@gmail.com>
+Date: Tue, 13 Jun 2017 17:20:24 +0100
+Subject: [PATCH] add support for GCC 6
+
+---
+ include/linux/compiler-gcc6.h | 66 +++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 66 insertions(+)
+ create mode 100644 include/linux/compiler-gcc6.h
+
+diff --git a/include/linux/compiler-gcc6.h b/include/linux/compiler-gcc6.h
+new file mode 100644
+index 000000000000..a3d00d8d3166
+--- /dev/null
++++ b/include/linux/compiler-gcc6.h
+@@ -0,0 +1,66 @@
++#ifndef __LINUX_COMPILER_H
++#error "Please don't include <linux/compiler-gcc6.h> directly, include <linux/compiler.h> instead."
++#endif
++
++#define __used				__attribute__((__used__))
++#define __must_check			__attribute__((warn_unused_result))
++#define __compiler_offsetof(a, b)	__builtin_offsetof(a, b)
++
++/* Mark functions as cold. gcc will assume any path leading to a call
++   to them will be unlikely.  This means a lot of manual unlikely()s
++   are unnecessary now for any paths leading to the usual suspects
++   like BUG(), printk(), panic() etc. [but let's keep them for now for
++   older compilers]
++
++   Early snapshots of gcc 4.3 don't support this and we can't detect this
++   in the preprocessor, but we can live with this because they're unreleased.
++   Maketime probing would be overkill here.
++
++   gcc also has a __attribute__((__hot__)) to move hot functions into
++   a special section, but I don't see any sense in this right now in
++   the kernel context */
++#define __cold			__attribute__((__cold__))
++
++#define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
++
++#ifndef __CHECKER__
++# define __compiletime_warning(message) __attribute__((warning(message)))
++# define __compiletime_error(message) __attribute__((error(message)))
++#endif /* __CHECKER__ */
++
++/*
++ * Mark a position in code as unreachable.  This can be used to
++ * suppress control flow warnings after asm blocks that transfer
++ * control elsewhere.
++ *
++ * Early snapshots of gcc 4.5 don't support this and we can't detect
++ * this in the preprocessor, but we can live with this because they're
++ * unreleased.  Really, we need to have autoconf for the kernel.
++ */
++#define unreachable() __builtin_unreachable()
++
++/* Mark a function definition as prohibited from being cloned. */
++#define __noclone	__attribute__((__noclone__))
++
++/*
++ * Tell the optimizer that something else uses this function or variable.
++ */
++#define __visible __attribute__((externally_visible))
++
++/*
++ * GCC 'asm goto' miscompiles certain code sequences:
++ *
++ *   http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58670
++ *
++ * Work it around via a compiler barrier quirk suggested by Jakub Jelinek.
++ * Fixed in GCC 4.8.2 and later versions.
++ *
++ * (asm goto is automatically volatile - the naming reflects this.)
++ */
++#define asm_volatile_goto(x...)	do { asm goto(x); asm (""); } while (0)
++
++#ifdef CONFIG_ARCH_USE_BUILTIN_BSWAP
++#define __HAVE_BUILTIN_BSWAP32__
++#define __HAVE_BUILTIN_BSWAP64__
++#define __HAVE_BUILTIN_BSWAP16__
++#endif /* CONFIG_ARCH_USE_BUILTIN_BSWAP */
diff --git a/board/orangepi/orangepi-2g-iot/patches/linux/0003-linux-use-static-inline.patch b/board/orangepi/orangepi-2g-iot/patches/linux/0003-linux-use-static-inline.patch
new file mode 100644
index 0000000000..5ce20dd208
--- /dev/null
+++ b/board/orangepi/orangepi-2g-iot/patches/linux/0003-linux-use-static-inline.patch
@@ -0,0 +1,38 @@
+From f1b378aa83ee4f8198b45b6ce9de28a378164f2b Mon Sep 17 00:00:00 2001
+From: Leo Soares <leojrfs@gmail.com>
+Date: Tue, 13 Jun 2017 17:33:49 +0100
+Subject: [PATCH] use static inline
+
+---
+ arch/arm/include/asm/ftrace.h    | 2 +-
+ arch/arm/kernel/return_address.c | 4 ----
+ 2 files changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/arch/arm/include/asm/ftrace.h b/arch/arm/include/asm/ftrace.h
+index f89515adac60..2bb8cac28b9e 100644
+--- a/arch/arm/include/asm/ftrace.h
++++ b/arch/arm/include/asm/ftrace.h
+@@ -45,7 +45,7 @@ void *return_address(unsigned int);
+ 
+ #else
+ 
+-extern inline void *return_address(unsigned int level)
++static inline void *return_address(unsigned int level)
+ {
+ 	return NULL;
+ }
+diff --git a/arch/arm/kernel/return_address.c b/arch/arm/kernel/return_address.c
+index fafedd86885d..f703548758d9 100644
+--- a/arch/arm/kernel/return_address.c
++++ b/arch/arm/kernel/return_address.c
+@@ -63,10 +63,6 @@ void *return_address(unsigned int level)
+ #warning "TODO: return_address should use unwind tables"
+ #endif
+ 
+-void *return_address(unsigned int level)
+-{
+-	return NULL;
+-}
+ 
+ #endif /* if defined(CONFIG_FRAME_POINTER) && !defined(CONFIG_ARM_UNWIND) / else */
+ 
diff --git a/board/orangepi/orangepi-2g-iot/patches/linux/0004-linux-removed-defined-but-not-used-functions.patch b/board/orangepi/orangepi-2g-iot/patches/linux/0004-linux-removed-defined-but-not-used-functions.patch
new file mode 100644
index 0000000000..6eb80c292e
--- /dev/null
+++ b/board/orangepi/orangepi-2g-iot/patches/linux/0004-linux-removed-defined-but-not-used-functions.patch
@@ -0,0 +1,153 @@
+From a472528ea3cbbbde14baf62d43c43fde96ab1914 Mon Sep 17 00:00:00 2001
+From: Leo Soares <leojrfs@gmail.com>
+Date: Wed, 14 Jun 2017 20:22:54 +0100
+Subject: [PATCH] removed defined but not used functions
+
+---
+ .../rdaw80211/rdacombodev/rda_5991e_power_ctrl.c         | 14 --------------
+ .../rdaw80211/rdacombodev/rda_5991f_power_ctrl.c         | 15 ---------------
+ .../rdaw80211/rdacombodev/rda_5991g_power_ctrl.c         | 16 ----------------
+ drivers/net/wireless/rdaw80211/rdawlan/wland_fwsmgr.c    | 12 ------------
+ 4 files changed, 57 deletions(-)
+
+diff --git a/drivers/net/wireless/rdaw80211/rdacombodev/rda_5991e_power_ctrl.c b/drivers/net/wireless/rdaw80211/rdacombodev/rda_5991e_power_ctrl.c
+index e528388e9e73..fd9168050fea 100644
+--- a/drivers/net/wireless/rdaw80211/rdacombodev/rda_5991e_power_ctrl.c
++++ b/drivers/net/wireless/rdaw80211/rdacombodev/rda_5991e_power_ctrl.c
+@@ -102,10 +102,6 @@ static const u16 wf_rf_setting_5991e[][2] = {
+ };
+ #endif
+ 
+-static const u16 wf_agc_setting_for_dccal_5991e[][2] = {
+-
+-};
+-
+ static const u16 wf_agc_setting_5991e[][2] = {
+ 	{0x3F,  0x0000},
+ #ifdef CHINA_VERSION
+@@ -269,15 +265,6 @@ static const u16 rda_5991e_bt_no_force_swtrx[][2] =
+ };
+ // add for pta
+ 
+-
+-
+-static const u16  bt_dc_cal_5991e[][2] = {
+-	{0x3F,  0x0000},
+-	{0x30,  0x0140},
+-	{0x30,  0x0141},
+-	 DELAY_MS(50)
+-};
+-
+ #endif
+ 
+ static int check_wifi_power_on(void)
+@@ -844,4 +831,3 @@ int rda_5991e_fm_power_off(void)
+ 	printk(KERN_INFO "***rda_fm_power_off failed! \n");
+ 	return -1;
+ }
+-
+diff --git a/drivers/net/wireless/rdaw80211/rdacombodev/rda_5991f_power_ctrl.c b/drivers/net/wireless/rdaw80211/rdacombodev/rda_5991f_power_ctrl.c
+index 3f7be4c3e421..60e456c5eae8 100644
+--- a/drivers/net/wireless/rdaw80211/rdacombodev/rda_5991f_power_ctrl.c
++++ b/drivers/net/wireless/rdaw80211/rdacombodev/rda_5991f_power_ctrl.c
+@@ -105,10 +105,6 @@ static const u16 wf_rf_setting_5991f[][2] = {
+ };
+ #endif
+ 
+-static const u16 wf_agc_setting_for_dccal_5991f[][2] = {
+-
+-};
+-
+ static const u16 wf_agc_setting_5991f[][2] = {
+ 	{0x3F,  0x0000},
+ 	{0x0F,	0x01F7},//lower max gain
+@@ -248,16 +244,6 @@ static const u16 rda_5991f_bt_no_force_swtrx[][2] =
+ #endif
+ 	{0x3f, 0x0000 },
+ };
+-// add for pta
+-
+-
+-
+-static const u16  bt_dc_cal_5991f[][2] = {
+-	{0x3F,  0x0000},
+-	{0x30,  0x0140},
+-	{0x30,  0x0141},
+-	 DELAY_MS(50)
+-};
+ #endif
+ 
+ static int check_wifi_power_on(void)
+@@ -808,4 +794,3 @@ int rda_5991f_fm_power_off(void)
+ 	printk(KERN_INFO "***rda_fm_power_off failed! \n");
+ 	return -1;
+ }
+-
+diff --git a/drivers/net/wireless/rdaw80211/rdacombodev/rda_5991g_power_ctrl.c b/drivers/net/wireless/rdaw80211/rdacombodev/rda_5991g_power_ctrl.c
+index 26c8eda29e99..b977d6ce1f0f 100644
+--- a/drivers/net/wireless/rdaw80211/rdacombodev/rda_5991g_power_ctrl.c
++++ b/drivers/net/wireless/rdaw80211/rdacombodev/rda_5991g_power_ctrl.c
+@@ -150,10 +150,6 @@ static const u16 wf_rf_setting_5991g[][2] = {
+ };
+ #endif
+ 
+-static const u16 wf_agc_setting_for_dccal_5991g[][2] = {
+-
+-};
+-
+ static const u16 wf_agc_setting_5991g[][2] = {
+ 	{0x3F,  0x0000},
+ #ifdef G_CHINA_VERSION
+@@ -307,7 +303,6 @@ static const u16 rda_5991g_bt_force_swtrx[][2] =
+ #endif
+ 	{0x3f, 0x0000 },
+ };
+-// add for pta
+ 
+ // add for pta
+ static const u16 rda_5991g_bt_no_force_swtrx[][2] =
+@@ -320,16 +315,6 @@ static const u16 rda_5991g_bt_no_force_swtrx[][2] =
+ #endif
+ 	{0x3f, 0x0000 },
+ };
+-// add for pta
+-
+-
+-
+-static const u16  bt_dc_cal_5991g[][2] = {
+-	{0x3F,  0x0000},
+-	{0x30,  0x0140},
+-	{0x30,  0x0141},
+-	 DELAY_MS(50)
+-};
+ #endif
+ 
+ static int check_wifi_power_on(void)
+@@ -888,4 +873,3 @@ int rda_5991g_fm_power_off(void)
+ 	printk(KERN_INFO "***rda_fm_power_off failed! \n");
+ 	return -1;
+ }
+-
+diff --git a/drivers/net/wireless/rdaw80211/rdawlan/wland_fwsmgr.c b/drivers/net/wireless/rdaw80211/rdawlan/wland_fwsmgr.c
+index 703bc9aca234..f8a8de1f29b9 100644
+--- a/drivers/net/wireless/rdaw80211/rdawlan/wland_fwsmgr.c
++++ b/drivers/net/wireless/rdaw80211/rdawlan/wland_fwsmgr.c
+@@ -35,18 +35,6 @@
+ #include <wland_p2p.h>
+ #include <wland_cfg80211.h>
+ 
+-/** wland_fws_prio2fifo - mapping from 802.1d priority to firmware fifo index. */
+-static const int wland_fws_prio2fifo[] = {
+-	WLAND_FWS_FIFO_AC_BE,
+-	WLAND_FWS_FIFO_AC_BK,
+-	WLAND_FWS_FIFO_AC_BK,
+-	WLAND_FWS_FIFO_AC_BE,
+-	WLAND_FWS_FIFO_AC_VI,
+-	WLAND_FWS_FIFO_AC_VI,
+-	WLAND_FWS_FIFO_AC_VO,
+-	WLAND_FWS_FIFO_AC_VO
+-};
+-
+ #if 0
+ static u32 fws_hanger_get_free_slot(struct wland_fws_hanger *h)
+ {
diff --git a/board/orangepi/orangepi-2g-iot/patches/u-boot/0001-orangepi2giot-fatload.patch b/board/orangepi/orangepi-2g-iot/patches/u-boot/0001-orangepi2giot-fatload.patch
new file mode 100644
index 0000000000..97ff1a0cc2
--- /dev/null
+++ b/board/orangepi/orangepi-2g-iot/patches/u-boot/0001-orangepi2giot-fatload.patch
@@ -0,0 +1,22 @@
+From 9a30659ed1c5056fa53843fbb4ef2e55694dd238 Mon Sep 17 00:00:00 2001
+From: Leo Soares <leojrfs@gmail.com>
+Date: Mon, 12 Jun 2017 21:57:22 +0100
+Subject: [PATCH] load from the first fat partition instead of ext2
+
+---
+ include/configs/rda_config_defaults.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/configs/rda_config_defaults.h b/include/configs/rda_config_defaults.h
+index 84501bd..f670207 100644
+--- a/include/configs/rda_config_defaults.h
++++ b/include/configs/rda_config_defaults.h
+@@ -280,7 +280,7 @@
+ #define CONFIG_BOOTCOMMAND		\
+ 	"mux_config; "		\
+ 	"mmc dev 0; "		\
+-	"ext2load mmc 0:1 ${script_addr} boot.scr && source ${script_addr};" \
++	"fatload mmc 0:1 ${script_addr} boot.scr && source ${script_addr};" \
+ 	"echo Running boot script failed;"
+
+ #endif /* !CONFIG_SPL_BUILD */
diff --git a/board/orangepi/orangepi-2g-iot/post-build.sh b/board/orangepi/orangepi-2g-iot/post-build.sh
new file mode 100755
index 0000000000..cde8ad85a6
--- /dev/null
+++ b/board/orangepi/orangepi-2g-iot/post-build.sh
@@ -0,0 +1,15 @@
+#!/bin/sh
+# post-build.sh for OrangePi taken from CubieBoard's post-build.sh
+# 2013, Carlo Caione <carlo.caione@gmail.com>
+
+BOARD_DIR="$(dirname $0)"
+MKIMAGE=$HOST_DIR/usr/bin/mkimage
+BOOT_CMD=$BOARD_DIR/boot.cmd
+BOOT_CMD_H=$BINARIES_DIR/boot.scr
+
+git clone https://github.com/orangepi-xunlong/OrangePiRDA_external.git /tmp/OrangePiRDA_external
+cp /tmp/OrangePiRDA_external/bootarg/modem.bin $BINARIES_DIR
+rm -fR /tmp/OrangePiRDA_external
+
+# U-Boot script
+$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
diff --git a/board/orangepi/orangepi-2g-iot/post-image.sh b/board/orangepi/orangepi-2g-iot/post-image.sh
new file mode 100755
index 0000000000..359b4c9e7c
--- /dev/null
+++ b/board/orangepi/orangepi-2g-iot/post-image.sh
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                               \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
diff --git a/board/orangepi/orangepi-2g-iot/readme.txt b/board/orangepi/orangepi-2g-iot/readme.txt
new file mode 100644
index 0000000000..bd1cec44e2
--- /dev/null
+++ b/board/orangepi/orangepi-2g-iot/readme.txt
@@ -0,0 +1,29 @@
+Orange Pi 2G IOT
+
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Orange Pi 2G IOT. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make orangepi_2g-iot_defconfig
+
+Compile everything and build the SD card image:
+
+    $ make
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
diff --git a/configs/orangepi_2g-iot_defconfig b/configs/orangepi_2g-iot_defconfig
new file mode 100644
index 0000000000..e742fe7624
--- /dev/null
+++ b/configs/orangepi_2g-iot_defconfig
@@ -0,0 +1,44 @@
+BR2_arm=y
+BR2_cortex_a5=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_INSTRUCTIONS_THUMB2=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
+BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10=y
+BR2_TARGET_GENERIC_HOSTNAME="OrangePi_2G-IOT"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi 2G-IOT"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepi-2g-iot/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepi-2g-iot/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/orangepi-xunlong/OrangePiRDA_kernel.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="master"
+BR2_LINUX_KERNEL_PATCH="board/orangepi/orangepi-2g-iot/patches/linux"
+BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="rda8810-rel"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/orangepi-xunlong/OrangePiRDA_uboot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="master"
+BR2_TARGET_UBOOT_PATCH="board/orangepi/orangepi-2g-iot/patches/u-boot"
+BR2_TARGET_UBOOT_BOARDNAME="rda8810"
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.rda"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+
+# wireless support
+BR2_PACKAGE_IW=y
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WIRELESS_TOOLS_LIB=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
+BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
+
+# spi flash support
+BR2_PACKAGE_MTD=y
-- 
2.11.0
