From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 10:28:12 +0100
Subject: [Buildroot] [git commit] package/ffmpeg: bump version to 3.4.1
Message-ID: <20171218094601.93214834E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6695c41d396ff7b2b2354bada4d5c0452664b10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Configure options for libnut & libschroedinger were removed:
http://git.videolan.org/?p=ffmpeg.git;a=commit;h=a3deeaade32db5a1b736b8d3365e52254f3fa6ac
http://git.videolan.org/?p=ffmpeg.git;a=commit;h=220b24c7c97dc033ceab1510549f66d0e7b52ef1

Upstream now prefers NASM assembler over YASM:
http://git.videolan.org/?p=ffmpeg.git;a=commit;h=4f9297ac3b39098547863d28fbc8d2a906d5be49

Added configure options for alsa support:
http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=b447629093d75f18d0a8fc44ec768022322b2182

Added configure options for libiconv:
http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=fe9c85e4e2650dc9537b54b1eabb4f9be7b628ed

Added license hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.hash |  5 ++++-
 package/ffmpeg/ffmpeg.mk   | 22 +++++++++++++++-------
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index e986de9..cdf7408 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,5 @@
 # Locally calculated
-sha256 a893490c3a8a7caaa9c47373b789c0335d0ac3572f2ba61059de842b9e45d802  ffmpeg-3.3.5.tar.xz
+sha256 5a77278a63741efa74e26bf197b9bb09ac6381b9757391b922407210f0f991c0  ffmpeg-3.4.1.tar.xz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
+sha256 b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
+sha256 73d99bc83313fff665b426d6672b4e0479102bc402fe22314ac9ce94a38aa5ff  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 3ac204f..5bb5d1e 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 3.3.5
+FFMPEG_VERSION = 3.4.1
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
@@ -53,14 +53,12 @@ FFMPEG_CONF_OPTS = \
 	--disable-libdc1394 \
 	--disable-libgsm \
 	--disable-libilbc \
-	--disable-libnut \
 	--disable-libopenjpeg \
-	--disable-libschroedinger \
 	--disable-libvo-amrwbenc \
 	--disable-symver \
 	--disable-doc
 
-FFMPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv) host-pkgconf
+FFMPEG_DEPENDENCIES += host-pkgconf
 
 ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
 FFMPEG_CONF_OPTS += --enable-gpl
@@ -161,7 +159,10 @@ endif
 ifeq ($(BR2_PACKAGE_FFMPEG_INDEVS),y)
 FFMPEG_CONF_OPTS += --enable-indevs
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+FFMPEG_CONF_OPTS += --enable-alsa
 FFMPEG_DEPENDENCIES += alsa-lib
+else
+FFMPEG_CONF_OPTS += --disable-alsa
 endif
 else
 FFMPEG_CONF_OPTS += --disable-indevs
@@ -344,6 +345,13 @@ else
 FFMPEG_CONF_OPTS += --disable-libwavpack
 endif
 
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+FFMPEG_CONF_OPTS += --enable-iconv
+FFMPEG_DEPENDENCIES += libiconv
+else
+FFMPEG_CONF_OPTS += --disable-iconv
+endif
+
 # ffmpeg freetype support require fenv.h which is only
 # available/working on glibc.
 # The microblaze variant doesn't provide the needed exceptions
@@ -376,10 +384,10 @@ FFMPEG_CONF_OPTS += --disable-libx265
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
-FFMPEG_CONF_OPTS += --enable-yasm
-FFMPEG_DEPENDENCIES += host-yasm
+FFMPEG_CONF_OPTS += --enable-x86asm
+FFMPEG_DEPENDENCIES += host-nasm
 else
-FFMPEG_CONF_OPTS += --disable-yasm
+FFMPEG_CONF_OPTS += --disable-x86asm
 FFMPEG_CONF_OPTS += --disable-mmx
 endif
 
