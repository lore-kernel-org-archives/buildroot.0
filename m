From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:41 +0200
Subject: [Buildroot] [PATCH 35/49 v2] package/libpjsip: add option to enable
	GSM codec
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <577822438ab319654ee5eaa73ec0b4f96b3a8434.1504993178.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libpjsip/Config.in   | 12 ++++++++++++
 package/libpjsip/libpjsip.mk | 14 +++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 727d2ec3d0..ce15a20567 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -10,5 +10,17 @@ config BR2_PACKAGE_LIBPJSIP
 
 	  http://www.pjsip.org
 
+if BR2_PACKAGE_LIBPJSIP
+
+config BR2_PACKAGE_LIBPJSIP_CODEC_GSM
+    bool "GSM codec"
+    depends on !BR2_STATIC_LIBS # libgsm
+    select BR2_PACKAGE_LIBGSM
+
+comment "GSM codec needs a toolchain w/ shared libraries"
+    depends on BR2_STATIC_LIBS
+
+endif # BR2_PACKAGE_LIBPJSIP
+
 comment "libpjsip needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 4e2da7d32d..9b25dad2f8 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -26,7 +26,6 @@ LIBPJSIP_CONF_ENV = \
 
 LIBPJSIP_CONF_OPTS = \
 	--disable-sound \
-	--disable-gsm-codec \
 	--disable-speex-codec \
 	--disable-speex-aec \
 	--disable-resample \
@@ -70,4 +69,17 @@ ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 LIBPJSIP_DEPENDENCIES += util-linux
 endif
 
+# Codecs can only be disabled. If explictly enabled, the check is
+# omitted (but successful), and there is no configure trace "Checking
+# if [codec] codec is disabled...no". So we only explicitly disable it
+# and we do not explictly enable it, so we get the configure log in
+# both cases.
+
+ifeq ($(BR2_PACKAGE_LIBPJSIP_CODEC_GSM),y)
+LIBPJSIP_DEPENDENCIES += libgsm
+LIBPJSIP_CONF_OPTS += --with-external-gsm
+else
+LIBPJSIP_CONF_OPTS += --disable-gsm-codec
+endif
+
 $(eval $(autotools-package))
-- 
2.11.0
