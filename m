From: heiko.thiery at gmail.com <heiko.thiery@gmail.com>
Date: Tue,  1 Oct 2019 16:30:18 +0200
Subject: [Buildroot] [PATCH 5/9] package/libnetconf2: add package
In-Reply-To: <20191001143023.698-1-heiko.thiery@gmail.com>
References: <20191001143023.698-1-heiko.thiery@gmail.com>
Message-ID: <20191001143023.698-5-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

libnetconf2 is a NETCONF library in C intended for building
NETCONF clients and servers.

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../0001-Add-support-for-musl-libc.patch      | 60 +++++++++++++++++++
 package/libnetconf2/Config.in                 | 10 ++++
 package/libnetconf2/libnetconf2.hash          |  2 +
 package/libnetconf2/libnetconf2.mk            | 28 +++++++++
 6 files changed, 102 insertions(+)
 create mode 100644 package/libnetconf2/0001-Add-support-for-musl-libc.patch
 create mode 100644 package/libnetconf2/Config.in
 create mode 100644 package/libnetconf2/libnetconf2.hash
 create mode 100644 package/libnetconf2/libnetconf2.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a378ff2a61..527b8cccac 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1039,6 +1039,7 @@ F:	package/python-sip/
 N:	Heiko Thiery <heiko.thiery@gmail.com>
 F:	package/libredblack/
 F:	package/libyang/
+F:	package/libnetconf2/
 
 N:	Henrique Camargo <henrique@henriquecamargo.com>
 F:	package/json-glib/
diff --git a/package/Config.in b/package/Config.in
index 04cd466eba..f9b1b88b91 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1607,6 +1607,7 @@ menu "Networking"
 	source "package/libnatpmp/Config.in"
 	source "package/libndp/Config.in"
 	source "package/libnet/Config.in"
+	source "package/libnetconf2/Config.in"
 	source "package/libnetfilter_acct/Config.in"
 	source "package/libnetfilter_conntrack/Config.in"
 	source "package/libnetfilter_cthelper/Config.in"
diff --git a/package/libnetconf2/0001-Add-support-for-musl-libc.patch b/package/libnetconf2/0001-Add-support-for-musl-libc.patch
new file mode 100644
index 0000000000..e6d97ba90f
--- /dev/null
+++ b/package/libnetconf2/0001-Add-support-for-musl-libc.patch
@@ -0,0 +1,60 @@
+From 153fe40bd60499677e825e66501e8601536e0323 Mon Sep 17 00:00:00 2001
+From: Rosen Penev <rosenp@gmail.com>
+Date: Mon, 15 Jul 2019 18:15:28 -0700
+Subject: [PATCH] Add support for musl libc
+
+musl does not support pthread_rwlockattr_setkind_np. Don't use it if it is
+not available.
+---
+ CMakeLists.txt       | 1 +
+ src/config.h.in      | 3 +++
+ src/session_server.c | 2 ++
+ 3 files changed, 6 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 624b8c8..c05cd03 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -176,6 +176,7 @@ target_link_libraries(netconf2 ${CMAKE_THREAD_LIBS_INIT})
+ set(CMAKE_REQUIRED_LIBRARIES pthread)
+ check_include_file(stdatomic.h HAVE_STDATOMIC)
+ check_function_exists(pthread_mutex_timedlock HAVE_PTHREAD_MUTEX_TIMEDLOCK)
++check_function_exists(pthread_rwlockattr_setkind_np HAVE_PTHREAD_RWLOCKATTR_SETKIND_NP)
+ 
+ # dependencies - openssl
+ if(ENABLE_TLS OR ENABLE_DNSSEC OR ENABLE_SSH)
+diff --git a/src/config.h.in b/src/config.h.in
+index 96d33c5..30dd8a3 100644
+--- a/src/config.h.in
++++ b/src/config.h.in
+@@ -73,4 +73,7 @@
+  */
+ #define NC_PS_QUEUE_SIZE @MAX_PSPOLL_THREAD_COUNT@
+ 
++/* Portability feature-check macros. */
++#cmakedefine HAVE_PTHREAD_RWLOCKATTR_SETKIND_NP
++
+ #endif /* NC_CONFIG_H_ */
+diff --git a/src/session_server.c b/src/session_server.c
+index 636b1a2..3b747ed 100644
+--- a/src/session_server.c
++++ b/src/session_server.c
+@@ -560,6 +560,7 @@ nc_server_init(struct ly_ctx *ctx)
+     errno=0;
+ 
+     if (pthread_rwlockattr_init(&attr) == 0) {
++#if defined(HAVE_PTHREAD_RWLOCKATTR_SETKIND_NP)
+         if (pthread_rwlockattr_setkind_np(&attr, PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP) == 0) {
+             if (pthread_rwlock_init(&server_opts.endpt_lock, &attr) != 0) {
+                 ERR("%s: failed to init rwlock(%s).", __FUNCTION__, strerror(errno));
+@@ -570,6 +571,7 @@ nc_server_init(struct ly_ctx *ctx)
+         } else {
+             ERR("%s: failed set attribute (%s).", __FUNCTION__, strerror(errno));
+         }
++#endif
+         pthread_rwlockattr_destroy(&attr);
+     } else {
+         ERR("%s: failed init attribute (%s).", __FUNCTION__, strerror(errno));
+-- 
+2.20.1
+
diff --git a/package/libnetconf2/Config.in b/package/libnetconf2/Config.in
new file mode 100644
index 0000000000..a991c78c05
--- /dev/null
+++ b/package/libnetconf2/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBNETCONF2
+	bool "libnetconf2 - NETCONF library"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBYANG
+	select BR2_PACKAGE_LIBSSH
+	select BR2_PACKAGE_LIBSSH_SERVER
+	help
+	  libnetconf2 is a NETCONF library in C intended for building
+	  NETCONF clients and servers.
diff --git a/package/libnetconf2/libnetconf2.hash b/package/libnetconf2/libnetconf2.hash
new file mode 100644
index 0000000000..c6d1f5185d
--- /dev/null
+++ b/package/libnetconf2/libnetconf2.hash
@@ -0,0 +1,2 @@
+sha256 760061fb1c1fe87a2a068d5a9e5affcef280044c5940ef344854e9ea7ec26452  libnetconf2-v0.12-r2.tar.gz
+sha256 085122ea91161812dda9cd2f42d8c50ecc3a48cc1a4f15044d86cfc5aa887577  LICENSE
diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
new file mode 100644
index 0000000000..7bafe78324
--- /dev/null
+++ b/package/libnetconf2/libnetconf2.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# libnetconf2
+#
+################################################################################
+
+LIBNETCONF2_VERSION = v0.12-r2
+LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,$(LIBNETCONF2_VERSION))
+LIBNETCONF2_INSTALL_STAGING = YES
+LIBNETCONF2_LICENSE = BSD-3-Clause
+LIBNETCONF2_LICENSE_FILES = LICENSE
+LIBNETCONF2_DEPENDENCIES += libyang libssh
+HOST_LIBNETCONF2_DEPENDENCIES += host-libyang host-libssh
+
+LIBNETCONF2_CONF_OPTS += \
+	-DENABLE_TLS=ON \
+	-DENABLE_SSH=ON \
+	-DENABLE_BUILD_TESTS=OFF \
+	-DENABLE_VALGRIND_TESTS=OFF
+
+HOST_LIBNETCONF2_CONF_OPTS += \
+	-DENABLE_TLS=ON \
+	-DENABLE_SSH=ON \
+	-DENABLE_BUILD_TESTS=OFF \
+	-DENABLE_VALGRIND_TESTS=OFF
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.20.1
