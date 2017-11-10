From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 10 Nov 2017 15:21:01 -0500
Subject: [Buildroot] [NEXT 09/17] libpjsip: add G.711 codec
In-Reply-To: <20171110202109.25215-1-aduskett@gmail.com>
References: <20171110202109.25215-1-aduskett@gmail.com>
Message-ID: <20171110202109.25215-9-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no enable-codecs in configure, so instead, disable them if
they aren't selected instead of enabling them if they are.

Add the internal codecs first, start with G.711.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libpjsip/Config.in   |  5 +++++
 package/libpjsip/libpjsip.mk | 10 +++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 0e21aa65a7..8ff8d12b4f 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -56,6 +56,11 @@ comment "v4l2 support needs headers >= 3.0"
 
 endif # BR2_PACKAGE_LIBPJSIP_VIDEO
 
+comment "dependency-less codecs"
+
+config BR2_PACKAGE_LIBPJSIP_CODEC_G711
+	bool "G.711"
+
 endif # BR2_PACKAGE_LIBPJSIP
 
 comment "libpjsip needs a toolchain w/ C++, threads"
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index ce0ae59acd..761a9c01b6 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -35,7 +35,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-libwebrtc \
 	--disable-opus \
 	--disable-ext-sound \
-	--disable-g711-codec \
 	--disable-l16-codec \
 	--disable-g722-codec \
 	--disable-libsamplerate \
@@ -97,4 +96,13 @@ else
 LIBPJSIP_CONF_OPTS += --disable-v4l2
 endif
 
+# Codecs can only be disabled. If explictly enabled, the check is
+# omitted (but successful), and there is no configure trace "Checking
+# if [codec] codec is disabled...no". So we only explicitly disable it
+# and we do not explictly enable it, so we get the configure log in
+# both cases.
+ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_G711),y)
+LIBPJSIP_CONF_OPTS += --disable-g711-codec
+endif
+
 $(eval $(autotools-package))
-- 
2.13.6
