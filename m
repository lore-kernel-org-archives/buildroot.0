From: Jerome Oufella <jerome.oufella@savoirfairelinux.com>
Date: Mon,  9 Mar 2015 09:23:48 -0400
Subject: [Buildroot] [PATCH v2] libdri2: new package
In-Reply-To: <1425906775-31621-1-git-send-email-jerome.oufella@savoirfairelinux.com>
References: <1425906775-31621-1-git-send-email-jerome.oufella@savoirfairelinux.com>
Message-ID: <1425907428-16094-1-git-send-email-jerome.oufella@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: J?r?me Oufella <jerome.oufella@savoirfairelinux.com>

libdri2 is a library for the DRI2 extension to the X Window System. This
is the split out dri2 client side code from mesa, libva, libvdpau, etc..

It can be used by applications or user-space drivers to provide
accelerated graphics.

Signed-off-by: J?r?me Oufella <jerome.oufella@savoirfairelinux.com>
---
Changes v1 -> v2:
* Fix repository URL as it doesn't hosts archives [oops]
---
 package/Config.in          |  1 +
 package/libdri2/Config.in  | 13 +++++++++++++
 package/libdri2/libdri2.mk | 18 ++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 package/libdri2/Config.in
 create mode 100644 package/libdri2/libdri2.mk

diff --git a/package/Config.in b/package/Config.in
index ba45f32..3f344ca 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -707,6 +707,7 @@ menu "Graphics"
 	source "package/lesstif/Config.in"
 	source "package/libart/Config.in"
 	source "package/libdmtx/Config.in"
+	source "package/libdri2/Config.in"
 	source "package/libdrm/Config.in"
 	source "package/libexif/Config.in"
 	source "package/libgail/Config.in"
diff --git a/package/libdri2/Config.in b/package/libdri2/Config.in
new file mode 100644
index 0000000..d739206
--- /dev/null
+++ b/package/libdri2/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBDRI2
+	bool "libdri2"
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XPROTO_DRI2PROTO
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	depends on BR2_LARGEFILE # libdrm
+	help
+	  Library for the DRI2 extension to the X Window System.
+
+	  https://github.com/robclark/libdri2
diff --git a/package/libdri2/libdri2.mk b/package/libdri2/libdri2.mk
new file mode 100644
index 0000000..66b780f
--- /dev/null
+++ b/package/libdri2/libdri2.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# libdri2
+#
+################################################################################
+
+LIBDRI2_VERSION = 4f1eef3183df2b270c3d5cbef07343ee5127a6a4
+LIBDRI2_SITE = https://github.com/robclark/libdri2.git
+LIBDRI2_SITE_METHOD = git
+LIBDRI2_DEPENDENCIES = xlib_libXext xproto_dri2proto xlib_libXdamage libdrm
+LIBDRI2_LICENSE = MIT
+LIBDRI2_LICENSE_FILES = COPYING
+
+LIBDRI2_INSTALL_STAGING = YES
+LIBDRI2_AUTORECONF = YES
+LIBDRI2_CONF_ENV = xorg_cv_malloc0_returns_null=true
+
+$(eval $(autotools-package))
-- 
2.1.0
