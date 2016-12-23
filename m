From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Dec 2016 22:29:01 +0100
Subject: [Buildroot] [git commit] armadeus_apf9328_defconfig: bump kernel to
	3.18.29
Message-ID: <20161223214639.A33AF7FE8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ffa395fc83c79cc53cbfa533b64c04f5a4a5323
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Which includes the gcc5+ fix for ftrace:

commit aeea3592a13bf12861943e44fc48f1f270941f8d
Author: Behan Webster <behanw@converseincode.com>
Date:   Wed Sep 24 01:06:46 2014 +0100

    ARM: 8158/1: LLVMLinux: use static inline in ARM ftrace.h

    With compilers which follow the C99 standard (like modern versions of gcc and
    clang), "extern inline" does the wrong thing (emits code for an externally
    linkable version of the inline function). In this case using static inline
    and removing the NULL version of return_address in return_address.c does
    the right thing.

    Signed-off-by: Behan Webster <behanw@converseincode.com>
    Reviewed-by: Mark Charlebois <charlebm@gmail.com>
    Acked-by: Steven Rostedt <rostedt@goodmis.org>
    Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>

Otherwise, the build dies with:

arch/arm/kernel/return_address.c:66:7: error: redefinition of ???return_address???
 void *return_address(unsigned int level)
       ^
In file included from include/linux/ftrace.h:20:0,
                 from arch/arm/kernel/return_address.c:12:
./arch/arm/include/asm/ftrace.h:48:21: note: previous definition of ???return_address??? was here
 extern inline void *return_address(unsigned int level)
                     ^

For more details, see:
https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/185616889

notice: Only build tested as I don't have the hw, which is also why the
kernel is only bumped to 3.18 to make it as safe as possible.

CC: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/armadeus_apf9328_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/armadeus_apf9328_defconfig b/configs/armadeus_apf9328_defconfig
index d83ed71..fbc9864 100644
--- a/configs/armadeus_apf9328_defconfig
+++ b/configs/armadeus_apf9328_defconfig
@@ -10,8 +10,8 @@ BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
 BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
-# Linux headers same as kernel, a 3.17 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
+# Linux headers same as kernel, a 3.18 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf9328"
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_JFFS2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.29"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v4_v5"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x08008000"
