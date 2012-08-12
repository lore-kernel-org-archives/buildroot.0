From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:54:24 +0200
Subject: [Buildroot] [PATCH 36/36] package/qemu: enable a static build
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-36-git-send-email-yann.morin.1998@free.fr>
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
 package/qemu/Config.in             |   20 ++++++++++++++------
 package/qemu/qemu-static-sdl.patch |   31 +++++++++++++++++++++++++++++++
 package/qemu/qemu.mk               |    4 ++++
 3 files changed, 49 insertions(+), 6 deletions(-)
 create mode 100644 package/qemu/qemu-static-sdl.patch

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index e51b045..f4cb57a 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -96,11 +96,11 @@ config BR2_PACKAGE_QEMU_VNC_JPEG
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
@@ -123,11 +123,11 @@ config BR2_PACKAGE_QEMU_CURSES
 config BR2_PACKAGE_QEMU_SPICE
 	bool "Enable Spice frontend"
 	depends on BR2_PACKAGE_SPICE
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_PACKAGE_QEMU_STATIC
 	help
 	  Say 'y' here to have QEMU support Spice as a (VNC-like) frontend.
 
-if !BR2_PACKAGE_SPICE || BR2_PREFER_STATIC_LIB
+if !BR2_PACKAGE_SPICE || BR2_PACKAGE_QEMU_STATIC
 comment "Spice support requires spice-server,"
 comment "and does not work for static linking."
 endif
@@ -150,13 +150,13 @@ config BR2_PACKAGE_QEMU_VIRTFS
 
 config BR2_PACKAGE_QEMU_CURL
 	bool "Enable remote block-devices using cURL"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_PACKAGE_QEMU_STATIC
 	select BR2_PACKAGE_LIBCURL
 	help
 	  Say 'y' to access remote block-devices using libcurl.
 
 comment "cURL support is not possible with static linking"
-    depends on BR2_PREFER_STATIC_LIB
+    depends on BR2_PACKAGE_QEMU_STATIC
 
 config BR2_PACKAGE_QEMU_ISCSI
 	bool "Enable remote block-devices using iSCSI"
@@ -255,6 +255,14 @@ config BR2_PACKAGE_QEMU_KEYMAPS
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
 
 comment "QEMU requires python"
diff --git a/package/qemu/qemu-static-sdl.patch b/package/qemu/qemu-static-sdl.patch
new file mode 100644
index 0000000..3dc9dbe
--- /dev/null
+++ b/package/qemu/qemu-static-sdl.patch
@@ -0,0 +1,31 @@
+configure: fix detection for SDL libs when static linking
+
+If using pkg-config, we must use '--static --libs', not '--stati-libs'
+which is solely for sdl-config.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN qemu-1.1.1.orig//configure qemu-1.1.1/configure
+--- qemu-1.1.1.orig//configure	2012-07-17 20:11:14.000000000 +0200
++++ qemu-1.1.1/configure	2012-07-30 16:40:21.248942557 +0200
+@@ -1546,9 +1546,11 @@
+ 
+ if $pkg_config sdl --modversion >/dev/null 2>&1; then
+   sdlconfig="$pkg_config sdl"
++  sdlconfig_staticlibs="--static --libs"
+   _sdlversion=`$sdlconfig --modversion 2>/dev/null | sed 's/[^0-9]//g'`
+ elif has ${sdl_config}; then
+   sdlconfig="$sdl_config"
++  sdlconfig_staticlibs="--static-libs"
+   _sdlversion=`$sdlconfig --version | sed 's/[^0-9]//g'`
+ else
+   if test "$sdl" = "yes" ; then
+@@ -1569,7 +1571,7 @@
+ EOF
+   sdl_cflags=`$sdlconfig --cflags 2> /dev/null`
+   if test "$static" = "yes" ; then
+-    sdl_libs=`$sdlconfig --static-libs 2>/dev/null`
++    sdl_libs=`$sdlconfig $sdlconfig_staticlibs 2>/dev/null`
+   else
+     sdl_libs=`$sdlconfig --libs 2> /dev/null`
+   fi
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index a6ae5e1..d5f32f4 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -25,6 +25,10 @@ QEMU_LIBS = -lrt -lm
 QEMU_OPTS =
 QEMU_VARS =
 
+ifeq ($(BR2_PACKAGE_QEMU_STATIC),y)
+QEMU_OPTS += --static
+endif
+
 ifeq ($(BR2_PACKAGE_QEMU_SYSTEM),y)
 QEMU_OPTS += --enable-system
 else
-- 
1.7.2.5
