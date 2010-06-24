From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Thu, 24 Jun 2010 17:33:07 +0200
Subject: [Buildroot] [PATCH v4] package: Add support for clex filemanager (v
	3.19)
In-Reply-To: <201006240025.11012.PeterHuewe@gmx.de>
References: <201005130115.00927.PeterHuewe@gmx.de>
	<201005141421.51373.PeterHuewe@gmx.de>
	<201006240025.11012.PeterHuewe@gmx.de>
Message-ID: <201006241733.08033.PeterHuewe@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Huewe <peterhuewe@gmx.de>

Clex is a free and open source ncurses filemanager.
(somewhat similar to a lightweight midnight commander)

"It displays directory contents including the file status
details and provides features like command history, filename
insertion, or name completion in order to help users to create
commands to be executed by the shell."

For more information visit http://www.clex.sk/about.html

This patch adds version 3.19 to the buildroot buildsystem.

Tested on and compiled with atmel ngw100_defconfig.

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
Indented Help text correctly (1tab 2 spaces)

 package/Config.in                   |    1 +
 package/clex/Config.in              |    6 ++++++
 package/clex/clex-3.19-delkey.patch |   11 +++++++++++
 package/clex/clex.mk                |   28 ++++++++++++++++++++++++++++
 4 files changed, 46 insertions(+), 0 deletions(-)
 create mode 100644 package/clex/Config.in
 create mode 100644 package/clex/clex-3.19-delkey.patch
 create mode 100644 package/clex/clex.mk

diff --git a/package/Config.in b/package/Config.in
index 5ce01a0..be969b4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -460,6 +460,7 @@ source "package/logrotate/Config.in"
 source "package/screen/Config.in"
 source "package/sudo/Config.in"
 source "package/which/Config.in"
+source "package/clex/Config.in"
 endmenu
 
 menu "System tools"
diff --git a/package/clex/Config.in b/package/clex/Config.in
new file mode 100644
index 0000000..612c75d
--- /dev/null
+++ b/package/clex/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_CLEX
+	bool "clex filemanager"
+	select BR2_PACKAGE_NCURSES
+	help
+	  Ncurses file manager with a full-screen user interface
+	  http://www.clex.sk/
diff --git a/package/clex/clex-3.19-delkey.patch b/package/clex/clex-3.19-delkey.patch
new file mode 100644
index 0000000..ccda3d7
--- /dev/null
+++ b/package/clex/clex-3.19-delkey.patch
@@ -0,0 +1,11 @@
+--- clex-3.19/src/inout.c.orig	2010-05-14 01:06:44.000000000 +0200
++++ clex-3.19/src/inout.c	2010-05-14 01:10:46.000000000 +0200
+@@ -301,6 +301,8 @@ kbd_getraw(void)
+ 			continue;
+ 		}
+ #endif
++		if (key == 0177) /* my term uses this key for backspace DEL in ascii */
++			key=CH_CTRL('H');
+ 		return key;
+ 	}
+ }
diff --git a/package/clex/clex.mk b/package/clex/clex.mk
new file mode 100644
index 0000000..a03d15c
--- /dev/null
+++ b/package/clex/clex.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# clex filemanager
+#
+#
+# CLEX (pronounced KLEKS) is a file manager with a full-screen
+# user interface. It displays directory contents including the
+# file status details and provides features like command history,
+# filename insertion, or name completion in order to help users
+# to create commands to be executed by the shell.
+#
+# CLEX is a versatile tool for system administrators and all
+# users that utilize the enormous power of the command line.
+# Its unique one-panel user interface enhances productivity
+# and lessens the probability of mistake. There are no
+# built-in commands, CLEX is an add-on to your favorite shell.
+#
+# CLEX is free software released under the terms of GNU
+# General Public License. It is written in C language which
+# makes it easily portable to various Linux and UNIX systems.
+#
+#  Buildroot Script by Peter Huewe <peterhuewe@gmx.de>
+#
+#############################################################
+CLEX_VERSION:=3.19
+CLEX_SITE:=http://www.clex.sk/download/
+CLEX_DEPENDENCIES = ncurses
+$(eval $(call AUTOTARGETS,package,clex))
-- 
1.7.1
