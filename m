From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 12 Dec 2014 15:59:06 +0000
Subject: [Buildroot] [PATCH 2/3] pinentry: pinentry-qt4 - fix .moc include
	paths
In-Reply-To: <1418399947-12517-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1418399947-12517-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1418399947-12517-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The include paths present in the .moc files make reference to the qt
version used by the person who generated the tarball. We need to fix
those paths in order to avoid build errors like these ones:

In file included from pinentryconfirm.cpp:52:0:
pinentryconfirm.moc:9:53: fatal error:
../../../s/pinentry/qt4/pinentryconfirm.h: No such file or directory
 #include "../../../s/pinentry/qt4/pinentryconfirm.h"

In file included from qsecurelineedit.cpp:3602:0:
qsecurelineedit.moc:9:53: fatal error:
../../../s/pinentry/qt4/qsecurelineedit.h: No such file or directory
 #include "../../../s/pinentry/qt4/qsecurelineedit.h"

In file included from pinentrydialog.cpp:347:0:
pinentrydialog.moc:9:52: fatal error:
../../../s/pinentry/qt4/pinentrydialog.h: No such file or directory
 #include "../../../s/pinentry/qt4/pinentrydialog.h"

This issue has been reported upstream:
  https://bugs.g10code.com/gnupg/issue1784

Fixes:
  http://autobuild.buildroot.net/results/62c/62ca977a7a44d1ad2bbf9e5bc2df716d469484de/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/pinentry/0002-fix-moc-include-paths.patch |   62 +++++++++++++++++++++
 1 files changed, 62 insertions(+), 0 deletions(-)
 create mode 100644 package/pinentry/0002-fix-moc-include-paths.patch

diff --git a/package/pinentry/0002-fix-moc-include-paths.patch b/package/pinentry/0002-fix-moc-include-paths.patch
new file mode 100644
index 0000000..ab20ef1
--- /dev/null
+++ b/package/pinentry/0002-fix-moc-include-paths.patch
@@ -0,0 +1,62 @@
+Fix .moc include paths
+
+The include paths present in the .moc files make reference to the Qt 
+version used by the person who generated the tarball. We need to fix 
+those paths in order to avoid build errors like these ones:
+
+In file included from pinentryconfirm.cpp:52:0:
+pinentryconfirm.moc:9:53: fatal error:
+../../../s/pinentry/qt4/pinentryconfirm.h: No such file or directory
+ #include "../../../s/pinentry/qt4/pinentryconfirm.h"
+
+In file included from qsecurelineedit.cpp:3602:0:
+qsecurelineedit.moc:9:53: fatal error:
+../../../s/pinentry/qt4/qsecurelineedit.h: No such file or directory
+ #include "../../../s/pinentry/qt4/qsecurelineedit.h"
+
+In file included from pinentrydialog.cpp:347:0:
+pinentrydialog.moc:9:52: fatal error:
+../../../s/pinentry/qt4/pinentrydialog.h: No such file or directory
+ #include "../../../s/pinentry/qt4/pinentrydialog.h"
+
+This issue has been reported upstream:
+  https://bugs.g10code.com/gnupg/issue1784
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+diff -rup a/qt4/pinentryconfirm.moc b/qt4/pinentryconfirm.moc
+--- a/qt4/pinentryconfirm.moc	2014-09-18 09:35:48.000000000 +0100
++++ b/qt4/pinentryconfirm.moc	2014-12-12 14:41:10.574581901 +0000
+@@ -6,7 +6,7 @@
+ ** WARNING! All changes made in this file will be lost!
+ *****************************************************************************/
+ 
+-#include "../../../s/pinentry/qt4/pinentryconfirm.h"
++#include "pinentryconfirm.h"
+ #if !defined(Q_MOC_OUTPUT_REVISION)
+ #error "The header file 'pinentryconfirm.h' doesn't include <QObject>."
+ #elif Q_MOC_OUTPUT_REVISION != 63
+diff -rup a/qt4/pinentrydialog.moc b/qt4/pinentrydialog.moc
+--- a/qt4/pinentrydialog.moc	2014-09-18 09:35:48.000000000 +0100
++++ b/qt4/pinentrydialog.moc	2014-12-12 14:41:21.438771625 +0000
+@@ -6,7 +6,7 @@
+ ** WARNING! All changes made in this file will be lost!
+ *****************************************************************************/
+ 
+-#include "../../../s/pinentry/qt4/pinentrydialog.h"
++#include "pinentrydialog.h"
+ #if !defined(Q_MOC_OUTPUT_REVISION)
+ #error "The header file 'pinentrydialog.h' doesn't include <QObject>."
+ #elif Q_MOC_OUTPUT_REVISION != 63
+diff -rup a/qt4/qsecurelineedit.moc b/qt4/qsecurelineedit.moc
+--- a/qt4/qsecurelineedit.moc	2014-09-18 09:35:48.000000000 +0100
++++ b/qt4/qsecurelineedit.moc	2014-12-12 14:41:35.279013320 +0000
+@@ -6,7 +6,7 @@
+ ** WARNING! All changes made in this file will be lost!
+ *****************************************************************************/
+ 
+-#include "../../../s/pinentry/qt4/qsecurelineedit.h"
++#include "qsecurelineedit.h"
+ #if !defined(Q_MOC_OUTPUT_REVISION)
+ #error "The header file 'qsecurelineedit.h' doesn't include <QObject>."
+ #elif Q_MOC_OUTPUT_REVISION != 63
-- 
1.7.1
