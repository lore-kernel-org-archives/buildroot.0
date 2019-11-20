From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 20 Nov 2019 17:39:28 +0000
Subject: [Buildroot] [RFC PATCH v3 14/30] package/libcef: Add proprietary
 codecs build option.
In-Reply-To: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
References: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
Message-ID: <20191120173944.130142-15-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michael Drake <michael.drake@codethink.co.uk>

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
index f38bf1967c..3344750b5b 100644
--- a/package/libcef/Config.in
+++ b/package/libcef/Config.in
@@ -53,7 +53,7 @@ config BR2_PACKAGE_LIBCEF
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_COMPILER_RT
 	select BR2_PACKAGE_DBUS
-	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG if !BR2_PACKAGE_LIBCEF_PROPRIETARY_CODECS
 	select BR2_PACKAGE_FLAC
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_HARFBUZZ
@@ -66,6 +66,7 @@ config BR2_PACKAGE_LIBCEF
 	select BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_LIBKRB5
 	select BR2_PACKAGE_LIBNSS
+	select BR2_PACKAGE_LIBOPENH264 if BR2_PACKAGE_LIBCEF_PROPRIETARY_CODECS
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBXSLT
@@ -101,4 +102,11 @@ config BR2_PACKAGE_LIBCEF_VAAPI
 	help
 	  Enables VA-API-based hardware acceleration.
 
+config BR2_PACKAGE_LIBCEF_PROPRIETARY_CODECS
+	bool "Enable proprietary codecs in libcef"
+	help
+	  Enable proprietary codecs in libcef. This uses
+	  the ffmpeg bundled in Chromium, rather than the
+	  ffmpeg buildroot package.
+
 endif
diff --git a/package/libcef/libcef.mk b/package/libcef/libcef.mk
index 784377a71d..7cc4888f44 100644
--- a/package/libcef/libcef.mk
+++ b/package/libcef/libcef.mk
@@ -39,7 +39,6 @@ LIBCEF_DEPENDENCIES = \
 	cairo \
 	compiler-rt \
 	dbus \
-	ffmpeg \
 	flac \
 	fontconfig \
 	freetype \
@@ -109,7 +108,6 @@ LIBCEF_GN_DEFINES = \
 
 # Use Buildroot system libraries instead of Chromium third_party libraries
 LIBCEF_SYSTEM_LIBS = \
-	ffmpeg \
 	flac \
 	fontconfig \
 	freetype \
@@ -118,11 +116,19 @@ LIBCEF_SYSTEM_LIBS = \
 	libwebp \
 	libxml \
 	libxslt \
-	openh264 \
 	yasm
 
 LIBCEF_BUILD_TARGETS = libcef.so chrome_sandbox
 
+ifeq ($(BR2_PACKAGE_LIBCEF_PROPRIETARY_CODECS),y)
+LIBCEF_GN_DEFINES += \
+	ffmpeg_branding=\"Chrome\" \
+	proprietary_codecs=true
+else
+LIBCEF_DEPENDENCIES += ffmpeg
+LIBCEF_SYSTEM_LIBS += ffmpeg
+endif
+
 # We need to set our own flags in addition to the standard Buildroot ones.
 # Chromium may set warning flags that the LLVM toolchain in Buildroot
 # doesn't know about yet, because they use a bleeding edge toolchain.
-- 
2.20.1
