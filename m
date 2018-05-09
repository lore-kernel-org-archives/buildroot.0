From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 May 2018 21:35:35 +0200
Subject: [Buildroot] [git commit] package/tovid: switch from mplayer to mpv
Message-ID: <20180509193609.4DF787FE28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11d9a0d28f4d2b4d4ef9c6089c80a72fb3a5c85c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mplayer package will be removed from buildroot, tovid can use mpv
instead. Support for mpv was added upstream:
https://github.com/tovid-suite/tovid/commit/05cbce2ea130e50f6bf1599816dd0d7bf3ace91a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tovid/Config.in | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/package/tovid/Config.in b/package/tovid/Config.in
index d8052ea334..d5b7a28314 100644
--- a/package/tovid/Config.in
+++ b/package/tovid/Config.in
@@ -6,8 +6,9 @@ config BR2_PACKAGE_TOVID
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mplayer
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 # mpv
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8 # mpv
+	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC # mpv
 	# The below dependencies are runtime dependencies only
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps_ng
 	select BR2_PACKAGE_DVDAUTHOR
@@ -16,7 +17,7 @@ config BR2_PACKAGE_TOVID
 	select BR2_PACKAGE_IMAGEMAGICK
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_MJPEGTOOLS
-	select BR2_PACKAGE_MPLAYER
+	select BR2_PACKAGE_MPV
 	select BR2_PACKAGE_PROCPS_NG # pgrep and pkill
 	select BR2_PACKAGE_SOX
 	help
@@ -27,16 +28,20 @@ config BR2_PACKAGE_TOVID
 
 	  http://tovid.wikia.com/wiki/Installing_tovid
 
-comment "tovid needs a toolchain w/ threads, C++, wchar"
+comment "tovid needs a toolchain w/ threads, C++, wchar, gcc >= 4.5"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
 	depends on !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 \
 		|| !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 
 comment "tovid depends on python or python3"
 	depends on !BR2_PACKAGE_PYTHON && !BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
