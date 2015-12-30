From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 23:20:51 +0100
Subject: [Buildroot] [git commit] fetchmail: add libressl-enabling patch
Message-ID: <20151230222101.2F56B82748@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e31d09dbcfc9ae9b48a9f5fcb58c1fe50aa65c13
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch status: upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fetchmail/0002-enable-libressl.patch | 67 ++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/package/fetchmail/0002-enable-libressl.patch b/package/fetchmail/0002-enable-libressl.patch
new file mode 100644
index 0000000..a98e19d
--- /dev/null
+++ b/package/fetchmail/0002-enable-libressl.patch
@@ -0,0 +1,67 @@
+Fetched from upstream git and tweaked for the release:
+https://gitlab.com/fetchmail/fetchmail/commit/a2ae6f8d15d7caf815d7bdd13df833fd1b2af5cc
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura fetchmail-6.3.26.orig/config.h.in fetchmail-6.3.26/config.h.in
+--- fetchmail-6.3.26.orig/config.h.in	2015-12-30 10:44:33.467746835 -0300
++++ fetchmail-6.3.26/config.h.in	2015-12-30 10:45:50.271403589 -0300
+@@ -53,6 +53,10 @@
+    if you don't. */
+ #undef HAVE_DECL_SSLV2_CLIENT_METHOD
+ 
++/* Define to 1 if you have the declaration of `SSLv3_client_method', and to 0
++   if you don't. */
++#undef HAVE_DECL_SSLV3_CLIENT_METHOD
++
+ /* Define to 1 if you have the declaration of `strerror', and to 0 if you
+    don't. */
+ #undef HAVE_DECL_STRERROR
+diff -Nura fetchmail-6.3.26.orig/configure.ac fetchmail-6.3.26/configure.ac
+--- fetchmail-6.3.26.orig/configure.ac	2015-12-30 10:44:33.465746766 -0300
++++ fetchmail-6.3.26/configure.ac	2015-12-30 10:46:03.708868409 -0300
+@@ -803,6 +803,7 @@
+ 
+ case "$LIBS" in *-lssl*)
+ 	AC_CHECK_DECLS([SSLv2_client_method],,,[#include <openssl/ssl.h>])
++	AC_CHECK_DECLS([SSLv3_client_method],,,[#include <openssl/ssl.h>])
+ 	;;
+ esac
+ 
+diff -Nura fetchmail-6.3.26.orig/fetchmail.c fetchmail-6.3.26/fetchmail.c
+--- fetchmail-6.3.26.orig/fetchmail.c	2015-12-30 10:44:33.469746904 -0300
++++ fetchmail-6.3.26/fetchmail.c	2015-12-30 10:46:03.708868409 -0300
+@@ -263,6 +263,12 @@
+ #ifdef SSL_ENABLE
+ 	"+SSL"
+ #endif
++#if HAVE_DECL_SSLV2_CLIENT_METHOD + 0 == 0
++	"-SSLv2"
++#endif
++#if HAVE_DECL_SSLV3_CLIENT_METHOD + 0 == 0
++	"-SSLv3"
++#endif
+ #ifdef OPIE_ENABLE
+ 	"+OPIE"
+ #endif /* OPIE_ENABLE */
+diff -Nura fetchmail-6.3.26.orig/socket.c fetchmail-6.3.26/socket.c
+--- fetchmail-6.3.26.orig/socket.c	2015-12-30 10:44:33.464746731 -0300
++++ fetchmail-6.3.26/socket.c	2015-12-30 10:46:03.709868443 -0300
+@@ -910,11 +910,16 @@
+ #if HAVE_DECL_SSLV2_CLIENT_METHOD + 0 > 0
+ 			_ctx[sock] = SSL_CTX_new(SSLv2_client_method());
+ #else
+-			report(stderr, GT_("Your operating system does not support SSLv2.\n"));
++			report(stderr, GT_("Your OpenSSL version does not support SSLv2.\n"));
+ 			return -1;
+ #endif
+ 		} else if(!strcasecmp("ssl3",myproto)) {
++#if HAVE_DECL_SSLV3_CLIENT_METHOD + 0 > 0
+ 			_ctx[sock] = SSL_CTX_new(SSLv3_client_method());
++#else
++			report(stderr, GT_("Your OpenSSL version does not support SSLv3.\n"));
++			return -1;
++#endif
+ 		} else if(!strcasecmp("tls1",myproto)) {
+ 			_ctx[sock] = SSL_CTX_new(TLSv1_client_method());
+ 		} else if (!strcasecmp("ssl23",myproto)) {
