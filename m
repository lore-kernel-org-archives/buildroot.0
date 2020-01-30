From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 30 Jan 2020 22:16:37 +0100
Subject: [Buildroot] [PATCH-2019.02.x v1 1/2] package/qt5base: add patch to
 fix CVE-2020-0569 for LTS
Message-ID: <20200130211638.25085-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch to fix CVE-2020-0569 for LTS version
(see [1] for details).

[1] https://www.openwall.com/lists/oss-security/2020/01/30/1

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...0005-Do-not-load-plugin-from-the-PWD.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/qt5/qt5base/5.6.3/0005-Do-not-load-plugin-from-the-PWD.patch

diff --git a/package/qt5/qt5base/5.6.3/0005-Do-not-load-plugin-from-the-PWD.patch b/package/qt5/qt5base/5.6.3/0005-Do-not-load-plugin-from-the-PWD.patch
new file mode 100644
index 0000000000..4acd42f005
--- /dev/null
+++ b/package/qt5/qt5base/5.6.3/0005-Do-not-load-plugin-from-the-PWD.patch
@@ -0,0 +1,32 @@
+From bf131e8d2181b3404f5293546ed390999f760404 Mon Sep 17 00:00:00 2001
+From: Olivier Goffart <ogoffart@woboq.com>
+Date: Fri, 8 Nov 2019 11:30:40 +0100
+Subject: [PATCH] Do not load plugin from the $PWD
+
+I see no reason why this would make sense to look for plugins in the current
+directory. And when there are plugins there, it may actually be wrong
+
+Change-Id: I5f5aa168021fedddafce90effde0d5762cd0c4c5
+Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
+
+Upstream: https://code.qt.io/cgit/qt/qtbase.git/commit/?id=bf131e8d2181b3404f5293546ed390999f760404
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/corelib/plugin/qpluginloader.cpp | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/corelib/plugin/qpluginloader.cpp b/src/corelib/plugin/qpluginloader.cpp
+index cadff4f32b..c2443dbdda 100644
+--- a/src/corelib/plugin/qpluginloader.cpp
++++ b/src/corelib/plugin/qpluginloader.cpp
+@@ -305,7 +305,6 @@ static QString locatePlugin(const QString& fileName)
+         paths.append(fileName.left(slash)); // don't include the '/'
+     } else {
+         paths = QCoreApplication::libraryPaths();
+-        paths.prepend(QStringLiteral(".")); // search in current dir first
+     }
+ 
+     for (const QString &path : qAsConst(paths)) {
+-- 
+2.25.0
+
-- 
2.25.0
