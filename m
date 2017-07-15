From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 15 Jul 2017 16:14:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: fix build with newer gcc
	versions.
Message-ID: <20170715141419.13160-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using this defconfig produces a build error with kodi:

BR2_arm=y
BR2_cortex_a8=y
BR2_ARM_INSTRUCTIONS_THUMB2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_SUNXI_MALI=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PY_ONLY=y

/home/buildroot/buildroot/output/build/kodi-17.3-Krypton/xbmc/filesystem/FTPParse.cpp:37:1:
 error: ?string? does not name a type
 string CFTPParse::getName()
 ^~~~~~
/home/buildroot/buildroot/output/build/kodi-17.3-Krypton/xbmc/filesystem/FTPParse.cpp:62:25:
 error: variable or field ?setTime? declared void
 void CFTPParse::setTime(string str)
                         ^~~~~~
/home/buildroot/buildroot/output/build/kodi-17.3-Krypton/xbmc/filesystem/FTPParse.cpp:62:25:
 error: ?string? was not declared in this scope

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi/0003-FTPParse.cpp-use-std-string.patch    | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 package/kodi/0003-FTPParse.cpp-use-std-string.patch

diff --git a/package/kodi/0003-FTPParse.cpp-use-std-string.patch b/package/kodi/0003-FTPParse.cpp-use-std-string.patch
new file mode 100644
index 000000000..9fa7abb71
--- /dev/null
+++ b/package/kodi/0003-FTPParse.cpp-use-std-string.patch
@@ -0,0 +1,91 @@
+From 5fa10ff6b1b60abee172296d9c1dec8dfc10615c Mon Sep 17 00:00:00 2001
+From: Stefan Saraev <stefan@saraev.ca>
+Date: Sun, 7 May 2017 17:30:47 +0300
+Subject: [PATCH] FTPParse.cpp: use std::string
+
+Fixes build with newer gcc versions.
+
+Backported from upstream commit
+https://github.com/xbmc/xbmc/commit/5fa10ff6b1b60abee172296d9c1dec8dfc10615c
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ xbmc/filesystem/FTPParse.cpp | 44 ++++++++++++++++++++++----------------------
+ 1 file changed, 22 insertions(+), 22 deletions(-)
+
+diff --git a/xbmc/filesystem/FTPParse.cpp b/xbmc/filesystem/FTPParse.cpp
+index cfcc7c64ed..b0f676ae1a 100644
+--- a/xbmc/filesystem/FTPParse.cpp
++++ b/xbmc/filesystem/FTPParse.cpp
+@@ -34,7 +34,7 @@ CFTPParse::CFTPParse()
+   m_time = 0;
+ }
+ 
+-string CFTPParse::getName()
++std::string CFTPParse::getName()
+ {
+   return m_name;
+ }
+@@ -59,16 +59,16 @@ time_t CFTPParse::getTime()
+   return m_time;
+ }
+ 
+-void CFTPParse::setTime(string str)
++void CFTPParse::setTime(std::string str)
+ {
+   /* Variables used to capture patterns via the regexes */
+-  string month;
+-  string day;
+-  string year;
+-  string hour;
+-  string minute;
+-  string second;
+-  string am_or_pm;
++  std::string month;
++  std::string day;
++  std::string year;
++  std::string hour;
++  std::string minute;
++  std::string second;
++  std::string am_or_pm;
+ 
+   /* time struct used to set the time_t variable */
+   struct tm time_struct = {};
+@@ -338,21 +338,21 @@ int CFTPParse::getDayOfWeek(int month, int date, int year)
+   return day_of_week;
+ }
+ 
+-int CFTPParse::FTPParse(string str)
++int CFTPParse::FTPParse(std::string str)
+ {
+   /* Various variable to capture patterns via the regexes */
+-  string permissions;
+-  string link_count;
+-  string owner;
+-  string group;
+-  string size;
+-  string date;
+-  string name;
+-  string type;
+-  string stuff;
+-  string facts;
+-  string version;
+-  string file_id;
++  std::string permissions;
++  std::string link_count;
++  std::string owner;
++  std::string group;
++  std::string size;
++  std::string date;
++  std::string name;
++  std::string type;
++  std::string stuff;
++  std::string facts;
++  std::string version;
++  std::string file_id;
+ 
+   /* Regex for standard Unix listing formats */
+   pcrecpp::RE unix_re("^([-bcdlps])" // type
+-- 
+2.11.0
+
-- 
2.11.0
