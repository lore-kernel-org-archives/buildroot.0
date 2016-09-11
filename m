From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Sep 2016 14:38:54 +0200
Subject: [Buildroot] [PATCH 3/4] package/weston: fix unmet dependencies
In-Reply-To: <cover.1473597259.git.yann.morin.1998@free.fr>
References: <cover.1473597259.git.yann.morin.1998@free.fr>
Message-ID: <91aa98bde780527b6a1bceb64753312c3fb7bbe1.1473597259.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Properly propagate dependencies from freerdp to fix the following unmet
dependencies:

    warning: (BR2_PACKAGE_WESTON_RDP) selects BR2_PACKAGE_FREERDP which has
    unmet direct dependencies (BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR &&
    !BR2_STATIC_LIBS && BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_MMU &&
    BR2_TOOLCHAIN_HAS_SYNC_4)

Reorder deps to have architectures deps first.

Remove "broken" dependency from comment; add missing ones.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
-- 
2.7.4
