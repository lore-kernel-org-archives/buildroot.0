From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  2 Jun 2017 12:32:53 +0300
Subject: [Buildroot] [PATCH] tinyalsa: fix musl build
Message-ID: <d5dd1e14ebcc23f33a51c9f24bbd7bfaf37d1509.1496395973.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch adding missing header to fix build with musl.

Fixes:
http://autobuild.buildroot.net/results/de9/de97fbd0b9c88bb5d9aa81ea6d73cdcaadb9c763/

Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0002-interval.h-add-missing-header.patch       | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/tinyalsa/0002-interval.h-add-missing-header.patch

diff --git a/package/tinyalsa/0002-interval.h-add-missing-header.patch b/package/tinyalsa/0002-interval.h-add-missing-header.patch
new file mode 100644
index 000000000000..c043145b550b
--- /dev/null
+++ b/package/tinyalsa/0002-interval.h-add-missing-header.patch
@@ -0,0 +1,36 @@
+From 685e530d8a0063134642371eaacd01fee2f62d85 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 2 Jun 2017 12:19:03 +0300
+Subject: [PATCH] interval.h: add missing header
+
+The ssize_t type requires the unistd.h header. This fixes build with musl
+libc:
+
+In file included from ../include/tinyalsa/limits.h:32:0,
+                 from limits.c:1:
+../include/tinyalsa/interval.h:38:2: error: unknown type name 'ssize_t'
+  ssize_t max;
+  ^
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/tinyalsa/tinyalsa/pull/98
+
+ include/tinyalsa/interval.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/tinyalsa/interval.h b/include/tinyalsa/interval.h
+index 3f6f3dce5d90..068571df5a63 100644
+--- a/include/tinyalsa/interval.h
++++ b/include/tinyalsa/interval.h
+@@ -30,6 +30,7 @@
+ #define TINYALSA_INTERVAL_H
+ 
+ #include <stdlib.h>
++#include <unistd.h>
+ 
+ /** A closed range signed interval. */
+ 
+-- 
+2.11.0
+
-- 
2.11.0
