From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 15:55:07 +0100
Subject: [Buildroot] [git commit] ffmpeg: mark as not available on nios2
Message-ID: <20151111145808.372A781EA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8b58ec016973bee87a4fc1cc99a32b206bdee136
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ffmpeg was already marked as not available for the NIOS2 Sourcery
toolchains, but it could still be built with the internal toolchain
backend or a custom external toolchain.

However, an inspection of the latest glibc source code indicates that
FE_INVALID, FE_OVERFLOW and FE_UNDERFLOW and indeed not available in
the nios2 variant of <fenv.h>.

Consequently, this patch makes ffmpeg not available on nios2, which
allows to simplify a bit the dependencies.

It propagates this dependency to:

 - minidlna (and at the same time makes sure the minidlna comment is
   not displayed on nios2, which wasn't properly taken into account
   until now)
 - mpd
 - opencv
 - opencv3
 - squeezelite
 - tovid

Even if it selects ffmpeg, Kodi does not need an update since Kodi is
only available on a limited number of architectures (which don't
include nios2, obviously). Other packages only make use of ffmpeg when
available.

Fixes:

  http://autobuild.buildroot.org/results/921/9212f5a6432c5e695ac0630695405cea05e28610/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/Config.in      |    5 ++---
 package/minidlna/Config.in    |    5 ++---
 package/mpd/Config.in         |    1 +
 package/opencv/Config.in      |    1 +
 package/opencv3/Config.in     |    1 +
 package/squeezelite/Config.in |    3 +--
 package/tovid/Config.in       |    3 +--
 7 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index e5981fe..a273aea 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -1,8 +1,7 @@
 menuconfig BR2_PACKAGE_FFMPEG
 	bool "ffmpeg"
-	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
+	depends on !BR2_nios2
 	help
 	  FFmpeg is a complete, cross-platform solution to record, convert
 	  and stream audio and video.
diff --git a/package/minidlna/Config.in b/package/minidlna/Config.in
index 0eef751..9799672 100644
--- a/package/minidlna/Config.in
+++ b/package/minidlna/Config.in
@@ -12,9 +12,7 @@ config BR2_PACKAGE_MINIDLNA
 	select BR2_PACKAGE_LIBJPEG
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	# Triggers the _gp link issue in nios2
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !nios2 # ffmpeg
 	help
 	  MiniDLNA (aka ReadyDLNA) is server software with the aim of being
 	  fully compliant with DLNA/UPnP-AV clients.
@@ -23,4 +21,5 @@ config BR2_PACKAGE_MINIDLNA
 
 comment "minidlna needs a toolchain w/ threads, wchar"
 	depends on BR2_USE_MMU
+	depends on !nios2
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_USE_WCHAR)
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 3bfeb3e..0b3bb72 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -77,6 +77,7 @@ config BR2_PACKAGE_MPD_FAAD2
 config BR2_PACKAGE_MPD_FFMPEG
 	bool "ffmpeg"
 	select BR2_PACKAGE_FFMPEG
+	depends on !BR2_nios2 # ffmpeg
 	help
 	  Enable ffmpeg input support.
 	  Select this if you want to play back files supported by
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index aca5174..a5fafc1 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -132,6 +132,7 @@ config BR2_PACKAGE_OPENCV_WITH_FFMPEG
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
+	depends on !BR2_nios2 # ffmpeg
 	help
 	  Use ffmpeg from the target system.
 
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index 2f51580..8736805 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -244,6 +244,7 @@ config BR2_PACKAGE_OPENCV3_WITH_FFMPEG
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
+	depends on !BR2_nios2 # ffmpeg
 	help
 	  Use ffmpeg from the target system.
 
diff --git a/package/squeezelite/Config.in b/package/squeezelite/Config.in
index be8f11a..6befee1 100644
--- a/package/squeezelite/Config.in
+++ b/package/squeezelite/Config.in
@@ -21,8 +21,7 @@ config BR2_PACKAGE_SQUEEZELITE_FFMPEG
 	bool "Enable WMA and ALAC decoding"
 	default y
 	select BR2_PACKAGE_FFMPEG
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305 # ffmpeg
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405 # ffmpeg
+	depends on !BR2_nios2 # ffmpeg
 
 config BR2_PACKAGE_SQUEEZELITE_DSD
 	bool "Enable DSD decoding"
diff --git a/package/tovid/Config.in b/package/tovid/Config.in
index ccf031e..79eaec4 100644
--- a/package/tovid/Config.in
+++ b/package/tovid/Config.in
@@ -5,8 +5,7 @@ config BR2_PACKAGE_TOVID
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305 # ffmpeg
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405 # ffmpeg
+	depends on !nios2 # ffmpeg
 	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
 	# The below dependencies are runtime dependencies only
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps_ng
