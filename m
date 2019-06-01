From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  1 Jun 2019 14:42:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpd: fix static build with tremor
 and vorbis
Message-ID: <20190601124231.25075-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mpd can't be built statically with tremor and vorbis, build fails on:
block.c:(.text+0x11c): multiple definition of `vorbis_block_init'
/usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libvorbisidec.a(block.o):block.c:(.text+0x0): first defined here
/usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/7.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: Disabling relaxation: it will not work with multiple definitions
/usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libvorbis.a(block.o): In function `_vorbis_block_alloc':

Fix this by enabling vorbis or tremor depending on BR2_SOFT_FLOAT value
as suggested by J?rg in https://patchwork.ozlabs.org/patch/1085899

It should be noted that upstream removed the possibility to enable
tremor and vorbis at the same time since version 0.21.6 and
https://github.com/MusicPlayerDaemon/MPD/commit/c18cd941aaa4c16ac713bc4f1e16ada5281d689e

Fixes:
 - http://autobuild.buildroot.org/results/60c721a82ffd668bebf02d80bca83780d6cdb2f2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpd/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index d3844391a2..039c2402c2 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -9,7 +9,6 @@ menuconfig BR2_PACKAGE_MPD
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_MPD_TREMOR if !(BR2_PACKAGE_MPD_MAD || BR2_PACKAGE_MPD_MPG123 || BR2_PACKAGE_MPD_VORBIS || BR2_PACKAGE_MPD_WAVPACK || BR2_PACKAGE_MPD_FLAC || BR2_PACKAGE_MPD_MUSEPACK || BR2_PACKAGE_MPD_FFMPEG)
 	help
 	  MPD is a flexible, powerful, server-side application
 	  for playing music. Through plugins and libraries
@@ -132,18 +131,20 @@ config BR2_PACKAGE_MPD_OPUS
 	  Select this if you want to play back OPUS encoded files.
 
 config BR2_PACKAGE_MPD_TREMOR
-	bool "tremor"
+	bool "tremor" if !BR2_SOFT_FLOAT
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_TREMOR
+	default y if !BR2_SOFT_FLOAT
 	help
 	  Enable vorbis input support.
 	  Select this if you want to play back OGG files on softfloat
 	  targets.
 
 config BR2_PACKAGE_MPD_VORBIS
-	bool "vorbis"
+	bool "vorbis" if BR2_SOFT_FLOAT
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_LIBVORBIS
+	default y if BR2_SOFT_FLOAT
 	help
 	  Enable vorbis input/streaming support.
 	  Select this if you want to play back OGG files on hardfloat
-- 
2.20.1
