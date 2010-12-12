From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Dec 2010 00:42:03 +0100
Subject: [Buildroot] [git commit master 1/1] gdk-pixbuf: fix dependency on
	libiconv
Message-ID: <20101212234308.D462F8E0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3b8d36c3518e0cb41ff2e621ca1ff4215bc553d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                          |    4 ++--
 package/gdk-pixbuf/Config.in     |    1 +
 package/gdk-pixbuf/gdk-pixbuf.mk |    5 ++++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7d79c27..142b654 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,8 +3,8 @@
 	Ccache support reworked. Now used for both host and target
 	compilation, and cache is stored in ~/.buildroot-ccache.
 
-	Updated/fixed packages: busybox, cloop, libconfig, m4,
-	openssh, openssl, qt, usbutils, xz, zlib
+	Updated/fixed packages: busybox, cloop, gdk-pixbuf, libconfig,
+	m4, openssh, openssl, qt, usbutils, xz, zlib
 
 	New packages: dhrystone, lsuio, rsh-redone, whetstone
 
diff --git a/package/gdk-pixbuf/Config.in b/package/gdk-pixbuf/Config.in
index 384f076..8b9cc3f 100644
--- a/package/gdk-pixbuf/Config.in
+++ b/package/gdk-pixbuf/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_GDK_PIXBUF
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 
 	  Gdk-Pixbuf is an image loader and scaler. It uses GObject
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index f762095..f129e46 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -38,7 +38,10 @@ else
 GDK_PIXBUF_DEPENDENCIES += tiff
 endif
 
-GDK_PIXBUF_DEPENDENCIES += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-pkg-config libglib2 libiconv
+GDK_PIXBUF_DEPENDENCIES += \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) \
+	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
+	host-pkg-config libglib2
 
 define GDK_PIXBUF_POST_INSTALL_TWEAKS
 	$(INSTALL) -m 755 package/gdk-pixbuf/S26gdk-pixbuf $(TARGET_DIR)/etc/init.d/
-- 
1.7.2.2
