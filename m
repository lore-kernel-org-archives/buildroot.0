From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Jun 2021 17:10:42 +0200
Subject: [Buildroot] [git commit] support/testing/tests/boot/test_atf:
 update U-Boot in TestATFAllwinner
Message-ID: <20210626144011.9BB7C8E333@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7af5a80aba23538b56e0caa227e954aa72f3b3ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump U-Boot version in TestATFAllwinner. Updating U-Boot version to
2021.04 requires the following two changes.

First, after switching to binman, u-boot.itb is no more generated for
64-bit sunxi boards. Combined u-boot-sunxi-with-spl.bin image should
be used instead. This image contains SPL, U-Boot, and FIT image,
where FIT image contains other binaries such as BL31 and SCP.

Second, new U-Boot enables support for System Control Processor (SCP)
firmware. SCP firmware is included by default into FIT image in the
combined u-boot-sunxi-with-spl.bin binary. When SCP is not available
or not needed, it should be explicitly disabled by pointing to an
empty file. Support for Allwinner SCP firmware is not yet available
neither in Buildroot nor in mainline kernel. So disable it for now
using custom U-Boot build options.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/boot/test_atf.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index b0be7fb308..a9d5b67ac7 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -41,16 +41,15 @@ class TestATFAllwinner(infra.basetest.BRTest):
         BR2_TARGET_UBOOT=y
         BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
         BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
+        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
         BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m64"
         BR2_TARGET_UBOOT_NEEDS_DTC=y
         BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
         BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
         BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-        BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-        BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
         BR2_TARGET_UBOOT_SPL=y
-        BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
+        BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+        BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
         """
 
     def test_run(self):
