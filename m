From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Mar 2016 19:56:37 -0300
Subject: [Buildroot] [PATCH] gtkmm3: depends on libgtk3
Message-ID: <1458687397-1678-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

packages shouldn't select libgtk3 directly, just depend on it, like for
libgtk2.
In the past libgtk3 didn't require any *GL backend and the dead-end
solution/last resort was the broadway (networked) gdk backend - though
not very useful it didn't require any funky dependencies.
But now we do. Fixes:
http://autobuild.buildroot.net/results/794/794c7ed221432e46a810fc281732ba417cd4cda3/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gtkmm3/Config.in | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/gtkmm3/Config.in b/package/gtkmm3/Config.in
index 8859f6e..ef62a1f 100644
--- a/package/gtkmm3/Config.in
+++ b/package/gtkmm3/Config.in
@@ -1,11 +1,9 @@
-comment "gtkmm3 needs a toolchain w/ C++, wchar, threads, gcc >= 4.8"
+comment "gtkmm3 needs libgtk3 and a toolchain w/ C++, wchar, threads, gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "gtkmm3 needs an OpenGL EGL backend"
-	depends on !BR2_PACKAGE_HAS_LIBEGL
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GTKMM3
 	bool "gtkmm3"
@@ -20,11 +18,10 @@ config BR2_PACKAGE_GTKMM3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_MMU # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_WCHAR # *mm/libgtk3 -> libglib2
-	depends on BR2_PACKAGE_HAS_LIBEGL # libgtk3 -> libepoxy
+	depends on BR2_PACKAGE_LIBGTK3
 	select BR2_PACKAGE_ATKMM
 	select BR2_PACKAGE_CAIROMM
 	select BR2_PACKAGE_GLIBMM
-	select BR2_PACKAGE_LIBGTK3
 	select BR2_PACKAGE_LIBSIGC
 	select BR2_PACKAGE_PANGOMM
 	help
-- 
2.7.3
