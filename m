From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  3 Jul 2018 14:11:33 +0300
Subject: [Buildroot] [PATCH 2018.02.x] procps-ng: disable for musl libc
Message-ID: <3f2a94307e6c380842726b8158e8ec2e9d24372a.1530616293.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The recent procps-ng security bump in commit 88ec06ad484 (procps-ng:
security bump to version 3.3.15) of the 2018.02.x branch, introduced use
of fopencookie() which is a GNU extension that musl version 1.1.8 does
not implement. Backporting the security fixes alone is not feasible.
Disable procps-ng for musl libc toolchains.

Propagate this dependency to procps-ng reverse dependencies that used to
allow build with musl, openvmtools and tovid.

Fixes:
http://autobuild.buildroot.net/results/eac/eac700c61e277689b46fd617b6ddcbf94b5271e5/
http://autobuild.buildroot.net/results/baa/baac54b934d5ac07d3604ae3c6016595e4d7014a/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/openvmtools/Config.in | 6 +++---
 package/procps-ng/Config.in   | 5 +++++
 package/tovid/Config.in       | 6 ++++--
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index 72c0293de725..66d4f1b1585f 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_OPENVMTOOLS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_ENABLE_LOCALE
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBDNET
 	help
@@ -47,9 +47,9 @@ comment "PAM support needs a glibc toolchain w/ dynamic library"
 
 endif
 
-comment "openvmtools needs a glibc or musl toolchain w/ wchar, threads, RPC, locale"
+comment "openvmtools needs a glibc toolchain w/ wchar, threads, RPC, locale"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HAS_NATIVE_RPC || !BR2_ENABLE_LOCALE || \
-		BR2_TOOLCHAIN_USES_UCLIBC
+		!BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/procps-ng/Config.in b/package/procps-ng/Config.in
index 6ff898320204..d9e884faee5e 100644
--- a/package/procps-ng/Config.in
+++ b/package/procps-ng/Config.in
@@ -2,9 +2,14 @@ config BR2_PACKAGE_PROCPS_NG
 	bool "procps-ng"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on !BR2_TOOLCHAIN_USES_MUSL # fopencookie()
 	select BR2_PACKAGE_NCURSES
 	help
 	  Standard informational utilities and process-handling tools.
 	  Provides things like kill, ps, uptime, free, top, etc...
 
 	  http://sourceforge.net/projects/procps-ng/
+
+comment "procps-ng needs a glibc or uclibc toolchain"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/tovid/Config.in b/package/tovid/Config.in
index d8052ea334c6..a22dca8e1e43 100644
--- a/package/tovid/Config.in
+++ b/package/tovid/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_TOVID
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mplayer
+	depends on !BR2_TOOLCHAIN_USES_MUSL # procps-ng
 	# The below dependencies are runtime dependencies only
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps_ng
 	select BR2_PACKAGE_DVDAUTHOR
@@ -27,14 +28,15 @@ config BR2_PACKAGE_TOVID
 
 	  http://tovid.wikia.com/wiki/Installing_tovid
 
-comment "tovid needs a toolchain w/ threads, C++, wchar"
+comment "tovid needs a glibc or uclibc toolchain w/ threads, C++, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_USE_WCHAR
+		|| !BR2_USE_WCHAR \
+		|| BR2_TOOLCHAIN_USES_MUSL
 
 comment "tovid depends on python or python3"
 	depends on !BR2_PACKAGE_PYTHON && !BR2_PACKAGE_PYTHON3
-- 
2.18.0
