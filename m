From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Feb 2013 15:07:05 +0100
Subject: [Buildroot] [PATCH 28/29] package/qemu: enable a static build
In-Reply-To: <cover.1359899108.git.yann.morin.1998@free.fr>
References: <cover.1359899108.git.yann.morin.1998@free.fr>
Message-ID: <b3d1e6d341cc43e81edc402399e77a26c239039e.1359899108.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
It can be useful to have a statically-linked QEMU (especially the
linux-user and bsd-user emulators) to avoid run-time issues with
dynamically-loaded libraries.

There is an issue where QEMU could not be able to properly (re)map
libraries in memory due to some overlap between its own memory
mappings and the mappings of the user application being translated
(it's a complex issue, so don't count on me to properly explain it,
I did not understood it completely either... :-/ ).
---
 package/qemu/Config.in              |   37 ++++++++++++++----
 package/qemu/qemu-static-curl.patch |   72 +++++++++++++++++++++++++++++++++++
 package/qemu/qemu-static-sdl.patch  |   54 ++++++++++++++++++++++++++
 package/qemu/qemu.mk                |    4 ++
 4 files changed, 159 insertions(+), 8 deletions(-)
 create mode 100644 package/qemu/qemu-static-curl.patch
 create mode 100644 package/qemu/qemu-static-sdl.patch

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 65fec49..b2b43d9 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -86,11 +86,11 @@ config BR2_PACKAGE_QEMU_VNC_JPEG
 config BR2_PACKAGE_QEMU_VNC_TLS
 	bool "TLS encryption"
 	depends on BR2_PACKAGE_QEMU_VNC
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_PACKAGE_QEMU_STATIC
 	select BR2_PACKAGE_GNUTLS
 
 comment "VNC TLS encryption does not work for static link"
-    depends on BR2_PACKAGE_QEMU_VNC && BR2_PREFER_STATIC_LIB
+    depends on BR2_PACKAGE_QEMU_VNC && BR2_PACKAGE_QEMU_STATIC
 
 config BR2_PACKAGE_QEMU_SDL
 	bool "Enable SDL frontend"
@@ -113,11 +113,21 @@ config BR2_PACKAGE_QEMU_CURSES
 config BR2_PACKAGE_QEMU_SPICE
 	bool "Enable Spice frontend"
 	depends on BR2_PACKAGE_SPICE
+	depends on !BR2_PACKAGE_QEMU_STATIC || BR2_PREFER_STATIC_LIB
 	help
 	  Say 'y' here to have QEMU support Spice as a (VNC-like) frontend.
 
-comment "Spice support requires spice-server"
-	depends on !BR2_PACKAGE_SPICE
+	  Note:
+	    Spice links against alsa-libs, but alsa-libs can't be built both
+	    shared and static at the same time, so we can not link with a
+	    static spice to get a static QEMU (BR2_PACKAGE_QEMU_STATIC) if
+	    buildroot as a whole does not also build only static libraries
+	    (BR2_PREFER_STATIC_LIB).
+
+if !BR2_PACKAGE_SPICE || ( BR2_PACKAGE_QEMU_STATIC && !BR2_PREFER_STATIC_LIB )
+comment "Spice support requires spice-server, and does not work for a static"
+comment "build of QEMU unless BR2_PREFER_STATIC_LIB is set, too"
+endif
 
 comment "Block backends"
 
@@ -137,14 +147,10 @@ config BR2_PACKAGE_QEMU_VIRTFS
 
 config BR2_PACKAGE_QEMU_CURL
 	bool "Enable remote block-devices using cURL"
-	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_PACKAGE_LIBCURL
 	help
 	  Say 'y' to access remote block-devices using libcurl.
 
-comment "cURL support is not possible with static linking"
-    depends on BR2_PREFER_STATIC_LIB
-
 config BR2_PACKAGE_QEMU_ISCSI
 	bool "Enable remote block-devices using iSCSI"
 	select BR2_PACKAGE_LIBISCSI
