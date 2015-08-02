From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun,  2 Aug 2015 11:07:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/nodejs: disable for static build
Message-ID: <1438506439-3096-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nodejs requires dlopen(), etc.

Fixes:
http://autobuild.buildroot.net/results/87d/87dab0186abd7b2737a56b2f939f3aba294e8772/
http://autobuild.buildroot.net/results/be1/be1010a3a31642d49ec3a118858c77fed2f762b8/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/nodejs/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index c5ec792..69063fc 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -8,17 +8,18 @@ config BR2_PACKAGE_NODEJS
 	depends on !BR2_ARM_CPU_ARMV4
 	# uses fork()
 	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS # dlopen, etc.
 	select BR2_PACKAGE_ZLIB
 	help
 	  Event-driven I/O server-side JavaScript environment based on V8.
 
 	  http://nodejs.org/
 
-comment "nodejs needs a toolchain w/ C++, threads"
+comment "nodejs needs a toolchain w/ C++, dynamic library, threads"
 	depends on BR2_USE_MMU
 	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
 	depends on !BR2_ARM_CPU_ARMV4
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 
 if BR2_PACKAGE_NODEJS
 
-- 
2.5.0
