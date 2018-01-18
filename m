From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jan 2018 12:07:38 +0100
Subject: [Buildroot] [git commit] cups-filters: needs at least gcc 4.8 for
 C++11 features
Message-ID: <20180118110924.CB7E683E23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ef807aba7a74ef57d6db7f5c3718d21df9db03e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With gcc 4.7, it fails to build with:

checking whether /home/buildroot/build/instance-0/output/host/bin/powerpc-ctng_e500v2-linux-gnuspe-g++ supports C++11 features by default... no
checking whether /home/buildroot/build/instance-0/output/host/bin/powerpc-ctng_e500v2-linux-gnuspe-g++ supports C++11 features with -std=c++11... no
checking whether /home/buildroot/build/instance-0/output/host/bin/powerpc-ctng_e500v2-linux-gnuspe-g++ supports C++11 features with +std=c++11... no
checking whether /home/buildroot/build/instance-0/output/host/bin/powerpc-ctng_e500v2-linux-gnuspe-g++ supports C++11 features with -h std=c++11... no
checking whether /home/buildroot/build/instance-0/output/host/bin/powerpc-ctng_e500v2-linux-gnuspe-g++ supports C++11 features with -std=c++0x... no
checking whether /home/buildroot/build/instance-0/output/host/bin/powerpc-ctng_e500v2-linux-gnuspe-g++ supports C++11 features with +std=c++0x... no
checking whether /home/buildroot/build/instance-0/output/host/bin/powerpc-ctng_e500v2-linux-gnuspe-g++ supports C++11 features with -h std=c++0x... no
configure: error: *** A compiler with support for C++11 language features is required.

Fixes:

  http://autobuild.buildroot.net/results/788c1a4bbc8ec90b5cdd94c107c784df21869f6c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cups-filters/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/cups-filters/Config.in b/package/cups-filters/Config.in
index 623ff71..5badf0e 100644
--- a/package/cups-filters/Config.in
+++ b/package/cups-filters/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_CUPS_FILTERS
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_PACKAGE_CUPS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
@@ -30,7 +31,8 @@ config BR2_PACKAGE_CUPS_FILTERS
 
 	  http://www.linuxfoundation.org/collaborate/workgroups/openprinting/cups-filters
 
-comment "cups-filters needs a toolchain w/ wchar, C++, threads and dynamic library"
+comment "cups-filters needs a toolchain w/ wchar, C++, threads and dynamic library, gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_USE_WCHAR || BR2_STATIC_LIBS
+		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
