From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Apr 2020 22:11:32 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/python3: add optional support
 for berkeleydb
Message-ID: <20200411201132.249731-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added patch to explicitly disable the build of the dbm module
    (Thomas)

 ...ion-to-disable-the-berkeleydb-module.patch | 30 +++++++++++++++++++
 package/python3/Config.in                     |  6 ++++
 package/python3/python3.mk                    |  6 ++++
 3 files changed, 42 insertions(+)
 create mode 100644 package/python3/0034-Add-an-option-to-disable-the-berkeleydb-module.patch

diff --git a/package/python3/0034-Add-an-option-to-disable-the-berkeleydb-module.patch b/package/python3/0034-Add-an-option-to-disable-the-berkeleydb-module.patch
new file mode 100644
index 0000000000..f763fcaa82
--- /dev/null
+++ b/package/python3/0034-Add-an-option-to-disable-the-berkeleydb-module.patch
@@ -0,0 +1,30 @@
+From cf4d7fd9f7cb6c1ced32ee323b2b5755640051b7 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 11 Apr 2020 22:01:40 +0200
+Subject: [PATCH] Add an option to disable the berkeleydb module
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 72c1d86e82..8c3912d237 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3326,6 +3326,12 @@ if test "$UUID" = "no"; then
+    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _uuid"
+ fi
+ 
++AC_ARG_ENABLE(berkeleydb,
++	AS_HELP_STRING([--disable-berkeleydb], [disable berkeleydb]),
++	[ if test "$enableval" = "no"; then
++	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _dbm"
++	  fi])
++
+ AC_SUBST(PYDOC)
+ 
+ AC_ARG_ENABLE(pydoc,
+-- 
+2.25.0
+
diff --git a/package/python3/Config.in b/package/python3/Config.in
index 0c5018f0b3..7e19f84843 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -41,6 +41,12 @@ menu "core python3 modules"
 
 comment "The following modules are unusual or require extra libraries"
 
+config BR2_PACKAGE_PYTHON3_BERKELEYDB
+	bool "berkeleydb"
+	select BR2_PACKAGE_BERKELEYDB
+	help
+	  berkeleydb module for Python3
+
 config BR2_PACKAGE_PYTHON3_BZIP2
 	bool "bz2 module"
 	select BR2_PACKAGE_BZIP2
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 2656037efd..b0aa239250 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -49,6 +49,12 @@ endif
 
 PYTHON3_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_PYTHON3_BERKELEYDB),y)
+PYTHON3_DEPENDENCIES += berkeleydb
+else
+PYTHON3_CONF_OPTS += --disable-berkeleydb
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON3_READLINE),y)
 PYTHON3_DEPENDENCIES += readline
 else
-- 
2.25.0
