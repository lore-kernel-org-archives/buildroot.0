From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 12 Mar 2018 05:29:52 -0400
Subject: [Buildroot] [PATCH v4 6/7] libpjsip: enable opus codec
In-Reply-To: <20180312092953.24258-1-aduskett@gmail.com>
References: <20180312092953.24258-1-aduskett@gmail.com>
Message-ID: <20180312092953.24258-6-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v4:
  - Add each codec with a dependency as a seperate patch.

 package/libpjsip/Config.in   | 4 ++++
 package/libpjsip/libpjsip.mk | 7 ++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index a7bbd866ea..028339f319 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -53,6 +53,10 @@ config BR2_PACKAGE_LIBPJSIP_CODEC_OPENCORE_AMR
 	bool "Opencore-amr"
 	select BR2_PACKAGE_OPENCORE_AMR
 
+config BR2_PACKAGE_LIBPJSIP_CODEC_OPUS
+	bool "Opus"
+	select BR2_PACKAGE_OPUS
+
 endif #BR2_PACKAGE_LIBPJSIP
 
 comment "libpjsip needs a toolchain w/ C++, threads"
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 2ea0da3f77..943a99bc5a 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -30,7 +30,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-resample \
 	--disable-video \
 	--disable-libwebrtc \
-	--disable-opus \
 	--disable-oss \
 	--disable-ext-sound \
 	--disable-libsamplerate \
@@ -115,4 +114,10 @@ else
 LIBPJSIP_CONF_OPTS += --disable-opencore-amr
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPJSIP_CODEC_OPUS),y)
+LIBPJSIP_DEPENDENCIES += opus
+else
+LIBPJSIP_CONF_OPTS += --disable-opus
+endif
+
 $(eval $(autotools-package))
-- 
2.14.3
