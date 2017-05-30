From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Date: Tue, 30 May 2017 07:07:28 +0000
Subject: [Buildroot] [PATCH 1/1] STM32F4xx: use the last kernel
In-Reply-To: <20170529222759.7be45b97@free-electrons.com>
References: <1496059605-1998-1-git-send-email-christophe.priouzeau@st.com>
 <20170529222759.7be45b97@free-electrons.com>
Message-ID: <b47eeb66-9f56-f252-a0b7-e90f4abce09a@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello
On 05/29/2017 10:27 PM, Thomas Petazzoni wrote:

Hello,

On Mon, 29 May 2017 12:06:48 +0000, Christophe PRIOUZEAU wrote:


Linux kernel support the two stm32f4 discovery board since kernel 4.5
(stm32f429i-disco and stm32f469i-disco).

Use last kernel supported on buildroot for stm32f429 and stmf469 board.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com><mailto:christophe.priouzeau@st.com>



Thanks Christophe for this contribution! A few comments.

First, the commit title should be:

        configs/stm32f4xx: use kernel version 4...


I make the change for the next version.

diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch b/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch
new file mode 100644
index 0000000..750e477
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-ARM-stm32f249-disco-don-t-force-init-in-chosen-boota.patch
@@ -0,0 +1,33 @@
+From c8f8f33c2f0460a34c9545b01a7972a7ed2df0e9 Mon Sep 17 00:00:00 2001
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



Do you know if this will be fixed upstream at some point?


yes, we have targeted to upstream this change for device tree.




diff --git a/configs/stm32f429_disco_defconfig b/configs/stm32f429_disco_defconfig
index 3799794..fe2b22d 100644
--- a/configs/stm32f429_disco_defconfig
+++ b/configs/stm32f429_disco_defconfig
@@ -1,11 +1,9 @@
 BR2_arm=y
 BR2_cortex_m4=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
+BR2_LINUX_KERNEL_LATEST_VERSION=y



Please don't use "latest version", but a fixed kernel version that you
have tested.

And therefore, keep the corresponding
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_X=y option.

Thanks!

Thomas


Thanks for your feedback.

Regards

Christophe

--


Best regards / Cordialement,

[cid:part1.E0B9AC10.914B4565 at st.com]
Christophe Priouzeau | TINA: 166 7320 | Tel: +33 244027320

STMicroelectronics
ST oneline: www.st.com<http://www.st.com>







-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170530/e7600551/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: st_mail.png
Type: image/png
Size: 9916 bytes
Desc: st_mail.png
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170530/e7600551/attachment.png>
