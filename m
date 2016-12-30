From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:45 +0100
Subject: [Buildroot] [PATCH 44/52] package/libpjsip: add option to enable
	iLBC codec
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <2f4b43cc04b31219a1c6980704b8d7bd3b5654b2.1483093662.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We do have a standalone libgilbc package, but pjsip can only use a
bundled version.

Patching pjsip so it can use the standalone version is not trivial, so
we have to live with that... :-(

Fortunately, the library that pjsip installs does nto conflict with the
one from the libilbc package, as it is named differently.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libpjsip/Config.in   | 3 +++
 package/libpjsip/libpjsip.mk | 6 +++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 2e0178c..c7cdd68 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -29,6 +29,9 @@ config BR2_PACKAGE_LIBPJSIP_CODEC_GSM
 comment "GSM codec needs a toolchain w/ shared libraries"
     depends on BR2_STATIC_LIBS
 
+config BR2_PACKAGE_LIBPJSIP_CODEC_ILBC
+	bool "iLBC codec"
+
 config BR2_PACKAGE_LIBPJSIP_CODEC_SPEEX
 	bool "Speex codec"
 	select BR2_PACKAGE_SPEEX
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index c7b4023..67329eb 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -29,7 +29,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-resample \
 	--disable-video \
 	--disable-opencore-amr \
-	--disable-ilbc-codec \
 	--disable-webrtc \
 	--disable-opus \
 	--disable-epoll \
@@ -86,6 +85,11 @@ else
 LIBPJSIP_CONF_OPTS += --disable-gsm-codec
 endif
 
+# libpjsip can only use a bundled version of libgilbc
+ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_ILBC),y)
+LIBPJSIP_CONF_OPTS += --disable-ilbc-codec
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPJSIP_CODEC_SPEEX),y)
 LIBPJSIP_DEPENDENCIES += speex
 LIBPJSIP_CONF_OPTS += --with-external-speex
-- 
2.7.4
