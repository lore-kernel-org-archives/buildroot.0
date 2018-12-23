From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 23 Dec 2018 16:48:43 +0100
Subject: [Buildroot] [RFC 1/3] libwpe: new package
In-Reply-To: <20181223154845.23556-1-francois.perrad@gadz.org>
References: <20181223154845.23556-1-francois.perrad@gadz.org>
Message-ID: <20181223154845.23556-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/libwpe/Config.in   | 12 ++++++++++++
 package/libwpe/libwpe.hash |  7 +++++++
 package/libwpe/libwpe.mk   | 15 +++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/libwpe/Config.in
 create mode 100644 package/libwpe/libwpe.hash
 create mode 100644 package/libwpe/libwpe.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6f687d748..705842310 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -810,6 +810,7 @@ F:	package/gdbm/
 F:	package/libtomcrypt/
 F:	package/libtommath/
 F:	package/libump/
+F:	package/libwpe/
 F:	package/linenoise/
 F:	package/ljlinenoise/
 F:	package/lpeg/
diff --git a/package/Config.in b/package/Config.in
index 038ddf6b2..7615c5853 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1283,6 +1283,7 @@ menu "Graphics"
 	source "package/libva-intel-driver/Config.in"
 	source "package/libvdpau/Config.in"
 	source "package/libvips/Config.in"
+	source "package/libwpe/Config.in"
 	source "package/menu-cache/Config.in"
 	source "package/opencv/Config.in"
 	source "package/opencv3/Config.in"
diff --git a/package/libwpe/Config.in b/package/libwpe/Config.in
new file mode 100644
index 000000000..8cf99fe0c
--- /dev/null
+++ b/package/libwpe/Config.in
@@ -0,0 +1,12 @@
+comment "libwpe needs an OpenEGL-capable backend"
+	depends on !BR2_PACKAGE_HAS_LIBEGL
+
+config BR2_PACKAGE_LIBWPE
+	bool "libwpe"
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_LIBXKBCOMMON
+	help
+	  General-purpose library specifically developed for the
+	  WPE-flavored port of WebKit.
+
+	  https://wpewebkit.org/
diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
new file mode 100644
index 000000000..bda380988
--- /dev/null
+++ b/package/libwpe/libwpe.hash
@@ -0,0 +1,7 @@
+# From https://wpewebkit.org/releases/libwpe-1.1.0.tar.xz.sums
+md5 b34c3920cb749ebc74fe45a793cf57af libwpe-1.1.0.tar.xz
+sha1 69f0bc7f422c6a196c49439a454f7734ecac1126 libwpe-1.1.0.tar.xz
+sha256 72e34ad754be11abd1a438cfe195d8d644c52105ab2b1c3b39dec6228bc776ce libwpe-1.1.0.tar.xz
+
+# Hashes for license files:
+sha256 6efc9991641b47b1f4e727db7f090d0ade00117dcbbc74be622f2baceddb1f22 COPYING
diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
new file mode 100644
index 000000000..2b9309843
--- /dev/null
+++ b/package/libwpe/libwpe.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libwpe
+#
+################################################################################
+
+LIBWPE_VERSION = 1.1.0
+LIBWPE_SITE = http://wpewebkit.org/releases
+LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
+LIBWPE_INSTALL_STAGING = YES
+LIBWPE_LICENSE = BSD-2-Clause
+LIBWPE_LICENSE_FILES = COPYING
+LIBWPE_DEPENDENCIES = libegl libxkbcommon
+
+$(eval $(cmake-package))
-- 
2.17.1
