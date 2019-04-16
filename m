From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Apr 2019 22:13:36 +0200
Subject: [Buildroot] [git commit] package/intel-mediasdk: new package
Message-ID: <20190416201301.3C5AE8ECA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62af96ba8363ad0d8f81be0cece605b777a854a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
[Thomas:
 - add missing Config.in comment
 - add missing select BR2_PACKAGE_LIBDRM_INTEL, needed as the code
   uses a header file installed only when libdrm-intel is enabled
 - add patch to drop -fstack-protector in order to support toolchains
   without SSP support]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-Don-t-force-fstack-protector.patch        | 52 ++++++++++++++++++++++
 package/intel-mediasdk/Config.in                   | 31 +++++++++++++
 package/intel-mediasdk/intel-mediasdk.hash         |  3 ++
 package/intel-mediasdk/intel-mediasdk.mk           | 17 +++++++
 6 files changed, 105 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4de0c5fcec..45986c9dc7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1320,6 +1320,7 @@ F:	package/ti-sgx-um/
 N:	Louis-Paul Cordier <lpdev@cordier.org>
 F:	package/intel-gmmlib/
 F:	package/intel-mediadriver/
+F:	package/intel-mediasdk/
 
 N:	Luca Ceresoli <luca@lucaceresoli.net>
 F:	board/olimex/a20_olinuxino/
diff --git a/package/Config.in b/package/Config.in
index e28b92aa95..a3ef2748c9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1278,6 +1278,7 @@ menu "Graphics"
 	source "package/imlib2/Config.in"
 	source "package/intel-gmmlib/Config.in"
 	source "package/intel-mediadriver/Config.in"
+	source "package/intel-mediasdk/Config.in"
 	source "package/irrlicht/Config.in"
 	source "package/jasper/Config.in"
 	source "package/jpeg/Config.in"
