From: Gilles Talis <gilles.talis@gmail.com>
Date: Sat, 22 Feb 2020 17:35:29 +0100
Subject: [Buildroot] [PATCH 2/3] package/libeXosip2: bump to version 5.1.1
In-Reply-To: <20200222163530.17015-1-gilles.talis@gmail.com>
References: <20200222163530.17015-1-gilles.talis@gmail.com>
Message-ID: <20200222163530.17015-2-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Removed patch that was applied upstream
- Removed AUTORECONF request that came with patch
- Updated library's download name

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 ...001-use-pkg-config-to-detect-openssl.patch | 62 -------------------
 package/libeXosip2/libeXosip2.hash            |  2 +-
 package/libeXosip2/libeXosip2.mk              |  7 +--
 3 files changed, 4 insertions(+), 67 deletions(-)
 delete mode 100644 package/libeXosip2/0001-use-pkg-config-to-detect-openssl.patch

diff --git a/package/libeXosip2/0001-use-pkg-config-to-detect-openssl.patch b/package/libeXosip2/0001-use-pkg-config-to-detect-openssl.patch
deleted file mode 100644
index 69e349f205..0000000000
--- a/package/libeXosip2/0001-use-pkg-config-to-detect-openssl.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-configure: use pkg-config to find openssl
-
-The current check is broken for static linking, since the openssl
-libs need to be linked against libz, which is missing in the link
-command when doing a static build:
-    http://autobuild.buildroot.net/results/787/787cd9992b00d8008641af208f5fb7c4afb40b06/build-end.log
-
-Instead of trying convoluted tests to decide what additional libs
-are required, just delegate this job to pkg-config.
-
-At the same time, fix a few legacy, deprecated constructs in favour
-of their new counterparts.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
-Upstream status: submitted, but no public mailing list (sent to the
-mail documented in: http://www.antisip.com/doc/exosip2/index.html )
-
-diff -durN libeXosip2-3.6.0.orig/configure.in libeXosip2-3.6.0/configure.in
---- libeXosip2-3.6.0.orig/configure.in	2014-06-22 23:58:26.549487427 +0200
-+++ libeXosip2-3.6.0/configure.in	2014-06-22 23:59:12.822008499 +0200
-@@ -44,7 +44,7 @@
- AC_CONFIG_AUX_DIR(scripts)
- AC_CONFIG_HEADERS(config.h)
- AM_INIT_AUTOMAKE($PACKAGE, $VERSION)
--AM_ACLOCAL_INCLUDE(scripts)
-+AC_CONFIG_MACRO_DIR([scripts])
- 
- AC_CANONICAL_HOST
- 
-@@ -371,13 +371,15 @@
- 
- AC_ARG_ENABLE(openssl,
- 	[  --enable-openssl        enable support for openssl],
--	enable_openssl=$enableval,enable_openssl="yes")
-+	enable_openssl=$enableval,enable_openssl="auto")
- 
--if test "$enable_openssl" = "yes" ; then
--	AC_CHECK_HEADERS(openssl/ssl.h)
--	AC_CHECK_LIB(ssl,SSL_CTX_new,[EXOSIP_LIB="$EXOSIP_LIB -lssl"])
--	AC_CHECK_LIB(crypto,X509_get_issuer_name,[EXOSIP_LIB="$EXOSIP_LIB -lcrypto"])
--fi
-+AS_IF([test "$enable_openssl" = "yes" -o "$enable_openssl" = "auto"],
-+      [PKG_CHECK_MODULES([SSL], [openssl],
-+                         [EXOSIP_LIB="$EXOSIP_LIB $SSL_LIBS"],
-+                         [AS_IF([test "$enable_openssl" = "yes"],
-+                                [AC_MSG_ERROR([can not find openssl])])
-+                         ])
-+      ])
- 
- AC_ARG_ENABLE(srvrec,
- 	[  --enable-srvrec         enable support for SRV records DNS queries (yes) ],
-diff -durN build/libeXosip2-3.6.0.orig/Makefile.am build/libeXosip2-3.6.0/Makefile.am
---- libeXosip2-3.6.0.orig/Makefile.am	2014-06-23 00:14:25.328226745 +0200
-+++ libeXosip2-3.6.0/Makefile.am	2014-06-23 00:14:38.296371236 +0200
-@@ -1,4 +1,4 @@
--
-+ACLOCAL_AMFLAGS = -I scripts
- EXTRA_DIST = README autogen.sh
- 
- SUBDIRS = scripts platform src include tools help
diff --git a/package/libeXosip2/libeXosip2.hash b/package/libeXosip2/libeXosip2.hash
index 86335a3c47..a7d3c56d00 100644
--- a/package/libeXosip2/libeXosip2.hash
+++ b/package/libeXosip2/libeXosip2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 91da1a084c9ab663afe04b493342e075ad59ac54a1af011c7f2ba4543a923564 libeXosip2-3.6.0.tar.gz
+sha256 21420c00bf8e0895ff36161766beec12b7e6f1d371030c389dba845e271272e2 libexosip2-5.1.1.tar.gz
 sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670 COPYING
diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index 04f8672c40..4bd8922b41 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-LIBEXOSIP2_VERSION = 3.6.0
+LIBEXOSIP2_VERSION = 5.1.1
+# Since version 5.0, letter 'X' in library's name is in lower case
+LIBEXOSIP2_SOURCE = libexosip2-$(LIBEXOSIP2_VERSION).tar.gz
 LIBEXOSIP2_SITE = http://download.savannah.gnu.org/releases/exosip
 LIBEXOSIP2_INSTALL_STAGING = YES
 LIBEXOSIP2_LICENSE = GPL-2.0+
@@ -12,9 +14,6 @@ LIBEXOSIP2_LICENSE_FILES = COPYING
 
 LIBEXOSIP2_DEPENDENCIES = host-pkgconf libosip2
 
-# We are touching configure.in and Makefile.am with one of our patches
-LIBEXOSIP2_AUTORECONF = YES
-
 ifeq ($(BR2_arc),y)
 # toolchain __arc__ define conflicts with libeXosip2 source
 LIBEXOSIP2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -U__arc__"
-- 
2.17.1
