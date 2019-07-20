From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Jul 2019 11:31:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to
 6.4.0.beta5
Message-ID: <20190720093103.29357-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This bump brings buildroot in-line with Debian stable which also
provides this version after version 6.3 was removed from testing
in 2017: https://tracker.debian.org/pkg/fetchmail

Removed patches applied upstream:
https://gitlab.com/fetchmail/fetchmail/commit/bcab21a977732e2fe24f37cb394f913af0d8b166
https://gitlab.com/fetchmail/fetchmail/commit/a2ae6f8d15d7caf815d7bdd13df833fd1b2af5cc

fetchmailconf.py received various python3-related patches:
https://gitlab.com/fetchmail/fetchmail/commits/legacy_64/fetchmailconf.py

Therefore FETCHMAIL_REMOVE_FETCHMAILCONF_PY is not needed anymore.

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/fetchmail/0001-enable-libressl.patch  | 67 ------------------
 ...re.ac-use-pkg-config-to-find-openssl.patch | 69 -------------------
 package/fetchmail/fetchmail.hash              |  3 +-
 package/fetchmail/fetchmail.mk                | 16 +----
 4 files changed, 4 insertions(+), 151 deletions(-)
 delete mode 100644 package/fetchmail/0001-enable-libressl.patch
 delete mode 100644 package/fetchmail/0002-configure.ac-use-pkg-config-to-find-openssl.patch

