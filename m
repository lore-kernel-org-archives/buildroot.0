From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Aug 2019 17:09:57 +0200
Subject: [Buildroot] [PATCH 2/2] package/collectd: security bump to version
 5.9.0
In-Reply-To: <20190804150957.7844-1-bernd.kuhls@t-online.de>
References: <20190804150957.7844-1-bernd.kuhls@t-online.de>
Message-ID: <20190804150957.7844-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patches applied upstream.

Added upstream sha1 & sha512 hashes.

Removed libltdl/COPYING.LIB from LICENSE_FILES after upstream removal
in version 5.8.0:
https://git.octo.it/?p=collectd.git;a=blob;f=ChangeLog;h=7ea5a07f10c0334f9b0f32480590b2c848577559;hb=HEAD#l90

Version 5.7.2 fixed CVE-2017-7401
https://git.octo.it/?p=collectd.git;a=blob;f=ChangeLog;h=7ea5a07f10c0334f9b0f32480590b2c848577559;hb=HEAD#l285

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...collectdclient-increase-error-buffer.patch | 87 ------------------
 ...gps-plugin-fix-build-with-newer-gpsd.patch | 43 ---------
 ...checks-for-upper-limit-of-SENSORS_AP.patch | 89 -------------------
 package/collectd/collectd.hash                |  7 +-
 package/collectd/collectd.mk                  |  4 +-
 5 files changed, 7 insertions(+), 223 deletions(-)
 delete mode 100644 package/collectd/0001-libcollectdclient-increase-error-buffer.patch
 delete mode 100644 package/collectd/0002-gps-plugin-fix-build-with-newer-gpsd.patch
 delete mode 100644 package/collectd/0003-sensors-Removed-checks-for-upper-limit-of-SENSORS_AP.patch

