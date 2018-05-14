From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Mon, 14 May 2018 11:11:14 +0200
Subject: [Buildroot] [PATCH v2] package/mfgtools: Allow target build
In-Reply-To: <20180507172740.129d7641@windsurf>
References: <20180507172740.129d7641@windsurf>
Message-ID: <1526289074-4574-1-git-send-email-vincent.prince.fr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
---
 package/Config.in                                  |  1 +
 .../mfgtools/0001-Fix-CXXFLAGS-in-CMakeList.patch  | 62 ++++++++++++++++++++++
 package/mfgtools/Config.in                         | 15 ++++++
 package/mfgtools/mfgtools.mk                       | 20 +++++++
 4 files changed, 98 insertions(+)
 create mode 100644 package/mfgtools/0001-Fix-CXXFLAGS-in-CMakeList.patch
 create mode 100644 package/mfgtools/Config.in

diff --git a/package/Config.in b/package/Config.in
index 9cd5d9c..04a0f6d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -186,6 +186,7 @@ menu "Filesystem and flash utilities"
 	source "package/genext2fs/Config.in"
 	source "package/genpart/Config.in"
 	source "package/genromfs/Config.in"
+	source "package/mfgtools/Config.in"
 	source "package/mmc-utils/Config.in"
 	source "package/mtd/Config.in"
 	source "package/mtools/Config.in"
diff --git a/package/mfgtools/0001-Fix-CXXFLAGS-in-CMakeList.patch b/package/mfgtools/0001-Fix-CXXFLAGS-in-CMakeList.patch
new file mode 100644
index 0000000..eee58b8
--- /dev/null
+++ b/package/mfgtools/0001-Fix-CXXFLAGS-in-CMakeList.patch
@@ -0,0 +1,62 @@
+CMakeLists.txt: Fix cross-compilation
+
+Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
+
+--- a/MfgToolLib/CMakeLists.txt
++++ b/MfgToolLib/CMakeLists.txt
+@@ -130,53 +130,8 @@ set(LIBS ${LIBS} ${LIBUSB_1_LIBRARIES})
+ include_directories(BEFORE ${PROJECT_SOURCE_DIR}  )
+ SET( CMAKE_VERBOSE_MAKEFILE on )
+ 
+-if(CMAKE_BUILD_TYPE STREQUAL "Debug")
+-
+-  set(CMAKE_CXX_FLAGS "-g")
+-
+-
+-  set(SOURCES ${SOURCES_})
+-
+-
+-
+-  add_library( MfgToolLib ${SOURCES} )
+-
+-
+-
+-endif(CMAKE_BUILD_TYPE STREQUAL "Debug")
+-if(TARGET MfgToolLib)
+-
+-  set_property(TARGET MfgToolLib APPEND PROPERTY COMPILE_DEFINITIONS_DEBUG
+-    WIN32
+-    _CRT_SECURE_NO_DEPRECATE
+-    _DEBUG
+-    _USRDLL
+-    _WINDOWS
+-  )
+-endif(TARGET MfgToolLib)
+-
+-if(CMAKE_CONFIGURATION_TYPES OR CMAKE_BUILD_TYPE STREQUAL "Release")
+-
+-
+-  set(SOURCES  ${SOURCES_})
+-
+-
+-  add_library( MfgToolLib ${SOURCES} )
+-
+-
+-endif(CMAKE_CONFIGURATION_TYPES OR CMAKE_BUILD_TYPE STREQUAL "Release")
+-if(TARGET MfgToolLib)
+-
+-  set_property(TARGET MfgToolLib APPEND PROPERTY COMPILE_DEFINITIONS_RELEASE
+-    NDEBUG
+-    WIN32
+-    _CRT_SECURE_NO_DEPRECATE
+-    _USRDLL
+-    _WINDOWS
+-  )
+-endif(TARGET MfgToolLib)
+-set (CMAKE_CXX_FLAGS "-std=c++11 -O0 -fpic -I/usr/lib/jvm/java-8-oracle/include -I/usr/lib/jvm/java-8-oracle/include/linux -fpermissive -g -Wno-write-strings")
++set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -fpermissive -g -Wno-write-strings")
+ set(SOURCES ${SOURCES_})
+ 
+-add_library( MfgToolLib SHARED ${SOURCES} )
++add_library( MfgToolLib SHARED ${SOURCES} )
+ target_link_libraries(MfgToolLib ${LIBS})
diff --git a/package/mfgtools/Config.in b/package/mfgtools/Config.in
new file mode 100644
index 0000000..0ab51a8
--- /dev/null
+++ b/package/mfgtools/Config.in
@@ -0,0 +1,15 @@
+comment "mfgtools needs gcc >= 4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
+config BR2_PACKAGE_MFGTOOLS
+	bool "mfgtools"
+	depends on BR2_arm
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # needs C++11
+	select BR2_PACKAGE_LIBUSB
+	help
+	  This package contains the Freescale manufacturing tool.
+	  It is designed to program firmware to i.MX boards during
+	  production. The communication is done over USB using the
+	  Freescale UTP protocol.
+
+	  https://github.com/codeauroraforum/mfgtools
diff --git a/package/mfgtools/mfgtools.mk b/package/mfgtools/mfgtools.mk
index e4663a8..9867785 100644
--- a/package/mfgtools/mfgtools.mk
+++ b/package/mfgtools/mfgtools.mk
@@ -9,21 +9,40 @@ MFGTOOLS_SITE = $(call github,codeauroraforum,mfgtools,$(MFGTOOLS_VERSION))
 MFGTOOLS_SUBDIR = MfgToolLib
 MFGTOOLS_LICENSE = BSD-3-Clause or CPOL
 MFGTOOLS_LICENSE_FILES = LICENSE README.txt
