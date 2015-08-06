From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 08:27:42 +0200
Subject: [Buildroot] [git commit] package/libcec: needs gcc >= 4.7
Message-ID: <20150806062749.0413181E75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=712bb469da4966fa03a251f3fe8bdc18a89569ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As per upstream, gcc-4.7 is required to build libcec:
    https://github.com/Pulse-Eight/libcec/issues/78#issuecomment-91578591

Fixes:
    http://autobuild.buildroot.org/results/3b5/3b5611725c13668472482ed4ad3b46886d4c63d9/
    http://autobuild.buildroot.org/results/0d0/0d032cdd8dbf6d0ddef392c3e5a734881e00ee64/
    http://autobuild.buildroot.org/results/c21/c21c555c38261f6911349ff9fdac6edeb4debaac/
    [...]

Possibly fixes:
    http://autobuild.buildroot.org/results/4a7/4a7b2af2fc3924255ac89e18f4f5c90bb8383265/
    http://autobuild.buildroot.org/results/dd6/dd61c186e6d85a9b30cd32edb74a52f7a4f73cc8/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in   |    4 +++-
 package/libcec/Config.in |    6 ++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index c3b3183..797f59d 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -158,13 +158,15 @@ config BR2_PACKAGE_KODI_LIBCEC
 	bool "hdmi cec"
 	depends on !BR2_STATIC_LIBS # libcec
 	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # libcec
 	select BR2_PACKAGE_LIBCEC
 	help
 	  Enable CEC (Consumer Electronics Control) support.
 	  Select this if you want Kodi to support HDMI CEC.
 
 comment "hdmi cec support needs udev /dev management and a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS || !BR2_PACKAGE_HAS_UDEV
+	depends on BR2_STATIC_LIBS || !BR2_PACKAGE_HAS_UDEV || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 
 config BR2_PACKAGE_KODI_LIRC
 	bool "lirc"
diff --git a/package/libcec/Config.in b/package/libcec/Config.in
index 2cf011d..2dddc53 100644
--- a/package/libcec/Config.in
+++ b/package/libcec/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBCEC
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	select BR2_PACKAGE_LIBPLATFORM
 	help
 	  libcec allows you in combination with the right hardware to
@@ -12,6 +13,7 @@ config BR2_PACKAGE_LIBCEC
 
 	  http://libcec.pulse-eight.com
 
-comment "libcec needs a toolchain w/ C++, wchar, threads, dynamic library"
+comment "libcec needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 4.7"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_USE_WCHAR || BR2_STATIC_LIBS
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
+		BR2_STATIC_LIBS
