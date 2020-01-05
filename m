From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  5 Jan 2020 12:32:01 +0100
Subject: [Buildroot] [PATCH 3/6] package/alure: add opus decoder option
In-Reply-To: <20200105113204.30356-1-romain.naour@gmail.com>
References: <20200105113204.30356-1-romain.naour@gmail.com>
Message-ID: <20200105113204.30356-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The opus option is available only when libogg is
detected by the build system.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/alure/Config.in | 7 +++++++
 package/alure/alure.mk  | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/alure/Config.in b/package/alure/Config.in
index df86ff2a92..7947e30a1f 100644
--- a/package/alure/Config.in
+++ b/package/alure/Config.in
@@ -23,6 +23,13 @@ config BR2_PACKAGE_ALURE_FLAC_DECODER
 	help
 	  Enables the built-in FLAC decoder.
 
+config BR2_PACKAGE_ALURE_OPUS_DECODER
+	bool "opus decoder"
+	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_OPUS
+	help
+	  Enables the built-in libopusfile decoder.
+
 endif
 
 comment "alure needs a toolchain w/ C++, gcc >= 4.9, NPTL, wchar"
diff --git a/package/alure/alure.mk b/package/alure/alure.mk
index 233d21529d..32f3df5349 100644
--- a/package/alure/alure.mk
+++ b/package/alure/alure.mk
@@ -17,7 +17,6 @@ ALURE_DEPENDENCIES = openal
 ALURE_CONF_OPTS = -DALURE_INSTALL=ON \
 	-DALURE_BUILD_EXAMPLES=OFF \
 	-DALURE_ENABLE_MINIMP3=OFF \
-	-DALURE_ENABLE_OPUS=OFF \
 	-DALURE_ENABLE_SNDFILE=OFF \
 	-DALURE_ENABLE_VORBIS=OFF \
 	-DALURE_ENABLE_WAVE=ON
@@ -28,6 +27,13 @@ else
 ALURE_CONF_OPTS += -DALURE_ENABLE_FLAC=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_ALURE_OPUS_DECODER),y)
+ALURE_CONF_OPTS += -DALURE_ENABLE_OPUS=ON
+ALURE_DEPENDENCIES += libogg opus
+else
+ALURE_CONF_OPTS += -DALURE_ENABLE_OPUS=OFF
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 ALURE_CONF_OPTS += -DALURE_BUILD_SHARED=OFF \
 	-DALURE_BUILD_STATIC=ON
-- 
2.24.1