+
+MFGTOOLS_DEPENDENCIES = libusb
 HOST_MFGTOOLS_DEPENDENCIES = host-libusb
 
+MFGTOOLS_CFLAGS = \
+	$(TARGET_CFLAGS) $(TARGET_LDFLAGS) -std=c++11 -lpthread \
+	-L$(@D)/MfgToolLib -lMfgToolLib -I$(@D)/MfgToolLib \
+	-lusb-1.0 -I$(STAGING_DIR)/usr/include/libusb-1.0 \
+	-fpermissive -Wno-write-strings
 HOST_MFGTOOLS_CFLAGS = \
 	$(HOST_CFLAGS) $(HOST_LDFLAGS) -std=c++11 -lpthread \
 	-L$(@D)/MfgToolLib -lMfgToolLib -I$(@D)/MfgToolLib \
 	-lusb-1.0 -I$(HOST_DIR)/include/libusb-1.0 \
 	-fpermissive -Wno-write-strings
 
+define MFGTOOLS_CLI_BUILD
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC="$(TARGET_CXX)" \
+		CFLAGS="$(MFGTOOLS_CFLAGS)" -C $(@D)/TestPrgm
+endef
 define HOST_MFGTOOLS_CLI_BUILD
 	$(HOST_CONFIGURE_OPTS) $(MAKE) CC="$(HOSTCXX)" \
 		CFLAGS="$(HOST_MFGTOOLS_CFLAGS)" -C $(@D)/TestPrgm
 endef
 
+MFGTOOLS_POST_BUILD_HOOKS += MFGTOOLS_CLI_BUILD
 HOST_MFGTOOLS_POST_BUILD_HOOKS += HOST_MFGTOOLS_CLI_BUILD
 
+define MFGTOOLS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/MfgToolLib/libMfgToolLib.so \
+		$(TARGET_DIR)/usr/lib/libMfgToolLib.so
+	$(INSTALL) -D -m 755 $(@D)/TestPrgm/mfgtoolcli \
+		$(TARGET_DIR)/usr/bin/mfgtoolcli
+endef
+
 define HOST_MFGTOOLS_INSTALL_CMDS
 	$(INSTALL) -D -m 755 $(@D)/MfgToolLib/libMfgToolLib.so \
 		$(HOST_DIR)/lib/libMfgToolLib.so
@@ -31,4 +50,5 @@ define HOST_MFGTOOLS_INSTALL_CMDS
 		$(HOST_DIR)/bin/mfgtoolcli
 endef
 
+$(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.7.4
