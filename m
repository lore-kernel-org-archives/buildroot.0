From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Oct 2014 18:41:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcap: Fix build error with kernel
	headers < 3.6
Message-ID: <1414345296-19869-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/cce/cceb1ccacec36fb7ef41bb7cdb13b3014813b599/

XATTR_NAME_CAPS appears in kernel headers since 3.7:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/log/include/uapi/linux/xattr.h?id=v3.7

Before it was an internal define of the kernel:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/include/linux/xattr.h?id=607ca46e97a1b6594b29647d98a32d545c24bdff

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libcap/Config.in |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libcap/Config.in b/package/libcap/Config.in
index 5b0c827..a019928 100644
--- a/package/libcap/Config.in
+++ b/package/libcap/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBCAP
 	bool "libcap"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	help
 	  This library implements the user-space interfaces to the
 	  POSIX 1003.1e capabilities available in Linux kernels. These
@@ -22,3 +23,6 @@ config BR2_PACKAGE_LIBCAP_TOOLS
 	  CONFIG_EXT2_FS_XATTR and CONFIG_EXT2_FS_SECURITY for ext2).
 
 endif
+
+comment "libcap needs headers >= 3.7"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
-- 
1.7.10.4
