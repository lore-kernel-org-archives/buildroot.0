From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 17 Oct 2019 16:29:16 +0100
Subject: [Buildroot] [RFC PATCH v2 17/30] package/libcef: Add proprietary
 codecs build option.
In-Reply-To: <20191017152929.49153-1-michael.drake@codethink.co.uk>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
Message-ID: <20191017152929.49153-18-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This uses the Chromium bundled ffmpeg.

Cc: Patrick Glaser <pglaser@tesla.com>
Cc: Jon duSaint <jdusaint@tesla.com>
Cc: Enis Lavery <elavery@tesla.com>
Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/libcef/Config.in | 10 +++++++++-
 package/libcef/libcef.mk | 12 +++++++++---
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/package/libcef/Config.in b/package/libcef/Config.in
index 05d577ecb6..46d412f228 100644
--- a/package/libcef/Config.in
+++ b/package/libcef/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_LIBCEF
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_COMPILER_RT
 	select BR2_PACKAGE_DBUS
-	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG if !BR2_PACKAGE_LIBCEF_PROPRIETARY_CODECS
 	select BR2_PACKAGE_FLAC
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_HARFBUZZ
@@ -39,6 +39,7 @@ config BR2_PACKAGE_LIBCEF
 	select BR2_PACKAGE_LIBGTKGLEXT
 	select BR2_PACKAGE_LIBKRB5
 	select BR2_PACKAGE_LIBNSS
+	select BR2_PACKAGE_LIBOPENH264 if BR2_PACKAGE_LIBCEF_PROPRIETARY_CODECS
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_PCIUTILS
 	select BR2_PACKAGE_PANGO
@@ -74,6 +75,13 @@ config BR2_PACKAGE_LIBCEF_VAAPI
 	help
 	  Enables VA-API-based hardware acceleration.
 
+config BR2_PACKAGE_LIBCEF_PROPRIETARY_CODECS
+	bool "Enable proprietary codecs in libcef"
+	help
+	  Enable proprietary codecs in libcef. This uses
+	  the ffmpeg bundled in Chromium, rather than the
+	  ffmpeg buildroot package.
+
 config BR2_PACKAGE_LIBCEF_TARGET_ARCH
 	string
 	default "arm" if BR2_arm
diff --git a/package/libcef/libcef.mk b/package/libcef/libcef.mk
index 9fa87cbb89..e7a4c2b1a3 100644
--- a/package/libcef/libcef.mk
+++ b/package/libcef/libcef.mk
@@ -42,7 +42,6 @@ LIBCEF_DEPENDENCIES = \
 	cairo \
 	compiler-rt \
 	dbus \
-	ffmpeg \
 	flac \
 	fontconfig \
 	freetype \
@@ -105,7 +104,6 @@ LIBCEF_GN_DEFINES = \
 
 # Use Buildroot system libraries instead of Chromium third_party libraries
 LIBCEF_SYSTEM_LIBS = \
-	ffmpeg \
 	flac \
 	fontconfig \
 	freetype \
@@ -115,11 +113,19 @@ LIBCEF_SYSTEM_LIBS = \
 	libwebp \
 	libxml \
 	libxslt \
-	openh264 \
 	yasm
 
 LIBCEF_BUILD_TARGETS = cef chrome_sandbox
 
+ifeq ($(BR2_PACKAGE_LIBCEF_PROPRIETARY_CODECS),y)
+LIBCEF_GN_DEFINES += \
+	ffmpeg_branding=\"Chrome\" \
+	proprietary_codecs=true
+else
+LIBCEF_DEPENDENCIES += ffmpeg
+LIBCEF_SYSTEM_LIBS += ffmpeg
+endif
+
 # Use the HOSTLD rather than target linker, which warns about host include dirs
 LIBCEF_HOST_LDFLAGS = $(HOST_LDFLAGS) -fuse-ld=$(HOSTLD)
 
-- 
2.20.1
