From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:42 +0100
Subject: [Buildroot] [PATCH 41/52] package/libpjsip: add option to enable
	G.711 codec
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <324cc5cfb6a74de3be5f7b2260443e8877615ae9.1483093662.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libpjsip/Config.in   | 3 +++
 package/libpjsip/libpjsip.mk | 5 ++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 0bb446e..1c9d2ce 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -12,6 +12,9 @@ config BR2_PACKAGE_LIBPJSIP
 
 if BR2_PACKAGE_LIBPJSIP
 
+config BR2_PACKAGE_LIBPJSIP_CODEC_G711
+	bool "G.711 codec"
+
 config BR2_PACKAGE_LIBPJSIP_CODEC_GSM
     bool "GSM codec"
     depends on !BR2_STATIC_LIBS # libgsm
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index ce96c55..dd279d3 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -38,7 +38,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-ext-sound \
 	--disable-small-filter \
 	--disable-large-filter \
-	--disable-g711-codec \
 	--disable-l16-codec \
 	--disable-g722-codec \
 	--disable-libsamplerate \
@@ -69,6 +68,10 @@ endif
 # and we do not explictly enable it, so we get the configure log in
 # both cases.
 
+ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_G711),y)
+LIBPJSIP_CONF_OPTS += --disable-g711-codec
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPJSIP_CODEC_GSM),y)
 LIBPJSIP_DEPENDENCIES += libgsm
 LIBPJSIP_CONF_OPTS += --with-external-gsm
-- 
2.7.4
