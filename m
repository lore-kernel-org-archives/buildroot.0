From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 14:53:51 +0200
Subject: [Buildroot] [git commit] package/mplayer: needs
	BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <20160704125451.E0F8E7FB60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=54069ccabe7b6fe984bfbb781797f6447fd41a95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though mplayer bundles the ffmpeg code base (and ffmpeg is not
affected by this issue), mplayer uses its own build system and doesn't
test properly for the availability (or not) of atomic operations. In
order to keep things simple, we simply make mplayer depend on the
availability of atomic operations, since it assumes they are available.

The reverse dependency is propagated to libplayer and tovid.

Fixes:

  http://autobuild.buildroot.net/results/6306757da3be9bb7e3cdcbfc8abb4e64a3fb7913/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libplayer/Config.in | 1 +
 package/mplayer/Config.in   | 2 ++
 package/tovid/Config.in     | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index 665b947..37fbb26 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -12,6 +12,7 @@ if BR2_PACKAGE_LIBPLAYER
 config BR2_PACKAGE_LIBPLAYER_MPLAYER
 	bool "mplayer backend"
 	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mplayer
 	select BR2_PACKAGE_MPLAYER
 
 config BR2_PACKAGE_LIBPLAYER_GSTREAMER
diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index 97b1f38..76bb6f0 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
 config BR2_PACKAGE_MPLAYER
 	bool "mplayer"
 	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  MPlayer is a movie player which runs on many systems and supports
@@ -19,6 +20,7 @@ config BR2_PACKAGE_MPLAYER
 
 comment "mplayer needs a toolchain w/ threads"
 	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 if BR2_PACKAGE_MPLAYER
diff --git a/package/tovid/Config.in b/package/tovid/Config.in
index 1288f84..d8052ea 100644
--- a/package/tovid/Config.in
+++ b/package/tovid/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_TOVID
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mplayer
 	# The below dependencies are runtime dependencies only
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps_ng
 	select BR2_PACKAGE_DVDAUTHOR
@@ -30,6 +31,7 @@ comment "tovid needs a toolchain w/ threads, C++, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_USE_WCHAR
