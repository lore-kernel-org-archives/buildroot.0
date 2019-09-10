From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Sep 2019 19:27:12 +0200
Subject: [Buildroot] [git commit] package/iperf3: bump to 3.7
Message-ID: <20190910172310.8D3988DD07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25b0bca954c94c0e74b9ee8a862e42d03379c07a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Dropped musl and profiling patches as they were incorporated upstream.
- Profiling is set as explicitly disabled as it can now be configured.
- License file hash is changed due to an update in the copyright year:
  -"iperf, Copyright (c) 2014-2018, The Regents of the University of California,
  +"iperf, Copyright (c) 2014-2019, The Regents of the University of California,

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iperf3/0001-disable-profiling.patch        | 20 ----------
 .../iperf3/0002-Fix-build-using-musl-libc.patch    | 43 ----------------------
 package/iperf3/iperf3.hash                         |  6 +--
 package/iperf3/iperf3.mk                           |  4 +-
 4 files changed, 6 insertions(+), 67 deletions(-)

diff --git a/package/iperf3/0001-disable-profiling.patch b/package/iperf3/0001-disable-profiling.patch
deleted file mode 100644
index 09da98e974..0000000000
--- a/package/iperf3/0001-disable-profiling.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-This should be an option, but it's not.
-Don't force profiled builds, it breaks on many toolchains.
-Patch Makefile.in to avoid AUTORECONFing since it needs dummy files
-that are missing to succeed (ChangeLog, COPYING, NEWS, README) and it's
-simple enough so avoid pulling in dependencies and delays.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura iperf-3.0.10.orig/src/Makefile.in iperf-3.0.10/src/Makefile.in
---- iperf-3.0.10.orig/src/Makefile.in	2014-12-17 07:30:46.878310789 -0300
-+++ iperf-3.0.10/src/Makefile.in	2014-12-17 07:33:41.879356643 -0300
-@@ -82,7 +82,7 @@
- host_triplet = @host@
- bin_PROGRAMS = iperf3$(EXEEXT)
- noinst_PROGRAMS = t_timer$(EXEEXT) t_units$(EXEEXT) t_uuid$(EXEEXT) \
--	iperf3_profile$(EXEEXT)
-+	iperf3$(EXEEXT)
- TESTS = t_timer$(EXEEXT) t_units$(EXEEXT) t_uuid$(EXEEXT)
- subdir = src
- DIST_COMMON = $(srcdir)/Makefile.in $(srcdir)/Makefile.am \
diff --git a/package/iperf3/0002-Fix-build-using-musl-libc.patch b/package/iperf3/0002-Fix-build-using-musl-libc.patch
deleted file mode 100644
index f2203605f0..0000000000
--- a/package/iperf3/0002-Fix-build-using-musl-libc.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 1fe02385b60c9dcd8a04b8bd3ff5cff120ec35a6 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 30 Jan 2016 19:23:20 +0100
-Subject: [PATCH 1/1] Fix build using musl libc
-
-Fixes https://github.com/esnet/iperf/issues/331
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
-Patch sent upstream: https://github.com/esnet/iperf/pull/344
-
- src/cjson.h | 2 ++
- src/timer.h | 1 +
- 2 files changed, 3 insertions(+)
-
-diff --git a/src/cjson.h b/src/cjson.h
-index d4449e6..7af19a9 100644
---- a/src/cjson.h
-+++ b/src/cjson.h
-@@ -23,6 +23,8 @@
- #ifndef cJSON__h
- #define cJSON__h
- 
-+#include <stdint.h>
-+
- #ifdef __cplusplus
- extern "C"
- {
-diff --git a/src/timer.h b/src/timer.h
-index 0f9c5eb..9b22b7f 100644
---- a/src/timer.h
-+++ b/src/timer.h
-@@ -30,6 +30,7 @@
- #ifndef __TIMER_H
- #define __TIMER_H
- 
-+#include <stdint.h>
- #include <sys/time.h>
- 
- /* TimerClientData is an opaque value that tags along with a timer.  The
--- 
-2.7.0.rc3
-
diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index 06dae42149..2e6cfd5ab9 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.6.tar.gz.sha256
-sha256 de5d51e46dc460cc590fb4d44f95e7cad54b74fea1eba7d6ebd6f8887d75946e  iperf-3.6.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.7.tar.gz.sha256
+sha256	d846040224317caf2f75c843d309a950a7db23f9b44b94688ccbe557d6d1710c  iperf-3.7.tar.gz
 # Locally computed
-sha256 52c42914d7d79fe5e95d0d1b821556d9f06bf756ac910fe085a46d238a33e594  LICENSE
+sha256	ee58f1e69139d39cfb055df15fe84453a379936dd45e44dbebf26c78afa3f5d4  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 8ac4b078c4..3537b23824 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.6
+IPERF3_VERSION = 3.7
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
@@ -12,6 +12,8 @@ IPERF3_LICENSE_FILES = LICENSE
 
 IPERF3_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
+IPERF3_CONF_OPTS += --disable-profiling
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 # We intentionally don't pass --with-openssl, otherwise pkg-config is
 # not used, and indirect libraries are not picked up when static
