From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Tue, 23 Sep 2014 22:48:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/upmpdcli: bump to version 0.8.1
Message-ID: <1411505326-11833-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bumping to version 0.8.1 requires a change of the uclibc patch.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch | 59 ++++++++++++++---------
 package/upmpdcli/upmpdcli.mk                      |  2 +-
 2 files changed, 36 insertions(+), 25 deletions(-)

diff --git a/package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch b/package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch
index 4935efd..57af172 100644
--- a/package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch
+++ b/package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch
@@ -4,11 +4,18 @@ Add necessary fixes to build with uClibc
  - exp10 is not available in uClibc
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: J?rg Krause <jkrause@posteo.de>
+---
+ libupnpp/device/device.cxx | 1 +
+ libupnpp/soaphelp.cxx      | 4 ++++
+ upmpd/upmpd.cxx            | 1 +
+ upmpd/upmpdutils.cxx       | 7 +++++++
+ 4 files changed, 13 insertions(+)
 
-Index: b/libupnpp/device.cxx
-===================================================================
---- a/libupnpp/device.cxx
-+++ b/libupnpp/device.cxx
+diff --git a/libupnpp/device/device.cxx b/libupnpp/device/device.cxx
+index 682c151..48c81e4 100644
+--- a/libupnpp/device/device.cxx
++++ b/libupnpp/device/device.cxx
 @@ -17,6 +17,7 @@
  #include "config.h"
  
@@ -17,8 +24,8 @@ Index: b/libupnpp/device.cxx
  #include <sys/time.h>
  
  #include <iostream>
-Index: b/libupnpp/soaphelp.cxx
-===================================================================
+diff --git a/libupnpp/soaphelp.cxx b/libupnpp/soaphelp.cxx
+index 8f25185..f4358b9 100644
 --- a/libupnpp/soaphelp.cxx
 +++ b/libupnpp/soaphelp.cxx
 @@ -16,6 +16,10 @@
@@ -32,23 +39,23 @@ Index: b/libupnpp/soaphelp.cxx
  #include <iostream>
  using namespace std;
  
-Index: b/upmpd/upmpd.cxx
-===================================================================
+diff --git a/upmpd/upmpd.cxx b/upmpd/upmpd.cxx
+index 3b45cdd..bc506ff 100644
 --- a/upmpd/upmpd.cxx
 +++ b/upmpd/upmpd.cxx
-@@ -20,6 +20,7 @@
- #include <unistd.h>
+@@ -22,6 +22,7 @@
+ #include <signal.h>
  #include <sys/types.h>
  #include <pwd.h>
 +#include <errno.h>
  
  #include <string>
  #include <iostream>
-Index: b/upmpd/upmpdutils.cxx
-===================================================================
+diff --git a/upmpd/upmpdutils.cxx b/upmpd/upmpdutils.cxx
+index 2830a2e..7cea612 100644
 --- a/upmpd/upmpdutils.cxx
 +++ b/upmpd/upmpdutils.cxx
-@@ -21,11 +21,14 @@
+@@ -21,6 +21,8 @@
  // not linking to Qt or glib just to get path-concatenating
  // functions...
  
@@ -57,21 +64,25 @@ Index: b/upmpd/upmpdutils.cxx
  #include <unistd.h>
  #include <fcntl.h>
  #include <sys/types.h>
- #include <sys/stat.h>
- #include <sys/file.h>
-+#include <stdlib.h>
- #include <math.h>
- #include <pwd.h>
+@@ -31,6 +33,7 @@
  #include <regex.h>
-@@ -35,6 +38,11 @@
+ #include <errno.h>
+ #include <string.h>
++#include <stdlib.h>
+ #ifndef O_STREAMING
  #define O_STREAMING 0
  #endif
- 
+@@ -283,6 +286,10 @@ int percentodbvalue(int value)
+ #ifdef __APPLE__
+ #define exp10 __exp10
+ #endif
 +#ifdef __UCLIBC__
 +/* 10^x = 10^(log e^x) = (e^x)^log10 = e^(x * log 10) */
 +#define exp10(x) (exp((x) * log(10)))
 +#endif /* __UCLIBC__ */
-+
- #include <iostream>
- #include <sstream>
- #include <fstream>
+ 
+ // Translate VolumeDB to MPD 0-100
+ int dbvaluetopercent(int dbvalue)
+-- 
+2.1.0
+
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index fbd2a4f..37d8581 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 0.8.0
+UPMPDCLI_VERSION = 0.8.1
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = GPLv2+
 UPMPDCLI_LICENSE_FILES = COPYING
-- 
2.1.0
