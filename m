From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sun, 10 Jun 2018 13:54:17 -0700
Subject: [Buildroot] [RFC PATCH v3 9/9] chromium: new package
In-Reply-To: <20180610205417.13963-1-joseph.kogut@gmail.com>
References: <20180610204449.13646-1-joseph.kogut@gmail.com>
 <20180610205417.13963-1-joseph.kogut@gmail.com>
Message-ID: <20180610205417.13963-10-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 ...iler_cpu_abi-for-buildroot-toolchain.patch | 102 +++++++++++++
 package/chromium/Config.in                    |  44 ++++++
 package/chromium/chromium.hash                |   4 +
 package/chromium/chromium.mk                  | 137 ++++++++++++++++++
 package/chromium/toolchain/BUILD.gn           |  71 +++++++++
 7 files changed, 360 insertions(+)
 create mode 100644 package/chromium/0001-modify-compiler_cpu_abi-for-buildroot-toolchain.patch
 create mode 100644 package/chromium/Config.in
 create mode 100644 package/chromium/chromium.hash
 create mode 100644 package/chromium/chromium.mk
 create mode 100644 package/chromium/toolchain/BUILD.gn

diff --git a/DEVELOPERS b/DEVELOPERS
index ef6fd32fed..1ad680509c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -957,6 +957,7 @@ F:	configs/qemu_ppc64le_pseries_defconfig
 N:	Joseph Kogut <joseph.kogut@gmail.com>
 F:	package/at-spi2-atk/
 F:	package/at-spi2-core/
+F:	package/chromium/
 F:	package/gconf/
 F:	package/libnss/
 F:	package/lld/
diff --git a/package/Config.in b/package/Config.in
index e4eb87b574..80248a798c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -14,6 +14,7 @@ menu "Audio and video applications"
 	source "package/aumix/Config.in"
 	source "package/bellagio/Config.in"
 	source "package/bluez-alsa/Config.in"
+	source "package/chromium/Config.in"
 	source "package/dvblast/Config.in"
 	source "package/dvdauthor/Config.in"
 	source "package/dvdrw-tools/Config.in"
