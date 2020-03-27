From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 27 Mar 2020 19:50:45 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/libmicrohttpd: remove dependency
 on threads
Message-ID: <20200327185045.578048-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream added support for non-threaded builds:
https://git.gnunet.org/libmicrohttpd.git/commit/configure.ac?id=0eefd20ba370509d93fb7b0220e6d1c5739efac5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: removed _REENTRANT hack (Thomas)
    updated patch

 package/janus-gateway/Config.in           |  1 -
 package/libmicrohttpd/0001-fix-6135.patch | 46 +++++++++++++++++++++++
 package/libmicrohttpd/Config.in           |  4 --
 package/libmicrohttpd/libmicrohttpd.mk    |  6 +++
 4 files changed, 52 insertions(+), 5 deletions(-)
 create mode 100644 package/libmicrohttpd/0001-fix-6135.patch

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
diff --git a/package/libmicrohttpd/0001-fix-6135.patch b/package/libmicrohttpd/0001-fix-6135.patch
new file mode 100644
index 0000000000..af410284aa
--- /dev/null
+++ b/package/libmicrohttpd/0001-fix-6135.patch
@@ -0,0 +1,46 @@
+From 6702e6202368720d7a381669c03eedc318f225ca Mon Sep 17 00:00:00 2001
+From: Christian Grothoff <christian@grothoff.org>
+Date: Thu, 26 Mar 2020 19:08:30 +0100
+Subject: [PATCH] fix #6135
+
+Downloaded from upstream commit to fix non-threaded build:
+https://git.gnunet.org/libmicrohttpd.git/commit/?id=6702e6202368720d7a381669c03eedc318f225ca
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/microhttpd/internal.h | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/microhttpd/internal.h b/src/microhttpd/internal.h
+index 211eed9f..ad16535e 100644
+--- a/src/microhttpd/internal.h
++++ b/src/microhttpd/internal.h
+@@ -1462,12 +1462,6 @@ struct MHD_Daemon
+    */
+   size_t thread_stack_size;
+ 
+-  /**
+-   * Our #MHD_OPTION_SERVER_INSANITY level, bits indicating
+-   * which sanity checks are off.
+-   */
+-  enum MHD_DisableSanityCheck insanity_level;
+-
+   /**
+    * Number of worker daemons
+    */
+@@ -1490,6 +1484,12 @@ struct MHD_Daemon
+   MHD_mutex_ cleanup_connection_mutex;
+ #endif
+ 
++  /**
++   * Our #MHD_OPTION_SERVER_INSANITY level, bits indicating
++   * which sanity checks are off.
++   */
++  enum MHD_DisableSanityCheck insanity_level;
++
+   /**
+    * Listen socket.
+    */
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
index f47d7ec214..ea2de55804 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -22,4 +22,10 @@ LIBMICROHTTPD_LICENSE = LGPL-2.1+ or eCos
 LIBMICROHTTPD_CONF_OPTS += --disable-https
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBMICROHTTPD_CONF_OPTS += --with-threads=auto
+else
+LIBMICROHTTPD_CONF_OPTS += --with-threads=none
+endif
+
 $(eval $(autotools-package))
-- 
2.25.0
