From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 17 Nov 2012 13:42:27 -0300
Subject: [Buildroot] [PATCH 1/2] polarssl: bump to version 1.2.0
Message-ID: <1353170548-13069-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../polarssl-shared-and-static-library.patch       |   19 +++++++++++--------
 package/polarssl/polarssl.mk                       |    6 ++++--
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/package/polarssl/polarssl-shared-and-static-library.patch b/package/polarssl/polarssl-shared-and-static-library.patch
index 562b900..e11cab3 100644
--- a/package/polarssl/polarssl-shared-and-static-library.patch
+++ b/package/polarssl/polarssl-shared-and-static-library.patch
@@ -9,21 +9,22 @@ This patch adds the USE_STATIC_POLARSSL_LIBRARY (which defaults to ON)
 in addition to the existing USE_SHARED_POLARSSL_LIBRARY (which
 defaults to OFF). Both options can be manipulated independently.
 
+[Gustavo: update for polarssl 1.2.0]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-Index: polarssl-1.1.1/library/CMakeLists.txt
-===================================================================
---- polarssl-1.1.1.orig/library/CMakeLists.txt
-+++ polarssl-1.1.1/library/CMakeLists.txt
+diff -Nura polarssl-1.2.0.orig/library/CMakeLists.txt polarssl-1.2.0/library/CMakeLists.txt
+--- polarssl-1.2.0.orig/library/CMakeLists.txt	2012-11-15 15:01:58.239248830 -0300
++++ polarssl-1.2.0/library/CMakeLists.txt	2012-11-15 15:00:10.310806353 -0300
 @@ -1,4 +1,5 @@
  option(USE_SHARED_POLARSSL_LIBRARY "Build PolarSSL as a shared library." OFF)
 +option(USE_STATIC_POLARSSL_LIBRARY "Build PolarSSL as a static library." ON)
  
  set(src
       aes.c
-@@ -40,17 +41,21 @@
-      xtea.c
- )
+@@ -50,19 +51,23 @@
+ set(libs ws2_32)
+ endif(WIN32)
  
 -if(NOT USE_SHARED_POLARSSL_LIBRARY)
 -
@@ -33,7 +34,7 @@ Index: polarssl-1.1.1/library/CMakeLists.txt
 +if(USE_SHARED_POLARSSL_LIBRARY)
  
  add_library(polarssl SHARED ${src})
- set_target_properties(polarssl PROPERTIES VERSION 1.1.3 SOVERSION 1)
+ set_target_properties(polarssl PROPERTIES VERSION 1.2.0 SOVERSION 2)
 +set_target_properties(polarssl PROPERTIES OUTPUT_NAME polarssl)
 +
 +endif(USE_SHARED_POLARSSL_LIBRARY)
@@ -46,6 +47,8 @@ Index: polarssl-1.1.1/library/CMakeLists.txt
 -endif(NOT USE_SHARED_POLARSSL_LIBRARY)
 +endif(USE_STATIC_POLARSSL_LIBRARY)
  
+ target_link_libraries(polarssl ${libs})
+ 
 -install(TARGETS polarssl
 +install(TARGETS polarssl polarssl-static
          DESTINATION ${LIB_INSTALL_DIR}
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index 34fbe29..edda9bf 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -1,5 +1,5 @@
-POLARSSL_SITE = http://polarssl.org/code/releases/
-POLARSSL_VERSION = 1.1.4
+POLARSSL_SITE = https://polarssl.org/download
+POLARSSL_VERSION = 1.2.0
 POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
 POLARSSL_CONF_OPT = \
 	-DUSE_SHARED_POLARSSL_LIBRARY=ON \
@@ -8,6 +8,8 @@ POLARSSL_CONF_OPT = \
 	-DBUILD_PROGRAMS=$(if $(BR2_PACKAGE_POLARSSL_PROGRAMS),ON,OFF)
 
 POLARSSL_INSTALL_STAGING = YES
+POLARSSL_LICENSE = GPLv2
+POLARSSL_LICENSE_FILES = LICENSE
 
 $(eval $(cmake-package))
 
-- 
1.7.8.6
