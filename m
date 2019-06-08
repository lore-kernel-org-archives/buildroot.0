From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 8 Jun 2019 22:11:26 +0200
Subject: [Buildroot] [git commit] package/mpd: fix static build with tremor
 and vorbis
Message-ID: <20190608201508.BBFB18F313@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5395b1ca450aff8823b77c2910ead19f727f4651
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mpd can't be built statically with tremor and vorbis, build fails on:
block.c:(.text+0x11c): multiple definition of `vorbis_block_init'
/usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libvorbisidec.a(block.o):block.c:(.text+0x0): first defined here
/usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/7.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: Disabling relaxation: it will not work with multiple definitions
/usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib/libvorbis.a(block.o): In function `_vorbis_block_alloc':

Fix this by making both options mutually exclusive

It should be noted that upstream explicitly removed the possibility to
enable tremor and vorbis at the same time since version 0.21.6 and
https://github.com/MusicPlayerDaemon/MPD/commit/c18cd941aaa4c16ac713bc4f1e16ada5281d689e
Since we only have 0.20.23, it is still possible to build them together,
but there is clearly no need to allow it.

Fixes:
 - http://autobuild.buildroot.org/results/60c721a82ffd668bebf02d80bca83780d6cdb2f2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mpd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 20a7421481..923f0c2201 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -132,6 +132,7 @@ config BR2_PACKAGE_MPD_OPUS
 
 config BR2_PACKAGE_MPD_TREMOR
 	bool "tremor"
+	depends on !BR2_PACKAGE_MPD_VORBIS
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_TREMOR
 	help
