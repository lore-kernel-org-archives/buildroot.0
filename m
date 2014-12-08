From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 8 Dec 2014 15:41:32 +0000
Subject: [Buildroot] [PATCH] pinentry: Fix pinentry-qt4 build failure
Message-ID: <1418053293-64672-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- pinentry-qt4 needs Qt with accessibility support, so remove the
'-no-accessibility' configure option in the 'package/qt/qt.mk' file to
build Qt with accessibility support. Otherwise the build process will
fail showing errors like these ones:

pinentrydialog.moc:9:52: fatal error:
../../../s/pinentry/qt4/pinentrydialog.h: No such file or directory

main.cpp: In function 'int qt_cmd_handler(pinentry_t)':
main.cpp:220:51: error: 'class QAbstractButton' has no member named
'setAccessibleDescription'

- The options to disable pinentry-gtk(1) and pinentry-qt(3) are no
longer needed.

- The include paths in the .moc files under the 'pinentry-0.9.0/qt4'
directory are wrong. Add a patch to fix it so we avoid a build failure
like this one:

In file included from pinentryconfirm.cpp:52:0:
pinentryconfirm.moc:9:53: fatal error:
../../../s/pinentry/qt4/pinentryconfirm.h: No such file or directory
 #include "../../../s/pinentry/qt4/pinentryconfirm.h"

This issue has been reported upstream:
  https://bugs.g10code.com/gnupg/issue1784

Fixes:
  http://autobuild.buildroot.org/results/314/314de324a09f64f8b95882ca169c77847d75680c/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 .../0001-fix-the-include-paths-in-moc-files.patch  |   43 ++++++++++++++++++++
 package/pinentry/pinentry.mk                       |    4 +-
 package/qt/qt.mk                                   |    1 -
 3 files changed, 44 insertions(+), 4 deletions(-)
 create mode 100644 package/pinentry/0001-fix-the-include-paths-in-moc-files.patch

diff --git a/package/pinentry/0001-fix-the-include-paths-in-moc-files.patch b/package/pinentry/0001-fix-the-include-paths-in-moc-files.patch
new file mode 100644
index 0000000..32d5665
--- /dev/null
+++ b/package/pinentry/0001-fix-the-include-paths-in-moc-files.patch
@@ -0,0 +1,43 @@
+Fix the include paths in moc files
+
+Reported upstream:
+  https://bugs.g10code.com/gnupg/issue1784
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+diff -rup a/qt4/pinentryconfirm.moc b/qt4/pinentryconfirm.moc
+--- a/qt4/pinentryconfirm.moc	2014-09-18 09:35:48.000000000 +0100
++++ b/qt4/pinentryconfirm.moc	2014-12-08 10:58:24.632153123 +0000
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
++++ b/qt4/pinentrydialog.moc	2014-12-08 10:58:34.360322276 +0000
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
++++ b/qt4/qsecurelineedit.moc	2014-12-08 10:58:45.000507284 +0000
+@@ -6,7 +6,7 @@
+ ** WARNING! All changes made in this file will be lost!
+ *****************************************************************************/
+ 
+-#include "../../../s/pinentry/qt4/qsecurelineedit.h"
++#include "qsecurelineedit.h"
+ #if !defined(Q_MOC_OUTPUT_REVISION)
+ #error "The header file 'qsecurelineedit.h' doesn't include <QObject>."
+ #elif Q_MOC_OUTPUT_REVISION != 63
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index 56e8e71..d4f0560 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -10,9 +10,7 @@ PINENTRY_SITE = ftp://ftp.gnupg.org/gcrypt/pinentry
 PINENTRY_LICENSE = GPLv2+
 PINENTRY_LICENSE_FILES = COPYING
 PINENTRY_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-PINENTRY_CONF_OPTS = --disable-pinentry-gtk # gtk1
-PINENTRY_CONF_OPTS += --disable-pinentry-qt  # qt3
-PINENTRY_CONF_OPTS += --without-libcap       # requires PAM
+PINENTRY_CONF_OPTS = --without-libcap # requires PAM
 
 # build with X if available
 ifeq ($(BR2_PACKAGE_XORG7),y)
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 255d6d2..5e0fc6e 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -513,7 +513,6 @@ define QT_CONFIGURE_CMDS
 		-no-xinerama \
 		-no-cups \
 		-no-nis \
-		-no-accessibility \
 		-no-separate-debug-info \
 		-prefix /usr \
 		-plugindir /usr/lib/qt/plugins \
-- 
1.7.1
