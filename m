From: Urja Rannikko <urjaman@gmail.com>
Date: Tue, 27 Apr 2021 12:13:25 +0300
Subject: [Buildroot] [PATCH] package/links: enable building graphics mode
 with only fb driver
Message-ID: <20210427091325.1488138-1-urjaman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "fb" framebuffer driver needs GPM (mouse support) to compile,
but not DirectFB or Xorg.

Also added a Kconfig comment for easier discovery of the GPM
requirement.

Signed-off-by: Urja Rannikko <urjaman@gmail.com>
---
 package/links/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/links/Config.in b/package/links/Config.in
index 713f53da4e..cc2389c9f1 100644
--- a/package/links/Config.in
+++ b/package/links/Config.in
@@ -10,11 +10,15 @@ if BR2_PACKAGE_LINKS
 
 config BR2_PACKAGE_LINKS_GRAPHICS
 	bool "use graphics"
-	depends on BR2_PACKAGE_DIRECTFB || BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_GPM || BR2_PACKAGE_DIRECTFB || BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBPNG
 	help
-	  Enable graphics output for DirectFB or X11.
+	  Enable graphics output for framebuffer, DirectFB or X11.
+	  Framebuffer output requires GPM (console mouse).
 	  Otherwise links will be text-mode only.
 
+comment "links graphics needs GPM, DirectFB or X11"
+	depends on !BR2_PACKAGE_GPM && !BR2_PACKAGE_DIRECTFB && !BR2_PACKAGE_XORG7
+
 endif
-- 
2.31.1