diff --git a/package/chromium/0001-modify-compiler_cpu_abi-for-buildroot-toolchain.patch b/package/chromium/0001-modify-compiler_cpu_abi-for-buildroot-toolchain.patch
new file mode 100644
index 0000000000..1848b0bd14
--- /dev/null
+++ b/package/chromium/0001-modify-compiler_cpu_abi-for-buildroot-toolchain.patch
@@ -0,0 +1,102 @@
+From 3d5106d1d4720e1be8a4bd977be38743d6fb1f3c Mon Sep 17 00:00:00 2001
+From: Joseph Kogut <joseph.kogut@gmail.com>
+Date: Sun, 10 Jun 2018 09:59:11 -0700
+Subject: [PATCH] modify compiler_cpu_abi for buildroot toolchain
+
+Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
+---
+ build/config/compiler/BUILD.gn | 36 +++++++++++++++++++---------------
+ 1 file changed, 20 insertions(+), 16 deletions(-)
+
+diff --git a/build/config/compiler/BUILD.gn b/build/config/compiler/BUILD.gn
+index 461e62da2..27c9f29ed 100644
+--- a/build/config/compiler/BUILD.gn
++++ b/build/config/compiler/BUILD.gn
+@@ -683,6 +683,10 @@ config("compiler_cpu_abi") {
+         "-march=x86-64",
+       ]
+       ldflags += [ "-m64" ]
++      if (is_clang) {
++        cflags += ["--target=x86_64-buildroot-linux-gnu"]
++        ldflags += ["--target=x86_64-buildroot-linux-gnu"]
++      }
+     } else if (current_cpu == "x86") {
+       cflags += [ "-m32" ]
+       ldflags += [ "-m32" ]
+@@ -695,8 +699,8 @@ config("compiler_cpu_abi") {
+       }
+     } else if (current_cpu == "arm") {
+       if (is_clang && !is_android && !is_nacl) {
+-        cflags += [ "--target=arm-linux-gnueabihf" ]
+-        ldflags += [ "--target=arm-linux-gnueabihf" ]
++        cflags += [ "--target=arm-buildroot-linux-gnueabihf" ]
++        ldflags += [ "--target=arm-buildroot-linux-gnueabihf" ]
+       }
+       if (!is_nacl) {
+         cflags += [
+@@ -709,18 +713,18 @@ config("compiler_cpu_abi") {
+       }
+     } else if (current_cpu == "arm64") {
+       if (is_clang && !is_android && !is_nacl && !is_fuchsia) {
+-        cflags += [ "--target=aarch64-linux-gnu" ]
+-        ldflags += [ "--target=aarch64-linux-gnu" ]
++        cflags += [ "--target=aarch64-buildroot-linux-gnu" ]
++        ldflags += [ "--target=aarch64-buildroot-linux-gnu" ]
+       }
+     } else if (current_cpu == "mipsel" && !is_nacl) {
+       if (custom_toolchain == "") {
+         if (is_clang) {
+           if (is_android) {
+-            cflags += [ "--target=mipsel-linux-android" ]
+-            ldflags += [ "--target=mipsel-linux-android" ]
++            cflags += [ "--target=mipsel-buildroot-linux-android" ]
++            ldflags += [ "--target=mipsel-buildroot-linux-android" ]
+           } else {
+-            cflags += [ "--target=mipsel-linux-gnu" ]
+-            ldflags += [ "--target=mipsel-linux-gnu" ]
++            cflags += [ "--target=mipsel-buildroot-linux-gnu" ]
++            ldflags += [ "--target=mipsel-buildroot-linux-gnu" ]
+           }
+         } else {
+           cflags += [ "-EL" ]
+@@ -799,8 +803,8 @@ config("compiler_cpu_abi") {
+     } else if (current_cpu == "mips" && !is_nacl) {
+       if (custom_toolchain == "") {
+         if (is_clang) {
+-          cflags += [ "--target=mips-linux-gnu" ]
+-          ldflags += [ "--target=mips-linux-gnu" ]
++          cflags += [ "--target=mips-buildroot-linux-gnu" ]
++          ldflags += [ "--target=mips-buildroot-linux-gnu" ]
+         } else {
+           cflags += [ "-EB" ]
+           ldflags += [ "-EB" ]
+@@ -844,11 +848,11 @@ config("compiler_cpu_abi") {
+       if (custom_toolchain == "") {
+         if (is_clang) {
+           if (is_android) {
+-            cflags += [ "--target=mips64el-linux-android" ]
+-            ldflags += [ "--target=mips64el-linux-android" ]
++            cflags += [ "--target=mips64el-buildroot-linux-android" ]
++            ldflags += [ "--target=mips64el-buildroot-linux-android" ]
+           } else {
+-            cflags += [ "--target=mips64el-linux-gnuabi64" ]
+-            ldflags += [ "--target=mips64el-linux-gnuabi64" ]
++            cflags += [ "--target=mips64el-buildroot-linux-gnuabi64" ]
++            ldflags += [ "--target=mips64el-buildroot-linux-gnuabi64" ]
+           }
+         } else {
+           cflags += [
+@@ -905,8 +909,8 @@ config("compiler_cpu_abi") {
+     } else if (current_cpu == "mips64") {
+       if (custom_toolchain == "") {
+         if (is_clang) {
+-          cflags += [ "--target=mips64-linux-gnuabi64" ]
+-          ldflags += [ "--target=mips64-linux-gnuabi64" ]
++          cflags += [ "--target=mips64-buildroot-linux-gnuabi64" ]
++          ldflags += [ "--target=mips64-buildroot-linux-gnuabi64" ]
+         } else {
+           cflags += [
+             "-EB",
+-- 
+2.17.1
+
diff --git a/package/chromium/Config.in b/package/chromium/Config.in
new file mode 100644
index 0000000000..db4623f554
--- /dev/null
+++ b/package/chromium/Config.in
@@ -0,0 +1,44 @@
+config BR2_PACKAGE_CHROMIUM
+	bool "chromium"
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_CUPS
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_HARFBUZZ
+	select BR2_PACKAGE_LLVM_ENABLE_HOST_ARCH
+	select BR2_PACKAGE_HOST_CLANG
+	select BR2_PACKAGE_HOST_LLD
+	select BR2_PACKAGE_HOST_NINJA
+	select BR2_PACKAGE_HOST_NODEJS
+	select BR2_PACKAGE_HOST_PYTHON
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBERATION # runtime
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBGTK2 if !BR2_PACKAGE_LIBGTK3_X11
+	select BR2_PACKAGE_LIBKRB5
+	select BR2_PACKAGE_LIBNSS
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_PCIUTILS
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
+	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XLIB_LIBXSCRNSAVER
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64
+
+config BR2_PACKAGE_CHROMIUM_TARGET_ARCH
+	string
+	default "arm" if BR2_arm
+	default "arm64" if BR2_aarch64
+	default "x86" if BR2_i386
+	default "x64" if BR2_x86_64
+	default "mips" if BR2_mips
+
+comment "chromium needs toolchain w/ Glibc"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
+comment "chromium depends on X.org and needs an OpenGL backend"
+	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/chromium/chromium.hash b/package/chromium/chromium.hash
new file mode 100644
index 0000000000..1af15cb23b
--- /dev/null
+++ b/package/chromium/chromium.hash
@@ -0,0 +1,4 @@
+# locally calculated
+sha256 f8b1e5319163e378027826b12cf256b97423bb90e10e2013469d96e03bc9db8a  chromium-67.0.3396.79.tar.xz
+sha256 845022e0c1db1abb41a6ba4cd3c4b674ec290f3359d9d3c78ae558d4c0ed9308  LICENSE
+
diff --git a/package/chromium/chromium.mk b/package/chromium/chromium.mk
new file mode 100644
index 0000000000..4e6d90c52d
--- /dev/null
+++ b/package/chromium/chromium.mk
@@ -0,0 +1,137 @@
+###############################################################################
+#
+# Chromium
+#
+###############################################################################
+
+CHROMIUM_VERSION = 67.0.3396.79
+CHROMIUM_SITE = https://commondatastorage.googleapis.com/chromium-browser-official
+CHROMIUM_SOURCE = chromium-$(CHROMIUM_VERSION).tar.xz
+CHROMIUM_LICENSE = BSD-Style
+CHROMIUM_LICENSE_FILES = LICENSE
+CHROMIUM_DEPENDENCIES = alsa-lib cups dbus freetype harfbuzz \
+			host-clang host-lld host-ninja host-nodejs host-python \
+			jpeg libdrm libglib2 libkrb5 libnss libpng pciutils \
+			xlib_libXcomposite xlib_libXScrnSaver xlib_libXcursor \
+			xlib_libXrandr zlib
+
+CHROMIUM_TOOLCHAIN_CONFIG_PATH = $(shell pwd)/package/chromium/toolchain
+
+CHROMIUM_OPTS = \
+	host_toolchain=\"$(CHROMIUM_TOOLCHAIN_CONFIG_PATH):host\" \
+	v8_snapshot_toolchain=\"$(CHROMIUM_TOOLCHAIN_CONFIG_PATH):v8_snapshot\" \
+	custom_toolchain=\"$(CHROMIUM_TOOLCHAIN_CONFIG_PATH):target\" \
+	use_lld=true \
+	is_clang=true \
+	clang_use_chrome_plugins=false \
+	treat_warnings_as_errors=false \
+	use_gnome_keyring=false \
+	linux_use_bundled_binutils=false \
+	use_sysroot=false \
+	target_sysroot=\"$(STAGING_DIR)\" \
+	target_cpu=\"$(BR2_PACKAGE_CHROMIUM_TARGET_ARCH)\" \
+	enable_nacl=false \
+	use_dbus=true \
+	use_cups=true \
+	use_system_zlib=true \
+	use_system_libjpeg=true \
+	use_system_libpng=true \
+	use_system_libdrm=true \
+	use_system_harfbuzz=true \
+	use_system_freetype=true
+
+# tcmalloc has portability issues
+CHROMIUM_OPTS += use_allocator=\"none\"
+
+ifeq ($(BR2_ENABLE_DEBUG),y)
+	CHROMIUM_OPTS += is_debug=true
+else
+	CHROMIUM_OPTS += is_debug=false
+endif
+
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+	CHROMIUM_DEPENDENCIES += pulseaudio
+	CHROMIUM_OPTS += use_pulseaudio=true
+else
+	CHROMIUM_OPTS += use_pulseaudio=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+	CHROMIUM_DEPENDENCIES += libgtk3
+	CHROMIUM_OPTS += use_gtk3=true
+else
+	CHROMIUM_OPTS += use_gtk3=false
+endif
+
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
+CHROMIUM_TARGET_LDFLAGS += --gcc-toolchain=$(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
+else
+CHROMIUM_TARGET_LDFLAGS += --gcc-toolchain=$(HOST_DIR)
+endif
+
+CHROMIUM_TARGET_CFLAGS += $(CHROMIUM_TARGET_LDFLAGS)
+CHROMIUM_TARGET_CXXFLAGS += $(CHROMIUM_TARGET_CFLAGS)
+
+CHROMIUM_HOST_CFLAGS += --target=$(HOSTARCH)-buildroot-linux-gnu
+CHROMIUM_HOST_CXXFLAGS += $(CHROMIUM_HOST_CFLAGS)
+CHROMIUM_HOST_LDFLAGS += --gcc-toolchain="/usr"
+
+define CHROMIUM_CONFIGURE_CMDS
+	mkdir -p $(@D)/third_party/node/linux/node-linux-x64/bin
+	ln -sf $(HOST_DIR)/bin/node $(@D)/third_party/node/linux/node-linux-x64/bin/
+
+	# The host's toolchain (GCC) is used for generating binaries that are to be
+	# run on the host. We can use Buildroot's HOST_*FLAGS variables for this
+	# toolchain.
+	#
+	# The generated host-clang toolchain is used for binaries that are built for
+	# the target, as well as for the V8 engine that's used to generate the V8
+	# snapshot on the host.
+	( cd $(@D); \
+		$(TARGET_MAKE_ENV) \
+		$(HOST_DIR)/bin/python2 tools/gn/bootstrap/bootstrap.py -s --no-clean; \
+		HOST_AR="$(HOSTAR)" \
+		HOST_NM="$(HOSTNM)" \
+		HOST_CC="$(HOSTCC)" \
+		HOST_CXX="$(HOSTCXX)" \
+		HOST_CFLAGS="$(HOST_CFLAGS)" \
+		HOST_CXXFLAGS="$(HOST_CXXFLAGS)" \
+		V8_AR="$(HOSTAR)" \
+		V8_NM="$(HOSTNM)" \
+		V8_CC="clang" \
+		V8_CXX="clang++" \
+		V8_CFLAGS="$(CHROMIUM_HOST_CFLAGS)" \
+		V8_CXXFLAGS="$(CHROMIUM_HOST_CXXFLAGS)" \
+		V8_LDFLAGS="$(CHROMIUM_HOST_LDFLAGS)" \
+		TARGET_AR="ar" \
+		TARGET_NM="nm" \
+		TARGET_CC="clang" \
+		TARGET_CXX="clang++" \
+		TARGET_CFLAGS="$(CHROMIUM_TARGET_CFLAGS)" \
+		TARGET_CXXFLAGS="$(CHROMIUM_TARGET_CXXFLAGS)" \
+		TARGET_LDFLAGS="$(CHROMIUM_TARGET_LDFLAGS)" \
+		out/Release/gn gen out/Release --args="$(CHROMIUM_OPTS)" \
+			--script-executable=$(HOST_DIR)/bin/python2 \
+	)
+endef
+
+define CHROMIUM_BUILD_CMDS
+	( cd $(@D); \
+		$(TARGET_MAKE_ENV) \
+		ninja -j$(PARALLEL_JOBS) -C out/Release chrome chrome_sandbox chromedriver \
+	)
+endef
+
+define CHROMIUM_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/out/Release/chrome $(TARGET_DIR)/usr/lib/chromium/chromium
+	$(INSTALL) -Dm4755 $(@D)/out/Release/chrome_sandbox \
+		$(TARGET_DIR)/usr/lib/chromium/chrome-sandbox
+	cp $(@D)/out/Release/{chrome_{100,200}_percent,resources}.pak \
+		$(@D)/out/Release/{*.bin,chromedriver} \
+		$(TARGET_DIR)/usr/lib/chromium/
+	$(INSTALL) -Dm644 -t $(TARGET_DIR)/usr/lib/chromium/locales \
+		$(@D)/out/Release/locales/*.pak
+	cp $(@D)/out/Release/icudtl.dat $(TARGET_DIR)/usr/lib/chromium/	
+endef
+
+$(eval $(generic-package))
diff --git a/package/chromium/toolchain/BUILD.gn b/package/chromium/toolchain/BUILD.gn
new file mode 100644
index 0000000000..e8525bd67d
--- /dev/null
+++ b/package/chromium/toolchain/BUILD.gn
@@ -0,0 +1,71 @@
+import("//build/toolchain/gcc_toolchain.gni")
+import("//build/config/sysroot.gni")
+
+gcc_toolchain("host") {
+  cc = getenv("HOST_CC")
+  cxx = getenv("HOST_CXX")
+  ar = getenv("HOST_AR")
+  nm = getenv("HOST_NM")
+  ld = cxx
+
+  extra_cflags = getenv("HOST_CFLAGS")
+  extra_cppflags = getenv("HOST_CPPFLAGS")
+  extra_cxxflags = getenv("HOST_CXXFLAGS")
+  extra_ldflags = getenv("HOST_LDFLAGS")
+
+  toolchain_args = {
+    cc_wrapper = ""
+    current_cpu = host_cpu
+    current_os = host_os
+    is_clang = false
+    use_sysroot = false
+    use_lld = false
+  }
+}
+
+gcc_toolchain("target") {
+  cc = getenv("TARGET_CC")
+  cxx = getenv("TARGET_CXX")
+  ar = getenv("TARGET_AR")
+  nm = getenv("TARGET_NM")
+  ld = cxx
+
+  extra_cflags = getenv("TARGET_CFLAGS")
+  extra_cppflags = getenv("TARGET_CPPFLAGS")
+  extra_cxxflags = getenv("TARGET_CXXFLAGS")
+  extra_ldflags = getenv("TARGET_LDFLAGS")
+
+  toolchain_args = {
+    cc_wrapper = ""
+    current_cpu = target_cpu
+    current_os = target_os
+    is_clang = is_clang
+    use_sysroot = use_sysroot
+  }
+}
+
+gcc_toolchain("v8_snapshot") {
+  cc = getenv("V8_CC")
+  cxx = getenv("V8_CXX")
+  ar = getenv("V8_AR")
+  nm = getenv("V8_NM")
+  ld = cxx
+
+  extra_cflags = getenv("V8_CFLAGS")
+  extra_cppflags = getenv("V8_CPPFLAGS")
+  extra_cxxflags = getenv("V8_CXXFLAGS")
+  extra_ldflags = getenv("V8_LDFLAGS")
+
+  toolchain_args = {
+    cc_wrapper = ""
+    if (target_cpu == "x86" || target_cpu == "arm" || target_cpu == "mipsel") {
+      current_cpu = "x86"
+    } else {
+      current_cpu = "x64"
+    }
+    current_os = host_os
+    is_clang = is_clang
+    use_sysroot = false
+  }
+}
+
-- 
2.17.1
