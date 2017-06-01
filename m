From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Date: Thu, 1 Jun 2017 07:38:55 +0000
Subject: [Buildroot] [PATCH v4] configs/stm32f4xx: use kernel version
	4.11
In-Reply-To: <8729016553E3654398EA69218DA29EEF15BB3A07@cnshjmbx02>
References: <1496059605-1998-1-git-send-email-christophe.priouzeau@st.com>
 <1496301611-12538-1-git-send-email-christophe.priouzeau@st.com>
 <8729016553E3654398EA69218DA29EEF15BB3A07@cnshjmbx02>
Message-ID: <c0b97b52-eb54-8669-8b76-c0d91e34a52f@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
The kernel patch will be pushed for the next upstream kernel merge windows (kernel 4.13).

Regards
Christophe
On 06/01/2017 09:25 AM, YUAN Linyu wrote:

Hi,

I have a question about kernel patch, why these changes can't merge into kernel?




-----Original Message-----
From: buildroot [mailto:buildroot-bounces at busybox.net] On Behalf Of
Christophe PRIOUZEAU
Sent: Thursday, June 01, 2017 3:20 PM
To: buildroot at buildroot.org<mailto:buildroot@buildroot.org>
Cc: Christophe PRIOUZEAU; Benjamin GAIGNARD; Alexandre TORGUE
Subject: [Buildroot] [PATCH v4] configs/stm32f4xx: use kernel version 4.11

Use kernel 4.11 for stm32f4 discovery board
(stm32f429i-disco and stm32f469i-disco).

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com><mailto:christophe.priouzeau@st.com>
---
Changes v1 -> v2:
 - change the commit header (suggested by Thomas)
Changes v2 -> v3
 - use LINUX_KERNEL_CUSTOM_VERSION_VALUE instead
ofLINUX_KERNEL_LATEST_VERSION (suggested by Thomas)
Changes v3 -> v4
 - use linux header of kernel 4.11 (suggested by Thomas)

 ...-ARM-stm32-Identify-a-new-board-STM32F469.patch |  25 -----
 ...49-disco-don-t-force-init-in-chosen-boota.patch |  33 +++++++
 ...upply-a-DTS-file-for-the-STM32F469-Discov.patch | 101 ---------------------
 ...-Add-new-config-fragment-to-change-RAM-st.patch |  28 ------
 configs/stm32f429_disco_defconfig                  |   4 +-
 configs/stm32f469_disco_defconfig                  |   4 +-
 6 files changed, 37 insertions(+), 158 deletions(-)
 delete mode 100644
board/stmicroelectronics/stm32f469-disco/patches/linux/0001-ARM-stm32-Id
entify-a-new-board-STM32F469.patch
 create mode 100644
board/stmicroelectronics/stm32f469-disco/patches/linux/0001-ARM-stm32f24
9-disco-don-t-force-init-in-chosen-boota.patch
 delete mode 100644
board/stmicroelectronics/stm32f469-disco/patches/linux/0002-ARM-stm32-Su
pply-a-DTS-file-for-the-STM32F469-Discov.patch
 delete mode 100644
board/stmicroelectronics/stm32f469-disco/patches/linux/0003-ARM-configs-A
dd-new-config-fragment-to-change-RAM-st.patch

