From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  1 May 2018 09:10:16 +0200
Subject: [Buildroot] [PATCH 3/4] package/tovid: switch from mplayer to mpv
In-Reply-To: <20180501071017.14270-1-bernd.kuhls@t-online.de>
References: <20180501071017.14270-1-bernd.kuhls@t-online.de>
Message-ID: <20180501071017.14270-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mplayer package will be removed from buildroot, tovid can use mpv
instead. Support for mpv was added upstream:
https://github.com/tovid-suite/tovid/commit/05cbce2ea130e50f6bf1599816dd0d7bf3ace91a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tovid/Config.in | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/package/tovid/Config.in b/package/tovid/Config.in
index d8052ea334..0d42785e8a 100644
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
@@ -30,13 +31,17 @@ config BR2_PACKAGE_TOVID
 comment "tovid needs a toolchain w/ threads, C++, wchar"
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
-- 
2.14.2
