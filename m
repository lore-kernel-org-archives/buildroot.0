From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Oct 2015 20:44:16 +0100
Subject: [Buildroot] [PATCH 6/7] configs: fix build of
	calao_qil_a9260_defconfig
In-Reply-To: <1443901457-7914-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1443901457-7914-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1443901457-7914-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Barebox, AT91Bootstrap and Linux patches for the Calao QIL A9260
board are all located in the same directory, board/calao/qil-a9260/,
with only a prefix to indicate to which component they apply.

Unfortunately, since commit 0eba4759fab9d093afacac77a0ac31f1f0b3cceb
("packages: apply custom patches using *.patch instead of
<pkg>-*.patch"), the logic to apply custom patches in Barebox and
AT91Bootstrap has been changed from applying <package>-*.patch to
applying *.patch (in order to be consistent with what we do for all
packages in Buildroot).

However, this had the effect of trying to apply both the AT91Bootstrap
and Barebox patches on both packages, which obviously cannot work.

This commit fixes that by moving patches around, and switching to use
BR2_GLOBAL_PATCH_DIR for all of Barebox, AT91Bootstrap and Linux
patches.

In addition, the defconfig was not specifying explicitly which Barebox
version to use, so right now it's trying to use Barebox 2015.09, on
which the board-specific patch does not apply. So we've forced to use
Barebox 2012.08, which was the lastest release available at the time
the defconfig was initially contributed.

Cc: Gregory Hermant <gregory.hermant@calao-systems.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../at91bootstrap/0001-qil-a9260.patch}                             | 0
 .../barebox/0001-qil-a9260.patch}                                   | 0
 .../{linux-3.4.7.patch => patches/linux/0001-qil-a9260.patch}       | 0
 configs/calao_qil_a9260_defconfig                                   | 6 +++---
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename board/calao/qil-a9260/{at91bootstrap-1.16-qil-a9260.patch => patches/at91bootstrap/0001-qil-a9260.patch} (100%)
 rename board/calao/qil-a9260/{barebox-2012.07.0-qil-a9260.patch => patches/barebox/0001-qil-a9260.patch} (100%)
 rename board/calao/qil-a9260/{linux-3.4.7.patch => patches/linux/0001-qil-a9260.patch} (100%)

diff --git a/board/calao/qil-a9260/at91bootstrap-1.16-qil-a9260.patch b/board/calao/qil-a9260/patches/at91bootstrap/0001-qil-a9260.patch
similarity index 100%
rename from board/calao/qil-a9260/at91bootstrap-1.16-qil-a9260.patch
rename to board/calao/qil-a9260/patches/at91bootstrap/0001-qil-a9260.patch
diff --git a/board/calao/qil-a9260/barebox-2012.07.0-qil-a9260.patch b/board/calao/qil-a9260/patches/barebox/0001-qil-a9260.patch
similarity index 100%
rename from board/calao/qil-a9260/barebox-2012.07.0-qil-a9260.patch
rename to board/calao/qil-a9260/patches/barebox/0001-qil-a9260.patch
diff --git a/board/calao/qil-a9260/linux-3.4.7.patch b/board/calao/qil-a9260/patches/linux/0001-qil-a9260.patch
similarity index 100%
rename from board/calao/qil-a9260/linux-3.4.7.patch
rename to board/calao/qil-a9260/patches/linux/0001-qil-a9260.patch
diff --git a/configs/calao_qil_a9260_defconfig b/configs/calao_qil_a9260_defconfig
index 05af114..f18337f 100644
--- a/configs/calao_qil_a9260_defconfig
+++ b/configs/calao_qil_a9260_defconfig
@@ -1,5 +1,6 @@
 BR2_arm=y
 BR2_arm926t=y
+BR2_GLOBAL_PATCH_DIR="board/calao/qil-a9260/patches/"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.4"
@@ -7,16 +8,15 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_4=y
 BR2_PACKAGE_HOST_SAM_BA=y
 BR2_TARGET_ROOTFS_UBIFS=y
 BR2_TARGET_AT91BOOTSTRAP=y
-BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR="board/calao/qil-a9260/"
 BR2_TARGET_AT91BOOTSTRAP_BOARD="qil_a9260"
 BR2_TARGET_AT91BOOTSTRAP_NANDFLASH=y
 BR2_TARGET_BAREBOX=y
-BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR="board/calao/qil-a9260/"
+BR2_TARGET_BAREBOX_CUSTOM_VERSION=y
+BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE="2012.08.0"
 BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="qil_a9260"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.4.7"
-BR2_LINUX_KERNEL_PATCH="board/calao/qil-a9260/linux-3.4.7.patch"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/calao/qil-a9260/linux-3.4.7.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
2.6.0
