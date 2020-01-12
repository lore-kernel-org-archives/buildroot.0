From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jan 2020 21:21:02 +0100
Subject: [Buildroot] [git commit] package/alure: add libvorbis decoder option
Message-ID: <20200112201134.A808A8B580@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94621a02cae99a5ae288fd123a7991712705c285
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/alure/Config.in | 7 +++++++
 package/alure/alure.mk  | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/alure/Config.in b/package/alure/Config.in
index 7947e30a1f..4e26ca4f39 100644
--- a/package/alure/Config.in
+++ b/package/alure/Config.in
@@ -30,6 +30,13 @@ config BR2_PACKAGE_ALURE_OPUS_DECODER
 	help
 	  Enables the built-in libopusfile decoder.
 
+config BR2_PACKAGE_ALURE_VORBIS_DECODER
+	bool "vorbis decoder"
+	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_LIBVORBIS
+	help
+	  Enables the built-in libvorbis decoder.
+
 endif
 
 comment "alure needs a toolchain w/ C++, gcc >= 4.9, NPTL, wchar"
diff --git a/package/alure/alure.mk b/package/alure/alure.mk
index 8d01282ccf..954990df08 100644
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
