From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 20 Dec 2019 14:27:54 +0100
Subject: [Buildroot] [PATCH v1 2/3] package/libnetconf2: bump to version
 1.1.3
In-Reply-To: <20191220132756.32395-1-heiko.thiery@gmail.com>
References: <20191220132756.32395-1-heiko.thiery@gmail.com>
Message-ID: <20191220132756.32395-3-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Other changes:

 - Remove patch (already in upstream version)

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
---
 .../0001-Add-support-for-musl-libc.patch      | 65 -------------------
 package/libnetconf2/libnetconf2.hash          |  2 +-
 package/libnetconf2/libnetconf2.mk            |  2 +-
 3 files changed, 2 insertions(+), 67 deletions(-)
 delete mode 100644 package/libnetconf2/0001-Add-support-for-musl-libc.patch

diff --git a/package/libnetconf2/0001-Add-support-for-musl-libc.patch b/package/libnetconf2/0001-Add-support-for-musl-libc.patch
deleted file mode 100644
index 44023a391d..0000000000
--- a/package/libnetconf2/0001-Add-support-for-musl-libc.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 153fe40bd60499677e825e66501e8601536e0323 Mon Sep 17 00:00:00 2001
-From: Rosen Penev <rosenp@gmail.com>
-Date: Mon, 15 Jul 2019 18:15:28 -0700
-Subject: [PATCH] Add support for musl libc
-
-musl does not support pthread_rwlockattr_setkind_np. Don't use it if it is
-not available.
-
-Patch comes from upstream commit:
-https://github.com/CESNET/libnetconf2/commit/153fe40bd60499677e825e66501e8601536e0323
-
-Signed-of-by: Heiko Thiery <heiko.thiery@kontron.com>
----
- CMakeLists.txt       | 1 +
- src/config.h.in      | 3 +++
- src/session_server.c | 2 ++
- 3 files changed, 6 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 624b8c8..c05cd03 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -176,6 +176,7 @@ target_link_libraries(netconf2 ${CMAKE_THREAD_LIBS_INIT})
- set(CMAKE_REQUIRED_LIBRARIES pthread)
- check_include_file(stdatomic.h HAVE_STDATOMIC)
- check_function_exists(pthread_mutex_timedlock HAVE_PTHREAD_MUTEX_TIMEDLOCK)
-+check_function_exists(pthread_rwlockattr_setkind_np HAVE_PTHREAD_RWLOCKATTR_SETKIND_NP)
- 
- # dependencies - openssl
- if(ENABLE_TLS OR ENABLE_DNSSEC OR ENABLE_SSH)
-diff --git a/src/config.h.in b/src/config.h.in
-index 96d33c5..30dd8a3 100644
---- a/src/config.h.in
-+++ b/src/config.h.in
-@@ -73,4 +73,7 @@
-  */
- #define NC_PS_QUEUE_SIZE @MAX_PSPOLL_THREAD_COUNT@
- 
-+/* Portability feature-check macros. */
-+#cmakedefine HAVE_PTHREAD_RWLOCKATTR_SETKIND_NP
-+
- #endif /* NC_CONFIG_H_ */
-diff --git a/src/session_server.c b/src/session_server.c
-index 636b1a2..3b747ed 100644
---- a/src/session_server.c
-+++ b/src/session_server.c
-@@ -560,6 +560,7 @@ nc_server_init(struct ly_ctx *ctx)
-     errno=0;
- 
-     if (pthread_rwlockattr_init(&attr) == 0) {
-+#if defined(HAVE_PTHREAD_RWLOCKATTR_SETKIND_NP)
-         if (pthread_rwlockattr_setkind_np(&attr, PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP) == 0) {
-             if (pthread_rwlock_init(&server_opts.endpt_lock, &attr) != 0) {
-                 ERR("%s: failed to init rwlock(%s).", __FUNCTION__, strerror(errno));
-@@ -570,6 +571,7 @@ nc_server_init(struct ly_ctx *ctx)
-         } else {
-             ERR("%s: failed set attribute (%s).", __FUNCTION__, strerror(errno));
-         }
-+#endif
-         pthread_rwlockattr_destroy(&attr);
-     } else {
-         ERR("%s: failed init attribute (%s).", __FUNCTION__, strerror(errno));
--- 
-2.20.1
-
diff --git a/package/libnetconf2/libnetconf2.hash b/package/libnetconf2/libnetconf2.hash
index 9b78049ffb..5cd9b99062 100644
--- a/package/libnetconf2/libnetconf2.hash
+++ b/package/libnetconf2/libnetconf2.hash
@@ -1,2 +1,2 @@
-sha256 760061fb1c1fe87a2a068d5a9e5affcef280044c5940ef344854e9ea7ec26452  libnetconf2-0.12-r2.tar.gz
+sha256 38e780cdd0135e9c7fe44b5190a1acc8c33cb28aa395c329893b019a57b1f783  libnetconf2-1.1.3.tar.gz
 sha256 085122ea91161812dda9cd2f42d8c50ecc3a48cc1a4f15044d86cfc5aa887577  LICENSE
diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index 49a6de60a9..bd25c69e0e 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNETCONF2_VERSION = 0.12-r2
+LIBNETCONF2_VERSION = 1.1.3
 LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
 LIBNETCONF2_INSTALL_STAGING = YES
 LIBNETCONF2_LICENSE = BSD-3-Clause
-- 
2.20.1
