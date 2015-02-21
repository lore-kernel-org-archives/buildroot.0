From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 11:03:36 +0100
Subject: [Buildroot] [git commit] package/ffmpeg: fix nios2 fenv build
	failure
Message-ID: <20150221100343.5D5AE803DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5de0a5127824521bf08d4d1edb047723f7eecff7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/216/216fbc33c4838b1414cb25f823fd1db5c92e33c6/
http://autobuild.buildroot.net/results/800/800fe1d79ef2e52b86a97feeba85b5c47aff8dcd/
http://autobuild.buildroot.net/results/8a6/8a6d24ecc6487fd20ba663f71996160124083a68/

Only the affected toolchains are disabled. When using branch next/ compilation
works with a buildroot-compiled toolchain using this defconfig:

BR2_nios2=y
BR2_PACKAGE_FFMPEG=y
BR2_PACKAGE_FFMPEG_GPL=y
BR2_PACKAGE_FFMPEG_NONFREE=y
BR2_PACKAGE_FFMPEG_FFPLAY=y
BR2_PACKAGE_FFMPEG_FFSERVER=y
BR2_PACKAGE_FFMPEG_FFPROBE=y
BR2_PACKAGE_FFMPEG_AVRESAMPLE=y
BR2_PACKAGE_FFMPEG_POSTPROC=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index 5f86f52..7ce0f3a 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -1,10 +1,15 @@
 comment "ffmpeg needs a toolchain w/ largefile, IPv6"
 	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 
 menuconfig BR2_PACKAGE_FFMPEG
 	bool "ffmpeg"
 	depends on BR2_LARGEFILE
 	depends on BR2_INET_IPV6
+	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	help
 	  FFmpeg is a complete, cross-platform solution to record, convert
 	  and stream audio and video.
