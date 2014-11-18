From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 08:41:48 +0100
Subject: [Buildroot] [git commit] package/sdl_sound: fix constness in debug
	mode
Message-ID: <20141118074238.2E547B483D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b0c806d09d593709f8d7189c8a00b95cc76326e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl_sound/0001-fix-constness.patch |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

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
