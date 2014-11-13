From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 13 Nov 2014 22:36:56 +0100
Subject: [Buildroot] [PATCH] botan: disable for static builds
Message-ID: <1415914616-26343-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

it tries to include <dlfcn.h>

see http://autobuild.buildroot.net/results/2d1/2d1563e253b669b45c9df449c5b3a750c04a43dc/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/botan/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index 733dc89..c82a77f 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -10,11 +10,12 @@ config BR2_PACKAGE_BOTAN
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
+	depends on !BR2_PREFER_STATIC_LIB # dlfcn.h
 	help
 	  Botan is a crypto library for C++
 
 	  http://botan.randombit.net
 
-comment "botan needs a toolchain w/ C++, threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+comment "botan needs a toolchain w/ C++, threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || BR2_PREFER_STATIC_LIB
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
-- 
1.9.1
