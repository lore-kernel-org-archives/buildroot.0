From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 08:19:13 +0200
Subject: [Buildroot] [git commit] webkitgtk24: depends on gcc >= 4.8
Message-ID: <20150806061935.483EC81E98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3517f72e0025e6af69c084283b50c23bc4688bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Webkit 2.4.x depends on gcc being >= 4.8.x so use the new
BR2_TOOLCHAIN_GCC_AT_LEAST_X_Y knob and drop the manual x86* external
toolchain exclusions.
Follow up in the midori package as well.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/midori/Config.in      |    6 ++++--
 package/webkitgtk24/Config.in |   11 +++--------
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/package/midori/Config.in b/package/midori/Config.in
index b3ab8a9..11a2806 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -1,7 +1,8 @@
-comment "midori needs libgtk2 and a toolchain w/ C++, wchar, NPTL"
+comment "midori needs libgtk2 and a toolchain w/ C++, wchar, NPTL, gcc >= 4.8"
 	depends on BR2_PACKAGE_WEBKITGTK24_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_PACKAGE_LIBGTK2
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_PACKAGE_LIBGTK2 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 config BR2_PACKAGE_MIDORI
 	bool "midori"
@@ -16,6 +17,7 @@ config BR2_PACKAGE_MIDORI
 	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk24
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # webkitgtk24
 	depends on BR2_USE_WCHAR # webkitgtk24
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # webkitgtk24
 	depends on BR2_PACKAGE_WEBKITGTK24_ARCH_SUPPORTS
 	help
 	  Midori is a lightweight web browser based on WebKit
diff --git a/package/webkitgtk24/Config.in b/package/webkitgtk24/Config.in
index d8c5e93..0a30bac 100644
--- a/package/webkitgtk24/Config.in
+++ b/package/webkitgtk24/Config.in
@@ -2,25 +2,19 @@ config BR2_PACKAGE_WEBKITGTK24_ARCH_SUPPORTS
 	bool
 	# ARM needs BLX, so v5t+, BE completely untested so disabled
 	default y if BR2_arm && !BR2_ARM_CPU_ARMV4
-	# i386 / x86_64 external toolchains have issues and old gcc versions
-	# https://bugs.webkit.org/show_bug.cgi?id=132231
-	# https://stackoverflow.com/questions/9140019/yield-is-not-a-member-of-stdthis-thread
 	default y if BR2_i386 || BR2_x86_64
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	# Disabled on MIPS big endian due to sigbus
 	default y if BR2_mipsel || BR2_mips64el
 	# Disabled on PowerPC pending runtime testing
 	# Disabled on SuperH because of segfault
 	depends on BR2_USE_MMU # libglib2
 
-comment "webkitgtk24 needs libgtk2 and a toolchain w/ C++, wchar, NPTL"
+comment "webkitgtk24 needs libgtk2 and a toolchain w/ C++, wchar, NPTL, gcc >=4.8"
 	depends on BR2_PACKAGE_WEBKITGTK24_ARCH_SUPPORTS
 	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_PACKAGE_LIBGTK2 || !BR2_PACKAGE_XORG7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_USE_WCHAR
+		|| !BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_WEBKITGTK24
@@ -28,6 +22,7 @@ config BR2_PACKAGE_WEBKITGTK24
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on (BR2_PACKAGE_LIBGTK2 && BR2_PACKAGE_XORG7)
 	depends on BR2_PACKAGE_WEBKITGTK24_ARCH_SUPPORTS
 	depends on BR2_ARCH_HAS_ATOMICS
