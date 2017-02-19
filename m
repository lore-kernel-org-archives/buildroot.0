From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Feb 2017 22:58:46 +0100
Subject: [Buildroot] [git commit] package/glmark2: needs gcc >= 4.9 for C++14
Message-ID: <20170219220107.205AE82116@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbdf1ae69eb91b2d1d19c93fff530c62849cb778
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.org/results/511/51162285d197deabb63727c19cdf5512b0e68f29/

[Peter: also add libstdcpp dependency]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glmark2/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
index c8380b1..addd7a9 100644
--- a/package/glmark2/Config.in
+++ b/package/glmark2/Config.in
@@ -10,11 +10,17 @@ config BR2_PACKAGE_GLMARK2_GL
 	depends on BR2_PACKAGE_HAS_LIBGL
 	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER
 
+comment "glmark2 needs a toolchain w/ C++, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 comment "glmark2 needs an OpenGL or an openGL ES and EGL backend provided by mesa3d"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 && BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_PACKAGE_GLMARK2_GL && !BR2_PACKAGE_GLMARK2_EGL_GLES
 
 config BR2_PACKAGE_GLMARK2
 	bool "glmark2"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	depends on BR2_PACKAGE_GLMARK2_GL || BR2_PACKAGE_GLMARK2_EGL_GLES
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBPNG
