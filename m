From: Romain Naour <romain.naour@openwide.fr>
Date: Sun,  1 Nov 2015 19:07:46 +0100
Subject: [Buildroot] [PATCH v6 10/33] package/efl/libefl: add frame buffer
	config option
In-Reply-To: <1446401289-9059-1-git-send-email-romain.naour@openwide.fr>
References: <1446401289-9059-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1446401289-9059-11-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an config option to enable frame buffer support
in the efl libraries.

From the README [1]:
This requires linux frame-buffer support, headers etc. This supports
basic frame-buffers like /dev/fb as well as input via /dev/input for
keyboards and mice in a basic way.

There is a bug eina_module_load().
From [2]:
When running terminology, a message appears in eina_module_load with:
could not dlopen("/usr/lib/ecore_evas/engines/fb/v-1.15/module.so",
Error relocating /usr/lib/ecore_evas/engines/fb/v-1.15/module.so:
ecore_fb_ts_shutdown: symbol not found): RTLD_NOW
It seems like the EAPI macro has no effect...

A patch from Ross Vandegrift has been posted on enlightenment mailing
list [3], but it's not yet an upstream patch.

[1] https://git.enlightenment.org/core/efl.git/tree/README?id=v1.15.2#n521
[2] http://sourceforge.net/p/enlightenment/mailman/message/34493376
[3] http://sourceforge.net/p/enlightenment/mailman/message/34492801

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
v6: squash with the patch adding the fix provided by Vicente Bergas.
v4: rename to libefl
    improve commit log
---
 ...ecore_fb_private.h-define-EAPI-before-use.patch | 64 ++++++++++++++++++++++
 package/efl/libefl/Config.in                       |  5 ++
 package/efl/libefl/libefl.mk                       |  8 ++-
 3 files changed, 75 insertions(+), 2 deletions(-)
 create mode 100644 package/efl/libefl/0001-ecore_fb_private.h-define-EAPI-before-use.patch

diff --git a/package/efl/libefl/0001-ecore_fb_private.h-define-EAPI-before-use.patch b/package/efl/libefl/0001-ecore_fb_private.h-define-EAPI-before-use.patch
new file mode 100644
index 0000000..81d14f9
--- /dev/null
+++ b/package/efl/libefl/0001-ecore_fb_private.h-define-EAPI-before-use.patch
@@ -0,0 +1,64 @@
+From 2fb4fdf641e67e49b87a3524038a694c8dd0ba4e Mon Sep 17 00:00:00 2001
+From: Vicente Bergas <vicencb@gmail.com>
+Date: Fri, 9 Oct 2015 23:35:20 +0200
+Subject: [PATCH] ecore_fb_private.h: define EAPI before use
+
+From [1]:
+When running terminology, a message appears in eina_module_load with:
+could not dlopen("/usr/lib/ecore_evas/engines/fb/v-1.15/module.so",
+Error relocating /usr/lib/ecore_evas/engines/fb/v-1.15/module.so:
+ecore_fb_ts_shutdown: symbol not found): RTLD_NOW
+It seems like the EAPI macro has no effect...
+
+A patch from Ross Vandegrift has been posted on enlightenment mailing
+list [2], but it's not yet an upstream patch.
+
+[1] http://sourceforge.net/p/enlightenment/mailman/message/34493376
+[2] http://sourceforge.net/p/enlightenment/mailman/message/34492801
+
+Signed-off-by: Vicente Bergas <vicencb@gmail.com>
+[Romain:
+  - Add a commit log
+  - Add a link to the enlightenment mailing list
+  - Add Vicente's SoB line]
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ src/lib/ecore_fb/ecore_fb_private.h | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/src/lib/ecore_fb/ecore_fb_private.h b/src/lib/ecore_fb/ecore_fb_private.h
+index f7dc0c6..f54c8d2 100644
+--- a/src/lib/ecore_fb/ecore_fb_private.h
++++ b/src/lib/ecore_fb/ecore_fb_private.h
+@@ -33,6 +33,20 @@
+ 
+ #include <Ecore_Fb.h>
+ 
++#ifdef EAPI
++# undef EAPI
++#endif
++
++#ifdef __GNUC__
++# if __GNUC__ >= 4
++#  define EAPI __attribute__ ((visibility("default")))
++# else
++#  define EAPI
++# endif
++#else
++# define EAPI
++#endif
++
+ /* ecore_fb_li.c */
+ struct _Ecore_Fb_Input_Device
+ {
+@@ -92,4 +106,7 @@ void ecore_fb_vt_shutdown(void);
+ #define TS_GET_CAL 0x8014660a
+ #endif
+   
++#undef EAPI
++#define EAPI
++
+ #endif
+-- 
+2.4.3
+
diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
index 0b89411..4a202a0 100644
--- a/package/efl/libefl/Config.in
+++ b/package/efl/libefl/Config.in
@@ -84,6 +84,11 @@ config BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG
 	    support of removable devices etc... and disabling this will
 	    hurt support for Enlightenment and its filemanager.
 
+comment "libecore video support"
+
+config BR2_PACKAGE_LIBEFL_FB
+	bool "FB support"
+
 comment "libevas loaders"
 
 config BR2_PACKAGE_LIBEFL_PNG
diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
index e479cfc..5adbfd6 100644
--- a/package/efl/libefl/libefl.mk
+++ b/package/efl/libefl/libefl.mk
@@ -30,7 +30,6 @@ LIBEFL_GETTEXTIZE = YES
 
 # Configure options:
 # --disable-cxx-bindings: disable C++11 bindings.
-# --disable-fb: disable frame buffer support.
 # --disable-image-loader-jp2k: disable JPEG 2000 support.
 # --disable-sdl: disable sdl2 support.
 # --disable-systemd: disable systemd support.
@@ -42,7 +41,6 @@ LIBEFL_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
 	--disable-cxx-bindings \
-	--disable-fb \
 	--disable-image-loader-jp2k \
 	--disable-sdl \
 	--disable-systemd \
@@ -144,6 +142,12 @@ else
 LIBEFL_CONF_OPTS += --disable-wayland
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEFL_FB),y)
+LIBEFL_CONF_OPTS += --enable-fb
+else
+LIBEFL_CONF_OPTS += --disable-fb
+endif
+
 # Loaders that need external dependencies needs to be --enable-XXX=yes
 # otherwise the default is '=static'.
 # All other loaders are statically built-in
-- 
2.4.3
