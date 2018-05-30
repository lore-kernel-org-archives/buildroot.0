From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 May 2018 23:23:21 +0200
Subject: [Buildroot] [git commit] toolchain: allow disabling packages
 affected by gcc bug 85180
Message-ID: <20180530212151.90641835E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd97bc80c5b87a2e76e535c1b200fab9276446fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Works around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180 which
is an issue where the Microblaze architecture had code that caused a
infinite recursion while optimizing in versions of GCC earlier than
8.x. More BR discussion can be found on this thread.
http://buildroot-busybox.2317881.n4.nabble.com/autobuild-buildroot-net-Build-results-for-2018-04-25-td192721.html

Resolves:
http://autobuild.buildroot.net/results/b42d68c66d8ea035845a28c5530ef0682fd95713 (boost)
http://autobuild.buildroot.net/results/af976a4805fb8b3f0c17a8e3a1f901b2255caa0b (flare-engine)
http://autobuild.buildroot.net/results/d20/d20700bd538ba1e9d45ab8a61ecbbba1a320ef38 (gst-ffmpeg)

CC: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/Config.in                | 4 ++++
 package/flare-engine/Config.in         | 4 ++++
 package/gstreamer/gst-ffmpeg/Config.in | 4 ++++
 toolchain/Config.in                    | 6 ++++++
 4 files changed, 18 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 0755d9c010..ec0e19ccb5 100644
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
index cdcb018948..e299a6b7de 100644
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
index 32bfdd53c6..1e95d016f6 100644
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
index 2479a6587c..ebd84509fd 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -84,6 +84,12 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 	default y if BR2_m68k_cf5208
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. This bug no
+# longer exists in gcc 8.x.
+config BR2_TOOLCHAIN_HAS_GCC_BUG_85180
+	bool
+	default y if BR2_microblaze
+
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85862
 # An infinite loop exists in the find_base_term() logic of 6.x
 # on microblaze.  http://autobuild.buildroot.net/results/158e8ebb39713e1b436a5cc1a1916f46c30694df/
