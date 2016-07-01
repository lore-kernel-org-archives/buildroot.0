From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 16:31:29 +0200
Subject: [Buildroot] [git commit] efivar: depends on target gcc >= 4.7
Message-ID: <20160701143349.05F2D81D35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=481310c9ad65e1dd5b25986919d06473112e1b50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The efivar internal build system uses flags such as -std=gnu11 ,
-Wmaybe-uninitialized , -flto which are available in gcc >= 4.7 only.
These flags are passed both to target build and to build a host tool.
For the host part, this has been worked around by overriding
'gcc_flags', but doing that for the target would remove all flags that
upstream intended for the target build.

Buildroot doesn't support building gcc 4.6 in its own toolchain anymore
but it's possible to use an external toolchain with gcc 4.6 which would
be unable to build this package.

This patch adds a limitation on toolchains with target gcc >= 4.7 to
make sure that the flags are available in the chosen toolchain.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efibootmgr/Config.in | 6 ++++--
 package/efivar/Config.in     | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/efibootmgr/Config.in b/package/efibootmgr/Config.in
index 758c01f..9e501f6 100644
--- a/package/efibootmgr/Config.in
+++ b/package/efibootmgr/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_EFIBOOTMGR
 	bool "efibootmgr"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # efivar
 	depends on BR2_TOOLCHAIN_USES_GLIBC # efivar
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # efivar
 	select BR2_PACKAGE_EFIVAR
 	help
 	  A Linux user-space application to modify the Intel Extensible
@@ -11,6 +12,7 @@ config BR2_PACKAGE_EFIBOOTMGR
 
 	  https://github.com/rhinstaller/efibootmgr
 
-comment "efibootmgr requires a glibc toolchain w/ headers >= 3.12"
+comment "efibootmgr requires a glibc toolchain w/ headers >= 3.12, gcc >= 4.7"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
-		!BR2_TOOLCHAIN_USES_GLIBC
+		!BR2_TOOLCHAIN_USES_GLIBC || \\
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/efivar/Config.in b/package/efivar/Config.in
index 9cd1f19..5342fa4 100644
--- a/package/efivar/Config.in
+++ b/package/efivar/Config.in
@@ -4,12 +4,14 @@ config BR2_PACKAGE_EFIVAR
 	# doesn't build with uclibc due to lack of uchar.h
 	# doesn't build with musl due to lack of __bswap_constant_16
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	select BR2_PACKAGE_POPT
 	help
 	  Tools and libraries to manipulate EFI variables
 
 	  https://github.com/rhinstaller/efivar
 
-comment "efivar requires a glibc toolchain w/ headers >= 3.12"
+comment "efivar requires a glibc toolchain w/ headers >= 3.12, gcc >= 4.7"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
-		!BR2_TOOLCHAIN_USES_GLIBC
+		!BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
