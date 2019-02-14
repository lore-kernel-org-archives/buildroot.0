From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Feb 2019 21:46:22 +0100
Subject: [Buildroot] [git commit] package/efivar: needs host gcc >= 4.8
Message-ID: <20190214205205.F1D3488FEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2135e869a04e95da2372074884eb3f55fd728352
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The efivar code compiled for the host machine uses
__builtin_bswap16(), which is only available starting from gcc 4.8:

  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52624

So let's add a dependency on host gcc >= 4.8 to efivar and its unique
reverse dependency, efibootmgr.

Fixes:

  http://autobuild.buildroot.net/results/48ba906bb6f4dc0c8af43ec11be64f7168dd62fd/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efibootmgr/Config.in | 6 ++++--
 package/efivar/Config.in     | 7 +++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/efibootmgr/Config.in b/package/efibootmgr/Config.in
index d31f9b13ee..6644d26b6c 100644
--- a/package/efibootmgr/Config.in
+++ b/package/efibootmgr/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_EFIBOOTMGR
 	depends on !BR2_STATIC_LIBS # efivar
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # efivar
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # efivar
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # efivar
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	select BR2_PACKAGE_EFIVAR
 	select BR2_PACKAGE_POPT
@@ -15,9 +16,10 @@ config BR2_PACKAGE_EFIBOOTMGR
 
 	  https://github.com/rhboot/efibootmgr
 
-comment "efibootmgr needs a glibc or uClibc toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9"
+comment "efibootmgr needs a glibc or uClibc toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9, host gcc >= 4.8"
 	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_8
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
diff --git a/package/efivar/Config.in b/package/efivar/Config.in
index 74f2bb5abb..545962ed70 100644
--- a/package/efivar/Config.in
+++ b/package/efivar/Config.in
@@ -17,14 +17,17 @@ config BR2_PACKAGE_EFIVAR
 	# toolchains.
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	# needs __builtin_bswap16
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
 	help
 	  Tools and libraries to manipulate EFI variables
 
 	  https://github.com/rhboot/efivar
 
-comment "efivar needs a toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9"
+comment "efivar needs a toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9, host gcc >= 4.8"
 	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_8
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
