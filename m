From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 21:50:46 +0200
Subject: [Buildroot] [git commit] qt5location: fix plugins build dependency
Message-ID: <20170725194637.04CAA81971@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52995092e1560130f342e2a3a050ec0852119d59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not build the plugins before the dependency on module positioning for
the plugin subdir position is available (add Add upstream patch
0001-Fix-plugins-build-dependency.patch [1]).

Fixes [2]:

  cp -dpfr .../output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/qt/plugins/position .../output/target/usr/lib/qt/plugins/
  cp: cannot stat '.../output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/qt/plugins/position': No such file or directory

[1] https://code.qt.io/cgit/qt/qtlocation.git/patch/?id=3ac051c4549575634cecc706175b019f4ed4c3bf
[2] http://autobuild.buildroot.net/results/bc1/bc13abf3bb2fe1c991aec2334ee658c9641d1fd5

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Fix-plugins-build-dependency.patch        | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/qt5/qt5location/0001-Fix-plugins-build-dependency.patch b/package/qt5/qt5location/0001-Fix-plugins-build-dependency.patch
new file mode 100644
index 0000000..7db2027
--- /dev/null
+++ b/package/qt5/qt5location/0001-Fix-plugins-build-dependency.patch
@@ -0,0 +1,42 @@
+From 3ac051c4549575634cecc706175b019f4ed4c3bf Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 22 Jul 2017 22:47:05 +0200
+Subject: Fix plugins build dependency
+
+Do not build the plugins before the dependency on module positioning for
+the plugin subdir position is available.
+
+Task-number: QTBUG-62098
+Change-Id: Ic7473db937359f3dad47aef0ffa3671be8cbd349
+Reviewed-by: Alex Blasche <alexander.blasche@qt.io>
+
+Upstream: https://code.qt.io/cgit/qt/qtlocation.git/patch/?id=3ac051c4549575634cecc706175b019f4ed4c3bf
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/src.pro | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/src.pro b/src/src.pro
+index d0a1ee4e7..0c0bf50b1 100644
+--- a/src/src.pro
++++ b/src/src.pro
+@@ -7,8 +7,6 @@ SUBDIRS += positioning
+ positioning.depends = 3rdparty/clip2tri
+ 
+ qtHaveModule(quick) {
+-    plugins.depends += positioning
+-
+     SUBDIRS += location
+     location.depends += positioning 3rdparty/clip2tri
+ 
+@@ -18,6 +16,7 @@ qtHaveModule(quick) {
+     imports.depends += positioning location
+ }
+ 
++plugins.depends += positioning
+ SUBDIRS += plugins
+ 
+ !android:contains(QT_CONFIG, private_tests) {
+-- 
+cgit v1.1-6-g87c4
+