@@ -208,14 +214,21 @@ config BR2_PACKAGE_QEMU_MIXEMU
 	help
 	  Say 'y' here to have QEMU emulate a mixer device.
 
+# Alsa can not build both shared and static libs at the same time.
+# But we may want to build QEMU staticaly, even though the global
+# BR2_PREFER_STATIC_LIB is not set. Disable that case.
 config BR2_PACKAGE_QEMU_SOUND_ALSA
 	bool "Enable sound via alsa"
+	depends on !BR2_PACKAGE_QEMU_STATIC || BR2_PREFER_STATIC_LIB
 	select BR2_PACKAGE_ALSA_LIB
 	help
 	  Say 'y' here to have QEMU play sound from the VMs via alsa.
 	  
 	  Note: this is only for system emulation, not user emulation.
 
+comment "Alsa sound static link works only if BR2_PREFER_STATIC is set"
+	depends on BR2_PACKAGE_QEMU_STATIC && !BR2_PREFER_STATIC_LIB
+
 config BR2_PACKAGE_QEMU_SOUND_SDL
 	bool "Enable sound via SDL"
 	select BR2_PACKAGE_QEMU_SDL # Requires that SDL frontend be selected
@@ -289,4 +302,12 @@ config BR2_PACKAGE_QEMU_KEYMAPS
 	    - 'de fr* en-*' for german, french and english keymaps
 	    - and so on (see the QEMU source for all supported keymaps)
 
+config BR2_PREFER_STATIC_LIB
+    select BR2_PACKAGE_QEMU_STATIC
+
+config BR2_PACKAGE_QEMU_STATIC
+	bool "Build statically"
+	help
+	  Build static qemu executable(s).
+
 endif # BR2_PACKAGE_QEMU
