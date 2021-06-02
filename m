From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 2 Jun 2021 22:45:15 +0200
Subject: [Buildroot] [git commit] package/python3: add optional support for
 berkeleydb
Message-ID: <20210607144659.4CEE9814BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7bd1b51d07d9028c997edb1efe5d9e85c39d6e84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...n-option-to-disable-the-berkeleydb-module.patch | 30 ++++++++++++++++++++++
 package/python3/Config.in                          |  6 +++++
 package/python3/python3.mk                         |  6 +++++
 3 files changed, 42 insertions(+)

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
index 3a9dd4b2f4..efc4dbb3d4 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -46,6 +46,12 @@ config BR2_PACKAGE_PYTHON3_2TO3
 	help
 	  code translation from python 2 to 3
 
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
index b492e09154..991e24a440 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -57,6 +57,12 @@ else
 PYTHON3_CONF_OPTS += --disable-lib2to3
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3_BERKELEYDB),y)
+PYTHON3_DEPENDENCIES += berkeleydb
+else
+PYTHON3_CONF_OPTS += --disable-berkeleydb
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON3_READLINE),y)
 PYTHON3_DEPENDENCIES += readline
 else
