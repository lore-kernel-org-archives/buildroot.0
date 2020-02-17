From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 17 Feb 2020 15:30:28 +0100
Subject: [Buildroot] [PATCH 2/4] package/volume_key: add new package
In-Reply-To: <20200217143030.5031-1-giulio.benetti@benettiengineering.com>
References: <20200217143030.5031-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200217143030.5031-3-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The volume_key project provides a libvolume_key, a library for manipulating
storage volume encryption keys and storing them separately from volumes, and an
associated command-line tool, named volume_key.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...ove-po-Makefile.in-entry-from-AC_CON.patch | 28 +++++++++++++++++++
 package/volume_key/Config.in                  | 19 +++++++++++++
 package/volume_key/volume_key.hash            |  3 ++
 package/volume_key/volume_key.mk              | 22 +++++++++++++++
 6 files changed, 74 insertions(+)
 create mode 100644 package/volume_key/0001-configure.ac-remove-po-Makefile.in-entry-from-AC_CON.patch
 create mode 100644 package/volume_key/Config.in
 create mode 100644 package/volume_key/volume_key.hash
 create mode 100644 package/volume_key/volume_key.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6f2dbbb11a..5276c09384 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1016,6 +1016,7 @@ F:	package/minicom/
 F:	package/nfs-utils/
 F:	package/sunxi-mali-mainline/
 F:	package/sunxi-mali-mainline-driver/
+F:	package/volume_key/
 
 N:	Gregory Dymarek <gregd72002@gmail.com>
 F:	package/ding-libs/
diff --git a/package/Config.in b/package/Config.in
index 4d76a5791f..a058d7d2f0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1310,6 +1310,7 @@ menu "Crypto"
 	source "package/tpm2-tss/Config.in"
 	source "package/trousers/Config.in"
 	source "package/ustream-ssl/Config.in"
+	source "package/volume_key/Config.in"
 	source "package/wolfssl/Config.in"
 endmenu
 
diff --git a/package/volume_key/0001-configure.ac-remove-po-Makefile.in-entry-from-AC_CON.patch b/package/volume_key/0001-configure.ac-remove-po-Makefile.in-entry-from-AC_CON.patch
new file mode 100644
index 0000000000..44d6ee0d4b
--- /dev/null
+++ b/package/volume_key/0001-configure.ac-remove-po-Makefile.in-entry-from-AC_CON.patch
@@ -0,0 +1,28 @@
+From d1142e667f4f2f2fcd2d36a006919325c1a4377e Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sat, 25 Jan 2020 17:24:38 +0100
+Subject: [PATCH] configure.ac: remove po/Makefile.in entry from
+ AC_CONFIG_FILES
+
+AC_CONFIG_FILES should not contain po/Makefile.in file because
+gettextize will re-add it again causing build failure.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7d3d27a..f4295ff 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -244,5 +244,5 @@ if test "$GCC" = yes ; then
+ fi
+ 
+ dnl po/Makefile
+-AC_CONFIG_FILES([Makefile contrib/Makefile doc/Makefile lib/Makefile po/Makefile.in python/Makefile python/python/Makefile python/python3/Makefile src/Makefile tests/Makefile])
++AC_CONFIG_FILES([Makefile contrib/Makefile doc/Makefile lib/Makefile python/Makefile python/python/Makefile python/python3/Makefile src/Makefile tests/Makefile])
+ AC_OUTPUT
+-- 
+2.20.1
+
diff --git a/package/volume_key/Config.in b/package/volume_key/Config.in
new file mode 100644
index 0000000000..0c0827253d
--- /dev/null
+++ b/package/volume_key/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_VOLUME_KEY
+	bool "volume_key"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # cryptsetup, libassuan, libglib2, libgpgme, libnss
+	depends on BR2_USE_MMU # cryptsetup, libassuan, libglib2, libgpgme
+	depends on !BR2_STATIC_LIBS # cryptsetup, libnss
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpgme, libassuan
+	select BR2_PACKAGE_CRYPTSETUP
+	select BR2_PACKAGE_LIBASSUAN
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBGPGME
+	select BR2_PACKAGE_LIBNSS
+	help
+	  The volume_key project provides a libvolume_key, a library for manipulating
+	  storage volume encryption keys and storing them separately from volumes, and an
+	  associated command-line tool, named volume_key.
+
+	  https://pagure.io/volume_key
diff --git a/package/volume_key/volume_key.hash b/package/volume_key/volume_key.hash
new file mode 100644
index 0000000000..3925429b4e
--- /dev/null
+++ b/package/volume_key/volume_key.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 f83146352464048f823c164e755dc10da0e06db024de5b1b6f78beeb8438dc22  volume_key-f56614199726ba1897d8687f0927535693b6603f.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/volume_key/volume_key.mk b/package/volume_key/volume_key.mk
new file mode 100644
index 0000000000..8d5bff6d8e
--- /dev/null
+++ b/package/volume_key/volume_key.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# volume_key
+#
+################################################################################
+
+VOLUME_KEY_VERSION = f56614199726ba1897d8687f0927535693b6603f
+VOLUME_KEY_SITE = https://pagure.io/volume_key.git
+VOLUME_KEY_SITE_METHOD = git
+VOLUME_KEY_LICENSE = GPL-2.0+
+VOLUME_KEY_LICENSE_FILES = COPYING
+VOLUME_KEY_DEPENDENCIES = cryptsetup libglib2 libgpgme libnss $(TARGET_NLS_DEPENDENCIES)
+VOLUME_KEY_INSTALL_STAGING = YES
+VOLUME_KEY_AUTORECONF = YES
+VOLUME_KEY_GETTEXTIZE = YES
+
+VOLUME_KEY_CONF_OPTS = --with-sysroot=$(STAGING_DIR) \
+		       --with-gpgme-prefix=$(STAGING_DIR)/usr \
+		       --without-python \
+		       --without-python3
+
+$(eval $(autotools-package))
-- 
2.20.1
