From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Aug 2015 12:11:20 +0200
Subject: [Buildroot] [git commit] mpd: update to use the gcc version
	dependency mechanism
Message-ID: <20150805101202.53BDE819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bd1e9c96e56b0e49153e750ca33142c61e9cf525
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mpd requires at least gcc 4.6, so use the newly introduced gcc version
dependency mechanism instead of open-coded toolchain dependencies.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/mpd/Config.in |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 65b46df..28962f7 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -4,9 +4,7 @@ menuconfig BR2_PACKAGE_MPD
 	depends on BR2_USE_WCHAR # libglib2, flac
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
-	# sparc & CS powerpc gcc are too old
-	depends on !BR2_sparc
-	depends on !(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 || BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009)
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
 	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBGLIB2
@@ -297,9 +295,8 @@ config BR2_PACKAGE_MPD_UPNP
 
 endif
 
-comment "mpd needs a toolchain w/ C++, threads, wchar"
+comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 4.6"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
-	depends on !BR2_sparc
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
