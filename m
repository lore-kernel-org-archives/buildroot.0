From: Brock Williams <brock@cottonwoodcomputer.com>
Date: Mon, 28 Aug 2017 08:50:55 -0600
Subject: [Buildroot] [PATCH v2] add package for pdmenu
Message-ID: <1503931855-20693-1-git-send-email-brock@cottonwoodcomputer.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Brock Williams <brock@cottonwoodcomputer.com>
---
Changes v1 -> v2:
  - feedback from Thomas Petazzoni
  - add to DEVELOPERS
  - fix sorting in Config.in
  - change depends on to select
  - fix whitespace / wrapping 
  - add hash file
  - add comment header

 DEVELOPERS                 |  3 +++
 package/Config.in          |  1 +
 package/pdmenu/Config.in   | 15 +++++++++++++++
 package/pdmenu/pdmenu.hash |  1 +
 package/pdmenu/pdmenu.mk   | 15 +++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/pdmenu/Config.in
 create mode 100644 package/pdmenu/pdmenu.hash
 create mode 100644 package/pdmenu/pdmenu.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 73686e2..f3e0dbd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -326,6 +326,9 @@ N:	Bogdan Radulescu <bogdan@nimblex.net>
 F:	package/iftop/
 F:	package/ncdu/
 
+N:	Brock Williams <brock@cottonwoodcomputer.com>
+F:	package/pdmenu/
+
 N:	Bryan Brinsko <bryan.brinsko@rockwellcollins.com>
 F:	package/pps-tools/
 
diff --git a/package/Config.in b/package/Config.in
index a512827..d837a08 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1837,6 +1837,7 @@ comment "Utilities"
 	source "package/lockfile-progs/Config.in"
 	source "package/logrotate/Config.in"
 	source "package/logsurfer/Config.in"
+	source "package/pdmenu/Config.in"
 	source "package/pinentry/Config.in"
 	source "package/ranger/Config.in"
 	source "package/screen/Config.in"
diff --git a/package/pdmenu/Config.in b/package/pdmenu/Config.in
new file mode 100644
index 0000000..8f35f61
--- /dev/null
+++ b/package/pdmenu/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PDMENU
+	bool "pdmenu"
+	depends on BR2_USE_MMU # slang
+	select BR2_PACKAGE_SLANG
+	help
+	  Pdmenu is a full screen menuing system for Unix. It is
+	  designed to be easy to use, and is suitable as a login shell
+	  for inexperienced users, or it can just be ran at the
+	  command line as a handy menu.
+
+	  Pdmenu features color support and GPM mouse support at the
+	  Linux console. It was developed on Linux, and has now been
+	  compiled on many other unixes without problems.
+
+	  https://joeyh.name/code/pdmenu/
diff --git a/package/pdmenu/pdmenu.hash b/package/pdmenu/pdmenu.hash
new file mode 100644
index 0000000..be6d27a
--- /dev/null
+++ b/package/pdmenu/pdmenu.hash
@@ -0,0 +1 @@
+md5	0623b992572511d5fd90d481c426fa40	pdmenu_1.3.4.tar.gz
diff --git a/package/pdmenu/pdmenu.mk b/package/pdmenu/pdmenu.mk
new file mode 100644
index 0000000..f3d9fba
--- /dev/null
+++ b/package/pdmenu/pdmenu.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# pdmenu
+#
+################################################################################
+
+PDMENU_VERSION = 1.3.4
+PDMENU_SOURCE = pdmenu_$(PDMENU_VERSION).tar.gz
+PDMENU_SITE = http://http.debian.net/debian/pool/main/p/pdmenu
+PDMENU_LICENSE = GPL-2.0+
+PDMENU_LICENSE_FILES = COPYING.GPLv2
+PDMENU_DEPENDENCIES = slang
+PDMENU_INSTALL_TARGET_OPTS = INSTALL_PREFIX=$(TARGET_DIR) install
+
+$(eval $(autotools-package))
-- 
2.7.4
