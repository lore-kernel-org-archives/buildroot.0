From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Thu, 30 Apr 2020 19:37:13 +0300
Subject: [Buildroot] [PATCH] hsdk/linux: backporting patch enabling
 CONFIG_USB
Message-ID: <20200430163713.11290-1-Evgeniy.Didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With this commit we backporting critical Linux kernel patch
which enables CONFIG_USB option for HSDK.

Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: arc-buildroot at synopsys.com
---
 .../0001-ARC-plat-hsdk-fix-USB-regression.patch    | 39 ++++++++++++++++++++++
 configs/snps_archs38_hsdk_defconfig                |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 board/synopsys/hsdk/linux_patches/0001-ARC-plat-hsdk-fix-USB-regression.patch

diff --git a/board/synopsys/hsdk/linux_patches/0001-ARC-plat-hsdk-fix-USB-regression.patch b/board/synopsys/hsdk/linux_patches/0001-ARC-plat-hsdk-fix-USB-regression.patch
new file mode 100644
index 0000000000..882d2c61df
--- /dev/null
+++ b/board/synopsys/hsdk/linux_patches/0001-ARC-plat-hsdk-fix-USB-regression.patch
@@ -0,0 +1,39 @@
+From 4c13ca86dcf80a8c705b1f3674ff43d318e970e0 Mon Sep 17 00:00:00 2001
+From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
+Date: Tue, 7 Apr 2020 23:06:42 +0300
+Subject: ARC: [plat-hsdk]: fix USB regression
+
+As of today the CONFIG_USB isn't explicitly present in HSDK defconfig
+as it is implicitly forcibly enabled by UDL driver which selects CONFIG_USB
+in its kconfig.
+The commit 5d50bd440bc2 ("drm/udl: Make udl driver depend on CONFIG_USB")
+reverse the dependencies between UDL and USB so UDL now depends on
+CONFIG_USB and not selects it. This introduces regression for ARC HSDK
+board as HSDK defconfig wasn't adjusted and now it misses USB support
+due to lack of CONFIG_USB enabled.
+
+Fix that.
+
+Cc: <stable@vger.kernel.org> # 5.6.x
+Fixes: 5d50bd440bc2 ("drm/udl: Make udl driver depend on CONFIG_USB")
+Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
+Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
+---
+ arch/arc/configs/hsdk_defconfig | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
+index 0974226fab55..aa000075a575 100644
+--- a/arch/arc/configs/hsdk_defconfig
++++ b/arch/arc/configs/hsdk_defconfig
+@@ -65,6 +65,7 @@ CONFIG_DRM_UDL=y
+ CONFIG_DRM_ETNAVIV=y
+ CONFIG_FB=y
+ CONFIG_FRAMEBUFFER_CONSOLE=y
++CONFIG_USB=y
+ CONFIG_USB_EHCI_HCD=y
+ CONFIG_USB_EHCI_HCD_PLATFORM=y
+ CONFIG_USB_OHCI_HCD=y
+-- 
+cgit 1.2-0.3.lf.el7
+
diff --git a/configs/snps_archs38_hsdk_defconfig b/configs/snps_archs38_hsdk_defconfig
index af7cba6c2e..4a002cd69f 100644
--- a/configs/snps_archs38_hsdk_defconfig
+++ b/configs/snps_archs38_hsdk_defconfig
@@ -14,6 +14,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
+BR2_LINUX_KERNEL_PATCH="board/synopsys/hsdk/linux_patches"
 BR2_LINUX_KERNEL_DEFCONFIG="hsdk"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/synopsys/hsdk/linux.fragment"
 
-- 
2.16.2
