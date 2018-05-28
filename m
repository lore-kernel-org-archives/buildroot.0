From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 28 May 2018 10:35:10 -0500
Subject: [Buildroot] [PATCH v2] toolchain: GCC bug 85180
Message-ID: <1527521710-3889-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Works around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
which is an issue where the Microblaze archtecture had code that
caused a infinite recursion while optimizing in versions of GCC
less then 8.x.  More BR discussion can be found on this thread.
http://buildroot-busybox.2317881.n4.nabble.com/autobuild-buildroot-net-Build-results-for-2018-04-25-td192721.html

Resolves:
http://autobuild.buildroot.net/results/b42d68c66d8ea035845a28c5530ef0682fd95713 (boost)
http://autobuild.buildroot.net/results/af976a4805fb8b3f0c17a8e3a1f901b2255caa0b (flare-engine)
http://autobuild.buildroot.net/results/d20/d20700bd538ba1e9d45ab8a61ecbbba1a320ef38 (gst-ffmpeg)

CC: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---

Changes
v1 - > v2
[Thomas P
 - Switched from doing a autobuilder filter to a toolchain bug.
   Note, a "depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8" will be needed
   once GCC8 merges.
---
 package/boost/Config.in                | 4 ++++
 package/flare-engine/Config.in         | 4 ++++
 package/gstreamer/gst-ffmpeg/Config.in | 4 ++++
 toolchain/Config.in                    | 5 +++++
 4 files changed, 17 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 0755d9c..ec0e19c 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -104,12 +104,16 @@ config BR2_PACKAGE_BOOST_FIBER
 	# mips support uses the "pause" instruction, only available
 	# since mips32r2/mips64r2.
 	depends on !BR2_MIPS_CPU_MIPS32 && !BR2_MIPS_CPU_MIPS64
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85180
 	help
 	  C++11 userland threads library.
 
 comment "boost-fiber needs a toolchain w/ NPTL"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
+comment "boost-fiber needs a toolchain not affected by GCC bug 85180"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85180
+
 config BR2_PACKAGE_BOOST_FILESYSTEM
 	bool "boost-filesystem"
 	help
diff --git a/package/flare-engine/Config.in b/package/flare-engine/Config.in
index cdcb018..e299a6b 100644
--- a/package/flare-engine/Config.in
+++ b/package/flare-engine/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_FLARE_ENGINE
 	bool "flare-engine"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # SDL2
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85180
 	select BR2_PACKAGE_SDL2
 	select BR2_PACKAGE_SDL2_IMAGE
 	select BR2_PACKAGE_SDL2_MIXER
@@ -17,3 +18,6 @@ config BR2_PACKAGE_FLARE_ENGINE
 
 comment "flare-engine needs a toolchain w/ C++, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
+
+comment "flare-engine needs a toolchain not affected by GCC bug 85180"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85180
diff --git a/package/gstreamer/gst-ffmpeg/Config.in b/package/gstreamer/gst-ffmpeg/Config.in
index 32bfdd5..1e95d01 100644
--- a/package/gstreamer/gst-ffmpeg/Config.in
+++ b/package/gstreamer/gst-ffmpeg/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_GST_FFMPEG
 	depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 	# triggers https://gcc.gnu.org/bugzilla/show_bug.cgi?id=65151 on sh
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_sh
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_85180
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	help
 	  GStreamer plugin containing one plugin with a set of
@@ -28,3 +29,6 @@ endif
 
 comment "gst-ffmpeg needs a toolchain w/ gcc >= 5"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5 && BR2_sh
+
+comment "gst-ffmpeg needs a toolchain not affected by GCC bug 85180"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_85180
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 2479a65..61424ec 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -84,6 +84,11 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 	default y if BR2_m68k_cf5208
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
+config BR2_TOOLCHAIN_HAS_GCC_BUG_85180
+	bool
+	default y if BR2_microblaze
+
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85862
 # An infinite loop exists in the find_base_term() logic of 6.x
 # on microblaze.  http://autobuild.buildroot.net/results/158e8ebb39713e1b436a5cc1a1916f46c30694df/
-- 
1.9.1
