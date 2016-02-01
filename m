From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2016 19:32:42 +0100
Subject: [Buildroot] [git commit] vlc: remove dependency on C library
Message-ID: <20160201224713.BF7D17F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0fed01a500f5a3e5a4b2779021c16bd4c9d31369
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

vlc uses <spawn.h> which was not available in old uClibc
versions. However, since we are removing support for uClibc 0.9.33, we
can get rid of such dependency. In addition, <spawn.h> is provided by
musl, and therefore VLC can be enabled with this C library.

Consequently, this commit completely removes any C library dependency for
the vlc package.  The only special case that needs to be handled is the
Blackfin external toolchain from Analog Devices, which still uses an old
uClibc version that doesn't provide <spawn.h>, but as vlc uses fork() we add
a depends on BR2_USE_MMU (which covers the blackfin toolchain).

[Peter: add BR2_USE_MMU dependency]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Romain Naour <romain.naour@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/vlc/Config.in b/package/vlc/Config.in
index 03e85c3..166e7d2 100644
--- a/package/vlc/Config.in
+++ b/package/vlc/Config.in
@@ -5,7 +5,7 @@ endif
 
 config BR2_PACKAGE_VLC
 	bool "vlc"
-	depends on (BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_NG || BR2_TOOLCHAIN_USES_GLIBC) # spawn.h
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
@@ -32,7 +32,7 @@ config BR2_PACKAGE_VLC_OPENCV3_BACKEND
 	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT
 
-comment "vlc needs a uclibc snapshot, uclibc-ng or (e)glibc toolchain w/ C++, dynamic library, wchar, threads, headers >= 3.7"
-	depends on !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_NG || BR2_TOOLCHAIN_USES_GLIBC) \
-		|| !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_USE_WCHAR \
+comment "vlc needs a toolchain w/ C++, dynamic library, wchar, threads, headers >= 3.7"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
