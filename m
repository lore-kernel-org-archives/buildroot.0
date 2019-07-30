From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 30 Jul 2019 23:25:22 +0200
Subject: [Buildroot] [PATCH v1] package/qt5base: fix libtool la file
 dependency_libs entries
Message-ID: <20190730212522.29386-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

  libtool:   error: cannot find the library '' or unhandled argument '/.../host/riscv64-buildroot-linux-gnu/sysroot/usr/lib/libQt5Widgets.so'

Add upstream suggested patch ([2]) to  change la file dependency_libs entries
to -L<path> -l<library> version.

[1] http://autobuild.buildroot.net/results/79c1e1b7a1bc53c1e9b2ae0c9acb443e6d2e2994
[2] https://codereview.qt-project.org/c/qt/qtbase/+/269110

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...tool-la-file-dependency_libs-entries.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/qt5/qt5base/5.12.4/0005-qmake-fix-libtool-la-file-dependency_libs-entries.patch

diff --git a/package/qt5/qt5base/5.12.4/0005-qmake-fix-libtool-la-file-dependency_libs-entries.patch b/package/qt5/qt5base/5.12.4/0005-qmake-fix-libtool-la-file-dependency_libs-entries.patch
new file mode 100644
index 0000000000..f340dba060
--- /dev/null
+++ b/package/qt5/qt5base/5.12.4/0005-qmake-fix-libtool-la-file-dependency_libs-entries.patch
@@ -0,0 +1,34 @@
+From 3587189d495c3b9c9700d3bd0c985f2229675f6a Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 30 Jul 2019 22:02:53 +0200
+Subject: [PATCH] qmake: fix libtool la file dependency_libs entries
+
+Some versions of libtool does not handle absolute pathes for dynamic
+libraries, e.g.:
+
+  libtool:   error: cannot find the library '' or unhandled argument '/data/buildroot/buildroot-test/instance-0/output/host/riscv64-buildroot-linux-gnu/sysroot/usr/lib/libQt5Widgets.so'
+
+So change la file dependency_libs entries to -L<path> -l<library> version.
+
+Change-Id: I73eea5e73b859fc78c0642b09f765a4e90c71cdc
+Fixes: QTBUG-76625
+---
+ mkspecs/features/qt.prf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mkspecs/features/qt.prf b/mkspecs/features/qt.prf
+index 89f4946c50..779aa7df3f 100644
+--- a/mkspecs/features/qt.prf
++++ b/mkspecs/features/qt.prf
+@@ -217,7 +217,7 @@ for(ever) {
+                     lib = $$MODULE_LIBS/$$QMAKE_PREFIX_STATICLIB$${lib}.$$QMAKE_EXTENSION_STATICLIB
+                     PRE_TARGETDEPS += $$lib
+                 } else {
+-                    lib = $$MODULE_LIBS/$$QMAKE_PREFIX_SHLIB$${lib}.$$QMAKE_EXTENSION_SHLIB
++                    lib = -L$$MODULE_LIBS -l$${lib}
+                 }
+                 LIBS$$var_sfx += $$lib
+             }
+--
+2.22.0
+
--
2.22.0
