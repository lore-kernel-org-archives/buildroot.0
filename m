From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 13 Jun 2016 21:45:31 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/linknx: make it build with the
	musl C library
Message-ID: <1465847131-23796-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/c0f/c0f59d3f9eb115072d410ef199f4773f2c380d6d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added better patch description and sent patch upstream

 package/linknx/0002-musl-cdefs.patch | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/linknx/0002-musl-cdefs.patch

diff --git a/package/linknx/0002-musl-cdefs.patch b/package/linknx/0002-musl-cdefs.patch
new file mode 100644
index 0000000..59e28ca
--- /dev/null
+++ b/package/linknx/0002-musl-cdefs.patch
@@ -0,0 +1,37 @@
+Do not use the non-standard <sys/cdefs.h> header
+
+<sys/cdefs.h> is glibc-specific, and should be used only internally by
+glibc, not by external libraries/programs. It is not available in all
+standard C libraries.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(Patch sent upstream: https://sourceforge.net/p/linknx/patches/21/)
+
+diff -uNr linknx-0.0.1.32.org/include/eibclient.h linknx-0.0.1.32/include/eibclient.h
+--- linknx-0.0.1.32.org/include/eibclient.h	2007-10-11 01:55:33.000000000 +0200
++++ linknx-0.0.1.32/include/eibclient.h	2016-01-23 23:21:17.315006629 +0100
+@@ -27,11 +27,12 @@
+ #ifndef EIBCLIENT_H
+ #define EIBCLIENT_H
+ 
+-#include "sys/cdefs.h"
+ #include "stdint.h"
+ #include <pthsem.h>
+ 
+-__BEGIN_DECLS;
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ #include "eibloadresult.h"
+ 
+@@ -705,5 +706,8 @@
+  */
+ int EIB_LoadImage_async (EIBConnection * con, const uint8_t * image, int len);
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
++
+ #endif
-- 
2.8.1
