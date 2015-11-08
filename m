From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  8 Nov 2015 15:42:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/mplayer: Fix linking with libvorbis
Message-ID: <1446993776-26617-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/7f6/7f6e5396e95a3c3b676ca59bedc5317aa88e5f4c/
http://autobuild.buildroot.net/results/6ac/6acd9cf25c3088d313247510db47a214fff30c67/
http://autobuild.buildroot.net/results/a0d/a0da41bb734dbcdb17e13d852cfbdba5e069429e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mplayer/0003-libvorbis.patch | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/mplayer/0003-libvorbis.patch

diff --git a/package/mplayer/0003-libvorbis.patch b/package/mplayer/0003-libvorbis.patch
new file mode 100644
index 0000000..4abfa01
--- /dev/null
+++ b/package/mplayer/0003-libvorbis.patch
@@ -0,0 +1,30 @@
+When configured with --enable-libvorbis the test for libvorbis never
+happens because $_libvorbis contains "yes" in this case leading to
+link errors:
+
+http://autobuild.buildroot.net/results/7f6/7f6e5396e95a3c3b676ca59bedc5317aa88e5f4c/build-end.log
+
+/home/buildroot/buildroot-test/scripts/instance-0/output/build/mplayer-1.2/libmpcodecs/ad_libvorbis.c:248: undefined reference to `vorbis_synthesis_pcmout'
+/home/buildroot/buildroot-test/scripts/instance-0/output/build/mplayer-1.2/libmpcodecs/ad_libvorbis.c:248: undefined reference to `vorbis_synthesis_pcmout'
+/home/buildroot/buildroot-test/scripts/instance-0/output/build/mplayer-1.2/libmpcodecs/ad_libvorbis.c:254: undefined reference to `vorbis_synthesis'
+[...]
+
+This patch fixes the problem.
+
+Patch sent upstream: 
+http://lists.mplayerhq.hu/pipermail/mplayer-dev-eng/2015-November/073175.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr MPlayer-1.2.org/configure MPlayer-1.2/configure
+--- MPlayer-1.2.org/configure	2015-10-02 22:29:04.000000000 +0200
++++ MPlayer-1.2/configure	2015-11-08 15:03:26.382426269 +0100
+@@ -6538,7 +6538,7 @@
+   _tremor=no
+   statement_check tremor/ivorbiscodec.h 'vorbis_synthesis(0, 0)' -logg -lvorbisidec && _tremor=yes && _libvorbis=no
+ fi
+-if test "$_libvorbis" = auto; then
++if test "$_libvorbis" != no; then
+   _libvorbis=no
+   for vorbislibs in '-lvorbisenc -lvorbis -logg' '-lvorbis -logg' ; do
+     statement_check vorbis/vorbisenc.h 'vorbis_encode_ctl(0, 0, 0); ogg_stream_clear(0)' $vorbislibs && _libvorbis=yes && break
-- 
2.6.2
