From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 22 Jul 2020 18:08:01 -0700
Subject: [Buildroot] [PATCH 03/12] package/volume-key: new package
In-Reply-To: <20200723010810.3237608-1-aduskett@gmail.com>
References: <20200723010810.3237608-1-aduskett@gmail.com>
Message-ID: <20200723010810.3237608-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

The volume-key project provides a library for manipulating storage volume
encryption keys and storing them separately from volumes, and an associated
command-line tool, named volume_key.

The main goal of the software is to allow restoring access to an encrypted
hard drive if the primary user forgets the passphrase. The encryption key back
up can also be useful for extracting data after a hardware or software failure
that corrupts the header of the encrypted volume, or to access the company
data after an employee leaves abruptly.

Updated versions of udisks are dependent on this package.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...ove-po-Makefile.in-entry-from-AC_CON.patch | 28 ++++++++++++++
 package/volume-key/Config.in                  | 38 +++++++++++++++++++
 package/volume-key/volume-key.hash            |  3 ++
 package/volume-key/volume-key.mk              | 31 +++++++++++++++
 6 files changed, 102 insertions(+)
 create mode 100644 package/volume-key/0001-configure.ac-remove-po-Makefile.in-entry-from-AC_CON.patch
 create mode 100644 package/volume-key/Config.in
 create mode 100644 package/volume-key/volume-key.hash
 create mode 100644 package/volume-key/volume-key.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 72216b8fce..a4b6708c35 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -92,6 +92,7 @@ F:	package/setools/
 F:	package/sngrep/
 F:	package/spidermonkey/
 F:	package/systemd/
+F:	package/volume-key/
 F:	support/testing/tests/package/test_gst1_python.py
 F:	support/testing/tests/package/test_python_gobject.py
 
diff --git a/package/Config.in b/package/Config.in
index 8fa8324f35..0a93eebbf9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1340,6 +1340,7 @@ menu "Crypto"
 	source "package/tpm2-tss/Config.in"
 	source "package/trousers/Config.in"
 	source "package/ustream-ssl/Config.in"
+	source "package/volume-key/Config.in"
 	source "package/wolfssl/Config.in"
 endmenu
 
diff --git a/package/volume-key/0001-configure.ac-remove-po-Makefile.in-entry-from-AC_CON.patch b/package/volume-key/0001-configure.ac-remove-po-Makefile.in-entry-from-AC_CON.patch
new file mode 100644
index 0000000000..2f6a025fd0
--- /dev/null
+++ b/package/volume-key/0001-configure.ac-remove-po-Makefile.in-entry-from-AC_CON.patch
@@ -0,0 +1,28 @@
+From d1142e667f4f2f2fcd2d36a006919325c1a4377e Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sat, 25 Jan 2020 17:24:38 +0100
+Subject: [PATCH] configure.ac: remove po/Makefile.in entry from AC_CONFIG_FILES
+
+AC_CONFIG_FILES should not contain po/Makefile.because gettextize will
+re-add it causing build failure.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
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
diff --git a/package/volume-key/Config.in b/package/volume-key/Config.in
new file mode 100644
index 0000000000..776e9d97fb
--- /dev/null
+++ b/package/volume-key/Config.in
@@ -0,0 +1,38 @@
+config BR2_PACKAGE_VOLUME_KEY
+	bool "volume-key"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # gpg2, libgpgme, libassuan
+	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnss
+	depends on BR2_USE_MMU # gpg2, cryptsetup, libassuan, libglib2, libgpgme
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup
+	depends on BR2_TOOLCHAIN_HAS_THREADS # cryptsetup, gpg2, libassuan, libglib2, libgpgme, libnss
+	depends on !BR2_STATIC_LIBS # gpg2, cryptsetup, libnss
+	select BR2_PACKAGE_CRYPTSETUP
+	select BR2_PACKAGE_GNUPG2 # runtime
+	select BR2_PACKAGE_LIBASSUAN
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBGPGME
+	select BR2_PACKAGE_LIBNSS
+	select BR2_PACKAGE_UTIL_LINUX # runtime
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID # runtime
+	help
+	  The volume-key project provides a library for manipulating
+	  storage volume encryption keys and storing them separately
+	  from volumes, and an associated command-line tool, named
+	  volume_key.
+
+	  The main goal of the software is to allow restoring access to
+	  an encrypted hard drive if the primary user forgets the
+	  passphrase. The encryption key back up can also be useful for
+	  extracting data after a hardware or software failure that
+	  corrupts the header of the encrypted volume, or to access the
+	  company data after an employee leaves abruptly.
+
+	  https://pagure.io/volume_key
+
+comment "volume-key needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/volume-key/volume-key.hash b/package/volume-key/volume-key.hash
new file mode 100644
index 0000000000..881a949d78
--- /dev/null
+++ b/package/volume-key/volume-key.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  85abbd65b640cb9ecfa87746484c12e631e554c85a73ca3771b2bc06fa5d37ca  volume-key-volume_key-0.3.12.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/volume-key/volume-key.mk b/package/volume-key/volume-key.mk
new file mode 100644
index 0000000000..7c3f125434
--- /dev/null
+++ b/package/volume-key/volume-key.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# volume-key
+#
+################################################################################
+
+VOLUME_KEY_VERSION = volume_key-0.3.12
+VOLUME_KEY_SITE = https://pagure.io/volume_key.git
+VOLUME_KEY_SITE_METHOD = git
+VOLUME_KEY_LICENSE = GPL-2.0
+VOLUME_KEY_LICENSE_FILES = COPYING
+VOLUME_KEY_INSTALL_STAGING = YES
+VOLUME_KEY_AUTORECONF = YES
+VOLUME_KEY_GETTEXTIZE = YES
+VOLUME_KEY_DEPENDENCIES = \
+	cryptsetup \
+	gnupg2 \
+	libglib2 \
+	libgpgme \
+	libnss \
+	util-linux \
+	$(TARGET_NLS_DEPENDENCIES)
+
+VOLUME_KEY_CONF_ENV += ac_cv_path_GPG=/usr/bin/gpg
+
+VOLUME_KEY_CONF_OPTS = \
+	--with-gpgme-prefix=$(STAGING_DIR)/usr \
+	--without-python \
+	--without-python3
+
+$(eval $(autotools-package))
-- 
2.26.2
