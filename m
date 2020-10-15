From: Michael Durrant <mdurrant@ArcturusNetworks.com>
Date: Thu, 15 Oct 2020 10:48:33 -0400
Subject: [Buildroot] [PATCH] configs/arcturus_ucp1020: Enabling gcc-8.x &
 support for BR2_powerpc_8548 cores
Message-ID: <977a0251-8239-1ec8-268c-4bf9b1c0498a@ArcturusNetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enabling GCC-8.x with support for BR2_powerpc_8548 cores

The GCC-7.x compiler series was the last to support BR2_powerpc_SPE CPUs
within GCC.? After GCC-7.x support was removed as a default in buildroot,
some boards, including the arcturus_ucp1020_defconfig and
freescale_p1025twr_defconfig will fail to compile.

The GCC-8.x compiler series continues to support powerpc_8548 CPU
cores, but only as an --enable-obsoleted instruction set.?
This patch is enables the use of GCC-8.x and asserts the required
option to enable the powerpc_8548 instruction set for the?
arcturus_ucp1020 platform.

This Patch passes compilation and run tests with the arcturus/ppc-ucp1020
board.? This patch should address a noted job failure on GitLab CI
https://gitlab.com/buildroot.org/buildroot/-/jobs/779210821

Tested-by: Oleksandr G Zhadan <Oleks@ArcturusNetworks.com>
Signed-off-by: Oleksandr G Zhadan <Oleks@ArcturusNetworks.com>
Signed-off-by: Michael Durrant <mdurrant@ArcturusNetworks.com>
---
?configs/arcturus_ucp1020_defconfig | 1 +
?package/gcc/Config.in.host???????? | 2 +-
?2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/arcturus_ucp1020_defconfig
b/configs/arcturus_ucp1020_defconfig
index 8b90f44750..4e4a84f9e9 100644
--- a/configs/arcturus_ucp1020_defconfig
+++ b/configs/arcturus_ucp1020_defconfig
@@ -6,6 +6,7 @@ BR2_powerpc_8548=y
?BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
?
?# System settings
+BR2_EXTRA_GCC_CONFIG_OPTIONS="--enable-obsolete"
?BR2_TARGET_GENERIC_HOSTNAME="UCP1020"
?BR2_TARGET_GENERIC_ISSUE="Welcome to Arcturus uCP1020 System on Module"
?BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 74999c800b..a21ba006ce 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -27,7 +27,7 @@ config BR2_GCC_VERSION_8_X
??????? depends on !BR2_or1k
??????? # powerpc spe support has been deprecated since gcc 8.x.
??????? # https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
-?????? depends on !BR2_powerpc_SPE
+?????? depends on !BR2_powerpc_SPE || BR2_powerpc_8548
??????? select BR2_TOOLCHAIN_GCC_AT_LEAST_8
?
?config BR2_GCC_VERSION_9_X
-- 
2.26.2
