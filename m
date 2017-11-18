From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 18 Nov 2017 21:40:57 +0100
Subject: [Buildroot] [PATCH v1] qt5connectivity: fix examples compile
 without Qt gui module
Message-ID: <20171118204057.1143-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream suggested patch to fix heartrate-server (needs only
core and bluetooth modules).

Fixes [1]:

  make[3]: Entering directory `.../build/qt5connectivity-5.9.2/examples/bluetooth'
  cd heartrate-server/ && ( test -e Makefile || .../output/host/bin/qmake -o Makefile .../build/qt5connectivity-5.9.2/examples/bluetooth/heartrate-server/heartrate-server.pro ) && /usr/bin/make -f Makefile
  Project ERROR: Unknown module(s) in QT: gui
  make[3]: *** [sub-heartrate-server-make_first] Error 3
  make[3]: Leaving directory `.../build/qt5connectivity-5.9.2/examples/bluetooth'

[1] http://autobuild.buildroot.net/results/387a21fe7fc672e5668b0afddc138cbb7197d234

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...rtrate-server-needs-only-core-and-bluetoo.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/qt5/qt5connectivity/0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch

diff --git a/package/qt5/qt5connectivity/0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch b/package/qt5/qt5connectivity/0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch
new file mode 100644
index 0000000000..cb0e8d18b1
--- /dev/null
+++ b/package/qt5/qt5connectivity/0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch
@@ -0,0 +1,32 @@
+From 13c2f56cc9c3bbfe0c96031107e7fafd437703d9 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 18 Nov 2017 21:07:44 +0100
+Subject: [PATCH] Example heartrate-server needs only core and bluetooth module
+
+Fixes compile with disabled gui module.
+
+Task-number: QTBUG-64597
+Change-Id: I376dede3db987e524f97070344cc119e0ee1d187
+
+Upstream: https://codereview.qt-project.org/211810
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ examples/bluetooth/heartrate-server/heartrate-server.pro | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/examples/bluetooth/heartrate-server/heartrate-server.pro b/examples/bluetooth/heartrate-server/heartrate-server.pro
+index 4ccf486c..edd011b9 100644
+--- a/examples/bluetooth/heartrate-server/heartrate-server.pro
++++ b/examples/bluetooth/heartrate-server/heartrate-server.pro
+@@ -1,7 +1,7 @@
+ TEMPLATE = app
+ TARGET = heartrate-server
+ 
+-QT += bluetooth
++QT = core bluetooth
+ CONFIG += c++11
+ 
+ SOURCES += main.cpp
+-- 
+2.14.2
+
-- 
2.14.2
