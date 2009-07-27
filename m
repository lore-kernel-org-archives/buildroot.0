From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2009 16:11:13 +0200
Subject: [Buildroot] [PATCH 4/4] xconfig: Save the configuration properly in
	qconf
In-Reply-To: <cover.1248703870.git.thomas.petazzoni@free-electrons.com>
References: <cover.1248703870.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6cd6353ff9c0ce93a63e43c4cb61188c6bc0b0f5.1248703870.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/config/kconfig-to-buildroot2.patch |   20 ++++++++++++++++++--
 package/config/qconf.cc                    |    2 ++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/package/config/kconfig-to-buildroot2.patch b/package/config/kconfig-to-buildroot2.patch
index 5f5d8ee..3348b85 100644
--- a/package/config/kconfig-to-buildroot2.patch
+++ b/package/config/kconfig-to-buildroot2.patch
@@ -7,11 +7,11 @@
  gconf.c             |    4 -
  gconf.glade         |    2 
  mconf.c             |   39 +++++++++----------
- qconf.cc            |    3 -
+ qconf.cc            |    5 +-
  util.c              |  105 +++++++++++++++++++++++++++++++++++++++++++++++++++-
  zconf.tab.c_shipped |    2 
  zconf.y             |    2 
- 12 files changed, 239 insertions(+), 103 deletions(-)
+ 12 files changed, 241 insertions(+), 103 deletions(-)
 
 Index: config/Makefile
 ===================================================================
@@ -741,6 +741,22 @@ Index: config/qconf.cc
  	setCaption(title);
  
  	width = configSettings->readNumEntry("/window width", d->width() - 64);
+@@ -1612,6 +1611,7 @@
+ {
+ 	if (!conf_get_changed()) {
+ 		e->accept();
++		conf_write_autoconf();
+ 		return;
+ 	}
+ 	QMessageBox mb("qconf", _("Save configuration?"), QMessageBox::Warning,
+@@ -1622,6 +1622,7 @@
+ 	switch (mb.exec()) {
+ 	case QMessageBox::Yes:
+ 		conf_write(NULL);
++		conf_write_autoconf();
+ 	case QMessageBox::No:
+ 		e->accept();
+ 		break;
 Index: config/util.c
 ===================================================================
 --- config.orig/util.c
diff --git a/package/config/qconf.cc b/package/config/qconf.cc
index 3e539c1..9af12a6 100644
--- a/package/config/qconf.cc
+++ b/package/config/qconf.cc
@@ -1611,6 +1611,7 @@ void ConfigMainWindow::closeEvent(QCloseEvent* e)
 {
 	if (!conf_get_changed()) {
 		e->accept();
+		conf_write_autoconf();
 		return;
 	}
 	QMessageBox mb("qconf", _("Save configuration?"), QMessageBox::Warning,
@@ -1621,6 +1622,7 @@ void ConfigMainWindow::closeEvent(QCloseEvent* e)
 	switch (mb.exec()) {
 	case QMessageBox::Yes:
 		conf_write(NULL);
+		conf_write_autoconf();
 	case QMessageBox::No:
 		e->accept();
 		break;
-- 
1.6.0.4
