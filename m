From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 23 Jun 2013 23:19:03 -0300
Subject: [Buildroot] [PATCH 2/2] hiawatha: bump to version 9.2
In-Reply-To: <1372040343-28255-1-git-send-email-gustavo@zacarias.com.ar>
References: <1372040343-28255-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1372040343-28255-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch dropped since the polarssl external library option is now
upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../hiawatha-support-for-external-polarssl.patch   | 61 ----------------------
 package/hiawatha/hiawatha.mk                       |  6 ++-
 2 files changed, 4 insertions(+), 63 deletions(-)
 delete mode 100644 package/hiawatha/hiawatha-support-for-external-polarssl.patch

diff --git a/package/hiawatha/hiawatha-support-for-external-polarssl.patch b/package/hiawatha/hiawatha-support-for-external-polarssl.patch
deleted file mode 100644
index 5441a52..0000000
--- a/package/hiawatha/hiawatha-support-for-external-polarssl.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Enable linking against an external PolarSSL
-
-Hiawatha contains its own copy of the PolarSSL source code, and its
-build system builds this private copy of PolarSSL and links to it. In
-the context of Buildroot, we prefer to link against the PolarSSL built
-externally by the polarssl package.
-
-This patch adds a ENABLE_SSL_EXTERNAL option, which, when used in
-addition to ENABLE_SSL, tells Hiawatha's build system to link against
-the already existing PolarSSL library instead of building its own.
-
-[Gustavo]: Update for version 8.5
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura hiawatha-8.5.orig/CMakeLists.txt hiawatha-8.5/CMakeLists.txt
---- hiawatha-8.5.orig/CMakeLists.txt	2012-09-12 09:29:34.347994799 -0300
-+++ hiawatha-8.5/CMakeLists.txt	2012-09-12 09:33:15.983118183 -0300
-@@ -9,6 +9,7 @@
- option(ENABLE_MONITOR  "Enable support for the Hiawatha Monitor." off)
- option(ENABLE_RPROXY   "Enable reverse proxy support in Hiawatha." on)
- option(ENABLE_SSL      "Enable SSL (PolarSSL) support in Hiawatha." on)
-+option(ENABLE_SSL_EXTERNAL "Enable SSL (PolarSSL) as an external library." off)
- option(ENABLE_TOMAHAWK "Enable Tomahawk in Hiawatha" off)
- option(ENABLE_TOOLKIT  "Enable the URL toolkit in Hiawatha" on)
- option(ENABLE_XSLT     "Enable XSLT support in Hiawatha." on)
-@@ -88,19 +89,23 @@
- 
- # PolarSSL
- if(ENABLE_SSL)
-+ if(NOT ENABLE_SSL_EXTERNAL)
- 	option(USE_SHARED_POLARSSL_LIBRARY "Build PolarSSL as a shared library." ON)
- 	set(CMAKE_INSTALL_NAME_DIR ${CMAKE_INSTALL_FULL_LIBDIR}/hiawatha)
- 	set(LIB_INSTALL_DIR ${CMAKE_INSTALL_LIBDIR}/hiawatha)
-+	include_directories(polarssl/include)
- 	add_subdirectory(polarssl)
-+ endif()
- 	set(POLARSSL_LIBRARY "polarssl")
- endif()
- 
- # Hiawatha
--include_directories(${CMAKE_CURRENT_BINARY_DIR} polarssl/include)
- if(ENABLE_XSLT)
- 	include_directories(${LIBXML2_INCLUDE_DIR} ${LIBXSLT_INCLUDE_DIR})
- endif()
- 
-+include_directories(${CMAKE_CURRENT_BINARY_DIR})
-+
- # Configure files
- configure_file(config.h.in config.h)
- foreach (configfile ${config_files_in})
-@@ -121,7 +126,9 @@
- target_link_libraries(hiawatha ${CRYPT_LIBRARY} pthread ${Z_LIBRARY})
- if(ENABLE_SSL)
- 	target_link_libraries(hiawatha ${POLARSSL_LIBRARY})
-+ if(NOT ENABLE_SSL_EXTERNAL)
- 	set_target_properties(hiawatha PROPERTIES INSTALL_RPATH ${CMAKE_INSTALL_FULL_LIBDIR}/hiawatha)
-+ endif()
- endif()
- if(ENABLE_XSLT)
- 	target_link_libraries(hiawatha ${LIBXML2_LIBRARIES} ${LIBXSLT_LIBRARIES})
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 1ecb0e8..4be8149 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -4,14 +4,16 @@
 #
 ################################################################################
 
-HIAWATHA_VERSION = 9.1
+HIAWATHA_VERSION = 9.2
 HIAWATHA_SITE = http://www.hiawatha-webserver.org/files
 HIAWATHA_LICENSE = GPLv2
 HIAWATHA_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_PACKAGE_HIAWATHA_SSL),y)
-HIAWATHA_CONF_OPT += -DENABLE_SSL_EXTERNAL=ON -DENABLE_SSL=ON
+HIAWATHA_CONF_OPT += -DUSE_SYSTEM_POLARSSL=ON
 HIAWATHA_DEPENDENCIES += polarssl
+else
+HIAWATHA_CONF_OPT += -DENABLE_SSL=OFF
 endif
 
 HIAWATHA_CONF_OPT += \
-- 
1.8.1.5
