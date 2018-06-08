From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri,  8 Jun 2018 15:59:32 -0700
Subject: [Buildroot] [RFC PATCH 8/8] chromium: new package
In-Reply-To: <20180608225932.13127-1-joseph.kogut@gmail.com>
References: <20180608225932.13127-1-joseph.kogut@gmail.com>
Message-ID: <20180608225932.13127-9-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 DEVELOPERS                          |   1 +
 package/Config.in                   |   1 +
 package/chromium/Config.in          |  43 ++++++++++
 package/chromium/chromium.hash      |   4 +
 package/chromium/chromium.mk        | 125 ++++++++++++++++++++++++++++
 package/chromium/toolchain/BUILD.gn |  72 ++++++++++++++++
 6 files changed, 246 insertions(+)
 create mode 100644 package/chromium/Config.in
 create mode 100644 package/chromium/chromium.hash
 create mode 100644 package/chromium/chromium.mk
 create mode 100644 package/chromium/toolchain/BUILD.gn

diff --git a/DEVELOPERS b/DEVELOPERS
index 568f47d242..19d3aafe91 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -957,6 +957,7 @@ F:	configs/qemu_ppc64le_pseries_defconfig
 N:	Joseph Kogut <joseph.kogut@gmail.com>
 F:	package/at-spi2-atk/
 F:	package/at-spi2-core/
+F:	package/chromium/
 F:	package/gconf/
 F:	package/libnss/
 F:	package/python-cython/
diff --git a/package/Config.in b/package/Config.in
index c2e619b317..0458c513f2 100644
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
diff --git a/package/chromium/Config.in b/package/chromium/Config.in
new file mode 100644
index 0000000000..8bc9eb5d5c
--- /dev/null
+++ b/package/chromium/Config.in
@@ -0,0 +1,43 @@
+config BR2_PACKAGE_CHROMIUM
+	bool "chromium"
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_CUPS
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_HARFBUZZ
+	select BR2_PACKAGE_HOST_CLANG
+	select BR2_PACKAGE_HOST_LLVM_ENABLE_HOST_ARCH
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
index 0000000000..bb579262cd
--- /dev/null
+++ b/package/chromium/chromium.hash
@@ -0,0 +1,4 @@
+# locally calculated
+sha256 37e6673741b365a25a837217b08f77b24b4f5fc4ad88c8581be6a5dae9a9e919  chromium-66.0.3359.181.tar.xz
+sha256 845022e0c1db1abb41a6ba4cd3c4b674ec290f3359d9d3c78ae558d4c0ed9308  LICENSE
+
diff --git a/package/chromium/chromium.mk b/package/chromium/chromium.mk
new file mode 100644
index 0000000000..72c965700a
--- /dev/null
+++ b/package/chromium/chromium.mk
@@ -0,0 +1,125 @@
+###############################################################################
+#
+# Chromium
+#
+###############################################################################
+
+CHROMIUM_VERSION = 66.0.3359.181
+CHROMIUM_SITE = https://commondatastorage.googleapis.com/chromium-browser-official
+CHROMIUM_SOURCE = chromium-$(CHROMIUM_VERSION).tar.xz
+CHROMIUM_LICENSE = BSD-Style
+CHROMIUM_LICENSE_FILES = LICENSE
+CHROMIUM_DEPENDENCIES = alsa-lib cups dbus freetype harfbuzz \
+			host-clang host-ninja host-nodejs host-python \
+			jpeg libdrm libglib2 libkrb5 libnss libpng pciutils \
+			xlib_libXcomposite xlib_libXScrnSaver xlib_libXcursor \
+			xlib_libXrandr zlib
+
+CHROMIUM_TOOLCHAIN_CONFIG_PATH = "$(shell pwd)/package/chromium/toolchain"
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
+CHROMIUM_TARGET_LDFLAGS += --gcc-toolchain="$(TOOLCHAIN_EXTERNAL_INSTALL_DIR)"
+else
+CHROMIUM_TARGET_LDFLAGS += --gcc-toolchain="$(HOST_DIR)"
+endif
+
+CHROMIUM_HOST_CFLAGS += --target=$(GNU_TARGET_NAME)
+CHROMIUM_HOST_LDFLAGS += --gcc-toolchain="/usr"
+
+define CHROMIUM_CONFIGURE_CMDS
+	mkdir -p $(@D)/third_party/node/linux/node-linux-x64/bin
+	ln -sf $(HOST_DIR)/bin/node $(@D)/third_party/node/linux/node-linux-x64/bin/
+	ln -sf $(HOST_DIR)/bin/llvm-link $(HOST_DIR)/bin/lld
+
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
index 0000000000..c2c5c3e49c
--- /dev/null
+++ b/package/chromium/toolchain/BUILD.gn
@@ -0,0 +1,72 @@
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
+    use_lld = false
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
+    is_clang = false
+    use_sysroot = false
+  }
+}
+
-- 
2.17.1
