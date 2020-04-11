From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 15:42:46 +0200
Subject: [Buildroot] [git commit] package/gdb: add support for host-gdb with
 python3
Message-ID: <20200411132855.BA3B98E515@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a49c0f157973848bc2eae12edb5a84d462cfb8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-gdb was limited to link only with Python 2 although it's possible
to build Python 3 for host. Add the ability to link with Python 3.

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
[Thomas: add an option to the choice to not have Python support]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in.host | 22 ++++++++++++++++++++--
 package/gdb/gdb.mk         |  3 +++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 2db73b10d6..8de7f8395b 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -32,10 +32,28 @@ config BR2_PACKAGE_HOST_GDB_TUI
 	help
 	  This option enables terminal user interface (TUI) for gdb
 
+choice
+	prompt "Python support"
+	default BR2_PACKAGE_HOST_GDB_NOPYTHON
+	help
+	  Select the version of Python you wish to use
+
+config BR2_PACKAGE_HOST_GDB_NOPYTHON
+	bool "None"
+	help
+	  This option disables Python support in the cross gdb.
+
 config BR2_PACKAGE_HOST_GDB_PYTHON
-	bool "Python support"
+	bool "Python 2"
 	help
-	  This option enables the Python support in the cross gdb.
+	  This option enables the Python 2 support in the cross gdb.
+
+config BR2_PACKAGE_HOST_GDB_PYTHON3
+	bool "Python 3"
+	help
+	  This option enables the Python 3 support in the cross gdb.
+
+endchoice
 
 config BR2_PACKAGE_HOST_GDB_SIM
 	bool "Simulator support"
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 01f7e14460..8c74a0e2f6 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -238,6 +238,9 @@ endif
 ifeq ($(BR2_PACKAGE_HOST_GDB_PYTHON),y)
 HOST_GDB_CONF_OPTS += --with-python=$(HOST_DIR)/bin/python2
 HOST_GDB_DEPENDENCIES += host-python
+else ifeq ($(BR2_PACKAGE_HOST_GDB_PYTHON3),y)
+HOST_GDB_CONF_OPTS += --with-python=$(HOST_DIR)/bin/python3
+HOST_GDB_DEPENDENCIES += host-python3
 else
 HOST_GDB_CONF_OPTS += --without-python
 endif