diff --git a/package/qemu/qemu-static-curl.patch b/package/qemu/qemu-static-curl.patch
new file mode 100644
index 0000000..24931bd
--- /dev/null
+++ b/package/qemu/qemu-static-curl.patch
@@ -0,0 +1,72 @@
+configure: fix detection for cURL libs when static linking
+
+Currently, to check for cURL, configure uses either pkg-config (the default),
+or curl-config (as a fallback).
+
+But curl-config and pkg-config do not have the same set of options:
+  - to check for shared libs, both use the option: --libs
+  - to check for static libs:
+    - pkg-config uses: --static --libs
+    - curl-config uses: --static-libs
+
+To add to the complexity, pkg-config is called through the querry_pkg_config
+wrapper, that already passes --static when static linking is required, but
+there is no such wrapper for curl-config, so we miss the occasion to pass
+--static-libs
+
+To fix this:
+  - introduce a new variable QEMU_XXX_CONFIG_LIBS_FLAGS that mirrors the
+    behavior of QEMU_PKG_CONFIG_FLAGS; this variable can be used by all
+    xxx-config scripts (eg. curl-config, but later sdl-config too).
+    Default it to '--libs', which is for shared linking;
+  - properly use either --libs for pkg-config (--static is already takend
+    care of in the wrapper), or $QEMU_XXX_CONFIG_LIBS_FLAGS for
+    curl-config.
+    
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Patch sent upstream:
+    http://lists.nongnu.org/archive/html/qemu-trivial/2012-08/msg00165.html
+
+diff --git a/configure b/configure
+index d97fd81..e6a7c14 100755
+--- a/configure
++++ b/configure
+@@ -124,7 +124,7 @@
+ cc_i386=i386-pc-linux-gnu-gcc
+ libs_qga=""
+ debug_info="yes"
+-
++QEMU_XXX_CONFIG_LIBS_FLAGS="--libs"
+ # Don't accept a target_list environment variable.
+ unset target_list
+ 
+@@ -614,6 +614,7 @@
+     static="yes"
+     LDFLAGS="-static $LDFLAGS"
+     QEMU_PKG_CONFIG_FLAGS="--static $QEMU_PKG_CONFIG_FLAGS"
++    QEMU_XXX_CONFIG_LIBS_FLAGS="--static-libs"
+   ;;
+   --mandir=*) mandir="$optarg"
+   ;;
+@@ -2051,8 +2052,10 @@
+ 
+ if $pkg_config libcurl --modversion >/dev/null 2>&1; then
+   curlconfig="$pkg_config libcurl"
++  curlconfiglibs="--libs"
+ else
+   curlconfig=curl-config
++  curlconfiglibs="$QEMU_XXX_CONFIG_LIBS_FLAGS"
+ fi
+ 
+ if test "$curl" != "no" ; then
+@@ -2061,7 +2064,7 @@
+ int main(void) { curl_easy_init(); curl_multi_setopt(0, 0, 0); return 0; }
+ EOF
+   curl_cflags=`$curlconfig --cflags 2>/dev/null`
+-  curl_libs=`$curlconfig --libs 2>/dev/null`
++  curl_libs=`$curlconfig $curlconfiglibs 2>/dev/null`
+   if compile_prog "$curl_cflags" "$curl_libs" ; then
+     curl=yes
+     libs_tools="$curl_libs $libs_tools"
diff --git a/package/qemu/qemu-static-sdl.patch b/package/qemu/qemu-static-sdl.patch
new file mode 100644
index 0000000..c14513c
--- /dev/null
+++ b/package/qemu/qemu-static-sdl.patch
@@ -0,0 +1,54 @@
+configure: fix detection for SDL libs when static linking
+
+Currently, configure checks for SDL libs with either pkg-config (the
+default), or with sdl-config (as a fallback).
+
+As for cURL (previous patch), sdl-config does not have the same set of
+options as pkg-config:
+  - to check for shared libs, both use the option: --libs
+  - to check for static libs:
+    - pkg-config uses: --static --libs
+    - curl-config uses: --static-libs
+
+Fix that by using the previously introduced $QEMU_XXX_CONFIG_LIBS_FLAGS
+variable, the way ot was done previously for cURL.
+
+Also, simplify the code-path for checking for SDL libs with a single,
+non-conditional call to $sdlconfig, which is either pkg-config or
+sdl-config, as checked just above.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Patch sent upstream:
+    http://lists.nongnu.org/archive/html/qemu-trivial/2012-08/msg00166.html
+
+diff --git a/configure b/configure
+index e6a7c14..6bfedc7 100755
+--- a/configure
++++ b/configure
+@@ -1620,9 +1620,11 @@
+ 
+ if $pkg_config sdl --modversion >/dev/null 2>&1; then
+   sdlconfig="$pkg_config sdl"
++  sdlconfiglibs="--libs"
+   _sdlversion=`$sdlconfig --modversion 2>/dev/null | sed 's/[^0-9]//g'`
+ elif has ${sdl_config}; then
+   sdlconfig="$sdl_config"
++  sdlconfiglibs="$QEMU_XXX_CONFIG_LIBS_FLAGS"
+   _sdlversion=`$sdlconfig --version | sed 's/[^0-9]//g'`
+ else
+   if test "$sdl" = "yes" ; then
+@@ -1642,11 +1644,7 @@
+ int main( void ) { return SDL_Init (SDL_INIT_VIDEO); }
+ EOF
+   sdl_cflags=`$sdlconfig --cflags 2> /dev/null`
+-  if test "$static" = "yes" ; then
+-    sdl_libs=`$sdlconfig --static-libs 2>/dev/null`
+-  else
+-    sdl_libs=`$sdlconfig --libs 2> /dev/null`
+-  fi
++  sdl_libs=`$sdlconfig $sdlconfiglibs 2> /dev/null`
+   if compile_prog "$sdl_cflags" "$sdl_libs" ; then
+     if test "$_sdlversion" -lt 121 ; then
+       sdl_too_old=yes
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index d3541cf..376032a 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -274,6 +274,10 @@ else
 QEMU_OPTS += --disable-docs
 endif
 
+ifeq ($(BR2_PACKAGE_QEMU_STATIC),y)
+QEMU_OPTS += --static
+endif
+
 # Post-install removal of unwanted keymaps:
 # - if we want 'all', we do nothing;
 # - if we want none, we completely remove the keymap dir
-- 
1.7.2.5
