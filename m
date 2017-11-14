From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 14 Nov 2017 11:07:07 -0500
Subject: [Buildroot] [NEXT v2 2/7] libpjsip: enable alsa support
In-Reply-To: <20171114160712.20086-1-aduskett@gmail.com>
References: <20171114160712.20086-1-aduskett@gmail.com>
Message-ID: <20171114160712.20086-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If alsa-lib is selected, libpjsip should depend on it.
Also, remove --disable-sound in the configure options or else sound would
still be disabled.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Remove the option to enable or disable alsa support in favor of
    just depending on alsa-lib if it's selected by the user.
  
 package/libpjsip/libpjsip.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 2eaefaf..14dbb8e 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -25,7 +25,6 @@ LIBPJSIP_CONF_ENV = \
 	CFLAGS="$(LIBPJSIP_CFLAGS)"
 
 LIBPJSIP_CONF_OPTS = \
-	--disable-sound \
 	--disable-gsm-codec \
 	--disable-speex-codec \
 	--disable-speex-aec \
@@ -67,4 +66,8 @@ ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 LIBPJSIP_DEPENDENCIES += util-linux
 endif
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+LIBPJSIP_DEPENDENCIES += alsa-lib
+endif
+
 $(eval $(autotools-package))
-- 
2.13.6
