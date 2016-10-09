From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 14:19:25 +0200
Subject: [Buildroot] [git commit] package/upmpdcli: add patch to fix error
	not detecting jsoncpp
Message-ID: <20161009123334.98FF982127@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d076804edde7914c69f226f34a1d57097f02a55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/205463c9ea8651911972c2835e28ded1912c811a
http://autobuild.buildroot.net/results/5e9279ee60c11a3dacacf6d78f87f8d1b92968f5
http://autobuild.buildroot.net/results/97043f8defd5a59ae39b4c7f095a10d15c7fe632
http://autobuild.buildroot.net/results/e775126d5939093289b1a833dd6323ac293322ed
.. and many more.

libmpdclient, libmicrohttpd and jsoncpp provide a .pc file. Use
pkg-config for detecting the libraries and for providing the necessary
details for compiling and linking.

The current build system of upmpdcli does not use PKG_CHECK_MODULES, but
AC_LINK_IFELSE to detect jsoncpp. After bumping jsoncpp version from
1.7.2 to 1.7.5 the detection fails, because the test program does not
compile anymore:

"""
In file included from
/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/autolink.h:9:0,
                 from
/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/json.h:9,
                 from test.c:1:
/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/config.h:155:9:
error: 'int64_t' does not name a type
 typedef int64_t Int64;
         ^
/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/config.h:156:9:
error: 'uint64_t' does not name a type
 typedef uint64_t UInt64;
         ^
/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/config.h:158:9:
error: 'Int64' does not name a type
 typedef Int64 LargestInt;
         ^
/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/config.h:159:9:
error: 'UInt64' does not name a type
 typedef UInt64 LargestUInt;
         ^
In file included from
/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/json.h:10:0,
                 from test.c:1:
/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/value.h:184:11:
error: 'UInt64' in namespace 'Json' does not name a type
   typedef Json::UInt64 UInt64;

[..]
"""

Instead of fixing the test program use PKG_CHECK_MODULES to check for
jsoncpp. While we're on it, add it for libmpdclient and libmicrohttpd,
too.

Upstream-status: https://github.com/medoc92/upmpdcli/pull/52

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ig-for-jsoncpp-libmpdclient-libmicrohttpd.patch | 105 +++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/package/upmpdcli/0004-Use-pkg-config-for-jsoncpp-libmpdclient-libmicrohttpd.patch b/package/upmpdcli/0004-Use-pkg-config-for-jsoncpp-libmpdclient-libmicrohttpd.patch
new file mode 100644
index 0000000..a1f194a
--- /dev/null
+++ b/package/upmpdcli/0004-Use-pkg-config-for-jsoncpp-libmpdclient-libmicrohttpd.patch
@@ -0,0 +1,105 @@
+From 5091e1afd9d0a69bdf10d12d4a66f7147e8185a3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Fri, 23 Sep 2016 21:37:36 +0200
+Subject: [PATCH] Use pkg-config for jsoncpp, libmpdclient and libmicrohttpd
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+libmpdclient, libmicrohttpd and jsoncpp provide a .pc file. Use
+pkg-config for detecting the libraries and for providing the necessary
+details for compiling and linking.
+
+The current build system of upmpdcli does not use PKG_CHECK_MODULES, but
+AC_LINK_IFELSE to detect jsoncpp. After bumping jsoncpp version from 1.7.2 to
+1.7.5 the detection fails, because the test program does not compile:
+
+'''
+In file included from /usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/autolink.h:9:0,
+                 from /usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/json.h:9,
+                 from test.c:1:
+/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/config.h:155:9: error: 'int64_t' does not name a type
+ typedef int64_t Int64;
+         ^
+/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/config.h:156:9: error: 'uint64_t' does not name a type
+ typedef uint64_t UInt64;
+         ^
+/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/config.h:158:9: error: 'Int64' does not name a type
+ typedef Int64 LargestInt;
+         ^
+/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/config.h:159:9: error: 'UInt64' does not name a type
+ typedef UInt64 LargestUInt;
+         ^
+In file included from /usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/json.h:10:0,
+                 from test.c:1:
+/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/json/value.h:184:11: error: 'UInt64' in namespace 'Json' does not name a type
+   typedef Json::UInt64 UInt64;
+
+[..]
+'''
+
+Instead of fixing the test program use PKG_CHECK_MODULES to check for
+jsoncpp. While we're on it, add it for libmpdclient and libmicrohttpd, too.
+
+Upstream-status: https://github.com/medoc92/upmpdcli/pull/52
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ Makefile.am  |  3 ++-
+ configure.ac | 24 +++++++-----------------
+ 2 files changed, 9 insertions(+), 18 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 5c83aa1..6f6e018 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,5 +1,6 @@
+ AM_CPPFLAGS = -DDEBUG -g -Wall \
+-            $(upnpp_CFLAGS) \
++            $(upnpp_CFLAGS)  $(libmpdclient_CFLAGS) $(libmicrohttpd_CFLAGS) \
++            $(jsoncpp_CFLAGS) \
+             -I$(top_srcdir)/src \
+             -DDATADIR=\"${pkgdatadir}\" -DCONFIGDIR=\"${sysconfdir}\"
+ 
+diff --git a/configure.ac b/configure.ac
+index a165b5d..0ef0f3b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -36,27 +36,17 @@ dnl AC_CHECK_LIB([curl], [curl_easy_init], [],AC_MSG_ERROR([libcurl not found]))
+ dnl AC_CHECK_LIB([expat], [XML_ParserCreate], [],AC_MSG_ERROR([libexpat not found]))
+ 
+ PKG_CHECK_MODULES([upnpp], [libupnpp], [], [AC_MSG_ERROR([libupnpp])])
+-AC_CHECK_LIB([mpdclient], [mpd_connection_new], [],
+-                          AC_MSG_ERROR([libmpdclient not found]))
+-SCCTL_LIBS="$LIBS $upnpp_LIBS"
++PKG_CHECK_MODULES([libmpdclient], [libmpdclient], [],
++	[AC_MSG_ERROR([libmpdclient not found])])
++SCCTL_LIBS="$LIBS $upnpp_LIBS $libmpdclient_LIBS"
+ 
+-AC_CHECK_LIB([microhttpd], [MHD_queue_response], [], [])
+-
+-AC_LANG_PUSH([C++])
++PKG_CHECK_MODULES([libmicrohttpd], [libmicrohttpd], [],
++	[AC_MSG_ERROR([libmicrohttpd not found])])
+ 
+ AC_CHECK_HEADERS(json/json.h jsoncpp/json/json.h)
+-LIBS="$LIBS -ljsoncpp"
+-AC_LINK_IFELSE([AC_LANG_PROGRAM(
+-    [[#ifdef HAVE_JSONCPP_JSON_JSON_H
+-    #include <jsoncpp/json/json.h>
+-    #else
+-    #include <json/json.h>
+-    #endif]], [Json::Features dummy])],
+-    [HAVE_JSONCPP=1],
+-    [AC_MSG_ERROR([libjsoncpp not found.])])
+-AC_LANG_POP
++PKG_CHECK_MODULES([jsoncpp], [jsoncpp], [], [AC_MSG_ERROR([jsoncpp not found])])
+ 
+-UPMPDCLI_LIBS="$LIBS $upnpp_LIBS"
++UPMPDCLI_LIBS="$LIBS $upnpp_LIBS $libmpdclient_LIBS $libmicrohttpd_LIBS $jsoncpp_LIBS"
+ echo "UPMPDCLI_LIBS=$UPMPDCLI_LIBS"
+ 
+ LIBS=""
+-- 
+2.10.0
+
