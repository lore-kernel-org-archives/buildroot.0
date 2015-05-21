From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 May 2015 23:41:13 +0200
Subject: [Buildroot] [git commit] jack2: not available for static only builds
Message-ID: <20150521214332.E166081D99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f84f204df52df9d561235b6977e3482e053dfc0e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/e53/e537a500852ddb8aa0b1155ea9bc8a17636dd50d/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jack2/Config.in |    6 ++++--
 package/mpd/Config.in   |    4 ++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/jack2/Config.in b/package/jack2/Config.in
index eeeb8da..350a342 100644
--- a/package/jack2/Config.in
+++ b/package/jack2/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_JACK2
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBSAMPLERATE
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_ALSA_LIB
@@ -20,7 +21,8 @@ config BR2_PACKAGE_JACK2
 
 	  http://jackaudio.org/
 
-comment "jack2 needs a toolchain w/ threads, C++"
+comment "jack2 needs a toolchain w/ threads, C++, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_ARCH_HAS_ATOMICS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
+		BR2_STATIC_LIBS
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index ed036fe..65b46df 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -226,10 +226,14 @@ config BR2_PACKAGE_MPD_AO
 config BR2_PACKAGE_MPD_JACK2
 	bool "jack2"
 	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_STATIC_LIBS # jack2
 	select BR2_PACKAGE_JACK2
 	help
 	  Enable jack output support.
 
+comment "jack support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_MPD_OSS
 	bool "oss"
 	help
