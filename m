From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 12:23:27 +0200
Subject: [Buildroot] [git commit] package/connman: disable for musl
	toolchains
Message-ID: <20160819102337.7740D82132@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ebcc74da68f89aab31c6d3a942e9dda8a0303ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Connman doesn't build with musl toolchains due to several "classic"
musl issues [1] (mixes userspace and kernel headers, missing header)

Upstream received some fixes [2] but they are not yet merged.

Also, gresolv.c use res_ninit() function which is not available
with musl. A fix from Alpinelinux is available [3] but it require
some invasive changes.

Disable connman for musl toolchains for now, and wait for upstream
fixes.

[1] http://wiki.musl-libc.org/wiki/FAQ
[2] https://lists.01.org/pipermail/connman/2016-August/000880.html
    https://lists.01.org/pipermail/connman/2016-August/000881.html
    https://lists.01.org/pipermail/connman/2016-August/000882.html
[3] https://github.com/openembedded/openembedded-core/commit/d08f9d7145ba14ce9fbf320719c05560be69212f

Fixes:
http://autobuild.buildroot.net/results/e88/e88b4dbd4b79fc983b8f7d33da3287966854f8ca
[...]

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/connman-gtk/Config.in | 6 ++++--
 package/connman/Config.in     | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/connman-gtk/Config.in b/package/connman-gtk/Config.in
index c7857d0..467bf7e 100644
--- a/package/connman-gtk/Config.in
+++ b/package/connman-gtk/Config.in
@@ -1,8 +1,9 @@
-comment "connman-gtk needs libgtk3 and a toolchain w/ wchar, threads, resolver, dynamic library"
+comment "connman-gtk needs libgtk3 and a glibc or uClibc toolchain w/ wchar, threads, resolver, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS || !BR2_PACKAGE_LIBGTK3
+		BR2_STATIC_LIBS || !BR2_PACKAGE_LIBGTK3 || \
+		BR2_TOOLCHAIN_USES_MUSL
 
 config BR2_PACKAGE_CONNMAN_GTK
 	bool "connman-gtk"
@@ -11,6 +12,7 @@ config BR2_PACKAGE_CONNMAN_GTK
 	depends on BR2_USE_MMU # libglib2
 	depends on !BR2_STATIC_LIBS # connman
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # connman
+	depends on !BR2_TOOLCHAIN_USES_MUSL # connman
 	depends on BR2_PACKAGE_LIBGTK3
 	select BR2_PACKAGE_CONNMAN
 	select BR2_PACKAGE_LIBGLIB2
diff --git a/package/connman/Config.in b/package/connman/Config.in
index f723a31..6ed40be 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_CONNMAN
 	depends on BR2_USE_MMU # dbus, libglib2
 	depends on !BR2_STATIC_LIBS # needs dlopen()
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_USES_MUSL # mixes userspace and kernel headers
 	help
 	  The Connection Manager (ConnMan) project provides a daemon
 	  for managing internet connections within embedded devices
@@ -66,7 +67,8 @@ config BR2_PACKAGE_CONNMAN_CLIENT
 
 endif # BR2_PACKAGE_CONNMAN
 
-comment "connman needs a toolchain w/ wchar, threads, resolver, dynamic library"
+comment "connman needs a glibc or uClibc toolchain w/ wchar, threads, resolver, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| BR2_TOOLCHAIN_USES_MUSL