diff --git a/package/fetchmail/0001-enable-libressl.patch b/package/fetchmail/0001-enable-libressl.patch
deleted file mode 100644
index a98e19dda4..0000000000
--- a/package/fetchmail/0001-enable-libressl.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-Fetched from upstream git and tweaked for the release:
-https://gitlab.com/fetchmail/fetchmail/commit/a2ae6f8d15d7caf815d7bdd13df833fd1b2af5cc
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura fetchmail-6.3.26.orig/config.h.in fetchmail-6.3.26/config.h.in
---- fetchmail-6.3.26.orig/config.h.in	2015-12-30 10:44:33.467746835 -0300
-+++ fetchmail-6.3.26/config.h.in	2015-12-30 10:45:50.271403589 -0300
-@@ -53,6 +53,10 @@
-    if you don't. */
- #undef HAVE_DECL_SSLV2_CLIENT_METHOD
- 
-+/* Define to 1 if you have the declaration of `SSLv3_client_method', and to 0
-+   if you don't. */
-+#undef HAVE_DECL_SSLV3_CLIENT_METHOD
-+
- /* Define to 1 if you have the declaration of `strerror', and to 0 if you
-    don't. */
- #undef HAVE_DECL_STRERROR
-diff -Nura fetchmail-6.3.26.orig/configure.ac fetchmail-6.3.26/configure.ac
---- fetchmail-6.3.26.orig/configure.ac	2015-12-30 10:44:33.465746766 -0300
-+++ fetchmail-6.3.26/configure.ac	2015-12-30 10:46:03.708868409 -0300
-@@ -803,6 +803,7 @@
- 
- case "$LIBS" in *-lssl*)
- 	AC_CHECK_DECLS([SSLv2_client_method],,,[#include <openssl/ssl.h>])
-+	AC_CHECK_DECLS([SSLv3_client_method],,,[#include <openssl/ssl.h>])
- 	;;
- esac
- 
-diff -Nura fetchmail-6.3.26.orig/fetchmail.c fetchmail-6.3.26/fetchmail.c
---- fetchmail-6.3.26.orig/fetchmail.c	2015-12-30 10:44:33.469746904 -0300
-+++ fetchmail-6.3.26/fetchmail.c	2015-12-30 10:46:03.708868409 -0300
-@@ -263,6 +263,12 @@
- #ifdef SSL_ENABLE
- 	"+SSL"
- #endif
-+#if HAVE_DECL_SSLV2_CLIENT_METHOD + 0 == 0
-+	"-SSLv2"
-+#endif
-+#if HAVE_DECL_SSLV3_CLIENT_METHOD + 0 == 0
-+	"-SSLv3"
-+#endif
- #ifdef OPIE_ENABLE
- 	"+OPIE"
- #endif /* OPIE_ENABLE */
-diff -Nura fetchmail-6.3.26.orig/socket.c fetchmail-6.3.26/socket.c
---- fetchmail-6.3.26.orig/socket.c	2015-12-30 10:44:33.464746731 -0300
-+++ fetchmail-6.3.26/socket.c	2015-12-30 10:46:03.709868443 -0300
-@@ -910,11 +910,16 @@
- #if HAVE_DECL_SSLV2_CLIENT_METHOD + 0 > 0
- 			_ctx[sock] = SSL_CTX_new(SSLv2_client_method());
- #else
--			report(stderr, GT_("Your operating system does not support SSLv2.\n"));
-+			report(stderr, GT_("Your OpenSSL version does not support SSLv2.\n"));
- 			return -1;
- #endif
- 		} else if(!strcasecmp("ssl3",myproto)) {
-+#if HAVE_DECL_SSLV3_CLIENT_METHOD + 0 > 0
- 			_ctx[sock] = SSL_CTX_new(SSLv3_client_method());
-+#else
-+			report(stderr, GT_("Your OpenSSL version does not support SSLv3.\n"));
-+			return -1;
-+#endif
- 		} else if(!strcasecmp("tls1",myproto)) {
- 			_ctx[sock] = SSL_CTX_new(TLSv1_client_method());
- 		} else if (!strcasecmp("ssl23",myproto)) {
diff --git a/package/fetchmail/0002-configure.ac-use-pkg-config-to-find-openssl.patch b/package/fetchmail/0002-configure.ac-use-pkg-config-to-find-openssl.patch
deleted file mode 100644
index aefed7f2e4..0000000000
--- a/package/fetchmail/0002-configure.ac-use-pkg-config-to-find-openssl.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 1ed0af7f1bbcaccbd7356bd90596f5c942b64720 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 22 Mar 2019 20:24:54 +0100
-Subject: [PATCH 1/1] configure.ac: use pkg-config to find openssl
-
-openssl can have multiples dependencies such as libatomic on sparcv8
-32 bits
-
-Fixes:
- - http://autobuild.buildroot.org/results/58e5aa7c6ba8fe7474071d7a3cba6ed3a1b4cff4
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.com/fetchmail/fetchmail/merge_requests/14]
----
- configure.ac | 37 +++++++++++++++++++------------------
- 1 file changed, 19 insertions(+), 18 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 16b0fcba..3a75ec6e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -778,24 +778,25 @@ then
-   else
-     AC_MSG_ERROR([SSL support enabled, but OpenSSL not found])
-   fi
--  LDFLAGS="$LDFLAGS -L$with_ssl/lib"
--  LIBS="$LIBS -lssl -lcrypto"
--  dnl check if -ldl is needed
--  AC_MSG_CHECKING([for additional library dependencies of SSL])
--  found=0
--  save_LIBS="$LIBS"
--  for i in "" "-ldl" ; do
--      LIBS="$LDFLAGS $save_LIBS $i"
--      AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <openssl/ssl.h>],[SSL_library_init()])],[found=1; break])
--  done
--  if test $found = 0 ; then
--      AC_MSG_RESULT([error])
--      AC_MSG_ERROR([cannot link with SSL - check config.log])
--  fi
--  LIBS="$save_LIBS $i"
--  if test "$i" = "" ; then i="(none)" ; fi
--  AC_MSG_RESULT($i)
--  dnl XXX FIXME: use pkg-config if available!
-+  PKG_CHECK_MODULES([SSL],[libssl libcrypto],[LIBS="$LIBS $SSL_LIBS"],[
-+    LDFLAGS="$LDFLAGS -L$with_ssl/lib"
-+    LIBS="$LIBS -lssl -lcrypto"
-+    dnl check if -ldl is needed
-+    AC_MSG_CHECKING([for additional library dependencies of SSL])
-+    found=0
-+    save_LIBS="$LIBS"
-+    for i in "" "-ldl" ; do
-+        LIBS="$LDFLAGS $save_LIBS $i"
-+        AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <openssl/ssl.h>],[SSL_library_init()])],[found=1; break])
-+    done
-+    if test $found = 0 ; then
-+        AC_MSG_RESULT([error])
-+        AC_MSG_ERROR([cannot link with SSL - check config.log])
-+    fi
-+    LIBS="$save_LIBS $i"
-+    if test "$i" = "" ; then i="(none)" ; fi
-+    AC_MSG_RESULT($i)
-+  ])
-   AC_DEFINE(SSL_ENABLE)
- else
-   AC_MSG_WARN(Disabling SSL support.)
--- 
-2.20.1
-
diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index c67ee1a4e1..1a9499ab29 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256  79b4c54cdbaf02c1a9a691d9948fcb1a77a1591a813e904283a8b614b757e850  fetchmail-6.3.26.tar.xz
+sha256 832fded80908670d0ae31b4ac4a4e292d4fdb1855578bb9ac0e9e2f63efa5a39  fetchmail-6.4.0.beta5.tar.xz
+sha256 8b9e9688c0fc566adfa56f9d9ebaabf60e5a58ca365a282cf5742bd22fd97378  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 41505e8637..c008cd2c7c 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-FETCHMAIL_VERSION_MAJOR = 6.3
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).26
+FETCHMAIL_VERSION_MAJOR = 6.4
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).0.beta5
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
 FETCHMAIL_LICENSE_FILES = COPYING
-FETCHMAIL_AUTORECONF = YES
-FETCHMAIL_GETTEXTIZE = YES
 
 FETCHMAIL_CONF_OPTS = \
 	--with-ssl=$(STAGING_DIR)/usr
@@ -22,14 +20,4 @@ FETCHMAIL_DEPENDENCIES = \
 	openssl \
 	$(TARGET_NLS_DEPENDENCIES)
 
-# fetchmailconf.py script is not (yet) python3-compliant.
-# Prevent the pyc-compilation with python-3 from failing by removing this
-# non-critical script.
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-define FETCHMAIL_REMOVE_FETCHMAILCONF_PY
-	$(RM) -f $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/fetchmailconf.py
-endef
-FETCHMAIL_POST_INSTALL_TARGET_HOOKS += FETCHMAIL_REMOVE_FETCHMAILCONF_PY
-endif
-
 $(eval $(autotools-package))
-- 
2.20.1
