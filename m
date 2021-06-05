From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Jun 2021 22:12:28 +0200
Subject: [Buildroot] [git commit] package/qt5/qt5base: fix build with gcc 11
Message-ID: <20210605194220.6F9088B353@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=128901c80a58924c9e7a16465e30474eaa9fe3b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 11:

/data/buildroot-autobuilder/instance-0/output-1/build/qt5base-5.15.2/include/QtCore/../../src/corelib/global/qfloat16.h:300:7: error: 'numeric_limits' is not a class template
  300 | class numeric_limits<QT_PREPEND_NAMESPACE(qfloat16)> : public numeric_limits<float>
      |       ^~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/9a7a987af40b8408ccdfcae4890008c7090b41a1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...0006-Fix-build-with-GCC-11-include-limits.patch | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/package/qt5/qt5base/0006-Fix-build-with-GCC-11-include-limits.patch b/package/qt5/qt5base/0006-Fix-build-with-GCC-11-include-limits.patch
new file mode 100644
index 0000000000..f014a160d5
--- /dev/null
+++ b/package/qt5/qt5base/0006-Fix-build-with-GCC-11-include-limits.patch
@@ -0,0 +1,53 @@
+From 9c56d4da2ff631a8c1c30475bd792f6c86bda53c Mon Sep 17 00:00:00 2001
+From: Thiago Macieira <thiago.macieira@intel.com>
+Date: Mon, 18 Jan 2021 07:40:54 -0800
+Subject: [PATCH] Fix build with GCC 11: include <limits>
+
+Fixes: QTBUG-90395
+Pick-to: 6.0
+Change-Id: Iecc74d2000eb40dfbe7bfffd165b5dd3708b7a40
+Reviewed-by: Edward Welbourne <edward.welbourne@qt.io>
+
+[Retrieved (and backported) from:
+https://github.com/qt/qtbase/commit/9c56d4da2ff631a8c1c30475bd792f6c86bda53c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/corelib/global/qendian.h  | 6 ++++--
+ src/corelib/global/qfloat16.h | 1 +
+ 2 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/corelib/global/qendian.h b/src/corelib/global/qendian.h
+index 99b529f17cd..c874c5e47ab 100644
+--- a/src/corelib/global/qendian.h
++++ b/src/corelib/global/qendian.h
+@@ -1,7 +1,7 @@
+ /****************************************************************************
+ **
+-** Copyright (C) 2016 The Qt Company Ltd.
+-** Copyright (C) 2016 Intel Corporation.
++** Copyright (C) 2021 The Qt Company Ltd.
++** Copyright (C) 2021 Intel Corporation.
+ ** Contact: https://www.qt.io/licensing/
+ **
+ ** This file is part of the QtCore module of the Qt Toolkit.
+@@ -44,6 +44,8 @@
+ #include <QtCore/qfloat16.h>
+ #include <QtCore/qglobal.h>
+ 
++#include <limits>
++
+ // include stdlib.h and hope that it defines __GLIBC__ for glibc-based systems
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/src/corelib/global/qfloat16.h b/src/corelib/global/qfloat16.h
+index e9477d2ecec..a25fac28862 100644
+--- a/src/corelib/global/qfloat16.h
++++ b/src/corelib/global/qfloat16.h
+@@ -44,6 +44,7 @@
+
+ #include <QtCore/qglobal.h>
+ #include <QtCore/qmetatype.h>
++#include <limits>
+ #include <string.h>
+ 
+ #if defined(QT_COMPILER_SUPPORTS_F16C) && defined(__AVX2__) && !defined(__F16C__)
