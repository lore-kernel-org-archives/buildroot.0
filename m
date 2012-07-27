From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 27 Jul 2012 12:45:06 +0100
Subject: [Buildroot] [PATCH] at91bootstrap3: new package
Message-ID: <1343389506-7469-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 boot/Config.in                                     |    1 +
 boot/at91bootstrap3/Config.in                      |   52 ++
 .../at91bootstrap3-u-boot-relocation-fix.patch     |  746 ++++++++++++++++++++
 boot/at91bootstrap3/at91bootstrap3.mk              |   67 ++
 4 files changed, 866 insertions(+)
 create mode 100644 boot/at91bootstrap3/Config.in
 create mode 100644 boot/at91bootstrap3/at91bootstrap3-u-boot-relocation-fix.patch
 create mode 100644 boot/at91bootstrap3/at91bootstrap3.mk

diff --git a/boot/Config.in b/boot/Config.in
index 5252a49..a55139b 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -1,6 +1,7 @@
 menu "Bootloaders"
 
 source "boot/at91bootstrap/Config.in"
+source "boot/at91bootstrap3/Config.in"
 source "boot/at91dataflashboot/Config.in"
 source "boot/barebox/Config.in"
 source "boot/grub/Config.in"
diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
new file mode 100644
index 0000000..bbcb160
--- /dev/null
+++ b/boot/at91bootstrap3/Config.in
@@ -0,0 +1,52 @@
+config BR2_TARGET_AT91BOOTSTRAP3
+	depends on BR2_arm926t
+	bool "AT91 Bootstrap 3"
+	help
+	  AT91Bootstrap is a first level bootloader for the Atmel AT91
+	  devices. It integrates algorithms for:
+	  - Device initialization such as clock configuration, PIO settings...
+	  - Peripheral drivers such as PIO, PMC or SDRAMC...
+	  - Physical media algorithm such as DataFlash, NandFlash, NOR Flash...
+
+if BR2_TARGET_AT91BOOTSTRAP3
+
+config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR
+	string "custom patch dir"
+	help
+	  If your board requires custom patches, add the path to the
+	  directory containing the patches here. The patches must be
+	  named at91bootstrap3-<something>.patch.
+
+	  Most users may leave this empty
+
+#
+# Configuration selection
+#
+
+choice
+	prompt "AT91 Bootstrap 3 configuration"
+	default BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG
+
+config BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG
+	bool "Using a defconfig"
+
+config BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG
+	bool "Using a custom config file"
+
+endchoice
+
+config BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG
+	string "Defconfig name"
+	depends on BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG
+	help
+	 Name of the at91bootstrap3 defconfig file to use, without the
+	 trailing _defconfig.  The defconfig is located in
+	 board/<board> in the at91bootstrap3 tree.
+
+config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE
+	string "Configuration file path"
+	depends on BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG
+	help
+	  Path to the at91bootstrap3 configuration file
+
+endif # BR2_TARGET_AT91BOOTSTRAP3
diff --git a/boot/at91bootstrap3/at91bootstrap3-u-boot-relocation-fix.patch b/boot/at91bootstrap3/at91bootstrap3-u-boot-relocation-fix.patch
new file mode 100644
index 0000000..0139959
--- /dev/null
+++ b/boot/at91bootstrap3/at91bootstrap3-u-boot-relocation-fix.patch
@@ -0,0 +1,746 @@
+Every AT91SAM plaforms were broken between 2010.12 and 2011.03 because
+of the relocation changes.
+
+We have to get JUMP_ADDR consistant with what is used by u-boot
+(CONFIG_SYS_TEXT_BASE).
+
+I also chose to "repartition" the dataflash. u-boot is now living at
+0x4000, letting 16kB for the bootstrap. We also have to increase the
+IMG_SIZE as u-boot as grown larger than the default value.
+As requested on the u-boot ML, we assume that it could be up to 512kB
+big.
+
+It means that now, you have to flash your kernel at 0x0008C000 instead
+of 0x00042000. And so you also have to load it from that address from
+u-boot.
+
+Then, remember that you could decrease IMG_SIZE to boot faster.
+
+Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+diff -Nurp a/board/afeb9260/afeb9260_defconfig b/board/afeb9260/afeb9260_defconfig
+--- a/board/afeb9260/afeb9260_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/afeb9260/afeb9260_defconfig	2012-07-25 20:52:17.967694276 +0100
+@@ -97,9 +97,9 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_ADDRESS="0x00004000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_APP_CHECK=y
+ # CONFIG_LONG_TEST is not set
+ # CONFIG_DEBUG is not set
+diff -Nurp a/board/at91cap9adk/at91cap9adk_defconfig b/board/at91cap9adk/at91cap9adk_defconfig
+--- a/board/at91cap9adk/at91cap9adk_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91cap9adk/at91cap9adk_defconfig	2012-07-25 20:52:30.603693814 +0100
+@@ -96,8 +96,8 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_ADDRESS="0x00004000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_APP_CHECK=y
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91cap9adk/at91cap9df_defconfig b/board/at91cap9adk/at91cap9df_defconfig
+--- a/board/at91cap9adk/at91cap9df_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91cap9adk/at91cap9df_defconfig	2012-07-25 20:52:23.807694041 +0100
+@@ -96,8 +96,8 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_ADDRESS="0x00004000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_APP_CHECK=y
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91cap9adk/at91cap9f_defconfig b/board/at91cap9adk/at91cap9f_defconfig
+--- a/board/at91cap9adk/at91cap9f_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91cap9adk/at91cap9f_defconfig	2012-07-25 21:25:20.839605245 +0100
+@@ -72,7 +72,7 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+ CONFIG_IMG_ADDRESS="0x00008000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_APP_CHECK=y
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91cap9stk/at91cap9stk_defconfig b/board/at91cap9stk/at91cap9stk_defconfig
+--- a/board/at91cap9stk/at91cap9stk_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91cap9stk/at91cap9stk_defconfig	2012-07-25 20:52:59.663692456 +0100
+@@ -96,8 +96,8 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_ADDRESS="0x00004000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_APP_CHECK=y
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91cap9stk/at91cap9stkdf_defconfig b/board/at91cap9stk/at91cap9stkdf_defconfig
+--- a/board/at91cap9stk/at91cap9stkdf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91cap9stk/at91cap9stkdf_defconfig	2012-07-25 20:52:52.255692671 +0100
+@@ -96,8 +96,8 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_ADDRESS="0x00004000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_APP_CHECK=y
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91cap9stk/at91cap9stkf_defconfig b/board/at91cap9stk/at91cap9stkf_defconfig
+--- a/board/at91cap9stk/at91cap9stkf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91cap9stk/at91cap9stkf_defconfig	2012-07-25 21:25:35.235605140 +0100
+@@ -72,7 +72,7 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+ CONFIG_IMG_ADDRESS="0x00008000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_APP_CHECK=y
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9260ek/at91sam9260dfc_defconfig b/board/at91sam9260ek/at91sam9260dfc_defconfig
+--- a/board/at91sam9260ek/at91sam9260dfc_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9260ek/at91sam9260dfc_defconfig	2012-07-25 20:35:23.259739521 +0100
+@@ -97,9 +97,9 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_ADDRESS="0x00004000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_APP_CHECK=y
+ # CONFIG_LONG_TEST is not set
+ # CONFIG_DEBUG is not set
+diff -Nurp a/board/at91sam9260ek/at91sam9260df_defconfig b/board/at91sam9260ek/at91sam9260df_defconfig
+--- a/board/at91sam9260ek/at91sam9260df_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9260ek/at91sam9260df_defconfig	2012-07-25 20:34:19.231742964 +0100
+@@ -102,11 +102,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x20058000"
+ # CONFIG_LONG_TEST is not set
+ # CONFIG_DEBUG is not set
+diff -Nurp a/board/at91sam9260ek/at91sam9260ek_defconfig b/board/at91sam9260ek/at91sam9260ek_defconfig
+--- a/board/at91sam9260ek/at91sam9260ek_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9260ek/at91sam9260ek_defconfig	2012-07-25 20:32:17.711747794 +0100
+@@ -102,11 +102,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x20058000"
+ # CONFIG_LONG_TEST is not set
+ # CONFIG_DEBUG is not set
+diff -Nurp a/board/at91sam9260ek/at91sam9260nf_defconfig b/board/at91sam9260ek/at91sam9260nf_defconfig
+--- a/board/at91sam9260ek/at91sam9260nf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9260ek/at91sam9260nf_defconfig	2012-07-25 21:25:57.079604719 +0100
+@@ -87,8 +87,8 @@ CONFIG_LOAD_UBOOT=y
+ CONFIG_IMG_ADDRESS="0x00020000"
+ CONFIG_SETTING_ADDRESS="0x01FE0000"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x20058000"
+ # CONFIG_LONG_TEST is not set
+ # CONFIG_DEBUG is not set
+diff -Nurp a/board/at91sam9261ek/at91sam9261dfc_defconfig b/board/at91sam9261ek/at91sam9261dfc_defconfig
+--- a/board/at91sam9261ek/at91sam9261dfc_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9261ek/at91sam9261dfc_defconfig	2012-07-25 20:37:07.515735228 +0100
+@@ -97,9 +97,9 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_ADDRESS="0x00004000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_APP_CHECK=y
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9261ek/at91sam9261df_defconfig b/board/at91sam9261ek/at91sam9261df_defconfig
+--- a/board/at91sam9261ek/at91sam9261df_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9261ek/at91sam9261df_defconfig	2012-07-25 20:36:44.351735615 +0100
+@@ -102,11 +102,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x20058000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9261ek/at91sam9261ek_defconfig b/board/at91sam9261ek/at91sam9261ek_defconfig
+--- a/board/at91sam9261ek/at91sam9261ek_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9261ek/at91sam9261ek_defconfig	2012-07-25 20:36:09.111737459 +0100
+@@ -102,11 +102,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x20058000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9261ek/at91sam9261nf_defconfig b/board/at91sam9261ek/at91sam9261nf_defconfig
+--- a/board/at91sam9261ek/at91sam9261nf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9261ek/at91sam9261nf_defconfig	2012-07-25 21:24:45.843607437 +0100
+@@ -86,8 +86,8 @@ CONFIG_LOAD_UBOOT=y
+ CONFIG_IMG_ADDRESS="0x00020000"
+ CONFIG_SETTING_ADDRESS="0x01FE0000"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x20058000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9263ek/at91sam9263dfc_defconfig b/board/at91sam9263ek/at91sam9263dfc_defconfig
+--- a/board/at91sam9263ek/at91sam9263dfc_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9263ek/at91sam9263dfc_defconfig	2012-07-25 20:38:55.555730059 +0100
+@@ -100,9 +100,9 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_ADDRESS="0x00004000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_APP_CHECK=y
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9263ek/at91sam9263df_defconfig b/board/at91sam9263ek/at91sam9263df_defconfig
+--- a/board/at91sam9263ek/at91sam9263df_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9263ek/at91sam9263df_defconfig	2012-07-25 20:38:37.395730195 +0100
+@@ -105,11 +105,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x2006b000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9263ek/at91sam9263ek_defconfig b/board/at91sam9263ek/at91sam9263ek_defconfig
+--- a/board/at91sam9263ek/at91sam9263ek_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9263ek/at91sam9263ek_defconfig	2012-07-25 20:38:08.379732395 +0100
+@@ -105,11 +105,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x2006b000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9263ek/at91sam9263nf_defconfig b/board/at91sam9263ek/at91sam9263nf_defconfig
+--- a/board/at91sam9263ek/at91sam9263nf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9263ek/at91sam9263nf_defconfig	2012-07-25 21:25:39.195605069 +0100
+@@ -89,8 +89,8 @@ CONFIG_LOAD_UBOOT=y
+ CONFIG_IMG_ADDRESS="0x00020000"
+ CONFIG_SETTING_ADDRESS="0x01FE0000"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x2006b000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9g10ek/at91sam9g10df_defconfig b/board/at91sam9g10ek/at91sam9g10df_defconfig
+--- a/board/at91sam9g10ek/at91sam9g10df_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g10ek/at91sam9g10df_defconfig	2012-07-25 20:40:18.087726292 +0100
+@@ -102,11 +102,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x20068000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9g10ek/at91sam9g10ek_defconfig b/board/at91sam9g10ek/at91sam9g10ek_defconfig
+--- a/board/at91sam9g10ek/at91sam9g10ek_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g10ek/at91sam9g10ek_defconfig	2012-07-25 20:39:53.543727636 +0100
+@@ -102,11 +102,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x20068000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9g10ek/at91sam9g10nf_defconfig b/board/at91sam9g10ek/at91sam9g10nf_defconfig
+--- a/board/at91sam9g10ek/at91sam9g10nf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g10ek/at91sam9g10nf_defconfig	2012-07-25 21:25:28.975605503 +0100
+@@ -86,8 +86,8 @@ CONFIG_LOAD_UBOOT=y
+ CONFIG_IMG_ADDRESS="0x00020000"
+ CONFIG_SETTING_ADDRESS="0x01FE0000"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x20068000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9g20ek/at91sam9g20dfc_defconfig b/board/at91sam9g20ek/at91sam9g20dfc_defconfig
+--- a/board/at91sam9g20ek/at91sam9g20dfc_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g20ek/at91sam9g20dfc_defconfig	2012-07-25 20:41:48.275722343 +0100
+@@ -97,9 +97,9 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_ADDRESS="0x00004000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_APP_CHECK=y
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9g20ek/at91sam9g20df_defconfig b/board/at91sam9g20ek/at91sam9g20df_defconfig
+--- a/board/at91sam9g20ek/at91sam9g20df_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g20ek/at91sam9g20df_defconfig	2012-07-25 20:42:07.091721310 +0100
+@@ -102,11 +102,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x20058000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9g20ek/at91sam9g20ek_defconfig b/board/at91sam9g20ek/at91sam9g20ek_defconfig
+--- a/board/at91sam9g20ek/at91sam9g20ek_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g20ek/at91sam9g20ek_defconfig	2012-07-25 20:41:23.179723541 +0100
+@@ -102,11 +102,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x20058000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9g20ek/at91sam9g20nf_defconfig b/board/at91sam9g20ek/at91sam9g20nf_defconfig
+--- a/board/at91sam9g20ek/at91sam9g20nf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g20ek/at91sam9g20nf_defconfig	2012-07-25 21:25:49.291603975 +0100
+@@ -87,8 +87,8 @@ CONFIG_LOAD_UBOOT=y
+ CONFIG_IMG_ADDRESS="0x00020000"
+ CONFIG_SETTING_ADDRESS="0x01FE0000"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x20058000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9g45ek/at91sam9g45df_defconfig b/board/at91sam9g45ek/at91sam9g45df_defconfig
+--- a/board/at91sam9g45ek/at91sam9g45df_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g45ek/at91sam9g45df_defconfig	2012-07-25 20:47:46.055707221 +0100
+@@ -102,10 +102,10 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_GLBDRV_ADDR="0x7006b000"
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9g45ek/at91sam9g45ek_defconfig b/board/at91sam9g45ek/at91sam9g45ek_defconfig
+--- a/board/at91sam9g45ek/at91sam9g45ek_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g45ek/at91sam9g45ek_defconfig	2012-07-25 20:47:02.303708341 +0100
+@@ -102,10 +102,10 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_GLBDRV_ADDR="0x7006b000"
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9g45ek/at91sam9g45nf_defconfig b/board/at91sam9g45ek/at91sam9g45nf_defconfig
+--- a/board/at91sam9g45ek/at91sam9g45nf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g45ek/at91sam9g45nf_defconfig	2012-07-25 21:25:24.547605601 +0100
+@@ -86,7 +86,7 @@ CONFIG_LOAD_UBOOT=y
+ CONFIG_IMG_ADDRESS="0x00020000"
+ CONFIG_SETTING_ADDRESS="0x01FE0000"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_GLBDRV_ADDR="0x7006b000"
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9g45ekes/at91sam9g45dfes_defconfig b/board/at91sam9g45ekes/at91sam9g45dfes_defconfig
+--- a/board/at91sam9g45ekes/at91sam9g45dfes_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g45ekes/at91sam9g45dfes_defconfig	2012-07-25 20:47:33.895706968 +0100
+@@ -102,10 +102,10 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_GLBDRV_ADDR="0x7006b000"
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9g45ekes/at91sam9g45ekes_defconfig b/board/at91sam9g45ekes/at91sam9g45ekes_defconfig
+--- a/board/at91sam9g45ekes/at91sam9g45ekes_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g45ekes/at91sam9g45ekes_defconfig	2012-07-25 20:46:49.043708951 +0100
+@@ -102,10 +102,10 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_GLBDRV_ADDR="0x7006b000"
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9g45ekes/at91sam9g45nfes_defconfig b/board/at91sam9g45ekes/at91sam9g45nfes_defconfig
+--- a/board/at91sam9g45ekes/at91sam9g45nfes_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9g45ekes/at91sam9g45nfes_defconfig	2012-07-25 21:25:44.823604805 +0100
+@@ -86,7 +86,7 @@ CONFIG_LOAD_UBOOT=y
+ CONFIG_IMG_ADDRESS="0x00020000"
+ CONFIG_SETTING_ADDRESS="0x01FE0000"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_GLBDRV_ADDR="0x7006b000"
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9m10ek/at91sam9m10df_defconfig b/board/at91sam9m10ek/at91sam9m10df_defconfig
+--- a/board/at91sam9m10ek/at91sam9m10df_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9m10ek/at91sam9m10df_defconfig	2012-07-25 20:44:34.975714928 +0100
+@@ -102,10 +102,10 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_GLBDRV_ADDR="0x7006b000"
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9m10ek/at91sam9m10ek_defconfig b/board/at91sam9m10ek/at91sam9m10ek_defconfig
+--- a/board/at91sam9m10ek/at91sam9m10ek_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9m10ek/at91sam9m10ek_defconfig	2012-07-25 20:43:34.543717453 +0100
+@@ -102,10 +102,10 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_GLBDRV_ADDR="0x7006b000"
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9m10ek/at91sam9m10nf_defconfig b/board/at91sam9m10ek/at91sam9m10nf_defconfig
+--- a/board/at91sam9m10ek/at91sam9m10nf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9m10ek/at91sam9m10nf_defconfig	2012-07-25 21:21:40.419615800 +0100
+@@ -86,7 +86,7 @@ CONFIG_LOAD_UBOOT=y
+ CONFIG_IMG_ADDRESS="0x00020000"
+ CONFIG_SETTING_ADDRESS="0x01FE0000"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_GLBDRV_ADDR="0x7006b000"
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9m10ekes/at91sam9m10dfes_defconfig b/board/at91sam9m10ekes/at91sam9m10dfes_defconfig
+--- a/board/at91sam9m10ekes/at91sam9m10dfes_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9m10ekes/at91sam9m10dfes_defconfig	2012-07-25 20:44:18.687715650 +0100
+@@ -102,10 +102,10 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_GLBDRV_ADDR="0x7006b000"
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9m10ekes/at91sam9m10ekes_defconfig b/board/at91sam9m10ekes/at91sam9m10ekes_defconfig
+--- a/board/at91sam9m10ekes/at91sam9m10ekes_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9m10ekes/at91sam9m10ekes_defconfig	2012-07-25 20:43:57.255716814 +0100
+@@ -102,10 +102,10 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_GLBDRV_ADDR="0x7006b000"
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9m10ekes/at91sam9m10nfes_defconfig b/board/at91sam9m10ekes/at91sam9m10nfes_defconfig
+--- a/board/at91sam9m10ekes/at91sam9m10nfes_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9m10ekes/at91sam9m10nfes_defconfig	2012-07-25 21:26:10.179603831 +0100
+@@ -86,7 +86,7 @@ CONFIG_LOAD_UBOOT=y
+ CONFIG_IMG_ADDRESS="0x00020000"
+ CONFIG_SETTING_ADDRESS="0x01FE0000"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
++CONFIG_IMG_SIZE="0x00080000"
+ CONFIG_JUMP_ADDR="0x73F00000"
+ CONFIG_GLBDRV_ADDR="0x7006b000"
+ # CONFIG_LONG_TEST is not set
+diff -Nurp a/board/at91sam9n12ek/at91sam9n12df_defconfig b/board/at91sam9n12ek/at91sam9n12df_defconfig
+--- a/board/at91sam9n12ek/at91sam9n12df_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9n12ek/at91sam9n12df_defconfig	2012-07-25 20:52:40.675693207 +0100
+@@ -107,7 +107,7 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+ CONFIG_IMG_SIZE="0x00050000"
+diff -Nurp a/board/at91sam9rlek/at91sam9rldf_defconfig b/board/at91sam9rlek/at91sam9rldf_defconfig
+--- a/board/at91sam9rlek/at91sam9rldf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9rlek/at91sam9rldf_defconfig	2012-07-25 20:48:53.183703493 +0100
+@@ -102,11 +102,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x2006b000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9rlek/at91sam9rlek_defconfig b/board/at91sam9rlek/at91sam9rlek_defconfig
+--- a/board/at91sam9rlek/at91sam9rlek_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9rlek/at91sam9rlek_defconfig	2012-07-25 20:48:29.659704460 +0100
+@@ -102,11 +102,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x2006b000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9rlek/at91sam9rlnf_defconfig b/board/at91sam9rlek/at91sam9rlnf_defconfig
+--- a/board/at91sam9rlek/at91sam9rlnf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9rlek/at91sam9rlnf_defconfig	2012-07-25 21:24:49.335607485 +0100
+@@ -85,8 +85,8 @@ CONFIG_LOAD_UBOOT=y
+ CONFIG_IMG_ADDRESS="0x00020000"
+ CONFIG_SETTING_ADDRESS="0x01FE0000"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x2006b000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9x5ek/at91sam9x5df_defconfig b/board/at91sam9x5ek/at91sam9x5df_defconfig
+--- a/board/at91sam9x5ek/at91sam9x5df_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9x5ek/at91sam9x5df_defconfig	2012-07-25 20:52:45.375693059 +0100
+@@ -106,7 +106,7 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+ CONFIG_IMG_SIZE="0x00050000"
+diff -Nurp a/board/at91sam9xeek/at91sam9xedfc_defconfig b/board/at91sam9xeek/at91sam9xedfc_defconfig
+--- a/board/at91sam9xeek/at91sam9xedfc_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9xeek/at91sam9xedfc_defconfig	2012-07-25 20:50:10.643699991 +0100
+@@ -96,9 +96,9 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_ADDRESS="0x00004000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_APP_CHECK=y
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9xeek/at91sam9xedf_defconfig b/board/at91sam9xeek/at91sam9xedf_defconfig
+--- a/board/at91sam9xeek/at91sam9xedf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9xeek/at91sam9xedf_defconfig	2012-07-25 20:50:26.967699568 +0100
+@@ -103,11 +103,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x23F00000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9xeek/at91sam9xeek_defconfig b/board/at91sam9xeek/at91sam9xeek_defconfig
+--- a/board/at91sam9xeek/at91sam9xeek_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9xeek/at91sam9xeek_defconfig	2012-07-25 20:49:46.131699600 +0100
+@@ -103,11 +103,11 @@ CONFIG_LOAD_UBOOT=y
+ # CONFIG_LOAD_64KB is not set
+ # CONFIG_LOAD_1MB is not set
+ # CONFIG_LOAD_4MB is not set
+-CONFIG_IMG_ADDRESS="0x00008400"
++CONFIG_IMG_ADDRESS="0x00004000"
+ CONFIG_SETTING_ADDRESS="0x00408400"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x23F00000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
+diff -Nurp a/board/at91sam9xeek/at91sam9xenf_defconfig b/board/at91sam9xeek/at91sam9xenf_defconfig
+--- a/board/at91sam9xeek/at91sam9xenf_defconfig	2011-11-18 08:13:09.000000000 +0000
++++ b/board/at91sam9xeek/at91sam9xenf_defconfig	2012-07-25 21:26:05.627603826 +0100
+@@ -88,8 +88,8 @@ CONFIG_LOAD_UBOOT=y
+ CONFIG_IMG_ADDRESS="0x00020000"
+ CONFIG_SETTING_ADDRESS="0x01FE0000"
+ CONFIG_SETTING_SIZE="0x00001000"
+-CONFIG_IMG_SIZE="0x00040000"
+-CONFIG_JUMP_ADDR="0x23F00000"
++CONFIG_IMG_SIZE="0x00080000"
++CONFIG_JUMP_ADDR="0x21F00000"
+ CONFIG_GLBDRV_ADDR="0x23F00000"
+ # CONFIG_LONG_TEST is not set
+ CONFIG_DEBUG=y
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
new file mode 100644
index 0000000..74f08e8
--- /dev/null
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -0,0 +1,67 @@
+#############################################################
+#
+# at91bootstrap3
+#
+#############################################################
+AT91BOOTSTRAP3_VERSION = 3.2
+AT91BOOTSTRAP3_SITE = \
+	ftp://www.at91.com/pub/at91bootstrap/AT91Bootstrap$(AT91BOOTSTRAP3_VERSION)
+AT91BOOTSTRAP3_SOURCE = at91bootstrap_9n12.tar.gz
+
+AT91BOOTSTRAP3_INSTALL_IMAGES = YES
+AT91BOOTSTRAP3_INSTALL_TARGET = NO
+
+AT91BOOTSTRAP3_DEFCONFIG = \
+	$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG))
+AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE = \
+	$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE))
+AT91BOOTSTRAP3_CUSTOM_PATCH_DIR = \
+	$(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR))
+
+AT91BOOTSTRAP3_MAKE_OPT = CROSS_COMPILE=$(TARGET_CROSS) DESTDIR=$(BINARIES_DIR)
+
+ifneq ($(AT91BOOTSTRAP3_CUSTOM_PATCH_DIR),)
+define AT91BOOTSTRAP3_APPLY_CUSTOM_PATCHES
+	support/scripts/apply-patches.sh $(@D) $(AT91BOOTSTRAP3_CUSTOM_PATCH_DIR) \
+		at91bootstrap3-\*.patch
+endef
+
+AT91BOOTSTRAP3_POST_PATCH_HOOKS += AT91BOOTSTRAP3_APPLY_CUSTOM_PATCHES
+endif
+
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
+AT91BOOTSTRAP3_SOURCE_CONFIG = \
+	$(@D)/board/*/$(AT91BOOTSTRAP3_DEFCONFIG)_defconfig
+else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG),y)
+AT91BOOTSTRAP3_SOURCE_CONFIG = $(AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE)
+endif
+
+define AT91BOOTSTRAP3_CONFIGURE_CMDS
+	cp $(AT91BOOTSTRAP3_SOURCE_CONFIG) $(@D)/.config
+	$(SED) 's/image.bin/uImage/' $(@D)/.config
+endef
+
+define AT91BOOTSTRAP3_BUILD_CMDS
+	$(MAKE) $(AT91BOOTSTRAP3_MAKE_OPT) -C $(@D) boot
+endef
+
+define AT91BOOTSTRAP3_INSTALL_IMAGES_CMDS
+	$(MAKE) $(AT91BOOTSTRAP3_MAKE_OPT) -C $(@D) bootstrap
+endef
+
+$(eval $(generic-package))
+
+# Checks to give errors that the user can understand
+ifeq ($(filter source,$(MAKECMDGOALS)),)
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
+ifeq ($(AT91BOOTSTRAP3_DEFCONFIG),)
+$(error No at91bootstrap3 defconfig name specified, check your BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG setting)
+endif
+endif
+
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG),y)
+ifeq ($(AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE),)
+$(error No at91bootstrap3 configuration file specified, check your BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE setting)
+endif
+endif
+endif
-- 
1.7.9.5
