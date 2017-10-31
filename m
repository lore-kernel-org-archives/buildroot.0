From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Tue, 31 Oct 2017 12:22:57 -0500
Subject: [Buildroot] [PATCH v4 1/2] package/libssh2: Update to newest version
Message-ID: <1509470578-42323-1-git-send-email-sam.voss@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update libssh2 to use the newest version from git. This caused a
transition from released version number to hash as it has not been
version rev'd in over a year (see issue
https://github.com/libssh2/libssh2/issues/220 for bump request).

This brings in changes to the autoconf to correctly pick the crypto
library.

Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>

--

[v3->v4]
 - Fix changed comment
 - Remove comment about PGP checking in hash

[v2->v3]
 - Remove reconfigure hooks for moving files, carry patch for libssh2
   until upstreaming has completed.

CC: Yann E. MORIN <yann.morin.1998@free.fr>

 - Use '--with-crypto=' configure options of newest libssh2 versions.

CC: Baruch Siach <baruch@tkos.co.il>

[v1->v2]
 - Use LIBSSH2_AUTORECONF instead of calling explicitly
---
 .../0001-drop-custom-buildconf-script.patch        | 121 +++++++++++++++++++++
 package/libssh2/libssh2.hash                       |   5 +-
 package/libssh2/libssh2.mk                         |  23 ++--
 3 files changed, 135 insertions(+), 14 deletions(-)
 create mode 100644 package/libssh2/0001-drop-custom-buildconf-script.patch

diff --git a/package/libssh2/0001-drop-custom-buildconf-script.patch b/package/libssh2/0001-drop-custom-buildconf-script.patch
new file mode 100644
index 0000000..a9a98e0
--- /dev/null
+++ b/package/libssh2/0001-drop-custom-buildconf-script.patch
@@ -0,0 +1,121 @@
+From 39a2a444a32896bd2dab37c9b247ccfd11ff4693 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Mon, 30 Oct 2017 19:29:12 +0100
+Subject: [PATCH] buildsystem: drop custom buildconf script, rely on autoreconf
+
+The buildconf script is currently required, because we need to copy a
+header around, because it is used both from the library and the examples
+sources.
+
+However, having a custom 'buildconf'-like script is not needed if we can
+ensure that the header / exists by the time it is needed. For That, we
+can just append the src/ directory to the headers search path for the
+examples.
+
+And then it means we no longer need to generate the same header twice,
+so we remove the second one from configure.ac.
+
+Now, we can just call "autoreconf -fi" to generate the autotools files,
+instead of relying on the canned sequence in "buildconf", since
+autoreconf has now long known what to do at the correct moment (future
+versions of autotools, automake, autopoint, autoheader etc... may
+require an other ordering, or other intermediate steps, etc...).
+
+Eventually, get rid of buildconf now it is no longer needed. In fact, we
+really keep it for legacy, but have it just call autoreconf (and print a
+nice user-friendly warning).
+
+Update gitignore accordingly, too.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Cc: Sam Voss <sam.voss@rockwellcollins.com>
+---
+ .gitignore          |  2 ++
+ buildconf           | 24 +++++-------------------
+ configure.ac        |  2 +-
+ example/.gitignore  |  2 --
+ example/Makefile.am |  2 +-
+ 5 files changed, 9 insertions(+), 23 deletions(-)
+
+diff --git a/.gitignore b/.gitignore
+index 997e51e1..b6d6b5cb 100644
+--- a/.gitignore
++++ b/.gitignore
+@@ -13,6 +13,8 @@ Makefile
+ Makefile.in
+ aclocal.m4
+ autom4te.cache
++compile
++test-driver
+ config.guess
+ config.log
+ config.status
+diff --git a/buildconf b/buildconf
+index 558dcb66..728b3397 100755
+--- a/buildconf
++++ b/buildconf
+@@ -1,22 +1,8 @@
+ #!/bin/sh
+ 
+-LIBTOOLIZE="libtoolize"
++echo "***" >&2
++echo "*** Do not use buildconf. Instead, just use: autoreconf -fi" >&2
++echo "*** Doing it for you now, but buildconf may disapear in the future." >&2
++echo "***" >&2
+ 
+-if [ "x`which $LIBTOOLIZE`" = "x" ]; then
+-    LIBTOOLIZE="glibtoolize"
+-fi
+-
+-if [ "x`which $LIBTOOLIZE`" = "x" ]; then
+-    echo "Neither libtoolize nor glibtoolize could be found!"
+-    exit 1
+-fi
+-
+-${LIBTOOLIZE} --copy --automake --force
+-${ACLOCAL:-aclocal} -I m4 $ACLOCAL_FLAGS
+-${AUTOHEADER:-autoheader}
+-# copy the private libssh2_config.h.in to the examples dir so that
+-# it can be included without pointing the include path to the private
+-# source dir
+-cp src/libssh2_config.h.in example/libssh2_config.h.in
+-${AUTOCONF:-autoconf}
+-${AUTOMAKE:-automake} --add-missing --copy
++${AUTORECONF:-autoreconf} -fi "${@}"
+diff --git a/configure.ac b/configure.ac
+index c6ff7535..6939d0d6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2,7 +2,7 @@
+ AC_INIT(libssh2, [-], libssh2-devel at cool.haxx.se)
+ AC_CONFIG_MACRO_DIR([m4])
+ AC_CONFIG_SRCDIR([src])
+-AC_CONFIG_HEADERS([src/libssh2_config.h example/libssh2_config.h])
++AC_CONFIG_HEADERS([src/libssh2_config.h])
+ AM_MAINTAINER_MODE
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ 
+diff --git a/example/.gitignore b/example/.gitignore
+index 13448191..cac152b8 100644
+--- a/example/.gitignore
++++ b/example/.gitignore
+@@ -20,8 +20,6 @@ sftp_write_nonblock
+ config.h.in
+ ssh2_exec
+ ssh2_agent
+-libssh2_config.h
+-libssh2_config.h.in
+ stamp-h2
+ sftp_append
+ sftp_write_sliding
+diff --git a/example/Makefile.am b/example/Makefile.am
+index 5cf5f071..41f65b12 100644
+--- a/example/Makefile.am
++++ b/example/Makefile.am
+@@ -13,5 +13,5 @@ if HAVE_SYS_UN_H
+ noinst_PROGRAMS += x11
+ endif
+ 
+-AM_CPPFLAGS = -I$(top_srcdir)/include -I$(top_builddir)/example
++AM_CPPFLAGS = -I$(top_srcdir)/include -I$(top_builddir)/example -I../src
+ LDADD = $(top_builddir)/src/libssh2.la
diff --git a/package/libssh2/libssh2.hash b/package/libssh2/libssh2.hash
index 6b1cced..d36262a 100644
--- a/package/libssh2/libssh2.hash
+++ b/package/libssh2/libssh2.hash
@@ -1,3 +1,2 @@
-# Locally calculated after checking pgp signature
-# https://www.libssh2.org/download/libssh2-1.8.0.tar.gz.asc
-sha256	39f34e2f6835f4b992cafe8625073a88e5a28ba78f83e8099610a7b3af4676d4	libssh2-1.8.0.tar.gz
+# Locally calculated
+sha256 e73d55cd512863aa6423c6e137039e3e1bcbf5ba87f130e7441132c2c78a5425 libssh2-616fd4d1b3e4a55de67c48819fefca83132126b5.tar.gz
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index dedb890..f1f0ec6 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -4,32 +4,33 @@
 #
 ################################################################################
 
