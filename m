From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 30 Dec 2017 23:38:07 +0200
Subject: [Buildroot] [PATCH] syslog-ng: fix build with newer json-c
Message-ID: <353a47c61a55ab31689a812b8f931519cf374ae4.1514669887.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch fixing build with json-c version 0.13.

Fixes:
http://autobuild.buildroot.net/results/e12/e12b88d082f053247863124f4802cafc73278c8c/
http://autobuild.buildroot.net/results/cdc/cdc941b47fe04e8e99393004b750451490dc8c8e/
http://autobuild.buildroot.net/results/b85/b854c97b5af5125394246298d010baafa175a4c3/

Cc: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...1-modules-json-Adaptions-for-json-c-v0.13.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/syslog-ng/0001-modules-json-Adaptions-for-json-c-v0.13.patch

diff --git a/package/syslog-ng/0001-modules-json-Adaptions-for-json-c-v0.13.patch b/package/syslog-ng/0001-modules-json-Adaptions-for-json-c-v0.13.patch
new file mode 100644
index 000000000000..b307ab5acfe0
--- /dev/null
+++ b/package/syslog-ng/0001-modules-json-Adaptions-for-json-c-v0.13.patch
@@ -0,0 +1,39 @@
+From 1b824dd6389e209eab752d5a698c6093f311e3e3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bj=C3=B6rn=20Esser?= <besser82@fedoraproject.org>
+Date: Mon, 11 Dec 2017 15:46:06 +0100
+Subject: [PATCH] modules/json: Adaptions for json-c v0.13
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: upstream commit 1b824dd6389e
+
+ modules/json/json-parser.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/modules/json/json-parser.c b/modules/json/json-parser.c
+index 0368ed8f7ffe..356df48b9fc7 100644
+--- a/modules/json/json-parser.c
++++ b/modules/json/json-parser.c
+@@ -20,6 +20,8 @@
+  * COPYING for details.
+  */
+ 
++#define JSON_C_VER_013 (13 << 8)
++
+ #include "json-parser.h"
+ #include "dot-notation.h"
+ #include "scratch-buffers.h"
+@@ -28,7 +30,10 @@
+ #include <ctype.h>
+ 
+ #include <json.h>
++
++#if (!defined(JSON_C_VERSION_NUM)) || (JSON_C_VERSION_NUM < JSON_C_VER_013)
+ #include <json_object_private.h>
++#endif
+ 
+ typedef struct _JSONParser
+ {
+-- 
+2.15.1
+
-- 
2.15.1
