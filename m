From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 24 Jul 2020 16:25:51 -0700
Subject: [Buildroot] [PATCH v2 03/13] package/libbytesize: new package
In-Reply-To: <20200724232601.2441272-1-aduskett@gmail.com>
References: <20200724232601.2441272-1-aduskett@gmail.com>
Message-ID: <20200724232601.2441272-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Libbytesize is a small library providing a C "class" for working with
arbitrary big sizes in bytes.

The mdraid plugin for libblockdev depends on this package, which newer
versions of udisks require when building with the udisks daemon enabled.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
  - Add 0001-remove-msgcat-dependency.patch (Thomas)
  - Remove dependency on gettext-gnu (Thomas)

 DEVELOPERS                                    |  1 +
 .../0001-remove-msgcat-dependency.patch       | 36 +++++++++++++++++++
 package/libbytesize/Config.in                 | 10 ++++++
 package/libbytesize/libbytesize.hash          |  3 ++
 package/libbytesize/libbytesize.mk            | 27 ++++++++++++++
 5 files changed, 77 insertions(+)
 create mode 100644 package/libbytesize/0001-remove-msgcat-dependency.patch
 create mode 100644 package/libbytesize/Config.in
 create mode 100644 package/libbytesize/libbytesize.hash
 create mode 100644 package/libbytesize/libbytesize.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cd489754ed..72216b8fce 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -44,6 +44,7 @@ F:	package/imx-usb-loader/
 F:	package/janus-gateway/
 F:	package/json-for-modern-cpp/
 F:	package/libblockdev/
+F:	package/libbytesize/
 F:	package/libcpprestsdk/
 F:	package/libcutl/
 F:	package/libodb/
diff --git a/package/libbytesize/0001-remove-msgcat-dependency.patch b/package/libbytesize/0001-remove-msgcat-dependency.patch
new file mode 100644
index 0000000000..4c9b96020e
--- /dev/null
+++ b/package/libbytesize/0001-remove-msgcat-dependency.patch
@@ -0,0 +1,36 @@
+From ac16b1a905dbdb06ac7bba6ac105686aa7958093 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Fri, 24 Jul 2020 11:49:14 -0700
+Subject: [PATCH] remove msgcat dependency
+
+Gettext-tiny does not include the msgcat utility, which causes issues when
+building libbytesize for embedded systems, as many embedded systems do not
+build the full gettext, but instead use the gettext-tiny library.
+
+Because msgcat is not needed to build libbytesize, it's safe to remove the
+dependency.
+
+Upstream-status: pending
+https://github.com/storaged-project/libbytesize/pull/76
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ configure.ac | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 2ec4062..7d7f218 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -13,8 +13,7 @@ AC_CONFIG_MACRO_DIR([m4])
+ AC_PATH_PROG([XGETTEXT], [xgettext])
+ AC_PATH_PROG([MSGFMT], [msgfmt])
+ AC_PATH_PROG([MSGMERGE], [msgmerge])
+-AC_PATH_PROG([MSGCAT], [msgcat])
+-AS_IF([test -z "$XGETTEXT" -o -z "$MSGFMT" -o -z "$MSGMERGE" -o -z "$MSGCAT"],
++AS_IF([test -z "$XGETTEXT" -o -z "$MSGFMT" -o -z "$MSGMERGE"],
+       [AC_MSG_FAILURE([gettext not found])])
+ 
+ # Define this so gettext.h works without requiring the whole gettext macro
+-- 
+2.26.2
+
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
index 0000000000..b1309c1731
--- /dev/null
+++ b/package/libbytesize/libbytesize.mk
@@ -0,0 +1,27 @@
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
+# 0001-remove-msgcat-dependency.patch
+LIBBYTESIZE_AUTORECONF = YES
+
+LIBBYTESIZE_DEPENDENCIES = \
+	host-pkgconf \
+	host-gettext \
+	gmp \
+	mpfr \
+	pcre2
+
+LIBBYTESIZE_CONF_OPTS += \
+	--without-python3 \
+	--without-tools
+
+$(eval $(autotools-package))
-- 
2.26.2
