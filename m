From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Sep 2014 22:38:36 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/wayland: requires shared library
Message-ID: <1411850316-2299-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
  CC       src/libwayland_server_la-wayland-server.lo
src/wayland-server.c:36:19: error: dlfcn.h: No such file or directory

using this defconfig
http://autobuild.buildroot.net/results/dfd/dfd81f1f1f0f315317b2a85d24b286a277ac7c16/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: propagate this new dependency to packages that select wayland (Yann)

 package/gstreamer1/gst1-plugins-bad/Config.in |    1 +
 package/wayland/Config.in                     |    2 ++
 package/weston/Config.in                      |    2 ++
 3 files changed, 5 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 9cb275d..c455aca 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -372,6 +372,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND
 	bool "wayland"
 	depends on !BR2_avr32 # wayland
+	depends on !BR2_PREFER_STATIC_LIB # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
 	select BR2_PACKAGE_WAYLAND
 	help
diff --git a/package/wayland/Config.in b/package/wayland/Config.in
index c92f9ea..0f78f15 100644
--- a/package/wayland/Config.in
+++ b/package/wayland/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_WAYLAND
 	bool "wayland"
 	depends on !BR2_avr32 # no epoll_create1, timerfd_create or timerfd_settime
+	depends on !BR2_PREFER_STATIC_LIB # dlfcn.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_EXPAT
@@ -14,3 +15,4 @@ config BR2_PACKAGE_WAYLAND
 comment "wayland needs a toolchain w/ threads"
 	depends on !BR2_avr32
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PREFER_STATIC_LIB
diff --git a/package/weston/Config.in b/package/weston/Config.in
index dc7e235..ab26813 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -1,5 +1,6 @@
 comment "weston needs udev and a toolchain w/ threads, headers >= 3.0"
 	depends on !BR2_avr32
+	depends on !BR2_PREFER_STATIC_LIB
 	depends on BR2_ARCH_HAS_ATOMICS
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 
@@ -14,6 +15,7 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_MTDEV
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on !BR2_avr32 # wayland
+	depends on !BR2_PREFER_STATIC_LIB # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	depends on BR2_ARCH_HAS_ATOMICS # cairo
-- 
1.7.10.4
