From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 15:54:16 +0100
Subject: [Buildroot] [git commit] package/rpm: bump to version 4.16.0
Message-ID: <20201025144240.631CF82D9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc52fc7426e97ea6b6ca7e7cbb3b21d7b1049ddd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version) and so autoreconf
- Update hash of COPYING (explicitly mention that the rpmio/ sub dir is
  under LGPL:
  https://github.com/rpm-software-management/rpm/commit/d5c69756cf6cd16e7c2e8b81fba19bf81f3dd1ba)
- sqlite is an optional dependency since
  https://github.com/rpm-software-management/rpm/commit/07129b641b733ab30995c93e2b08d0673b9d218c
- rpm can be built without berkeleydb since
  https://github.com/rpm-software-management/rpm/commit/4c7323f69b4fddf928245e9db2d1c9ca9b277ef2
  It should be noted that berkeleydb is deprecated since
  https://github.com/rpm-software-management/rpm/commit/fc0169eb03c893d63dc44f2ada954d42e0e759ed
- Update indentation in hash file (two spaces)

https://rpm.org/wiki/Releases/4.16.0.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...re-ac-prefer-pkg-config-to-find-libgcrypt.patch | 52 ----------------------
 .../0001-lib-rpmdb-c-include-fcntl-h-for-O_.patch  | 29 ++++++++++++
 .../0002-lib-rpmrc.c-include-fcntl.h-for-O_.patch  | 31 +++++++++++++
 package/rpm/Config.in                              |  1 -
 package/rpm/rpm.hash                               |  6 +--
 package/rpm/rpm.mk                                 | 21 ++++++---
 6 files changed, 79 insertions(+), 61 deletions(-)

diff --git a/package/rpm/0001-configure-ac-prefer-pkg-config-to-find-libgcrypt.patch b/package/rpm/0001-configure-ac-prefer-pkg-config-to-find-libgcrypt.patch
deleted file mode 100644
index 035fe154db..0000000000
--- a/package/rpm/0001-configure-ac-prefer-pkg-config-to-find-libgcrypt.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 22ed98efe3d5198e4141948af7569cfa10d9d25f Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Wed, 20 Nov 2019 13:06:51 +0000
-Subject: [PATCH] configure.ac: prefer pkg-config to find libgcrypt
-
-libgcrypt from 1.8.5 provides a pkg-config file as well as the traditional
-libgcrypt-config script.  As pkg-config is more resiliant in the face of
-complicated build environments (for example cross-compilation and sysroots)
-prefer the pkg-config file, falling back to libgcrypt-config if that doesn't
-exist.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/rpm-software-management/rpm/commit/22ed98efe3d5198e4141948af7569cfa10d9d25f]
----
- configure.ac | 23 +++++++++++++++--------
- 1 file changed, 15 insertions(+), 8 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0a3a9bbf4..6a3ea3615 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -395,14 +395,21 @@ AC_SUBST(WITH_OPENSSL_LIB)
- WITH_LIBGCRYPT_INCLUDE=
- WITH_LIBGCRYPT_LIB=
- if test "$with_crypto" = libgcrypt ; then
--AC_PATH_TOOL(LIBGCRYPT_CONFIG, libgcrypt-config, notfound)
--if test notfound != "$LIBGCRYPT_CONFIG" ; then
--WITH_LIBGCRYPT_INCLUDE=`$LIBGCRYPT_CONFIG --cflags`
--WITH_LIBGCRYPT_LIB=`$LIBGCRYPT_CONFIG --libs`
--fi
--if test -z "$WITH_LIBGCRYPT_LIB" ; then
--AC_MSG_ERROR([libgcrypt not found])
--fi
-+  # libgcrypt 1.8.5 onwards ships a pkg-config file so prefer that
-+  PKG_CHECK_MODULES([LIBGCRYPT], [libgcrypt], [have_libgcrypt=yes], [have_libgcrypt=no])
-+  if test "$have_libgcrypt" = "yes"; then
-+    WITH_LIBGCRYPT_INCLUDE="$LIBGCRYPT_CFLAGS"
-+    WITH_LIBGCRYPT_LIB="$LIBGCRYPT_LIBS"
-+  else
-+    AC_PATH_TOOL(LIBGCRYPT_CONFIG, libgcrypt-config, notfound)
-+      if test notfound != "$LIBGCRYPT_CONFIG" ; then
-+        WITH_LIBGCRYPT_INCLUDE=`$LIBGCRYPT_CONFIG --cflags`
-+        WITH_LIBGCRYPT_LIB=`$LIBGCRYPT_CONFIG --libs`
-+     fi
-+     if test -z "$WITH_LIBGCRYPT_LIB" ; then
-+       AC_MSG_ERROR([libgcrypt not found])
-+    fi
-+  fi
- fi
- 
- AM_CONDITIONAL([WITH_LIBGCRYPT],[test "$with_crypto" = libgcrypt])
diff --git a/package/rpm/0001-lib-rpmdb-c-include-fcntl-h-for-O_.patch b/package/rpm/0001-lib-rpmdb-c-include-fcntl-h-for-O_.patch
new file mode 100644
index 0000000000..1c0aa51bac
--- /dev/null
+++ b/package/rpm/0001-lib-rpmdb-c-include-fcntl-h-for-O_.patch
@@ -0,0 +1,29 @@
+From 9395bdc64459357631111842e7a28304b4d76301 Mon Sep 17 00:00:00 2001
+From: Leo <thinkabit.ukim@gmail.com>
+Date: Wed, 30 Sep 2020 08:36:03 -0300
+Subject: [PATCH] lib/rpmdb.c: include fcntl.h for O_*
+
+Fixes compilation on musl, otherwise it fails with undefined references
+to various O_* symbols as mentioned here:
+
+https://www.man7.org/linux/man-pages/man0/fcntl.h.0p.html
+
+[Retrieved from:
+https://github.com/rpm-software-management/rpm/commit/9395bdc64459357631111842e7a28304b4d76301]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/rpmdb.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/rpmdb.c b/lib/rpmdb.c
+index 4c101569f..73187630b 100644
+--- a/lib/rpmdb.c
++++ b/lib/rpmdb.c
+@@ -8,6 +8,7 @@
+ #include <utime.h>
+ #include <errno.h>
+ #include <dirent.h>
++#include <fcntl.h>
+ 
+ #ifndef	DYING	/* XXX already in "system.h" */
+ #include <fnmatch.h>
diff --git a/package/rpm/0002-lib-rpmrc.c-include-fcntl.h-for-O_.patch b/package/rpm/0002-lib-rpmrc.c-include-fcntl.h-for-O_.patch
new file mode 100644
index 0000000000..c5db7f0a69
--- /dev/null
+++ b/package/rpm/0002-lib-rpmrc.c-include-fcntl.h-for-O_.patch
@@ -0,0 +1,31 @@
+From 8d446d33a705cb37420e1fda18379d7439ee841f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 25 Oct 2020 15:04:56 +0100
+Subject: [PATCH 2/2] lib/rpmrc.c: include fcntl.h for O_*
+
+Fixes compilation on musl, otherwise it fails with undefined references
+to various O_* symbols as mentioned here:
+
+https://www.man7.org/linux/man-pages/man0/fcntl.h.0p.html
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://github.com/rpm-software-management/rpm/pull/1413]
+---
+ lib/rpmrc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/rpmrc.c b/lib/rpmrc.c
+index 78c4a6d42..8bfe7a0ab 100644
+--- a/lib/rpmrc.c
++++ b/lib/rpmrc.c
+@@ -1,5 +1,6 @@
+ #include "system.h"
+ 
++#include <fcntl.h>
+ #include <stdarg.h>
+ #include <pthread.h>
+ 
+-- 
+2.28.0
+
diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index fc702c3097..ac979fdbad 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -10,7 +10,6 @@ config BR2_PACKAGE_RPM
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_BEECRYPT if !BR2_PACKAGE_LIBGCRYPT && !BR2_PACKAGE_LIBNSS && !BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_BERKELEYDB
 	select BR2_PACKAGE_FILE
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_ZLIB
diff --git a/package/rpm/rpm.hash b/package/rpm/rpm.hash
index cdb20e3b8f..7b2bd56d0a 100644
--- a/package/rpm/rpm.hash
+++ b/package/rpm/rpm.hash
@@ -1,5 +1,5 @@
-# From https://rpm.org/wiki/Releases/4.15.1.html
-sha256 ddef45f9601cd12042edfc9b6e37efcca32814e1e0f4bb8682d08144a3e2d230  rpm-4.15.1.tar.bz2
+# From https://rpm.org/wiki/Releases/4.16.0.html
+sha256  ca5974e9da2939afb422598818ef187385061889ba766166c4a3829c5ef8d411  rpm-4.16.0.tar.bz2
 
 # Hash for license file
-sha256 d56f4f1f290f6920cb053aef0dbcd0b853cda289e2568b364ddbfce220a6f3e0  COPYING
+sha256  171d94d9f1641316bff7f157a903237dc69cdb5fca405fed8c832c76ed8370f9  COPYING
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index d29c3febaa..661409294b 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-RPM_VERSION_MAJOR = 4.15
-RPM_VERSION = $(RPM_VERSION_MAJOR).1
+RPM_VERSION_MAJOR = 4.16
+RPM_VERSION = $(RPM_VERSION_MAJOR).0
 RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
 RPM_SITE = http://ftp.rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
 RPM_DEPENDENCIES = \
 	host-pkgconf \
-	berkeleydb \
 	$(if $(BR2_PACKAGE_BZIP2),bzip2) \
 	$(if $(BR2_PACKAGE_ELFUTILS),elfutils) \
 	file \
@@ -20,8 +19,6 @@ RPM_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES)
 RPM_LICENSE = GPL-2.0 or LGPL-2.0 (library only)
 RPM_LICENSE_FILES = COPYING
-# We're patching configure.ac
-RPM_AUTORECONF = YES
 
 RPM_CONF_OPTS = \
 	--disable-python \
@@ -38,6 +35,13 @@ else
 RPM_CONF_OPTS += --without-acl
 endif
 
+ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
+RPM_DEPENDENCIES += berkeleydb
+RPM_CONF_OPTS += --enable-bdb
+else
+RPM_CONF_OPTS += --disable-bdb
+endif
+
 ifeq ($(BR2_PACKAGE_DBUS),y)
 RPM_DEPENDENCIES += dbus
 RPM_CONF_OPTS += --enable-plugins
@@ -88,6 +92,13 @@ else
 RPM_CONF_OPTS += --without-selinux
 endif
 
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+RPM_DEPENDENCIES += sqlite
+RPM_CONF_OPTS += --enable-sqlite
+else
+RPM_CONF_OPTS += --disable-sqlite
+endif
+
 ifeq ($(BR2_PACKAGE_ZSTD),y)
 RPM_DEPENDENCIES += zstd
 RPM_CONF_OPTS += --enable-zstd
