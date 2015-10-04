From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 14:16:27 +0200
Subject: [Buildroot] [git commit] package/freerdp: needs C++
Message-ID: <20151004121647.9EFDC818F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0611258aeae3b2e311b1c8fbebd337c9567830fb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

FreeRDP does not have a single C++ source file, however it insists on
having a C++ compiler. Removing that requirement is a bit too much
involving, so we just depend on it...

Fixes:
    http://autobuild.buildroot.org/results/e5b/e5bee760d52e5ee433dcb6c8a7296f99312cfcf4/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/Config.in |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index b194515..f8dbb68 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_FREERDP
 	bool "freerdp"
+	# FreeRDP does not have a single C++ source file, however it
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
