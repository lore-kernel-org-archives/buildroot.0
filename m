From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Dec 2014 23:35:59 +0100
Subject: [Buildroot] [PATCH 2/2] package/pinentry: allow building without Qt
	accessibility
In-Reply-To: <cover.1418596437.git.yann.morin.1998@free.fr>
References: <cover.1418596437.git.yann.morin.1998@free.fr>
Message-ID: <b1b44568a4bb46632d5c05cd28b84f3026575957.1418596437.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport a patch applied upstream to allow building without Qt
accessibility.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/pinentry/0002-qt-no-accessibility.patch | 102 ++++++++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 package/pinentry/0002-qt-no-accessibility.patch

diff --git a/package/pinentry/0002-qt-no-accessibility.patch b/package/pinentry/0002-qt-no-accessibility.patch
new file mode 100644
index 0000000..2f9e508
--- /dev/null
+++ b/package/pinentry/0002-qt-no-accessibility.patch
@@ -0,0 +1,102 @@
+commit 484465338ea6f5f12eb1341ca0ef84aa79224ed4
+Author: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date:   Mon Dec 8 16:42:42 2014 +0000
+
+    pinentry-qt4: make the accessibility part optional
+    
+    Check if the Qt libraries have support for QT Accessibility before using
+    it. Otherwise it will raise error like these one:
+    
+    main.cpp: In function 'int qt_cmd_handler(pinentry_t)':
+    main.cpp:220:51: error: 'class QAbstractButton' has no member named
+    'setAccessibleDescription'
+    
+    Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+Backported from upstream.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
-- 
1.9.1
