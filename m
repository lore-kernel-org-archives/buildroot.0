From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 26 Jun 2016 23:36:27 +0200
Subject: [Buildroot] [PATCH v2 1/1] efivar: depends on target gcc >= 4.7
Message-ID: <20160626213627.14298-1-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
Changes v1 -> v2:
  - propagated gcc >= 4.7 dependency to efibootmgr (pointed out by
  Thomas Petazzoni)
---
 package/efibootmgr/Config.in | 6 ++++--
 package/efivar/Config.in     | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/efibootmgr/Config.in b/package/efibootmgr/Config.in
index cb1b18e..9e501f6 100644
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
 
-comment "efibootmgr requires an (e)glibc toolchain w/ headers >= 3.12"
+comment "efibootmgr requires a glibc toolchain w/ headers >= 3.12, gcc >= 4.7"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
-		!BR2_TOOLCHAIN_USES_GLIBC
+		!BR2_TOOLCHAIN_USES_GLIBC || \\
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/efivar/Config.in b/package/efivar/Config.in
index c507584..5342fa4 100644
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
 
-comment "efivar requires an (e)glibc toolchain w/ headers >= 3.12"
+comment "efivar requires a glibc toolchain w/ headers >= 3.12, gcc >= 4.7"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
-		!BR2_TOOLCHAIN_USES_GLIBC
+		!BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
-- 
2.9.0
