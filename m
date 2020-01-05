From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  5 Jan 2020 12:32:02 +0100
Subject: [Buildroot] [PATCH 4/6] package/alure: add libvorbis decoder option
In-Reply-To: <20200105113204.30356-1-romain.naour@gmail.com>
References: <20200105113204.30356-1-romain.naour@gmail.com>
Message-ID: <20200105113204.30356-4-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/alure/Config.in | 7 +++++++
 package/alure/alure.mk  | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/alure/Config.in b/package/alure/Config.in
index 7947e30a1f..20b9e4e4e9 100644
--- a/package/alure/Config.in
+++ b/package/alure/Config.in
@@ -30,6 +30,13 @@ config BR2_PACKAGE_ALURE_OPUS_DECODER
 	help
 	  Enables the built-in libopusfile decoder.
 
+config BR2_PACKAGE_ALURE_VORBIS_DECODER
+	bool "vorbis decoder"
+	select BR2_PACKAGE_LIBVORBIS
+	select BR2_PACKAGE_OPUS
+	help
+	  Enables the built-in libvorbis decoder.
+
 endif
 
 comment "alure needs a toolchain w/ C++, gcc >= 4.9, NPTL, wchar"
diff --git a/package/alure/alure.mk b/package/alure/alure.mk
index 32f3df5349..1a4509ed6b 100644
--- a/package/alure/alure.mk
+++ b/package/alure/alure.mk
@@ -18,7 +18,6 @@ ALURE_CONF_OPTS = -DALURE_INSTALL=ON \
 	-DALURE_BUILD_EXAMPLES=OFF \
 	-DALURE_ENABLE_MINIMP3=OFF \
 	-DALURE_ENABLE_SNDFILE=OFF \
-	-DALURE_ENABLE_VORBIS=OFF \
 	-DALURE_ENABLE_WAVE=ON
 
 ifeq ($(BR2_PACKAGE_ALURE_FLAC_DECODER),y)
@@ -34,6 +33,13 @@ else
 ALURE_CONF_OPTS += -DALURE_ENABLE_OPUS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_ALURE_VORBIS_DECODER),y)
+ALURE_CONF_OPTS += -DALURE_ENABLE_VORBIS=ON
+ALURE_DEPENDENCIES += libogg libvorbis
+else
+ALURE_CONF_OPTS += -DALURE_ENABLE_VORBIS=OFF
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 ALURE_CONF_OPTS += -DALURE_BUILD_SHARED=OFF \
 	-DALURE_BUILD_STATIC=ON
-- 
2.24.1
