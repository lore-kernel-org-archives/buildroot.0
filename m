From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 13 Nov 2015 16:41:37 -0300
Subject: [Buildroot] [PATCH] gcr: new package
Message-ID: <1447443697-3802-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in     |  1 +
 package/gcr/Config.in | 19 +++++++++++++++++++
 package/gcr/gcr.hash  |  2 ++
 package/gcr/gcr.mk    | 28 ++++++++++++++++++++++++++++
 4 files changed, 50 insertions(+)
 create mode 100644 package/gcr/Config.in
 create mode 100644 package/gcr/gcr.hash
 create mode 100644 package/gcr/gcr.mk

diff --git a/package/Config.in b/package/Config.in
index dde5c4c..7c10837 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -755,6 +755,7 @@ menu "Crypto"
 	source "package/botan/Config.in"
 	source "package/ca-certificates/Config.in"
 	source "package/cryptodev/Config.in"
+	source "package/gcr/Config.in"
 	source "package/gnutls/Config.in"
 	source "package/libassuan/Config.in"
 	source "package/libgcrypt/Config.in"
diff --git a/package/gcr/Config.in b/package/gcr/Config.in
new file mode 100644
index 0000000..cd40ca1
--- /dev/null
+++ b/package/gcr/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_GCR
+	bool "gcr"
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	depends on !BR2_STATIC_LIBS # p11-kit
+	select BR2_PACKAGE_GNUPG2 # runtime
+	select BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_P11_KIT
+	help
+	  Library for cryptographic UIs and accessing PKCS#11 modules.
+
+	  https://developer.gnome.org/gcr/
+
+comment "gcr needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/gcr/gcr.hash b/package/gcr/gcr.hash
new file mode 100644
index 0000000..8f1f931
--- /dev/null
+++ b/package/gcr/gcr.hash
@@ -0,0 +1,2 @@
+# From http://ftp.acc.umu.se/pub/gnome/sources/gcr/3.18/gcr-3.18.0.sha256sum
+sha256	d4d16da5af55148a694055835ccd07ad34daf0ad03bdad929bf7cad15637ce00	gcr-3.18.0.tar.xz
diff --git a/package/gcr/gcr.mk b/package/gcr/gcr.mk
new file mode 100644
index 0000000..f1e8abe
--- /dev/null
+++ b/package/gcr/gcr.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# gcr
+#
+################################################################################
+
+GCR_VERSION_MAJOR = 3.18
+GCR_VERSION = $(GCR_VERSION_MAJOR).0
+GCR_SITE = http://ftp.acc.umu.se/pub/gnome/sources/gcr/$(GCR_VERSION_MAJOR)
+GCR_SOURCE = gcr-$(GCR_VERSION).tar.xz
+GCR_DEPENDENCIES = host-pkgconf libgcrypt libglib2 p11-kit
+GCR_INSTALL_STAGING = YES
+GCR_CONF_ENV = ac_cv_path_GNUPG=/usr/bin/gpg2
+GCR_CONF_OPTS = \
+	--disable-gtk-doc \
+	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
+# Even though COPYING is v2 the code states v2.1+
+GCR_LICENSE = LGPLv2.1+
+GCR_LICENSE_FILES = COPYING
+
+# Only the X11 backend is supported for the simple GUI
+ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
+GCR_DEPENDENCIES += libgtk3
+else
+GCR_CONF_OPTS += --without-gtk
+endif
+
+$(eval $(autotools-package))
-- 
2.4.10
