From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Oct 2015 13:08:18 +0100
Subject: [Buildroot] [PATCH] package/freerdp: needs C++
Message-ID: <1443960498-22728-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FreeRDP does not have a single C++ source file, however it insists on
having a C++ compiler. Removing that requirement is a bit too much
involving, so we just depend on it...

Fixes:
    http://autobuild.buildroot.org/results/e5b/e5bee760d52e5ee433dcb6c8a7296f99312cfcf4/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/freerdp/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index b194515..cd61f41 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_FREERDP
 	bool "freerdp"
+	# FreeRDP doesn ot have a single C++ source file, however it
+	# insists on having a C++ compiler. Removing that requirement
+	# is a bit too much involving, so we just depend on it...
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS # uses dlfcn.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -79,6 +83,6 @@ config BR2_PACKAGE_FREERDP_CLIENT_WL
 
 endif
 
-comment "freerdp needs a toolchain w/ wchar, dynamic library, threads"
+comment "freerdp needs a toolchain w/ wchar, dynamic library, threads, C++"
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_HAS_THREADS
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
-- 
1.9.1
