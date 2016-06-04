From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jun 2016 10:00:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/mplayer: add optional support for
	mpg123
Message-ID: <1465027220-19359-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mplayer has optional support for mpg123, to get reproducable builds
add mpg123 as optional dependency.

Linked libraries without this patch:
$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/mplayer | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [librt.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libm.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]

Linked libraries after this patch:
$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/mplayer | grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [librt.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libmpg123.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libm.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]

Like with many other optional libraries detection of mpg123 is broken if
--enable-mpg123 is passed to configure leading to a build error:

libmpcodecs/ad_mpg123.o: In function `set_format':
ad_mpg123.c:(.text+0x63): undefined reference to `mpg123_getformat'
libmpcodecs/ad_mpg123.o: In function `decode_a_bit':
ad_mpg123.c:(.text+0x1b6): undefined reference to `mpg123_feed'
ad_mpg123.c:(.text+0x20e): undefined reference to `mpg123_replace_buffer'
ad_mpg123.c:(.text+0x223): undefined reference to `mpg123_decode_frame_64'
ad_mpg123.c:(.text+0x275): undefined reference to `mpg123_strerror'
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mplayer/mplayer.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 347ed5e..9ae7ca4 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -174,6 +174,14 @@ MPLAYER_DEPENDENCIES += libmpeg2
 MPLAYER_CONF_OPTS += --disable-libmpeg2-internal
 endif
 
+# We intentionally don't pass --enable-mpg123, to let the
+# autodetection find which library to link with.
+ifeq ($(BR2_PACKAGE_MPG123),y)
+MPLAYER_DEPENDENCIES += mpg123
+else
+MPLAYER_CONF_OPTS += --disable-mpg123
+endif
+
 ifeq ($(BR2_PACKAGE_TREMOR),y)
 MPLAYER_DEPENDENCIES += tremor
 MPLAYER_CONF_OPTS += --enable-tremor
-- 
2.8.1
