From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 22 Feb 2020 19:55:00 +0100
Subject: [Buildroot] [PATCH 2/2] package/kodi: needs python 2to3 library
In-Reply-To: <20200222185500.221018-1-bernd.kuhls@t-online.de>
References: <20200222185500.221018-1-bernd.kuhls@t-online.de>
Message-ID: <20200222185500.221018-2-bernd.kuhls@t-online.de>
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

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index b9eea78d57..6508184c64 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -92,6 +92,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_PCRE_UCP
+	select BR2_PACKAGE_PYTHON_2TO3
 	select BR2_PACKAGE_PYTHON_BSDDB
 	select BR2_PACKAGE_PYTHON_CURSES
 	select BR2_PACKAGE_PYTHON_PYEXPAT
-- 
2.20.1
