From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 23:45:32 +0100
Subject: [Buildroot] [git commit] gcr: new package
Message-ID: <20151201232118.6C50882211@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec069dcf54cc69c19701a69106acaffdd07023bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: add explicit --with-gtk when gtk is available.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in     |  1 +
 package/gcr/Config.in | 19 +++++++++++++++++++
 package/gcr/gcr.hash  |  2 ++
 package/gcr/gcr.mk    | 29 +++++++++++++++++++++++++++++
 4 files changed, 51 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 39a5af7..3656c54 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -751,6 +751,7 @@ menu "Crypto"
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
index 0000000..0730eb4
--- /dev/null
+++ b/package/gcr/gcr.mk
@@ -0,0 +1,29 @@
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
+GCR_CONF_OPTS += --with-gtk
+else
+GCR_CONF_OPTS += --without-gtk
+endif
+
+$(eval $(autotools-package))
