From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 20 Nov 2019 17:39:25 +0000
Subject: [Buildroot] [RFC PATCH v3 11/30] package/libcef: New package
In-Reply-To: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
References: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
Message-ID: <20191120173944.130142-12-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michael Drake <michael.drake@codethink.co.uk>

Adds the Chromium Embedded Framework library.

The libcef library is built using the LLVM (clang) toolchain.

This is a library for creating applications with embedded web
browser functionality.  The Chromium Embedded Framework library
itself does not include the Chromium source code.

As such, this package fetches the libcef source, and also the
corresponding Chromium source release.  It extracts first the
Chromium source into the package build directory, and then the
libcef source.

Unfortunately, the libcef project does not make release tarballs
(or tags), so it is fetched from a git repository with a specific
SHA1 version.

The Chromium Embedded Framework project carries some patches
for the Chromium source, and these are applied in a pre-patch
hook step.

The libcef build works by augmenting the the Chromium build to
include the extra Chromium Embedded Framework sources.

Since Chromium is an enormous monolithic source tree containing
many other projects, there are a lot of licenses involved.  As
such, we have a script to collect up the list of License files
and generate an include makefile to list them.  The script is
provided in the package's scripts directory.

Coauthored-by: Thomas Preston <thomas.preston@codethink.co.uk>
Cc: Patrick Glaser <pglaser@tesla.com>
Cc: Jon duSaint <jdusaint@tesla.com>
Cc: Enis Lavery <elavery@tesla.com>
Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/Config.in                             |    1 +
 ...et-pkg_config-wrapper-handle-sysroot.patch |   52 +
 ...e-cef_use_gtk-for-cefclient-GTK-deps.patch |   57 +
 .../libcef/0003-stop-widevine-assert.patch    |   15 +
 package/libcef/Config.in                      |   88 ++
 .../build/toolchain/linux/unbundle/BUILD.gn   |   49 +
 package/libcef/libcef.license-files.inc       | 1131 +++++++++++++++++
 package/libcef/libcef.mk                      |  384 ++++++
 .../libcef/scripts/gather-license-files.sh    |   53 +
 package/libcef/scripts/version.sh             |   48 +
 package/libcef/templates/cef_version.h        |   70 +
 11 files changed, 1948 insertions(+)
 create mode 100644 package/libcef/0001-pkg_config-Let-pkg_config-wrapper-handle-sysroot.patch
 create mode 100644 package/libcef/0003-BUILD.gn-Use-cef_use_gtk-for-cefclient-GTK-deps.patch
 create mode 100644 package/libcef/0003-stop-widevine-assert.patch
 create mode 100644 package/libcef/Config.in
 create mode 100644 package/libcef/build/toolchain/linux/unbundle/BUILD.gn
 create mode 100644 package/libcef/libcef.license-files.inc
 create mode 100644 package/libcef/libcef.mk
 create mode 100755 package/libcef/scripts/gather-license-files.sh
 create mode 100755 package/libcef/scripts/version.sh
 create mode 100644 package/libcef/templates/cef_version.h

diff --git a/package/Config.in b/package/Config.in
index f3c69b60c2..9cbb454a50 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1591,6 +1591,7 @@ menu "Networking"
 	source "package/gupnp-dlna/Config.in"
 	source "package/ibrcommon/Config.in"
 	source "package/ibrdtn/Config.in"
+	source "package/libcef/Config.in"
 	source "package/libcgi/Config.in"
 	source "package/libcgicc/Config.in"
 	source "package/libcoap/Config.in"
