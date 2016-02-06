From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2016 23:53:05 +0100
Subject: [Buildroot] [git commit] samba4: add dependency on
	BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <20160206225410.B33F080826@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d2de713fbdeb89456c6914a1407eb483785cda8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

samba4 uses the __sync_fetch_and_add_4() atomic built-in, so it should
depend on BR2_TOOLCHAIN_HAS_SYNC_4 in order to avoid build failures on
architectures not providing this atomic built-in.

Fixes:

  http://autobuild.buildroot.org/results/0d0fd9d2a132a40a840bea5df59c35d8573ebf45/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in   | 1 +
 package/mpd/Config.in    | 1 +
 package/samba4/Config.in | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index a657f5b..7d28882 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -215,6 +215,7 @@ config BR2_PACKAGE_KODI_LIBSMBCLIENT
 	bool "samba"
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_SAMBA4
 	help
 	  Enable Samba support
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index a7da01f..b368397 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -200,6 +200,7 @@ config BR2_PACKAGE_MPD_LIBSMBCLIENT
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_SAMBA4
 	help
 	  Enable Samba support.
diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index c53adba..2503785 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -1,4 +1,5 @@
 comment "samba4 needs a toolchain w/ RPC, wchar, dynamic library, threads"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_NATIVE_RPC \
 		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
@@ -12,6 +13,7 @@ config BR2_PACKAGE_SAMBA4
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python -> libffi
 	depends on !BR2_STATIC_LIBS # python
 	depends on !BR2_nios2 # binary too large, relocations don't fit
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_PYTHON
