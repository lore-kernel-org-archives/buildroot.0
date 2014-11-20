From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 20 Nov 2014 15:21:16 +0200
Subject: [Buildroot] [PATCH] canfestival: disable static build
Message-ID: <f34a48cc344f0502ef923c31ad505a07c22a70bf.1416489676.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

canfestival doesn't really support static build. The configure script accepts
the --disable-dll parameter that should in theory allow a static build. In
practice this options is not well tested, as it causes the build to fails in
various places.

Fixes:
http://autobuild.buildroot.net/results/29f/29fd3e550937f48e2270149a3d44cfb8bcf5c16a/

Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/canfestival/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/canfestival/Config.in b/package/canfestival/Config.in
index dd0db3efd54d..d2bfaca3cea2 100644
--- a/package/canfestival/Config.in
+++ b/package/canfestival/Config.in
@@ -2,14 +2,15 @@ config BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS
 	bool
 	default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm
 
-comment "canfestival needs a toolchain w/ threads"
+comment "canfestival needs a toolchain w/ threads and dynamic library"
 	depends on BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
 
 config BR2_PACKAGE_CANFESTIVAL
 	bool "canfestival"
 	depends on BR2_PACKAGE_CANFESTIVAL_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  CanFestival is an OpenSource CANOpen framework, licensed under
 	  LGPLv2.1 and GPLv2 for some drivers (virtual_kernel, lincan and
-- 
2.1.3
