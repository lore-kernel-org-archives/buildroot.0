From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 31 Jan 2019 21:39:06 +0100
Subject: [Buildroot] [PATCH] package/clapack+armadillo: re-enable on MIPS
Message-ID: <20190131203906.15410-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Commit d2b52cebf3b8b4a922a54d38a44a8a183406c5f1 disabled clapack on MIPS
platforms, to fix an autobuild failure (unfortunately, the results are no
longer available). The argument was:

    "Disable this package for MIPS because it needs IRIX headers and
    libraries."

Nevertheless, today compilation on MIPS seems to work fine. Testing was done
with test-pkg (armadillo depends on clapack):

$ echo "BR2_PACKAGE_ARMADILLO=y" > config.snippet;
$ utils/test-pkg -p armadillo -a -c config.snippet
                 br-mips32r6-el-hf-glibc [1/8]: OK
                      br-mips64-n64-full [2/8]: OK
                 br-mips64r6-el-hf-glibc [3/8]: OK
                      br-mipsel-o32-full [4/8]: OK
             mips64el-ctng_n32-linux-gnu [5/8]: OK
             mips64el-ctng_n64-linux-gnu [6/8]: OK
                         sourcery-mips64 [7/8]: OK
                           sourcery-mips [8/8]: OK
8 builds, 0 skipped, 0 build failed, 0 legal-info failed

Manual build tests were also done for mips32r2 with gcc 4.9.x and gcc 7.x,
and for M5150 with gcc 7.x (Buildroot-built toolchains in these three
cases).

Also building and running on Octeon III, using the toolchain provided by
Cavium Networks / Marvell, works fine.

Not seeing any problem (but also not understanding the original problem),
re-enable clapack (and armadillo) on MIPS.  If any problems would pop up in
the future, they should be investigated in detail and a more fine-grained
solution should be taken than disabling on MIPS altogether.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/armadillo/Config.in | 2 --
 package/clapack/Config.in   | 1 -
 2 files changed, 3 deletions(-)

diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
index 47c7cd9ffd..b2b61a3233 100644
--- a/package/armadillo/Config.in
+++ b/package/armadillo/Config.in
@@ -1,6 +1,5 @@
 comment "armadillo needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el)
 	depends on !BR2_powerpc
 	depends on !BR2_m68k_cf
 
@@ -11,7 +10,6 @@ comment "armadillo needs a glibc toolchain w/ C++"
 config BR2_PACKAGE_ARMADILLO
 	bool "armadillo"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) # clapack
 	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC # clapack
 	depends on !BR2_m68k_cf # clapack
 	select BR2_PACKAGE_CLAPACK
diff --git a/package/clapack/Config.in b/package/clapack/Config.in
index af7834d985..a912eb6c91 100644
--- a/package/clapack/Config.in
+++ b/package/clapack/Config.in
@@ -4,7 +4,6 @@ comment "clapack needs a glibc toolchain"
 
 config BR2_PACKAGE_CLAPACK
 	bool "cblas/clapack"
-	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el)
 	# _fpu_control is used on PowerPC, but not available with
 	# uClibc or musl
 	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC
-- 
2.19.2
