From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  5 Jan 2020 12:32:03 +0100
Subject: [Buildroot] [PATCH 5/6] package/alure: add libsndfile decoder option
In-Reply-To: <20200105113204.30356-1-romain.naour@gmail.com>
References: <20200105113204.30356-1-romain.naour@gmail.com>
Message-ID: <20200105113204.30356-5-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/alure/Config.in | 6 ++++++
 package/alure/alure.mk  | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/alure/Config.in b/package/alure/Config.in
index 20b9e4e4e9..346e607eb8 100644
--- a/package/alure/Config.in
+++ b/package/alure/Config.in
@@ -30,6 +30,12 @@ config BR2_PACKAGE_ALURE_OPUS_DECODER
 	help
 	  Enables the built-in libopusfile decoder.
 
+config BR2_PACKAGE_ALURE_SNDFILE_DECODER
+	bool "sndfile decoder"
+	select BR2_PACKAGE_LIBSNDFILE
+	help
+	  Enables the built-in libsndfile decoder.
+
 config BR2_PACKAGE_ALURE_VORBIS_DECODER
 	bool "vorbis decoder"
 	select BR2_PACKAGE_LIBVORBIS
diff --git a/package/alure/alure.mk b/package/alure/alure.mk
index 1a4509ed6b..74e918f8f3 100644
--- a/package/alure/alure.mk
+++ b/package/alure/alure.mk
@@ -17,7 +17,6 @@ ALURE_DEPENDENCIES = openal
 ALURE_CONF_OPTS = -DALURE_INSTALL=ON \
 	-DALURE_BUILD_EXAMPLES=OFF \
 	-DALURE_ENABLE_MINIMP3=OFF \
-	-DALURE_ENABLE_SNDFILE=OFF \
 	-DALURE_ENABLE_WAVE=ON
 
 ifeq ($(BR2_PACKAGE_ALURE_FLAC_DECODER),y)
@@ -33,6 +32,13 @@ else
 ALURE_CONF_OPTS += -DALURE_ENABLE_OPUS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_ALURE_SNDFILE_DECODER),y)
+ALURE_CONF_OPTS += -DALURE_ENABLE_SNDFILE=ON
+ALURE_DEPENDENCIES += libsndfile
+else
+ALURE_CONF_OPTS += -DALURE_ENABLE_SNDFILE=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_ALURE_VORBIS_DECODER),y)
 ALURE_CONF_OPTS += -DALURE_ENABLE_VORBIS=ON
 ALURE_DEPENDENCIES += libogg libvorbis
-- 
2.24.1
