From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Nov 2014 19:53:00 +0100
Subject: [Buildroot] [PATCHv2] package/sdl_sound: fix constness in debug mode
Message-ID: <1416250380-24029-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When in debug mode, ./configure forces -Werror, which uncovers a
constness issue in the speex decoder.

Add a patch to fix this.

Fixes:
    http://autobuild.buildroot.net/results/6f5/6f5e1b782923d6e69e929466f0ddd3eeba28c6f1/
    http://autobuild.buildroot.net/results/c1b/c1b31dc37fe62cb6901edad02bf50d73072b7cf0/
    http://autobuild.buildroot.net/results/162/162e6d77e5812060001ea22faff99055aae3122a/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/sdl_sound/0001-fix-constness.patch | 16 ++++++++++++++++
 package/sdl_sound/sdl_sound.mk             |  3 +++
 2 files changed, 19 insertions(+)
 create mode 100644 package/sdl_sound/0001-fix-constness.patch

diff --git a/package/sdl_sound/0001-fix-constness.patch b/package/sdl_sound/0001-fix-constness.patch
new file mode 100644
index 0000000..1f27a07
--- /dev/null
+++ b/package/sdl_sound/0001-fix-constness.patch
@@ -0,0 +1,16 @@
+decoders/speex: fix constness of speex mode
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN sdl_sound-1.0.3.orig/decoders/speex.c sdl_sound-1.0.3/decoders/speex.c
+--- sdl_sound-1.0.3.orig/decoders/speex.c	2014-11-17 19:40:09.543553556 +0100
++++ sdl_sound-1.0.3/decoders/speex.c	2014-11-17 19:40:37.119864580 +0100
+@@ -124,7 +124,7 @@
+ 
+ static int process_header(speex_t *speex, Sound_Sample *sample)
+ {
+-    SpeexMode *mode;
++    const SpeexMode * mode;
+     SpeexHeader *hptr;
+     SpeexHeader header;
+     int enh_enabled = SPEEX_USE_PERCEPTUAL_ENHANCER;
diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index 416f381..6180b42 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -12,6 +12,9 @@ SDL_SOUND_LICENSE_FILES = COPYING
 SDL_SOUND_INSTALL_STAGING = YES
 SDL_SOUND_DEPENDENCIES = sdl
 
+# Patch touching configure.in
+SDL_SOUND_AUTORECONF = YES
+
 ifneq ($(BR2_ENABLE_LOCALE),y)
 SDL_SOUND_DEPENDENCIES += libiconv
 endif
-- 
1.9.1
