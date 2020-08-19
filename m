From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Wed, 19 Aug 2020 14:05:05 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/mosquitto: bump to v1.6.11
Message-ID: <20200819120506.137013-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mosquitto 1.6.11 is a bugfix release, read the whole announcement on
http://mosquitto.org/blog/2020/08/version-1-6-11-released/

From the changelog of the client library:
mosquitto_loop_start() now sets a thread name on Linux, FreeBSD, NetBSD,
and OpenBSD. Closes #1777.
This is done with pthread_setname_np; so mosquitto now requires
BR2_TOOLCHAIN_HAS_THREADS_NPTL when built with threading support.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
Changes v1 -> v2:
* Only depend on NPTL when compiling with threading support, introduce
  BR2_PACKAGE_MOSQUITTO_WITH_THREADING
---
 ...thread-when-compiling-without-thread.patch | 40 +++++++++++++++++++
 package/mosquitto/Config.in                   |  5 +++
 package/mosquitto/mosquitto.hash              |  4 +-
 package/mosquitto/mosquitto.mk                |  4 +-
 4 files changed, 49 insertions(+), 4 deletions(-)
 create mode 100644 package/mosquitto/0001-do-not-include-pthread-when-compiling-without-thread.patch

diff --git a/package/mosquitto/0001-do-not-include-pthread-when-compiling-without-thread.patch b/package/mosquitto/0001-do-not-include-pthread-when-compiling-without-thread.patch
new file mode 100644
index 0000000000..3bdd73a629
--- /dev/null
+++ b/package/mosquitto/0001-do-not-include-pthread-when-compiling-without-thread.patch
@@ -0,0 +1,40 @@
+From 6904a7a6e2e0835eda2dcd62fb982f302d7a8ba0 Mon Sep 17 00:00:00 2001
+From: Titouan Christophe <titouan.christophe@railnova.eu>
+Date: Tue, 18 Aug 2020 01:26:58 +0200
+Subject: do not include pthread when compiling without threading support
+
+This fixes the following error, when compiling for systems without
+pthread support, and when passing WITH_THREADING=no to make:
+
+    thread_mosq.c:24:12: fatal error: pthread.h: No such file or directory
+     #  include <pthread.h>
+                 ^~~~~~~~~~~
+    compilation terminated.
+
+[Upstream status: https://github.com/eclipse/mosquitto/pull/1794]
+Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
+---
+ lib/thread_mosq.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/thread_mosq.c b/lib/thread_mosq.c
+index b05c1d2a..46e19807 100644
+--- a/lib/thread_mosq.c
++++ b/lib/thread_mosq.c
+@@ -20,11 +20,13 @@ Contributors:
+ #include <time.h>
+ #endif
+ 
++#if defined(WITH_THREADING)
+ #if defined(__linux__) || defined(__NetBSD__)
+ #  include <pthread.h>
+ #elif defined(__FreeBSD__) || defined(__OpenBSD__)
+ #  include <pthread_np.h>
+ #endif
++#endif
+ 
+ #include "mosquitto_internal.h"
+ #include "net_mosq.h"
+-- 
+2.25.3
+
diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index b4effa36be..078d6ad151 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -1,3 +1,8 @@
+config BR2_PACKAGE_MOSQUITTO_WITH_THREADING
+	bool
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL  # pthread_setname_np
+	default y if BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_MOSQUITTO
 	bool "mosquitto"
 	help
diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 482962490e..1470a93aa7 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-1.6.10.tar.gz.asc
-sha256  92d1807717f0f6d57d1ac1207ffdb952e8377e916c7b0bb4718f745239774232  mosquitto-1.6.10.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-1.6.11.tar.gz.asc
+sha256  b02d8f1368c40d5779ee125c37daf9003608eb47d7fbb04c5b938c76c1230a1f  mosquitto-1.6.11.tar.gz
 
 # License files
 sha256  cc77e25bafd40637b7084f04086d606f0a200051b61806f97c93405926670bc1  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index cdd515e1a4..3718a0721a 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 1.6.10
+MOSQUITTO_VERSION = 1.6.11
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
@@ -41,7 +41,7 @@ else
 MOSQUITTO_MAKE_OPTS += WITH_ADNS=no
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+ifeq ($(BR2_PACKAGE_MOSQUITTO_WITH_THREADING),y)
 MOSQUITTO_MAKE_OPTS += WITH_THREADING=yes
 else
 MOSQUITTO_MAKE_OPTS += WITH_THREADING=no
-- 
2.25.3
