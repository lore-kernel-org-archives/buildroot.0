From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 12 Dec 2014 15:59:05 +0000
Subject: [Buildroot] [PATCH 1/3] pinentry: pinentry-qt4 - make the
	accessibility part optional
Message-ID: <1418399947-12517-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backporting an upstream patch to check if the Qt libraries have support
for Qt Accessibility before using it. Otherwise it will raise errors
like these one:

main.cpp: In function 'int qt_cmd_handler(pinentry_t)':
main.cpp:220:51: error: 'class QAbstractButton' has no member named
'setAccessibleDescription'

Backported upstream patch:
  http://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=commit;h=484465338ea6f5f12eb1341ca0ef84aa79224ed4

Fixes:
  http://autobuild.buildroot.net/results/62c/62ca977a7a44d1ad2bbf9e5bc2df716d469484de/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...-qt4-make-the-accessibility-part-optional.patch |  112 ++++++++++++++++++++
 1 files changed, 112 insertions(+), 0 deletions(-)
 create mode 100644 package/pinentry/0001-pinentry-qt4-make-the-accessibility-part-optional.patch

diff --git a/package/pinentry/0001-pinentry-qt4-make-the-accessibility-part-optional.patch b/package/pinentry/0001-pinentry-qt4-make-the-accessibility-part-optional.patch
new file mode 100644
index 0000000..1b49edd
--- /dev/null
+++ b/package/pinentry/0001-pinentry-qt4-make-the-accessibility-part-optional.patch
@@ -0,0 +1,112 @@
+pinentry-qt4: make the accessibility part optional
+
+Backported upstream patch:
+  http://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=commit;h=484465338ea6f5f12eb1341ca0ef84aa79224ed4
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From 484465338ea6f5f12eb1341ca0ef84aa79224ed4 Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Mon, 8 Dec 2014 16:42:42 +0000
+Subject: [PATCH] pinentry-qt4: make the accessibility part optional
+
+Check if the Qt libraries have support for QT Accessibility before using
+it. Otherwise it will raise error like these one:
+
+main.cpp: In function 'int qt_cmd_handler(pinentry_t)':
+main.cpp:220:51: error: 'class QAbstractButton' has no member named
+'setAccessibleDescription'
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ qt4/main.cpp            |    3 ++-
+ qt4/pinentryconfirm.cpp |    2 ++
+ qt4/pinentrydialog.cpp  |   10 ++++++++++
+ 3 files changed, 14 insertions(+), 1 deletions(-)
+
+diff --git a/qt4/main.cpp b/qt4/main.cpp
+index 106999e..b2a69f2 100644
+--- a/qt4/main.cpp
++++ b/qt4/main.cpp
+@@ -217,8 +217,9 @@ qt_cmd_handler (pinentry_t pe)
+       for ( size_t i = 0 ; i < sizeof buttonLabels / sizeof *buttonLabels ; ++i )
+         if ( (buttons & buttonLabels[i].button) && !buttonLabels[i].label.isEmpty() ) {
+             box.button( buttonLabels[i].button )->setText( buttonLabels[i].label );
++#ifndef QT_NO_ACCESSIBILITY
+             box.button( buttonLabels[i].button )->setAccessibleDescription ( buttonLabels[i].label );
+-
++#endif
+         }
+ 
+       box.setIconPixmap( icon() );
+diff --git a/qt4/pinentryconfirm.cpp b/qt4/pinentryconfirm.cpp
+index dfbd19f..6b3d545 100644
+--- a/qt4/pinentryconfirm.cpp
++++ b/qt4/pinentryconfirm.cpp
+@@ -30,8 +30,10 @@ PinentryConfirm::PinentryConfirm(Icon icon, int timeout, const QString &title,
+ 	connect(_timer, SIGNAL(timeout()), this, SLOT(slotTimeout()));
+ 	_timer->start(timeout*1000);
+     }
++#ifndef QT_NO_ACCESSIBILITY
+     setAccessibleDescription (desc);
+     setAccessibleName (title);
++#endif
+     raiseWindow (this);
+ }
+ 
+diff --git a/qt4/pinentrydialog.cpp b/qt4/pinentrydialog.cpp
+index 3a6dacc..456f022 100644
+--- a/qt4/pinentrydialog.cpp
++++ b/qt4/pinentrydialog.cpp
+@@ -217,7 +217,9 @@ void PinEntryDialog::setDescription( const QString& txt )
+ {
+   _desc->setVisible( !txt.isEmpty() );
+   _desc->setText( txt );
++#ifndef QT_NO_ACCESSIBILITY
+   _desc->setAccessibleDescription ( txt );
++#endif
+   _icon->setPixmap( icon() );
+   setError( QString::null );
+ }
+@@ -231,7 +233,9 @@ void PinEntryDialog::setError( const QString& txt )
+ {
+   if( !txt.isNull() )_icon->setPixmap( icon( QStyle::SP_MessageBoxCritical ) );
+   _error->setText( txt );
++#ifndef QT_NO_ACCESSIBILITY
+   _error->setAccessibleDescription ( txt );
++#endif
+   _error->setVisible( !txt.isEmpty() );
+ }
+ 
+@@ -264,14 +268,18 @@ QString PinEntryDialog::prompt() const
+ void PinEntryDialog::setOkText( const QString& txt )
+ {
+   _ok->setText( txt );
++#ifndef QT_NO_ACCESSIBILITY
+   _ok->setAccessibleDescription ( txt );
++#endif
+   _ok->setVisible( !txt.isEmpty() );
+ }
+ 
+ void PinEntryDialog::setCancelText( const QString& txt )
+ {
+   _cancel->setText( txt );
++#ifndef QT_NO_ACCESSIBILITY
+   _cancel->setAccessibleDescription ( txt );
++#endif
+   _cancel->setVisible( !txt.isEmpty() );
+ }
+ 
+@@ -279,7 +287,9 @@ void PinEntryDialog::setQualityBar( const QString& txt )
+ {
+   if (_have_quality_bar) {
+     _quality_bar_label->setText( txt );
++#ifndef QT_NO_ACCESSIBILITY
+     _quality_bar_label->setAccessibleDescription ( txt );
++#endif
+   }
+ }
+ 
+-- 
+1.7.1
+
-- 
1.7.1
