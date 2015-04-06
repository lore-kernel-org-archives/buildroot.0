From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 12:07:37 +0200
Subject: [Buildroot] [git commit] espeak: disable for static-only builds
Message-ID: <20150406100831.270D181994@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f66004ded744000c3e6ed85049fd70a5844098ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Makefile wants to unconditionally build a shared library, and
since it's probably not a package that relevant in static-only
scenarios, let's simply disable it.

Fixes:

  http://autobuild.buildroot.org/results/b84/b84f56cdc22f333b95e0894084a800be53aefd26/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/espeak/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/espeak/Config.in b/package/espeak/Config.in
index 4bb8d4a..94e2816 100644
--- a/package/espeak/Config.in
+++ b/package/espeak/Config.in
@@ -1,5 +1,5 @@
-comment "espeak needs a toolchain w/ C++, wchar, threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+comment "espeak needs a toolchain w/ C++, wchar, threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_ESPEAK
@@ -8,6 +8,8 @@ config BR2_PACKAGE_ESPEAK
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	# does not properly support building only a static version
+	depends on !BR2_STATIC_LIBS
 	help
 	  espeak is a speech synthesizer software for English and
 	  other languages.
