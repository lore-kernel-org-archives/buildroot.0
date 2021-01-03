From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 Jan 2021 16:03:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/python3: add optional support for
 lib2to3
Message-ID: <20210103150306.1509091-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kodi is in transition to support python3 instead of python2:
https://kodi.wiki/view/General_information_about_migration_to_Python_3

"For Kodi 18 (Leia), only addons that are compatible with both Python 2
 and 3 will be accepted to the official addon repository."

Some of these addons depend on the Kodi addon script.module.future to
provide support for both python versions.

The script.module.future addon contains python-future:
https://kodi.wiki/view/General_information_about_migration_to_Python_3#Future
which in turn needs lib2to3 to be included in the target build of
python3: http://python-future.org/automatic_conversion.html

Kodi addons depending on the script.module.future addon are crashing on
buildroot due to lib2to3 missing in the build.

LibreELEC added lib2to3 to python3 to fix the problem:
https://forum.libreelec.tv/thread/21239-lib2to3-pgen2-parse-missing/
https://github.com/LibreELEC/LibreELEC.tv/pull/4146

This patch provides the Config.in option to be used by Kodi 19.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python3/Config.in  | 5 +++++
 package/python3/python3.mk | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 7e19f84843..efc4dbb3d4 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -41,6 +41,11 @@ menu "core python3 modules"
 
 comment "The following modules are unusual or require extra libraries"
 
+config BR2_PACKAGE_PYTHON3_2TO3
+	bool "2to3 module"
+	help
+	  code translation from python 2 to 3
+
 config BR2_PACKAGE_PYTHON3_BERKELEYDB
 	bool "berkeleydb"
 	select BR2_PACKAGE_BERKELEYDB
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index d200eecf76..de90b4a267 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -55,6 +55,12 @@ else
 PYTHON3_CONF_OPTS += --disable-berkeleydb
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3_2TO3),y)
+PYTHON_CONF_OPTS += --enable-lib2to3
+else
+PYTHON_CONF_OPTS += --disable-lib2to3
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON3_READLINE),y)
 PYTHON3_DEPENDENCIES += readline
 else
@@ -162,7 +168,6 @@ PYTHON3_CONF_OPTS += \
 	--with-system-ffi \
 	--disable-pydoc \
 	--disable-test-modules \
-	--disable-lib2to3 \
 	--disable-tk \
 	--disable-nis \
 	--disable-idle3 \
-- 
2.29.2
