From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Dec 2017 15:32:24 +0100
Subject: [Buildroot] [git commit] alsa-lib: bump to version 1.1.5
Message-ID: <20171222144124.036877FC9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4d76e206d1c32e671cde324f1b8bb0da247af4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patches; renumber the rest.

Add license files hashes.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-lib/0001-musl-pcm-h.patch             | 33 --------------
 .../{0002-no-mmu.patch => 0001-no-mmu.patch}       |  0
 .../{0003-dlmisc.patch => 0002-dlmisc.patch}       |  0
 ...0003-conditional-enabling-of-libdl-in-m4.patch} |  0
 ...-rawmidi_symbols.c-use-rawmidi_virt-only-.patch | 52 ----------------------
 package/alsa-lib/alsa-lib.hash                     |  4 +-
 package/alsa-lib/alsa-lib.mk                       |  2 +-
 7 files changed, 4 insertions(+), 87 deletions(-)

diff --git a/package/alsa-lib/0001-musl-pcm-h.patch b/package/alsa-lib/0001-musl-pcm-h.patch
deleted file mode 100644
index ce1528c..0000000
--- a/package/alsa-lib/0001-musl-pcm-h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Fix musl-related build errors in packages depending on alsa, in our case
-this fixes openal.
-
-Downloaded from
-http://git.alpinelinux.org/cgit/aports/tree/main/alsa-lib/alsa-lib_pcm_h.patch
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
---- alsa-lib-1.0.25/include/pcm.h
-+++ alsa-lib-1.0.25.patched/include/pcm.h
-@@ -33,6 +33,7 @@
- extern "C" {
- #endif
- 
-+#include <stdint.h>
- /**
-  *  \defgroup PCM PCM Interface
-  *  See the \ref pcm page for more details.
-@@ -941,10 +942,10 @@
- int snd_pcm_format_physical_width(snd_pcm_format_t format);		/* in bits */
- snd_pcm_format_t snd_pcm_build_linear_format(int width, int pwidth, int unsignd, int big_endian);
- ssize_t snd_pcm_format_size(snd_pcm_format_t format, size_t samples);
--u_int8_t snd_pcm_format_silence(snd_pcm_format_t format);
--u_int16_t snd_pcm_format_silence_16(snd_pcm_format_t format);
--u_int32_t snd_pcm_format_silence_32(snd_pcm_format_t format);
--u_int64_t snd_pcm_format_silence_64(snd_pcm_format_t format);
-+uint8_t snd_pcm_format_silence(snd_pcm_format_t format);
-+uint16_t snd_pcm_format_silence_16(snd_pcm_format_t format);
-+uint32_t snd_pcm_format_silence_32(snd_pcm_format_t format);
-+uint64_t snd_pcm_format_silence_64(snd_pcm_format_t format);
- int snd_pcm_format_set_silence(snd_pcm_format_t format, void *buf, unsigned int samples);
- 
- snd_pcm_sframes_t snd_pcm_bytes_to_frames(snd_pcm_t *pcm, ssize_t bytes);
diff --git a/package/alsa-lib/0002-no-mmu.patch b/package/alsa-lib/0001-no-mmu.patch
similarity index 100%
rename from package/alsa-lib/0002-no-mmu.patch
rename to package/alsa-lib/0001-no-mmu.patch
diff --git a/package/alsa-lib/0003-dlmisc.patch b/package/alsa-lib/0002-dlmisc.patch
similarity index 100%
rename from package/alsa-lib/0003-dlmisc.patch
rename to package/alsa-lib/0002-dlmisc.patch
diff --git a/package/alsa-lib/0004-conditional-enabling-of-libdl-in-m4.patch b/package/alsa-lib/0003-conditional-enabling-of-libdl-in-m4.patch
similarity index 100%
rename from package/alsa-lib/0004-conditional-enabling-of-libdl-in-m4.patch
rename to package/alsa-lib/0003-conditional-enabling-of-libdl-in-m4.patch
diff --git a/package/alsa-lib/0005-src-rawmidi-rawmidi_symbols.c-use-rawmidi_virt-only-.patch b/package/alsa-lib/0005-src-rawmidi-rawmidi_symbols.c-use-rawmidi_virt-only-.patch
deleted file mode 100644
index 72646dd..0000000
--- a/package/alsa-lib/0005-src-rawmidi-rawmidi_symbols.c-use-rawmidi_virt-only-.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From da16e18f03fc63e1206b93d6a719b177d4f4bb99 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Fri, 11 Aug 2017 22:33:01 +0200
-Subject: [PATCH] src/rawmidi/rawmidi_symbols.c: use rawmidi_virt only when
- available
-
-src/rawmidi/Makefile.am only brings rawmidi_virt.c into the build when
-BUILD_SEQ is defined (i.e when --enable-seq is passed). However,
-rawmidi_symbols.c unconditionally refers to _snd_module_rawmidi_virt,
-defined in rawmidi_virt.c.
-
-This causes a link failure when BUILD_SEQ is disabled. For example
-when linking ffmpeg against alsa-lib:
-
-/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libasound.a(pcm_dmix.o): In function `snd_pcm_dmix_sync_ptr':
-pcm_dmix.c:(.text+0x83c): warning:
-/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libasound.a(rawmidi_symbols.o):(.data+0x4): undefined reference to `_snd_module_rawmidi_virt'
-collect2: error: ld returned 1 exit status
-
-To fix this, we make sure that rawmidi_symbols.c only uses
-_snd_module_rawmidi_virt when available.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Patch sent upstream: https://www.spinics.net/lists/alsa-devel/msg65902.html
----
- src/rawmidi/rawmidi_symbols.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/rawmidi/rawmidi_symbols.c b/src/rawmidi/rawmidi_symbols.c
-index cdc06d7..6473433 100644
---- a/src/rawmidi/rawmidi_symbols.c
-+++ b/src/rawmidi/rawmidi_symbols.c
-@@ -21,11 +21,15 @@
- #ifndef PIC
- 
- extern const char *_snd_module_rawmidi_hw;
-+#ifdef BUILD_SEQ
- extern const char *_snd_module_rawmidi_virt;
-+#endif
- 
- static const char **snd_rawmidi_open_objects[] = {
- 	&_snd_module_rawmidi_hw,
-+#ifdef BUILD_SEQ
- 	&_snd_module_rawmidi_virt
-+#endif
- };
- 	
- void *snd_rawmidi_open_symbols(void)
--- 
-2.9.4
-
diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index cf2a705..8853093 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,2 +1,4 @@
 # Locally calculated
-sha256 91bb870c14d1c7c269213285eeed874fa3d28112077db061a3af8010d0885b76  alsa-lib-1.1.4.1.tar.bz2
+sha256 f4f68ad3c6da36b0b5241ac3c798a7a71e0e97d51f972e9f723b3f20a9650ae6  alsa-lib-1.1.5.tar.bz2
+sha256 a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
+sha256 bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 12fa408..3235502 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.1.4.1
+ALSA_LIB_VERSION = 1.1.5
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
