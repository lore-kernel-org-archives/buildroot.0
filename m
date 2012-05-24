From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 24 May 2012 14:32:07 +0200
Subject: [Buildroot] [git commit branch/next] hiawatha: bump to version 8.3
Message-ID: <20120525102150.D8F6096DAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d287f129c8794a01da02da3e984a1555e00c440b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump hiawatha to version 8.3 - adds reverse proxy functionality.
Also define WORK_DIR to /var/lib/hiawatha instead of the uncommon
/usr/var/lib/hiawatha - missed it in the last path fixes.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../hiawatha-support-for-external-polarssl.patch   |   27 ++++++++++---------
 package/hiawatha/hiawatha.mk                       |    5 ++-
 2 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/package/hiawatha/hiawatha-support-for-external-polarssl.patch b/package/hiawatha/hiawatha-support-for-external-polarssl.patch
index e6033b9..edc774b 100644
--- a/package/hiawatha/hiawatha-support-for-external-polarssl.patch
+++ b/package/hiawatha/hiawatha-support-for-external-polarssl.patch
@@ -9,21 +9,22 @@ This patch adds a ENABLE_SSL_EXTERNAL option, which, when used in
 addition to ENABLE_SSL, tells Hiawatha's build system to link against
 the already existing PolarSSL library instead of building its own.
 
+[Gustavo]: Update for version 8.3
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-Index: hiawatha-8.1/CMakeLists.txt
-===================================================================
---- hiawatha-8.1.orig/CMakeLists.txt
-+++ hiawatha-8.1/CMakeLists.txt
-@@ -9,6 +9,7 @@
- option(ENABLE_IPV6    "Enable IPv6 support in Hiawatha." ON)
- option(ENABLE_MONITOR "Enable support for the Hiawatha Monitor." OFF)
- option(ENABLE_SSL     "Enable SSL (PolarSSL) support in Hiawatha." ON)
-+option(ENABLE_SSL_EXTERNAL "Enable SSL (PolarSSL) as an external library." OFF)
- option(ENABLE_TOOLKIT "Enable the URL toolkit in Hiawatha" ON)
- option(ENABLE_XSLT    "Enable XSLT support in Hiawatha." ON)
+diff -Nura hiawatha-8.3.orig//CMakeLists.txt hiawatha-8.3/CMakeLists.txt
+--- hiawatha-8.3.orig//CMakeLists.txt	2012-05-23 14:22:26.000000000 -0300
++++ hiawatha-8.3/CMakeLists.txt	2012-05-24 08:13:00.007107500 -0300
+@@ -10,6 +10,7 @@
+ option(ENABLE_MONITOR "Enable support for the Hiawatha Monitor." off)
+ option(ENABLE_RPROXY  "Enable reverse proxy support in Hiawatha." on)
+ option(ENABLE_SSL     "Enable SSL (PolarSSL) support in Hiawatha." on)
++option(ENABLE_SSL_EXTERNAL "Enable SSL (PolarSSL) as an external library." off)
+ option(ENABLE_TOOLKIT "Enable the URL toolkit in Hiawatha" on)
+ option(ENABLE_XSLT    "Enable XSLT support in Hiawatha." on)
  
-@@ -86,19 +87,23 @@
+@@ -85,19 +86,23 @@
  
  # PolarSSL
  if(ENABLE_SSL)
@@ -48,7 +49,7 @@ Index: hiawatha-8.1/CMakeLists.txt
  # Configure files
  configure_file(config.h.in config.h)
  foreach (configfile ${config_files_in})
-@@ -119,7 +124,9 @@
+@@ -118,7 +123,9 @@
  target_link_libraries(hiawatha ${CRYPT_LIBRARY} pthread ${Z_LIBRARY})
  if(ENABLE_SSL)
  	target_link_libraries(hiawatha ${POLARSSL_LIBRARY})
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 4600c11..647c1e1 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -1,4 +1,4 @@
-HIAWATHA_VERSION = 8.2
+HIAWATHA_VERSION = 8.3
 HIAWATHA_SITE = http://www.hiawatha-webserver.org/files/
 
 ifeq ($(BR2_PACKAGE_HIAWATHA_SSL),y)
@@ -12,6 +12,7 @@ HIAWATHA_CONF_OPT += \
 	-DCONFIG_DIR=/etc/hiawatha \
 	-DLOG_DIR=/var/log \
 	-DPID_DIR=/var/run \
-	-DWEBROOT_DIR=/var/www/hiawatha
+	-DWEBROOT_DIR=/var/www/hiawatha \
+	-DWORK_DIR=/var/lib/hiawatha
 
 $(eval $(call CMAKETARGETS))