diff --git a/package/libcef/0001-pkg_config-Let-pkg_config-wrapper-handle-sysroot.patch b/package/libcef/0001-pkg_config-Let-pkg_config-wrapper-handle-sysroot.patch
new file mode 100644
index 0000000000..1b6c9cb9e9
--- /dev/null
+++ b/package/libcef/0001-pkg_config-Let-pkg_config-wrapper-handle-sysroot.patch
@@ -0,0 +1,52 @@
+From 9ae5ac511bbb1c9ba9c1b8160ea82132b441028a Mon Sep 17 00:00:00 2001
+From: Thomas Preston <thomas.preston@codethink.co.uk>
+Date: Thu, 31 Oct 2019 17:14:20 +0000
+Subject: [PATCH] pkg_config: Let pkg_config wrapper handle sysroot
+
+If use_sysroot=true, the pkg_config.gni forces the pkg-config.py script
+to use the sysroot prefix, even when we're using a pkg_config wrapper,
+for example in a custom cross-compile environment.
+
+The pkg_config wrapper script may already handle the custom sysroot, for
+example in Buildroot:
+https://git.buildroot.net/buildroot/tree/package/pkgconf/pkg-config.in
+
+Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
+---
+ build/config/linux/pkg_config.gni | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/build/config/linux/pkg_config.gni b/build/config/linux/pkg_config.gni
+index 428e44ac0a03..03551a6ff273 100644
+--- a/build/config/linux/pkg_config.gni
++++ b/build/config/linux/pkg_config.gni
+@@ -30,6 +30,8 @@ declare_args() {
+   # environments.
+   # Leaving it blank defaults to searching PATH for 'pkg-config' and relying on
+   # the sysroot mechanism to find the right .pc files.
++  # Setting this value disables any pkg-config.py customisations such as `-s`,
++  # this should be handled in the wrapper itself.
+   pkg_config = ""
+ 
+   # A optional pkg-config wrapper to use for tools built on the host.
+@@ -53,7 +55,7 @@ pkg_config_script = "//build/config/linux/pkg-config.py"
+ # need to invoke it manually.
+ pkg_config_args = []
+ 
+-if (sysroot != "") {
++if (pkg_config == "" && sysroot != "") {
+   # Pass the sysroot if we're using one (it requires the CPU arch also).
+   pkg_config_args += [
+     "-s",
+@@ -71,7 +73,7 @@ if (pkg_config != "") {
+ }
+ 
+ # Only use the custom libdir when building with the target sysroot.
+-if (target_sysroot != "" && sysroot == target_sysroot) {
++if (pkg_config == "" && target_sysroot != "" && sysroot == target_sysroot) {
+   pkg_config_args += [
+     "--system_libdir",
+     system_libdir,
+-- 
+2.20.1
+
diff --git a/package/libcef/0003-BUILD.gn-Use-cef_use_gtk-for-cefclient-GTK-deps.patch b/package/libcef/0003-BUILD.gn-Use-cef_use_gtk-for-cefclient-GTK-deps.patch
new file mode 100644
index 0000000000..ae35eee3b9
--- /dev/null
+++ b/package/libcef/0003-BUILD.gn-Use-cef_use_gtk-for-cefclient-GTK-deps.patch
@@ -0,0 +1,57 @@
+From df279ff3b18f15356162fa141c3840dfa1fe9d1c Mon Sep 17 00:00:00 2001
+From: Thomas Preston <thomas.preston@codethink.co.uk>
+Date: Thu, 31 Oct 2019 11:20:36 +0000
+Subject: [PATCH] BUILD.gn: Use cef_use_gtk for cefclient GTK deps
+
+The cefclient target depends on GTK packages that are not available in
+the default sysroot environment. So we should only use them when we are
+not using the sysroot. Alternatively, the developer might not want to
+use the GTK dependencies at all, in which case they can set
+`cef_use_gtk=false`.
+
+Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
+Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>t
+---
+ cef/BUILD.gn | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/cef/BUILD.gn b/cef/BUILD.gn
+index 6aa0a84d..de8f472b 100644
+--- a/cef/BUILD.gn
++++ b/cef/BUILD.gn
+@@ -235,6 +235,13 @@ if (is_win) {
+   import("//build/config/win/manifest.gni")
+ }
+ 
++declare_args() {
++  # The cefclient target depends on GTK packages that are not available in the
++  # default sysroot environment. So we should only use them when we are not
++  # using the sysroot. Alternatively, the developer might not want to use the
++  # GTK dependencies at all, in which case they can set `cef_use_gtk=false`.
++  cef_use_gtk = !use_sysroot
++}
+ 
+ #
+ # Verify required global arguments configured via `gn args`.
+@@ -2055,7 +2062,9 @@ if (is_mac) {
+         "glib-2.0",
+       ]
+     }
++  }
+ 
++  if (is_linux && cef_use_gtk) {
+     pkg_config("gtk") {
+       packages = [
+         "gmodule-2.0",
+@@ -2149,7 +2158,7 @@ if (is_mac) {
+         "X11",
+       ]
+ 
+-      if (!use_sysroot) {
++      if (cef_use_gtk) {
+         configs += [
+           ":gtk",
+           ":gtkglext",
+-- 
+2.23.0
+
diff --git a/package/libcef/0003-stop-widevine-assert.patch b/package/libcef/0003-stop-widevine-assert.patch
new file mode 100644
index 0000000000..b3a145b90d
--- /dev/null
+++ b/package/libcef/0003-stop-widevine-assert.patch
@@ -0,0 +1,15 @@
+diff --git a/BUILD.gn b/BUILD.gn
+index f5dd5cad..b37080cb 100644
+--- a/cef/BUILD.gn
++++ b/cef/BUILD.gn
+@@ -246,9 +246,6 @@ assert(enable_basic_printing)
+ assert(enable_print_preview)
+ assert(!enable_service_discovery)
+ 
+-# Enable support for Widevine CDM.
+-assert(enable_widevine)
+-
+ if (is_clang) {
+   # Don't use the chrome style plugin.
+   assert(!clang_use_chrome_plugins)
+
diff --git a/package/libcef/Config.in b/package/libcef/Config.in
new file mode 100644
index 0000000000..6f091af5dd
--- /dev/null
+++ b/package/libcef/Config.in
@@ -0,0 +1,88 @@
+config BR2_PACKAGE_LIBCEF_TARGET_ARCH
+	string
+	default "arm" if BR2_arm
+	default "arm64" if BR2_aarch64
+	default "mips" if BR2_mips
+	default "x86" if BR2_i386
+	default "x64" if BR2_x86_64
+
+config BR2_PACKAGE_LIBCEF_ARCH_SUPPORTS
+	bool
+	default y if BR2_PACKAGE_LIBCEF_TARGET_ARCH != ""
+	depends on BR2_HOSTARCH = "x86_64"
+
+comment "libcef requires a toolchain with glibc, wchar, threads"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+	           !BR2_TOOLCHAIN_HAS_THREADS || \
+	           !BR2_USE_WCHAR
+
+comment "libcef needs the standard C++ library"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+comment "libcef isn't compatible with flat binary formats"
+	depends on BR2_BINFMT_FLAT
+
+comment "libcef depends on shared libraries being enabled"
+	depends on BR2_STATIC_LIBS
+
+comment "libcef requires an MMU"
+	depends on !BR2_USE_MMU
+
+comment "libcef requires LLVM to build"
+	depends on !BR2_PACKAGE_LLVM
+
+comment "libcef depends on GTK3, X.org and OpenGL backend"
+	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_HAS_LIBGL
+
+config BR2_PACKAGE_LIBCEF
+	bool "libcef"
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # gn requires -std=c++14
+	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz, icu, pango
+	depends on BR2_USE_WCHAR # at-spi2-atk, icu, glib2, libgtk3, pango
+	depends on BR2_TOOLCHAIN_USES_GLIBC # compiler-rt
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib, dbus, glib2, icu
+	depends on BR2_USE_MMU # at-spi2-atk, dbus, glib2, libgtk3, libkrb5, pango
+	depends on !BR2_BINFMT_FLAT # icu
+	depends on !BR2_STATIC_LIBS # libopenh264, libkrb5
+	depends on BR2_PACKAGE_LIBCEF_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_LLVM # compiler-rt
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_LIBGTK3
+	select BR2_PACKAGE_AT_SPI2_ATK
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_COMPILER_RT
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FLAC
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_HARFBUZZ
+	select BR2_PACKAGE_LLVM_ENABLE_HOST_ARCH
+	select BR2_PACKAGE_ICU
+	select BR2_PACKAGE_JPEG_TURBO
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBERATION # runtime
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBGTK3_X11
+	select BR2_PACKAGE_LIBKRB5
+	select BR2_PACKAGE_LIBNSS
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBXSLT
+	select BR2_PACKAGE_PCIUTILS
+	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_WEBP
+	select BR2_PACKAGE_WEBP_MUX
+	select BR2_PACKAGE_WEBP_DEMUX
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
+	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XLIB_LIBXSCRNSAVER
+	select BR2_PACKAGE_XLIB_LIBXV
+	select BR2_PACKAGE_ZLIB
+	help
+	  Chromium Embedded Framework focuses on facilitating embedded
+	  browser use cases in third-party applications, based on the
+	  Google Chromium web browser.
+
+	  https://bitbucket.org/chromiumembedded/cef
diff --git a/package/libcef/build/toolchain/linux/unbundle/BUILD.gn b/package/libcef/build/toolchain/linux/unbundle/BUILD.gn
new file mode 100644
index 0000000000..765a131b86
--- /dev/null
+++ b/package/libcef/build/toolchain/linux/unbundle/BUILD.gn
@@ -0,0 +1,49 @@
+# Chromium build/toolchain/linux/unbundle/BUILD.gn override
+# Use this file to "unbundle" the default (target), host and V8 snapshot
+# toolchains. This is how we get Buildroot Makefile variables into the Chromium
+# build system.
+
+import("//build/toolchain/gcc_toolchain.gni")
+
+gcc_toolchain("default") {
+  cc = getenv("CC")
+  cxx = getenv("CXX")
+  ar = getenv("AR")
+  nm = getenv("NM")
+  ld = cxx
+
+  extra_cflags = getenv("CFLAGS")
+  extra_cppflags = getenv("CPPFLAGS")
+  extra_cxxflags = getenv("CXXFLAGS")
+  extra_ldflags = getenv("LDFLAGS")
+
+  toolchain_args = {
+    current_cpu = target_cpu
+    current_os = target_os
+  }
+}
+
+gcc_toolchain("host") {
+  cc = getenv("BUILD_CC")
+  cxx = getenv("BUILD_CXX")
+  ar = getenv("BUILD_AR")
+  nm = getenv("BUILD_NM")
+  ld = cxx
+
+  extra_cflags = getenv("BUILD_CFLAGS")
+  extra_cppflags = getenv("BUILD_CPPFLAGS")
+  extra_cxxflags = getenv("BUILD_CXXFLAGS")
+  extra_asmflags = getenv("BUILD_ASMFLAGS")
+  extra_ldflags = getenv("BUILD_LDFLAGS")
+
+  toolchain_args = {
+    current_cpu = host_cpu
+    current_os = host_os
+    # Buildroot doesn't a sysroot when building host tools.
+    use_sysroot = false
+    # Disable the target_sysroot override, which forces a sysroot no matter what
+    target_sysroot = ""
+  }
+}
+
+# TODO V8 snapshot toolchain
diff --git a/package/libcef/libcef.license-files.inc b/package/libcef/libcef.license-files.inc
new file mode 100644
index 0000000000..17463f97e7
--- /dev/null
+++ b/package/libcef/libcef.license-files.inc
@@ -0,0 +1,1131 @@
+# Generated with package/libcef/scripts/gather-license-files.sh
+LIBCEF_LICENSE_FILES = \
+	base/third_party/cityhash/COPYING \
+	base/third_party/dmg_fp/LICENSE \
+	base/third_party/dynamic_annotations/LICENSE \
+	base/third_party/icu/LICENSE \
+	base/third_party/libevent/LICENSE \
+	base/third_party/nspr/LICENSE \
+	base/third_party/superfasthash/LICENSE \
+	base/third_party/symbolize/LICENSE \
+	base/third_party/valgrind/LICENSE \
+	base/third_party/xdg_mime/LICENSE \
+	base/third_party/xdg_user_dirs/LICENSE \
+	build/fuchsia/fidlgen_js/third_party/enum34/LICENSE \
+	buildtools/LICENSE \
+	buildtools/third_party/libc++abi/trunk/LICENSE.TXT \
+	buildtools/third_party/libc++/trunk/LICENSE.TXT \
+	buildtools/third_party/libc++/trunk/utils/google-benchmark/LICENSE \
+	buildtools/third_party/libunwind/trunk/LICENSE.TXT \
+	cef/LICENSE.txt \
+	cef/tools/yapf/LICENSE \
+	chrome/android/third_party/compositor_animator/LICENSE \
+	chrome/browser/resources/chromeos/camera/src/LICENSE \
+	chrome/browser/resources/chromeos/zip_archiver/LICENSE \
+	chrome/installer/mac/third_party/bsdiff/LICENSE \
+	chrome/installer/mac/third_party/xz/LICENSE \
+	chrome/test/vr/perf/latency/third_party/maestro/LICENSE \
+	chrome/third_party/mock4js/LICENSE \
+	chrome/third_party/mozilla_security_manager/LICENSE \
+	components/cronet/third_party/curl_headers/COPYING \
+	components/cronet/third_party/curl_headers/LICENSE \
+	courgette/third_party/divsufsort/LICENSE \
+	ios/third_party/blink/LICENSE \
+	ios/third_party/earl_grey2/LICENSE \
+	ios/third_party/earl_grey/LICENSE \
+	ios/third_party/edo/LICENSE \
+	ios/third_party/firebase/LICENSE \
+	ios/third_party/fishhook/LICENSE \
+	ios/third_party/gtx/LICENSE \
+	ios/third_party/material_components_ios/LICENSE \
+	ios/third_party/material_font_disk_loader_ios/LICENSE \
+	ios/third_party/material_internationalization_ios/LICENSE \
+	ios/third_party/material_roboto_font_loader_ios/LICENSE \
+	ios/third_party/material_sprited_animation_view_ios/LICENSE \
+	ios/third_party/material_text_accessibility_ios/LICENSE \
+	ios/third_party/motion_animator_objc/LICENSE \
+	ios/third_party/motion_interchange_objc/LICENSE \
+	ios/third_party/motion_transitioning_objc/LICENSE \
+	ios/third_party/ochamcrest/LICENSE \
+	ios/third_party/webkit/LICENSE \
+	LICENSE \
+	LICENSE.chromium_os \
+	mojo/public/LICENSE \
+	native_client/COPYING \
+	native_client/LICENSE \
+	native_client_sdk/src/COPYING \
+	native_client_sdk/src/libraries/third_party/pthreads-win32/COPYING \
+	native_client_sdk/src/libraries/third_party/pthreads-win32/COPYING.LIB \
+	native_client_sdk/src/libraries/third_party/pthreads-win32/LICENSE \
+	native_client_sdk/src/LICENSE \
+	native_client/src/third_party/pnacl_native_newlib_subset/COPYING.NEWLIB \
+	net/third_party/mozilla_security_manager/LICENSE \
+	net/third_party/nss/LICENSE \
+	net/third_party/quiche/src/LICENSE \
+	net/third_party/uri_template/LICENSE \
+	ppapi/LICENSE \
+	third_party/abseil-cpp/LICENSE \
+	third_party/accessibility-audit/LICENSE \
+	third_party/accessibility_test_framework/LICENSE \
+	third_party/afl/src/docs/COPYING \
+	third_party/android_build_tools/bundletool/LICENSE \
+	third_party/android_crazy_linker/LICENSE \
+	third_party/android_crazy_linker/src/LICENSE \
+	third_party/android_data_chart/LICENSE \
+	third_party/android_deps/libs/android_arch_core_common/LICENSE \
+	third_party/android_deps/libs/android_arch_lifecycle_common_java8/LICENSE \
+	third_party/android_deps/libs/android_arch_lifecycle_common/LICENSE \
+	third_party/android_deps/libs/android_arch_lifecycle_runtime/LICENSE \
+	third_party/android_deps/libs/androidx_annotation_annotation/LICENSE \
+	third_party/android_deps/libs/androidx_lifecycle_lifecycle_common/LICENSE \
+	third_party/android_deps/libs/androidx_test_core/LICENSE \
+	third_party/android_deps/libs/androidx_test_ext_junit/LICENSE \
+	third_party/android_deps/libs/androidx_test_monitor/LICENSE \
+	third_party/android_deps/libs/androidx_test_rules/LICENSE \
+	third_party/android_deps/libs/androidx_test_runner/LICENSE \
+	third_party/android_deps/libs/com_android_support_animated_vector_drawable/LICENSE \
+	third_party/android_deps/libs/com_android_support_appcompat_v7/LICENSE \
+	third_party/android_deps/libs/com_android_support_cardview_v7/LICENSE \
+	third_party/android_deps/libs/com_android_support_design/LICENSE \
+	third_party/android_deps/libs/com_android_support_gridlayout_v7/LICENSE \
+	third_party/android_deps/libs/com_android_support_leanback_v17/LICENSE \
+	third_party/android_deps/libs/com_android_support_mediarouter_v7/LICENSE \
+	third_party/android_deps/libs/com_android_support_multidex/LICENSE \
+	third_party/android_deps/libs/com_android_support_palette_v7/LICENSE \
+	third_party/android_deps/libs/com_android_support_preference_leanback_v17/LICENSE \
+	third_party/android_deps/libs/com_android_support_preference_v14/LICENSE \
+	third_party/android_deps/libs/com_android_support_preference_v7/LICENSE \
+	third_party/android_deps/libs/com_android_support_recyclerview_v7/LICENSE \
+	third_party/android_deps/libs/com_android_support_support_annotations/LICENSE \
+	third_party/android_deps/libs/com_android_support_support_compat/LICENSE \
+	third_party/android_deps/libs/com_android_support_support_core_ui/LICENSE \
+	third_party/android_deps/libs/com_android_support_support_core_utils/LICENSE \
+	third_party/android_deps/libs/com_android_support_support_fragment/LICENSE \
+	third_party/android_deps/libs/com_android_support_support_media_compat/LICENSE \
+	third_party/android_deps/libs/com_android_support_support_v13/LICENSE \
+	third_party/android_deps/libs/com_android_support_support_v4/LICENSE \
+	third_party/android_deps/libs/com_android_support_support_vector_drawable/LICENSE \
+	third_party/android_deps/libs/com_android_support_transition/LICENSE \
+	third_party/android_deps/libs/com_google_android_gms_play_services_auth_api_phone/LICENSE \
+	third_party/android_deps/libs/com_google_android_gms_play_services_auth_base/LICENSE \
+	third_party/android_deps/libs/com_google_android_gms_play_services_auth/LICENSE \
+	third_party/android_deps/libs/com_google_android_gms_play_services_base/LICENSE \
+	third_party/android_deps/libs/com_google_android_gms_play_services_basement/LICENSE \
+	third_party/android_deps/libs/com_google_android_gms_play_services_cast_framework/LICENSE \
+	third_party/android_deps/libs/com_google_android_gms_play_services_cast/LICENSE \
+	third_party/android_deps/libs/com_google_android_gms_play_services_clearcut/LICENSE \
+	third_party/android_deps/libs/com_google_android_gms_play_services_fido/LICENSE \
+	third_party/android_deps/libs/com_google_android_gms_play_services_flags/LICENSE \
+	third_party/android_deps/libs/com_google_android_gms_play_services_gcm/LICENSE \
+	third_party/android_deps/libs/com_google_android_gms_play_services_iid/LICENSE \
+	third_party/android_deps/libs/com_google_android_gms_play_services_instantapps/LICENSE \
+	third_party/android_deps/libs/com_google_android_gms_play_services_location/LICENSE \
+	third_party/android_deps/libs/com_google_android_gms_play_services_phenotype/LICENSE \
+	third_party/android_deps/libs/com_google_android_gms_play_services_places_placereport/LICENSE \
+	third_party/android_deps/libs/com_google_android_gms_play_services_stats/LICENSE \
+	third_party/android_deps/libs/com_google_android_gms_play_services_tasks/LICENSE \
+	third_party/android_deps/libs/com_google_android_gms_play_services_vision_common/LICENSE \
+	third_party/android_deps/libs/com_google_android_gms_play_services_vision/LICENSE \
+	third_party/android_deps/libs/com_google_ar_core/LICENSE \
+	third_party/android_deps/libs/com_google_code_findbugs_jsr305/LICENSE \
+	third_party/android_deps/libs/com_google_dagger_dagger_compiler/LICENSE \
+	third_party/android_deps/libs/com_google_dagger_dagger/LICENSE \
+	third_party/android_deps/libs/com_google_dagger_dagger_producers/LICENSE \
+	third_party/android_deps/libs/com_google_dagger_dagger_spi/LICENSE \
+	third_party/android_deps/libs/com_google_errorprone_error_prone_annotations/LICENSE \
+	third_party/android_deps/libs/com_google_errorprone_javac_shaded/LICENSE \
+	third_party/android_deps/libs/com_google_googlejavaformat_google_java_format/LICENSE \
+	third_party/android_deps/libs/com_google_guava_guava/LICENSE \
+	third_party/android_deps/libs/com_google_j2objc_j2objc_annotations/LICENSE \
+	third_party/android_deps/libs/com_google_protobuf_protobuf_lite/LICENSE \
+	third_party/android_deps/libs/com_squareup_javapoet/LICENSE \
+	third_party/android_deps/libs/javax_annotation_jsr250_api/LICENSE \
+	third_party/android_deps/libs/javax_inject_javax_inject/LICENSE \
+	third_party/android_deps/libs/net_sf_kxml_kxml2/LICENSE \
+	third_party/android_deps/libs/org_checkerframework_checker_compat_qual/LICENSE \
+	third_party/android_deps/libs/org_codehaus_mojo_animal_sniffer_annotations/LICENSE \
+	third_party/android_deps/licenses/Android_SDK_License-December_9_2016.txt \
+	third_party/android_deps/licenses/Codehaus_License-2009.txt \
+	third_party/android_media/LICENSE \
+	third_party/android_opengl/LICENSE \
+	third_party/android_platform/LICENSE \
+	third_party/android_sdk/LICENSE \
+	third_party/android_support_test_runner/LICENSE \
+	third_party/android_swipe_refresh/LICENSE \
+	third_party/android_system_sdk/LICENSE \
+	third_party/angle/LICENSE \
+	third_party/angle/src/common/third_party/smhasher/LICENSE \
+	third_party/angle/src/common/third_party/xxhash/LICENSE \
+	third_party/angle/src/tests/test_utils/third_party/LICENSE \
+	third_party/angle/src/third_party/compiler/LICENSE \
+	third_party/angle/src/third_party/libXNVCtrl/LICENSE \
+	third_party/angle/third_party/deqp/src/external/graphicsfuzz/data/gles3/graphicsfuzz/LICENSE \
+	third_party/angle/third_party/deqp/src/external/vulkancts/LICENSE \
+	third_party/angle/third_party/deqp/src/LICENSE \
+	third_party/angle/third_party/deqp/src/MODULE_LICENSE_APACHE2 \
+	third_party/angle/third_party/glmark2/src/COPYING \
+	third_party/angle/third_party/glmark2/src/COPYING.SGI \
+	third_party/angle/third_party/glmark2/src/src/libjpeg-turbo/LICENSE.md \
+	third_party/angle/third_party/glmark2/src/src/libmatrix/COPYING \
+	third_party/angle/third_party/glmark2/src/src/libpng/LICENSE \
+	third_party/angle/third_party/rapidjson/src/bin/jsonschema/LICENSE \
+	third_party/angle/third_party/rapidjson/src/contrib/natvis/LICENSE \
+	third_party/angle/third_party/rapidjson/src/license.txt \
+	third_party/angle/third_party/vulkan-headers/src/LICENSE.txt \
+	third_party/angle/third_party/vulkan-loader/src/LICENSE.txt \
+	third_party/angle/third_party/vulkan-tools/src/LICENSE.txt \
+	third_party/angle/third_party/vulkan-tools/src/winrt/VulkanRT-License.txt \
+	third_party/angle/third_party/vulkan-validation-layers/src/LICENSE.txt \
+	third_party/angle/util/windows/third_party/StackWalker/LICENSE \
+	third_party/apache-mac/LICENSE \
+	third_party/apache-portable-runtime/LICENSE \
+	third_party/apache-win32/LICENSE.txt \
+	third_party/apk-patch-size-estimator/LICENSE \
+	third_party/apple_apsl/LICENSE \
+	third_party/arcore-android-sdk-client/LICENSE \
+	third_party/arcore-android-sdk/LICENSE \
+	third_party/ashmem/LICENSE \
+	third_party/axe-core/LICENSE \
+	third_party/bazel/LICENSE \
+	third_party/binutils/LICENSE \
+	third_party/blanketjs/LICENSE \
+	third_party/blink/LICENSE_FOR_ABOUT_CREDITS \
+	third_party/blink/perf_tests/speedometer/resources/flightjs-example-app/components/es5-shim/LICENSE \
+	third_party/blink/perf_tests/speedometer/resources/flightjs-example-app/components/jasmine-flight/LICENSE.md \
+	third_party/blink/perf_tests/speedometer/resources/flightjs-example-app/LICENSE.md \
+	third_party/blink/perf_tests/speedometer/resources/todomvc/architecture-examples/jquery/node_modules/director/LICENSE \
+	third_party/blink/perf_tests/speedometer/resources/todomvc/architecture-examples/react/license.md \
+	third_party/blink/perf_tests/speedometer/resources/todomvc/architecture-examples/react/node_modules/classnames/LICENSE \
+	third_party/blink/perf_tests/speedometer/resources/todomvc/architecture-examples/react/node_modules/director/LICENSE \
+	third_party/blink/perf_tests/speedometer/resources/todomvc/architecture-examples/react/node_modules/react-dom/LICENSE \
+	third_party/blink/perf_tests/speedometer/resources/todomvc/architecture-examples/react/node_modules/react/LICENSE \
+	third_party/blink/perf_tests/speedometer/resources/todomvc/dependency-examples/flight/flight/node_modules/es5-shim/LICENSE \
+	third_party/blink/perf_tests/speedometer/resources/todomvc/dependency-examples/flight/flight/node_modules/flight/LICENSE \
+	third_party/blink/perf_tests/speedometer/resources/todomvc/dependency-examples/flight/flight/node_modules/requirejs-text/LICENSE \
+	third_party/blink/perf_tests/speedometer/resources/todomvc/labs/architecture-examples/react/bower_components/director/LICENSE \
+	third_party/blink/perf_tests/speedometer/resources/todomvc/license.md \
+	third_party/blink/perf_tests/svg/resources/LICENSES \
+	third_party/blink/renderer/core/LICENSE-APPLE \
+	third_party/blink/renderer/core/LICENSE-LGPL-2 \
+	third_party/blink/renderer/core/LICENSE-LGPL-2.1 \
+	third_party/blink/renderer/devtools/front_end/audits/lighthouse/LICENSE \
+	third_party/blink/renderer/devtools/front_end/audits_worker/lighthouse/LICENSE \
+	third_party/blink/renderer/devtools/front_end/cm/LICENSE \
+	third_party/blink/renderer/devtools/front_end/cm/LICENSE_python \
+	third_party/blink/renderer/devtools/front_end/cm_modes/LICENSE \
+	third_party/blink/renderer/devtools/front_end/formatter_worker/acorn/LICENSE \
+	third_party/blink/renderer/devtools/front_end/terminal/xterm.js/LICENSE \
+	third_party/blink/renderer/devtools/LICENSE \
+	third_party/blink/renderer/devtools/scripts/closure/COPYING \
+	third_party/blink/renderer/platform/testing/data/third_party/Noto/LICENSE_OFL.txt \
+	third_party/blink/renderer/platform/testing/data/third_party/Roboto/LICENSE.txt \
+	third_party/blink/renderer/platform/wtf/dtoa/COPYING \
+	third_party/blink/renderer/platform/wtf/dtoa/LICENSE \
+	third_party/boringssl/src/LICENSE \
+	third_party/boringssl/src/third_party/fiat/LICENSE \
+	third_party/boringssl/src/third_party/googletest/LICENSE \
+	third_party/boringssl/src/third_party/sike/LICENSE \
+	third_party/boringssl/src/third_party/wycheproof_testvectors/LICENSE \
+	third_party/bouncycastle/LICENSE \
+	third_party/breakpad/breakpad/LICENSE \
+	third_party/breakpad/breakpad/src/third_party/curl/COPYING \
+	third_party/breakpad/breakpad/src/third_party/libdisasm/LICENSE \
+	third_party/breakpad/LICENSE \
+	third_party/brotli/LICENSE \
+	third_party/bspatch/LICENSE \
+	third_party/byte_buddy/LICENSE \
+	third_party/cacheinvalidation/src/google/cacheinvalidation/COPYING \
+	third_party/cacheinvalidation/src/java/COPYING \
+	third_party/catapult/common/eslint/LICENSE \
+	third_party/catapult/common/py_vulcanize/third_party/rcssmin/bench/LICENSE.cssmin \
+	third_party/catapult/common/py_vulcanize/third_party/rcssmin/LICENSE \
+	third_party/catapult/common/py_vulcanize/third_party/rjsmin/LICENSE \
+	third_party/catapult/experimental/trace_on_tap/LICENSE \
+	third_party/catapult/experimental/trace_on_tap/third_party/pako/LICENSE \
+	third_party/catapult/LICENSE \
+	third_party/catapult/systrace/profile_chrome/third_party/COPYING \
+	third_party/catapult/systrace/systrace/LICENSE \
+	third_party/catapult/telemetry/third_party/altgraph/doc/license.rst \
+	third_party/catapult/telemetry/third_party/chromite/LICENSE \
+	third_party/catapult/telemetry/third_party/flot/LICENSE.txt \
+	third_party/catapult/telemetry/third_party/mock/LICENSE.txt \
+	third_party/catapult/telemetry/third_party/modulegraph/doc/license.rst \
+	third_party/catapult/telemetry/third_party/mox3/COPYING.txt \
+	third_party/catapult/telemetry/third_party/pyfakefs/pyfakefs/COPYING \
+	third_party/catapult/telemetry/third_party/tsproxy/LICENSE \
+	third_party/catapult/telemetry/third_party/WebKit/LICENSE \
+	third_party/catapult/telemetry/third_party/websocket-client/LICENSE \
+	third_party/catapult/third_party/apiclient/LICENSE \
+	third_party/catapult/third_party/beautifulsoup4/COPYING.txt \
+	third_party/catapult/third_party/cachetools/LICENSE \
+	third_party/catapult/third_party/certifi/LICENSE.txt \
+	third_party/catapult/third_party/chai/LICENSE \
+	third_party/catapult/third_party/chardet/LICENSE \
+	third_party/catapult/third_party/cloudstorage/COPYING \
+	third_party/catapult/third_party/coverage/LICENSE.txt \
+	third_party/catapult/third_party/d3/LICENSE \
+	third_party/catapult/third_party/flot/LICENSE.txt \
+	third_party/catapult/third_party/gae_ts_mon/LICENSE \
+	third_party/catapult/third_party/google-auth/LICENSE \
+	third_party/catapult/third_party/google-endpoints/enum/LICENSE \
+	third_party/catapult/third_party/gsutil/LICENSE \
+	third_party/catapult/third_party/gsutil/third_party/apitools/LICENSE \
+	third_party/catapult/third_party/gsutil/third_party/argcomplete/LICENSE.rst \
+	third_party/catapult/third_party/gsutil/third_party/boto/LICENSE \
+	third_party/catapult/third_party/gsutil/third_party/crcmod/LICENSE \
+	third_party/catapult/third_party/gsutil/third_party/crcmod_osx/LICENSE \
+	third_party/catapult/third_party/gsutil/third_party/fasteners/LICENSE \
+	third_party/catapult/third_party/gsutil/third_party/funcsigs/LICENSE \
+	third_party/catapult/third_party/gsutil/third_party/gcs-oauth2-boto-plugin/COPYING \
+	third_party/catapult/third_party/gsutil/third_party/httplib2/LICENSE \
+	third_party/catapult/third_party/gsutil/third_party/mock/LICENSE.txt \
+	third_party/catapult/third_party/gsutil/third_party/monotonic/LICENSE \
+	third_party/catapult/third_party/gsutil/third_party/oauth2client/LICENSE \
+	third_party/catapult/third_party/gsutil/third_party/pyasn1/docs/source/license.rst \
+	third_party/catapult/third_party/gsutil/third_party/pyasn1/LICENSE.rst \
+	third_party/catapult/third_party/gsutil/third_party/pyasn1-modules/LICENSE.txt \
+	third_party/catapult/third_party/gsutil/third_party/python-gflags/COPYING \
+	third_party/catapult/third_party/gsutil/third_party/retry-decorator/LICENSE.txt \
+	third_party/catapult/third_party/gsutil/third_party/rsa/LICENSE \
+	third_party/catapult/third_party/gsutil/third_party/six/LICENSE \
+	third_party/catapult/third_party/gsutil/third_party/socksipy-branch/LICENSE \
+	third_party/catapult/third_party/html5lib-python/doc/license.rst \
+	third_party/catapult/third_party/html5lib-python/LICENSE \
+	third_party/catapult/third_party/idb/LICENSE \
+	third_party/catapult/third_party/idna/LICENSE.rst \
+	third_party/catapult/third_party/ijson/LICENSE.txt \
+	third_party/catapult/third_party/mocha/LICENSE \
+	third_party/catapult/third_party/mox3/COPYING.txt \
+	third_party/catapult/third_party/oauth2client/LICENSE \
+	third_party/catapult/third_party/Paste/docs/license.txt \
+	third_party/catapult/third_party/polymer2/bower_components/accessibility-developer-tools/LICENSE \
+	third_party/catapult/third_party/polymer2/bower_components/async/LICENSE \
+	third_party/catapult/third_party/polymer2/bower_components/google-apis/LICENSE \
+	third_party/catapult/third_party/polymer2/bower_components/google-signin/LICENSE \
+	third_party/catapult/third_party/polymer2/bower_components/lodash/LICENSE \
+	third_party/catapult/third_party/polymer2/bower_components/marked/LICENSE.md \
+	third_party/catapult/third_party/polymer2/bower_components/mocha/LICENSE \
+	third_party/catapult/third_party/polymer2/bower_components/moment/LICENSE \
+	third_party/catapult/third_party/polymer2/bower_components/moment-timezone/LICENSE \
+	third_party/catapult/third_party/polymer2/bower_components/polymer/LICENSE.txt \
+	third_party/catapult/third_party/polymer2/bower_components/polymer-redux/LICENSE \
+	third_party/catapult/third_party/polymer2/bower_components/sinon-chai/LICENSE.txt \
+	third_party/catapult/third_party/polymer2/bower_components/stacky/LICENSE \
+	third_party/catapult/third_party/polymer2/bower_components/web-animations-js/COPYING \
+	third_party/catapult/third_party/polymer2/bower_components/webcomponentsjs/LICENSE.md \
+	third_party/catapult/third_party/polymer2/LICENSE.polymer \
+	third_party/catapult/third_party/polymer3/bower_components/polymer/LICENSE.txt \
+	third_party/catapult/third_party/polymer3/LICENSE.polymer \
+	third_party/catapult/third_party/polymer/components/google-apis/LICENSE \
+	third_party/catapult/third_party/polymer/components/google-signin/LICENSE \
+	third_party/catapult/third_party/polymer/components/polymer/LICENSE.txt \
+	third_party/catapult/third_party/polymer/components/promise-polyfill/LICENSE \
+	third_party/catapult/third_party/polymer/components/shadycss/LICENSE.md \
+	third_party/catapult/third_party/polymer/components/web-animations-js/COPYING \
+	third_party/catapult/third_party/polymer/LICENSE.polymer \
+	third_party/catapult/third_party/pyasn1/LICENSE.txt \
+	third_party/catapult/third_party/pyasn1_modules/LICENSE.txt \
+	third_party/catapult/third_party/pyfakefs/COPYING \
+	third_party/catapult/third_party/pyserial/LICENSE.txt \
+	third_party/catapult/third_party/python_gflags/COPYING \
+	third_party/catapult/third_party/redux/LICENSE.md \
+	third_party/catapult/third_party/requests/LICENSE \
+	third_party/catapult/third_party/requests_toolbelt/LICENSE \
+	third_party/catapult/third_party/rsa/LICENSE.txt \
+	third_party/catapult/third_party/six/LICENSE \
+	third_party/catapult/third_party/snap-it/LICENSE \
+	third_party/catapult/third_party/tsmon_client/LICENSE \
+	third_party/catapult/third_party/typ/LICENSE \
+	third_party/catapult/third_party/urllib3/LICENSE.txt \
+	third_party/catapult/third_party/vinn/third_party/parse5/LICENSE \
+	third_party/catapult/third_party/vinn/third_party/v8/LICENSE \
+	third_party/catapult/third_party/vinn/third_party/v8/LICENSE.strongtalk \
+	third_party/catapult/third_party/vinn/third_party/v8/LICENSE.v8 \
+	third_party/catapult/third_party/vinn/third_party/v8/LICENSE.valgrind \
+	third_party/catapult/third_party/webapp2/LICENSE \
+	third_party/catapult/third_party/WebOb/docs/license.txt \
+	third_party/catapult/third_party/zipfile/LICENSE \
+	third_party/catapult/tracing/LICENSE \
+	third_party/catapult/tracing/third_party/chai/LICENSE \
+	third_party/catapult/tracing/third_party/d3/LICENSE \
+	third_party/catapult/tracing/third_party/devscripts/COPYING \
+	third_party/catapult/tracing/third_party/gl-matrix/LICENSE.md \
+	third_party/catapult/tracing/third_party/jpeg-js/LICENSE \
+	third_party/catapult/tracing/third_party/jszip/LICENSE.markdown \
+	third_party/catapult/tracing/third_party/mocha/LICENSE \
+	third_party/catapult/tracing/third_party/pako/LICENSE \
+	third_party/ced/LICENSE \
+	third_party/ced/src/LICENSE \
+	third_party/chaijs/LICENSE \
+	third_party/checkstyle/LICENSE \
+	third_party/checkstyle/LICENSE.apache20 \
+	third_party/chromevox/LICENSE \
+	third_party/chromevox/third_party/closure-library/LICENSE \
+	third_party/chromevox/third_party/sre/LICENSE \
+	third_party/chromite/LICENSE \
+	third_party/chromite/licensing/extra_package_licenses/libarchive-3.1.2.LICENSE \
+	third_party/chromite/scripts/sysmon/LICENSE \
+	third_party/chromite/third_party/boto/LICENSE \
+	third_party/chromite/third_party/httplib2/LICENSE \
+	third_party/chromite/third_party/oauth2client/LICENSE \
+	third_party/chromite/third_party/six/LICENSE \
+	third_party/cld_3/LICENSE \
+	third_party/cld_3/src/LICENSE \
+	third_party/closure_compiler/compiler/COPYING \
+	third_party/closure_compiler/LICENSE \
+	third_party/colorama/LICENSE \
+	third_party/colorama/src/LICENSE.txt \
+	third_party/crashpad/crashpad/LICENSE \
+	third_party/crashpad/crashpad/third_party/apple_cf/APPLE_LICENSE \
+	third_party/crashpad/crashpad/third_party/cpp-httplib/cpp-httplib/LICENSE \
+	third_party/crashpad/crashpad/third_party/getopt/LICENSE \
+	third_party/crashpad/crashpad/third_party/glibc/COPYING.LIB \
+	third_party/crashpad/crashpad/third_party/xnu/APPLE_LICENSE \
+	third_party/crc32c/src/LICENSE \
+	third_party/cros_system_api/LICENSE \
+	third_party/custom_tabs_client/LICENSE \
+	third_party/d3/src/LICENSE \
+	third_party/dav1d/libdav1d/COPYING \
+	third_party/dav1d/LICENSE \
+	third_party/dawn/LICENSE \
+	third_party/decklink/LICENSE \
+	third_party/depot_tools/LICENSE \
+	third_party/depot_tools/third_party/colorama/LICENSE.txt \
+	third_party/depot_tools/third_party/httplib2/LICENSE \
+	third_party/depot_tools/third_party/logilab/astroid/LICENSE.txt \
+	third_party/depot_tools/third_party/logilab/lazy_object_proxy/LICENSE \
+	third_party/depot_tools/third_party/logilab/wrapt/LICENSE \
+	third_party/depot_tools/third_party/mock/LICENSE.txt \
+	third_party/depot_tools/third_party/oauth2client/LICENSE \
+	third_party/depot_tools/third_party/pylint/LICENSE.txt \
+	third_party/depot_tools/third_party/repo/COPYING \
+	third_party/depot_tools/third_party/retry_decorator/LICENSE.google \
+	third_party/depot_tools/third_party/schema/LICENSE-MIT \
+	third_party/devscripts/COPYING \
+	third_party/devtools-node-modules/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/acorn-jsx/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/acorn/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/ajv/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/ansi-escapes/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/ansi-regex/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/ansi-styles/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/argparse/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/astral-regex/license \
+	third_party/devtools-node-modules/third_party/node_modules/@babel/code-frame/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/@babel/highlight/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/balanced-match/LICENSE.md \
+	third_party/devtools-node-modules/third_party/node_modules/brace-expansion/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/callsites/license \
+	third_party/devtools-node-modules/third_party/node_modules/chalk/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/chardet/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/cli-cursor/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/cli-width/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/color-convert/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/color-name/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/concat-map/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/cross-spawn/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/debug/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/deep-is/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/doctrine/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/doctrine/LICENSE.closure-compiler \
+	third_party/devtools-node-modules/third_party/node_modules/doctrine/LICENSE.esprima \
+	third_party/devtools-node-modules/third_party/node_modules/emoji-regex/LICENSE-MIT.txt \
+	third_party/devtools-node-modules/third_party/node_modules/escape-string-regexp/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/eslint/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/eslint-scope/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/eslint-utils/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/eslint-visitor-keys/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/espree/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/esprima/LICENSE.BSD \
+	third_party/devtools-node-modules/third_party/node_modules/esquery/license.txt \
+	third_party/devtools-node-modules/third_party/node_modules/estraverse/LICENSE.BSD \
+	third_party/devtools-node-modules/third_party/node_modules/esutils/LICENSE.BSD \
+	third_party/devtools-node-modules/third_party/node_modules/external-editor/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/fast-deep-equal/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/fast-json-stable-stringify/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/fast-levenshtein/LICENSE.md \
+	third_party/devtools-node-modules/third_party/node_modules/figures/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/file-entry-cache/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/flat-cache/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/flatted/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/fs.realpath/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/functional-red-black-tree/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/globals/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/glob/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/glob-parent/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/glob-parent/node_modules/is-glob/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/has-flag/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/iconv-lite/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/ignore/LICENSE-MIT \
+	third_party/devtools-node-modules/third_party/node_modules/import-fresh/license \
+	third_party/devtools-node-modules/third_party/node_modules/inflight/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/inherits/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/inquirer/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/inquirer/node_modules/ansi-regex/license \
+	third_party/devtools-node-modules/third_party/node_modules/inquirer/node_modules/strip-ansi/license \
+	third_party/devtools-node-modules/third_party/node_modules/isexe/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/is-extglob/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/is-fullwidth-code-point/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/is-glob/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/is-promise/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/json-schema-traverse/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/json-stable-stringify-without-jsonify/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/js-tokens/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/js-yaml/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/levn/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/lodash/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/mimic-fn/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/minimatch/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/minimist/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/mkdirp/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/ms/license.md \
+	third_party/devtools-node-modules/third_party/node_modules/mute-stream/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/nice-try/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/once/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/onetime/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/optionator/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/os-tmpdir/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/parent-module/license \
+	third_party/devtools-node-modules/third_party/node_modules/path-dirname/license \
+	third_party/devtools-node-modules/third_party/node_modules/path-is-absolute/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/path-key/license \
+	third_party/devtools-node-modules/third_party/node_modules/prelude-ls/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/progress/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/punycode/LICENSE-MIT.txt \
+	third_party/devtools-node-modules/third_party/node_modules/regexpp/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/resolve-from/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/restore-cursor/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/rimraf/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/run-async/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/rxjs/_esm2015/LICENSE.txt \
+	third_party/devtools-node-modules/third_party/node_modules/rxjs/_esm5/LICENSE.txt \
+	third_party/devtools-node-modules/third_party/node_modules/rxjs/LICENSE.txt \
+	third_party/devtools-node-modules/third_party/node_modules/rxjs/src/LICENSE.txt \
+	third_party/devtools-node-modules/third_party/node_modules/safer-buffer/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/semver/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/shebang-command/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/shebang-regex/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/signal-exit/LICENSE.txt \
+	third_party/devtools-node-modules/third_party/node_modules/slice-ansi/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/sprintf-js/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/string-width/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/strip-ansi/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/strip-json-comments/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/supports-color/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/table/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/table/node_modules/ansi-regex/license \
+	third_party/devtools-node-modules/third_party/node_modules/table/node_modules/string-width/license \
+	third_party/devtools-node-modules/third_party/node_modules/table/node_modules/strip-ansi/license \
+	third_party/devtools-node-modules/third_party/node_modules/text-table/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/through/LICENSE.APACHE2 \
+	third_party/devtools-node-modules/third_party/node_modules/through/LICENSE.MIT \
+	third_party/devtools-node-modules/third_party/node_modules/tmp/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/tslib/LICENSE.txt \
+	third_party/devtools-node-modules/third_party/node_modules/type-check/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/which/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/wordwrap/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/wrappy/LICENSE \
+	third_party/devtools-node-modules/third_party/node_modules/write/LICENSE \
+	third_party/dom_distiller_js/LICENSE \
+	third_party/emoji-segmenter/LICENSE \
+	third_party/emoji-segmenter/src/LICENSE \
+	third_party/errorprone/LICENSE \
+	third_party/espresso/LICENSE \
+	third_party/expat/files/COPYING \
+	third_party/feed/LICENSE \
+	third_party/ffmpeg/chromium/scripts/license_texts/full_lgpl.txt \
+	third_party/ffmpeg/COPYING.GPLv2 \
+	third_party/ffmpeg/COPYING.GPLv3 \
+	third_party/ffmpeg/COPYING.LGPLv2.1 \
+	third_party/ffmpeg/COPYING.LGPLv3 \
+	third_party/ffmpeg/LICENSE.md \
+	third_party/flac/COPYING.FDL \
+	third_party/flac/COPYING.GPL \
+	third_party/flac/COPYING.LGPL \
+	third_party/flac/COPYING.Xiph \
+	third_party/flatbuffers/LICENSE \
+	third_party/flatbuffers/src/dart/LICENSE \
+	third_party/flatbuffers/src/LICENSE.txt \
+	third_party/flot/LICENSE.txt \
+	third_party/fontconfig/LICENSE \
+	third_party/fontconfig/src/COPYING \
+	third_party/freetype/src/docs/GPLv2.TXT \
+	third_party/freetype/src/docs/LICENSE.TXT \
+	third_party/fuchsia-sdk/LICENSE \
+	third_party/gestures/gestures/LICENSE \
+	third_party/gestures/LICENSE \
+	third_party/gif_player/LICENSE \
+	third_party/glfw/src/LICENSE.md \
+	third_party/glslang/LICENSE \
+	third_party/glslang/src/LICENSE.txt \
+	third_party/google_android_play_core/LICENSE \
+	third_party/google_input_tools/LICENSE \
+	third_party/google_input_tools/third_party/closure_library/LICENSE \
+	third_party/googletest/src/googlemock/LICENSE \
+	third_party/googletest/src/googlemock/scripts/generator/LICENSE \
+	third_party/googletest/src/googletest/LICENSE \
+	third_party/googletest/src/LICENSE \
+	third_party/google_toolbox_for_mac/LICENSE \
+	third_party/google_trust_services/src/LICENSE \
+	third_party/google-truth/LICENSE \
+	third_party/grpc/LICENSE \
+	third_party/grpc/src/LICENSE \
+	third_party/grpc/src/src/php/ext/grpc/LICENSE \
+	third_party/grpc/src/third_party/address_sorting/LICENSE \
+	third_party/grpc/src/third_party/nanopb/LICENSE.txt \
+	third_party/grpc/src/third_party/rake-compiler-dock/LICENSE.txt \
+	third_party/gson/LICENSE \
+	third_party/guava/LICENSE \
+	third_party/gvr-android-keyboard/LICENSE \
+	third_party/gvr-android-sdk/LICENSE \
+	third_party/hamcrest/LICENSE \
+	third_party/harfbuzz-ng/src/COPYING \
+	third_party/harfbuzz-ng/src/test/shaping/data/aots/COPYING \
+	third_party/harfbuzz-ng/src/test/shaping/data/in-house/COPYING \
+	third_party/harfbuzz-ng/src/test/shaping/data/text-rendering-tests/COPYING \
+	third_party/harfbuzz-ng/src/test/shaping/texts/in-house/shaper-arabic/script-arabic/language-urdu/crulp/ligatures/LICENSE \
+	third_party/harfbuzz-ng/src/test/shaping/texts/in-house/shaper-indic/script-assamese/utrrs/LICENSE \
+	third_party/harfbuzz-ng/src/test/shaping/texts/in-house/shaper-indic/script-bengali/utrrs/LICENSE \
+	third_party/harfbuzz-ng/src/test/shaping/texts/in-house/shaper-indic/script-devanagari/utrrs/LICENSE \
+	third_party/harfbuzz-ng/src/test/shaping/texts/in-house/shaper-indic/script-gujarati/utrrs/LICENSE \
+	third_party/harfbuzz-ng/src/test/shaping/texts/in-house/shaper-indic/script-gurmukhi/utrrs/LICENSE \
+	third_party/harfbuzz-ng/src/test/shaping/texts/in-house/shaper-indic/script-kannada/utrrs/LICENSE \
+	third_party/harfbuzz-ng/src/test/shaping/texts/in-house/shaper-indic/script-malayalam/utrrs/LICENSE \
+	third_party/harfbuzz-ng/src/test/shaping/texts/in-house/shaper-indic/script-oriya/utrrs/LICENSE \
+	third_party/harfbuzz-ng/src/test/shaping/texts/in-house/shaper-indic/script-sinhala/utrrs/LICENSE \
+	third_party/harfbuzz-ng/src/test/shaping/texts/in-house/shaper-indic/script-tamil/utrrs/LICENSE \
+	third_party/harfbuzz-ng/src/test/shaping/texts/in-house/shaper-indic/script-telugu/utrrs/LICENSE \
+	third_party/hunspell/COPYING \
+	third_party/hunspell/COPYING.LESSER \
+	third_party/hunspell/COPYING.MPL \
+	third_party/iaccessible2/LICENSE \
+	third_party/iccjpeg/LICENSE \
+	third_party/icu4j/LICENSE \
+	third_party/icu/LICENSE \
+	third_party/icu/scripts/LICENSE \
+	third_party/ijar/LICENSE \
+	third_party/ink/LICENSE \
+	third_party/inspector_protocol/LICENSE \
+	third_party/intellij/LICENSE \
+	third_party/isimpledom/LICENSE \
+	third_party/jacoco/LICENSE \
+	third_party/javalang/LICENSE \
+	third_party/jinja2/LICENSE \
+	third_party/jsoncpp/LICENSE \
+	third_party/jsoncpp/source/LICENSE \
+	third_party/jstemplate/COPYING \
+	third_party/junit/LICENSE \
+	third_party/khronos/LICENSE \
+	third_party/lcov/COPYING \
+	third_party/leveldatabase/src/LICENSE \
+	third_party/libaddressinput/LICENSE \
+	third_party/libaddressinput/src/cpp/LICENSE.chromium \
+	third_party/libaddressinput/src/LICENSE \
+	third_party/libaom/source/libaom/LICENSE \
+	third_party/libaom/source/libaom/third_party/fastfeat/LICENSE \
+	third_party/libaom/source/libaom/third_party/googletest/src/googletest/LICENSE \
+	third_party/libaom/source/libaom/third_party/libwebm/LICENSE.TXT \
+	third_party/libaom/source/libaom/third_party/vector/LICENSE \
+	third_party/libaom/source/libaom/third_party/x86inc/LICENSE \
+	third_party/libcxx-pretty-printers/LICENSE \
+	third_party/libevdev/LICENSE \
+	third_party/libFuzzer/LICENSE.TXT \
+	third_party/libjingle_xmpp/LICENSE \
+	third_party/libjpeg/LICENSE \
+	third_party/libjpeg_turbo/LICENSE.md \
+	third_party/liblouis/LICENSE \
+	third_party/liblouis/src/COPYING \
+	third_party/liblouis/src/COPYING.LESSER \
+	third_party/liblouis/src/License.md \
+	third_party/libovr/LICENSE \
+	third_party/libphonenumber/dist/cpp/LICENSE \
+	third_party/libphonenumber/dist/LICENSE \
+	third_party/libphonenumber/dist/LICENSE.Chromium \
+	third_party/libphonenumber/LICENSE \
+	third_party/libpng/LICENSE \
+	third_party/libprotobuf-mutator/src/LICENSE \
+	third_party/libsecret/LICENSE \
+	third_party/libsrtp/LICENSE \
+	third_party/libsync/LICENSE \
+	third_party/libudev/LICENSE \
+	third_party/libusb/src/COPYING \
+	third_party/libvpx/source/libvpx/LICENSE \
+	third_party/libvpx/source/libvpx/third_party/googletest/src/LICENSE \
+	third_party/libvpx/source/libvpx/third_party/libwebm/LICENSE.TXT \
+	third_party/libvpx/source/libvpx/third_party/libyuv/LICENSE \
+	third_party/libvpx/source/libvpx/third_party/x86inc/LICENSE \
+	third_party/libwebm/source/LICENSE.TXT \
+	third_party/libwebp/LICENSE \
+	third_party/libxml/src/COPYING \
+	third_party/libXNVCtrl/LICENSE \
+	third_party/libyuv/LICENSE \
+	third_party/llvm/clang/LICENSE.TXT \
+	third_party/llvm/clang/test/SemaObjC/warn-assign-property-nscopying.m \
+	third_party/llvm/clang/tools/clang-format-vs/ClangFormat/license.txt \
+	third_party/llvm/clang-tools-extra/clangd/clients/clangd-vscode/LICENSE \
+	third_party/llvm/clang-tools-extra/clang-tidy/cert/LICENSE.TXT \
+	third_party/llvm/clang-tools-extra/clang-tidy/hicpp/LICENSE.TXT \
+	third_party/llvm/clang-tools-extra/clang-tidy-vs/ClangTidy/license.txt \
+	third_party/llvm/clang-tools-extra/LICENSE.TXT \
+	third_party/llvm/compiler-rt/LICENSE.TXT \
+	third_party/llvm/libclc/LICENSE.TXT \
+	third_party/llvm/libcxxabi/LICENSE.TXT \
+	third_party/llvm/libcxx/LICENSE.TXT \
+	third_party/llvm/libcxx/utils/google-benchmark/LICENSE \
+	third_party/llvm/libunwind/LICENSE.TXT \
+	third_party/llvm/lldb/LICENSE.TXT \
+	third_party/llvm/lldb/third_party/Python/module/pexpect-4.6/LICENSE \
+	third_party/llvm/lldb/third_party/Python/module/ptyprocess-0.6.0/LICENSE \
+	third_party/llvm/lldb/third_party/Python/module/six/LICENSE \
+	third_party/llvm/lld/LICENSE.TXT \
+	third_party/llvm/llgo/LICENSE.TXT \
+	third_party/llvm/llgo/third_party/gofrontend/libffi/LICENSE \
+	third_party/llvm/llgo/third_party/gofrontend/libgo/LICENSE \
+	third_party/llvm/llgo/third_party/gofrontend/LICENSE \
+	third_party/llvm/llgo/third_party/gotools/LICENSE \
+	third_party/llvm/llgo/third_party/liner/COPYING \
+	third_party/llvm/llvm/include/llvm/Support/LICENSE.TXT \
+	third_party/llvm/llvm/LICENSE.TXT \
+	third_party/llvm/llvm/test/YAMLParser/LICENSE.txt \
+	third_party/llvm/llvm/tools/msbuild/license.txt \
+	third_party/llvm/llvm/utils/benchmark/LICENSE \
+	third_party/llvm/llvm/utils/unittest/googlemock/LICENSE.txt \
+	third_party/llvm/llvm/utils/unittest/googletest/LICENSE.TXT \
+	third_party/llvm/openmp/LICENSE.txt \
+	third_party/llvm/parallel-libs/acxxel/LICENSE.TXT \
+	third_party/llvm/polly/lib/External/isl/LICENSE \
+	third_party/llvm/polly/LICENSE.txt \
+	third_party/llvm/polly/tools/GPURuntime/LICENSE.TXT \
+	third_party/llvm/pstl/LICENSE.txt \
+	third_party/logilab/logilab/astroid/LICENSE.txt \
+	third_party/logilab/logilab/common/LICENSE.txt \
+	third_party/lottie/LICENSE \
+	third_party/lzma_sdk/LICENSE \
+	third_party/markdown/LICENSE \
+	third_party/markupsafe/LICENSE \
+	third_party/material_design_icons/LICENSE \
+	third_party/mesa_headers/LICENSE \
+	third_party/metrics_proto/LICENSE \
+	third_party/microsoft_webauthn/LICENSE \
+	third_party/minigbm/LICENSE \
+	third_party/minigbm/src/LICENSE \
+	third_party/minizip/src/lib/bzip2/LICENSE \
+	third_party/minizip/src/LICENSE \
+	third_party/mocha/LICENSE \
+	third_party/mockito/LICENSE \
+	third_party/modp_b64/LICENSE \
+	third_party/motemplate/LICENSE \
+	third_party/mozilla/LICENSE \
+	third_party/nasm/LICENSE \
+	third_party/netty4/LICENSE \
+	third_party/netty-tcnative/LICENSE \
+	third_party/node/LICENSE \
+	third_party/node/node_modules/acorn-jsx/LICENSE \
+	third_party/node/node_modules/acorn-jsx/node_modules/acorn/LICENSE \
+	third_party/node/node_modules/acorn/LICENSE \
+	third_party/node/node_modules/ajv-keywords/LICENSE \
+	third_party/node/node_modules/ajv/LICENSE \
+	third_party/node/node_modules/ansi-escape-sequences/LICENSE \
+	third_party/node/node_modules/ansi-escapes/license \
+	third_party/node/node_modules/ansi-regex/license \
+	third_party/node/node_modules/ansi-styles/license \
+	third_party/node/node_modules/argparse/LICENSE \
+	third_party/node/node_modules/array-back/LICENSE \
+	third_party/node/node_modules/brace-expansion/LICENSE \
+	third_party/node/node_modules/buffer-from/LICENSE \
+	third_party/node/node_modules/chalk/license \
+	third_party/node/node_modules/circular-json/LICENSE.txt \
+	third_party/node/node_modules/circular-json/template/license.after \
+	third_party/node/node_modules/circular-json/template/license.before \
+	third_party/node/node_modules/cli-cursor/license \
+	third_party/node/node_modules/cli-width/LICENSE \
+	third_party/node/node_modules/clone/LICENSE \
+	third_party/node/node_modules/coa/LICENSE \
+	third_party/node/node_modules/coa/node_modules/ansi-styles/license \
+	third_party/node/node_modules/coa/node_modules/chalk/license \
+	third_party/node/node_modules/coa/node_modules/supports-color/license \
+	third_party/node/node_modules/code-point-at/license \
+	third_party/node/node_modules/co/LICENSE \
+	third_party/node/node_modules/color-convert/LICENSE \
+	third_party/node/node_modules/color-name/LICENSE \
+	third_party/node/node_modules/commander/LICENSE \
+	third_party/node/node_modules/command-line-args/LICENSE \
+	third_party/node/node_modules/command-line-usage/LICENSE \
+	third_party/node/node_modules/concat-map/LICENSE \
+	third_party/node/node_modules/concat-stream/LICENSE \
+	third_party/node/node_modules/core-js/LICENSE \
+	third_party/node/node_modules/core-util-is/LICENSE \
+	third_party/node/node_modules/crisper/LICENSE \
+	third_party/node/node_modules/csso/LICENSE \
+	third_party/node/node_modules/csso/node_modules/css-tree/LICENSE \
+	third_party/node/node_modules/css-select-base-adapter/LICENSE \
+	third_party/node/node_modules/css-select/LICENSE \
+	third_party/node/node_modules/css-tree/LICENSE \
+	third_party/node/node_modules/css-url-regex/license \
+	third_party/node/node_modules/css-what/LICENSE \
+	third_party/node/node_modules/debug/LICENSE \
+	third_party/node/node_modules/deep-extend/LICENSE \
+	third_party/node/node_modules/deep-is/LICENSE \
+	third_party/node/node_modules/define-properties/LICENSE \
+	third_party/node/node_modules/d/LICENSE \
+	third_party/node/node_modules/doctrine/LICENSE \
+	third_party/node/node_modules/doctrine/LICENSE.closure-compiler \
+	third_party/node/node_modules/doctrine/LICENSE.esprima \
+	third_party/node/node_modules/dom5/LICENSE \
+	third_party/node/node_modules/domelementtype/LICENSE \
+	third_party/node/node_modules/dom-serializer/LICENSE \
+	third_party/node/node_modules/domutils/LICENSE \
+	third_party/node/node_modules/entities/LICENSE \
+	third_party/node/node_modules/es5-ext/LICENSE \
+	third_party/node/node_modules/es6-iterator/LICENSE \
+	third_party/node/node_modules/es6-map/LICENSE \
+	third_party/node/node_modules/es6-set/LICENSE \
+	third_party/node/node_modules/es6-symbol/LICENSE \
+	third_party/node/node_modules/es6-weak-map/LICENSE \
+	third_party/node/node_modules/es-abstract/LICENSE \
+	third_party/node/node_modules/escape-string-regexp/license \
+	third_party/node/node_modules/escodegen/LICENSE.BSD \
+	third_party/node/node_modules/escodegen/node_modules/esprima/LICENSE.BSD \
+	third_party/node/node_modules/escodegen/node_modules/source-map/LICENSE \
+	third_party/node/node_modules/escope/LICENSE.BSD \
+	third_party/node/node_modules/eslint/LICENSE \
+	third_party/node/node_modules/espree/LICENSE \
+	third_party/node/node_modules/esprima/LICENSE.BSD \
+	third_party/node/node_modules/esquery/license.txt \
+	third_party/node/node_modules/es-to-primitive/LICENSE \
+	third_party/node/node_modules/estraverse/LICENSE.BSD \
+	third_party/node/node_modules/esutils/LICENSE.BSD \
+	third_party/node/node_modules/event-emitter/LICENSE \
+	third_party/node/node_modules/feature-detect-es6/LICENSE \
+	third_party/node/node_modules/figures/license \
+	third_party/node/node_modules/file-entry-cache/LICENSE \
+	third_party/node/node_modules/find-replace/LICENSE \
+	third_party/node/node_modules/flat-cache/LICENSE \
+	third_party/node/node_modules/fs.realpath/LICENSE \
+	third_party/node/node_modules/function-bind/LICENSE \
+	third_party/node/node_modules/generate-function/LICENSE \
+	third_party/node/node_modules/generate-object-property/LICENSE \
+	third_party/node/node_modules/globals/license \
+	third_party/node/node_modules/glob/LICENSE \
+	third_party/node/node_modules/graceful-fs/LICENSE \
+	third_party/node/node_modules/has-ansi/license \
+	third_party/node/node_modules/has-flag/license \
+	third_party/node/node_modules/has/LICENSE-MIT \
+	third_party/node/node_modules/has-symbols/LICENSE \
+	third_party/node/node_modules/inflight/LICENSE \
+	third_party/node/node_modules/inherits/LICENSE \
+	third_party/node/node_modules/interpret/LICENSE \
+	third_party/node/node_modules/is-callable/LICENSE \
+	third_party/node/node_modules/is-date-object/LICENSE \
+	third_party/node/node_modules/is-fullwidth-code-point/license \
+	third_party/node/node_modules/is-my-json-valid/LICENSE \
+	third_party/node/node_modules/is-property/LICENSE \
+	third_party/node/node_modules/is-regex/LICENSE \
+	third_party/node/node_modules/is-resolvable/LICENSE \
+	third_party/node/node_modules/is-symbol/LICENSE \
+	third_party/node/node_modules/jsonschema/LICENSE \
+	third_party/node/node_modules/json-stable-stringify/LICENSE \
+	third_party/node/node_modules/js-tokens/LICENSE \
+	third_party/node/node_modules/js-yaml/LICENSE \
+	third_party/node/node_modules/levn/LICENSE \
+	third_party/node/node_modules/lodash.camelcase/LICENSE \
+	third_party/node/node_modules/lodash/LICENSE \
+	third_party/node/node_modules/lodash.padend/LICENSE \
+	third_party/node/node_modules/mdn-data/LICENSE \
+	third_party/node/node_modules/minimatch/LICENSE \
+	third_party/node/node_modules/minimist/LICENSE \
+	third_party/node/node_modules/mkdirp/LICENSE \
+	third_party/node/node_modules/mute-stream/LICENSE \
+	third_party/node/node_modules/next-tick/LICENSE \
+	third_party/node/node_modules/nth-check/LICENSE \
+	third_party/node/node_modules/number-is-nan/license \
+	third_party/node/node_modules/object-assign/license \
+	third_party/node/node_modules/object.getownpropertydescriptors/LICENSE \
+	third_party/node/node_modules/object-keys/LICENSE \
+	third_party/node/node_modules/object.values/LICENSE \
+	third_party/node/node_modules/once/LICENSE \
+	third_party/node/node_modules/onetime/license \
+	third_party/node/node_modules/optionator/LICENSE \
+	third_party/node/node_modules/os-homedir/license \
+	third_party/node/node_modules/parse5/LICENSE \
+	third_party/node/node_modules/path-is-absolute/license \
+	third_party/node/node_modules/path-is-inside/LICENSE.txt \
+	third_party/node/node_modules/path-parse/LICENSE \
+	third_party/node/node_modules/pluralize/LICENSE \
+	third_party/node/node_modules/polymer-analyzer/LICENSE \
+	third_party/node/node_modules/polymer-analyzer/node_modules/clone/LICENSE \
+	third_party/node/node_modules/polymer-analyzer/node_modules/dom5/LICENSE \
+	third_party/node/node_modules/polymer-analyzer/node_modules/parse5/LICENSE \
+	third_party/node/node_modules/polymer-bundler/LICENSE \
+	third_party/node/node_modules/polymer-bundler/node_modules/clone/LICENSE \
+	third_party/node/node_modules/polymer-bundler/node_modules/dom5/LICENSE \
+	third_party/node/node_modules/polymer-bundler/node_modules/parse5/LICENSE \
+	third_party/node/node_modules/polymer-css-build/LICENSE \
+	third_party/node/node_modules/polymer-css-build/node_modules/ansi-styles/license \
+	third_party/node/node_modules/polymer-css-build/node_modules/array-back/LICENSE \
+	third_party/node/node_modules/polymer-css-build/node_modules/chalk/license \
+	third_party/node/node_modules/polymer-css-build/node_modules/clone/LICENSE \
+	third_party/node/node_modules/polymer-css-build/node_modules/command-line-args/LICENSE \
+	third_party/node/node_modules/polymer-css-build/node_modules/command-line-usage/LICENSE \
+	third_party/node/node_modules/polymer-css-build/node_modules/command-line-usage/node_modules/array-back/LICENSE \
+	third_party/node/node_modules/polymer-css-build/node_modules/command-line-usage/node_modules/typical/LICENSE \
+	third_party/node/node_modules/polymer-css-build/node_modules/deep-extend/LICENSE \
+	third_party/node/node_modules/polymer-css-build/node_modules/dom5/LICENSE \
+	third_party/node/node_modules/polymer-css-build/node_modules/find-replace/LICENSE \
+	third_party/node/node_modules/polymer-css-build/node_modules/parse5/LICENSE \
+	third_party/node/node_modules/polymer-css-build/node_modules/supports-color/license \
+	third_party/node/node_modules/polymer-css-build/node_modules/table-layout/LICENSE \
+	third_party/node/node_modules/polymer-css-build/node_modules/table-layout/node_modules/array-back/LICENSE \
+	third_party/node/node_modules/polymer-css-build/node_modules/table-layout/node_modules/typical/LICENSE \
+	third_party/node/node_modules/polymer-css-build/node_modules/typical/LICENSE \
+	third_party/node/node_modules/polymer-css-build/node_modules/wordwrapjs/LICENSE \
+	third_party/node/node_modules/polymer-css-build/node_modules/wordwrapjs/node_modules/typical/LICENSE \
+	third_party/node/node_modules/prelude-ls/LICENSE \
+	third_party/node/node_modules/progress/LICENSE \
+	third_party/node/node_modules/q/LICENSE \
+	third_party/node/node_modules/readable-stream/LICENSE \
+	third_party/node/node_modules/rechoir/LICENSE \
+	third_party/node/node_modules/reduce-flatten/LICENSE \
+	third_party/node/node_modules/require-uncached/license \
+	third_party/node/node_modules/resolve-from/license \
+	third_party/node/node_modules/resolve/LICENSE \
+	third_party/node/node_modules/restore-cursor/license \
+	third_party/node/node_modules/rimraf/LICENSE \
+	third_party/node/node_modules/run-async/LICENSE \
+	third_party/node/node_modules/safe-buffer/LICENSE \
+	third_party/node/node_modules/sax/LICENSE \
+	third_party/node/node_modules/shady-css-parser/LICENSE.txt \
+	third_party/node/node_modules/shelljs/LICENSE \
+	third_party/node/node_modules/slice-ansi/license \
+	third_party/node/node_modules/source-map/LICENSE \
+	third_party/node/node_modules/sprintf-js/LICENSE \
+	third_party/node/node_modules/string_decoder/LICENSE \
+	third_party/node/node_modules/string-width/license \
+	third_party/node/node_modules/strip-ansi/license \
+	third_party/node/node_modules/strip-bom/license \
+	third_party/node/node_modules/strip-indent/license \
+	third_party/node/node_modules/strip-json-comments/license \
+	third_party/node/node_modules/supports-color/license \
+	third_party/node/node_modules/svgo/LICENSE \
+	third_party/node/node_modules/svgo/node_modules/ansi-styles/license \
+	third_party/node/node_modules/svgo/node_modules/chalk/license \
+	third_party/node/node_modules/svgo/node_modules/supports-color/license \
+	third_party/node/node_modules/table-layout/LICENSE \
+	third_party/node/node_modules/table/LICENSE \
+	third_party/node/node_modules/table/node_modules/ansi-regex/license \
+	third_party/node/node_modules/table/node_modules/is-fullwidth-code-point/license \
+	third_party/node/node_modules/table/node_modules/string-width/license \
+	third_party/node/node_modules/table/node_modules/strip-ansi/license \
+	third_party/node/node_modules/test-value/LICENSE \
+	third_party/node/node_modules/text-table/LICENSE \
+	third_party/node/node_modules/through/LICENSE.APACHE2 \
+	third_party/node/node_modules/through/LICENSE.MIT \
+	third_party/node/node_modules/type-check/LICENSE \
+	third_party/node/node_modules/typedarray/LICENSE \
+	third_party/node/node_modules/typical/LICENSE \
+	third_party/node/node_modules/uglify-es/LICENSE \
+	third_party/node/node_modules/uglify-es/node_modules/source-map/LICENSE \
+	third_party/node/node_modules/unquote/LICENSE \
+	third_party/node/node_modules/user-home/license \
+	third_party/node/node_modules/util-deprecate/LICENSE \
+	third_party/node/node_modules/util.promisify/LICENSE \
+	third_party/node/node_modules/wordwrapjs/LICENSE \
+	third_party/node/node_modules/wordwrap/LICENSE \
+	third_party/node/node_modules/wrappy/LICENSE \
+	third_party/node/node_modules/write/LICENSE \
+	third_party/nvml/LICENSE \
+	third_party/objenesis/LICENSE \
+	third_party/ocmock/License.txt \
+	third_party/one_euro_filter/LICENSE \
+	third_party/openh264/src/LICENSE \
+	third_party/openscreen/src/LICENSE \
+	third_party/openscreen/src/third_party/tinycbor/src/LICENSE \
+	third_party/openvr/src/LICENSE \
+	third_party/opus/src/COPYING \
+	third_party/opus/src/LICENSE_PLEASE_READ.txt \
+	third_party/ots/LICENSE \
+	third_party/ow2_asm/LICENSE \
+	third_party/pdfium/LICENSE \
+	third_party/pdfium/third_party/bigint/LICENSE \
+	third_party/pdfium/third_party/libpng16/LICENSE \
+	third_party/pdfium/third_party/pymock/LICENSE.txt \
+	third_party/perfetto/MODULE_LICENSE_APACHE2 \
+	third_party/pexpect/LICENSE \
+	third_party/pffft/LICENSE \
+	third_party/ply/LICENSE \
+	third_party/polymer/LICENSE.polymer \
+	third_party/polymer/v1_0/components-chromium/polymer2/LICENSE.txt \
+	third_party/polymer/v1_0/components-chromium/polymer/LICENSE.txt \
+	third_party/polymer/v3_0/components-chromium/polymer/LICENSE.txt \
+	third_party/proguard/LICENSE \
+	third_party/protobuf/LICENSE \
+	third_party/pycoverage/LICENSE \
+	third_party/pyelftools/elftools/construct/LICENSE \
+	third_party/pyelftools/LICENSE \
+	third_party/pyjson5/src/LICENSE \
+	third_party/pylint/pylint/LICENSE.txt \
+	third_party/pymock/LICENSE.txt \
+	third_party/pystache/LICENSE \
+	third_party/Python-Markdown/LICENSE.md \
+	third_party/pywebsocket/src/LICENSE \
+	third_party/qcms/src/COPYING \
+	third_party/quic_trace/src/LICENSE \
+	third_party/quic_trace/src/third_party/fonts/LICENSE \
+	third_party/quic_trace/src/third_party/glew/LICENSE.txt \
+	third_party/qunit/LICENSE \
+	third_party/r8/LICENSE \
+	third_party/re2/LICENSE \
+	third_party/re2/src/LICENSE \
+	third_party/requests/LICENSE \
+	third_party/rnnoise/COPYING \
+	third_party/robolectric/LICENSE \
+	third_party/robolectric/licenses/extreme.indiana.edu.license.txt \
+	third_party/robolectric/licenses/javolution.license.txt \
+	third_party/robolectric/licenses/pivotal.labs.license.txt \
+	third_party/s2cellid/LICENSE \
+	third_party/sfntly/COPYING.txt \
+	third_party/sfntly/src/cpp/COPYING.txt \
+	third_party/sfntly/src/java/COPYING \
+	third_party/shaderc/src/LICENSE \
+	third_party/shaderc/src/third_party/LICENSE.glslang \
+	third_party/shaderc/src/third_party/LICENSE.spirv-tools \
+	third_party/simplejson/LICENSE.txt \
+	third_party/sinonjs/LICENSE \
+	third_party/skia/include/third_party/skcms/LICENSE \
+	third_party/skia/include/third_party/vulkan/LICENSE \
+	third_party/skia/LICENSE \
+	third_party/skia/modules/canvaskit/canvaskit/LICENSE \
+	third_party/skia/modules/pathkit/npm-asmjs/LICENSE \
+	third_party/skia/modules/pathkit/npm-wasm/LICENSE \
+	third_party/skia/third_party/etc1/LICENSE \
+	third_party/skia/third_party/gif/LICENSE \
+	third_party/skia/third_party/skcms/LICENSE \
+	third_party/skia/third_party/vulkanmemoryallocator/include/LICENSE.txt \
+	third_party/skia/third_party/vulkanmemoryallocator/LICENSE \
+	third_party/skia/third_party/wuffs/LICENSE \
+	third_party/smhasher/LICENSE \
+	third_party/snappy/src/COPYING \
+	third_party/speech-dispatcher/COPYING \
+	third_party/spirv-cross/spirv-cross/LICENSE \
+	third_party/spirv-headers/LICENSE \
+	third_party/spirv-headers/src/LICENSE \
+	third_party/SPIRV-Tools/LICENSE \
+	third_party/SPIRV-Tools/src/LICENSE \
+	third_party/sqlite4java/LICENSE \
+	third_party/sqlite/LICENSE \
+	third_party/sqlite/patched/autoconf/tea/license.terms \
+	third_party/sqlite/patched/LICENSE.md \
+	third_party/sqlite/sqlite-src-3290000/autoconf/tea/license.terms \
+	third_party/sqlite/sqlite-src-3290000/LICENSE.md \
+	third_party/sudden_motion_sensor/LICENSE \
+	third_party/swiftshader/LICENSE.txt \
+	third_party/swiftshader/third_party/llvm-7.0/llvm/include/llvm/Support/LICENSE.TXT \
+	third_party/swiftshader/third_party/llvm-7.0/llvm/lib/Target/ARM/LICENSE.TXT \
+	third_party/swiftshader/third_party/llvm-7.0/llvm/LICENSE.TXT \
+	third_party/swiftshader/third_party/llvm-7.0/llvm/test/YAMLParser/LICENSE.txt \
+	third_party/swiftshader/third_party/llvm-7.0/llvm/tools/msbuild/license.txt \
+	third_party/swiftshader/third_party/llvm-7.0/llvm/utils/unittest/googlemock/LICENSE.txt \
+	third_party/swiftshader/third_party/llvm-7.0/llvm/utils/unittest/googletest/LICENSE.TXT \
+	third_party/swiftshader/third_party/llvm-subzero/LICENSE.TXT \
+	third_party/swiftshader/third_party/PowerVR_SDK/License.txt \
+	third_party/swiftshader/third_party/SPIRV-Headers/LICENSE \
+	third_party/swiftshader/third_party/SPIRV-Tools/LICENSE \
+	third_party/swiftshader/third_party/subzero/LICENSE.TXT \
+	third_party/tcmalloc/gperftools-2.0/vendor/COPYING \
+	third_party/tcmalloc/LICENSE \
+	third_party/tcmalloc/vendor/COPYING \
+	third_party/test_fonts/LICENSE \
+	third_party/tlslite/LICENSE \
+	third_party/ub-uiautomator/LICENSE \
+	third_party/unrar/LICENSE \
+	third_party/unrar/src/license.txt \
+	third_party/usb_ids/LICENSE \
+	third_party/usrsctp/LICENSE \
+	third_party/usrsctp/usrsctplib/LICENSE.md \
+	third_party/v4l-utils/COPYING.libv4l \
+	third_party/wayland/LICENSE \
+	third_party/wayland-protocols/LICENSE \
+	third_party/wayland-protocols/src/COPYING \
+	third_party/wayland/src/COPYING \
+	third_party/wds/LICENSE \
+	third_party/wds/src/COPYING \
+	third_party/web-animations-js/LICENSE \
+	third_party/web-animations-js/sources/COPYING \
+	third_party/webdriver/COPYING \
+	third_party/webdriver/LICENSE \
+	third_party/webgl/src/conformance-suites/1.0.1/conformance/LICENSE_CHROMIUM \
+	third_party/webgl/src/conformance-suites/2.0.0/closure-library/LICENSE \
+	third_party/webgl/src/conformance-suites/2.0.0/deqp/LICENSE \
+	third_party/webgl/src/conformance-suites/2.0.0/py/lint/LICENSE \
+	third_party/webgl/src/LICENSE.txt \
+	third_party/webgl/src/resources/html5lib/LICENSE \
+	third_party/webgl/src/sdk/demos/google/san-angeles/gles/license-BSD.txt \
+	third_party/webgl/src/sdk/demos/google/san-angeles/gles/license-LGPL.txt \
+	third_party/webgl/src/sdk/demos/google/san-angeles/gles/license.txt \
+	third_party/webgl/src/sdk/demos/google/san-angeles/gles/t/license-BSD.txt \
+	third_party/webgl/src/sdk/demos/google/san-angeles/gles/t/license-LGPL.txt \
+	third_party/webgl/src/sdk/demos/google/san-angeles/gles/t/license.txt \
+	third_party/webgl/src/sdk/demos/google/san-angeles/glut/license-BSD.txt \
+	third_party/webgl/src/sdk/demos/google/san-angeles/glut/license-LGPL.txt \
+	third_party/webgl/src/sdk/demos/google/san-angeles/glut/license.txt \
+	third_party/webgl/src/sdk/demos/google/san-angeles/license.txt \
+	third_party/webgl/src/sdk/demos/intel/fluid/LICENSE \
+	third_party/webgl/src/sdk/tests/closure-library/LICENSE \
+	third_party/webgl/src/sdk/tests/deqp/LICENSE \
+	third_party/webgl/src/sdk/tests/py/lint/LICENSE \
+	third_party/webrtc/common_audio/third_party/fft4g/LICENSE \
+	third_party/webrtc/common_audio/third_party/spl_sqrt_floor/LICENSE \
+	third_party/webrtc/examples/androidapp/third_party/autobanh/LICENSE \
+	third_party/webrtc/examples/androidapp/third_party/autobanh/LICENSE.md \
+	third_party/webrtc/examples/objc/AppRTCMobile/third_party/SocketRocket/LICENSE \
+	third_party/webrtc/LICENSE \
+	third_party/webrtc/license_template.txt \
+	third_party/webrtc/modules/third_party/fft/LICENSE \
+	third_party/webrtc/modules/third_party/g711/LICENSE \
+	third_party/webrtc/modules/third_party/g722/LICENSE \
+	third_party/webrtc/modules/third_party/portaudio/LICENSE \
+	third_party/webrtc/rtc_base/third_party/base64/LICENSE \
+	third_party/webrtc/rtc_base/third_party/sigslot/LICENSE \
+	third_party/webxr_test_pages/LICENSE \
+	third_party/webxr_test_pages/webxr-samples/js/cottontail/LICENSE.md \
+	third_party/webxr_test_pages/webxr-samples/js/third-party/dat.gui/LICENSE \
+	third_party/webxr_test_pages/webxr-samples/js/third-party/gl-matrix/LICENSE \
+	third_party/webxr_test_pages/webxr-samples/LICENSE.md \
+	third_party/widevine/LICENSE \
+	third_party/woff2/LICENSE \
+	third_party/xdg-utils/LICENSE \
+	third_party/xstream/LICENSE \
+	third_party/yasm/source/patched-yasm/COPYING \
+	third_party/yasm/source/patched-yasm/GNU_GPL-2.0 \
+	third_party/yasm/source/patched-yasm/GNU_LGPL-2.0 \
+	third_party/zlib/LICENSE \
+	tools/gn/base/third_party/icu/LICENSE \
+	tools/gn/LICENSE \
+	tools/origin_trials/third_party/ed25519/LICENSE \
+	tools/page_cycler/acid3/LICENSE \
+	tools/swarming_client/LICENSE \
+	tools/swarming_client/third_party/chromium/LICENSE \
+	tools/swarming_client/third_party/colorama/LICENSE.txt \
+	tools/swarming_client/third_party/depot_tools/LICENSE \
+	tools/swarming_client/third_party/infra_libs/LICENSE \
+	tools/swarming_client/third_party/oauth2client/LICENSE \
+	tools/swarming_client/third_party/pyasn1/LICENSE \
+	tools/swarming_client/third_party/rsa/LICENSE \
+	tools/swarming_client/third_party/six/LICENSE \
+	tools/symsrc/COPYING-pefile \
+	tools/win/ChromeDebug/ChromeDebug/LICENSE \
+	url/third_party/mozilla/LICENSE.txt \
+	v8/LICENSE \
+	v8/LICENSE.fdlibm \
+	v8/LICENSE.strongtalk \
+	v8/LICENSE.v8 \
+	v8/LICENSE.valgrind \
+	v8/src/third_party/siphash/LICENSE \
+	v8/src/third_party/utf8-decoder/LICENSE \
+	v8/src/third_party/valgrind/LICENSE \
+	v8/src/third_party/vtune/LICENSE \
+	v8/third_party/colorama/LICENSE \
+	v8/third_party/inspector_protocol/LICENSE \
+	v8/third_party/v8/builtins/LICENSE \
+	v8/third_party/wasm-api/LICENSE \
+
diff --git a/package/libcef/libcef.mk b/package/libcef/libcef.mk
new file mode 100644
index 0000000000..0555ba4590
--- /dev/null
+++ b/package/libcef/libcef.mk
@@ -0,0 +1,384 @@
+################################################################################
+#
+# libcef
+#
+################################################################################
+
+# Run $(LIBCEF_PKGDIR)/scripts/version.sh to generate these values.
+# Don't bother trying to update these by hand, LIBCEF_CEF_VERSION is too
+# dependant on git to assemble ourselves.
+LIBCEF_VERSION = 4907ec52f3fe52eea2c5b759f6bbf7c99a295afe
+LIBCEF_CEF_COMMIT_NUMBER = 2075
+LIBCEF_CEF_VERSION = 78.2.9+g4907ec5+chromium-78.0.3904.70
+LIBCEF_CEF_VERSION_MAJOR = 3
+LIBCEF_CEF_VERSION_MINOR = 2
+LIBCEF_CEF_VERSION_PATCH = 9
+LIBCEF_CHROMIUM_VERSION_MAJOR = 78
+LIBCEF_CHROMIUM_VERSION_MINOR = 0
+LIBCEF_CHROMIUM_VERSION_BUILD = 3904
+LIBCEF_CHROMIUM_VERSION_PATCH = 70
+# End version.sh generated values
+
+LIBCEF_SOURCE = $(LIBCEF_VERSION).tar.bz2
+LIBCEF_SITE = https://bitbucket.org/chromiumembedded/cef/get
+
+LIBCEF_INSTALL_STAGING = YES
+
+LIBCEF_LICENSE = GPL-2.0 or LGPL-3.0 or GPL-3.0 or GPL-3.0 with exception
+include package/libcef/libcef.license-files.inc
+
+# The Chromium source is fetched from a release tarball.
+LIBCEF_CHROMIUM_VERSION = $(LIBCEF_CHROMIUM_VERSION_MAJOR).$(LIBCEF_CHROMIUM_VERSION_MINOR).$(LIBCEF_CHROMIUM_VERSION_BUILD).$(LIBCEF_CHROMIUM_VERSION_PATCH)
+LIBCEF_EXTRA_DOWNLOADS = https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$(LIBCEF_CHROMIUM_VERSION).tar.xz
+
+LIBCEF_DEPENDENCIES = \
+	alsa-lib \
+	at-spi2-atk \
+	at-spi2-core \
+	atk \
+	cairo \
+	compiler-rt \
+	dbus \
+	ffmpeg \
+	flac \
+	fontconfig \
+	freetype \
+	harfbuzz \
+	host-clang \
+	host-jpeg-turbo \
+	host-lld \
+	host-llvm \
+	host-libkrb5 \
+	host-libnss \
+	host-libxml2 \
+	host-ninja \
+	host-nodejs \
+	host-pkgconf \
+	host-python \
+	host-webp \
+	jpeg-turbo \
+	libdrm \
+	libglib2 \
+	libgtk3 \
+	libkrb5 \
+	libnss \
+	libxml2 \
+	libxslt \
+	pango \
+	webp \
+	xlib_libXcomposite \
+	xlib_libXcursor \
+	xlib_libXrandr \
+	xlib_libXScrnSaver
+
+LIBCEF_GN_DEFINES = \
+	audio_processing_in_audio_service_supported=false \
+	cef_use_gtk=false \
+	clang_base_path=\"$(HOST_DIR)\" \
+	clang_version=\"9.0.0\" \
+	clang_use_chrome_plugins=false \
+	closure_compile=false \
+	custom_toolchain=\"//build/toolchain/linux/unbundle:default\" \
+	enable_basic_print_dialog=false \
+	enable_linux_installer=false \
+	enable_nacl=false \
+	enable_remoting=false \
+	enable_reporting=false \
+	enable_service_discovery=false \
+	enable_vr=false \
+	forbid_non_component_debug_builds=false \
+	host_pkg_config=\"$(PKG_CONFIG_HOST_BINARY_HOST)\" \
+	host_toolchain=\"//build/toolchain/linux/unbundle:host\" \
+	is_unsafe_developer_build=false \
+	link_pulseaudio=false \
+	linux_use_bundled_binutils=false \
+	pkg_config=\"$(PKG_CONFIG_HOST_BINARY)\" \
+	rtc_use_pipewire=false \
+	target_cpu=\"$(BR2_PACKAGE_LIBCEF_TARGET_ARCH)\" \
+	target_sysroot=\"$(STAGING_DIR)\" \
+	treat_warnings_as_errors=false \
+	use_bundled_fontconfig=false \
+	use_gnome_keyring=false \
+	use_gtk=false \
+	use_jumbo_build=true \
+	use_sysroot=true \
+	use_system_freetype=true \
+	use_system_harfbuzz=true \
+	use_system_libjpeg=true \
+	use_viz_devtools=false
+
+# Use Buildroot system libraries instead of Chromium third_party libraries
+LIBCEF_SYSTEM_LIBS = \
+	ffmpeg \
+	flac \
+	fontconfig \
+	freetype \
+	harfbuzz-ng \
+	libjpeg \
+	libwebp \
+	libxml \
+	libxslt \
+	openh264 \
+	yasm
+
+LIBCEF_BUILD_TARGETS = libcef.so chrome_sandbox
+
+# We need to set our own flags in addition to the standard Buildroot ones.
+# Chromium may set warning flags that the LLVM toolchain in Buildroot
+# doesn't know about yet, because they use a bleeding edge toolchain.
+LIBCEF_FLAGS_GENERIC = -Wno-unknown-warning-option
+LIBCEF_FLAGS_GENERIC += --target=$(TARGET_CROSS_TRIPLE)
+
+LIBCEF_HOST_CFLAGS = $(HOST_CFLAGS) $(LIBCEF_FLAGS_GENERIC)
+LIBCEF_HOST_CXXFLAGS = $(HOST_CXXFLAGS) $(LIBCEF_FLAGS_GENERIC)
+LIBCEF_HOST_ASMFLAGS = $(LIBCEF_FLAGS_GENERIC)
+# Use the LLVM linker
+LIBCEF_HOST_LDFLAGS = $(HOST_LDFLAGS) $(LIBCEF_FLAGS_GENERIC) \
+	-fuse-ld=$(HOST_DIR)/bin/ld.lld
+
+LIBCEF_TARGET_CFLAGS = $(TARGET_CFLAGS) $(LIBCEF_FLAGS_GENERIC)
+LIBCEF_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS) $(LIBCEF_FLAGS_GENERIC)
+LIBCEF_TARGET_LDFLAGS = $(TARGET_LDFLAGS) $(LIBCEF_FLAGS_GENERIC)
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
+# Tell clang where the external toolchain is and to use it because
+# it may not be on $PATH.
+LIBCEF_TARGET_CFLAGS += --gcc-toolchain=$(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
+LIBCEF_TARGET_CXXFLAGS += --gcc-toolchain=$(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
+LIBCEF_TARGET_LDFLAGS += --gcc-toolchain=$(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
+endif
+
+ifeq ($(BR2_i386)$(BR2_x86_64),y)
+LIBCEF_SYSTEM_LIBS += yasm
+LIBCEF_DEPENDENCIES += host-yasm
+endif
+
+ifeq ($(BR2_ENABLE_DEBUG),y)
+# The `is_official_build` options has nothing to do with branding, it
+# enables an additional level of optimization above `is_debug=false`.
+LIBCEF_BUILD_OUTPUT_DIR = out/Debug
+LIBCEF_GN_DEFINES += \
+	is_debug=true \
+	is_official_build=false
+else
+LIBCEF_BUILD_OUTPUT_DIR = out/Release
+LIBCEF_GN_DEFINES += \
+	is_debug=false \
+	is_official_build=true
+endif
+
+# We have two build directories.  One uses the bundled LLVM libcxx, and the
+# other uses the system C++ standard library.  One is used for libcef.so, and
+# the other is for libcef_dll_wrapper.a, that dependant projects statically
+# link against.
+LIBCEF_BUILD_OUTPUT_DIR_SYSTEM_LIBCXX = $(LIBCEF_BUILD_OUTPUT_DIR)_system_libcxx
+
+# tcmalloc has portability issues
+LIBCEF_GN_DEFINES += use_allocator=\"none\"
+
+ifeq ($(BR2_CCACHE),y)
+LIBCEF_GN_DEFINES += cc_wrapper=\"$(CCACHE)\"
+endif
+
+# LLD is unsupported on i386, and fails during linking
+ifeq ($(BR2_i386)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
+LIBCEF_GN_DEFINES += use_lld=false
+# Disable gold as well, to force usage of our toolchain's ld.bfd
+LIBCEF_GN_DEFINES += use_gold=false
+endif
+
+ifeq ($(BR2_PACKAGE_CUPS),y)
+LIBCEF_DEPENDENCIES += cups
+LIBCEF_GN_DEFINES += use_cups=true
+else
+LIBCEF_GN_DEFINES += use_cups=false
+endif
+
+ifeq ($(BR2_PACKAGE_PCIUTILS),y)
+LIBCEF_DEPENDENCIES += pciutils
+LIBCEF_GN_DEFINES += use_libpci=true
+else
+LIBCEF_GN_DEFINES += use_libpci=false
+endif
+
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+LIBCEF_DEPENDENCIES += pulseaudio
+LIBCEF_GN_DEFINES += use_pulseaudio=true
+else
+LIBCEF_GN_DEFINES += use_pulseaudio=false
+endif
+
+# To build libcef, the CEF project source must be extracted in a
+# `cef` directory inside the Chromium source tree.  We override
+# the buildroot default extract commands to get the desired source
+# tree layout.
+define LIBCEF_EXTRACT_CMDS
+	# Extract Chromium source code
+	tar -C $(@D) \
+		--strip-components=1 \
+		-xf $(LIBCEF_DL_DIR)/chromium-$(LIBCEF_CHROMIUM_VERSION).tar.xz
+
+	# Extract CEF to cef dir inside Chromium source code
+	mkdir $(@D)/cef
+	tar -C $(@D)/cef \
+		--strip-components=1 \
+		-xf $(LIBCEF_DL_DIR)/$(LIBCEF_VERSION).tar.bz2
+endef
+
+# Patch the Chromium source with the CEF patches
+define LIBCEF_APPLY_CEF_PATCHES
+	( cd $(@D); \
+		for cef_patch in cef/patch/patches/*.patch; do \
+			patch -p0 -u -i "$$cef_patch"; \
+		done; \
+	)
+endef
+LIBCEF_PRE_PATCH_HOOKS += LIBCEF_APPLY_CEF_PATCHES
+
+LIBCEF_TARGET_CONFIGURE_ENV = \
+	$(TARGET_MAKE_ENV) \
+	BUILD_CC="clang" \
+	BUILD_CXX="clang++" \
+	BUILD_AR="$(HOSTAR)" \
+	BUILD_NM="$(HOSTNM)" \
+	BUILD_CFLAGS="$(LIBCEF_HOST_CFLAGS)" \
+	BUILD_CXXFLAGS="$(LIBCEF_HOST_CXXFLAGS)" \
+	BUILD_ASMFLAGS="$(LIBCEF_HOST_ASMFLAGS)" \
+	BUILD_LDFLAGS="$(LIBCEF_HOST_LDFLAGS)" \
+	CC="clang" \
+	CXX="clang++" \
+	AR="ar" \
+	NM="nm" \
+	CFLAGS="$(LIBCEF_TARGET_CFLAGS)" \
+	CXXFLAGS="$(LIBCEF_TARGET_CXXFLAGS)" \
+	LDFLAGS="$(LIBCEF_TARGET_LDFLAGS)"
+
+define LIBCEF_CONFIGURE_CMDS
+	# Override the unbundle BUILD.gn
+	cp $(LIBCEF_PKGDIR)/build/toolchain/linux/unbundle/BUILD.gn \
+		$(@D)/build/toolchain/linux/unbundle/BUILD.gn
+
+	# Create include/cef_version.h
+	sed -e "s/{{ cef_version }}/$(LIBCEF_CEF_VERSION)/; \
+		s/{{ cef_version_major }}/$(LIBCEF_CEF_VERSION_MAJOR)/; \
+		s/{{ cef_version_minor }}/$(LIBCEF_CEF_VERSION_MINOR)/; \
+		s/{{ cef_version_patch }}/$(LIBCEF_CEF_VERSION_PATCH)/; \
+		s/{{ cef_commit_number }}/$(LIBCEF_CEF_COMMIT_NUMBER)/; \
+		s/{{ cef_commit_hash }}/$(LIBCEF_VERSION)/; \
+		s/{{ year }}/$$(date +%Y)/; \
+		s/{{ chrome_version_major }}/$(LIBCEF_CHROMIUM_VERSION_MAJOR)/; \
+		s/{{ chrome_version_minor }}/$(LIBCEF_CHROMIUM_VERSION_MINOR)/; \
+		s/{{ chrome_version_build }}/$(LIBCEF_CHROMIUM_VERSION_BUILD)/; \
+		s/{{ chrome_version_patch }}/$(LIBCEF_CHROMIUM_VERSION_PATCH)/;" \
+		$(LIBCEF_PKGDIR)/templates/cef_version.h > \
+			$(@D)/cef/include/cef_version.h
+
+	# Update the CEF API in case someone has patched it
+	( cd $(@D)/cef/tools; $(TARGET_MAKE_ENV) ./translator.sh )
+
+	# Shim headers allow us to link to unbundled system libraries.  Normally
+	# this isn't allowed in "official"/release builds.
+	# Disable the build time error for official builds with system libs.
+	( cd $(@D); \
+		sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
+			tools/generate_shim_headers/generate_shim_headers.py \
+	)
+
+	mkdir -p $(@D)/third_party/node/linux/node-linux-x64/bin
+	ln -sf $(HOST_DIR)/bin/node $(@D)/third_party/node/linux/node-linux-x64/bin/
+
+	( cd $(@D); \
+		$(TARGET_MAKE_ENV) \
+		build/linux/unbundle/replace_gn_files.py \
+			--system-libraries $(LIBCEF_SYSTEM_LIBS) \
+	)
+
+	# Generate-ninja config which uses the bundled LLVM C++ library.
+	# This is where the main CEF build will take place
+	( cd $(@D); \
+		$(LIBCEF_TARGET_CONFIGURE_ENV) \
+		buildtools/linux64/gn gen $(LIBCEF_BUILD_OUTPUT_DIR) \
+			--args="$(LIBCEF_GN_DEFINES) use_custom_libcxx=true" \
+	)
+
+	# Generate-ninja config which uses the host C++ library.
+	# This is where we build the libcef_dll_wrapper.a
+	( cd $(@D); \
+		$(LIBCEF_TARGET_CONFIGURE_ENV) \
+		buildtools/linux64/gn gen \
+			$(LIBCEF_BUILD_OUTPUT_DIR_SYSTEM_LIBCXX) \
+			--args="$(LIBCEF_GN_DEFINES) use_custom_libcxx=false" \
+	)
+
+	# Create include/cef_config.h
+	$(HOST_DIR)/usr/bin/python $(@D)/cef/tools/make_config_header.py \
+		--header=$(@D)/cef/include/cef_config.h \
+		--cef_gn_config=$(@D)/$(LIBCEF_BUILD_OUTPUT_DIR)/args.gn
+endef
+
+define LIBCEF_BUILD_CMDS
+	( cd $(@D); \
+		$(TARGET_MAKE_ENV) \
+		ninja -j$(PARALLEL_JOBS) \
+			-C $(LIBCEF_BUILD_OUTPUT_DIR) \
+			$(LIBCEF_BUILD_TARGETS) \
+	)
+	( cd $(@D); \
+		$(TARGET_MAKE_ENV) \
+		ninja -j$(PARALLEL_JOBS) \
+			-C $(LIBCEF_BUILD_OUTPUT_DIR_SYSTEM_LIBCXX) \
+			libcef_dll_wrapper \
+	)
+endef
+
+LIBCEF_INSTALL_STAGING_INCLUDE_PATH=$(STAGING_DIR)/usr/include/cef
+LIBCEF_INSTALL_STAGING_LIBRARY_PATH=$(STAGING_DIR)/usr/lib/cef
+
+define LIBCEF_INSTALL_STAGING_CMDS
+	mkdir -p $(LIBCEF_INSTALL_STAGING_LIBRARY_PATH)
+	( cd $(@D)/$(LIBCEF_BUILD_OUTPUT_DIR_SYSTEM_LIBCXX)/obj/cef; \
+		cp -r libcef_dll_wrapper.a libcef_dll_wrapper \
+			$(LIBCEF_INSTALL_STAGING_LIBRARY_PATH) \
+	)
+
+	mkdir -p $(LIBCEF_INSTALL_STAGING_INCLUDE_PATH)
+	cp -a $(@D)/cef/include $(LIBCEF_INSTALL_STAGING_INCLUDE_PATH)
+
+	# CEF file cef_net_error_list.sh includes the Chromium file
+	# net_error_list.h but expects to be distributed with the correct file
+	# in place.
+	cp $(@D)/net/base/net_error_list.h \
+		$(LIBCEF_INSTALL_STAGING_INCLUDE_PATH)/include/base/internal/cef_net_error_list.h
+
+	$(INSTALL) -m 0644 -D -t $(STAGING_DIR)/usr/lib \
+		$(@D)/$(LIBCEF_BUILD_OUTPUT_DIR)/libcef.so
+endef
+
+define LIBCEF_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/lib \
+		$(@D)/$(LIBCEF_BUILD_OUTPUT_DIR)/libcef.so
+
+	# chrome_sandbox gets renamed
+	$(INSTALL) -m 4755 \
+		$(@D)/$(LIBCEF_BUILD_OUTPUT_DIR)/chrome_sandbox \
+		$(TARGET_DIR)/usr/lib/chrome-sandbox
+
+	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/lib \
+		$(@D)/$(LIBCEF_BUILD_OUTPUT_DIR)/cef.pak \
+		$(@D)/$(LIBCEF_BUILD_OUTPUT_DIR)/cef_100_percent.pak \
+		$(@D)/$(LIBCEF_BUILD_OUTPUT_DIR)/cef_200_percent.pak \
+		$(@D)/$(LIBCEF_BUILD_OUTPUT_DIR)/cef_extensions.pak \
+		$(@D)/$(LIBCEF_BUILD_OUTPUT_DIR)/devtools_resources.pak \
+		$(@D)/$(LIBCEF_BUILD_OUTPUT_DIR)/icudtl.dat \
+		$(@D)/$(LIBCEF_BUILD_OUTPUT_DIR)/libEGL.so \
+		$(@D)/$(LIBCEF_BUILD_OUTPUT_DIR)/libGLESv2.so
+
+	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/lib/swiftshader \
+		$(@D)/$(LIBCEF_BUILD_OUTPUT_DIR)/swiftshader/libEGL.so \
+		$(@D)/$(LIBCEF_BUILD_OUTPUT_DIR)/swiftshader/libGLESv2.so
+
+	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/lib/locales \
+		$(@D)/$(LIBCEF_BUILD_OUTPUT_DIR)/locales/*.pak
+endef
+
+$(eval $(generic-package))
diff --git a/package/libcef/scripts/gather-license-files.sh b/package/libcef/scripts/gather-license-files.sh
new file mode 100755
index 0000000000..9c7114d7b9
--- /dev/null
+++ b/package/libcef/scripts/gather-license-files.sh
@@ -0,0 +1,53 @@
+#!/bin/bash
+# Print licence files for libcef package
+# You can run it like this:
+#
+# package/libcef/scripts/gather-license-files.sh \
+#    output/build/libcef-VERSION/ \
+#    > package/libcef/libcef.license-files.inc
+
+usage()
+{
+	echo "usage: $0 DIR"
+	echo "DIR must be a buildroot output/build/libcef-<version> directory"
+}
+
+generate_license_file_list()
+{
+	declare -r path="$1"
+
+	echo 'LIBCEF_LICENSE_FILES = \'
+
+	find "$path" -type f -iname "*LICENSE*" -printf "%P\n" -o \
+	             -type f -iname "*COPYING*" -printf "%P\n" -o \
+	             -type f -iname "*GPL*"     -printf "%P\n" | \
+		sed -e '/\.asm$/d' \
+		    -e '/\.h$/d' \
+		    -e '/\.c$/d' \
+		    -e '/\.cc$/d' \
+		    -e '/\.cpp$/d' \
+		    -e '/\.pyc\?$/d' \
+		    -e '/\.pl$/d' \
+		    -e '/\.sha1$/d' \
+		    -e '/\.patch$/d' \
+		    -e '/\.html$/d' \
+		    -e '/\.java$/d' \
+		    -e '/\.css$/d' \
+		    -e '/\.js$/d' \
+		    -e '/\.tmpl$/d' \
+		    -e '/licensecheck/d' \
+		    -e '/wrongplace/d' \
+		    -e '/ClangPlugins/d' \
+		    -e '/fts5bigpl/d' \
+		    -e '/^out\//d' \
+		    -e 's,^,\t,' \
+		    -e 's,$, \\,' | \
+		sort
+	echo ''
+}
+
+if [ $# -lt 1 ]; then
+        usage
+        exit 1
+fi
+generate_license_file_list "$1"
diff --git a/package/libcef/scripts/version.sh b/package/libcef/scripts/version.sh
new file mode 100755
index 0000000000..19689bec82
--- /dev/null
+++ b/package/libcef/scripts/version.sh
@@ -0,0 +1,48 @@
+#!/bin/bash
+# Print version information for the buildroot libcef package
+# Run this when updating the libcef package to quickly populate the versions
+
+usage()
+{
+	echo "usage: $0 chromium_src"
+	echo "$0 expects \$chromium_src/cef/.git to exist"
+}
+
+pr_cef_version()
+{
+	declare cef_version_major cef_version_minor cef_version_patch
+	declare cef_commit_number cef_commit_hash
+	declare cef_version_str
+	declare -r src_cef="$1/cef"
+
+	cef_commit_number=$(git -C "$src_cef" rev-list --count HEAD)
+	cef_commit_hash=$(git -C "$src_cef" rev-parse HEAD)
+
+	cef_version_str=$(python2 "$src_cef/tools/cef_version.py" current)
+	cef_version_major=$(awk -F= '/CEF_MAJOR/ { print $2 }' \
+		"$src_cef/VERSION.in")
+	cef_version_minor=$(echo "$cef_version_str" | cut -d. -f2)
+	cef_version_patch=$(echo "$cef_version_str" | cut -d+ -f1 | cut -d. -f3)
+
+	echo "LIBCEF_VERSION = $cef_commit_hash"
+	echo "LIBCEF_CEF_COMMIT_NUMBER = $cef_commit_number"
+
+	echo "LIBCEF_CEF_VERSION = $cef_version_str"
+	echo "LIBCEF_CEF_VERSION_MAJOR = $cef_version_major"
+	echo "LIBCEF_CEF_VERSION_MINOR = $cef_version_minor"
+	echo "LIBCEF_CEF_VERSION_PATCH = $cef_version_patch"
+}
+
+pr_chromium_version()
+{
+	declare -r src_chrome="$1/chrome"
+	awk -F= '{ print "LIBCEF_CHROMIUM_VERSION_"$1,"=",$2 }' \
+		"$src_chrome/VERSION"
+}
+
+if [ $# -lt 1 ]; then
+	usage
+	exit 1
+fi
+pr_cef_version "$1"
+pr_chromium_version "$1"
diff --git a/package/libcef/templates/cef_version.h b/package/libcef/templates/cef_version.h
new file mode 100644
index 0000000000..5d6c4685ac
--- /dev/null
+++ b/package/libcef/templates/cef_version.h
@@ -0,0 +1,70 @@
+// Copyright (c) {{ year }} Marshall A. Greenblatt. All rights reserved.
+//
+// Redistribution and use in source and binary forms, with or without
+// modification, are permitted provided that the following conditions are
+// met:
+//
+//    * Redistributions of source code must retain the above copyright
+// notice, this list of conditions and the following disclaimer.
+//    * Redistributions in binary form must reproduce the above
+// copyright notice, this list of conditions and the following disclaimer
+// in the documentation and/or other materials provided with the
+// distribution.
+//    * Neither the name of Google Inc. nor the name Chromium Embedded
+// Framework nor the names of its contributors may be used to endorse
+// or promote products derived from this software without specific prior
+// written permission.
+//
+// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+//
+// ---------------------------------------------------------------------------
+//
+// This file is generated by the make_version_header.py tool.
+//
+#ifndef CEF_INCLUDE_CEF_VERSION_H_
+#define CEF_INCLUDE_CEF_VERSION_H_
+#define CEF_VERSION "{{ cef_version }}"
+#define CEF_VERSION_MAJOR {{ cef_version_major }}
+#define CEF_VERSION_MINOR {{ cef_version_minor }}
+#define CEF_VERSION_PATCH {{ cef_version_patch }}
+#define CEF_COMMIT_NUMBER {{ cef_commit_number }}
+#define CEF_COMMIT_HASH "{{ cef_commit_hash }}"
+#define COPYRIGHT_YEAR {{ year }}
+#define CHROME_VERSION_MAJOR {{ chrome_version_major }}
+#define CHROME_VERSION_MINOR {{ chrome_version_minor }}
+#define CHROME_VERSION_BUILD {{ chrome_version_build }}
+#define CHROME_VERSION_PATCH {{ chrome_version_patch }}
+#define DO_MAKE_STRING(p) #p
+#define MAKE_STRING(p) DO_MAKE_STRING(p)
+#ifndef APSTUDIO_HIDDEN_SYMBOLS
+#include "include/internal/cef_export.h"
+#ifdef __cplusplus
+extern "C" {
+#endif
+// Returns CEF version information for the libcef library. The |entry|
+// parameter describes which version component will be returned:
+// 0 - CEF_VERSION_MAJOR
+// 1 - CEF_VERSION_MINOR
+// 2 - CEF_VERSION_PATCH
+// 3 - CEF_COMMIT_NUMBER
+// 4 - CHROME_VERSION_MAJOR
+// 5 - CHROME_VERSION_MINOR
+// 6 - CHROME_VERSION_BUILD
+// 7 - CHROME_VERSION_PATCH
+///
+CEF_EXPORT int cef_version_info(int entry);
+#ifdef __cplusplus
+}
+#endif
+#endif  // APSTUDIO_HIDDEN_SYMBOLS
+#endif  // CEF_INCLUDE_CEF_VERSION_H_
-- 
2.20.1
