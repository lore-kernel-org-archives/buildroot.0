From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Aug 2019 09:58:25 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/linux-headers:
 apply all Linux patches when BR2_KERNEL_HEADERS_AS_KERNEL=y
Message-ID: <20190831075423.3FD8B88531@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03273446369ceb8d07c5a74cf9ff0cad25ad00ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

When BR2_KERNEL_HEADERS_AS_KERNEL=y, we expect that the Linux kernel
headers code will be exactly the same as the Linux kernel code
itself. The code currently takes into account the patches defined by
BR2_LINUX_KERNEL_PATCH, but not the kernel patches that are stored in
linux's BR2_GLOBAL_PATCH_DIR.

So for example, the current qemu_riscv32_virt_defconfig has:

BR2_GLOBAL_PATCH_DIR="board/qemu/riscv32-virt/patches/"

With:

board/qemu/riscv32-virt/patches/
????????? linux
    ????????? 0001-Revert-riscv-Use-latest-system-call-ABI.patch

This patch gets properly applied when the Linux kernel is built, but
not when the linux-headers package is built.

This commit fixes that by making sure patches stored in the "linux"
BR2_GLOBAL_PATCH_DIR subdirectory are taken into account.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6f79cebe6a7152f2bb83af01a8909c4e33168d45)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/linux-headers.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 95432ade83..46f270a0e1 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -60,7 +60,8 @@ endif # LINUX_HEADERS_CUSTOM_TARBALL
 # Apply any necessary patches if we are using the headers from a kernel
 # build.
 ifeq ($(BR2_KERNEL_HEADERS_AS_KERNEL),y)
-LINUX_HEADERS_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
+LINUX_HEADERS_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH)) \
+	$(wildcard $(addsuffix /linux,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))))
 
 # We rely on the generic package infrastructure to download and apply
 # remote patches (downloaded from ftp, http or https). For local
