From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 13:35:09 +0200
Subject: [Buildroot] [git commit] package/upmpdcli: add patch to fix jsoncpp
	detection
Message-ID: <20160917114306.6170281D5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af4d2b27d61d2ef232da3371772d1b2f99d3d40d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although jsoncpp is present, the build system of upmpdcli does not detect it.

The default installation path for the header files of jsoncpp is
{prefix}/json, but some systems (Debian) prefers to install the headers
in {prefix}/jsoncpp/json.

The build system only checks for the header files in
{prefix}/jsoncpp/json, so jsoncpp is not found.

This patch from upstream handles both cases now when checking for the jsoncpp
library.

The patch is squashed of two commits from upstream:
1/ aba96db0cfe8a2e5c825f4448c0ad184e21b50e1
2/ ce144f19a8c2e8c1e0ec3fe53699e874e5eb43fe

Fixes:
http://autobuild.buildroot.net/results/5bc6c558fccea0e1e1936894ce372f2b7b8ecac2
http://autobuild.buildroot.net/results/9c2d3892f17c240c44f7255d821d66acbed361f0
http://autobuild.buildroot.net/results/4d22729535ca4e6acbb48a25145611bb49c10149
http://autobuild.buildroot.net/results/fda321774c3eb225f966dd9f83def5329b703a03
http://autobuild.buildroot.net/results/f5eb306b0032e830f7f72ce80e318aa11774a5d1

.. and many more!

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/upmpdcli/0001-fix-jsoncpp-detection.patch | 90 +++++++++++++++++++++++
 package/upmpdcli/upmpdcli.mk                      |  3 +
 2 files changed, 93 insertions(+)

diff --git a/package/upmpdcli/0001-fix-jsoncpp-detection.patch b/package/upmpdcli/0001-fix-jsoncpp-detection.patch
new file mode 100644
index 0000000..69a9a0e
--- /dev/null
+++ b/package/upmpdcli/0001-fix-jsoncpp-detection.patch
@@ -0,0 +1,90 @@
+From 25762953c019ca0c5a047a5fa28f1fe6c78c731a Mon Sep 17 00:00:00 2001
+From: Jean-Francois Dockes <jf@dockes.org>
+Date: Sun, 11 Sep 2016 13:43:28 +0200
+Subject: [PATCH] fix jsoncpp detection
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The default installation path for the header files is {prefix}/json, but some
+system prefers to install the headers in {prefix}/jsoncpp/json.
+
+This patch from upstream handles both cases now when checking for the jsoncpp
+library.
+
+The patch is squashed of two commits from upstream:
+1/ aba96db0cfe8a2e5c825f4448c0ad184e21b50e1
+2/ ce144f19a8c2e8c1e0ec3fe53699e874e5eb43fe
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ configure.ac                               | 8 +++++++-
+ src/config.h.in                            | 6 ++++++
+ src/mediaserver/cdplugins/plgwithslave.cxx | 5 +++++
+ 3 files changed, 18 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index f191ad7..108dcce 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -43,9 +43,15 @@ SCCTL_LIBS=$LIBS
+ AC_CHECK_LIB([microhttpd], [MHD_queue_response], [], [])
+ 
+ AC_LANG_PUSH([C++])
++
++AC_CHECK_HEADERS(json/json.h jsoncpp/json/json.h)
+ LIBS="$LIBS -ljsoncpp"
+ AC_LINK_IFELSE([AC_LANG_PROGRAM(
+-    [#include <jsoncpp/json/json.h>], [Json::Features dummy])],
++    [[#ifdef HAVE_JSONCPP_JSON_JSON_H
++    #include <jsoncpp/json/json.h>
++    #else
++    #include <json/json.h>
++    #endif]], [Json::Features dummy])],
+     [HAVE_JSONCPP=1],
+     [AC_MSG_ERROR([libjsoncpp not found.])])
+ AC_LANG_POP
+diff --git a/src/config.h.in b/src/config.h.in
+index 1350308..0a33e15 100644
+--- a/src/config.h.in
++++ b/src/config.h.in
+@@ -3,6 +3,12 @@
+ /* Define to 1 if you have the <inttypes.h> header file. */
+ #undef HAVE_INTTYPES_H
+ 
++/* Define to 1 if you have the <jsoncpp/json/json.h> header file. */
++#undef HAVE_JSONCPP_JSON_JSON_H
++
++/* Define to 1 if you have the <json/json.h> header file. */
++#undef HAVE_JSON_JSON_H
++
+ /* Define to 1 if you have the `microhttpd' library (-lmicrohttpd). */
+ #undef HAVE_LIBMICROHTTPD
+ 
+diff --git a/src/mediaserver/cdplugins/plgwithslave.cxx b/src/mediaserver/cdplugins/plgwithslave.cxx
+index 04f0544..545805c 100644
+--- a/src/mediaserver/cdplugins/plgwithslave.cxx
++++ b/src/mediaserver/cdplugins/plgwithslave.cxx
+@@ -14,6 +14,7 @@
+  *   Free Software Foundation, Inc.,
+  *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
+  */
++#include "config.h"
+ 
+ #include "plgwithslave.hxx"
+ 
+@@ -25,7 +26,11 @@
+ #include <string.h>
+ #include <upnp/upnp.h>
+ #include <microhttpd.h>
++#ifdef HAVE_JSONCPP_JSON_JSON_H
+ #include <jsoncpp/json/json.h>
++#else
++#include <json/json.h>
++#endif
+ 
+ #include "cmdtalk.h"
+ #include "pathut.h"
+-- 
+2.9.3
+
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 85b78fe..b70f413 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -9,6 +9,9 @@ UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = GPLv2+
 UPMPDCLI_LICENSE_FILES = COPYING
 UPMPDCLI_DEPENDENCIES = libmpdclient libupnpp libmicrohttpd jsoncpp
+# touching configure.ac in
+#   0001-fix-jsoncpp-detection.patch
+UPMPDCLI_AUTORECONF = YES
 
 ifeq ($(BR2_STATIC_LIBS),y)
 # Upmpdcli forgets to take the dependencies of libupnpp into
