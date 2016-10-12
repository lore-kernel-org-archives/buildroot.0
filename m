From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Oct 2016 13:57:53 +0200
Subject: [Buildroot] [git commit] package/upmpdcli: bump to version 1.2.8
Message-ID: <20161012115805.BA591805E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3e0249711f3cbd85add1e740551c96575c23fc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patches applied upstream. As we are not touching configure.ac or
Makefile.am anymore there is no need for AUTORECONF.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/upmpdcli/0001-fix-jsoncpp-detection.patch  |  90 -----------------
 .../0002-use-pkg-config-for-libupnpp.patch         |  66 -------------
 ...including-header-file-log.h-from-libupnpp.patch | 110 ---------------------
 ...ig-for-jsoncpp-libmpdclient-libmicrohttpd.patch | 105 --------------------
 package/upmpdcli/upmpdcli.hash                     |   2 +-
 package/upmpdcli/upmpdcli.mk                       |   6 +-
 6 files changed, 2 insertions(+), 377 deletions(-)

diff --git a/package/upmpdcli/0001-fix-jsoncpp-detection.patch b/package/upmpdcli/0001-fix-jsoncpp-detection.patch
deleted file mode 100644
index 69a9a0e..0000000
--- a/package/upmpdcli/0001-fix-jsoncpp-detection.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 25762953c019ca0c5a047a5fa28f1fe6c78c731a Mon Sep 17 00:00:00 2001
-From: Jean-Francois Dockes <jf@dockes.org>
-Date: Sun, 11 Sep 2016 13:43:28 +0200
-Subject: [PATCH] fix jsoncpp detection
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The default installation path for the header files is {prefix}/json, but some
-system prefers to install the headers in {prefix}/jsoncpp/json.
-
-This patch from upstream handles both cases now when checking for the jsoncpp
-library.
-
-The patch is squashed of two commits from upstream:
-1/ aba96db0cfe8a2e5c825f4448c0ad184e21b50e1
-2/ ce144f19a8c2e8c1e0ec3fe53699e874e5eb43fe
-
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- configure.ac                               | 8 +++++++-
- src/config.h.in                            | 6 ++++++
- src/mediaserver/cdplugins/plgwithslave.cxx | 5 +++++
- 3 files changed, 18 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index f191ad7..108dcce 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -43,9 +43,15 @@ SCCTL_LIBS=$LIBS
- AC_CHECK_LIB([microhttpd], [MHD_queue_response], [], [])
- 
- AC_LANG_PUSH([C++])
-+
-+AC_CHECK_HEADERS(json/json.h jsoncpp/json/json.h)
- LIBS="$LIBS -ljsoncpp"
- AC_LINK_IFELSE([AC_LANG_PROGRAM(
--    [#include <jsoncpp/json/json.h>], [Json::Features dummy])],
-+    [[#ifdef HAVE_JSONCPP_JSON_JSON_H
-+    #include <jsoncpp/json/json.h>
-+    #else
-+    #include <json/json.h>
-+    #endif]], [Json::Features dummy])],
-     [HAVE_JSONCPP=1],
-     [AC_MSG_ERROR([libjsoncpp not found.])])
- AC_LANG_POP
-diff --git a/src/config.h.in b/src/config.h.in
-index 1350308..0a33e15 100644
---- a/src/config.h.in
-+++ b/src/config.h.in
-@@ -3,6 +3,12 @@
- /* Define to 1 if you have the <inttypes.h> header file. */
- #undef HAVE_INTTYPES_H
- 
-+/* Define to 1 if you have the <jsoncpp/json/json.h> header file. */
-+#undef HAVE_JSONCPP_JSON_JSON_H
-+
-+/* Define to 1 if you have the <json/json.h> header file. */
-+#undef HAVE_JSON_JSON_H
-+
- /* Define to 1 if you have the `microhttpd' library (-lmicrohttpd). */
- #undef HAVE_LIBMICROHTTPD
- 
-diff --git a/src/mediaserver/cdplugins/plgwithslave.cxx b/src/mediaserver/cdplugins/plgwithslave.cxx
-index 04f0544..545805c 100644
---- a/src/mediaserver/cdplugins/plgwithslave.cxx
-+++ b/src/mediaserver/cdplugins/plgwithslave.cxx
-@@ -14,6 +14,7 @@
-  *   Free Software Foundation, Inc.,
-  *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
-  */
-+#include "config.h"
- 
- #include "plgwithslave.hxx"
- 
-@@ -25,7 +26,11 @@
- #include <string.h>
- #include <upnp/upnp.h>
- #include <microhttpd.h>
-+#ifdef HAVE_JSONCPP_JSON_JSON_H
- #include <jsoncpp/json/json.h>
-+#else
-+#include <json/json.h>
-+#endif
- 
- #include "cmdtalk.h"
- #include "pathut.h"
--- 
-2.9.3
-
diff --git a/package/upmpdcli/0002-use-pkg-config-for-libupnpp.patch b/package/upmpdcli/0002-use-pkg-config-for-libupnpp.patch
deleted file mode 100644
index daef415..0000000
--- a/package/upmpdcli/0002-use-pkg-config-for-libupnpp.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 16bcaaee1c28b972e0cc6a542f511af44306ce6c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Wed, 14 Sep 2016 11:43:21 +0200
-Subject: [PATCH] Use pkg-config for libupnpp
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Use pkg-config for libupnpp to fix build issues when cross-compiling and
-building upmpdcli statically.
-
-Building upmpdcli aborts because of an unsafe header inclusion of
-`/usr/include/libupnpp`. Using `{prefix}` to get the header path is wrong for
-cross-compilation. Instead of hard-coding the flags for libupnpp use pkg-config
-to get the correct ones.
-
-Upstream-status: https://github.com/medoc92/upmpdcli/pull/49
-
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- Makefile.am  | 2 +-
- configure.ac | 8 ++++----
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index d0c10a4..5c83aa1 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,5 +1,5 @@
- AM_CPPFLAGS = -DDEBUG -g -Wall \
--            -I${prefix}/include/libupnpp \
-+            $(upnpp_CFLAGS) \
-             -I$(top_srcdir)/src \
-             -DDATADIR=\"${pkgdatadir}\" -DCONFIGDIR=\"${sysconfdir}\"
- 
-diff --git a/configure.ac b/configure.ac
-index 108dcce..a165b5d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -35,10 +35,10 @@ dnl AC_CHECK_LIB([upnp], [UpnpInit], [], AC_MSG_ERROR([libupnp not found]))
- dnl AC_CHECK_LIB([curl], [curl_easy_init], [],AC_MSG_ERROR([libcurl not found]))
- dnl AC_CHECK_LIB([expat], [XML_ParserCreate], [],AC_MSG_ERROR([libexpat not found]))
- 
--AC_CHECK_LIB([upnpp], [getsyshwaddr], [], [AC_MSG_ERROR([libupnpp])])
-+PKG_CHECK_MODULES([upnpp], [libupnpp], [], [AC_MSG_ERROR([libupnpp])])
- AC_CHECK_LIB([mpdclient], [mpd_connection_new], [],
-                           AC_MSG_ERROR([libmpdclient not found]))
--SCCTL_LIBS=$LIBS
-+SCCTL_LIBS="$LIBS $upnpp_LIBS"
- 
- AC_CHECK_LIB([microhttpd], [MHD_queue_response], [], [])
- 
-@@ -56,8 +56,8 @@ AC_LINK_IFELSE([AC_LANG_PROGRAM(
-     [AC_MSG_ERROR([libjsoncpp not found.])])
- AC_LANG_POP
- 
--UPMPDCLI_LIBS=$LIBS
--echo "UPMPDCLI_LIBS=$LIBS"
-+UPMPDCLI_LIBS="$LIBS $upnpp_LIBS"
-+echo "UPMPDCLI_LIBS=$UPMPDCLI_LIBS"
- 
- LIBS=""
- 
--- 
-2.9.3
-
diff --git a/package/upmpdcli/0003-Fix-including-header-file-log.h-from-libupnpp.patch b/package/upmpdcli/0003-Fix-including-header-file-log.h-from-libupnpp.patch
deleted file mode 100644
index 29e6492..0000000
--- a/package/upmpdcli/0003-Fix-including-header-file-log.h-from-libupnpp.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 366e726821abce305ef2887effea443a24043511 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Wed, 14 Sep 2016 11:46:22 +0200
-Subject: [PATCH] Fix including header file log.h from libupnpp
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The "log.{h,hxx}" header files are included from libupnpp.
-
-As we are using the pkg-config file of libupnpp to get the header include path,
-instead of the hardcoded `{prefix}/include/libupnpp` these files are not found.
-
-Upstream-status: https://github.com/medoc92/upmpdcli/issues/46
-
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- src/conftree.cpp                           | 2 +-
- src/execmd.cpp                             | 4 ++--
- src/mediaserver/cdplugins/cmdtalk.cpp      | 2 +-
- src/mediaserver/cdplugins/plgwithslave.cxx | 2 +-
- src/netcon.cpp                             | 4 ++--
- 5 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/src/conftree.cpp b/src/conftree.cpp
-index 12eb4b5..8a79812 100644
---- a/src/conftree.cpp
-+++ b/src/conftree.cpp
-@@ -42,7 +42,7 @@
- 
- #include "pathut.h"
- #include "smallut.h"
--#include "log.h"
-+#include "libupnpp/log.h"
- 
- using namespace std;
- 
-diff --git a/src/execmd.cpp b/src/execmd.cpp
-index 0db9032..9bf2971 100644
---- a/src/execmd.cpp
-+++ b/src/execmd.cpp
-@@ -53,7 +53,7 @@
- #include "netcon.h"
- #include "closefrom.h"
- #include "smallut.h"
--#include "log.h"
-+#include "libupnpp/log.h"
- 
- using namespace std;
- 
-@@ -1135,7 +1135,7 @@ void ReExec::reexec()
- #include <sstream>
- #include <vector>
- 
--#include "log.h"
-+#include "libupnpp/log.h"
- 
- #include "execmd.h"
- #ifdef BUILDING_RECOLL
-diff --git a/src/mediaserver/cdplugins/cmdtalk.cpp b/src/mediaserver/cdplugins/cmdtalk.cpp
-index eddd68f..e19f7ea 100644
---- a/src/mediaserver/cdplugins/cmdtalk.cpp
-+++ b/src/mediaserver/cdplugins/cmdtalk.cpp
-@@ -24,7 +24,7 @@
- 
- #include "smallut.h"
- #include "execmd.h"
--#include "log.h"
-+#include "libupnpp/log.h"
- 
- using namespace std;
- 
-diff --git a/src/mediaserver/cdplugins/plgwithslave.cxx b/src/mediaserver/cdplugins/plgwithslave.cxx
-index 545805c..1ad44ef 100644
---- a/src/mediaserver/cdplugins/plgwithslave.cxx
-+++ b/src/mediaserver/cdplugins/plgwithslave.cxx
-@@ -35,7 +35,7 @@
- #include "cmdtalk.h"
- #include "pathut.h"
- #include "smallut.h"
--#include "log.hxx"
-+#include "libupnpp/log.hxx"
- #include "main.hxx"
- #include "conftree.h"
- 
-diff --git a/src/netcon.cpp b/src/netcon.cpp
-index 5674cf3..193d1cd 100644
---- a/src/netcon.cpp
-+++ b/src/netcon.cpp
-@@ -47,7 +47,7 @@
- 
- #include <map>
- 
--#include "log.h"
-+#include "libupnpp/log.h"
- 
- using namespace std;
- 
-@@ -1031,7 +1031,7 @@ NetconServLis::checkperms(void *cl, int)
- #include <signal.h>
- #include <string.h>
- 
--#include "log.h"
-+#include "libupnpp/log.h"
- 
- #include "netcon.h"
- 
--- 
-2.9.3
-
diff --git a/package/upmpdcli/0004-Use-pkg-config-for-jsoncpp-libmpdclient-libmicrohttpd.patch b/package/upmpdcli/0004-Use-pkg-config-for-jsoncpp-libmpdclient-libmicrohttpd.patch
deleted file mode 100644
index a1f194a..0000000
--- a/package/upmpdcli/0004-Use-pkg-config-for-jsoncpp-libmpdclient-libmicrohttpd.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 5091e1afd9d0a69bdf10d12d4a66f7147e8185a3 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Fri, 23 Sep 2016 21:37:36 +0200
-Subject: [PATCH] Use pkg-config for jsoncpp, libmpdclient and libmicrohttpd
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-libmpdclient, libmicrohttpd and jsoncpp provide a .pc file. Use
-pkg-config for detecting the libraries and for providing the necessary
-details for compiling and linking.
-
-The current build system of upmpdcli does not use PKG_CHECK_MODULES, but
-AC_LINK_IFELSE to detect jsoncpp. After bumping jsoncpp version from 1.7.2 to
-1.7.5 the detection fails, because the test program does not compile:
-
-'''
-In file included from /usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/autolink.h:9:0,
-                 from /usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/json.h:9,
-                 from test.c:1:
-/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/config.h:155:9: error: 'int64_t' does not name a type
- typedef int64_t Int64;
-         ^
-/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/config.h:156:9: error: 'uint64_t' does not name a type
- typedef uint64_t UInt64;
-         ^
-/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/config.h:158:9: error: 'Int64' does not name a type
- typedef Int64 LargestInt;
-         ^
-/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/config.h:159:9: error: 'UInt64' does not name a type
- typedef UInt64 LargestUInt;
-         ^
-In file included from /usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/json.h:10:0,
-                 from test.c:1:
-/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/value.h:184:11: error: 'UInt64' in namespace 'Json' does not name a type
-   typedef Json::UInt64 UInt64;
-
-[..]
-'''
-
-Instead of fixing the test program use PKG_CHECK_MODULES to check for
-jsoncpp. While we're on it, add it for libmpdclient and libmicrohttpd, too.
-
-Upstream-status: https://github.com/medoc92/upmpdcli/pull/52
-
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- Makefile.am  |  3 ++-
- configure.ac | 24 +++++++-----------------
- 2 files changed, 9 insertions(+), 18 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 5c83aa1..6f6e018 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,5 +1,6 @@
- AM_CPPFLAGS = -DDEBUG -g -Wall \
--            $(upnpp_CFLAGS) \
-+            $(upnpp_CFLAGS)  $(libmpdclient_CFLAGS) $(libmicrohttpd_CFLAGS) \
-+            $(jsoncpp_CFLAGS) \
-             -I$(top_srcdir)/src \
-             -DDATADIR=\"${pkgdatadir}\" -DCONFIGDIR=\"${sysconfdir}\"
- 
-diff --git a/configure.ac b/configure.ac
-index a165b5d..0ef0f3b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -36,27 +36,17 @@ dnl AC_CHECK_LIB([curl], [curl_easy_init], [],AC_MSG_ERROR([libcurl not found]))
- dnl AC_CHECK_LIB([expat], [XML_ParserCreate], [],AC_MSG_ERROR([libexpat not found]))
- 
- PKG_CHECK_MODULES([upnpp], [libupnpp], [], [AC_MSG_ERROR([libupnpp])])
--AC_CHECK_LIB([mpdclient], [mpd_connection_new], [],
--                          AC_MSG_ERROR([libmpdclient not found]))
--SCCTL_LIBS="$LIBS $upnpp_LIBS"
-+PKG_CHECK_MODULES([libmpdclient], [libmpdclient], [],
-+	[AC_MSG_ERROR([libmpdclient not found])])
-+SCCTL_LIBS="$LIBS $upnpp_LIBS $libmpdclient_LIBS"
- 
--AC_CHECK_LIB([microhttpd], [MHD_queue_response], [], [])
--
--AC_LANG_PUSH([C++])
-+PKG_CHECK_MODULES([libmicrohttpd], [libmicrohttpd], [],
-+	[AC_MSG_ERROR([libmicrohttpd not found])])
- 
- AC_CHECK_HEADERS(json/json.h jsoncpp/json/json.h)
--LIBS="$LIBS -ljsoncpp"
--AC_LINK_IFELSE([AC_LANG_PROGRAM(
--    [[#ifdef HAVE_JSONCPP_JSON_JSON_H
--    #include <jsoncpp/json/json.h>
--    #else
--    #include <json/json.h>
--    #endif]], [Json::Features dummy])],
--    [HAVE_JSONCPP=1],
--    [AC_MSG_ERROR([libjsoncpp not found.])])
--AC_LANG_POP
-+PKG_CHECK_MODULES([jsoncpp], [jsoncpp], [], [AC_MSG_ERROR([jsoncpp not found])])
- 
--UPMPDCLI_LIBS="$LIBS $upnpp_LIBS"
-+UPMPDCLI_LIBS="$LIBS $upnpp_LIBS $libmpdclient_LIBS $libmicrohttpd_LIBS $jsoncpp_LIBS"
- echo "UPMPDCLI_LIBS=$UPMPDCLI_LIBS"
- 
- LIBS=""
--- 
-2.10.0
-
diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
index 7e23adc..847cdc2 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,2 +1,2 @@
 # Manually calculated:
-sha256  6a3ad211707d7eca287f7f64688ff2e569d50bc463aa2145b01c98252fe30955  upmpdcli-1.2.2.tar.gz
+sha256  a788796e634e243a5ac11db3b19ea872d2bff4d5fb673d058ab7a683ca029dae  upmpdcli-1.2.8.tar.gz
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 3beda1b..84a8763 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,15 +4,11 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 1.2.2
+UPMPDCLI_VERSION = 1.2.8
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = GPLv2+
 UPMPDCLI_LICENSE_FILES = COPYING
 UPMPDCLI_DEPENDENCIES = host-pkgconf libmpdclient libupnpp libmicrohttpd jsoncpp
-# touching configure.ac and Makefile.am in
-#   0001-fix-jsoncpp-detection.patch
-#   0002-use-pkg-config-for-libupnpp.patch
-UPMPDCLI_AUTORECONF = YES
 
 # Upmpdcli only runs if user upmpdcli exists
 define UPMPDCLI_USERS
