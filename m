From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Jan 2021 22:57:29 +0100
Subject: [Buildroot] [git commit] package/python3: add optional support for
 lib2to3
Message-ID: <20210103214019.2F56E8263C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f47e3a5331e45968de3b4ce32f8b31091ebdb8d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
[yann.morin.1998 at free.fr:
  - fix conflicts due to local changes in author's tree
  - fix typ in variabl name (PYTHON_CONF_OPTS -> PYTHON3_CONF_OPTS)
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python3/Config.in  | 5 +++++
 package/python3/python3.mk | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 0c5018f0b3..3a9dd4b2f4 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -41,6 +41,11 @@ menu "core python3 modules"
 
 comment "The following modules are unusual or require extra libraries"
 
+config BR2_PACKAGE_PYTHON3_2TO3
+	bool "2to3 module"
+	help
+	  code translation from python 2 to 3
+
 config BR2_PACKAGE_PYTHON3_BZIP2
 	bool "bz2 module"
 	select BR2_PACKAGE_BZIP2
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index f2516dee90..8dbd0bab66 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -49,6 +49,12 @@ endif
 
 PYTHON3_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_PYTHON3_2TO3),y)
+PYTHON3_CONF_OPTS += --enable-lib2to3
+else
+PYTHON3_CONF_OPTS += --disable-lib2to3
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON3_READLINE),y)
 PYTHON3_DEPENDENCIES += readline
 else
@@ -156,7 +162,6 @@ PYTHON3_CONF_OPTS += \
 	--with-system-ffi \
 	--disable-pydoc \
 	--disable-test-modules \
-	--disable-lib2to3 \
 	--disable-tk \
 	--disable-nis \
 	--disable-idle3 \