diff --git a/package/collectd/0001-libcollectdclient-increase-error-buffer.patch b/package/collectd/0001-libcollectdclient-increase-error-buffer.patch
deleted file mode 100644
index 247d32b592..0000000000
--- a/package/collectd/0001-libcollectdclient-increase-error-buffer.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From e170f3559fcda6d37a012aba187a96b1f42e8f9d Mon Sep 17 00:00:00 2001
-From: Ruben Kerkhof <ruben@rubenkerkhof.com>
-Date: Sun, 2 Jul 2017 21:52:14 +0200
-Subject: [PATCH] libcollectdclient: increase error buffer
-MIME-Version: 1.0
-Content-Type: text/plain; charset=utf8
-Content-Transfer-Encoding: 8bit
-
-make[1]: Entering directory '/home/ruben/src/collectd'
-  CC       src/libcollectdclient/libcollectdclient_la-client.lo
-src/libcollectdclient/client.c: In function ???lcc_getval???:
-src/libcollectdclient/client.c:621:23: warning: ???%s??? directive output may be truncated writing up to 1023 bytes into a region of size 1010 [-Wformat-truncation=]
-     LCC_SET_ERRSTR(c, "Server error: %s", res.message);
-                       ^                   ~
-src/libcollectdclient/client.c:94:48: note: in definition of macro ???LCC_SET_ERRSTR???
-     snprintf((c)->errbuf, sizeof((c)->errbuf), __VA_ARGS__);                   \
-                                                ^~~~~~~~~~~
-src/libcollectdclient/client.c:94:5: note: ???snprintf??? output between 15 and 1038 bytes into a destination of size 1024
-     snprintf((c)->errbuf, sizeof((c)->errbuf), __VA_ARGS__);                   \
-     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-src/libcollectdclient/client.c:621:5: note: in expansion of macro ???LCC_SET_ERRSTR???
-     LCC_SET_ERRSTR(c, "Server error: %s", res.message);
-     ^~~~~~~~~~~~~~
-src/libcollectdclient/client.c: In function ???lcc_putval???:
-src/libcollectdclient/client.c:754:23: warning: ???%s??? directive output may be truncated writing up to 1023 bytes into a region of size 1010 [-Wformat-truncation=]
-     LCC_SET_ERRSTR(c, "Server error: %s", res.message);
-                       ^                   ~
-src/libcollectdclient/client.c:94:48: note: in definition of macro ???LCC_SET_ERRSTR???
-     snprintf((c)->errbuf, sizeof((c)->errbuf), __VA_ARGS__);                   \
-                                                ^~~~~~~~~~~
-src/libcollectdclient/client.c:94:5: note: ???snprintf??? output between 15 and 1038 bytes into a destination of size 1024
-     snprintf((c)->errbuf, sizeof((c)->errbuf), __VA_ARGS__);                   \
-     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-src/libcollectdclient/client.c:754:5: note: in expansion of macro ???LCC_SET_ERRSTR???
-     LCC_SET_ERRSTR(c, "Server error: %s", res.message);
-     ^~~~~~~~~~~~~~
-src/libcollectdclient/client.c: In function ???lcc_flush???:
-src/libcollectdclient/client.c:802:23: warning: ???%s??? directive output may be truncated writing up to 1023 bytes into a region of size 1010 [-Wformat-truncation=]
-     LCC_SET_ERRSTR(c, "Server error: %s", res.message);
-                       ^                   ~
-src/libcollectdclient/client.c:94:48: note: in definition of macro ???LCC_SET_ERRSTR???
-     snprintf((c)->errbuf, sizeof((c)->errbuf), __VA_ARGS__);                   \
-                                                ^~~~~~~~~~~
-src/libcollectdclient/client.c:94:5: note: ???snprintf??? output between 15 and 1038 bytes into a destination of size 1024
-     snprintf((c)->errbuf, sizeof((c)->errbuf), __VA_ARGS__);                   \
-     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-src/libcollectdclient/client.c:802:5: note: in expansion of macro ???LCC_SET_ERRSTR???
-     LCC_SET_ERRSTR(c, "Server error: %s", res.message);
-     ^~~~~~~~~~~~~~
-src/libcollectdclient/client.c: In function ???lcc_listval???:
-src/libcollectdclient/client.c:834:23: warning: ???%s??? directive output may be truncated writing up to 1023 bytes into a region of size 1010 [-Wformat-truncation=]
-     LCC_SET_ERRSTR(c, "Server error: %s", res.message);
-                       ^                   ~
-src/libcollectdclient/client.c:94:48: note: in definition of macro ???LCC_SET_ERRSTR???
-     snprintf((c)->errbuf, sizeof((c)->errbuf), __VA_ARGS__);                   \
-                                                ^~~~~~~~~~~
-src/libcollectdclient/client.c:94:5: note: ???snprintf??? output between 15 and 1038 bytes into a destination of size 1024
-     snprintf((c)->errbuf, sizeof((c)->errbuf), __VA_ARGS__);                   \
-     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-src/libcollectdclient/client.c:834:5: note: in expansion of macro ???LCC_SET_ERRSTR???
-     LCC_SET_ERRSTR(c, "Server error: %s", res.message);
-     ^~~~~~~~~~~~~~
-
-Fixes #2200
-
-[Upstream commit: https://git.octo.it/?p=collectd.git;a=commitdiff;h=e170f3559fcda6d37a012aba187a96b1f42e8f9d]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/libcollectdclient/client.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libcollectdclient/client.c b/src/libcollectdclient/client.c
-index 51a4ab2..3ae2e71 100644
---- a/src/libcollectdclient/client.c
-+++ b/src/libcollectdclient/client.c
-@@ -99,7 +99,7 @@
-  */
- struct lcc_connection_s {
-   FILE *fh;
--  char errbuf[1024];
-+  char errbuf[2048];
- };
- 
- struct lcc_response_s {
--- 
-1.7.10.4
-
diff --git a/package/collectd/0002-gps-plugin-fix-build-with-newer-gpsd.patch b/package/collectd/0002-gps-plugin-fix-build-with-newer-gpsd.patch
deleted file mode 100644
index b5abf8159a..0000000000
--- a/package/collectd/0002-gps-plugin-fix-build-with-newer-gpsd.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 991a6d3fd38c2435d94de3853fda36b3330cf6ab Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 9 Oct 2018 19:57:21 +0300
-Subject: [PATCH] gps plugin: fix build with newer gpsd
-
-gpsd version 3.18 changed the prototype of gps_read(). Make the
-gps_read() call depend on GPSD_API_MAJOR_VERSION to fix that.
-
-This fixes build failures like:
-
-gps.c: In function 'cgps_thread':
-gps.c:144:11: error: too few arguments to function 'gps_read'
-       if (gps_read(&gpsd_conn) == -1) {
-		   ^~~~~~~~
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/collectd/collectd/pull/2947
-
- src/gps.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/src/gps.c b/src/gps.c
-index 1d32d0492617..b22c3a2e5ecd 100644
---- a/src/gps.c
-+++ b/src/gps.c
-@@ -141,7 +141,12 @@ static void *cgps_thread(void *pData) {
-         continue;
-       }
- 
--      if (gps_read(&gpsd_conn) == -1) {
-+#if GPSD_API_MAJOR_VERSION > 6
-+      if (gps_read(&gpsd_conn, NULL, 0) == -1)
-+#else
-+      if (gps_read(&gpsd_conn) == -1)
-+#endif
-+      {
-         WARNING("gps plugin: incorrect data! (err_count: %d)", err_count);
-         err_count++;
- 
--- 
-2.19.1
-
diff --git a/package/collectd/0003-sensors-Removed-checks-for-upper-limit-of-SENSORS_AP.patch b/package/collectd/0003-sensors-Removed-checks-for-upper-limit-of-SENSORS_AP.patch
deleted file mode 100644
index 9270021dd6..0000000000
--- a/package/collectd/0003-sensors-Removed-checks-for-upper-limit-of-SENSORS_AP.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From 069796bd76dd1ab0089a64f7c9c2a3c9f1475414 Mon Sep 17 00:00:00 2001
-From: Pavel Rochnyack <pavel2000@ngs.ru>
-Date: Mon, 3 Dec 2018 18:34:14 +0700
-Subject: [PATCH] sensors: Removed checks for upper limit of
- SENSORS_API_VERSION
-
-That makes no more sense after lm-sensors got new maintainers.
-
-Issue: #3006
-
-[Vadim Kochan: backported to support 5.7.1 version]
-Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
----
- src/sensors.c | 17 ++++++-----------
- 1 file changed, 6 insertions(+), 11 deletions(-)
-
-diff --git a/src/sensors.c b/src/sensors.c
-index 8f1824d..409dc38 100644
---- a/src/sensors.c
-+++ b/src/sensors.c
-@@ -149,7 +149,7 @@ typedef struct featurelist {
- static char *conffile = SENSORS_CONF_PATH;
- /* #endif SENSORS_API_VERSION < 0x400 */
- 
--#elif (SENSORS_API_VERSION >= 0x400) && (SENSORS_API_VERSION < 0x500)
-+#elif (SENSORS_API_VERSION >= 0x400)
- typedef struct featurelist {
-   const sensors_chip_name *chip;
-   const sensors_feature *feature;
-@@ -159,11 +159,6 @@ typedef struct featurelist {
- 
- static char *conffile = NULL;
- static _Bool use_labels = 0;
--/* #endif (SENSORS_API_VERSION >= 0x400) && (SENSORS_API_VERSION < 0x500) */
--
--#else /* if SENSORS_API_VERSION >= 0x500 */
--#error "This version of libsensors is not supported yet. Please report this " \
--	"as bug."
- #endif
- 
- static featurelist_t *first_feature = NULL;
-@@ -223,7 +218,7 @@ static int sensors_config(const char *key, const char *value) {
-     if (IS_TRUE(value))
-       ignorelist_set_invert(sensor_list, 0);
-   }
--#if (SENSORS_API_VERSION >= 0x400) && (SENSORS_API_VERSION < 0x500)
-+#if (SENSORS_API_VERSION >= 0x400)
-   else if (strcasecmp(key, "UseLabels") == 0) {
-     use_labels = IS_TRUE(value) ? 1 : 0;
-   }
-@@ -353,7 +348,7 @@ static int sensors_load_conf(void) {
-   }   /* while sensors_get_detected_chips */
- /* #endif SENSORS_API_VERSION < 0x400 */
- 
--#elif (SENSORS_API_VERSION >= 0x400) && (SENSORS_API_VERSION < 0x500)
-+#elif (SENSORS_API_VERSION >= 0x400)
-   chip_num = 0;
-   while ((chip = sensors_get_detected_chips(NULL, &chip_num)) != NULL) {
-     const sensors_feature *feature;
-@@ -404,7 +399,7 @@ static int sensors_load_conf(void) {
-       } /* while (subfeature) */
-     }   /* while (feature) */
-   }     /* while (chip) */
--#endif /* (SENSORS_API_VERSION >= 0x400) && (SENSORS_API_VERSION < 0x500) */
-+#endif /* (SENSORS_API_VERSION >= 0x400) */
- 
-   if (first_feature == NULL) {
-     sensors_cleanup();
-@@ -479,7 +474,7 @@ static int sensors_read(void) {
-   } /* for fl = first_feature .. NULL */
- /* #endif SENSORS_API_VERSION < 0x400 */
- 
--#elif (SENSORS_API_VERSION >= 0x400) && (SENSORS_API_VERSION < 0x500)
-+#elif (SENSORS_API_VERSION >= 0x400)
-   for (featurelist_t *fl = first_feature; fl != NULL; fl = fl->next) {
-     double value;
-     int status;
-@@ -518,7 +513,7 @@ static int sensors_read(void) {
- 
-     sensors_submit(plugin_instance, type, type_instance, value);
-   } /* for fl = first_feature .. NULL */
--#endif /* (SENSORS_API_VERSION >= 0x400) && (SENSORS_API_VERSION < 0x500) */
-+#endif /* (SENSORS_API_VERSION >= 0x400) */
- 
-   return (0);
- } /* int sensors_read */
--- 
-2.14.1
-
diff --git a/package/collectd/collectd.hash b/package/collectd/collectd.hash
index cf7e0b83f9..7823765ec3 100644
--- a/package/collectd/collectd.hash
+++ b/package/collectd/collectd.hash
@@ -1,6 +1,9 @@
+# From https://collectd.org/files/SHA512SUM
+sha512 f2bf9896dd8fa116834418ea46aabdb160002da7f2600b7d5120d40eb7a956ccc845299696c854c2335946903374c84bbaeb28667319bf07b7a54ea465cccd54  collectd-5.9.0.tar.bz2
 # From https://collectd.org/files/SHA256SUM
-sha256	7edd3643c0842215553b2421d5456f4e9a8a58b07e216b40a7e8e91026d8e501	collectd-5.7.1.tar.bz2
+sha256 7b220f8898a061f6e7f29a8c16697d1a198277f813da69474a67911097c0626b  collectd-5.9.0.tar.bz2
+# From https://collectd.org/files/SHA1SUM
+sha1 58cd22ef8130f17c714e9609053cf45d311ac6c7  collectd-5.9.0.tar.bz2
 
 # Hash for license files
 sha256	ed0409b2b1c30566dab5fcdaf46ee70e140c99788e22f0267645a9357b476ae4	COPYING
-sha256	f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa	libltdl/COPYING.LIB
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 3443eb6fe4..8eb7aa2ec0 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-COLLECTD_VERSION = 5.7.1
+COLLECTD_VERSION = 5.9.0
 COLLECTD_SITE = http://collectd.org/files
 COLLECTD_SOURCE = collectd-$(COLLECTD_VERSION).tar.bz2
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
 COLLECTD_INSTALL_STAGING = YES
 COLLECTD_LICENSE = MIT (daemon, plugins), GPL-2.0 (plugins), LGPL-2.1 (plugins)
-COLLECTD_LICENSE_FILES = COPYING libltdl/COPYING.LIB
+COLLECTD_LICENSE_FILES = COPYING
 
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
-- 
2.20.1
