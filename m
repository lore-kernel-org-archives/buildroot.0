From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 18 Jun 2015 18:44:28 +0200
Subject: [Buildroot] [PATCH 05/10] pinentry: bump to version 0.9.4
In-Reply-To: <1434645873-26849-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1434645873-26849-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1434645873-26849-5-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump to version 0.9.4
- Update hash file
- Remove upstreamed patches

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/pinentry/0001-fix-include-paths.patch   |  42 ----------
 package/pinentry/0002-qt-no-accessibility.patch | 102 ------------------------
 package/pinentry/pinentry.hash                  |   2 +-
 package/pinentry/pinentry.mk                    |   2 +-
 4 files changed, 2 insertions(+), 146 deletions(-)
 delete mode 100644 package/pinentry/0001-fix-include-paths.patch
 delete mode 100644 package/pinentry/0002-qt-no-accessibility.patch

diff --git a/package/pinentry/0001-fix-include-paths.patch b/package/pinentry/0001-fix-include-paths.patch
deleted file mode 100644
index c18a613..0000000
--- a/package/pinentry/0001-fix-include-paths.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-qt4: fix include paths
-
-Fix include paths in generated .moc files.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN pinentry-0.9.0.orig/qt4/pinentryconfirm.moc pinentry-0.9.0/qt4/pinentryconfirm.moc
---- pinentry-0.9.0.orig/qt4/pinentryconfirm.moc	2014-09-18 10:35:48.000000000 +0200
-+++ pinentry-0.9.0/qt4/pinentryconfirm.moc	2014-12-14 23:09:52.086048672 +0100
-@@ -6,7 +6,7 @@
- ** WARNING! All changes made in this file will be lost!
- *****************************************************************************/
- 
--#include "../../../s/pinentry/qt4/pinentryconfirm.h"
-+#include "qt4/pinentryconfirm.h"
- #if !defined(Q_MOC_OUTPUT_REVISION)
- #error "The header file 'pinentryconfirm.h' doesn't include <QObject>."
- #elif Q_MOC_OUTPUT_REVISION != 63
-diff -durN pinentry-0.9.0.orig/qt4/pinentrydialog.moc pinentry-0.9.0/qt4/pinentrydialog.moc
---- pinentry-0.9.0.orig/qt4/pinentrydialog.moc	2014-09-18 10:35:48.000000000 +0200
-+++ pinentry-0.9.0/qt4/pinentrydialog.moc	2014-12-14 23:09:36.357871032 +0100
-@@ -6,7 +6,7 @@
- ** WARNING! All changes made in this file will be lost!
- *****************************************************************************/
- 
--#include "../../../s/pinentry/qt4/pinentrydialog.h"
-+#include "qt4/pinentrydialog.h"
- #if !defined(Q_MOC_OUTPUT_REVISION)
- #error "The header file 'pinentrydialog.h' doesn't include <QObject>."
- #elif Q_MOC_OUTPUT_REVISION != 63
-diff -durN pinentry-0.9.0.orig/qt4/qsecurelineedit.moc pinentry-0.9.0/qt4/qsecurelineedit.moc
---- pinentry-0.9.0.orig/qt4/qsecurelineedit.moc	2014-09-18 10:35:48.000000000 +0200
-+++ pinentry-0.9.0/qt4/qsecurelineedit.moc	2014-12-14 23:09:18.693671498 +0100
-@@ -6,7 +6,7 @@
- ** WARNING! All changes made in this file will be lost!
- *****************************************************************************/
- 
--#include "../../../s/pinentry/qt4/qsecurelineedit.h"
-+#include "qt4/qsecurelineedit.h"
- #if !defined(Q_MOC_OUTPUT_REVISION)
- #error "The header file 'qsecurelineedit.h' doesn't include <QObject>."
- #elif Q_MOC_OUTPUT_REVISION != 63
diff --git a/package/pinentry/0002-qt-no-accessibility.patch b/package/pinentry/0002-qt-no-accessibility.patch
deleted file mode 100644
index 2f9e508..0000000
--- a/package/pinentry/0002-qt-no-accessibility.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-commit 484465338ea6f5f12eb1341ca0ef84aa79224ed4
-Author: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date:   Mon Dec 8 16:42:42 2014 +0000
-
-    pinentry-qt4: make the accessibility part optional
-    
-    Check if the Qt libraries have support for QT Accessibility before using
-    it. Otherwise it will raise error like these one:
-    
-    main.cpp: In function 'int qt_cmd_handler(pinentry_t)':
-    main.cpp:220:51: error: 'class QAbstractButton' has no member named
-    'setAccessibleDescription'
-    
-    Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-Backported from upstream.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff --git a/qt4/main.cpp b/qt4/main.cpp
-index 106999e..b2a69f2 100644
---- a/qt4/main.cpp
-+++ b/qt4/main.cpp
-@@ -217,8 +217,9 @@ qt_cmd_handler (pinentry_t pe)
-       for ( size_t i = 0 ; i < sizeof buttonLabels / sizeof *buttonLabels ; ++i )
-         if ( (buttons & buttonLabels[i].button) && !buttonLabels[i].label.isEmpty() ) {
-             box.button( buttonLabels[i].button )->setText( buttonLabels[i].label );
-+#ifndef QT_NO_ACCESSIBILITY
-             box.button( buttonLabels[i].button )->setAccessibleDescription ( buttonLabels[i].label );
--
-+#endif
-         }
- 
-       box.setIconPixmap( icon() );
-diff --git a/qt4/pinentryconfirm.cpp b/qt4/pinentryconfirm.cpp
-index dfbd19f..6b3d545 100644
---- a/qt4/pinentryconfirm.cpp
-+++ b/qt4/pinentryconfirm.cpp
-@@ -30,8 +30,10 @@ PinentryConfirm::PinentryConfirm(Icon icon, int timeout, const QString &title,
- 	connect(_timer, SIGNAL(timeout()), this, SLOT(slotTimeout()));
- 	_timer->start(timeout*1000);
-     }
-+#ifndef QT_NO_ACCESSIBILITY
-     setAccessibleDescription (desc);
-     setAccessibleName (title);
-+#endif
-     raiseWindow (this);
- }
- 
-diff --git a/qt4/pinentrydialog.cpp b/qt4/pinentrydialog.cpp
-index 3a6dacc..456f022 100644
---- a/qt4/pinentrydialog.cpp
-+++ b/qt4/pinentrydialog.cpp
-@@ -217,7 +217,9 @@ void PinEntryDialog::setDescription( const QString& txt )
- {
-   _desc->setVisible( !txt.isEmpty() );
-   _desc->setText( txt );
-+#ifndef QT_NO_ACCESSIBILITY
-   _desc->setAccessibleDescription ( txt );
-+#endif
-   _icon->setPixmap( icon() );
-   setError( QString::null );
- }
-@@ -231,7 +233,9 @@ void PinEntryDialog::setError( const QString& txt )
- {
-   if( !txt.isNull() )_icon->setPixmap( icon( QStyle::SP_MessageBoxCritical ) );
-   _error->setText( txt );
-+#ifndef QT_NO_ACCESSIBILITY
-   _error->setAccessibleDescription ( txt );
-+#endif
-   _error->setVisible( !txt.isEmpty() );
- }
- 
-@@ -264,14 +268,18 @@ QString PinEntryDialog::prompt() const
- void PinEntryDialog::setOkText( const QString& txt )
- {
-   _ok->setText( txt );
-+#ifndef QT_NO_ACCESSIBILITY
-   _ok->setAccessibleDescription ( txt );
-+#endif
-   _ok->setVisible( !txt.isEmpty() );
- }
- 
- void PinEntryDialog::setCancelText( const QString& txt )
- {
-   _cancel->setText( txt );
-+#ifndef QT_NO_ACCESSIBILITY
-   _cancel->setAccessibleDescription ( txt );
-+#endif
-   _cancel->setVisible( !txt.isEmpty() );
- }
- 
-@@ -279,7 +287,9 @@ void PinEntryDialog::setQualityBar( const QString& txt )
- {
-   if (_have_quality_bar) {
-     _quality_bar_label->setText( txt );
-+#ifndef QT_NO_ACCESSIBILITY
-     _quality_bar_label->setAccessibleDescription ( txt );
-+#endif
-   }
- }
- 
diff --git a/package/pinentry/pinentry.hash b/package/pinentry/pinentry.hash
index 851c721..d544efd 100644
--- a/package/pinentry/pinentry.hash
+++ b/package/pinentry/pinentry.hash
@@ -1,2 +1,2 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  f8e5c774c35fbb91d84e82559baf76f6b4513236  pinentry-0.9.0.tar.bz2
+sha1  0c47f0ddea4631bcba01ebbeca8bffe0bf43e440  pinentry-0.9.4.tar.bz2
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
index c4d83ee..e8db342 100644
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PINENTRY_VERSION = 0.9.0
+PINENTRY_VERSION = 0.9.4
 PINENTRY_SOURCE = pinentry-$(PINENTRY_VERSION).tar.bz2
 PINENTRY_SITE = ftp://ftp.gnupg.org/gcrypt/pinentry
 PINENTRY_LICENSE = GPLv2+
-- 
2.3.6
