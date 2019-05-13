From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 May 2019 20:53:47 +0200
Subject: [Buildroot] [git commit] package/mono: needs C++
Message-ID: <20190513184821.1BF8F8869A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6a9b38aa4f063ed6aefeacc99edae9e1ae855c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mono needs a working C++ compiler to get the exact type of size_t since
version 5.16.0.179 and
https://github.com/mono/mono/commit/d8af77551de1f59803a46946786e0f9a5eb5cb9d

Fixes:
 - http://autobuild.buildroot.org/results/ee6d037154127cc6572f06e9a78bae383ea381bc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mono/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mono/Config.in b/package/mono/Config.in
index a375a98448..0d555bfa82 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_MONO_ARCH_SUPPORTS
 config BR2_PACKAGE_MONO
 	bool "mono"
 	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	help
@@ -20,6 +21,7 @@ config BR2_PACKAGE_MONO
 
 	  http://download.mono-project.com/sources/mono/
 
-comment "mono needs a toolchain w/ threads, dynamic library"
+comment "mono needs a toolchain w/ C++, threads, dynamic library"
 	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
