From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 24 Mar 2020 22:00:41 +0100
Subject: [Buildroot] [PATCH 2/2] package/libmicrohttpd: remove dependency on
 threads
In-Reply-To: <20200324210041.628200-1-bernd.kuhls@t-online.de>
References: <20200324210041.628200-1-bernd.kuhls@t-online.de>
Message-ID: <20200324210041.628200-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream added support for non-threaded builds:
https://git.gnunet.org/libmicrohttpd.git/commit/configure.ac?id=0eefd20ba370509d93fb7b0220e6d1c5739efac5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/janus-gateway/Config.in               |  1 -
 ...0001-daemon.c-fix-non-threaded-build.patch | 35 +++++++++++++++++++
 package/libmicrohttpd/Config.in               |  4 ---
 package/libmicrohttpd/libmicrohttpd.mk        |  5 +++
 4 files changed, 40 insertions(+), 5 deletions(-)
 create mode 100644 package/libmicrohttpd/0001-daemon.c-fix-non-threaded-build.patch

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 9b70fa0cad..989ae26055 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -77,7 +77,6 @@ comment "RabbitMQ transport needs a toolchain w/ dynamic library, threads"
 
 config BR2_PACKAGE_JANUS_GATEWAY_REST
 	bool "REST (HTTP/HTTPS)"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBMICROHTTPD
 
 comment "REST transport needs a toolchain w/ threads"
diff --git a/package/libmicrohttpd/0001-daemon.c-fix-non-threaded-build.patch b/package/libmicrohttpd/0001-daemon.c-fix-non-threaded-build.patch
new file mode 100644
index 0000000000..ac9e9c2472
--- /dev/null
+++ b/package/libmicrohttpd/0001-daemon.c-fix-non-threaded-build.patch
@@ -0,0 +1,35 @@
+From 12e955560730b9caab0e73f693b6382413a8b48e Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Tue, 24 Mar 2020 21:53:27 +0100
+Subject: [PATCH] daemon.c: fix non-threaded build
+
+insanity_level is available only for threaded builds.
+
+Patch sent upstream: https://bugs.gnunet.org/view.php?id=6135
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/microhttpd/daemon.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/microhttpd/daemon.c b/src/microhttpd/daemon.c
+index 4f7c2108..51e9fd5b 100644
+--- a/src/microhttpd/daemon.c
++++ b/src/microhttpd/daemon.c
+@@ -5086,12 +5086,12 @@ parse_options_va (struct MHD_Daemon *daemon,
+       daemon->uri_log_callback_cls = va_arg (ap,
+                                              void *);
+       break;
++#if defined(MHD_USE_POSIX_THREADS) || defined(MHD_USE_W32_THREADS)
+     case MHD_OPTION_SERVER_INSANITY:
+       daemon->insanity_level = (enum MHD_DisableSanityCheck)
+                                va_arg (ap,
+                                        unsigned int);
+       break;
+-#if defined(MHD_USE_POSIX_THREADS) || defined(MHD_USE_W32_THREADS)
+     case MHD_OPTION_THREAD_POOL_SIZE:
+       daemon->worker_pool_size = va_arg (ap,
+                                          unsigned int);
+-- 
+2.25.0
+
diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index 7f3c9bb8fd..8477ef6668 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBMICROHTTPD
 	bool "libmicrohttpd"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  GNU libmicrohttpd is a small C library that makes it easy to
 	  run an HTTP server as part of another application.
@@ -21,6 +20,3 @@ comment "libmicrohttpd https support needs a toolchain w/ wchar, dynamic library
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
 
 endif
-
-comment "libmicrohttpd needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 2f5c28cd58..29afeefcea 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -22,7 +22,12 @@ LIBMICROHTTPD_LICENSE = LGPL-2.1+ or eCos
 LIBMICROHTTPD_CONF_OPTS += --disable-https
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBMICROHTTPD_CONF_OPTS += --with-threads=auto
 # fixes pthreads detection
 LIBMICROHTTPD_CFLAGS += -D_REENTRANT
+else
+LIBMICROHTTPD_CONF_OPTS += --with-threads=none
+endif
 
 $(eval $(autotools-package))
-- 
2.25.0
