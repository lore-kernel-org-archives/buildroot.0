From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  5 Jan 2020 12:32:00 +0100
Subject: [Buildroot] [PATCH 2/6] package/alure: add flac decoder option
In-Reply-To: <20200105113204.30356-1-romain.naour@gmail.com>
References: <20200105113204.30356-1-romain.naour@gmail.com>
Message-ID: <20200105113204.30356-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alure doesn't use/need flac package as dependency.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/alure/Config.in | 9 +++++++++
 package/alure/alure.mk  | 7 ++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/alure/Config.in b/package/alure/Config.in
index 4acd66d2ee..df86ff2a92 100644
--- a/package/alure/Config.in
+++ b/package/alure/Config.in
@@ -16,6 +16,15 @@ config BR2_PACKAGE_ALURE
 
 	  https://kcat.strangesoft.net/alure.html
 
+if BR2_PACKAGE_ALURE
+
+config BR2_PACKAGE_ALURE_FLAC_DECODER
+	bool "flac decoder"
+	help
+	  Enables the built-in FLAC decoder.
+
+endif
+
 comment "alure needs a toolchain w/ C++, gcc >= 4.9, NPTL, wchar"
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP \
diff --git a/package/alure/alure.mk b/package/alure/alure.mk
index c3bf5d31cf..233d21529d 100644
--- a/package/alure/alure.mk
+++ b/package/alure/alure.mk
@@ -16,13 +16,18 @@ ALURE_DEPENDENCIES = openal
 # Enable at least one built-in decoder (wave).
 ALURE_CONF_OPTS = -DALURE_INSTALL=ON \
 	-DALURE_BUILD_EXAMPLES=OFF \
-	-DALURE_ENABLE_FLAC=OFF \
 	-DALURE_ENABLE_MINIMP3=OFF \
 	-DALURE_ENABLE_OPUS=OFF \
 	-DALURE_ENABLE_SNDFILE=OFF \
 	-DALURE_ENABLE_VORBIS=OFF \
 	-DALURE_ENABLE_WAVE=ON
 
+ifeq ($(BR2_PACKAGE_ALURE_FLAC_DECODER),y)
+ALURE_CONF_OPTS += -DALURE_ENABLE_FLAC=ON
+else
+ALURE_CONF_OPTS += -DALURE_ENABLE_FLAC=OFF
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 ALURE_CONF_OPTS += -DALURE_BUILD_SHARED=OFF \
 	-DALURE_BUILD_STATIC=ON
-- 
2.24.1
