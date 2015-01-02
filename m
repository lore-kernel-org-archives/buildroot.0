From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  3 Jan 2015 00:20:00 +0100
Subject: [Buildroot] [PATCH] package/libwebsock: fix build when openssl is
	disabled
Message-ID: <1420240800-9736-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.org/results/951/95109c7e37aa21228bc71c69e9c66a6821f3174a/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...c-fully-disable-ssl-support-when-not-enab.patch | 88 ++++++++++++++++++++++
 package/libwebsock/libwebsock.mk                   |  7 ++
 2 files changed, 95 insertions(+)
 create mode 100644 package/libwebsock/0002-configure.ac-fully-disable-ssl-support-when-not-enab.patch

diff --git a/package/libwebsock/0002-configure.ac-fully-disable-ssl-support-when-not-enab.patch b/package/libwebsock/0002-configure.ac-fully-disable-ssl-support-when-not-enab.patch
new file mode 100644
index 0000000..753fb4f
--- /dev/null
+++ b/package/libwebsock/0002-configure.ac-fully-disable-ssl-support-when-not-enab.patch
@@ -0,0 +1,88 @@
+From 608297a6c6abdfb3677ddd35ed5b20a085f02a44 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Fri, 2 Jan 2015 23:58:16 +0100
+Subject: [PATCH] configure.ac: fully disable ssl support when not enabled
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ configure.ac  | 4 ++++
+ src/api.h     | 2 +-
+ src/types.h   | 4 ++--
+ src/websock.h | 4 ++--
+ 4 files changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index fc1cadc..dacd4f4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -48,6 +48,10 @@ AS_IF([test "x$have_ssl" = "xyes"],
+ 	[AS_IF([test "x$with_ssl" = "xyes"],
+ 		[AC_MSG_ERROR([SSL support requested but not found])
+ 	])])
++AS_IF([test "x$have_ssl" != "xyes"],
++	[
++		AC_DEFINE([WEBSOCK_HAVE_SSL], [0], [Disable SSL support])
++	])
+ 
+ AM_CONDITIONAL([HAVE_SSL], [test "x$have_ssl" = "xyes"])
+ 
+diff --git a/src/api.h b/src/api.h
+index d3e8e7c..6324b3d 100644
+--- a/src/api.h
++++ b/src/api.h
+@@ -37,7 +37,7 @@ libwebsock_context *libwebsock_init(void);
+ libwebsock_context *libwebsock_init_flags(int flags);
+ libwebsock_context *libwebsock_init_base(struct event_base *base, int flags);
+ 
+-#ifdef WEBSOCK_HAVE_SSL
++#if defined(WEBSOCK_HAVE_SSL) && WEBSOCK_HAVE_SSL
+ void libwebsock_bind_ssl(libwebsock_context *ctx, char *listen_host, char *port, char *keyfile, char *certfile);
+ void libwebsock_bind_ssl_real(libwebsock_context *ctx, char *listen_host, char *port, char *keyfile, char *certfile, char *chainfile);
+ #endif
+diff --git a/src/types.h b/src/types.h
+index 9c19795..6d4f1c5 100644
+--- a/src/types.h
++++ b/src/types.h
+@@ -90,7 +90,7 @@ typedef struct _libwebsock_client_state {
+         int (*onopen)(struct _libwebsock_client_state *);
+         int (*onclose)(struct _libwebsock_client_state *);
+         int (*onpong)(struct _libwebsock_client_state *);
+-#ifdef WEBSOCK_HAVE_SSL
++#if defined(WEBSOCK_HAVE_SSL) && WEBSOCK_HAVE_SSL
+         SSL *ssl;
+ #endif
+         libwebsock_close_info *close_info;
+@@ -132,7 +132,7 @@ typedef struct _libwebsock_fragmented {
+         struct _libwebsock_client_state *state;
+ } libwebsock_fragmented;
+ 
+-#ifdef WEBSOCK_HAVE_SSL
++#if defined(WEBSOCK_HAVE_SSL) && WEBSOCK_HAVE_SSL
+ typedef struct _libwebsock_ssl_event_data {
+         SSL_CTX *ssl_ctx;
+         libwebsock_context *ctx;
+diff --git a/src/websock.h b/src/websock.h
+index 1bbd410..83ac9dc 100644
+--- a/src/websock.h
++++ b/src/websock.h
+@@ -58,7 +58,7 @@
+ #include <event2/thread.h>
+ #include <wchar.h>
+ #include <errno.h>
+-#ifdef WEBSOCK_HAVE_SSL
++#if defined(WEBSOCK_HAVE_SSL) && WEBSOCK_HAVE_SSL
+ #include <openssl/ssl.h>
+ #include <openssl/err.h>
+ #include <event2/bufferevent_ssl.h>
+@@ -149,7 +149,7 @@ void libwebsock_fragmented_add(libwebsock_fragmented *frag, char *buf, unsigned
+ void libwebsock_fragmented_finish(libwebsock_fragmented *frag);
+ libwebsock_fragmented *libwebsock_fragmented_new(libwebsock_client_state *state);
+ 
+-#ifdef WEBSOCK_HAVE_SSL
++#if defined(WEBSOCK_HAVE_SSL) && WEBSOCK_HAVE_SSL
+ void libwebsock_handle_accept_ssl(evutil_socket_t listener, short event, void *arg);
+ #endif
+ 
+-- 
+2.2.1
+
diff --git a/package/libwebsock/libwebsock.mk b/package/libwebsock/libwebsock.mk
index 8458883..e57e3ea 100644
--- a/package/libwebsock/libwebsock.mk
+++ b/package/libwebsock/libwebsock.mk
@@ -12,4 +12,11 @@ LIBWEBSOCK_INSTALL_STAGING = YES
 LIBWEBSOCK_LICENSE = LGPLv3
 LIBWEBSOCK_LICENSE_FILES = COPYING.lesser
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBWEBSOCK_CONF_OPTS += --with-ssl
+LIBWEBSOCK_DEPENDENCIES += openssl
+else
+LIBWEBSOCK_CONF_OPTS += --without-ssl
+endif
+
 $(eval $(autotools-package))
-- 
2.2.1
