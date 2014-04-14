From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 22:47:06 +0200
Subject: [Buildroot] [git commit] fswebcam: disable static build
Message-ID: <20140414204922.ACCCE9C786@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fd212ffebb25516fe9a1db7a3dae0c8e895089d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fswebcam doesn't play nicely with static build as it doesn't track its
indirect dependencies in link time. Fixing this requires tracking all indirect
optional dependencies, which is tedious and error prone. Just disable static
build.

This build failure didn't show on the autobuilder for some reason.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fswebcam/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/fswebcam/Config.in b/package/fswebcam/Config.in
index a894d3b..03ab38f 100644
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
