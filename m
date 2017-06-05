From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:51:52 +0200
Subject: [Buildroot] [git commit] package/exiv2: needs threads
Message-ID: <20170605095211.D21828256E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1fe1698d6e77cf451cb082b836138fdb648cdc44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Exiv2 itself depends on threads, not only with xmp support.

Follow-up patch for http://patchwork.ozlabs.org/patch/770813/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/exiv2/Config.in | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/exiv2/Config.in b/package/exiv2/Config.in
index a94e5cd..7358283 100644
--- a/package/exiv2/Config.in
+++ b/package/exiv2/Config.in
@@ -1,11 +1,12 @@
-comment "exiv2 needs a toolchain w/ C++, wchar, dynamic library"
+comment "exiv2 needs a toolchain w/ C++, wchar, dynamic library, threads"
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_USE_WCHAR
+		|| !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_EXIV2
 	bool "exiv2"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	help
 	  Exiv2 is a C++ library and a command line utility to manage
@@ -39,14 +40,10 @@ config BR2_PACKAGE_EXIV2_PNG
 
 config BR2_PACKAGE_EXIV2_XMP
 	bool "XMP support"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_EXPAT
 	help
 	  Build with XMP support
 
-comment "xmp support needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
 config BR2_PACKAGE_EXIV2_LENSDATA
 	bool "Nikon lens name database"
 	depends on !BR2_PACKAGE_EXIV2_COMMERCIAL
