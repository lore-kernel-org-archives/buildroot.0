From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  9 Jan 2016 22:13:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/vlc: disable for static-only builds
Message-ID: <1452374016-16908-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

vlc configure errors out for a non-shared build:
http://git.videolan.org/gitweb.cgi?p=vlc.git;a=blob;f=configure.ac;h=d44151b3fb507141ce7f9b98e95fa11edcdaac01;hb=HEAD#l450

Fixes
http://autobuild.buildroot.net/results/f93/f93771b4f76b82197b930e6fde5eb7aebfe9c910/
http://autobuild.buildroot.net/results/4af/4af880a8a8a37efd57e12e18d43183ba49f5cbe0/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/vlc/Config.in b/package/vlc/Config.in
index e2b8da9..03e85c3 100644
--- a/package/vlc/Config.in
+++ b/package/vlc/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_VLC
 	bool "vlc"
 	depends on (BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_NG || BR2_TOOLCHAIN_USES_GLIBC) # spawn.h
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
@@ -31,7 +32,7 @@ config BR2_PACKAGE_VLC_OPENCV3_BACKEND
 	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT
 
-comment "vlc needs a uclibc snapshot, uclibc-ng or (e)glibc toolchain w/ C++, wchar, threads, headers >= 3.7"
+comment "vlc needs a uclibc snapshot, uclibc-ng or (e)glibc toolchain w/ C++, dynamic library, wchar, threads, headers >= 3.7"
 	depends on !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_NG || BR2_TOOLCHAIN_USES_GLIBC) \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
+		|| !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
-- 
2.6.4
