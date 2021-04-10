From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Apr 2021 12:05:54 +0200
Subject: [Buildroot] [PATCH 2/2] package/sdl_mixer: fix static build with
 tremor
In-Reply-To: <20210410100554.3947392-1-fontaine.fabrice@gmail.com>
References: <20210410100554.3947392-1-fontaine.fabrice@gmail.com>
Message-ID: <20210410100554.3947392-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Static build with tremor raises a build failure since bump to latest git
tree in commit c8e27f3baa90351a417ff6e172d214c4a72e7314. However, it
should be noted that before this bump, tremor was always disabled in
static builds because vorbisidec detection was broken until
https://github.com/libsdl-org/SDL_mixer/commit/565a9a27cc8c184ad0203f004b834880ffd45d32

Fixes:
 - http://autobuild.buildroot.org/results/9634adc433da0e25732eb98675c59d0f96ac93b2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...re.ac-fix-static-linking-with-tremor.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/sdl_mixer/0003-configure.ac-fix-static-linking-with-tremor.patch

diff --git a/package/sdl_mixer/0003-configure.ac-fix-static-linking-with-tremor.patch b/package/sdl_mixer/0003-configure.ac-fix-static-linking-with-tremor.patch
new file mode 100644
index 0000000000..7bad2bd932
--- /dev/null
+++ b/package/sdl_mixer/0003-configure.ac-fix-static-linking-with-tremor.patch
@@ -0,0 +1,36 @@
+From c4814d9ef2b569c5fccbf72e1555b6147392a2f3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 10 Apr 2021 11:50:17 +0200
+Subject: [PATCH] configure.ac: fix static linking with tremor
+
+Fix the following build failure when building statically with
+--enable-music-ogg-tremor:
+
+libtool: link: /tmp/instance-0/output-1/host/bin/arm-linux-gcc -o build/playwave build/playwave.o -I/tmp/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/SDL -D_GNU_SOURCE=1 -D_REENTRANT -static  -L/tmp/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib build/.libs/libSDL_mixer.a -L/tmp/instance-0/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib /tmp/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libSDL.a /tmp/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libasound.a -lrt -ldl /tmp/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libts.a -lpthread /tmp/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libvorbisidec.a /tmp/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libogg.a -lvorbis /tmp/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libmad.a -lm
+/tmp/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -lvorbis
+
+Fixes:
+ - http://autobuild.buildroot.org/results/9634adc433da0e25732eb98675c59d0f96ac93b2
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/libsdl-org/SDL_mixer/pull/312]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b5be494..8350b7b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -530,7 +530,7 @@ if test x$enable_music_ogg = xyes; then
+                 echo "-- dynamic libvorbisidec -> $ogg_lib"
+                 EXTRA_CFLAGS="$EXTRA_CFLAGS -DOGG_DYNAMIC=\\\"$ogg_lib\\\""
+             else
+-                EXTRA_LDFLAGS="$EXTRA_LDFLAGS -lvorbisidec -lvorbis"
++                EXTRA_LDFLAGS="$EXTRA_LDFLAGS -lvorbisidec"
+             fi
+         else
+             AC_MSG_WARN([*** Unable to find Ogg Vorbis Tremor library (http://www.xiph.org/)])
+-- 
+2.30.2
+
-- 
2.30.2
