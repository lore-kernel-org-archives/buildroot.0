From: Angelos Oikonomopoulos <angelos@igalia.com>
Date: Thu,  9 Apr 2020 13:46:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/gdb: allow building against python3
 for host-gdb
Message-ID: <20200409114638.16432-1-angelos@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some gdb extensions require python3, so this simply adds a
configuration option to point the host GDB at python3.

Signed-off-by: Angelos Oikonomopoulos <angelos@igalia.com>
---
 package/gdb/Config.in.host | 14 ++++++++++++++
 package/gdb/gdb.mk         |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 2db73b10d6..553166b340 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -37,6 +37,20 @@ config BR2_PACKAGE_HOST_GDB_PYTHON
 	help
 	  This option enables the Python support in the cross gdb.
 
+if BR2_PACKAGE_HOST_GDB_PYTHON
+
+choice  BR2_PACKAGE_HOST_GDB_PYTHON_VERSION
+	prompt "Python version for GDB"
+	default BR2_PACKAGE_HOST_GDB_PYTHON_VERSION_2
+config BR2_PACKAGE_HOST_GDB_PYTHON_VERSION_2
+	bool "python 2.7"
+config BR2_PACKAGE_HOST_GDB_PYTHON_VERSION_3
+	bool "python 3.8"
+	select BR2_PACKAGE_HOST_PYTHON3
+endchoice
+
+endif
+
 config BR2_PACKAGE_HOST_GDB_SIM
 	bool "Simulator support"
 	depends on !BR2_arc
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 01f7e14460..8f614f6318 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -236,8 +236,15 @@ HOST_GDB_CONF_OPTS += --disable-tui
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_GDB_PYTHON),y)
+ifeq ($(BR2_PACKAGE_HOST_GDB_PYTHON_VERSION_2),y)
 HOST_GDB_CONF_OPTS += --with-python=$(HOST_DIR)/bin/python2
 HOST_GDB_DEPENDENCIES += host-python
+else ifeq ($(BR2_PACKAGE_HOST_GDB_PYTHON_VERSION_3),y)
+HOST_GDB_CONF_OPTS += --with-python=$(HOST_DIR)/bin/python3
+HOST_GDB_DEPENDENCIES += host-python3
+else
+$(error Unknown python version selected for GDB)
+endif
 else
 HOST_GDB_CONF_OPTS += --without-python
 endif
-- 
2.21.1
