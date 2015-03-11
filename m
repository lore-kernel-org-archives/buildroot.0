From: Jerome Oufella <jerome.oufella@savoirfairelinux.com>
Date: Wed, 11 Mar 2015 16:30:22 -0400
Subject: [Buildroot] [PATCH v3] libdri2: new package
In-Reply-To: <1425907428-16094-1-git-send-email-jerome.oufella@savoirfairelinux.com>
References: <1425907428-16094-1-git-send-email-jerome.oufella@savoirfairelinux.com>
Message-ID: <1426105822-29016-1-git-send-email-jerome.oufella@savoirfairelinux.com>
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
Changes v2 -> v3:
* depends on BR2_PACKAGE_XORG7 (instead of select)
* add a config comment to notify user of missing toolchain dependencies
* call the github macro to access the sources
---
 package/Config.in          |  1 +
 package/libdri2/Config.in  | 16 ++++++++++++++++
 package/libdri2/libdri2.mk | 17 +++++++++++++++++
 3 files changed, 34 insertions(+)
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
index 0000000..f016e77
--- /dev/null
+++ b/package/libdri2/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LIBDRI2
+	bool "libdri2"
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XPROTO_DRI2PROTO
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	depends on BR2_LARGEFILE # libdrm
+	depends on BR2_PACKAGE_XORG7
+	help
+	  Library for the DRI2 extension to the X Window System.
+
+	  https://github.com/robclark/libdri2
+
+comment "libdri2 needs a toolchain w/ largefile, threads"
+	depends on !(BR2_LARGEFILE && BR2_TOOLCHAIN_HAS_THREADS)
\ No newline at end of file
diff --git a/package/libdri2/libdri2.mk b/package/libdri2/libdri2.mk
new file mode 100644
index 0000000..22854b5
--- /dev/null
+++ b/package/libdri2/libdri2.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# libdri2
+#
+################################################################################
+
+LIBDRI2_VERSION = 4f1eef3183df2b270c3d5cbef07343ee5127a6a4
+LIBDRI2_SITE = $(call github,robclark,libdri2,$(LIBDRI2_VERSION))
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
