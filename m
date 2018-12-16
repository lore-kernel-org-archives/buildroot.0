From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 21:46:37 +0100
Subject: [Buildroot] [git commit] package/netsurf: add GTK+ 3 frontend
Message-ID: <20181216204426.BA6A18B49B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=436ed9d5475531b8ac49d83a178611e443e59a4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netsurf/Config.in  | 12 +++++++++---
 package/netsurf/netsurf.mk |  8 ++++++++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/package/netsurf/Config.in b/package/netsurf/Config.in
index 21a3a992a7..ca28a16688 100644
--- a/package/netsurf/Config.in
+++ b/package/netsurf/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_NETSURF
 	help
 	  NetSurf is a compact graphical web browser which aims for
 	  HTML5, CSS and JavaScript support.
-	  Frontends: GTK+ 2 (X11), SDL 1.2 (framebuffer)
+	  Frontends: GTK (X11), SDL 1.2 (framebuffer)
 
 	  http://www.netsurf-browser.org/
 
@@ -26,10 +26,16 @@ config BR2_PACKAGE_NETSURF_SDL
 	  Select SDL 1.2 frontend.
 
 config BR2_PACKAGE_NETSURF_GTK
-	bool "gtk frontend"
+	bool "gtk2 frontend"
 	depends on BR2_PACKAGE_LIBGTK2
 	help
-	  Select GTK frontend.
+	  Select GTK+ 2 frontend.
+
+config BR2_PACKAGE_NETSURF_GTK3
+	bool "gtk3 frontend"
+	depends on BR2_PACKAGE_LIBGTK3
+	help
+	  Select GTK+ 3 frontend.
 
 endchoice
 
diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index 004d582562..8d29c5acc8 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -15,6 +15,14 @@ NETSURF_DEPENDENCIES = expat jpeg libcurl libpng openssl \
 ifeq ($(BR2_PACKAGE_NETSURF_GTK),y)
 NETSURF_DEPENDENCIES += libgtk2
 NETSURF_FRONTEND = gtk
+endif
+
+ifeq ($(BR2_PACKAGE_NETSURF_GTK3),y)
+NETSURF_DEPENDENCIES += libgtk3
+NETSURF_FRONTEND = gtk3
+endif
+
+ifeq ($(BR2_PACKAGE_NETSURF_GTK)$(BR2_PACKAGE_NETSURF_GTK3),y)
 ifeq ($(BR2_PACKAGE_LIBRSVG),y)
 NETSURF_DEPENDENCIES += librsvg
 define NETSURF_SVG_CONFIGURE_CMDS
