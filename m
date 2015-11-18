From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Nov 2015 23:08:58 +0100
Subject: [Buildroot] [git commit] directfb: disable for musl toolchains
Message-ID: <20151118222838.062EB81EEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa4ae3e98dd53258a307ba83ef7c24e518db3556
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/548/548bf7b800a946e97135c0ba66363f388e517d6f/

Directfb doesn't build with musl, and upstream seems dead - So just disable
it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/directfb/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 548f602..8c13d30 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_DIRECTFB
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+	depends on !BR2_TOOLCHAIN_USES_MUSL # sigval_t issue
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_ZLIB
 	help
@@ -164,5 +165,6 @@ config BR2_PACKAGE_DIRECTFB_TESTS
 
 endif # BR2_PACKAGE_DIRECTFB
 
-comment "directfb needs a toolchain w/ C++, threads, gcc >= 4.5"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+comment "directfb needs a (e)glibc or uClibc toolchain w/ C++, threads, gcc >= 4.5"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || BR2_TOOLCHAIN_USES_MUSL
