From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 22:38:19 +0200
Subject: [Buildroot] [git commit] package/proj: needs C++11
Message-ID: <20191008203255.DB9E88407C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=807ee5be79bbb2c14f45dcd7c3f6c4b2944f9fdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

proj needs C++11 since version 5.2.0 and
https://github.com/OSGeo/PROJ/commit/29051766975d471c4eff9f7b3137752234cf1a4c

Fixes:
 - http://autobuild.buildroot.org/results/af3451a37b5f6c81d4b19edfe84dbed09e1af0e9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgeotiff/Config.in | 7 +++++--
 package/proj/Config.in       | 7 +++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/libgeotiff/Config.in b/package/libgeotiff/Config.in
index 60ca4115d9..6ac8a51f7c 100644
--- a/package/libgeotiff/Config.in
+++ b/package/libgeotiff/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBGEOTIFF
 	bool "libgeotiff"
+	depends on BR2_INSTALL_LIBSTDCPP # proj
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # proj
 	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
 	select BR2_PACKAGE_PROJ
 	select BR2_PACKAGE_TIFF
@@ -9,5 +11,6 @@ config BR2_PACKAGE_LIBGEOTIFF
 
 	  https://github.com/OSGeo/libgeotiff
 
-comment "libgeotiff needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "libgeotiff needs a toolchain w/ C++, gcc >= 4.7, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/proj/Config.in b/package/proj/Config.in
index 4880d3f2cd..ced386f465 100644
--- a/package/proj/Config.in
+++ b/package/proj/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PROJ
 	bool "proj"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_SQLITE
 	help
@@ -11,5 +13,6 @@ config BR2_PACKAGE_PROJ
 
 	  http://proj4.org/
 
-comment "proj needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "proj needs a toolchain w/ C++, gcc >= 4.7, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_HAS_THREADS
