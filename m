From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 14:00:01 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/efl: fix unmet
	dependencies
Message-ID: <20170515125327.8129080649@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d21206802b8bf1cad26543b93fe72ef867fde1b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

EFL's elput selects libinput but forgot to propagate its dependencies.
Which requires they be propagated further to a second sub-option, then
to a third one.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@openwide.fr>
[Thomas: fix typoes.]
[Peter: fix more typoes]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 31bd2b46a83f6009518935e11b4136668bd4d330)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efl/Config.in | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 5e89af6..a91609d 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -179,12 +179,14 @@ config BR2_PACKAGE_EFL_WAYLAND
 	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # Evas DRM Engine
 	depends on BR2_PACKAGE_EFL_EEZE # efl drm
 	depends on BR2_PACKAGE_EFL_OPENGLES # OpenGL ES with EGL support only
+	depends on BR2_ENABLE_LOCALE # efl-drm <- efl-elput <- libinput
 	select BR2_PACKAGE_EFL_DRM
 
-comment "Wayland support needs udev /dev management (eeze) and OpenGL ES w/ EGL, threads"
+comment "Wayland support needs udev /dev management (eeze), OpenGL ES w/ EGL, threads, locales"
 	depends on BR2_PACKAGE_WAYLAND
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_MESA3D_OPENGL_EGL \
-		|| !BR2_PACKAGE_EFL_OPENGLES || !BR2_PACKAGE_EFL_EEZE
+		|| !BR2_PACKAGE_EFL_OPENGLES || !BR2_PACKAGE_EFL_EEZE \
+		|| !BR2_ENABLE_LOCALE
 
 choice
 	bool "OpenGL support"
@@ -216,6 +218,7 @@ endchoice # OpenGL support
 
 config BR2_PACKAGE_EFL_ELPUT
 	bool "Elput"
+	depends on BR2_ENABLE_LOCALE # libinput
 	depends on BR2_PACKAGE_EFL_EEZE
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBXKBCOMMON
@@ -225,23 +228,24 @@ config BR2_PACKAGE_EFL_ELPUT
 	  ecore_drm, etc) to handle interfacing with libinput without
 	  having to duplicate the code in each subsystem.
 
-comment "Elput support needs udev /dev management (eeze)"
-	depends on !BR2_PACKAGE_EFL_EEZE
+comment "Elput support needs udev /dev management (eeze), locales"
+	depends on !BR2_PACKAGE_EFL_EEZE || !BR2_ENABLE_LOCALE
 
 config BR2_PACKAGE_EFL_DRM
 	bool "Evas DRM Engine"
 	depends on BR2_PACKAGE_EFL_EEZE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
 	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # require libgbm from mesa3d
+	depends on BR2_ENABLE_LOCALE # efl-elput <- libinput
 	select BR2_PACKAGE_EFL_ELPUT
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBXKBCOMMON
 	help
 	  This option enable building support for the Evas DRM Engine.
 
-comment "Evas DRM Engine needs udev /dev management (eeze) and mesa3d w/ EGL support, threads"
+comment "Evas DRM Engine needs udev /dev management (eeze), mesa3d w/ EGL support, threads, locales"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_MESA3D_OPENGL_EGL \
-		|| !BR2_PACKAGE_EFL_EEZE
+		|| !BR2_PACKAGE_EFL_EEZE || !BR2_ENABLE_LOCALE
 
 comment "libevas loaders"
 
