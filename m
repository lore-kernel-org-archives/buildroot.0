From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 21:12:28 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/qt5base: add
 upstream security patches for latest variant
Message-ID: <20200307202451.2F0138FBF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=218c777b657f9d9a1f5475e2decfdf19e837f4aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Fixed the following security issue:

- CVE-2020-0569: QPluginLoader in Qt versions 5.0.0 through 5.13.2 would
  search for certain plugins first on the current working directory of the
  application, which allows an attacker that can place files in the file
  system and influence the working directory of Qt-based applications to
  load and execute malicious code.  This issue was verified on macOS and
  Linux and probably affects all other Unix operating systems.  This issue
  does not affect Windows.

- CVE-2020-0570: QLibrary in Qt versions 5.12.0 through 5.14.0, on certain
  x86 machines, would search for certain libraries and plugins relative to
  current working directory of the application, which allows an attacker
  that can place files in the file system and influence the working
  directory of Qt-based applications to load and execute malicious code.
  This issue was verified on Linux and probably affects all Unix operating
  systems, other than macOS (Darwin).  This issue does not affect Windows.

For details, see the advisory:
https://www.openwall.com/lists/oss-security/2020/01/30/1

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Peter: extend commit message]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f5e4100c08b6e4cd6f4d389c865614384ba234d3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-Do-not-load-plugin-from-the-PWD.patch     | 32 ++++++++++++
 ...ix-do-not-attempt-to-load-a-library-relat.patch | 59 ++++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/package/qt5/qt5base/5.12.5/0003-Do-not-load-plugin-from-the-PWD.patch b/package/qt5/qt5base/5.12.5/0003-Do-not-load-plugin-from-the-PWD.patch
new file mode 100644
index 0000000000..4acd42f005
--- /dev/null
+++ b/package/qt5/qt5base/5.12.5/0003-Do-not-load-plugin-from-the-PWD.patch
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
diff --git a/package/qt5/qt5base/5.12.5/0004-QLibrary-Unix-do-not-attempt-to-load-a-library-relat.patch b/package/qt5/qt5base/5.12.5/0004-QLibrary-Unix-do-not-attempt-to-load-a-library-relat.patch
new file mode 100644
index 0000000000..5004851a71
--- /dev/null
+++ b/package/qt5/qt5base/5.12.5/0004-QLibrary-Unix-do-not-attempt-to-load-a-library-relat.patch
@@ -0,0 +1,59 @@
+From e6f1fde24f77f63fb16b2df239f82a89d2bf05dd Mon Sep 17 00:00:00 2001
+From: Thiago Macieira <thiago.macieira@intel.com>
+Date: Fri, 10 Jan 2020 09:26:27 -0800
+Subject: [PATCH] QLibrary/Unix: do not attempt to load a library relative to
+ $PWD
+
+I added the code in commit 5219c37f7c98f37f078fee00fe8ca35d83ff4f5d to
+find libraries in a haswell/ subdir of the main path, but we only need
+to do that transformation if the library is contains at least one
+directory seprator. That is, if the user asks to load "lib/foo", then we
+should try "lib/haswell/foo" (often, the path prefix will be absolute).
+
+When the library name the user requested has no directory separators, we
+let dlopen() do the transformation for us. Testing on Linux confirms
+glibc does so:
+
+$ LD_DEBUG=libs /lib64/ld-linux-x86-64.so.2 --inhibit-cache ./qml -help |& grep Xcursor
+   1972475:     find library=libXcursor.so.1 [0]; searching
+   1972475:       trying file=/usr/lib64/haswell/avx512_1/libXcursor.so.1
+   1972475:       trying file=/usr/lib64/haswell/libXcursor.so.1
+   1972475:       trying file=/usr/lib64/libXcursor.so.1
+   1972475:     calling init: /usr/lib64/libXcursor.so.1
+   1972475:     calling fini: /usr/lib64/libXcursor.so.1 [0]
+
+Fixes: QTBUG-81272
+Change-Id: I596aec77785a4e4e84d5fffd15e89689bb91ffbb
+Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
+
+Upstream: https://code.qt.io/cgit/qt/qtbase.git/commit/?id=e6f1fde24f77f63fb16b2df239f82a89d2bf05dd
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/corelib/plugin/qlibrary_unix.cpp | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/corelib/plugin/qlibrary_unix.cpp b/src/corelib/plugin/qlibrary_unix.cpp
+index f0de1010d7..135b82cd37 100644
+--- a/src/corelib/plugin/qlibrary_unix.cpp
++++ b/src/corelib/plugin/qlibrary_unix.cpp
+@@ -1,7 +1,7 @@
+ /****************************************************************************
+ **
+ ** Copyright (C) 2016 The Qt Company Ltd.
+-** Copyright (C) 2018 Intel Corporation
++** Copyright (C) 2020 Intel Corporation
+ ** Contact: https://www.qt.io/licensing/
+ **
+ ** This file is part of the QtCore module of the Qt Toolkit.
+@@ -218,6 +218,8 @@ bool QLibraryPrivate::load_sys()
+         for(int suffix = 0; retry && !pHnd && suffix < suffixes.size(); suffix++) {
+             if (!prefixes.at(prefix).isEmpty() && name.startsWith(prefixes.at(prefix)))
+                 continue;
++            if (path.isEmpty() && prefixes.at(prefix).contains(QLatin1Char('/')))
++                continue;
+             if (!suffixes.at(suffix).isEmpty() && name.endsWith(suffixes.at(suffix)))
+                 continue;
+             if (loadHints & QLibrary::LoadArchiveMemberHint) {
+-- 
+2.25.0
+
