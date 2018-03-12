From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 12 Mar 2018 05:29:47 -0400
Subject: [Buildroot] [PATCH v4 1/7] libpjsip: Add Alsa option
Message-ID: <20180312092953.24258-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the first patch in a series that will enable audio support
for libpjsip. This patch does the following:

- Turn libpjsip into a menuconfig option
- Add a option for alsa support

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Remove the option to enable or disable alsa support in favor of
    just depending on alsa-lib if it's selected by the user.

Changes v2 -> v3:
  - Make this patch the start of the series.
  - Re-add the option to enable or disable support (Thomas)

Changes v3 -> v4:
  - None

 package/libpjsip/Config.in   | 12 +++++++++++-
 package/libpjsip/libpjsip.mk |  8 +++++++-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 727d2ec3d0..0e03ebf7a3 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_LIBPJSIP
+menuconfig BR2_PACKAGE_LIBPJSIP
 	bool "libpjsip"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -10,5 +10,15 @@ config BR2_PACKAGE_LIBPJSIP
 
 	  http://www.pjsip.org
 
+if BR2_PACKAGE_LIBPJSIP
+
+comment "sound"
+
+config BR2_PACKAGE_LIBPJSIP_ALSA
+	bool "alsa support"
+	select BR2_PACKAGE_ALSA_LIB
+
+endif #BR2_PACKAGE_LIBPJSIP
+
 comment "libpjsip needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 53b654d072..a584e8c73a 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -25,7 +25,6 @@ LIBPJSIP_CONF_ENV = \
 	CFLAGS="$(LIBPJSIP_CFLAGS)"
 
 LIBPJSIP_CONF_OPTS = \
-	--disable-sound \
 	--disable-gsm-codec \
 	--disable-speex-codec \
 	--disable-speex-aec \
@@ -67,4 +66,11 @@ ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 LIBPJSIP_DEPENDENCIES += util-linux
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPJSIP_ALSA),y)
+LIBPJSIP_DEPENDENCIES += alsa-lib
+LIBPJSIP_CONF_OPTS += --enable-sound
+else
+LIBPJSIP_CONF_OPTS += --disable-sound
+endif
+
 $(eval $(autotools-package))
-- 
2.14.3