-LIBSSH2_VERSION = 1.8.0
-LIBSSH2_SITE = http://www.libssh2.org/download
+LIBSSH2_VERSION = 616fd4d1b3e4a55de67c48819fefca83132126b5
+LIBSSH2_SITE = $(call github,libssh2,libssh2,$(LIBSSH2_VERSION))
 LIBSSH2_LICENSE = BSD
 LIBSSH2_LICENSE_FILES = COPYING
 LIBSSH2_INSTALL_STAGING = YES
 LIBSSH2_CONF_OPTS = --disable-examples-build
 
+# autoreconf must be ran when building off git, as it has not been ran at hash
+LIBSSH2_AUTORECONF = YES
+
 # Dependency is one of mbedtls, libgcrypt or openssl, guaranteed in
 # Config.in. Favour mbedtls.
-ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
 LIBSSH2_DEPENDENCIES += mbedtls
-LIBSSH2_CONF_OPTS += --with-mbedtls=$(STAGING_DIR)/usr \
-	--without-openssl --without-libgcrypt
-LIBSSH2_CONF_ENV += ac_cv_libgcrypt=no
+LIBSSH2_CONF_OPTS += --with-libmbedcrypto-prefix=$(STAGING_DIR)/usr \
+	--with-crypto=mbedtls
 else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 LIBSSH2_DEPENDENCIES += libgcrypt
-LIBSSH2_CONF_OPTS += --with-libgcrypt=$(STAGING_DIR)/usr \
-	--without-openssl --without-mbedtls
+LIBSSH2_CONF_OPTS += --with-libgcrypt-prefix=$(STAGING_DIR)/usr \
+	--with-crypto=libgcrypt
 # configure.ac forgets to link to dependent libraries of gcrypt breaking static
 # linking
 LIBSSH2_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/libgcrypt-config --libs`"
 else
 LIBSSH2_DEPENDENCIES += openssl
-LIBSSH2_CONF_OPTS += --with-openssl \
-	--with-libssl-prefix=$(STAGING_DIR)/usr \
-	--without-libgcrypt --without-mbedtls
+LIBSSH2_CONF_OPTS += --with-libssl-prefix=$(STAGING_DIR)/usr \
+	--with-crypto=openssl
 endif
 
 # Add zlib support if enabled
-- 
1.9.1
