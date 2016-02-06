From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2016 11:16:00 +0100
Subject: [Buildroot] [git commit] openal: fix atomic handling
Message-ID: <20160206101652.7D24A80771@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bad657ddfccb2227a02cdea45ea4da0d91226cf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openal can uses __atomic_*() intrinsics when available, or fall-back
on __sync_*() built-ins. This commit adjusts the package to take into
account for those dependencies, and makes sure we link against
libatomic when gcc >= 4.8 so that the __atomic_*() intrinsics can be
used on all architectures.

Fixes:

  http://autobuild.buildroot.org/results/314fb8da3ca87984e9240d67ff233e2f999ae89e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/gstreamer1/gst1-plugins-bad/Config.in      |  2 +
 .../openal/0001-Fix-detection-of-C11-atomics.patch | 53 ++++++++++++++++++++++
 package/openal/Config.in                           | 17 +++++++
 package/openal/openal.mk                           |  4 ++
 4 files changed, 76 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index f02be34..6e7d21d 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -566,9 +566,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENAL
 	bool "openal"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_PAKCAGE_OPENAL_ARCH_SUPPORTS
 	select BR2_PACKAGE_OPENAL
 
 comment "openal plugin needs a toolchain w/ NPTL, C++"
+	depends on BR2_PAKCAGE_OPENAL_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_INSTALL_LIBSTDCPP
 
diff --git a/package/openal/0001-Fix-detection-of-C11-atomics.patch b/package/openal/0001-Fix-detection-of-C11-atomics.patch
new file mode 100644
index 0000000..c6b9840
--- /dev/null
+++ b/package/openal/0001-Fix-detection-of-C11-atomics.patch
@@ -0,0 +1,53 @@
+From 10fee6d71a1f7d6e6319005196562b4a30b4e8ff Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 2 Feb 2016 14:58:52 +0100
+Subject: [PATCH] Fix detection of C11 atomics
+
+Currently, the CMakeLists.txt logic to detect the availability of C11
+atomics is based on building a small program that uses the
+atomic_load().
+
+However, atomic_load() does not need to use any function from
+libatomic (part of the gcc runtime). So even if libatomic is missing,
+this test concludes that C11 atomic support is available. For example
+on SPARC, the example program builds fine without linking to
+libatomic, but calling other functions of the atomic_*() APIs fail
+without linking to libatomic.
+
+So, this patch adjusts the CMakeLists.txt test to use a function that
+is known to require the libatomic run-time library (on architectures
+where it is needed). This way, openal will only use the __atomic_*()
+built-ins when they are actually functional.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ CMakeLists.txt | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5784d35..a53f996 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -209,14 +209,17 @@ CHECK_C_SOURCE_COMPILES(
+ HAVE_C11_ALIGNAS)
+ 
+ # Check if we have C11 _Atomic
++set(OLD_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES})
++set(CMAKE_REQUIRED_LIBRARIES ${EXTRA_LIBS})
+ CHECK_C_SOURCE_COMPILES(
+ "#include <stdatomic.h>
+- const int _Atomic foo = ATOMIC_VAR_INIT(~0);
++ int _Atomic foo = ATOMIC_VAR_INIT(~0);
+  int main()
+  {
+-     return atomic_load(&foo);
++     return atomic_fetch_add(&foo, 2);
+  }"
+ HAVE_C11_ATOMIC)
++set(CMAKE_REQUIRED_LIBRARIES ${OLD_REQUIRED_LIBRARIES})
+ 
+ # Add definitions, compiler switches, etc.
+ INCLUDE_DIRECTORIES("${OpenAL_SOURCE_DIR}/include" "${OpenAL_BINARY_DIR}")
+-- 
+2.6.4
+
diff --git a/package/openal/Config.in b/package/openal/Config.in
index 4a73f45..a564156 100644
--- a/package/openal/Config.in
+++ b/package/openal/Config.in
@@ -1,7 +1,23 @@
+# openal can:
+# - use __atomic_*() intrinsics when available
+# - otherwise use __sync_*() intrinsics when available. It needs the
+#   4-byte ones on 32 bits architectures, and the 4-byte and 8-byte
+#   one on 64 bits architecture
+# - it also provides its one implementation of atomic operations on
+#   x86 and x86_64, but we dont take those into account since in most
+#   situations __atomic_*() or __sync_*() will be available, and not
+#   all x86 CPUs provide the necessary assembly instructions.
+config BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
+	bool
+	default y if BR2_TOOLCHAIN_HAS_ATOMIC
+	default y if BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_ARCH_IS_64
+	default y if BR2_TOOLCHAIN_HAS_SYNC_4 && BR2_TOOLCHAIN_HAS_SYNC_8 && BR2_ARCH_IS_64
+
 config BR2_PACKAGE_OPENAL
 	bool "openal"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	help
 	  OpenAL provides capabilities for playing audio in a virtual
 	  3D environment. Distance attenuation, doppler shift, and
@@ -11,5 +27,6 @@ config BR2_PACKAGE_OPENAL
 	  http://kcat.strangesoft.net/openal.html
 
 comment "openal needs a toolchain w/ NPTL, C++"
+	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_INSTALL_LIBSTDCPP
diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index 4c9a2b6..2916aa6 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -14,6 +14,10 @@ OPENAL_INSTALL_STAGING = YES
 # We don't need the utilities, Distros don't ship them either
 OPENAL_CONF_OPTS += -DALSOFT_UTILS=OFF
 
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8),y)
+OPENAL_CONF_OPTS += -DEXTRA_LIBS=atomic
+endif
+
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 OPENAL_DEPENDENCIES += alsa-lib
 OPENAL_CONF_OPTS += -DALSOFT_REQUIRE_ALSA=ON
