From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Oct 2018 22:22:24 +0200
Subject: [Buildroot] [PATCH] sedutil: disable for MIPS Codesourcery toolchain
Message-ID: <20181013202225.22359-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/005/00588d7cd37ba9620f01e970bf328540527558fc/
http://autobuild.buildroot.net/results/2fc/2fc2d0111e467671ee4cec427234a9b2aada1cc9/

Linux 4.4 moved the NVME ioctl definitions from nvme.h to nvme_ioctl.h in
commit 9d99a8dda154 (nvme: move hardware structures out of the uapi version
of nvme.h), but nvme_ioctl.h was only exported to user space in 4.4.4 in
commit 7712c014b16f64d3 (uapi: update install list after nvme.h rename).

sedutil contains the needed logic to look at either nvme.h or nvme_ioctl.h,
but as the ioctl definitions are not exported in 4.4..4.4.3, it fails to
build.

The MIPS Codesourcery toolchain uses 4.4.1 kernel headers, so disable the
sedutil package if this toolchain is used.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sedutil/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sedutil/Config.in b/package/sedutil/Config.in
index fbfcf0dd54..f3452b60fb 100644
--- a/package/sedutil/Config.in
+++ b/package/sedutil/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_SEDUTIL
 	depends on BR2_PACKAGE_SEDUTIL_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # linux/nvme.h
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS # 4.4.1 headers
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  The Drive Trust Alliance Self Encrypting Drive Utility,
@@ -22,6 +23,7 @@ config BR2_PACKAGE_SEDUTIL
 
 comment "sedutil needs a toolchain w/ C++, gcc >= 4.8, headers >= 3.12"
 	depends on BR2_PACKAGE_SEDUTIL_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
-- 
2.11.0
