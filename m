From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat, 21 Jan 2017 17:11:00 +0100
Subject: [Buildroot] [PATCH] package/mpd: disable on SPARCV8, NIOS2, ARMV{4,
	5}
Message-ID: <20170121161100.3142-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 0.20 mpd uses the C++11 feature `std::exception_ptr` which
is not available on architectures that do not have always-lock-free
atomics for int.

The issue [1,2] has been fixed in GCC trunk r244051 [3] and will be
available in GCC 7. However, as GCC 7 is not released yet and will not
be before the next release of Buildroot, we disable the following
architectures, which caused build errors on the autobuilders:
  * SPARCV8
  * NIOS2
  * ARMV4
  * ARMV5

Fixes:
http://autobuild.buildroot.net/results/1c5/1c5090fe361b08c60277e54be1bfa7e80d5d31d8/
http://autobuild.buildroot.net/results/076/07621b958a3a35066790543586549aa41f2effa9/
http://autobuild.buildroot.net/results/7b1/7b12d41bee83ad20251dbc7026e0fc665d5abe0c/
.. and many more

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58938
[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=64735
[3]
https://gcc.gnu.org/viewcvs/gcc/trunk/libstdc%2B%2B-v3/include/std/future?view=log&pathrev=244051

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/mpd/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 9b22f68ce..52deef438 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -6,6 +6,11 @@ menuconfig BR2_PACKAGE_MPD
 	depends on BR2_USE_MMU # fork
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	# std::exception_ptr is not available on architectures that do not have
+	# always-lock-free atomics for int. Note that GCC 7 will fix this issue
+	# by not relying on atomics anymore, so MPD will be available for these
+	# archs again (if build with GCC 7).
+	depends on !(BR2_sparc_v8 || BR2_nios2 || BR2_ARM_CPU_ARMV4 || BR2_ARM_CPU_ARMV5)
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_MPD_TREMOR if !(BR2_PACKAGE_MPD_MAD || BR2_PACKAGE_MPD_MPG123 || BR2_PACKAGE_MPD_VORBIS || BR2_PACKAGE_MPD_WAVPACK || BR2_PACKAGE_MPD_FLAC || BR2_PACKAGE_MPD_MUSEPACK || BR2_PACKAGE_MPD_FFMPEG)
@@ -317,5 +322,6 @@ endif
 comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !(BR2_sparc_v8 || BR2_nios2 || BR2_ARM_CPU_ARMV4 || BR2_ARM_CPU_ARMV5)
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.11.0
