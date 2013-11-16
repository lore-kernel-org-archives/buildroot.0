From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Nov 2013 00:54:44 +0100
Subject: [Buildroot] [git commit] wayland: disable on avr32
Message-ID: <20131116235541.6B1219BCF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b5bd7a29694881cf85c653e2307d7b8464a15c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The epoll_create1, timerfd_create and timerfd_settime syscalls are not available
on avr32. Fixes build failures such as the following.

  http://autobuild.buildroot.net/results/43b/43b3df5978782034279604abde8fe5d46c441344/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in |    1 +
 package/wayland/Config.in                     |    2 ++
 package/weston/Config.in                      |    2 ++
 3 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index d6f087d..d028245 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -358,6 +358,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND
 	bool "wayland"
+	depends on !BR2_avr32 # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
 	select BR2_PACKAGE_WAYLAND
 	help
diff --git a/package/wayland/Config.in b/package/wayland/Config.in
index 260832f..c92f9ea 100644
--- a/package/wayland/Config.in
+++ b/package/wayland/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WAYLAND
 	bool "wayland"
+	depends on !BR2_avr32 # no epoll_create1, timerfd_create or timerfd_settime
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_EXPAT
@@ -11,4 +12,5 @@ config BR2_PACKAGE_WAYLAND
 	  http://wayland.freedesktop.org/
 
 comment "wayland needs a toolchain w/ threads"
+	depends on !BR2_avr32
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/weston/Config.in b/package/weston/Config.in
index b7f8468..247efc8 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -1,4 +1,5 @@
 comment "weston needs udev and a toolchain w/ threads"
+	depends on !BR2_avr32
 	depends on !BR2_PACKAGE_UDEV || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_WESTON
@@ -11,6 +12,7 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_MTDEV
 	depends on BR2_PACKAGE_UDEV
+	depends on !BR2_avr32 # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
 	# Runtime dependency
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
