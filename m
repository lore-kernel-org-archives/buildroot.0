From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 10 Nov 2017 15:20:54 -0500
Subject: [Buildroot] [NEXT 02/17] libpjsip: add enable sound option
In-Reply-To: <20171110202109.25215-1-aduskett@gmail.com>
References: <20171110202109.25215-1-aduskett@gmail.com>
Message-ID: <20171110202109.25215-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the first patch in a series that will enable several features
for libpjsip.  This patch does the following:

- make libpjsip a menuconfig option
- add a option for "Enable sound"

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libpjsip/Config.in   | 11 ++++++++++-
 package/libpjsip/libpjsip.mk |  5 ++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 727d2ec3d0..a39d053e03 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_LIBPJSIP
+menuconfig BR2_PACKAGE_LIBPJSIP
 	bool "libpjsip"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -10,5 +10,14 @@ config BR2_PACKAGE_LIBPJSIP
 
 	  http://www.pjsip.org
 
+if BR2_PACKAGE_LIBPJSIP
+
+config BR2_PACKAGE_LIBPJSIP_SOUND
+	bool "Enable sound"
+	help
+	  Use sound instead of a null device.
+
+endif # BR2_PACKAGE_LIBPJSIP
+
 comment "libpjsip needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index c772d4117a..a9d4ed4ed0 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -25,7 +25,6 @@ LIBPJSIP_CONF_ENV = \
 	CFLAGS="$(LIBPJSIP_CFLAGS)"
 
 LIBPJSIP_CONF_OPTS = \
-	--disable-sound \
 	--disable-gsm-codec \
 	--disable-speex-codec \
 	--disable-speex-aec \
@@ -68,4 +67,8 @@ ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 LIBPJSIP_DEPENDENCIES += util-linux
 endif
 
+ifneq ($(BR2_PACKAGE_LIBPJSIP_SOUND),y)
+LIBPJSIP_CONF_OPTS += --disable-sound
+endif
+
 $(eval $(autotools-package))
-- 
2.13.6
