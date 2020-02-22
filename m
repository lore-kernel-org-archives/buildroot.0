From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 22 Feb 2020 19:54:59 +0100
Subject: [Buildroot] [PATCH 1/2] package/python: add optional support for
 lib2to3
Message-ID: <20200222185500.221018-1-bernd.kuhls@t-online.de>
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
python2: http://python-future.org/automatic_conversion.html

Kodi addons depending on the script.module.future addon are crashing on
buildroot due to lib2to3 missing in the build.

LibreELEC added lib2to3 to python2 to fix the problem:
https://forum.libreelec.tv/thread/21239-lib2to3-pgen2-parse-missing/
https://github.com/LibreELEC/LibreELEC.tv/pull/4147

This patch provides the Config.in option to be used by Kodi.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python/Config.in | 5 +++++
 package/python/python.mk | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/python/Config.in b/package/python/Config.in
index a7f16450e3..bded00c9e8 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -39,6 +39,11 @@ menu "core python modules"
 
 comment "The following modules are unusual or require extra libraries"
 
+config BR2_PACKAGE_PYTHON_2TO3
+	bool "2to3 module"
+	help
+	  code translation from python 2 to 3
+
 config BR2_PACKAGE_PYTHON_BZIP2
 	bool "bzip2 module"
 	select BR2_PACKAGE_BZIP2
diff --git a/package/python/python.mk b/package/python/python.mk
index 1c393b255d..f9d5619612 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -118,6 +118,12 @@ HOST_PYTHON_CONF_OPTS += --enable-unicode=ucs4
 PYTHON_CONF_OPTS += --enable-unicode=ucs4
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON_2TO3),y)
+PYTHON_CONF_OPTS += --enable-lib2to3
+else
+PYTHON_CONF_OPTS += --disable-lib2to3
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON_BZIP2),y)
 PYTHON_DEPENDENCIES += bzip2
 else
@@ -165,7 +171,6 @@ PYTHON_CONF_OPTS += \
 	--with-system-ffi \
 	--disable-pydoc \
 	--disable-test-modules \
-	--disable-lib2to3 \
 	--disable-gdbm \
 	--disable-tk \
 	--disable-nis \
-- 
2.20.1
