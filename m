From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Jun 2014 00:41:28 +0200
Subject: [Buildroot] [PATCH] package/libeXosip2: fix build for static linking
Message-ID: <1403476888-22256-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Add a new patch to use pkg-config to detect openssl.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
To be noted: we're direly lagging behind on libeXosip2: we're at
version 3.6.0, which is at least two years old. There's now a 4.1.0
release. If time permits, I'll tackle this bump...
---
 ...ch => libeXosip2-0000-fix-non-ipv6-build.patch} |  0
 ...ip2-0001-use-pkg-config-to-detect-openssl.patch | 62 ++++++++++++++++++++++
 package/libeXosip2/libeXosip2.mk                   |  3 ++
 3 files changed, 65 insertions(+)
 rename package/libeXosip2/{libeXosip2-fix-non-ipv6-build.patch => libeXosip2-0000-fix-non-ipv6-build.patch} (100%)
 create mode 100644 package/libeXosip2/libeXosip2-0001-use-pkg-config-to-detect-openssl.patch

diff --git a/package/libeXosip2/libeXosip2-fix-non-ipv6-build.patch b/package/libeXosip2/libeXosip2-0000-fix-non-ipv6-build.patch
similarity index 100%
rename from package/libeXosip2/libeXosip2-fix-non-ipv6-build.patch
rename to package/libeXosip2/libeXosip2-0000-fix-non-ipv6-build.patch
diff --git a/package/libeXosip2/libeXosip2-0001-use-pkg-config-to-detect-openssl.patch b/package/libeXosip2/libeXosip2-0001-use-pkg-config-to-detect-openssl.patch
new file mode 100644
index 0000000..91683d6
--- /dev/null
+++ b/package/libeXosip2/libeXosip2-0001-use-pkg-config-to-detect-openssl.patch
@@ -0,0 +1,62 @@
+configure: use pkg-config to find openssl
+
+The current check is broken for static linking, since it the openssl
+libs need to be linked against libz, which is missing in the link
+command when doing a static build:
+    http://autobuild.buildroot.net/results/787/787cd9992b00d8008641af208f5fb7c4afb40b06/build-end.log
+
+Instead of trying convoluted tests to decide what additional libs
+are required, just delegate this job to pkg-config.
+
+At the same time, fix a few legacy, deprecated constructs in favour
+of their new counterparts.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Upstream status: submitted, but no public mailing list (sent to the
+mail documented in: http://www.antisip.com/doc/exosip2/index.html )
+
+diff -durN libeXosip2-3.6.0.orig/configure.in libeXosip2-3.6.0/configure.in
+--- libeXosip2-3.6.0.orig/configure.in	2014-06-22 23:58:26.549487427 +0200
++++ libeXosip2-3.6.0/configure.in	2014-06-22 23:59:12.822008499 +0200
+@@ -44,7 +44,7 @@
+ AC_CONFIG_AUX_DIR(scripts)
+ AC_CONFIG_HEADERS(config.h)
+ AM_INIT_AUTOMAKE($PACKAGE, $VERSION)
+-AM_ACLOCAL_INCLUDE(scripts)
++AC_CONFIG_MACRO_DIR([scripts])
+ 
+ AC_CANONICAL_HOST
+ 
+@@ -371,13 +371,15 @@
+ 
+ AC_ARG_ENABLE(openssl,
+ 	[  --enable-openssl        enable support for openssl],
+-	enable_openssl=$enableval,enable_openssl="yes")
++	enable_openssl=$enableval,enable_openssl="auto")
+ 
+-if test "$enable_openssl" = "yes" ; then
+-	AC_CHECK_HEADERS(openssl/ssl.h)
+-	AC_CHECK_LIB(ssl,SSL_CTX_new,[EXOSIP_LIB="$EXOSIP_LIB -lssl"])
+-	AC_CHECK_LIB(crypto,X509_get_issuer_name,[EXOSIP_LIB="$EXOSIP_LIB -lcrypto"])
+-fi
++AS_IF([test "$enable_openssl" = "yes" -o "$enable_openssl" = "auto"],
++      [PKG_CHECK_MODULES([SSL], [openssl],
++                         [EXOSIP_LIB="$EXOSIP_LIB $SSL_LIBS"],
++                         [AS_IF([test "$enable_openssl" = "yes"],
++                                [AC_MSG_ERROR([can not find openssl])])
++                         ])
++      ])
+ 
+ AC_ARG_ENABLE(srvrec,
+ 	[  --enable-srvrec         enable support for SRV records DNS queries (yes) ],
+diff -durN build/libeXosip2-3.6.0.orig/Makefile.am build/libeXosip2-3.6.0/Makefile.am
+--- libeXosip2-3.6.0.orig/Makefile.am	2014-06-23 00:14:25.328226745 +0200
++++ libeXosip2-3.6.0/Makefile.am	2014-06-23 00:14:38.296371236 +0200
+@@ -1,4 +1,4 @@
+-
++ACLOCAL_AMFLAGS = -I scripts
+ EXTRA_DIST = README autogen.sh
+ 
+ SUBDIRS = scripts platform src include tools help
diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index 6abdaab..e1f2497 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -12,6 +12,9 @@ LIBEXOSIP2_LICENSE_FILES = COPYING
 
 LIBEXOSIP2_DEPENDENCIES = host-pkgconf libosip2
 
+# We are touching configure.in and Makefile.am with one of our patch
+LIBEXOSIP2_AUTORECONF = YES
+
 ifeq ($(BR2_arc),y)
 # toolchain __arc__ define conflicts with libeXosip2 source
 LIBEXOSIP2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -U__arc__"
-- 
1.8.3.2
