From: Paul Cercueil <paul.cercueil@analog.com>
Date: Wed, 25 Mar 2015 10:00:37 +0100
Subject: [Buildroot] [PATCH v3] libiio: Bump version to 0.5
Message-ID: <1427274037-22340-1-git-send-email-paul.cercueil@analog.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package now offers the possibility to install Python and/or C#
bindings if the Python and Mono packages are detected.

v2: Patch generated with 'git format-patch -M' and fix indentation in libiio.mk
v3: Updated libiio.hash file

Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
---
 ...UILD_SHARED_LIBS-drive-the-type-of-librar.patch | 29 --------------------
 ...2-detection-try-first-the-CMake-module-f.patch} |  0
 package/libiio/Config.in                           | 12 ++++++++
 package/libiio/libiio.hash                         |  4 +--
 package/libiio/libiio.mk                           | 32 ++++++++++++++++++++--
 5 files changed, 43 insertions(+), 34 deletions(-)
 delete mode 100644 package/libiio/0001-cmake-let-BUILD_SHARED_LIBS-drive-the-type-of-librar.patch
 rename package/libiio/{0002-cmake-libxml2-detection-try-first-the-CMake-module-f.patch => 0001-cmake-libxml2-detection-try-first-the-CMake-module-f.patch} (100%)

diff --git a/package/libiio/0001-cmake-let-BUILD_SHARED_LIBS-drive-the-type-of-librar.patch b/package/libiio/0001-cmake-let-BUILD_SHARED_LIBS-drive-the-type-of-librar.patch
deleted file mode 100644
index 9ee0299..0000000
--- a/package/libiio/0001-cmake-let-BUILD_SHARED_LIBS-drive-the-type-of-librar.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 4d036f3708f1f427bf91c5925394d39ef76ad96a Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sat, 27 Dec 2014 16:36:50 +0100
-Subject: [PATCH] cmake: let BUILD_SHARED_LIBS drive the type of library built
-
-Do not force the type of library because some architectures (such as
-BlackFin from AnalogDevice) do not support shared object.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index cd82a96..393fee3 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -115,7 +115,7 @@ install(FILES ${LIBIIO_PC} DESTINATION "${INSTALL_PKGCONFIG_DIR}")
- #set(SETUP_PY ${CMAKE_CURRENT_SOURCE_DIR}/bindings/python/setup.py)
- #configure_file(python/setup.py.in ${SETUP_PY} @ONLY)
- 
--add_library(iio SHARED ${LIBIIO_CFILES} ${LIBIIO_HEADERS})
-+add_library(iio ${LIBIIO_CFILES} ${LIBIIO_HEADERS})
- set_target_properties(iio PROPERTIES VERSION ${VERSION} SOVERSION ${LIBIIO_VERSION_MAJOR})
- target_link_libraries(iio LINK_PRIVATE ${LIBS_TO_LINK})
- 
--- 
-2.2.1
-
diff --git a/package/libiio/0002-cmake-libxml2-detection-try-first-the-CMake-module-f.patch b/package/libiio/0001-cmake-libxml2-detection-try-first-the-CMake-module-f.patch
similarity index 100%
rename from package/libiio/0002-cmake-libxml2-detection-try-first-the-CMake-module-f.patch
rename to package/libiio/0001-cmake-libxml2-detection-try-first-the-CMake-module-f.patch
diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index 680d5dc..21496ed 100644
--- a/package/libiio/Config.in
+++ b/package/libiio/Config.in
@@ -40,4 +40,16 @@ config BR2_PACKAGE_LIBIIO_TESTS
 	help
 	  Install the test programs (iio_info, iio_genxml, iio_readdev).
 
+config BR2_PACKAGE_LIBIIO_BINDINGS_CSHARP
+	bool "Install C# bindings"
+	depends on BR2_PACKAGE_MONO
+	help
+	  Install the C# bindings.
+
+config BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON
+	bool "Install Python bindings"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Install the Python bindings.
+
 endif
