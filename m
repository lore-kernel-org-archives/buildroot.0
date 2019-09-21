From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 16:56:13 +0200
Subject: [Buildroot] [git commit] package/mesa3d: add OSMesa classic needs
 dri swrast
Message-ID: <20190921150532.E0D9F8EE70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c16f3e4758c0fef46cad53a6f8a7eb439439cafb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The meson build system now check if dri swrast is enabled
when OSMesa classic is enabled.

See:
https://cgit.freedesktop.org/mesa/mesa/commit/?id=cbbd5bb889a2c271a504c379f36a7cb717a85af4

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy         | 2 +-
 package/mesa3d/Config.in | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3fd92ade21..b9ee443667 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -148,7 +148,7 @@ comment "Legacy options removed in 2019.11"
 
 config BR2_PACKAGE_MESA3D_OSMESA
 	bool "mesa OSMesa option renamed"
-	select BR2_PACKAGE_MESA3D_OSMESA_CLASSIC
+	select BR2_PACKAGE_MESA3D_OSMESA_CLASSIC if BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
 	select BR2_LEGACY
 	help
 	  The option was renamed in order to match the naming used
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 13739f54c5..77ac0469e9 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -267,10 +267,14 @@ comment "Off-screen Rendering"
 
 config BR2_PACKAGE_MESA3D_OSMESA_CLASSIC
 	bool "OSMesa (classic) library"
+	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
 	help
 	  The OSMesa classic API provides functions for
 	  making off-screen renderings.
 
+comment "OSMesa classic requires dri (classic) swrast"
+	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
+
 if BR2_PACKAGE_MESA3D_DRIVER
 
 comment "Additional API Support"
