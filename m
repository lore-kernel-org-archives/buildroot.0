From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  1 Sep 2010 14:04:58 +0200
Subject: [Buildroot] [PATCH 06/11] Remove unnecessary ugly hacks in
	package/config
In-Reply-To: <cover.1283342666.git.thomas.petazzoni@free-electrons.com>
References: <cover.1283342666.git.thomas.petazzoni@free-electrons.com>
Message-ID: <723f01dafa2fe577e823711ebaa4656224a4fffa.1283342666.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Those hacks should not be needed and they even make "mconf" fail to
save the configuration file in $(CONFIG_DIR).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/config/conf.c                              |    4 --
 package/config/mconf.c                             |    2 +-
 .../patches/13-use-conf-write-autoconf.patch       |   53 --------------------
 package/config/patches/series                      |    1 -
 package/config/qconf.cc                            |    2 -
 5 files changed, 1 insertions(+), 61 deletions(-)
 delete mode 100644 package/config/patches/13-use-conf-write-autoconf.patch

diff --git a/package/config/conf.c b/package/config/conf.c
index 2449ca0..2062b57 100644
--- a/package/config/conf.c
+++ b/package/config/conf.c
@@ -640,10 +640,6 @@ int main(int ac, char **av)
 			fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
 			exit(1);
 		}
-		if (conf_write_autoconf()) {
-			fprintf(stderr, _("\n*** Error during update of the Buildroot configuration.\n\n"));
-			return 1;
-		}
 	}
 	return 0;
 }
diff --git a/package/config/mconf.c b/package/config/mconf.c
index 317e478..3d1ed3a 100644
--- a/package/config/mconf.c
+++ b/package/config/mconf.c
@@ -862,6 +862,6 @@ int main(int ac, char **av)
 			"\n\n"));
 	}
 
-	return conf_write_autoconf();
+	return 0;
 }
 
diff --git a/package/config/patches/13-use-conf-write-autoconf.patch b/package/config/patches/13-use-conf-write-autoconf.patch
deleted file mode 100644
index 8297dd9..0000000
--- a/package/config/patches/13-use-conf-write-autoconf.patch
+++ /dev/null
@@ -1,53 +0,0 @@
----
- conf.c   |    4 ++++
- mconf.c  |    2 +-
- qconf.cc |    2 ++
- 3 files changed, 7 insertions(+), 1 deletion(-)
-
-Index: config.new/conf.c
-===================================================================
---- config.new.orig/conf.c
-+++ config.new/conf.c
-@@ -641,6 +641,10 @@
- 			fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
- 			exit(1);
- 		}
-+		if (conf_write_autoconf()) {
-+			fprintf(stderr, _("\n*** Error during update of the Buildroot configuration.\n\n"));
-+			return 1;
-+		}
- 	}
- 	return 0;
- }
-Index: config.new/mconf.c
-===================================================================
---- config.new.orig/mconf.c
-+++ config.new/mconf.c
-@@ -862,6 +862,6 @@
- 			"\n\n"));
- 	}
- 
--	return 0;
-+	return conf_write_autoconf();
- }
- 
-Index: config.new/qconf.cc
-===================================================================
---- config.new.orig/qconf.cc
-+++ config.new/qconf.cc
-@@ -1612,6 +1612,7 @@
- {
- 	if (!conf_get_changed()) {
- 		e->accept();
-+		conf_write_autoconf();
- 		return;
- 	}
- 	QMessageBox mb("qconf", _("Save configuration?"), QMessageBox::Warning,
-@@ -1622,6 +1623,7 @@
- 	switch (mb.exec()) {
- 	case QMessageBox::Yes:
- 		conf_write(NULL);
-+		conf_write_autoconf();
- 	case QMessageBox::No:
- 		e->accept();
- 		break;
diff --git a/package/config/patches/series b/package/config/patches/series
index 997befd..defdf58 100644
--- a/package/config/patches/series
+++ b/package/config/patches/series
@@ -8,5 +8,4 @@
 10-br-build-system.patch
 11-use-mktemp-for-lxdialog.patch
 12-fix-glade-file-path.patch
-13-use-conf-write-autoconf.patch
 14-support-out-of-tree-config.patch
diff --git a/package/config/qconf.cc b/package/config/qconf.cc
index 0fe8fd4..bbda3c8 100644
--- a/package/config/qconf.cc
+++ b/package/config/qconf.cc
@@ -1612,7 +1612,6 @@ void ConfigMainWindow::closeEvent(QCloseEvent* e)
 {
 	if (!conf_get_changed()) {
 		e->accept();
-		conf_write_autoconf();
 		return;
 	}
 	QMessageBox mb("qconf", _("Save configuration?"), QMessageBox::Warning,
@@ -1623,7 +1622,6 @@ void ConfigMainWindow::closeEvent(QCloseEvent* e)
 	switch (mb.exec()) {
 	case QMessageBox::Yes:
 		conf_write(NULL);
-		conf_write_autoconf();
 	case QMessageBox::No:
 		e->accept();
 		break;
-- 
1.7.0.4
