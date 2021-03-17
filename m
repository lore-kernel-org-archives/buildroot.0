From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 17 Mar 2021 17:43:45 +0100
Subject: [Buildroot] [PATCH 1/2] package/libcamera: disable package affected
 by binutils bug 27597
In-Reply-To: <20210314230738.1c19d335@windsurf.home>
References: <20210314230738.1c19d335@windsurf.home>
Message-ID: <20210317164346.1917962-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is affected by binutils bug 27597 and no work around has
been found, so let's disable it if
BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597=y.

Fixes:
http://autobuild.buildroot.net/results/8ac/8ac599392f773eecff4773393ef0d0232a22f372/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libcamera/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index b9c243084e..3df9c68feb 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -12,6 +12,7 @@ menuconfig BR2_PACKAGE_LIBCAMERA
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_WCHAR # gnutls
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBCAMERA_PIPELINE_UVCVIDEO if !BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
 	help
@@ -73,4 +74,5 @@ endif # BR2_PACKAGE_LIBCAMERA
 comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7"
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
-- 
2.25.1
