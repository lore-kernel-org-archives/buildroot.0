From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Mon, 24 Jul 2017 12:50:03 -0700
Subject: [Buildroot] [PATCH v3] package/qt5location: handle plugins being
	conditionally built
Message-ID: <1500925803-3453-1-git-send-email-joshua.henderson@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a build issue [1] where the qt5location plugins are not built, but are
attempted to be installed by buildroot.

The qt5location plugins have dependencies that are automatically and incorrectly
resolved causing plugins to conditionally be built based on whether quick is
available. This change adds a patch for an upstream bug [2] that builds the
plugins directory irrelevant of the quick module.

[1] http://autobuild.buildroot.net/results/bc1/bc13abf3bb2fe1c991aec2334ee658c9641d1fd5/build-end.log
[2] https://bugreports.qt.io/browse/QTBUG-62098

Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>

--

Changes for v3:
- Change commit message to be more inline with actual fix.
- Issue with upstream patch - use Peter's upstream patch instead.

Changes for v2:
- Instead of skipping missing files, fix the root cause of improper dependency
  on quick when building the position plugin.
---
 ...001-Fix-plugins-build-dependency-tracking.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/qt5/qt5location/5.9.1/0001-Fix-plugins-build-dependency-tracking.patch

diff --git a/package/qt5/qt5location/5.9.1/0001-Fix-plugins-build-dependency-tracking.patch b/package/qt5/qt5location/5.9.1/0001-Fix-plugins-build-dependency-tracking.patch
new file mode 100644
index 0000000..df656cc
--- /dev/null
+++ b/package/qt5/qt5location/5.9.1/0001-Fix-plugins-build-dependency-tracking.patch
@@ -0,0 +1,39 @@
+From 3ac051c4549575634cecc706175b019f4ed4c3bf Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 22 Jul 2017 22:47:05 +0200
+Subject: [PATCH] Fix plugins build dependency
+
+Do not build the plugins before the dependency on module positioning for
+the plugin subdir position is available.
+
+Task-number: QTBUG-62098
+Change-Id: Ic7473db937359f3dad47aef0ffa3671be8cbd349
+Reviewed-by: Alex Blasche <alexander.blasche@qt.io>
+---
+ src/src.pro | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/src.pro b/src/src.pro
+index d0a1ee4..0c0bf50 100644
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
+2.7.4
+
-- 
2.7.4
