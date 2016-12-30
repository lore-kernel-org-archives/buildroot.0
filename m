From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:41 +0100
Subject: [Buildroot] [PATCH 40/52] package/libpjsip: add option to enable
	SPEEX codec
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <9a142168a9f661962aeaa110f4c3ff699f73231c.1483093662.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libpjsip/Config.in   | 4 ++++
 package/libpjsip/libpjsip.mk | 9 +++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index ce15a20..0bb446e 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -20,6 +20,10 @@ config BR2_PACKAGE_LIBPJSIP_CODEC_GSM
 comment "GSM codec needs a toolchain w/ shared libraries"
     depends on BR2_STATIC_LIBS
 
+config BR2_PACKAGE_LIBPJSIP_CODEC_SPEEX
+	bool "Speex codec"
+	select BR2_PACKAGE_SPEEX
+
 endif # BR2_PACKAGE_LIBPJSIP
 
 comment "libpjsip needs a toolchain w/ C++, threads"
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 3396422..ce96c55 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -26,8 +26,6 @@ LIBPJSIP_CONF_ENV = \
 
 LIBPJSIP_CONF_OPTS = \
 	--disable-sound \
-	--disable-speex-codec \
-	--disable-speex-aec \
 	--disable-resample \
 	--disable-video \
 	--disable-opencore-amr \
@@ -78,4 +76,11 @@ else
 LIBPJSIP_CONF_OPTS += --disable-gsm-codec
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPJSIP_CODEC_SPEEX),y)
+LIBPJSIP_DEPENDENCIES += speex
+LIBPJSIP_CONF_OPTS += --with-external-speex
+else
+LIBPJSIP_CONF_OPTS += --disable-speex-codec --disable-speex-aec
+endif
+
 $(eval $(autotools-package))
-- 
2.7.4
