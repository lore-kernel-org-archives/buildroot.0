From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 12 Dec 2018 08:14:54 +0100
Subject: [Buildroot] [PATCH 3/4] netsurf: add GTK+ 3 frontend
In-Reply-To: <20181212071455.29215-1-francois.perrad@gadz.org>
References: <20181212071455.29215-1-francois.perrad@gadz.org>
Message-ID: <20181212071455.29215-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/netsurf/Config.in  | 10 ++++++++--
 package/netsurf/netsurf.mk |  8 ++++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/netsurf/Config.in b/package/netsurf/Config.in
index 21a3a992a..99360a99d 100644
--- a/package/netsurf/Config.in
+++ b/package/netsurf/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_NETSURF
 	help
 	  NetSurf is a compact graphical web browser which aims for
 	  HTML5, CSS and JavaScript support.
-	  Frontends: GTK+ 2 (X11), SDL 1.2 (framebuffer)
+	  Frontends: GTK (X11), SDL 1.2 (framebuffer)
 
 	  http://www.netsurf-browser.org/
 
@@ -29,7 +29,13 @@ config BR2_PACKAGE_NETSURF_GTK
 	bool "gtk frontend"
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
index 004d58256..8d29c5acc 100644
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
-- 
2.17.1
