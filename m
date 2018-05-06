From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 May 2018 11:29:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/znc: bump version to 1.7.0
Message-ID: <20180506092903.25598-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Increased minimum gcc version to 4.8 as mentioned in the Changelog:
https://wiki.znc.in/ChangeLog/1.7.0

Removed all patches:
- 0001 was applied upstream:
https://github.com/znc/znc/commit/483074cbf82a48a3ff01838fcbaec00553d1882c

- 0002 is not needed anymore after upstream switched Csocket to a git
  submodule:
https://github.com/znc/znc/commit/9166e6ed40f0c7a85eee0d024b12510c13863f55#diff-8a725997e024d92d67b33a90cffb8342

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...0001-Add-time.h-includes-where-appropiate.patch | 194 ---------------------
 package/znc/0002-csocket-timeh.patch               |  19 --
 package/znc/Config.in                              |   6 +-
 package/znc/znc.hash                               |   2 +-
 package/znc/znc.mk                                 |   2 +-
 5 files changed, 5 insertions(+), 218 deletions(-)
 delete mode 100644 package/znc/0001-Add-time.h-includes-where-appropiate.patch
 delete mode 100644 package/znc/0002-csocket-timeh.patch

diff --git a/package/znc/0001-Add-time.h-includes-where-appropiate.patch b/package/znc/0001-Add-time.h-includes-where-appropiate.patch
deleted file mode 100644
index c8ba6d450a..0000000000
--- a/package/znc/0001-Add-time.h-includes-where-appropiate.patch
+++ /dev/null
@@ -1,194 +0,0 @@
-From 9a51195e916f14a36c2a2a809f2393e5ed2424a3 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Thu, 6 Aug 2015 11:20:54 -0300
-Subject: [PATCH] Add <time.h> includes where appropiate
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- modules/adminlog.cpp    | 1 +
- modules/ctcpflood.cpp   | 1 +
- modules/flooddetach.cpp | 1 +
- modules/lastseen.cpp    | 1 +
- modules/log.cpp         | 1 +
- modules/simple_away.cpp | 1 +
- src/Buffer.cpp          | 1 +
- src/FileUtils.cpp       | 1 +
- src/IRCSock.cpp         | 1 +
- src/User.cpp            | 1 +
- src/WebModules.cpp      | 1 +
- src/ZNCDebug.cpp        | 1 +
- src/main.cpp            | 1 +
- src/znc.cpp             | 1 +
- 14 files changed, 14 insertions(+)
-
-diff --git a/modules/adminlog.cpp b/modules/adminlog.cpp
-index d08369e..1636799 100644
---- a/modules/adminlog.cpp
-+++ b/modules/adminlog.cpp
-@@ -20,6 +20,7 @@
- #include <znc/User.h>
- 
- #include <syslog.h>
-+#include <time.h>
- 
- class CAdminLogMod : public CModule {
- public:
-diff --git a/modules/ctcpflood.cpp b/modules/ctcpflood.cpp
-index 7697ef8..c105ef7 100644
---- a/modules/ctcpflood.cpp
-+++ b/modules/ctcpflood.cpp
-@@ -16,6 +16,7 @@
- 
- #include <znc/Modules.h>
- #include <znc/Chan.h>
-+#include <time.h>
- 
- class CCtcpFloodMod : public CModule {
- public:
-diff --git a/modules/flooddetach.cpp b/modules/flooddetach.cpp
-index 9c41734..cd88bd2 100644
---- a/modules/flooddetach.cpp
-+++ b/modules/flooddetach.cpp
-@@ -16,6 +16,7 @@
- 
- #include <znc/Chan.h>
- #include <znc/IRCNetwork.h>
-+#include <time.h>
- 
- using std::map;
- 
-diff --git a/modules/lastseen.cpp b/modules/lastseen.cpp
-index 416a111..414310f 100644
---- a/modules/lastseen.cpp
-+++ b/modules/lastseen.cpp
-@@ -16,6 +16,7 @@
- 
- #include <znc/User.h>
- #include <znc/znc.h>
-+#include <time.h>
- 
- using std::map;
- using std::pair;
-diff --git a/modules/log.cpp b/modules/log.cpp
-index 2f3124a..e238bb1 100644
---- a/modules/log.cpp
-+++ b/modules/log.cpp
-@@ -20,6 +20,7 @@
- #include <znc/IRCNetwork.h>
- #include <znc/Chan.h>
- #include <znc/Server.h>
-+#include <time.h>
- #include <algorithm>
- 
- using std::vector;
-diff --git a/modules/simple_away.cpp b/modules/simple_away.cpp
-index 57d6e7a..2f73b0a 100644
---- a/modules/simple_away.cpp
-+++ b/modules/simple_away.cpp
-@@ -16,6 +16,7 @@
- 
- #include <znc/User.h>
- #include <znc/IRCNetwork.h>
-+#include <time.h>
- 
- #define SIMPLE_AWAY_DEFAULT_REASON "Auto away at %s"
- #define SIMPLE_AWAY_DEFAULT_TIME   60
-diff --git a/src/Buffer.cpp b/src/Buffer.cpp
-index 4715f76..dc14642 100644
---- a/src/Buffer.cpp
-+++ b/src/Buffer.cpp
-@@ -17,6 +17,7 @@
- #include <znc/Buffer.h>
- #include <znc/znc.h>
- #include <znc/User.h>
-+#include <time.h>
- 
- CBufLine::CBufLine(const CString& sFormat, const CString& sText, const timeval* ts) : m_sFormat(sFormat), m_sText(sText), m_time() {
- 	if (ts == nullptr)
-diff --git a/src/FileUtils.cpp b/src/FileUtils.cpp
-index d358aa4..92218f3 100644
---- a/src/FileUtils.cpp
-+++ b/src/FileUtils.cpp
-@@ -22,6 +22,7 @@
- #include <sys/stat.h>
- #include <sys/types.h>
- #include <sys/wait.h>
-+#include <time.h>
- 
- #ifndef HAVE_LSTAT
- #  define lstat(a, b)	stat(a, b)
-diff --git a/src/IRCSock.cpp b/src/IRCSock.cpp
-index 738b5bf..c97b8fe 100644
---- a/src/IRCSock.cpp
-+++ b/src/IRCSock.cpp
-@@ -20,6 +20,7 @@
- #include <znc/IRCNetwork.h>
- #include <znc/Server.h>
- #include <znc/Query.h>
-+#include <time.h>
- 
- using std::set;
- using std::vector;
-diff --git a/src/User.cpp b/src/User.cpp
-index f3b5b91..580b52d 100644
---- a/src/User.cpp
-+++ b/src/User.cpp
-@@ -22,6 +22,7 @@
- #include <znc/Chan.h>
- #include <znc/Query.h>
- #include <math.h>
-+#include <time.h>
- #include <algorithm>
- 
- using std::vector;
-diff --git a/src/WebModules.cpp b/src/WebModules.cpp
-index 832a2e1..74e56de 100644
---- a/src/WebModules.cpp
-+++ b/src/WebModules.cpp
-@@ -19,6 +19,7 @@
- #include <znc/User.h>
- #include <znc/IRCNetwork.h>
- #include <znc/znc.h>
-+#include <time.h>
- #include <algorithm>
- #include <sstream>
- 
-diff --git a/src/ZNCDebug.cpp b/src/ZNCDebug.cpp
-index 6e36b57..be2f77f 100644
---- a/src/ZNCDebug.cpp
-+++ b/src/ZNCDebug.cpp
-@@ -18,6 +18,7 @@
- #include <iostream>
- #include <sys/time.h>
- #include <stdio.h>
-+#include <time.h>
- 
- bool CDebug::stdoutIsTTY = true;
- bool CDebug::debug =
-diff --git a/src/main.cpp b/src/main.cpp
-index 465e1a0..cbe72bf 100644
---- a/src/main.cpp
-+++ b/src/main.cpp
-@@ -16,6 +16,7 @@
- 
- #include <znc/znc.h>
- #include <signal.h>
-+#include <time.h>
- 
- #if defined(HAVE_LIBSSL) && defined(HAVE_PTHREAD)
- #include <znc/Threads.h>
-diff --git a/src/znc.cpp b/src/znc.cpp
-index 624b92c..4c1ffcd 100644
---- a/src/znc.cpp
-+++ b/src/znc.cpp
-@@ -21,6 +21,7 @@
- #include <znc/User.h>
- #include <znc/IRCNetwork.h>
- #include <znc/Config.h>
-+#include <time.h>
- #include <tuple>
- #include <algorithm>
- 
--- 
-2.4.6
-
diff --git a/package/znc/0002-csocket-timeh.patch b/package/znc/0002-csocket-timeh.patch
deleted file mode 100644
index cbd435fc82..0000000000
--- a/package/znc/0002-csocket-timeh.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Include time.h since time_t is used.
-
-Status: not upstream, seems to be fixed in newer CSocket versions in a
-different way but it hasn't been updated/bundled in znc yet.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura znc-1.6.1.orig/src/Csocket.cpp znc-1.6.1.cs/src/Csocket.cpp
---- znc-1.6.1.orig/src/Csocket.cpp	2015-08-06 10:14:45.256246307 -0300
-+++ znc-1.6.1.cs/src/Csocket.cpp	2015-08-06 10:27:25.380446888 -0300
-@@ -54,6 +54,8 @@
- #include <unicode/ucnv_cb.h>
- #endif /* HAVE_ICU */
- 
-+#include <time.h>
-+
- #include <list>
- 
- #define CS_SRANDBUFFER 128
diff --git a/package/znc/Config.in b/package/znc/Config.in
index 154d4b0789..feca2c42f0 100644
--- a/package/znc/Config.in
+++ b/package/znc/Config.in
@@ -3,13 +3,13 @@ config BR2_PACKAGE_ZNC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	help
 	  Advanced IRC bouncer
 
 	  http://www.znc.in
 
-comment "znc needs a toolchain w/ C++, dynamic library, gcc >= 4.7"
+comment "znc needs a toolchain w/ C++, dynamic library, gcc >= 4.8"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_USE_MMU
diff --git a/package/znc/znc.hash b/package/znc/znc.hash
index 67c00ca217..ee24816d0a 100644
--- a/package/znc/znc.hash
+++ b/package/znc/znc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 7fb841bc71dc1749b1dc081e9eaf22ceb56ebb03c6b1d8804a4f9eb8bbd59525  znc-1.6.6.tar.gz
+sha256 c07e31439ac6b948a577bd61a9d5f61a6d191d387423779b937aa1404051b96f  znc-1.7.0.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 79db580da2..33ac266dd3 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZNC_VERSION = 1.6.6
+ZNC_VERSION = 1.7.0
 ZNC_SITE = http://znc.in/releases/archive
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
-- 
2.14.2
