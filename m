From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 13 Apr 2014 09:44:16 +0300
Subject: [Buildroot] [PATCH 1/2] fswebcam: disable static build
Message-ID: <ca4b1997af710e6939f0105cc41a6bc9d0f6c849.1397371457.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fswebcam doesn't play nicely with static build as it doesn't track its
indirect dependencies in link time. Fixing this requires tracking all indirect
optional dependencies, which is tedious and error prone. Just disable static
build.

This build failure didn't show on the autobuilder for some reason.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/fswebcam/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/fswebcam/Config.in b/package/fswebcam/Config.in
index a894d3b8ace4..03ab38f9f1bb 100644
--- a/package/fswebcam/Config.in
+++ b/package/fswebcam/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_FSWEBCAM
 	bool "fswebcam"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_PACKAGE_GD
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_JPEG
@@ -15,3 +16,7 @@ config BR2_PACKAGE_FSWEBCAM
 	  scp.
 
 	  http://www.firestorm.cx/fswebcam/
+
+comment "fswebcam needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_PREFER_STATIC_LIB
-- 
1.9.1
