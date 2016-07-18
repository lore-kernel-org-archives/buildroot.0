From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 18 Jul 2016 22:51:26 +0200
Subject: [Buildroot] [PATCHv2 1/2] package/efl: enable Eolian languages
	bindings
Message-ID: <1468875087-17192-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eolian languages bindings needs C++11, so we needs at least a gcc 4.8
for the host and target variant.
The C++11 support with gcc 4.7 is not sufficient.

Build eolian_cxx for the host only if Eolian support for the target is
selected.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: - add help text
    - rename the option to BR2_PACKAGE_EFL_EOLIAN_CPP since it enable
      the Eolian C++ bindings. The Eolian code generator is already
      available.
    - Move --with-eolian-cxx under BR2_PACKAGE_EFL_EOLIAN_CPP=y
    - Fix the comment about host eolian_cxx
---
 package/efl/Config.in | 12 ++++++++++++
 package/efl/efl.mk    | 22 +++++++++++++++++-----
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index ee1a39d..a4cb332 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -121,6 +121,18 @@ config BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG
 comment "Warning: one of the recommended option for EFL is not enabled"
 	depends on !BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG
 
+config BR2_PACKAGE_EFL_EOLIAN_CPP
+	bool "Enable Eolian C++ bindings"
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # Eolian (host) needs C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # Eolian needs C++11
+	help
+	  Eolian is an EO object parser and code genrator.
+	  Whith this option enabled Eolian will handle automatic generation
+	  of EFL bindings for C++11 language.
+
+comment "Eolian needs host and target gcc >= 4.8"
+	depends on !BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 comment "libecore video support"
 
 config BR2_PACKAGE_EFL_FB
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index fd06246..066592f 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -23,7 +23,6 @@ EFL_DEPENDENCIES = host-pkgconf host-efl host-luajit dbus freetype \
 	jpeg luajit udev util-linux zlib
 
 # Configure options:
-# --disable-cxx-bindings: disable C++11 bindings.
 # --disable-lua-old: build elua for the target.
 # --disable-sdl: disable sdl2 support.
 # --disable-systemd: disable systemd support.
@@ -33,7 +32,6 @@ EFL_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 	--with-elua=$(HOST_DIR)/usr/bin/elua \
 	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
-	--disable-cxx-bindings \
 	--disable-lua-old \
 	--disable-sdl \
 	--disable-systemd \
@@ -45,6 +43,13 @@ ifeq ($(BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG),)
 EFL_CONF_OPTS += --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-abb
 endif
 
+ifeq ($(BR2_PACKAGE_EFL_EOLIAN_CPP),y)
+EFL_CONF_OPTS += --enable-cxx-bindings \
+	--with-eolian-cxx=$(HOST_DIR)/usr/bin/eolian_cxx
+else
+EFL_CONF_OPTS += --disable-cxx-bindings
+endif
+
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
 EFL_DEPENDENCIES += util-linux
 EFL_CONF_OPTS += --enable-libmount
@@ -216,7 +221,8 @@ $(eval $(autotools-package))
 ################################################################################
 
 # We want to build only some host tools used later in the build.
-# Actually we want: edje_cc, embryo_cc and eet.
+# Actually we want: edje_cc, eet and embryo_cc. eolian_cxx is build only
+# if selected for the target.
 
 # Host dependencies:
 # * host-dbus: for Eldbus
@@ -234,9 +240,16 @@ HOST_EFL_DEPENDENCIES = \
 	host-luajit \
 	host-zlib
 
+# Enable Eolian language bindings to provide eolian_cxx tool for the host which
+# is required to build Eolian language bindings for the target.
+ifeq ($(BR2_PACKAGE_EFL_EOLIAN_CPP),y)
+HOST_EFL_CONF_OPTS += --enable-cxx-bindings
+else
+HOST_EFL_CONF_OPTS += --disable-cxx-bindings
+endif
+
 # Configure options:
 # --disable-audio, --disable-multisense remove libsndfile dependency.
-# --disable-cxx-bindings: disable C++11 bindings.
 # --disable-fontconfig: remove dependency on fontconfig.
 # --disable-fribidi: remove dependency on libfribidi.
 # --disable-gstreamer1: remove dependency on gtreamer 1.0.
@@ -251,7 +264,6 @@ HOST_EFL_DEPENDENCIES = \
 #   Yes I really know what I am doing.
 HOST_EFL_CONF_OPTS += \
 	--disable-audio \
-	--disable-cxx-bindings \
 	--disable-fontconfig \
 	--disable-fribidi \
 	--disable-gstreamer1 \
-- 
2.5.5