diff --git
a/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-ARM-stm32-I
dentify-a-new-board-STM32F469.patch
b/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-ARM-stm32-I
dentify-a-new-board-STM32F469.patch
deleted file mode 100644
index 01af415..0000000
---
a/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-ARM-stm32-I
dentify-a-new-board-STM32F469.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 3b572676972f9bcf69695fd85a582c6622f7faa8 Mon Sep 17 00:00:00
2001
-From: Lee Jones <lee.jones@linaro.org><mailto:lee.jones@linaro.org>
-Date: Tue, 16 Feb 2016 14:04:17 +0000
-Subject: [PATCH] ARM: stm32: Identify a new board - STM32F469
-
-Signed-off-by: Lee Jones <lee.jones@linaro.org><mailto:lee.jones@linaro.org>
----
- arch/arm/mach-stm32/board-dt.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/arch/arm/mach-stm32/board-dt.c
b/arch/arm/mach-stm32/board-dt.c
-index f2ad772..ceee477 100644
---- a/arch/arm/mach-stm32/board-dt.c
-+++ b/arch/arm/mach-stm32/board-dt.c
-@@ -10,6 +10,7 @@
-
- static const char *const stm32_compat[] __initconst = {
-       "st,stm32f429",
-+      "st,stm32f469",
-       NULL
- };
-
---
-2.6.4
-
diff --git
a/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-ARM-stm32f
249-disco-don-t-force-init-in-chosen-boota.patch
b/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-ARM-stm32f
249-disco-don-t-force-init-in-chosen-boota.patch
new file mode 100644
index 0000000..750e477
--- /dev/null
+++
b/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-ARM-stm32f
249-disco-don-t-force-init-in-chosen-boota.patch
@@ -0,0 +1,33 @@
+From c8f8f33c2f0460a34c9545b01a7972a7ed2df0e9 Mon Sep 17 00:00:00
2001
+From: Christophe Priouzeau <christophe.priouzeau@st.com><mailto:christophe.priouzeau@st.com>
+Date: Mon, 29 May 2017 13:38:16 +0200
+Subject: [PATCH] ARM: stm32f249-disco: don't force init= in /chosen/bootargs
+
+There is no reason to override the kernel's default init= value, as
+this breaks userspace that assumes the kernel default of /init is
+used. Since stm32 is often used with a minimal bootloader
+(afboot-stm32) that doesn't provide any mechanism to override the DTB,
+we need to adjust the kernel command line in the Device Tree source.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com><mailto:thomas.petazzoni@free-electrons.com>
+Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com><mailto:christophe.priouzeau@st.com>
+---
+ arch/arm/boot/dts/stm32f469-disco.dts | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/arm/boot/dts/stm32f469-disco.dts
b/arch/arm/boot/dts/stm32f469-disco.dts
+index 0dd56ef..93ee1b2 100644
+--- a/arch/arm/boot/dts/stm32f469-disco.dts
++++ b/arch/arm/boot/dts/stm32f469-disco.dts
+@@ -53,7 +53,7 @@
+       compatible = "st,stm32f469i-disco", "st,stm32f469";
+
+       chosen {
+-              bootargs = "root=/dev/ram rdinit=/linuxrc";
++              bootargs = "root=/dev/ram";
+               stdout-path = "serial0:115200n8";
+       };
+
+--
+2.7.4
+
diff --git
a/board/stmicroelectronics/stm32f469-disco/patches/linux/0002-ARM-stm32-
Supply-a-DTS-file-for-the-STM32F469-Discov.patch
b/board/stmicroelectronics/stm32f469-disco/patches/linux/0002-ARM-stm32-
Supply-a-DTS-file-for-the-STM32F469-Discov.patch
deleted file mode 100644
index 45f5228..0000000
---
a/board/stmicroelectronics/stm32f469-disco/patches/linux/0002-ARM-stm32-
Supply-a-DTS-file-for-the-STM32F469-Discov.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From a08561ffdfb13986e2628296ccfd42f8a273b729 Mon Sep 17 00:00:00
2001
-From: Lee Jones <lee.jones@linaro.org><mailto:lee.jones@linaro.org>
-Date: Tue, 16 Feb 2016 13:53:47 +0000
-Subject: [PATCH] ARM: stm32: Supply a DTS file for the STM32F469 Discovery
- board
-
-It's pretty similar to the STM32F429, but there are some
-subtle changes required to boot successfully.
-
-Signed-off-by: Lee Jones <lee.jones@linaro.org><mailto:lee.jones@linaro.org>
-[Thomas: remove rdinit= from /chosen/bootargs.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com><mailto:thomas.petazzoni@free-electrons.com>
----
- arch/arm/boot/dts/stm32f469-disco.dts | 75
+++++++++++++++++++++++++++++++++++
- 1 file changed, 75 insertions(+)
- create mode 100644 arch/arm/boot/dts/stm32f469-disco.dts
-
-diff --git a/arch/arm/boot/dts/stm32f469-disco.dts
b/arch/arm/boot/dts/stm32f469-disco.dts
-new file mode 100644
-index 0000000..9e73656
---- /dev/null
-+++ b/arch/arm/boot/dts/stm32f469-disco.dts
-@@ -0,0 +1,75 @@
-+/*
-+ * Copyright 2016 - Lee Jones <lee.jones@linaro.org><mailto:lee.jones@linaro.org>
-+ *
-+ * This file is dual-licensed: you can use it either under the terms
-+ * of the GPL or the X11 license, at your option. Note that this dual
-+ * licensing only applies to this file, and not this project as a
-+ * whole.
-+ *
-+ *  a) This file is free software; you can redistribute it and/or
-+ *     modify it under the terms of the GNU General Public License as
-+ *     published by the Free Software Foundation; either version 2 of the
-+ *     License, or (at your option) any later version.
-+ *
-+ *     This file is distributed in the hope that it will be useful,
-+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
the
-+ *     GNU General Public License for more details.
-+ *
-+ *     You should have received a copy of the GNU General Public
-+ *     License along with this file; if not, write to the Free
-+ *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
-+ *     MA 02110-1301 USA
-+ *
-+ * Or, alternatively,
-+ *
-+ *  b) Permission is hereby granted, free of charge, to any person
-+ *     obtaining a copy of this software and associated documentation
-+ *     files (the "Software"), to deal in the Software without
-+ *     restriction, including without limitation the rights to use,
-+ *     copy, modify, merge, publish, distribute, sublicense, and/or
-+ *     sell copies of the Software, and to permit persons to whom the
-+ *     Software is furnished to do so, subject to the following
-+ *     conditions:
-+ *
-+ *     The above copyright notice and this permission notice shall be
-+ *     included in all copies or substantial portions of the Software.
-+ *
-+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
KIND,
-+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES
-+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
-+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT
-+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY,
-+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING
-+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
USE OR
-+ *     OTHER DEALINGS IN THE SOFTWARE.
-+ */
-+
-+/dts-v1/;
-+#include "stm32f429.dtsi"
-+
-+/ {
-+      model = "STMicroelectronics STM32F469i-DISCO board";
-+      compatible = "st,stm32f469i-disco", "st,stm32f469";
-+
-+      chosen {
-+              bootargs = "root=/dev/ram";
-+              stdout-path = "serial0:115200n8";
-+      };
-+
-+      memory {
-+              reg = <0x00000000 0x800000>;
-+      };
-+
-+      aliases {
-+              serial0 = &usart3;
-+      };
-+};
-+
-+&clk_hse {
-+      clock-frequency = <8000000>;
-+};
-+
-+&usart3 {
-+      status = "okay";
-+};
---
-2.6.4
-
diff --git
a/board/stmicroelectronics/stm32f469-disco/patches/linux/0003-ARM-configs-
Add-new-config-fragment-to-change-RAM-st.patch
b/board/stmicroelectronics/stm32f469-disco/patches/linux/0003-ARM-configs-
Add-new-config-fragment-to-change-RAM-st.patch
deleted file mode 100644
index e12c9bc..0000000
---
a/board/stmicroelectronics/stm32f469-disco/patches/linux/0003-ARM-configs-
Add-new-config-fragment-to-change-RAM-st.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 7d67f4be6e1b4d08126023c3902e3fc39488bbf9 Mon Sep 17 00:00:00
2001
-From: Lee Jones <lee.jones@linaro.org><mailto:lee.jones@linaro.org>
-Date: Tue, 16 Feb 2016 13:56:13 +0000
-Subject: [PATCH] ARM: configs: Add new config fragment to change RAM start
- point
-
-Rather than duplicate a defconfig for each difference
-between platforms, we can choose to pick a basic defconfig and
-manipulate it at run-time using config fragments.  Here we're
-adding a new fragment to over-ride the RAM start point to 0x0.
-
-Cc: Arnd Bergmann <arnd@arndb.de><mailto:arnd@arndb.de>
-Signed-off-by: Lee Jones <lee.jones@linaro.org><mailto:lee.jones@linaro.org>
----
- arch/arm/configs/dram_0x00000000.config | 1 +
- 1 file changed, 1 insertion(+)
- create mode 100644 arch/arm/configs/dram_0x00000000.config
-
-diff --git a/arch/arm/configs/dram_0x00000000.config
b/arch/arm/configs/dram_0x00000000.config
-new file mode 100644
-index 0000000..db96dcb
---- /dev/null
-+++ b/arch/arm/configs/dram_0x00000000.config
-@@ -0,0 +1 @@
-+CONFIG_DRAM_BASE=0x00000000
---
-2.6.4
-
diff --git a/configs/stm32f429_disco_defconfig
b/configs/stm32f429_disco_defconfig
index 3799794..5237e9a 100644
--- a/configs/stm32f429_disco_defconfig
+++ b/configs/stm32f429_disco_defconfig
@@ -1,11 +1,11 @@
 BR2_arm=y
 BR2_cortex_m4=y

BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patche
s"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y

BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32-post-bui
ld.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
diff --git a/configs/stm32f469_disco_defconfig
b/configs/stm32f469_disco_defconfig
index 327134d..8b77d8c 100644
--- a/configs/stm32f469_disco_defconfig
+++ b/configs/stm32f469_disco_defconfig
@@ -1,11 +1,11 @@
 BR2_arm=y
 BR2_cortex_m4=y

BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patche
s"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y

BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32-post-bui
ld.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"

BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/co
nfigs/dram_0x00000000.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
--
2.7.4
_______________________________________________
buildroot mailing list
buildroot at busybox.net<mailto:buildroot@busybox.net>
http://lists.busybox.net/mailman/listinfo/buildroot



--


Best regards / Cordialement,

[cid:part1.66A3E4B1.A08127CC at st.com]
Christophe Priouzeau | TINA: 166 7320 | Tel: +33 244027320

STMicroelectronics
ST oneline: www.st.com<http://www.st.com>







-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170601/41615e79/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: st_mail.png
Type: image/png
Size: 9916 bytes
Desc: st_mail.png
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170601/41615e79/attachment-0001.png>
