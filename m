From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:44 +0100
Subject: [Buildroot] [PATCH 43/52] package/libpjsip: add option to enable
	G.7221 codec
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <46d917016deb7cb9455d4ac5822f2dcc766be233.1483093662.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We do have a standalone libg7221 package, but pjsip can only use a
bundled version.

Patching pjsip so it can use the standalone version is not trivial, so
we have to live with that... :-(

Fortunately, the library that pjsip installs does nto conflict with the
one from the libg7221 package, as it is named differently.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libpjsip/Config.in   | 3 +++
 package/libpjsip/libpjsip.mk | 6 +++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 903dd1d..2e0178c 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -18,6 +18,9 @@ config BR2_PACKAGE_LIBPJSIP_CODEC_G711
 config BR2_PACKAGE_LIBPJSIP_CODEC_G722
 	bool "G.722 codec"
 
+config BR2_PACKAGE_LIBPJSIP_CODEC_G7221
+	bool "G.722.1 codec"
+
 config BR2_PACKAGE_LIBPJSIP_CODEC_GSM
     bool "GSM codec"
     depends on !BR2_STATIC_LIBS # libgsm
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index a7d66f5..c7b4023 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -29,7 +29,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-resample \
 	--disable-video \
 	--disable-opencore-amr \
-	--disable-g7221-codec \
 	--disable-ilbc-codec \
 	--disable-webrtc \
 	--disable-opus \
@@ -75,6 +74,11 @@ ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_G722),y)
 LIBPJSIP_CONF_OPTS += --disable-g722-codec
 endif
 
+# libpjsip can only use a bundled version of libg7221
+ifneq ($(BR2_PACKAGE_LIBPJSIP_G7221_CODEC),y)
+LIBPJSIP_CONF_OPTS += --disable-g7221-codec
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPJSIP_CODEC_GSM),y)
 LIBPJSIP_DEPENDENCIES += libgsm
 LIBPJSIP_CONF_OPTS += --with-external-gsm
-- 
2.7.4
