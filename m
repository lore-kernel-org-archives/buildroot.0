From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 23:47:30 +0100
Subject: [Buildroot] [PATCH v2 06/17] jack2: use the proper
	BR2_TOOLCHAIN_HAS_SYNC_x symbol
In-Reply-To: <1453934861-26364-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453934861-26364-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1453934861-26364-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move away from BR2_ARCH_HAS_ATOMICS and use BR2_TOOLCHAIN_HAS_SYNC_4
instead for the jack2 package and its reverse dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/jack2/Config.in | 4 ++--
 package/mpd/Config.in   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/jack2/Config.in b/package/jack2/Config.in
index 350a342..94cb7e0 100644
--- a/package/jack2/Config.in
+++ b/package/jack2/Config.in
@@ -3,8 +3,8 @@ config BR2_PACKAGE_JACK2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_LIBSAMPLERATE
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_ALSA_LIB
@@ -23,6 +23,6 @@ config BR2_PACKAGE_JACK2
 
 comment "jack2 needs a toolchain w/ threads, C++, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_ARCH_HAS_ATOMICS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
 		BR2_STATIC_LIBS
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 618bea9..6480a08 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -230,13 +230,14 @@ config BR2_PACKAGE_MPD_HTTPD_OUTPUT
 
 config BR2_PACKAGE_MPD_JACK2
 	bool "jack2"
-	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_STATIC_LIBS # jack2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_JACK2
 	help
 	  Enable jack output support.
 
 comment "jack support needs a toolchain w/ dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_MPD_OSS
-- 
2.6.4
