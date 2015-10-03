From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Oct 2015 20:44:15 +0100
Subject: [Buildroot] [PATCH 5/7] configs: fix build of
	calao_usb_a9g20_lpw_defconfig
In-Reply-To: <1443901457-7914-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1443901457-7914-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1443901457-7914-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Both the Barebox and AT91Bootstrap patches for the Calao USB A9G20
board are located in the same directory, board/calao/usb-a9g20-lpw/,
with only a prefix making a difference between whether they apply to
Barebox or AT91Bootstrap.

Unfortunately, since commit 0eba4759fab9d093afacac77a0ac31f1f0b3cceb
("packages: apply custom patches using *.patch instead of
<pkg>-*.patch"), the logic to apply custom patches in Barebox and
AT91Bootstrap has been changed from applying <package>-*.patch to
applying *.patch (in order to be consistent with what we do for all
packages in Buildroot).

However, this had the effect of trying to apply both the AT91Bootstrap
and Barebox patches on both packages, which obviously cannot work.

This commit fixes that by moving patches around, and switching to use
BR2_GLOBAL_PATCH_DIR.

Cc: Gregory Hermant <gregory.hermant@calao-systems.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../at91bootstrap/0001-usb-a9g20-lpw.patch}                            | 0
 .../barebox/0001-usb-a9g20-lpw.patch}                                  | 0
 configs/calao_usb_a9g20_lpw_defconfig                                  | 3 +--
 3 files changed, 1 insertion(+), 2 deletions(-)
 rename board/calao/usb-a9g20-lpw/{at91bootstrap-1.16-usb-a9g20-lpw.patch => patches/at91bootstrap/0001-usb-a9g20-lpw.patch} (100%)
 rename board/calao/usb-a9g20-lpw/{barebox-2012.07.0-usb-a9g20-lpw.patch => patches/barebox/0001-usb-a9g20-lpw.patch} (100%)

diff --git a/board/calao/usb-a9g20-lpw/at91bootstrap-1.16-usb-a9g20-lpw.patch b/board/calao/usb-a9g20-lpw/patches/at91bootstrap/0001-usb-a9g20-lpw.patch
similarity index 100%
rename from board/calao/usb-a9g20-lpw/at91bootstrap-1.16-usb-a9g20-lpw.patch
rename to board/calao/usb-a9g20-lpw/patches/at91bootstrap/0001-usb-a9g20-lpw.patch
diff --git a/board/calao/usb-a9g20-lpw/barebox-2012.07.0-usb-a9g20-lpw.patch b/board/calao/usb-a9g20-lpw/patches/barebox/0001-usb-a9g20-lpw.patch
similarity index 100%
rename from board/calao/usb-a9g20-lpw/barebox-2012.07.0-usb-a9g20-lpw.patch
rename to board/calao/usb-a9g20-lpw/patches/barebox/0001-usb-a9g20-lpw.patch
diff --git a/configs/calao_usb_a9g20_lpw_defconfig b/configs/calao_usb_a9g20_lpw_defconfig
index cf114d9..e9d0665 100644
--- a/configs/calao_usb_a9g20_lpw_defconfig
+++ b/configs/calao_usb_a9g20_lpw_defconfig
@@ -1,13 +1,12 @@
 BR2_arm=y
 BR2_arm926t=y
+BR2_GLOBAL_PATCH_DIR="board/calao/usb-a9g20-lpw/patches/"
 BR2_PACKAGE_HOST_SAM_BA=y
 BR2_TARGET_ROOTFS_UBIFS=y
 BR2_TARGET_AT91BOOTSTRAP=y
-BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR="board/calao/usb-a9g20-lpw/"
 BR2_TARGET_AT91BOOTSTRAP_BOARD="usb_a9g20_lpw"
 BR2_TARGET_AT91BOOTSTRAP_NANDFLASH=y
 BR2_TARGET_BAREBOX=y
-BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR="board/calao/usb-a9g20-lpw/"
 BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="usb_a9g20"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-- 
2.6.0
