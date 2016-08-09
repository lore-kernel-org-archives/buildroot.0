From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 15:49:52 +0200
Subject: [Buildroot] [git commit] linux-zigbee: fix build on musl
Message-ID: <20160809135014.AD3E981999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8457c2190a98487ed0ae64e213cacefe42aa7bb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to the linux-zigbee package that fixes the
build on musl by adding a missing <time.h> include.

Fixes:

  http://autobuild.buildroot.net/results/5d56f998b5c5ab9e06cf048e6ec95b8671989cef/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...d-config-parse.y-add-missing-time.h-inclu.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/linux-zigbee/0002-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch b/package/linux-zigbee/0002-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch
new file mode 100644
index 0000000..0ce4381
--- /dev/null
+++ b/package/linux-zigbee/0002-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch
@@ -0,0 +1,43 @@
+From 8cc60d618f81f2eeaa926cd60ed9b55ee6cda6ea Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 8 Aug 2016 15:42:46 +0200
+Subject: [PATCH] addrdb/coord-config-parse.y: add missing <time.h> include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The %union definition uses the time_t structure. In order to use this
+structure, the <time.h> header has to be included. Otherwise, the build
+breaks with some C libraries, such as musl:
+
+In file included from coord-config-lex.l:23:0:
+coord-config-parse.y:107:2: error: unknown type name ???time_t???
+  time_t timestamp;
+  ^
+
+This patch includes <time.h> using the '%code requires' directive of
+Yacc.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ addrdb/coord-config-parse.y | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/addrdb/coord-config-parse.y b/addrdb/coord-config-parse.y
+index 2e10a88..85ee058 100644
+--- a/addrdb/coord-config-parse.y
++++ b/addrdb/coord-config-parse.y
+@@ -102,6 +102,10 @@
+ 
+ %}
+ 
++%code requires {
++#include <time.h>
++}
++
+ %union {
+ 	unsigned long number;
+ 	time_t timestamp;
+-- 
+2.7.4
+
