From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 22 Jul 2020 18:08:00 -0700
Subject: [Buildroot] [PATCH 02/12] package/libbytesize: new package
In-Reply-To: <20200723010810.3237608-1-aduskett@gmail.com>
References: <20200723010810.3237608-1-aduskett@gmail.com>
Message-ID: <20200723010810.3237608-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Libbytesize is a tiny library providing a C "class" for working with
arbitrary big sizes in bytes.

libblockdev depends on this package.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/libbytesize/Config.in        | 10 ++++++++++
 package/libbytesize/libbytesize.hash |  3 +++
 package/libbytesize/libbytesize.mk   | 21 +++++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/libbytesize/Config.in
 create mode 100644 package/libbytesize/libbytesize.hash
 create mode 100644 package/libbytesize/libbytesize.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 043e8ce3f4..5dc05afa4e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -43,6 +43,7 @@ F:	package/gstreamer1/gst1-vaapi/
 F:	package/imx-usb-loader/
 F:	package/janus-gateway/
 F:	package/json-for-modern-cpp/
+F:	package/libbytesize/
 F:	package/libcpprestsdk/
 F:	package/libcutl/
 F:	package/libodb/
diff --git a/package/Config.in b/package/Config.in
index e6500123f6..789996e20b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1829,6 +1829,7 @@ menu "Other"
 	source "package/libavl/Config.in"
 	source "package/libb64/Config.in"
 	source "package/libbsd/Config.in"
+	source "package/libbytesize/Config.in"
 	source "package/libcap/Config.in"
 	source "package/libcap-ng/Config.in"
 	source "package/libcgroup/Config.in"
diff --git a/package/libbytesize/Config.in b/package/libbytesize/Config.in
new file mode 100644
index 0000000000..6cc550e488
--- /dev/null
+++ b/package/libbytesize/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBBYTESIZE
+	bool "libbytesize"
+	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_MPFR
+	select BR2_PACKAGE_PCRE2
+	help
+	  A tiny library that facilitates the common operations with
+	  sizes in bytes
+
+	  https://github.com/storaged-project/libbytesize/
diff --git a/package/libbytesize/libbytesize.hash b/package/libbytesize/libbytesize.hash
new file mode 100644
index 0000000000..34cb3b210f
--- /dev/null
+++ b/package/libbytesize/libbytesize.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  3c74113fc8cd1a2fbd8870fa0ed7cef2ef24d60ef91e7145fbc041f9aa144479  libbytesize-2.3.tar.gz
+sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libbytesize/libbytesize.mk b/package/libbytesize/libbytesize.mk
new file mode 100644
index 0000000000..130c5ed81c
--- /dev/null
+++ b/package/libbytesize/libbytesize.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# libbytesize
+#
+################################################################################
+
+LIBBYTESIZE_VERSION = 2.3
+LIBBYTESIZE_SITE = https://github.com/storaged-project/libbytesize/releases/download/$(LIBBYTESIZE_VERSION)
+LIBBYTESIZE_LICENSE = LGPL-2.1+
+LIBBYTESIZE_LICENSE_FILES = LICENSE
+LIBBYTESIZE_INSTALL_STAGING = YES
+
+# gettext-gnu is needed for msgcat which gettext-tiny does not provide,
+LIBBYTESIZE_DEPENDENCIES = \
+	host-pkgconf \
+	host-gettext-gnu \
+	gmp \
+	mpfr \
+	pcre2
+
+$(eval $(autotools-package))
-- 
2.26.2