diff --git a/package/libiio/libiio.hash b/package/libiio/libiio.hash
index bbca4c8..28b9c63 100644
--- a/package/libiio/libiio.hash
+++ b/package/libiio/libiio.hash
@@ -1,2 +1,2 @@
-# From https://github.com/analogdevicesinc/libiio/archive/v0.3/
-sha256	a3571bbf7e80b9e0a8d6bd4b39a5bcd18f80a3d36c4a6f2092dfeefc98e20e07	libiio-v0.3.tar.gz
+# From https://github.com/analogdevicesinc/libiio/archive/v0.5/
+sha256	c41cdcfeae8717e72f1100b4dac9d7cc9d86f4e0731da3354149cb7e051666f3	libiio-0.5.tar.gz
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index 7082e89..802cc03 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -4,15 +4,16 @@
 #
 ################################################################################
 
-LIBIIO_VERSION = v0.3
-LIBIIO_SITE = $(call github,analogdevicesinc,libiio,$(LIBIIO_VERSION))
+LIBIIO_VERSION = 0.5
+LIBIIO_SITE = $(call github,analogdevicesinc,libiio,v$(LIBIIO_VERSION))
 LIBIIO_INSTALL_STAGING = YES
 LIBIIO_LICENSE = LGPLv2.1+
 LIBIIO_LICENSE_FILES = COPYING
 
 LIBIIO_CONF_OPTS = -DENABLE_IPV6=$(if $(BR2_INET_IPV6),ON,OFF) \
 	-DWITH_LOCAL_BACKEND=$(if $(BR2_PACKAGE_LIBIIO_LOCAL_BACKEND),ON,OFF) \
-	-DWITH_TESTS=$(if $(BR2_PACKAGE_LIBIIO_TESTS),ON,OFF)
+	-DWITH_TESTS=$(if $(BR2_PACKAGE_LIBIIO_TESTS),ON,OFF) \
+	-DWITH_DOC=OFF
 
 ifeq ($(BR2_PACKAGE_LIBIIO_NETWORK_BACKEND),y)
 LIBIIO_DEPENDENCIES += libxml2
@@ -33,6 +34,31 @@ ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_AVAHI_DAEMON),yy)
 LIBIIO_DEPENDENCIES += avahi
 endif
 
+ifeq ($(BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON),y)
+LIBIIO_DEPENDENCIES += python
+LIBIIO_CONF_OPTS += -DPYTHON_BINDINGS=ON
+else
+LIBIIO_CONF_OPTS += -DPYTHON_BINDINGS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBIIO_BINDINGS_CSHARP),y)
+define LIBIIO_INSTALL_CSHARP_BINDINGS_TO_TARGET
+	rm $(TARGET_DIR)/usr/lib/cli/libiio-sharp-$(LIBIIO_VERSION)/libiio-sharp.dll.mdb
+	$(HOST_DIR)/usr/bin/gacutil -root $(TARGET_DIR)/usr/lib -i \
+		$(TARGET_DIR)/usr/lib/cli/libiio-sharp-$(LIBIIO_VERSION)/libiio-sharp.dll
+endef
+define LIBIIO_INSTALL_CSHARP_BINDINGS_TO_STAGING
+	$(HOST_DIR)/usr/bin/gacutil -root $(STAGING_DIR)/usr/lib -i \
+		$(STAGING_DIR)/usr/lib/cli/libiio-sharp-$(LIBIIO_VERSION)/libiio-sharp.dll
+endef
+LIBIIO_POST_INSTALL_TARGET_HOOKS += LIBIIO_INSTALL_CSHARP_BINDINGS_TO_TARGET
+LIBIIO_POST_INSTALL_STAGING_HOOKS += LIBIIO_INSTALL_CSHARP_BINDINGS_TO_STAGING
+LIBIIO_DEPENDENCIES += mono
+LIBIIO_CONF_OPTS += -DCSHARP_BINDINGS=ON
+else
+LIBIIO_CONF_OPTS += -DCSHARP_BINDINGS=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBIIO_IIOD),y)
 define LIBIIO_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/libiio/S99iiod \
-- 
2.1.4
