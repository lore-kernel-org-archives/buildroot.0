From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Aug 2015 11:42:33 +0200
Subject: [Buildroot] [git commit branch/next] znc: bump to version 1.6.1
Message-ID: <20150809094323.7CE7C8190C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e978ab536e711affd6b927de856a509ecc133b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump to release tarball version.
Add hash file.
Update and rework time.h patch for upstream inclusion (hopefully) by
splitting the CSocket patch out.
(https://github.com/znc/znc/pull/1021)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...0001-Add-time.h-includes-where-appropiate.patch |  194 +++++++++++++
 package/znc/0001-time.patch                        |  303 --------------------
 package/znc/0002-csocket-timeh.patch               |   19 ++
 package/znc/Config.in                              |    5 +-
 package/znc/znc.hash                               |    2 +
 package/znc/znc.mk                                 |   17 +-
 6 files changed, 223 insertions(+), 317 deletions(-)

diff --git a/package/znc/0001-Add-time.h-includes-where-appropiate.patch b/package/znc/0001-Add-time.h-includes-where-appropiate.patch
new file mode 100644
index 0000000..c8ba6d4
--- /dev/null
+++ b/package/znc/0001-Add-time.h-includes-where-appropiate.patch
@@ -0,0 +1,194 @@
+From 9a51195e916f14a36c2a2a809f2393e5ed2424a3 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Thu, 6 Aug 2015 11:20:54 -0300
+Subject: [PATCH] Add <time.h> includes where appropiate
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ modules/adminlog.cpp    | 1 +
+ modules/ctcpflood.cpp   | 1 +
+ modules/flooddetach.cpp | 1 +
+ modules/lastseen.cpp    | 1 +
+ modules/log.cpp         | 1 +
+ modules/simple_away.cpp | 1 +
+ src/Buffer.cpp          | 1 +
+ src/FileUtils.cpp       | 1 +
+ src/IRCSock.cpp         | 1 +
+ src/User.cpp            | 1 +
+ src/WebModules.cpp      | 1 +
+ src/ZNCDebug.cpp        | 1 +
+ src/main.cpp            | 1 +
+ src/znc.cpp             | 1 +
+ 14 files changed, 14 insertions(+)
+
+diff --git a/modules/adminlog.cpp b/modules/adminlog.cpp
+index d08369e..1636799 100644
+--- a/modules/adminlog.cpp
++++ b/modules/adminlog.cpp
+@@ -20,6 +20,7 @@
+ #include <znc/User.h>
+ 
+ #include <syslog.h>
++#include <time.h>
+ 
+ class CAdminLogMod : public CModule {
+ public:
+diff --git a/modules/ctcpflood.cpp b/modules/ctcpflood.cpp
+index 7697ef8..c105ef7 100644
+--- a/modules/ctcpflood.cpp
++++ b/modules/ctcpflood.cpp
+@@ -16,6 +16,7 @@
+ 
+ #include <znc/Modules.h>
+ #include <znc/Chan.h>
++#include <time.h>
+ 
+ class CCtcpFloodMod : public CModule {
+ public:
+diff --git a/modules/flooddetach.cpp b/modules/flooddetach.cpp
+index 9c41734..cd88bd2 100644
+--- a/modules/flooddetach.cpp
++++ b/modules/flooddetach.cpp
+@@ -16,6 +16,7 @@
+ 
+ #include <znc/Chan.h>
+ #include <znc/IRCNetwork.h>
++#include <time.h>
+ 
+ using std::map;
+ 
+diff --git a/modules/lastseen.cpp b/modules/lastseen.cpp
+index 416a111..414310f 100644
+--- a/modules/lastseen.cpp
++++ b/modules/lastseen.cpp
+@@ -16,6 +16,7 @@
+ 
+ #include <znc/User.h>
+ #include <znc/znc.h>
++#include <time.h>
+ 
+ using std::map;
+ using std::pair;
+diff --git a/modules/log.cpp b/modules/log.cpp
+index 2f3124a..e238bb1 100644
+--- a/modules/log.cpp
++++ b/modules/log.cpp
+@@ -20,6 +20,7 @@
+ #include <znc/IRCNetwork.h>
+ #include <znc/Chan.h>
+ #include <znc/Server.h>
++#include <time.h>
+ #include <algorithm>
+ 
+ using std::vector;
+diff --git a/modules/simple_away.cpp b/modules/simple_away.cpp
+index 57d6e7a..2f73b0a 100644
+--- a/modules/simple_away.cpp
++++ b/modules/simple_away.cpp
+@@ -16,6 +16,7 @@
+ 
+ #include <znc/User.h>
+ #include <znc/IRCNetwork.h>
++#include <time.h>
+ 
+ #define SIMPLE_AWAY_DEFAULT_REASON "Auto away at %s"
+ #define SIMPLE_AWAY_DEFAULT_TIME   60
+diff --git a/src/Buffer.cpp b/src/Buffer.cpp
+index 4715f76..dc14642 100644
+--- a/src/Buffer.cpp
++++ b/src/Buffer.cpp
+@@ -17,6 +17,7 @@
+ #include <znc/Buffer.h>
+ #include <znc/znc.h>
+ #include <znc/User.h>
++#include <time.h>
+ 
+ CBufLine::CBufLine(const CString& sFormat, const CString& sText, const timeval* ts) : m_sFormat(sFormat), m_sText(sText), m_time() {
+ 	if (ts == nullptr)
+diff --git a/src/FileUtils.cpp b/src/FileUtils.cpp
+index d358aa4..92218f3 100644
+--- a/src/FileUtils.cpp
++++ b/src/FileUtils.cpp
+@@ -22,6 +22,7 @@
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <sys/wait.h>
++#include <time.h>
+ 
+ #ifndef HAVE_LSTAT
+ #  define lstat(a, b)	stat(a, b)
+diff --git a/src/IRCSock.cpp b/src/IRCSock.cpp
+index 738b5bf..c97b8fe 100644
+--- a/src/IRCSock.cpp
++++ b/src/IRCSock.cpp
+@@ -20,6 +20,7 @@
+ #include <znc/IRCNetwork.h>
+ #include <znc/Server.h>
+ #include <znc/Query.h>
++#include <time.h>
+ 
+ using std::set;
+ using std::vector;
+diff --git a/src/User.cpp b/src/User.cpp
+index f3b5b91..580b52d 100644
+--- a/src/User.cpp
++++ b/src/User.cpp
+@@ -22,6 +22,7 @@
+ #include <znc/Chan.h>
+ #include <znc/Query.h>
+ #include <math.h>
++#include <time.h>
+ #include <algorithm>
+ 
+ using std::vector;
+diff --git a/src/WebModules.cpp b/src/WebModules.cpp
+index 832a2e1..74e56de 100644
+--- a/src/WebModules.cpp
++++ b/src/WebModules.cpp
+@@ -19,6 +19,7 @@
+ #include <znc/User.h>
+ #include <znc/IRCNetwork.h>
+ #include <znc/znc.h>
++#include <time.h>
+ #include <algorithm>
+ #include <sstream>
+ 
+diff --git a/src/ZNCDebug.cpp b/src/ZNCDebug.cpp
+index 6e36b57..be2f77f 100644
+--- a/src/ZNCDebug.cpp
++++ b/src/ZNCDebug.cpp
+@@ -18,6 +18,7 @@
+ #include <iostream>
+ #include <sys/time.h>
+ #include <stdio.h>
++#include <time.h>
+ 
+ bool CDebug::stdoutIsTTY = true;
+ bool CDebug::debug =
+diff --git a/src/main.cpp b/src/main.cpp
+index 465e1a0..cbe72bf 100644
+--- a/src/main.cpp
++++ b/src/main.cpp
+@@ -16,6 +16,7 @@
+ 
+ #include <znc/znc.h>
+ #include <signal.h>
++#include <time.h>
+ 
+ #if defined(HAVE_LIBSSL) && defined(HAVE_PTHREAD)
+ #include <znc/Threads.h>
+diff --git a/src/znc.cpp b/src/znc.cpp
+index 624b92c..4c1ffcd 100644
+--- a/src/znc.cpp
++++ b/src/znc.cpp
+@@ -21,6 +21,7 @@
+ #include <znc/User.h>
+ #include <znc/IRCNetwork.h>
+ #include <znc/Config.h>
++#include <time.h>
+ #include <tuple>
+ #include <algorithm>
+ 
+-- 
+2.4.6
+
diff --git a/package/znc/0001-time.patch b/package/znc/0001-time.patch
deleted file mode 100644
index 3866139..0000000
--- a/package/znc/0001-time.patch
+++ /dev/null
@@ -1,303 +0,0 @@
-From 18d6daf4793fb7e9750175bd46b17fe1965b78dd Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 6 May 2014 22:00:11 +0200
-Subject: [PATCH] Add missing <time.h> includes
-
-Submitted upstream at https://github.com/znc/znc/pull/569.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- modules/adminlog.cpp    | 1 +
- modules/awaystore.cpp   | 2 ++
- modules/crypt.cpp       | 2 ++
- modules/ctcpflood.cpp   | 2 ++
- modules/flooddetach.cpp | 2 ++
- modules/lastseen.cpp    | 2 ++
- modules/log.cpp         | 2 ++
- modules/savebuff.cpp    | 2 ++
- modules/schat.cpp       | 2 ++
- modules/simple_away.cpp | 2 ++
- src/Buffer.cpp          | 2 ++
- src/Csocket.cpp         | 2 ++
- src/FileUtils.cpp       | 2 ++
- src/HTTPSock.cpp        | 1 +
- src/IRCSock.cpp         | 2 ++
- src/User.cpp            | 1 +
- src/Utils.cpp           | 2 ++
- src/WebModules.cpp      | 2 ++
- src/ZNCDebug.cpp        | 1 +
- src/main.cpp            | 1 +
- src/znc.cpp             | 2 ++
- 21 files changed, 37 insertions(+)
-
-diff --git a/modules/adminlog.cpp b/modules/adminlog.cpp
-index 77577b1..16dd665 100644
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
-diff --git a/modules/awaystore.cpp b/modules/awaystore.cpp
-index da75260..56349df 100644
---- a/modules/awaystore.cpp
-+++ b/modules/awaystore.cpp
-@@ -30,6 +30,8 @@
- #include <znc/IRCNetwork.h>
- #include <znc/FileUtils.h>
- 
-+#include <time.h>
-+
- using std::vector;
- using std::map;
- 
-diff --git a/modules/crypt.cpp b/modules/crypt.cpp
-index fcc664b..8f9018f 100644
---- a/modules/crypt.cpp
-+++ b/modules/crypt.cpp
-@@ -34,6 +34,8 @@
- #include <znc/User.h>
- #include <znc/IRCNetwork.h>
- 
-+#include <time.h>
-+
- #define REQUIRESSL	1
- #define NICK_PREFIX_KEY	"[nick-prefix]"
- 
-diff --git a/modules/ctcpflood.cpp b/modules/ctcpflood.cpp
-index ac154e2..f2ce27f 100644
---- a/modules/ctcpflood.cpp
-+++ b/modules/ctcpflood.cpp
-@@ -17,6 +17,8 @@
- #include <znc/Modules.h>
- #include <znc/Chan.h>
- 
-+#include <time.h>
-+
- class CCtcpFloodMod : public CModule {
- public:
- 	MODCONSTRUCTOR(CCtcpFloodMod) {
-diff --git a/modules/flooddetach.cpp b/modules/flooddetach.cpp
-index f4ed892..0ffb651 100644
---- a/modules/flooddetach.cpp
-+++ b/modules/flooddetach.cpp
-@@ -17,6 +17,8 @@
- #include <znc/Chan.h>
- #include <znc/IRCNetwork.h>
- 
-+#include <time.h>
-+
- using std::map;
- 
- class CFloodDetachMod : public CModule {
-diff --git a/modules/lastseen.cpp b/modules/lastseen.cpp
-index bd6eb9b..b3b209f 100644
---- a/modules/lastseen.cpp
-+++ b/modules/lastseen.cpp
-@@ -17,6 +17,8 @@
- #include <znc/User.h>
- #include <znc/znc.h>
- 
-+#include <time.h>
-+
- using std::map;
- using std::pair;
- using std::multimap;
-diff --git a/modules/log.cpp b/modules/log.cpp
-index 260b577..e718d76 100644
---- a/modules/log.cpp
-+++ b/modules/log.cpp
-@@ -21,6 +21,8 @@
- #include <znc/Chan.h>
- #include <znc/Server.h>
- 
-+#include <time.h>
-+
- using std::vector;
- 
- class CLogMod: public CModule {
-diff --git a/modules/savebuff.cpp b/modules/savebuff.cpp
-index 8a85153..2e0ed5c 100644
---- a/modules/savebuff.cpp
-+++ b/modules/savebuff.cpp
-@@ -29,6 +29,8 @@
- #include <znc/IRCNetwork.h>
- #include <znc/FileUtils.h>
- 
-+#include <time.h>
-+
- using std::vector;
- 
- #define CRYPT_VERIFICATION_TOKEN "::__:SAVEBUFF:__::"
-diff --git a/modules/schat.cpp b/modules/schat.cpp
-index 98d03b4..5a7f1a0 100644
---- a/modules/schat.cpp
-+++ b/modules/schat.cpp
-@@ -25,6 +25,8 @@
- #include <znc/User.h>
- #include <znc/IRCNetwork.h>
- 
-+#include <time.h>
-+
- using std::pair;
- using std::stringstream;
- using std::map;
-diff --git a/modules/simple_away.cpp b/modules/simple_away.cpp
-index a1e5927..67faeea 100644
---- a/modules/simple_away.cpp
-+++ b/modules/simple_away.cpp
-@@ -17,6 +17,8 @@
- #include <znc/User.h>
- #include <znc/IRCNetwork.h>
- 
-+#include <time.h>
-+
- #define SIMPLE_AWAY_DEFAULT_REASON "Auto away at %s"
- #define SIMPLE_AWAY_DEFAULT_TIME   60
- 
-diff --git a/src/Buffer.cpp b/src/Buffer.cpp
-index eefbb29..55ecd72 100644
---- a/src/Buffer.cpp
-+++ b/src/Buffer.cpp
-@@ -17,6 +17,8 @@
- #include <znc/znc.h>
- #include <znc/User.h>
- 
-+#include <time.h>
-+
- CBufLine::CBufLine(const CString& sFormat, const CString& sText, const timeval* ts) {
- 	m_sFormat = sFormat;
- 	m_sText = sText;
-diff --git a/src/Csocket.cpp b/src/Csocket.cpp
-index 2e4cb14..ca6ed38 100644
---- a/src/Csocket.cpp
-+++ b/src/Csocket.cpp
-@@ -53,6 +53,8 @@
- #include <unicode/errorcode.h>
- #endif /* HAVE_ICU */
- 
-+#include <time.h>
-+
- #include <list>
- 
- #define CS_SRANDBUFFER 128
-diff --git a/src/FileUtils.cpp b/src/FileUtils.cpp
-index 7224a49..4c8f1d3 100644
---- a/src/FileUtils.cpp
-+++ b/src/FileUtils.cpp
-@@ -23,6 +23,8 @@
- #include <sys/types.h>
- #include <sys/wait.h>
- 
-+#include <time.h>
-+
- #ifndef HAVE_LSTAT
- #  define lstat(a, b)	stat(a, b)
- #endif
-diff --git a/src/HTTPSock.cpp b/src/HTTPSock.cpp
-index ab03130..36bf52b 100644
---- a/src/HTTPSock.cpp
-+++ b/src/HTTPSock.cpp
-@@ -18,6 +18,7 @@
- #include <znc/znc.h>
- #include <iomanip>
- 
-+#include <time.h>
- 
- #ifdef HAVE_ZLIB
- #include <zlib.h>
-diff --git a/src/IRCSock.cpp b/src/IRCSock.cpp
-index 2ef12f6..d0c56a7 100644
---- a/src/IRCSock.cpp
-+++ b/src/IRCSock.cpp
-@@ -20,6 +20,8 @@
- #include <znc/IRCNetwork.h>
- #include <znc/Server.h>
- 
-+#include <time.h>
-+
- using std::set;
- using std::vector;
- using std::map;
-diff --git a/src/User.cpp b/src/User.cpp
-index cf664f1..4a64f83 100644
---- a/src/User.cpp
-+++ b/src/User.cpp
-@@ -20,6 +20,7 @@
- #include <znc/IRCNetwork.h>
- #include <znc/IRCSock.h>
- #include <math.h>
-+#include <time.h>
- 
- using std::vector;
- using std::set;
-diff --git a/src/Utils.cpp b/src/Utils.cpp
-index 33c83de..e0862dd 100644
---- a/src/Utils.cpp
-+++ b/src/Utils.cpp
-@@ -26,6 +26,8 @@
- #include <cstring>
- #include <cstdlib>
- 
-+#include <time.h>
-+
- using std::map;
- using std::stringstream;
- using std::vector;
-diff --git a/src/WebModules.cpp b/src/WebModules.cpp
-index d61ba23..ddd88e0 100644
---- a/src/WebModules.cpp
-+++ b/src/WebModules.cpp
-@@ -22,6 +22,8 @@
- #include <algorithm>
- #include <sstream>
- 
-+#include <time.h>
-+
- using std::pair;
- using std::vector;
- 
-diff --git a/src/ZNCDebug.cpp b/src/ZNCDebug.cpp
-index 01d06b4..cc83298 100644
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
-index ac9d691..7d74f8e 100644
---- a/src/main.cpp
-+++ b/src/main.cpp
-@@ -16,6 +16,7 @@
- 
- #include <znc/znc.h>
- #include <signal.h>
-+#include <time.h>
- 
- using std::cout;
- using std::endl;
-diff --git a/src/znc.cpp b/src/znc.cpp
-index 9e66f3d..dce1372 100644
---- a/src/znc.cpp
-+++ b/src/znc.cpp
-@@ -21,6 +21,8 @@
- #include <znc/IRCNetwork.h>
- #include <znc/Config.h>
- 
-+#include <time.h>
-+
- using std::endl;
- using std::cout;
- using std::map;
--- 
-1.9.2
-
diff --git a/package/znc/0002-csocket-timeh.patch b/package/znc/0002-csocket-timeh.patch
new file mode 100644
index 0000000..cbd435f
--- /dev/null
+++ b/package/znc/0002-csocket-timeh.patch
@@ -0,0 +1,19 @@
+Include time.h since time_t is used.
+
+Status: not upstream, seems to be fixed in newer CSocket versions in a
+different way but it hasn't been updated/bundled in znc yet.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura znc-1.6.1.orig/src/Csocket.cpp znc-1.6.1.cs/src/Csocket.cpp
+--- znc-1.6.1.orig/src/Csocket.cpp	2015-08-06 10:14:45.256246307 -0300
++++ znc-1.6.1.cs/src/Csocket.cpp	2015-08-06 10:27:25.380446888 -0300
+@@ -54,6 +54,8 @@
+ #include <unicode/ucnv_cb.h>
+ #endif /* HAVE_ICU */
+ 
++#include <time.h>
++
+ #include <list>
+ 
+ #define CS_SRANDBUFFER 128
diff --git a/package/znc/Config.in b/package/znc/Config.in
index 274e537..4328c8b 100644
--- a/package/znc/Config.in
+++ b/package/znc/Config.in
@@ -2,11 +2,12 @@ config BR2_PACKAGE_ZNC
 	bool "znc"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS
 	help
 	  Advanced IRC bouncer
 
 	  http://www.znc.in
 
-comment "znc needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "znc needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
diff --git a/package/znc/znc.hash b/package/znc/znc.hash
new file mode 100644
index 0000000..9d2b4a2
--- /dev/null
+++ b/package/znc/znc.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	ba49397364f48d6d32ae5242bc1166f21d972f85dd390d6bbe68a63ecbb6c140	znc-1.6.1.tar.gz
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 779a7b1..106be2d 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -4,25 +4,18 @@
 #
 ################################################################################
 
-ZNC_VERSION = b396cafdb249544164ed02942a5babba59e519a3
-ZNC_SITE = $(call github,znc,znc,$(ZNC_VERSION))
+ZNC_VERSION = 1.6.1
+ZNC_SITE = http://znc.in/releases
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
-ZNC_DEPENDENCIES = host-pkgconf host-autoconf host-automake
+ZNC_DEPENDENCIES = host-pkgconf
 ZNC_CONF_OPTS = --disable-perl
 
-# The standard <pkg>_AUTORECONF = YES invocation doesn't work for this
-# package, because it does not use automake in a normal way.
-define ZNC_RUN_AUTOGEN
-	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
-endef
-ZNC_PRE_CONFIGURE_HOOKS += ZNC_RUN_AUTOGEN
-
 ifeq ($(BR2_PACKAGE_ICU),y)
 ZNC_DEPENDENCIES += icu
-ZNC_CONF_OPTS += --enable-icu
+ZNC_CONF_OPTS += --enable-charset
 else
-ZNC_CONF_OPTS += --disable-icu
+ZNC_CONF_OPTS += --disable-charset
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
