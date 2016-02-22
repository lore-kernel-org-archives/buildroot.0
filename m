From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 22 Feb 2016 18:59:18 +0000
Subject: [Buildroot] [PATCH v2 04/15] boards: stm32f469-disco: Add kernel
	patch to provide DTS file
In-Reply-To: <1456167569-8713-1-git-send-email-lee.jones@linaro.org>
References: <1456167569-8713-1-git-send-email-lee.jones@linaro.org>
Message-ID: <1456167569-8713-5-git-send-email-lee.jones@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At the time of submission, the Mainline kernel does not currently
support the STM32f469.  This patch adds a new DTS file which
contains some critical information to ensure a clean, visible boot.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 .../patches/kernel/0002-kernel-new-dts-file.patch  | 112 +++++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel/0002-kernel-new-dts-file.patch

diff --git a/board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel/0002-kernel-new-dts-file.patch b/board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel/0002-kernel-new-dts-file.patch
new file mode 100644
index 0000000..124953d
--- /dev/null
+++ b/board/stmicroelectronics/stm32/stm32f469-disco/patches/kernel/0002-kernel-new-dts-file.patch
@@ -0,0 +1,112 @@
+From a898629f21b86f2560041109f64d01d20087deae Mon Sep 17 00:00:00 2001
+From: Lee Jones <lee.jones@linaro.org>
+Date: Tue, 16 Feb 2016 13:53:47 +0000
+Subject: [PATCH 1/3] ARM: stm32: Supply a DTS file for the STM32F469 Discovery
+ board
+
+It's pretty similar to the STM32F429, but there are some
+subtle changes required to boot successfully.
+
+Signed-off-by: Lee Jones <lee.jones@linaro.org>
+---
+ arch/arm/boot/dts/Makefile            |  1 +
+ arch/arm/boot/dts/stm32f469-disco.dts | 75 +++++++++++++++++++++++++++++++++++
+ 2 files changed, 76 insertions(+)
+ create mode 100644 arch/arm/boot/dts/stm32f469-disco.dts
+
+diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
+index 30bbc37..c9d8023 100644
+--- a/arch/arm/boot/dts/Makefile
++++ b/arch/arm/boot/dts/Makefile
+@@ -583,6 +583,7 @@ dtb-$(CONFIG_ARCH_STI) += \
+ 	stih418-b2199.dtb
+ dtb-$(CONFIG_ARCH_STM32)+= \
+ 	stm32f429-disco.dtb \
++	stm32f469-disco.dtb \
+ 	stm32429i-eval.dtb
+ dtb-$(CONFIG_MACH_SUN4I) += \
+ 	sun4i-a10-a1000.dtb \
+diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
+new file mode 100644
+index 0000000..e911af8
+--- /dev/null
++++ b/arch/arm/boot/dts/stm32f469-disco.dts
+@@ -0,0 +1,75 @@
++/*
++ * Copyright 2016 - Lee Jones <lee.jones@linaro.org>
++ *
++ * This file is dual-licensed: you can use it either under the terms
++ * of the GPL or the X11 license, at your option. Note that this dual
++ * licensing only applies to this file, and not this project as a
++ * whole.
++ *
++ *  a) This file is free software; you can redistribute it and/or
++ *     modify it under the terms of the GNU General Public License as
++ *     published by the Free Software Foundation; either version 2 of the
++ *     License, or (at your option) any later version.
++ *
++ *     This file is distributed in the hope that it will be useful,
++ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *     GNU General Public License for more details.
++ *
++ *     You should have received a copy of the GNU General Public
++ *     License along with this file; if not, write to the Free
++ *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
++ *     MA 02110-1301 USA
++ *
++ * Or, alternatively,
++ *
++ *  b) Permission is hereby granted, free of charge, to any person
++ *     obtaining a copy of this software and associated documentation
++ *     files (the "Software"), to deal in the Software without
++ *     restriction, including without limitation the rights to use,
++ *     copy, modify, merge, publish, distribute, sublicense, and/or
++ *     sell copies of the Software, and to permit persons to whom the
++ *     Software is furnished to do so, subject to the following
++ *     conditions:
++ *
++ *     The above copyright notice and this permission notice shall be
++ *     included in all copies or substantial portions of the Software.
++ *
++ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
++ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
++ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
++ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
++ *     OTHER DEALINGS IN THE SOFTWARE.
++ */
++
++/dts-v1/;
++#include "stm32f429.dtsi"
++
++/ {
++	model = "STMicroelectronics STM32F469i-DISCO board";
++	compatible = "st,stm32f469i-disco", "st,stm32f469";
++
++	chosen {
++		bootargs = "root=/dev/ram rdinit=/linuxrc";
++		stdout-path = "serial0:115200n8";
++	};
++
++	memory {
++		reg = <0x00000000 0x800000>;
++	};
++
++	aliases {
++		serial0 = &usart3;
++	};
++};
++
++&clk_hse {
++	clock-frequency = <8000000>;
++};
++
++&usart3 {
++	status = "okay";
++};
+-- 
+1.9.1
+
-- 
1.9.1
