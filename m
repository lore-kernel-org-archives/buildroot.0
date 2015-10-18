From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Sun, 18 Oct 2015 10:27:52 +0900
Subject: [Buildroot] [PATCH v2 1/1] gmediarender: new package
Message-ID: <201510180127.t9I1Rq9v016092@ms-omx01.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
---
Changes
v1 -> v2
  - remove not needed 'GMEDIARENDER_AUTORECONF = YES'
  - correct License GPLV2 -> GPLV2+.
---
 package/Config.in                      |    1 +
 package/gmediarender/Config.in         |   15 +++++++++++++++
 package/gmediarender/gmediarender.hash |    2 ++
 package/gmediarender/gmediarender.mk   |   15 +++++++++++++++
 4 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 package/gmediarender/Config.in
 create mode 100644 package/gmediarender/gmediarender.hash
 create mode 100644 package/gmediarender/gmediarender.mk

diff --git a/package/Config.in b/package/Config.in
index 8e3c64a..396d757 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -14,6 +14,7 @@ menu "Audio and video applications"
 	source "package/ffmpeg/Config.in"
 	source "package/flac/Config.in"
 	source "package/flite/Config.in"
+	source "package/gmediarender/Config.in"
 	source "package/gstreamer/Config.in"
 	source "package/gstreamer1/Config.in"
 	source "package/jack2/Config.in"
diff --git a/package/gmediarender/Config.in b/package/gmediarender/Config.in
new file mode 100644
index 0000000..d2cd9d7
--- /dev/null
+++ b/package/gmediarender/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_GMEDIARENDER
+	bool "gmediarender"
+	depends on BR2_USE_WCHAR # gstreamer
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer, libupnp
+	depends on BR2_USE_MMU # gstreamer
+	select BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_LIBUPNP
+	help
+	  UPnP (DLNA) media renderer based on gstreamer
+
+	  http://gmrender.nongnu.org/
+
+comment "gmediarender needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gmediarender/gmediarender.hash b/package/gmediarender/gmediarender.hash
new file mode 100644
index 0000000..f181770
--- /dev/null
+++ b/package/gmediarender/gmediarender.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 85d3251ce3095394d389b56f8b47e7f79e906022e51ce92a4cf822ee2a5fee2c  gmediarender-0.0.6.tar.bz2
diff --git a/package/gmediarender/gmediarender.mk b/package/gmediarender/gmediarender.mk
new file mode 100644
index 0000000..0e71bda
--- /dev/null
+++ b/package/gmediarender/gmediarender.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# gmediarender
+#
+################################################################################
+
+GMEDIARENDER_VERSION = 0.0.6
+GMEDIARENDER_SOURCE = gmediarender-$(GMEDIARENDER_VERSION).tar.bz2
+GMEDIARENDER_SITE = http://savannah.nongnu.org/download/gmrender
+GMEDIARENDER_LICENSE = GPLv2+
+GMEDIARENDER_LICENSE_FILES = COPYING
+GMEDIARENDER_DEPENDENCIES = gstreamer libupnp
+GMEDIARENDER_CONF_OPTS = --with-libupnp=$(STAGING_DIR)/usr LIBS="-lixml"
+
+$(eval $(autotools-package))
-- 
1.7.1

============================================================
    Hiroshi Kawashima
