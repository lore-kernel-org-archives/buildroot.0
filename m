From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Oct 2019 11:31:51 -0600
Subject: [Buildroot] [PATCH v5 3/3] support/dependencies: set cmake version
 min to 3.10 when required
In-Reply-To: <20191013173151.29108-1-james.hilliard1@gmail.com>
References: <20191013173151.29108-1-james.hilliard1@gmail.com>
Message-ID: <20191013173151.29108-3-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We retain 3.8 as the minimum for hosts without a c++ toolchain.

Add boolean selected by packages that require cmake >= 3.10

Select BR2_NEEDS_HOST_CMAKE_3_10 in wpewebkit and webkitgtk
packages.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

---
Changes v4 -> v5:
  - explicitly set required cmake versions in wpewebkit/webkitgtk

Changes v3 -> v4:
  - retain support for version 3.8.2 for older toolchains
---
 Config.in                                | 5 +++++
 package/webkitgtk/Config.in              | 3 ++-
 package/wpewebkit/Config.in              | 3 ++-
 support/dependencies/check-host-cmake.mk | 4 ++++
 4 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index a6e280b885..cc1cd410c5 100644
--- a/Config.in
+++ b/Config.in
@@ -105,6 +105,11 @@ config BR2_HOSTARCH_NEEDS_IA32_COMPILER
 config BR2_NEEDS_HOST_UTF8_LOCALE
 	bool
 
+# Hidden boolean selected by packages that need the host to have a
+# cmake >= 3.10.
+config BR2_NEEDS_HOST_CMAKE_3_10
+	bool
+
 source "arch/Config.in"
 
 menu "Build options"
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index db67c89042..46f9ecf8fe 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -23,11 +23,12 @@ comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gc
 config BR2_PACKAGE_WEBKITGTK
 	bool "webkitgtk"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu, host-cmake
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_PACKAGE_LIBGTK3
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
+	select BR2_NEEDS_HOST_CMAKE_3_10
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_ENCHANT
diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 5f3e237c53..224c64446b 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -32,12 +32,13 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland, icu, libsoup
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
-	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu, host-cmake
 	depends on BR2_USE_WCHAR # icu, libsoup
 	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
 	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wpebackend-fdo
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
+	select BR2_NEEDS_HOST_CMAKE_3_10
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_HARFBUZZ
diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
index 4a1491d646..ee8bc52509 100644
--- a/support/dependencies/check-host-cmake.mk
+++ b/support/dependencies/check-host-cmake.mk
@@ -3,7 +3,11 @@
 # package is bumped or a new one added, and it requires a higher
 # version, our cmake infra will catch it and build its own.
 #
+ifeq ($(BR2_NEEDS_HOST_CMAKE_3_10),y)
+BR2_CMAKE_VERSION_MIN = 3.10
+else
 BR2_CMAKE_VERSION_MIN = 3.8
+endif
 
 BR2_CMAKE_CANDIDATES ?= cmake cmake3
 BR2_CMAKE ?= $(call suitable-host-package,cmake,\
-- 
2.20.1
