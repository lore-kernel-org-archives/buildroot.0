From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:46 +0200
Subject: [Buildroot] [PATCH 40/49 v2] package/libpjsip: add option to enable
	G.7221 codec
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <78959147dfef22a77faaf939537b7f1b97af3382.1504993178.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We do have a standalone libg7221 package, but pjsip can only use a
bundled version.

Patching pjsip so it can use the standalone version is not trivial, so
we have to live with that... :-(

Fortunately, the library that pjsip installs does not conflict with the
one from the libg7221 package, as it is named differently.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>

---
Changes v1 -> v2:
  - fix variable name  (Adam)
---
 package/libpjsip/Config.in   | 3 +++
 package/libpjsip/libpjsip.mk | 6 +++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 903dd1d693..2e0178c692 100644
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
index 9992e14795..11e2287a1c 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -29,7 +29,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-resample \
 	--disable-video \
 	--disable-opencore-amr \
-	--disable-g7221-codec \
 	--disable-ilbc-codec \
 	--disable-libwebrtc \
 	--disable-opus \
@@ -79,6 +78,11 @@ ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_G722),y)
 LIBPJSIP_CONF_OPTS += --disable-g722-codec
 endif
 
+# libpjsip can only use a bundled version of libg7221
+ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_G7221),y)
+LIBPJSIP_CONF_OPTS += --disable-g7221-codec
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPJSIP_CODEC_GSM),y)
 LIBPJSIP_DEPENDENCIES += libgsm
 LIBPJSIP_CONF_OPTS += --with-external-gsm
-- 
2.11.0
