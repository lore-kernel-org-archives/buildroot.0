From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 25 Nov 2017 22:54:25 +0100
Subject: [Buildroot] [PATCH v1] qt5quickcontrols2: fix examples compile
 without Qt widgets module
Message-ID: <20171125215425.21880-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream suggested patch to fix flatstyle example configure
(needs widgets module).

Fixes:

  cd flatstyle/ && ( test -e Makefile || .../host/bin/qmake -o Makefile .../build/qt5quickcontrols2-5.9.2/examples/quickcontrols2/flatstyle/flatstyle.pro ) && make -f Makefile
  Project ERROR: Unknown module(s) in QT: widgets
  make[1]: *** [Makefile:202: sub-flatstyle-make_first] Error 3
  make[1]: Leaving directory '.../build/qt5quickcontrols2-5.9.2/examples/quickcontrols2'
  make: *** [Makefile:45: sub-quickcontrols2-make_first] Error 2

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Note: tested with patch '[PATCH v5] qt5: remove Qt Quick dependency on opengl'
applied.
---
 ...01-Example-flatstyle-needs-widgets-module.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/qt5/qt5quickcontrols2/5.9.2/0001-Example-flatstyle-needs-widgets-module.patch

diff --git a/package/qt5/qt5quickcontrols2/5.9.2/0001-Example-flatstyle-needs-widgets-module.patch b/package/qt5/qt5quickcontrols2/5.9.2/0001-Example-flatstyle-needs-widgets-module.patch
new file mode 100644
index 0000000000..17e3b3610e
--- /dev/null
+++ b/package/qt5/qt5quickcontrols2/5.9.2/0001-Example-flatstyle-needs-widgets-module.patch
@@ -0,0 +1,31 @@
+From 10d92524cd6736c767c9ce55a1d9b9f1a2a69a9f Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 25 Nov 2017 22:26:58 +0100
+Subject: [PATCH] Example flatstyle needs widgets module
+
+Fixes compile with disabled widgets module.
+
+Task-number: QTBUG-64761
+Change-Id: I743884d77d51e89061d87cab006bab0cafc9ddb7
+
+Upstream: https://codereview.qt-project.org/212583
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ examples/quickcontrols2/quickcontrols2.pro | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/examples/quickcontrols2/quickcontrols2.pro b/examples/quickcontrols2/quickcontrols2.pro
+index 858759f..8310e9b 100644
+--- a/examples/quickcontrols2/quickcontrols2.pro
++++ b/examples/quickcontrols2/quickcontrols2.pro
+@@ -6,5 +6,6 @@ SUBDIRS += \
+     contactlist \
+     sidepanel \
+     swipetoremove \
+-    flatstyle \
+     wearable
++
++qtHaveModule(widgets): SUBDIRS += flatstyle
+-- 
+2.7.4
+
-- 
2.15.0
