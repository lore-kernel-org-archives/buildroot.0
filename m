From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 15:45:08 +0200
Subject: [Buildroot] [git commit] package/weston: fix unmet dependencies
Message-ID: <20160911134931.58E2282037@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=251b9142631bc9d574352e0bb9b595f9dc8fb6a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Properly propagate dependencies from freerdp to fix the following unmet
dependencies:

    warning: (BR2_PACKAGE_WESTON_RDP) selects BR2_PACKAGE_FREERDP which has
    unmet direct dependencies (BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR &&
    !BR2_STATIC_LIBS && BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_MMU &&
    BR2_TOOLCHAIN_HAS_SYNC_4)

Reorder deps to have architectures deps first.

Remove "broken" dependency from comment; add missing ones.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/weston/Config.in | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index c1eb7da..6baa24b 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -53,9 +53,10 @@ config BR2_PACKAGE_WESTON_FBDEV
 # FreeRDP needs threads and !static, already the case for weston
 config BR2_PACKAGE_WESTON_RDP
 	bool "RDP compositor"
-	depends on BR2_USE_WCHAR # freerdp
 	depends on BR2_USE_MMU # freerdp, libglib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_USE_WCHAR # freerdp
+	depends on BR2_INSTALL_LIBSTDCPP # freerdp
 	select BR2_PACKAGE_FREERDP
 	select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
 	help
@@ -71,10 +72,10 @@ config BR2_PACKAGE_WESTON_RDP
 	  so you may want to change them in a post-build script or a rootfs
 	  overlay.
 
-comment "RDP compositor needs a toolchain w/ wchar"
-	depends on BROKEN # needs FreeRDP master
+comment "RDP compositor needs a toolchain w/ wchar, C++"
+	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
 
 # rpi-userland is an EGL/GLES provider, so we can't select it
 config BR2_PACKAGE_WESTON_RPI
