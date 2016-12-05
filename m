From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Mon, 5 Dec 2016 21:38:22 +0530
Subject: [Buildroot] [PATCH] efivar: not available for static builds
Message-ID: <1480954102-27621-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

efivar uses dlfcn.h which is not available in static builds
configuration. Also propagate dependency to efibootmgr. This commit
also does s/requires/needs/ in comment while at it.

Fixes:
  http://autobuild.buildroot.net/results/ab3/ab32ccacfac2e65e1fcb307058d06c3d0122979d/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/efibootmgr/Config.in | 6 ++++--
 package/efivar/Config.in     | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/efibootmgr/Config.in b/package/efibootmgr/Config.in
index 8b29938..cd4bda1 100644
--- a/package/efibootmgr/Config.in
+++ b/package/efibootmgr/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_EFIBOOTMGR
 	bool "efibootmgr"
+	depends on !BR2_STATIC_LIBS # efivar
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # efivar
 	depends on !BR2_TOOLCHAIN_USES_MUSL # efivar
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # efivar
@@ -15,8 +16,9 @@ config BR2_PACKAGE_EFIBOOTMGR
 
 	  https://github.com/rhinstaller/efibootmgr
 
-comment "efibootmgr requires a glibc or uClibc toolchain w/ headers >= 3.12, gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
+comment "efibootmgr needs a glibc or uClibc toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9"
+	depends on BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
 		BR2_TOOLCHAIN_USES_MUSL || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS && \
diff --git a/package/efivar/Config.in b/package/efivar/Config.in
index 1bdb6ca..a97c766 100644
--- a/package/efivar/Config.in
+++ b/package/efivar/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_EFIVAR
 	bool "efivar"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # linux/nvme.h
 	# linux/nvme.h has been renamed to linux/nvme_ioctl.h since 4.4,
 	# and the efivar source handles that situation. However, some
@@ -18,8 +19,9 @@ config BR2_PACKAGE_EFIVAR
 
 	  https://github.com/rhinstaller/efivar
 
-comment "efivar requires a glibc or uClibc toolchain w/ headers >= 3.12, gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
+comment "efivar needs a glibc or uClibc toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9"
+	depends on BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
 		BR2_TOOLCHAIN_USES_MUSL || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS && \
-- 
2.6.2
