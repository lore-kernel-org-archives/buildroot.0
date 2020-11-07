From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Nov 2020 18:41:06 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/libass: security
 bump to version 0.15
Message-ID: <20201107174520.7F289870D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57aabd3ca16c299ee51c309f80641d05d0e44b78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

- harfbuzz is mandatory since
  https://github.com/libass/libass/commit/f3e2c97e1818598afb0b1c7010003ffe4823ff21
- Fix CVE-2020-26682 (In libass 0.14.0, the `ass_outline_construct`'s
  call to `outline_stroke` causes a signed integer overflow.) through
  https://github.com/libass/libass/commit/676f9dc5b52ef406c5527bdadbcb947f11392929
  which does not apply cleanly over version 0.14.
  It should be noted that version 0.15 also fixes other integer
  overflows (which have no CVE assigned)
- Update indentation in hash file (two spaces)

https://github.com/libass/libass/releases/tag/0.15.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4ae8ecea8fb042931cebf8f8d4cb4bc891073a77)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in |  8 ++++++++
 package/harfbuzz/Config.in                    |  2 +-
 package/kodi/Config.in                        |  2 ++
 package/libass/Config.in                      |  9 +++++++++
 package/libass/libass.hash                    |  4 ++--
 package/libass/libass.mk                      | 10 ++--------
 6 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 08de5d2188..d4b305f0aa 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -306,8 +306,16 @@ comment "plugins with external dependencies"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASSRENDER
 	bool "assrender"
+	depends on BR2_INSTALL_LIBSTDCPP # libass -> harfbuzz
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libass -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libass -> harfbuzz
 	select BR2_PACKAGE_LIBASS
 
+comment "assrender plugin needs a toolchain w/ C++, gcc => 4.8"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BLUEZ
 	bool "bluez"
 	depends on BR2_USE_WCHAR # bluez5_utils -> libglib2
diff --git a/package/harfbuzz/Config.in b/package/harfbuzz/Config.in
index e8f407bb8f..e283fd831e 100644
--- a/package/harfbuzz/Config.in
+++ b/package/harfbuzz/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_HARFBUZZ
 	  Harfbuzz can make optional use of cairo, freetype,
 	  glib2 and icu packages if they are selected.
 
-comment "harfbuzz needs a toolchain w/ C++, gcc => 4.8"
+comment "harfbuzz needs a toolchain w/ C++, gcc >= 4.8"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index b9eea78d57..daa0dbe5c1 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 
 comment "kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.8"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
@@ -61,6 +62,7 @@ comment "kodi needs an OpenGL EGL backend with OpenGL support"
 menuconfig BR2_PACKAGE_KODI
 	bool "kodi"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libass -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/libass/Config.in b/package/libass/Config.in
index c654d8212a..803f6b4438 100644
--- a/package/libass/Config.in
+++ b/package/libass/Config.in
@@ -1,9 +1,18 @@
 config BR2_PACKAGE_LIBASS
 	bool "libass"
+	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # harfbuzz
 	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_HARFBUZZ
 	select BR2_PACKAGE_LIBFRIBIDI
 	help
 	  libass is a portable subtitle renderer for the ASS/SSA
 	  (Advanced Substation Alpha/Substation Alpha) subtitle format
 
 	  https://github.com/libass/libass
+
+comment "libass needs a toolchain w/ C++, gcc >= 4.8"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/libass/libass.hash b/package/libass/libass.hash
index 74ea5f921d..cd3c3af61c 100644
--- a/package/libass/libass.hash
+++ b/package/libass/libass.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 881f2382af48aead75b7a0e02e65d88c5ebd369fe46bc77d9270a94aa8fd38a2  libass-0.14.0.tar.xz
-sha256 f7e30699d02798351e7f839e3d3bfeb29ce65e44efa7735c225464c4fd7dfe9c  COPYING
+sha256  9f09230c9a0aa68ef7aa6a9e2ab709ca957020f842e52c5b2e52b801a7d9e833  libass-0.15.0.tar.xz
+sha256  f7e30699d02798351e7f839e3d3bfeb29ce65e44efa7735c225464c4fd7dfe9c  COPYING
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index 50600963ed..818bff234e 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASS_VERSION = 0.14.0
+LIBASS_VERSION = 0.15.0
 LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
@@ -15,6 +15,7 @@ LIBASS_LICENSE_FILES = COPYING
 LIBASS_DEPENDENCIES = \
 	host-pkgconf \
 	freetype \
+	harfbuzz \
 	libfribidi \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
@@ -31,11 +32,4 @@ else
 LIBASS_CONF_OPTS += --disable-fontconfig --disable-require-system-font-provider
 endif
 
-ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
-LIBASS_DEPENDENCIES += harfbuzz
-LIBASS_CONF_OPTS += --enable-harfbuzz
-else
-LIBASS_CONF_OPTS += --disable-harfbuzz
-endif
-
 $(eval $(autotools-package))
