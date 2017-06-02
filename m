From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Jun 2017 13:30:17 +0200
Subject: [Buildroot] [git commit] tinyalsa: fix musl build
Message-ID: <20170602113407.D1A7C82A2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81d324783653e28f561911e267331c4713305584
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch adding missing header to fix build with musl.

Fixes:
http://autobuild.buildroot.net/results/de9/de97fbd0b9c88bb5d9aa81ea6d73cdcaadb9c763/

Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-interval.h-add-missing-header.patch       | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/tinyalsa/0002-interval.h-add-missing-header.patch b/package/tinyalsa/0002-interval.h-add-missing-header.patch
new file mode 100644
index 0000000..c043145
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
