From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 23:27:27 +0200
Subject: [Buildroot] [git commit] package/kodi: bump to version 17.4
Message-ID: <20170902130621.174398016A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=954496dafa3d6951d8651279d012169bc60a6e3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch 0003, applied upstream:
https://github.com/xbmc/xbmc/commit/5fa10ff6b1b60abee172296d9c1dec8dfc10615c

-DWITH_FFMPEG is needed due to commit
https://github.com/xbmc/xbmc/commit/5ba6eb7cadc41d5eb86ef94e3661b833b62953ff

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../kodi-jsonschemabuilder.mk                      |  2 +-
 package/kodi-texturepacker/kodi-texturepacker.mk   |  2 +-
 .../kodi/0003-FTPParse.cpp-use-std-string.patch    | 91 ----------------------
 package/kodi/kodi.hash                             |  2 +-
 package/kodi/kodi.mk                               |  3 +-
 5 files changed, 5 insertions(+), 95 deletions(-)

diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
index 320c779..e3de102 100644
--- a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
+++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_JSONSCHEMABUILDER_VERSION = 17.3-Krypton
+KODI_JSONSCHEMABUILDER_VERSION = 17.4-Krypton
 KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(KODI_JSONSCHEMABUILDER_VERSION))
 KODI_JSONSCHEMABUILDER_SOURCE = kodi-$(KODI_JSONSCHEMABUILDER_VERSION).tar.gz
 KODI_JSONSCHEMABUILDER_LICENSE = GPL-2.0
diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
index d69585b..26776ac 100644
--- a/package/kodi-texturepacker/kodi-texturepacker.mk
+++ b/package/kodi-texturepacker/kodi-texturepacker.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_TEXTUREPACKER_VERSION = 17.3-Krypton
+KODI_TEXTUREPACKER_VERSION = 17.4-Krypton
 KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,$(KODI_TEXTUREPACKER_VERSION))
 KODI_TEXTUREPACKER_SOURCE = kodi-$(KODI_TEXTUREPACKER_VERSION).tar.gz
 KODI_TEXTUREPACKER_LICENSE = GPL-2.0
diff --git a/package/kodi/0003-FTPParse.cpp-use-std-string.patch b/package/kodi/0003-FTPParse.cpp-use-std-string.patch
deleted file mode 100644
index 9fa7abb..0000000
--- a/package/kodi/0003-FTPParse.cpp-use-std-string.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 5fa10ff6b1b60abee172296d9c1dec8dfc10615c Mon Sep 17 00:00:00 2001
-From: Stefan Saraev <stefan@saraev.ca>
-Date: Sun, 7 May 2017 17:30:47 +0300
-Subject: [PATCH] FTPParse.cpp: use std::string
-
-Fixes build with newer gcc versions.
-
-Backported from upstream commit
-https://github.com/xbmc/xbmc/commit/5fa10ff6b1b60abee172296d9c1dec8dfc10615c
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- xbmc/filesystem/FTPParse.cpp | 44 ++++++++++++++++++++++----------------------
- 1 file changed, 22 insertions(+), 22 deletions(-)
-
-diff --git a/xbmc/filesystem/FTPParse.cpp b/xbmc/filesystem/FTPParse.cpp
-index cfcc7c64ed..b0f676ae1a 100644
---- a/xbmc/filesystem/FTPParse.cpp
-+++ b/xbmc/filesystem/FTPParse.cpp
-@@ -34,7 +34,7 @@ CFTPParse::CFTPParse()
-   m_time = 0;
- }
- 
--string CFTPParse::getName()
-+std::string CFTPParse::getName()
- {
-   return m_name;
- }
-@@ -59,16 +59,16 @@ time_t CFTPParse::getTime()
-   return m_time;
- }
- 
--void CFTPParse::setTime(string str)
-+void CFTPParse::setTime(std::string str)
- {
-   /* Variables used to capture patterns via the regexes */
--  string month;
--  string day;
--  string year;
--  string hour;
--  string minute;
--  string second;
--  string am_or_pm;
-+  std::string month;
-+  std::string day;
-+  std::string year;
-+  std::string hour;
-+  std::string minute;
-+  std::string second;
-+  std::string am_or_pm;
- 
-   /* time struct used to set the time_t variable */
-   struct tm time_struct = {};
-@@ -338,21 +338,21 @@ int CFTPParse::getDayOfWeek(int month, int date, int year)
-   return day_of_week;
- }
- 
--int CFTPParse::FTPParse(string str)
-+int CFTPParse::FTPParse(std::string str)
- {
-   /* Various variable to capture patterns via the regexes */
--  string permissions;
--  string link_count;
--  string owner;
--  string group;
--  string size;
--  string date;
--  string name;
--  string type;
--  string stuff;
--  string facts;
--  string version;
--  string file_id;
-+  std::string permissions;
-+  std::string link_count;
-+  std::string owner;
-+  std::string group;
-+  std::string size;
-+  std::string date;
-+  std::string name;
-+  std::string type;
-+  std::string stuff;
-+  std::string facts;
-+  std::string version;
-+  std::string file_id;
- 
-   /* Regex for standard Unix listing formats */
-   pcrecpp::RE unix_re("^([-bcdlps])" // type
--- 
-2.11.0
-
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index 167b179..6c7cf8f 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 1de8653a3729cefd1baaf09ecde5ace01a1e3a58fbf29d48c1363f2503d331a1  kodi-17.3-Krypton.tar.gz
+sha256 b05e11b2d108222bfc3ff0c9a466d798c0feedf1228166239948e6ed37c3cb4f  kodi-17.4-Krypton.tar.gz
 # Locally computed - libdvdcss
 sha256 b6eb2d929ff56cb051152c32010afc5e7cf5fe8c5ae32dca412a2b46b6b57e34  2f12236.tar.gz
 # Locally computed - libdvdnav
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 0bf7331..793289f 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update kodi-jsonschemabuilder
 # and kodi-texturepacker
-KODI_VERSION = 17.3-Krypton
+KODI_VERSION = 17.4-Krypton
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
 KODI_LICENSE = GPL-2.0
 KODI_LICENSE_FILES = LICENSE.GPL
@@ -67,6 +67,7 @@ KODI_CONF_OPTS += \
 	-DENABLE_OPENSSL=ON \
 	-DNATIVEPREFIX=$(HOST_DIR) \
 	-DDEPENDS_PATH=$(@D) \
+	-DWITH_FFMPEG=$(STAGING_DIR)/usr \
 	-DWITH_TEXTUREPACKER=$(HOST_DIR)/bin/TexturePacker \
 	-DLIBDVDCSS_URL=$(DL_DIR)/$(KODI_LIBDVDCSS_VERSION).tar.gz \
 	-DLIBDVDNAV_URL=$(DL_DIR)/$(KODI_LIBDVDNAV_VERSION).tar.gz \
