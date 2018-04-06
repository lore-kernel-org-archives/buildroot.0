From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Apr 2018 19:55:25 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] toolchain: fix detection
 of SSP support
Message-ID: <20180407175148.43C2087BDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92b066b7cea8ac6fa3f8232cfe4cf36cf6a0d7f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

GCC issues a warning message if -fstack-protector is passed but SSP is
not available, so in order to force the compilation to fail we must also
pass -Werror.

All external toolchains were verified. The only one whose configuration
incorrectly selected BR2_TOOLCHAIN_HAS_SSP was CodeSourcery NIOSII.

Fixes:
  http://autobuild.buildroot.net/results/ce8fe8ac9cf0db01ae15d476ea714ff176965cfb
  http://autobuild.buildroot.net/results/09ce8f05e28c0219f499ce55130e896cae0c8b45

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c8680956819fae8776d7bd6d1f0e67a7b6436672)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/helpers.mk                                                    | 2 +-
 .../toolchain-external/toolchain-external-codesourcery-niosII/Config.in | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 63ef6fb4b0..1792286add 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -421,7 +421,7 @@ check_unusable_toolchain = \
 #
 check_toolchain_ssp = \
 	__CROSS_CC=$(strip $1) ; \
-	__HAS_SSP=`echo 'void main(){}' | $${__CROSS_CC} -fstack-protector -x c - -o $(BUILD_DIR)/.br-toolchain-test.tmp >/dev/null 2>&1 && echo y` ; \
+	__HAS_SSP=`echo 'void main(){}' | $${__CROSS_CC} -Werror -fstack-protector -x c - -o $(BUILD_DIR)/.br-toolchain-test.tmp >/dev/null 2>&1 && echo y` ; \
 	if [ "$(BR2_TOOLCHAIN_HAS_SSP)" != "y" -a "$${__HAS_SSP}" = "y" ] ; then \
 		echo "SSP support available in this toolchain, please enable BR2_TOOLCHAIN_EXTERNAL_HAS_SSP" ; \
 		exit 1 ; \
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
index 7563995eb6..4ac9c95c86 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
@@ -5,7 +5,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
