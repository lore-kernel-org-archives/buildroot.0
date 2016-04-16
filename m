From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Apr 2016 12:55:18 +0200
Subject: [Buildroot] [PATCH v14 27/27] package/freeswitch: enable video
	support
In-Reply-To: <1460804118-4900-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460804118-4900-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1460804118-4900-28-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/Config.in     | 16 +++++++++++++++-
 package/freeswitch/freeswitch.mk | 40 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
index 3824a09..f1a6f69 100644
--- a/package/freeswitch/Config.in
+++ b/package/freeswitch/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_FREESWITCH
+menuconfig BR2_PACKAGE_FREESWITCH
 	bool "freeswitch"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # apr, included in freeswitch source
@@ -21,6 +21,20 @@ config BR2_PACKAGE_FREESWITCH
 
 	  https://www.freeswitch.org
 
+if BR2_PACKAGE_FREESWITCH
+
+config BR2_PACKAGE_FREESWITCH_MODULE_VIDEO
+	bool "Video support"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libyuv (in-tree)
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_AVRESAMPLE
+	select BR2_PACKAGE_FFMPEG_SWSCALE
+
+comment "Video support needs a toolchain w/ gcc >= 4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
+endif
+
 comment "freeswitch needs a toolchain w/ C++, dynamic library, threads, wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS \
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 9337214..a48868a 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -68,8 +68,6 @@ FREESWITCH_CONF_ENV += \
 	ac_cv_gcc_supports_w_no_unused_result=no
 
 FREESWITCH_CONF_OPTS = \
-	--disable-libvpx \
-	--disable-libyuv \
 	--without-erlang \
 	--enable-fhs \
 	--without-python \
@@ -284,4 +282,42 @@ ifeq ($(BR2_PACKAGE_XZ),y)
 FREESWITCH_DEPENDENCIES += xz
 endif
 
+ifeq ($(BR2_PACKAGE_FREESWITCH_MODULE_VIDEO),y)
+FREESWITCH_LICENSE += BSD-3c (libvpx, libyuv)
+FREESWITCH_LICENSE_FILES += libs/libvpx/LICENSE libs/libyuv/LICENSE
+FREESWITCH_CONF_OPTS += --enable-libvpx --enable-libyuv
+FREESWITCH_DEPENDENCIES += host-yasm ffmpeg
+FREESWITCH_ENABLED_MODULES += applications/mod_av
+FREESWITCH_ENABLED_MODULES += applications/mod_fsv
+
+# freeswitch uses its own copy of libvpx since 1.6.7
+# the implementation of libvpx into the freeswitch build system is not
+# cross-compile friendly so we compile libvpx ourselves by copying
+# most of packages/libvpx/libvpx.mk here, added by some --disable-
+# options from freeswitch-1.6.7/Makefile.am, line 536
+define FREESWITCH_CROSS_COMPILE_LIBVPX
+	(cd $(@D)/libs/libvpx && \
+	$(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_CONFIGURE_ARGS) \
+	LD="$(TARGET_CC)" \
+	CROSS=$(GNU_TARGET_NAME) \
+	./configure \
+		--target=generic-gnu \
+		--enable-pic \
+		--prefix=/usr \
+		--disable-docs \
+		--disable-examples \
+		--disable-install-bins \
+		--disable-install-srcs \
+		--disable-unit-tests \
+		--extra-cflags="-fvisibility=hidden" \
+	)
+	$(TARGET_MAKE_ENV) $(LIBVPX_MAKE_ENV) $(MAKE) -C $(@D)/libs/libvpx
+endef
+FREESWITCH_POST_CONFIGURE_HOOKS += FREESWITCH_CROSS_COMPILE_LIBVPX
+
+else
+FREESWITCH_CONF_OPTS += --disable-libvpx --disable-libyuv
+endif
+
 $(eval $(autotools-package))
-- 
2.8.0.rc3
