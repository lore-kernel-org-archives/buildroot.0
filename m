From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Oct 2014 15:06:25 +0200
Subject: [Buildroot] [git commit] package/upmpdcli: Fix build with uclibc on
	SH4
Message-ID: <20141004130700.6828D9D822@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be47b84c1a5604e3f1bf831b011c6717a2900282
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missing header file <cstdio> to the uclibc patch to fix build with
target SH4.

Fixes:
  http://autobuild.buildroot.net/results/e5be8fe46a30f0b417fe5fc19a27c480d885791e/
  http://autobuild.buildroot.net/results/a3453afddff4fc03681f7fbdff3ccab9706eb189/

[Thomas: further improve the patch by adding a missing <errno.h>
include.]

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch |   68 +++++++++++++++------
 1 files changed, 49 insertions(+), 19 deletions(-)

diff --git a/package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch b/package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch
index ee6b716..2d46b94 100644
--- a/package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch
+++ b/package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch
@@ -1,3 +1,11 @@
+From 722ffb8612631b9f11d888c737facdcb0580aaad Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
+Date: Wed, 1 Oct 2014 22:31:11 +0200
+Subject: [PATCH 1/1] uclibc fixes
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
 Add necessary fixes to build with uClibc
 
  - Missing #include of C library headers
@@ -11,12 +19,13 @@ Signed-off-by: J??rg Krause <jkrause@posteo.de>
  libupnpp/control/renderingcontrol.cxx | 2 ++
  libupnpp/device/device.cxx            | 1 +
  libupnpp/soaphelp.cxx                 | 4 ++++
+ libupnpp/upnpavutils.cxx              | 1 +
  upmpd/upmpd.cxx                       | 1 +
  upmpd/upmpdutils.cxx                  | 7 +++++++
- 7 files changed, 18 insertions(+)
+ 8 files changed, 19 insertions(+)
 
-diff --git a/libupnpp/control/avtransport.cxx b/libupnpp/control/avtransport.cxx
-index 1aa79e2..d48af23 100644
+Index: b/libupnpp/control/avtransport.cxx
+===================================================================
 --- a/libupnpp/control/avtransport.cxx
 +++ b/libupnpp/control/avtransport.cxx
 @@ -15,6 +15,8 @@
@@ -28,8 +37,8 @@ index 1aa79e2..d48af23 100644
  #include <string>
  #include <functional>
  
-diff --git a/libupnpp/control/ohplaylist.cxx b/libupnpp/control/ohplaylist.cxx
-index 5269a5d..fe95cc1 100644
+Index: b/libupnpp/control/ohplaylist.cxx
+===================================================================
 --- a/libupnpp/control/ohplaylist.cxx
 +++ b/libupnpp/control/ohplaylist.cxx
 @@ -14,6 +14,7 @@
@@ -40,8 +49,8 @@ index 5269a5d..fe95cc1 100644
  #include <arpa/inet.h>
  
  #include <string>
-diff --git a/libupnpp/control/renderingcontrol.cxx b/libupnpp/control/renderingcontrol.cxx
-index 818e7c3..17d28ee 100644
+Index: b/libupnpp/control/renderingcontrol.cxx
+===================================================================
 --- a/libupnpp/control/renderingcontrol.cxx
 +++ b/libupnpp/control/renderingcontrol.cxx
 @@ -15,6 +15,8 @@
@@ -53,8 +62,8 @@ index 818e7c3..17d28ee 100644
  #include <string>
  #include <functional>
  
-diff --git a/libupnpp/device/device.cxx b/libupnpp/device/device.cxx
-index 682c151..48c81e4 100644
+Index: b/libupnpp/device/device.cxx
+===================================================================
 --- a/libupnpp/device/device.cxx
 +++ b/libupnpp/device/device.cxx
 @@ -17,6 +17,7 @@
@@ -65,8 +74,8 @@ index 682c151..48c81e4 100644
  #include <sys/time.h>
  
  #include <iostream>
-diff --git a/libupnpp/soaphelp.cxx b/libupnpp/soaphelp.cxx
-index 8f25185..f4358b9 100644
+Index: b/libupnpp/soaphelp.cxx
+===================================================================
 --- a/libupnpp/soaphelp.cxx
 +++ b/libupnpp/soaphelp.cxx
 @@ -16,6 +16,10 @@
@@ -80,8 +89,20 @@ index 8f25185..f4358b9 100644
  #include <iostream>
  using namespace std;
  
-diff --git a/upmpd/upmpd.cxx b/upmpd/upmpd.cxx
-index 3b45cdd..bc506ff 100644
+Index: b/libupnpp/upnpavutils.cxx
+===================================================================
+--- a/libupnpp/upnpavutils.cxx
++++ b/libupnpp/upnpavutils.cxx
+@@ -14,6 +14,7 @@
+  *       Free Software Foundation, Inc.,
+  *       59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
+  */
++#include <cstdio>
+ #include <string>
+ using namespace std;
+ 
+Index: b/upmpd/upmpd.cxx
+===================================================================
 --- a/upmpd/upmpd.cxx
 +++ b/upmpd/upmpd.cxx
 @@ -22,6 +22,7 @@
@@ -92,8 +113,8 @@ index 3b45cdd..bc506ff 100644
  
  #include <string>
  #include <iostream>
-diff --git a/upmpd/upmpdutils.cxx b/upmpd/upmpdutils.cxx
-index 2830a2e..7cea612 100644
+Index: b/upmpd/upmpdutils.cxx
+===================================================================
 --- a/upmpd/upmpdutils.cxx
 +++ b/upmpd/upmpdutils.cxx
 @@ -21,6 +21,8 @@
@@ -113,7 +134,7 @@ index 2830a2e..7cea612 100644
  #ifndef O_STREAMING
  #define O_STREAMING 0
  #endif
-@@ -283,6 +286,10 @@ int percentodbvalue(int value)
+@@ -283,6 +286,10 @@
  #ifdef __APPLE__
  #define exp10 __exp10
  #endif
@@ -124,6 +145,15 @@ index 2830a2e..7cea612 100644
  
  // Translate VolumeDB to MPD 0-100
  int dbvaluetopercent(int dbvalue)
--- 
-2.1.1
-
+Index: b/upmpd/ohmetacache.cxx
+===================================================================
+--- a/upmpd/ohmetacache.cxx
++++ b/upmpd/ohmetacache.cxx
+@@ -18,6 +18,7 @@
+ #include <unistd.h>
+ #include <fcntl.h>
+ #include <string.h>
++#include <errno.h>
+ 
+ #include <iostream>
+ using namespace std;
