From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Aug 2015 20:00:41 +0200
Subject: [Buildroot] [PATCH 9/9] mpd: update to use the gcc version
	dependency mechanism
In-Reply-To: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1438711241-31792-10-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mpd requires at least gcc 4.6, so use the newly introduced gcc version
dependency mechanism instead of open-coded toolchain dependencies.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/Config.in | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

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
-- 
2.5.0
