From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 1 Feb 2020 23:45:33 +0100
Subject: [Buildroot] [git commit] package/qt5base: add upstream security
 patch for LTS variant
Message-ID: <20200201223444.416CD880D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0607b38c862a6bd556d6f8c1a7d503bab9ede75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixed the following security issue:

- CVE-2020-0569: QPluginLoader in Qt versions 5.0.0 through 5.13.2 would
  search for certain plugins first on the current working directory of the
  application, which allows an attacker that can place files in the file
  system and influence the working directory of Qt-based applications to
  load and execute malicious code.  This issue was verified on macOS and
  Linux and probably affects all other Unix operating systems.  This issue
  does not affect Windows.

For details, see the advisory:
https://www.openwall.com/lists/oss-security/2020/01/30/1

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Peter: extend commit message]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0005-Do-not-load-plugin-from-the-PWD.patch     | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

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
