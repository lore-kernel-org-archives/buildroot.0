From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2016 09:22:00 +0100
Subject: [Buildroot] [git commit] mesa3d-demos: select libglew/libglu if
	needed
Message-ID: <20160105082218.BBDAA82718@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7dda4cff6e8aef36f507f254cac4f19b2abacf0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/4b1/4b16c9797c653c248725a55d9b8eafc4634b968c/build-end.log

libglew/libglu are added to _DEPENDENCIES for X11+GL, but not selected at
the kconfig level.

While we're at it, correct the dependencies for the X11 selects as well
(only used if GL is available).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-demos/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d-demos/Config.in b/package/mesa3d-demos/Config.in
index d63c47b..f22c0de 100644
--- a/package/mesa3d-demos/Config.in
+++ b/package/mesa3d-demos/Config.in
@@ -1,7 +1,9 @@
 config BR2_PACKAGE_MESA3D_DEMOS
 	bool "mesa3d-demos"
-	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBGLEW if BR2_PACKAGE_XORG7 && BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_XORG7 && BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7 && BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7 && BR2_PACKAGE_HAS_LIBGL
 	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES \
 		|| BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBOPENVG
 	help
