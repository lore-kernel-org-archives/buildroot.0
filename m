From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Sep 2015 11:58:56 +0200
Subject: [Buildroot] [git commit] package/clapack: fix comments
Message-ID: <20150904100014.37B9881EDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d58d667acaebdd8fac0d59f1d40e4a0a3bae5a58
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Provide appropriate comments for the powerpc and !powerpc cases.

Adapt armadillo's comments accordingly.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/armadillo/Config.in |   12 ++++++++----
 package/clapack/Config.in   |    8 ++++++--
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
index e49997d..18bf750 100644
--- a/package/armadillo/Config.in
+++ b/package/armadillo/Config.in
@@ -1,14 +1,18 @@
 comment "armadillo needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) # clapack
-	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC) # clapack
-	depends on !BR2_bfin # clapack
+	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el)
+	depends on !BR2_powerpc
+	depends on !BR2_bfin
+
+comment "armadillo needs an (e)glibc toolchain w/ C++"
+	depends on BR2_powerpc
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_PACKAGE_ARMADILLO
 	bool "armadillo"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) # clapack
-	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC) # clapack
+	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC # clapack
 	depends on !BR2_bfin # clapack
 	select BR2_PACKAGE_CLAPACK
 	help
diff --git a/package/clapack/Config.in b/package/clapack/Config.in
index f37752a..2257524 100644
--- a/package/clapack/Config.in
+++ b/package/clapack/Config.in
@@ -1,9 +1,13 @@
+comment "clapack needs an (e)glibc toolchain"
+	depends on BR2_powerpc
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
 config BR2_PACKAGE_CLAPACK
 	bool "cblas/clapack"
 	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el)
 	# _fpu_control is used on PowerPC, but not available with
-	# uClibc
-	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
+	# uClibc or musl
+	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC
 	# disable clapack on blackfin, it triggers "undefined symbol" failure
 	# because of the "_" symbol prefix:
 	# http://autobuild.buildroot.net/results/a28df0ba10803e6e54c2f8160bbd8190cba4d690/
