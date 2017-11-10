From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 10 Nov 2017 15:20:55 -0500
Subject: [Buildroot] [NEXT 03/17] libpjsip: add alsa option
In-Reply-To: <20171110202109.25215-1-aduskett@gmail.com>
References: <20171110202109.25215-1-aduskett@gmail.com>
Message-ID: <20171110202109.25215-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libpjsip/Config.in   | 8 ++++++++
 package/libpjsip/libpjsip.mk | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index a39d053e03..a289c90a92 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -17,6 +17,14 @@ config BR2_PACKAGE_LIBPJSIP_SOUND
 	help
 	  Use sound instead of a null device.
 
+if BR2_PACKAGE_LIBPJSIP_SOUND
+
+config BR2_PACKAGE_LIBPJSIP_ALSA
+	bool "alsa support"
+	select BR2_PACKAGE_ALSA_LIB
+
+endif # BR2_PACKAGE_LIBPJSIP_SOUND
+
 endif # BR2_PACKAGE_LIBPJSIP
 
 comment "libpjsip needs a toolchain w/ C++, threads"
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index a9d4ed4ed0..f354cd3538 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -71,4 +71,8 @@ ifneq ($(BR2_PACKAGE_LIBPJSIP_SOUND),y)
 LIBPJSIP_CONF_OPTS += --disable-sound
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPJSIP_ALSA),y)
+LIBPJSIP_DEPENDENCIES += alsa-lib
+endif
+
 $(eval $(autotools-package))
-- 
2.13.6
