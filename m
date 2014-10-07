From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Oct 2014 00:38:38 +0200
Subject: [Buildroot] [PATCH 29/30] package/qemu: enable a static build
In-Reply-To: <cover.1412719495.git.yann.morin.1998@free.fr>
References: <cover.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <e45680bfaa5fd3a3595df5903dd22d5de8af7b39.1412719495.git.yann.morin.1998@free.fr>
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
 package/qemu/Config.in                   | 44 ++++++++++++++++----
 package/qemu/qemu-0000-static-curl.patch | 69 ++++++++++++++++++++++++++++++++
 package/qemu/qemu-0001-static-sdl.patch  | 53 ++++++++++++++++++++++++
 package/qemu/qemu.mk                     |  4 ++
 4 files changed, 162 insertions(+), 8 deletions(-)
 create mode 100644 package/qemu/qemu-0000-static-curl.patch
 create mode 100644 package/qemu/qemu-0001-static-sdl.patch

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 48ee4bf..d9ec754 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -72,6 +72,11 @@ config BR2_PACKAGE_QEMU_TOOLS_ON_TARGET
 	  Say 'y' here to also install QEMU tools (qemu-{img,io,nbd}) on the
 	  target.
 
+config BR2_PACKAGE_QEMU_STATIC
+	bool "Build statically"
+	help
+	  Build static qemu executable(s).
+
 if QEMU_HAS_EMULS
 
 comment "Frontends"
@@ -98,11 +103,11 @@ config BR2_PACKAGE_QEMU_VNC_JPEG
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
@@ -125,11 +130,21 @@ config BR2_PACKAGE_QEMU_CURSES
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
 
@@ -149,14 +164,10 @@ config BR2_PACKAGE_QEMU_VIRTFS
 
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
@@ -185,13 +196,18 @@ comment "Networking"
 
 config BR2_PACKAGE_QEMU_BLUEZ
 	bool "Enable BlueZ connectivity"
+	depends on !BR2_PACKAGE_QEMU_STATIC && !BR2_PREFER_STATIC
 	depends on BR2_PACKAGE_BLUEZ_UTILS
 	help
 	  Say 'y' here to enable BlueZ (bluetooth) connectivity in QEMU.
 
 comment "BlueZ connectivity depends on bluez-utils"
+	depends on !BR2_PACKAGE_QEMU_STATIC && !BR2_PREFER_STATIC
 	depends on !BR2_PACKAGE_BLUEZ_UTILS
 
+comment "BlueZ connectivity does not work for static link"
+	depends on BR2_PACKAGE_QEMU_STATIC || BR2_PREFER_STATIC
+
 config BR2_PACKAGE_QEMU_VDE
 	bool "Enable VDE"
 	select BR2_PACKAGE_VDE2
@@ -201,14 +217,21 @@ config BR2_PACKAGE_QEMU_VDE
 
 comment "Sound"
 
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
@@ -279,3 +302,8 @@ config BR2_PACKAGE_QEMU_KEYMAPS
 endif # QEMU_HAS_EMULS
 
 endif # BR2_PACKAGE_QEMU
+
+# We can't have this in the conditional block, above, or we'd have
+# a cyclic dependency
+config BR2_PREFER_STATIC_LIB
+    select BR2_PACKAGE_QEMU_STATIC if BR2_PACKAGE_QEMU
diff --git a/package/qemu/qemu-0000-static-curl.patch b/package/qemu/qemu-0000-static-curl.patch
new file mode 100644
index 0000000..d92c51a
--- /dev/null
+++ b/package/qemu/qemu-0000-static-curl.patch
@@ -0,0 +1,69 @@
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
+diff -durN qemu-1.6.0.orig/configure qemu-1.6.0/configure
+--- a/configure	2013-08-15 21:56:23.000000000 +0200
++++ b/configure	2014-03-01 23:58:48.780791885 +0100
+@@ -210,6 +210,7 @@
+ libs_qga=""
+ debug_info="yes"
+ stack_protector=""
++QEMU_XXX_CONFIG_LIBS_FLAGS="--libs"
+ 
+ # Don't accept a target_list environment variable.
+ unset target_list
+@@ -786,6 +787,7 @@
+     static="yes"
+     LDFLAGS="-static $LDFLAGS"
+     QEMU_PKG_CONFIG_FLAGS="--static $QEMU_PKG_CONFIG_FLAGS"
++    QEMU_XXX_CONFIG_LIBS_FLAGS="--static-libs"
+   ;;
+   --mandir=*) mandir="$optarg"
+   ;;
+@@ -2644,15 +2646,17 @@
+ if test "$curl" != "no" ; then
+   if $pkg_config libcurl --exists; then
+     curlconfig="$pkg_config libcurl"
++    curlconfiglibs="--libs"
+   else
+     curlconfig=curl-config
++    curlconfiglibs="$QEMU_XXX_CONFIG_LIBS_FLAGS"
+   fi
+   cat > $TMPC << EOF
+ #include <curl/curl.h>
+ int main(void) { curl_easy_init(); curl_multi_setopt(0, 0, 0); return 0; }
+ EOF
+   curl_cflags=`$curlconfig --cflags 2>/dev/null`
+-  curl_libs=`$curlconfig --libs 2>/dev/null`
++  curl_libs=`$curlconfig $curlconfiglibs 2>/dev/null`
+   if compile_prog "$curl_cflags" "$curl_libs" ; then
+     curl=yes
+   else
diff --git a/package/qemu/qemu-0001-static-sdl.patch b/package/qemu/qemu-0001-static-sdl.patch
new file mode 100644
index 0000000..fca6171
--- /dev/null
+++ b/package/qemu/qemu-0001-static-sdl.patch
@@ -0,0 +1,53 @@
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
+diff -durN qemu-2.1.2.orig/configure qemu-2.1.2/configure
+--- qemu-2.1.2.orig/configure	2014-09-25 21:54:52.000000000 +0200
++++ qemu-2.1.2/configure	2014-10-03 22:00:12.168024393 +0200
+@@ -2114,9 +2114,11 @@
+ 
+ if $pkg_config $sdlname --exists; then
+   sdlconfig="$pkg_config $sdlname"
++  sdlconfiglibs="--libs"
+   _sdlversion=`$sdlconfig --modversion 2>/dev/null | sed 's/[^0-9]//g'`
+ elif has ${sdl_config}; then
+   sdlconfig="$sdl_config"
++  sdlconfiglibs="$QEMU_XXX_CONFIG_LIBS_FLAGS"
+   _sdlversion=`$sdlconfig --version | sed 's/[^0-9]//g'`
+ else
+   if test "$sdl" = "yes" ; then
+@@ -2136,11 +2138,7 @@
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
index 5d2b03f..a4d00e1 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -272,6 +272,10 @@ else
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
1.9.1
