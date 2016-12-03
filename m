From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Dec 2016 12:58:06 +0100
Subject: [Buildroot] [PATCH v2 2/5] package/x11r7/xlib_libXfont2: new package
In-Reply-To: <20161203115809.25297-1-bernd.kuhls@t-online.de>
References: <20161203115809.25297-1-bernd.kuhls@t-online.de>
Message-ID: <20161203115809.25297-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for xserver_xorg-server 1.19+
https://cgit.freedesktop.org/xorg/xserver/commit/?id=05a793f5b3c40747d5a92a076def7f4fb673c7e7

We need to keep the xlib_libXfont package because xapp_bdftopcf and
xapp_xfs were not ported yet to xlib_libXfont2:
https://lists.x.org/archives/xorg-announce/2016-August/002702.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: simplified patch, added note about xlib_libXfont (Thomas)

 package/x11r7/Config.in                          |  1 +
 package/x11r7/xlib_libXfont2/Config.in           | 10 +++++++
 package/x11r7/xlib_libXfont2/xlib_libXfont2.hash |  2 ++
 package/x11r7/xlib_libXfont2/xlib_libXfont2.mk   | 33 ++++++++++++++++++++++++
 4 files changed, 46 insertions(+)
 create mode 100644 package/x11r7/xlib_libXfont2/Config.in
 create mode 100644 package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
 create mode 100644 package/x11r7/xlib_libXfont2/xlib_libXfont2.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 40aa80c..c40a643 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -35,6 +35,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xlib_libXext/Config.in
 		source package/x11r7/xlib_libXfixes/Config.in
 		source package/x11r7/xlib_libXfont/Config.in
+		source package/x11r7/xlib_libXfont2/Config.in
 		source package/x11r7/xlib_libXft/Config.in
 		source package/x11r7/xlib_libXi/Config.in
 		source package/x11r7/xlib_libXinerama/Config.in
diff --git a/package/x11r7/xlib_libXfont2/Config.in b/package/x11r7/xlib_libXfont2/Config.in
new file mode 100644
index 0000000..6cba465
--- /dev/null
+++ b/package/x11r7/xlib_libXfont2/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_XLIB_LIBXFONT2
+	bool "libXfont2"
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_XLIB_LIBFONTENC
+	select BR2_PACKAGE_XLIB_XTRANS
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XFONT_ENCODINGS
+	help
+	  X.Org Xfont library
diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
new file mode 100644
index 0000000..81a3c9f
--- /dev/null
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
@@ -0,0 +1,2 @@
+# From https://lists.x.org/archives/xorg-announce/2015-December/002663.html
+sha256 e9fbbb475ddd171b3a6a54b989cbade1f6f874fc35d505ebc5be426bc6e4db7e  libXfont2-2.0.1.tar.bz2
diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
new file mode 100644
index 0000000..fef1e68
--- /dev/null
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# xlib_libXfont2
+#
+################################################################################
+
+XLIB_LIBXFONT2_VERSION = 2.0.1
+XLIB_LIBXFONT2_SOURCE = libXfont2-$(XLIB_LIBXFONT2_VERSION).tar.bz2
+XLIB_LIBXFONT2_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXFONT2_LICENSE = MIT
+XLIB_LIBXFONT2_LICENSE_FILES = COPYING
+XLIB_LIBXFONT2_INSTALL_STAGING = YES
+XLIB_LIBXFONT2_DEPENDENCIES = \
+	freetype \
+	xlib_libfontenc \
+	xlib_xtrans \
+	xproto_fontsproto \
+	xproto_xproto \
+	xfont_encodings
+
+HOST_XLIB_LIBXFONT2_DEPENDENCIES = \
+	host-freetype \
+	host-xlib_libfontenc \
+	host-xlib_xtrans \
+	host-xproto_fontsproto \
+	host-xproto_xproto \
+	host-xfont_encodings
+
+XLIB_LIBXFONT2_CONF_OPTS = --disable-devel-docs
+HOST_XLIB_LIBXFONT2_CONF_OPTS = --disable-devel-docs
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.10.2