diff --git a/package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch b/package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch
new file mode 100644
index 0000000000..a33c218c0a
--- /dev/null
+++ b/package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch
@@ -0,0 +1,52 @@
+From 28ca7393c08cb54b87d11c1ca92821e48f54781b Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Mon, 15 Apr 2019 23:09:33 +0200
+Subject: [PATCH] Don't force -fstack-protector
+
+This allows the environment to decide whether SSP should be used or
+not, for example to support toolchains that don't have SSP support.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ api/mfx_dispatch/linux/CMakeLists.txt | 2 +-
+ builder/FindPackages.cmake            | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/api/mfx_dispatch/linux/CMakeLists.txt b/api/mfx_dispatch/linux/CMakeLists.txt
+index 15a4bd9a..4415f840 100644
+--- a/api/mfx_dispatch/linux/CMakeLists.txt
++++ b/api/mfx_dispatch/linux/CMakeLists.txt
+@@ -100,7 +100,7 @@ target_link_libraries(mfx dl)
+ get_api_version(MFX_VERSION_MAJOR MFX_VERSION_MINOR)
+ 
+ set_target_properties( mfx PROPERTIES LINK_FLAGS
+-  "-Wl,--no-undefined,-z,relro,-z,now,-z,noexecstack -Wl,--version-script=${CMAKE_CURRENT_SOURCE_DIR}/libmfx.map -fstack-protector")
++  "-Wl,--no-undefined,-z,relro,-z,now,-z,noexecstack -Wl,--version-script=${CMAKE_CURRENT_SOURCE_DIR}/libmfx.map")
+ set_target_properties( mfx PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${CMAKE_LIB_DIR}/${CMAKE_BUILD_TYPE} FOLDER mfx )
+ set_target_properties( mfx PROPERTIES   VERSION ${MFX_VERSION_MAJOR}.${MFX_VERSION_MINOR})
+ set_target_properties( mfx PROPERTIES SOVERSION ${MFX_VERSION_MAJOR})
+diff --git a/builder/FindPackages.cmake b/builder/FindPackages.cmake
+index 7e36ae2d..5b8b9b9d 100644
+--- a/builder/FindPackages.cmake
++++ b/builder/FindPackages.cmake
+@@ -83,7 +83,7 @@ function( configure_build_variant_linux target variant )
+     return() # should not occur; just in case
+   endif()
+   set( link_flags_list "-Wl,--no-undefined,-z,relro,-z,now,-z,noexecstack -Wl,--no-as-needed -ldl")
+-  append_property( ${ARGV0} LINK_FLAGS "${link_flags_list} ${MFX_LDFLAGS} -fstack-protector" )
++  append_property( ${ARGV0} LINK_FLAGS "${link_flags_list} ${MFX_LDFLAGS}" )
+ #  message( STATUS "Libva located at: ${PKG_LIBVA_LIBRARY_DIRS}" )
+ 
+   if( ARGV1 MATCHES hw AND Linux )
+@@ -448,7 +448,7 @@ function(configure_dependencies target dependencies variant)
+   endforeach()
+ 
+   set(SCOPE_CFLAGS ${SCOPE_CFLAGS} PARENT_SCOPE)
+-  set(SCOPE_LINKFLAGS "${SCOPE_LINKFLAGS} -Wl,--no-undefined,-z,relro,-z,now,-z,noexecstack -fstack-protector" PARENT_SCOPE)
++  set(SCOPE_LINKFLAGS "${SCOPE_LINKFLAGS} -Wl,--no-undefined,-z,relro,-z,now,-z,noexecstack" PARENT_SCOPE)
+   set(SCOPE_LIBS ${SCOPE_LIBS} PARENT_SCOPE)
+ endfunction()
+ 
+-- 
+2.20.1
+
diff --git a/package/intel-mediasdk/Config.in b/package/intel-mediasdk/Config.in
new file mode 100644
index 0000000000..05293d7604
--- /dev/null
+++ b/package/intel-mediasdk/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_INTEL_MEDIASDK
+	bool "intel-mediasdk"
+	depends on BR2_x86_64
+	depends on !BR2_STATIC_LIBS # intel-mediadriver
+	depends on BR2_INSTALL_LIBSTDCPP # intel-mediadriver
+	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # intel-mediadriver
+	depends on BR2_TOOLCHAIN_HAS_THREADS # intel-mediadriver
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # intel-mediadriver
+	depends on BR2_PACKAGE_XORG7  # intel-mediadriver
+	select BR2_PACKAGE_INTEL_MEDIADRIVER
+	select BR2_PACKAGE_LIBDRM_INTEL
+	help
+	  Intel(R) Media SDK provides an API to access
+	  hardware-accelerated video decode, encode and filtering on
+	  Intel?? platforms with integrated graphics.
+
+	  Supported video encoders: HEVC, AVC, MPEG-2, JPEG
+	  Supported Video decoders: HEVC, AVC, VP8, MPEG-2, VC1, JPEG
+	  Supported video pre-processing filters: Color Conversion,
+	  Deinterlace, Denoise, Resize, Rotate, Composition
+
+	  http://mediasdk.intel.com/
+
+comment "intel-mediasdk needs X.org"
+	depends on BR2_x86_64 && BR2_TOOLCHAIN_HAS_SYNC_1
+	depends on !BR2_PACKAGE_XORG7
+
+comment "intel-mediasdk needs a toolchain w/ dynamic library, C++, NPTL"
+	depends on BR2_x86_64 && BR2_TOOLCHAIN_HAS_SYNC_1
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/intel-mediasdk/intel-mediasdk.hash b/package/intel-mediasdk/intel-mediasdk.hash
new file mode 100644
index 0000000000..2d2e36384f
--- /dev/null
+++ b/package/intel-mediasdk/intel-mediasdk.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 259d9b57df4fca316898b6dbe7b4d561ce42160fa953f36e2a4b357e86116bf9  intel-mediasdk-18.4.0.tar.gz
+sha256 dfd67773578903698f9ff4a61eb8f2d84810cbecd56f3f3cee8c649f813b6ea6  LICENSE
diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
new file mode 100644
index 0000000000..611529390b
--- /dev/null
+++ b/package/intel-mediasdk/intel-mediasdk.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# intel-mediasdk
+#
+################################################################################
+
+INTEL_MEDIASDK_VERSION = 18.4.0
+INTEL_MEDIASDK_SITE = http://github.com/Intel-Media-SDK/MediaSDK/archive
+INTEL_MEDIASDK_LICENSE = MIT
+INTEL_MEDIASDK_LICENSE_FILES = COPYING
+
+INTEL_MEDIASDK_INSTALL_STAGING = YES
+INTEL_MEDIASDK_DEPENDENCIES = intel-mediadriver
+
+INTEL_MEDIASDK_CONF_OPTS = -DMFX_INCLUDE="$(@D)/api/include"
+
+$(eval $(cmake-package))
