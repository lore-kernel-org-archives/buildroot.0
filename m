From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 10 Jun 2016 06:59:17 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/freeswitch: enable video support
Message-ID: <1465534757-13884-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: simplified cross compilation using an external toolchain by using
    CROSS=$(TARGET_CROSS) (Thomas)
v2: various changes after review by Thomas:
    - removed Config.in option BR2_PACKAGE_FREESWITCH_MODULE_VIDEO
    - removed menuconfig
    - simplified compilation of bundled libvpx

 package/freeswitch/0001-libvpx-cross.patch | 29 +++++++++++++++++++++++++++++
 package/freeswitch/Config.in               |  2 ++
 package/freeswitch/freeswitch.mk           | 13 +++++++++++--
 3 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 package/freeswitch/0001-libvpx-cross.patch

diff --git a/package/freeswitch/0001-libvpx-cross.patch b/package/freeswitch/0001-libvpx-cross.patch
new file mode 100644
index 0000000..a2583da
--- /dev/null
+++ b/package/freeswitch/0001-libvpx-cross.patch
@@ -0,0 +1,29 @@
+Fix cross-compiling libvpx
+
+Freeswitch since version 1.6.7 only uses an in-tree-version of libvpx:
+https://freeswitch.org/fisheye/changelog/freeswitch?cs=febe0f8dacea2d2a31902b3dc469be757f8c3c4d
+
+It is not possible to use an external version of libvpx anymore.
+Unfortunately the freeswitch build system has no support for cross-
+compiling libvpx so we need to patch Makefile to pass CROSS from
+package/freeswitch/freeswitch.mk and add target=generic-gnu as
+configure parameter:
+https://freeswitch.org/stash/projects/FS/repos/freeswitch/browse/libs/libvpx/README#110
+
+And yes, autoreconf is also broken, so we patch Makefile.in instead
+of Makefile.am.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr freeswitch-1.6.7.org/Makefile.in freeswitch-1.6.7/Makefile.in
+--- freeswitch-1.6.7.org/Makefile.in	2016-04-01 18:09:54.000000000 +0200
++++ freeswitch-1.6.7/Makefile.in	2016-04-22 20:11:37.938961730 +0200
+@@ -3491,7 +3491,7 @@
+ 	cd libs/libzrtp && $(MAKE)
+ 
+ libs/libvpx/Makefile:
+-	cd libs/libvpx && CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" ./configure --enable-pic --disable-docs --disable-examples --disable-install-bins --disable-install-srcs --disable-unit-tests --extra-cflags="$(VISIBILITY_FLAG)"
++	cd libs/libvpx && CROSS=$(CROSS) CC="$(CC)" CXX="$(CXX)" CFLAGS="$(CFLAGS)" CXXFLAGS="$(CXXFLAGS)" LDFLAGS="$(LDFLAGS)" ./configure --target=generic-gnu --enable-pic --disable-docs --disable-examples --disable-install-bins --disable-install-srcs --disable-unit-tests --extra-cflags="$(VISIBILITY_FLAG)"
+ 
+ libs/libvpx/libvpx.a: libs/libvpx/Makefile
+ 	@cd libs/libvpx && $(MAKE)
diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index 6049af3..0156afd 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_FREESWITCH
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # apr, included in freeswitch source
 	depends on BR2_USE_WCHAR # libuuid
+	select BR2_PACKAGE_FFMPEG_AVRESAMPLE if BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_SWSCALE if BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_JPEG
 	# src/mod/applications/mod_cv/mod_cv.cpp includes
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 03ef8bc..ffc358b 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -69,8 +69,6 @@ FREESWITCH_CONF_ENV += \
 	ac_cv_gcc_supports_w_no_unused_result=no
 
 FREESWITCH_CONF_OPTS = \
-	--disable-libvpx \
-	--disable-libyuv \
 	--without-erlang \
 	--enable-fhs \
 	--without-python \
@@ -284,4 +282,15 @@ ifeq ($(BR2_PACKAGE_XZ),y)
 FREESWITCH_DEPENDENCIES += xz
 endif
 
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8)$(BR2_PACKAGE_FFMPEG),yy)
+FREESWITCH_LICENSE := $(FREESWITCH_LICENSE) BSD-3c (libvpx, libyuv)
+FREESWITCH_LICENSE_FILES += libs/libvpx/LICENSE libs/libyuv/LICENSE
+FREESWITCH_CONF_OPTS += --enable-libvpx --enable-libyuv
+FREESWITCH_DEPENDENCIES += host-yasm ffmpeg
+FREESWITCH_ENABLED_MODULES += applications/mod_av applications/mod_fsv
+FREESWITCH_MAKE_ENV += CROSS=$(TARGET_CROSS)
+else
+FREESWITCH_CONF_OPTS += --disable-libvpx --disable-libyuv
+endif
+
 $(eval $(autotools-package))
-- 
2.8.1
