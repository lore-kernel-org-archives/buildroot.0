From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Nov 2013 23:45:30 +0100
Subject: [Buildroot] [git commit] xorg: needs thread support
Message-ID: <20131110225806.A7A4599ACF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c10f4c1e44f2c439130412cbca29d94e6e3a426
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libpthread-stubs, libX11, and a few more xorg packages use threads. Since
almost all xorg packages depend on libX11 directory or indirectly, and
since the remaining ones are pretty useless on their own, just require
threads for xorg as a whole.

The thread dependency is kept in libpthread-stubs, because that package
will move out of the x11r7 directory later (pending patch by Spenser
Gilliland), so the dependency on threads will be required then.

Fixes:
  http://autobuild.buildroot.org/results/609/6099baac4bb469ae18aab6512233db25183eaabd/

[Arnout: disable all of xorg, correct comment]
Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/Config.in                       |    5 +++--
 package/x11r7/xlib_libpthread-stubs/Config.in |    4 ++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 09bc078..94cf7c6 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -1,6 +1,7 @@
 menuconfig BR2_PACKAGE_XORG7
 	bool "X.org X Window System"
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Support for X11R7 libraries, servers, drivers, and/or
 	  applications in the target.
@@ -261,5 +262,5 @@ if BR2_PACKAGE_XORG7
 	endmenu
 endif
 
-comment "X.org needs a toolchain w/ wchar"
-        depends on !BR2_USE_WCHAR
+comment "X.org needs a toolchain w/ wchar, threads"
+        depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/x11r7/xlib_libpthread-stubs/Config.in b/package/x11r7/xlib_libpthread-stubs/Config.in
index fb53585..6ce1b94 100644
--- a/package/x11r7/xlib_libpthread-stubs/Config.in
+++ b/package/x11r7/xlib_libpthread-stubs/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
 	bool "libpthread-stubs"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  This library provides weak aliases for pthread functions not
 	  provided in libc or otherwise available by default.
 
 	  http://xcb.freedesktop.org/
+
+comment "libpthread-stubs needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
