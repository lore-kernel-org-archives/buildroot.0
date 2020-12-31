From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Dec 2020 10:53:12 +0100
Subject: [Buildroot] [PATCH 3/3] package/gdb: enable python3 support
In-Reply-To: <cover.1609408378.git.yann.morin.1998@free.fr>
References: <cover.1609408378.git.yann.morin.1998@free.fr>
Message-ID: <fe77e8e75e5b741486a8f94798b41a5379992684.1609408378.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Titouan Christophe <titouan.christophe@railnova.eu>

gdb python support now uses Python3 if python3 is selected, otherwise
uses python(2) as before.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
[yann.morin.1998 at free.fr: drop the gdb-python-config duplication]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
-- 
2.25.1
