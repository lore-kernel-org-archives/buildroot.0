From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 30 Jan 2020 22:13:35 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/qt5base: add patches to fix
 CVE-2020-0569 and CVE-2020-0570 for latest
In-Reply-To: <20200130211335.24913-1-ps.report@gmx.net>
References: <20200130211335.24913-1-ps.report@gmx.net>
Message-ID: <20200130211335.24913-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patches to fix CVE-2020-0569 and CVE-2020-0570 for
latest qt version (for details see [1]).

[1] https://www.openwall.com/lists/oss-security/2020/01/30/1

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...0003-Do-not-load-plugin-from-the-PWD.patch | 32 ++++++++++
 ...-not-attempt-to-load-a-library-relat.patch | 59 +++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 package/qt5/qt5base/5.12.5/0003-Do-not-load-plugin-from-the-PWD.patch
 create mode 100644 package/qt5/qt5base/5.12.5/0004-QLibrary-Unix-do-not-attempt-to-load-a-library-relat.patch

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
-- 
2.25.0
