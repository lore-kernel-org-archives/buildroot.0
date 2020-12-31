From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Dec 2020 14:44:04 +0100
Subject: [Buildroot] [git commit] package/gdb: enable python3 support
Message-ID: <20201231132635.3601C8444A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae18c6bbaf3828d8963101723d8a121dec72866b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gdb python support now uses Python3 if python3 is selected, otherwise
uses python(2) as before.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
[yann.morin.1998 at free.fr: drop the gdb-python-config duplication]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in | 3 +--
 package/gdb/gdb.mk    | 9 ++++++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 48ec3e0202..b1aa5e47d9 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -80,8 +80,7 @@ config BR2_PACKAGE_GDB_TUI
 
 config BR2_PACKAGE_GDB_PYTHON
 	bool "Python support"
-	# Only Python 2.x is supported by gdb for now
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	help
 	  This option enables Python support in the target gdb.
 
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index e35ece0153..b0d0b5fb19 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -194,11 +194,18 @@ GDB_CONF_OPTS += --disable-tui
 endif
 
 ifeq ($(BR2_PACKAGE_GDB_PYTHON),y)
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+# CONF_ENV: for top-level configure; MAKE_ENV: for sub-projects' configure.
+GDB_CONF_ENV += BR_PYTHON_VERSION=$(PYTHON3_VERSION_MAJOR)
+GDB_MAKE_ENV += BR_PYTHON_VERSION=$(PYTHON3_VERSION_MAJOR)
+GDB_DEPENDENCIES += python3
+else
 # CONF_ENV: for top-level configure; MAKE_ENV: for sub-projects' configure.
 GDB_CONF_ENV += BR_PYTHON_VERSION=$(PYTHON_VERSION_MAJOR)
 GDB_MAKE_ENV += BR_PYTHON_VERSION=$(PYTHON_VERSION_MAJOR)
-GDB_CONF_OPTS += --with-python=$(TOPDIR)/package/gdb/gdb-python-config
 GDB_DEPENDENCIES += python
+endif
+GDB_CONF_OPTS += --with-python=$(TOPDIR)/package/gdb/gdb-python-config
 else
 GDB_CONF_OPTS += --without-python
 endif
