From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Apr 2012 09:43:23 +0200
Subject: [Buildroot] [git commit] hiawatha: new package
Message-ID: <20120415081618.33A8796AB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4f4172a4191a3a4e47a49bbd86343c03237ac0e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    3 +
 package/hiawatha/Config.in                         |   26 +++++++++
 .../hiawatha-support-for-external-polarssl.patch   |   60 ++++++++++++++++++++
 package/hiawatha/hiawatha.mk                       |   13 ++++
 4 files changed, 102 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index bcace09..d703b8c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -455,6 +455,9 @@ source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"
 source "package/ebtables/Config.in"
 source "package/ethtool/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+source "package/hiawatha/Config.in"
+endif
 source "package/hostapd/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/ifplugd/Config.in"
diff --git a/package/hiawatha/Config.in b/package/hiawatha/Config.in
new file mode 100644
index 0000000..431a9fa
--- /dev/null
+++ b/package/hiawatha/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_HIAWATHA
+	bool "hiawatha"
+	help
+	  Hiawatha is a webserver for Unix and has been built with
+	  security in mind. This resulted in a highly secure
+	  webserver, in both code and features.
+
+	  This webserver runs on Linux, BSD, MacOS X and
+	  Windows. Although it can run any kind of CGI / FastCGI
+	  application, it has been optimized for usage with PHP. Most
+	  well known PHP frameworks and CMS applications have been
+	  tested with Hiawatha and ran without a problem. Hiawatha
+	  supports many web and HTTP features such as CGI/FastCGI,
+	  HTTP authentication, virtual host support, request
+	  pipelining, keep alive connections, URL rewriting and many
+	  more.
+
+	  http://www.hiawatha-webserver.org/
+
+if BR2_PACKAGE_HIAWATHA
+
+config BR2_PACKAGE_HIAWATHA_SSL
+	bool "hiawatha SSL support"
+	select BR2_PACKAGE_POLARSSL
+
+endif
diff --git a/package/hiawatha/hiawatha-support-for-external-polarssl.patch b/package/hiawatha/hiawatha-support-for-external-polarssl.patch
new file mode 100644
index 0000000..e6033b9
--- /dev/null
+++ b/package/hiawatha/hiawatha-support-for-external-polarssl.patch
@@ -0,0 +1,60 @@
+Enable linking against an external PolarSSL
+
+Hiawatha contains its own copy of the PolarSSL source code, and its
+build system builds this private copy of PolarSSL and links to it. In
+the context of Buildroot, we prefer to link against the PolarSSL built
+externally by the polarssl package.
+
+This patch adds a ENABLE_SSL_EXTERNAL option, which, when used in
+addition to ENABLE_SSL, tells Hiawatha's build system to link against
+the already existing PolarSSL library instead of building its own.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: hiawatha-8.1/CMakeLists.txt
+===================================================================
+--- hiawatha-8.1.orig/CMakeLists.txt
++++ hiawatha-8.1/CMakeLists.txt
+@@ -9,6 +9,7 @@
+ option(ENABLE_IPV6    "Enable IPv6 support in Hiawatha." ON)
+ option(ENABLE_MONITOR "Enable support for the Hiawatha Monitor." OFF)
+ option(ENABLE_SSL     "Enable SSL (PolarSSL) support in Hiawatha." ON)
++option(ENABLE_SSL_EXTERNAL "Enable SSL (PolarSSL) as an external library." OFF)
+ option(ENABLE_TOOLKIT "Enable the URL toolkit in Hiawatha" ON)
+ option(ENABLE_XSLT    "Enable XSLT support in Hiawatha." ON)
+ 
+@@ -86,19 +87,23 @@
+ 
+ # PolarSSL
+ if(ENABLE_SSL)
++ if(NOT ENABLE_SSL_EXTERNAL)
+ 	option(USE_SHARED_POLARSSL_LIBRARY "Build PolarSSL as a shared library." ON)
+ 	set(CMAKE_INSTALL_NAME_DIR ${CMAKE_INSTALL_FULL_LIBDIR}/hiawatha)
+ 	set(LIB_INSTALL_DIR ${CMAKE_INSTALL_LIBDIR}/hiawatha)
++	include_directories(polarssl/include)
+ 	add_subdirectory(polarssl)
++ endif()
+ 	set(POLARSSL_LIBRARY "polarssl")
+ endif()
+ 
+ # Hiawatha
+-include_directories(${CMAKE_CURRENT_BINARY_DIR} polarssl/include)
+ if(ENABLE_XSLT)
+ 	include_directories(${LIBXML2_INCLUDE_DIR} ${LIBXSLT_INCLUDE_DIR})
+ endif()
+ 
++include_directories(${CMAKE_CURRENT_BINARY_DIR})
++
+ # Configure files
+ configure_file(config.h.in config.h)
+ foreach (configfile ${config_files_in})
+@@ -119,7 +124,9 @@
+ target_link_libraries(hiawatha ${CRYPT_LIBRARY} pthread ${Z_LIBRARY})
+ if(ENABLE_SSL)
+ 	target_link_libraries(hiawatha ${POLARSSL_LIBRARY})
++ if(NOT ENABLE_SSL_EXTERNAL)
+ 	set_target_properties(hiawatha PROPERTIES INSTALL_RPATH ${CMAKE_INSTALL_FULL_LIBDIR}/hiawatha)
++ endif()
+ endif()
+ if(ENABLE_XSLT)
+ 	target_link_libraries(hiawatha ${LIBXML2_LIBRARIES} ${LIBXSLT_LIBRARIES})
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
new file mode 100644
index 0000000..aa245f3
--- /dev/null
+++ b/package/hiawatha/hiawatha.mk
@@ -0,0 +1,13 @@
+HIAWATHA_VERSION = 8.1
+HIAWATHA_SITE = http://www.hiawatha-webserver.org/files/
+
+ifeq ($(BR2_PACKAGE_HIAWATHA_SSL),y)
+HIAWATHA_CONF_OPT += -DENABLE_SSL_EXTERNAL=ON -DENABLE_SSL=ON
+HIAWATHA_DEPENDENCIES += polarssl
+endif
+
+HIAWATHA_CONF_OPT += \
+	-DENABLE_TOOLKIT=OFF \
+	-DENABLE_XSLT=OFF
+
+$(eval $(call CMAKETARGETS))
