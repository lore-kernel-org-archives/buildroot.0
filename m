From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 21:18:35 +0200
Subject: [Buildroot] [git commit] ffmpeg: add
	BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
Message-ID: <20160526191902.558C781F98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6e549b9e40d42dbb6a551ecaeb040c1e401f21a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/Config.in                | 8 ++++++--
 package/gstreamer1/gst1-libav/Config.in | 2 +-
 package/kodi/Config.in                  | 1 +
 package/minidlna/Config.in              | 4 ++--
 package/mpd/Config.in                   | 2 +-
 package/mpv/Config.in                   | 4 ++--
 package/opencv/Config.in                | 2 +-
 package/opencv3/Config.in               | 2 +-
 package/squeezelite/Config.in           | 2 +-
 package/tovid/Config.in                 | 4 +++-
 10 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index a273aea..6b7a6e7 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -1,7 +1,11 @@
+config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
+	bool
+	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
+	default y if !BR2_nios2
+
 menuconfig BR2_PACKAGE_FFMPEG
 	bool "ffmpeg"
-	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
-	depends on !BR2_nios2
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	help
 	  FFmpeg is a complete, cross-platform solution to record, convert
 	  and stream audio and video.
diff --git a/package/gstreamer1/gst1-libav/Config.in b/package/gstreamer1/gst1-libav/Config.in
index 8c3c834..23d78b6 100644
--- a/package/gstreamer1/gst1-libav/Config.in
+++ b/package/gstreamer1/gst1-libav/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GST1_LIBAV
 	bool "gst1-libav"
-	depends on !BR2_nios2 # ffmpeg
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index ff2e75c..d9760ca 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
 	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) \
+		&& BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS \
 		&& BR2_PACKAGE_BOOST_ARCH_SUPPORTS \
 		&& BR2_TOOLCHAIN_HAS_SYNC_8
 
diff --git a/package/minidlna/Config.in b/package/minidlna/Config.in
index 999ea01..c900143 100644
--- a/package/minidlna/Config.in
+++ b/package/minidlna/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_MINIDLNA
 	depends on BR2_USE_WCHAR # flac
 	depends on BR2_USE_MMU # fork
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FLAC
 	select BR2_PACKAGE_LIBVORBIS # selects libogg
@@ -13,7 +14,6 @@ config BR2_PACKAGE_MINIDLNA
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	depends on !BR2_nios2 # ffmpeg
 	help
 	  MiniDLNA (aka ReadyDLNA) is server software with the aim of being
 	  fully compliant with DLNA/UPnP-AV clients.
@@ -22,6 +22,6 @@ config BR2_PACKAGE_MINIDLNA
 
 comment "minidlna needs a toolchain w/ dynamic library, threads, wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_nios2
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		BR2_STATIC_LIBS
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 3ac806f..31be8bb 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -77,8 +77,8 @@ config BR2_PACKAGE_MPD_FAAD2
 
 config BR2_PACKAGE_MPD_FFMPEG
 	bool "ffmpeg"
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	select BR2_PACKAGE_FFMPEG
-	depends on !BR2_nios2 # ffmpeg
 	help
 	  Enable ffmpeg input support.
 	  Select this if you want to play back files supported by
diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index b354d4d..1cef6c5 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MPV
 	bool "mpv"
-	depends on !BR2_nios2 # ffmpeg
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
@@ -15,5 +15,5 @@ config BR2_PACKAGE_MPV
 	  https://mpv.io/
 
 comment "mpv needs a toolchain w/ threads"
-	depends on !BR2_nios2
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 05c1fc1..c046baa 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -191,10 +191,10 @@ comment "3rd party support"
 
 config BR2_PACKAGE_OPENCV_WITH_FFMPEG
 	bool "ffmpeg support"
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
-	depends on !BR2_nios2 # ffmpeg
 	help
 	  Use ffmpeg from the target system.
 
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index 9629a64..2f4aa7a 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -242,11 +242,11 @@ comment "3rd party support"
 
 config BR2_PACKAGE_OPENCV3_WITH_FFMPEG
 	bool "ffmpeg support"
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_AVRESAMPLE
 	select BR2_PACKAGE_FFMPEG_SWSCALE
-	depends on !BR2_nios2 # ffmpeg
 	help
 	  Use ffmpeg from the target system.
 
diff --git a/package/squeezelite/Config.in b/package/squeezelite/Config.in
index 1c2960e..79d2947 100644
--- a/package/squeezelite/Config.in
+++ b/package/squeezelite/Config.in
@@ -21,8 +21,8 @@ if BR2_PACKAGE_SQUEEZELITE
 config BR2_PACKAGE_SQUEEZELITE_FFMPEG
 	bool "Enable WMA and ALAC decoding"
 	default y
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	select BR2_PACKAGE_FFMPEG
-	depends on !BR2_nios2 # ffmpeg
 
 config BR2_PACKAGE_SQUEEZELITE_DSD
 	bool "Enable DSD decoding"
diff --git a/package/tovid/Config.in b/package/tovid/Config.in
index 093bfdf..1288f84 100644
--- a/package/tovid/Config.in
+++ b/package/tovid/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_TOVID
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
-	depends on !BR2_nios2 # ffmpeg
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
 	# The below dependencies are runtime dependencies only
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps_ng
@@ -28,6 +28,7 @@ config BR2_PACKAGE_TOVID
 
 comment "tovid needs a toolchain w/ threads, C++, wchar"
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_INSTALL_LIBSTDCPP \
@@ -35,4 +36,5 @@ comment "tovid needs a toolchain w/ threads, C++, wchar"
 
 comment "tovid depends on python or python3"
 	depends on !BR2_PACKAGE_PYTHON && !BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
