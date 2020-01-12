From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jan 2020 21:21:02 +0100
Subject: [Buildroot] [git commit] package/alure: add libsndfile decoder
 option
Message-ID: <20200112201134.B420F8B580@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a12c2650a36f7618b6de22dbb5b6aa78d95456b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/alure/Config.in | 6 ++++++
 package/alure/alure.mk  | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/alure/Config.in b/package/alure/Config.in
index 4e26ca4f39..be3f8ebfdd 100644
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
 	select BR2_PACKAGE_LIBOGG
diff --git a/package/alure/alure.mk b/package/alure/alure.mk
index 954990df08..3e88e09664 100644
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
