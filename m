From: stefan.nickl at gmail.com <stefan.nickl@gmail.com>
Date: Sun, 23 Oct 2016 20:49:58 +0200
Subject: [Buildroot] [PATCH v2] pppd: Provide error() implementation in
	pppoe-discovery
Message-ID: <1477248598-6052-1-git-send-email-Stefan.Nickl@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Stefan Nickl <Stefan.Nickl@gmail.com>

The pppoe-discovery program calls error() from the CHECK_ROOM macro
defined in pppoe.h. Since pppoe-discovery is a standalone program not
linked with the rest of pppd, the only way this could build is by
linking to glibc's proprietary error(3) function instead of the function
of the same name (but with different arguments) defined in pppd/utils.c.

So with glibc and uClibc this builds, but will probably crash when the
assertion is triggered. As the assertion is unlikely to fail, nobody has
noticed. The build however fails with musl libc since it doesn't
provide the doppelganger.

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>

diff --git a/package/pppd/0002-rp-pppoe-error.patch b/package/pppd/0002-rp-pppoe-error.patch
new file mode 100644
index 0000000..f103f4d
--- /dev/null
+++ b/package/pppd/0002-rp-pppoe-error.patch
@@ -0,0 +1,27 @@
+diff --git a/pppd/plugins/rp-pppoe/pppoe-discovery.c b/pppd/plugins/rp-pppoe/pppoe-discovery.c
+index 3d3bf4e..55037df 100644
+--- a/pppd/plugins/rp-pppoe/pppoe-discovery.c
++++ b/pppd/plugins/rp-pppoe/pppoe-discovery.c
+@@ -9,6 +9,7 @@
+  *
+  */
+ 
++#include <stdarg.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <unistd.h>
+@@ -55,6 +56,14 @@ void die(int status)
+ 	exit(status);
+ }
+ 
++void error(char *fmt, ...)
++{
++    va_list pvar;
++    va_start(pvar, fmt);
++    vfprintf(stderr, fmt, pvar);
++    va_end(pvar);
++}
++
+ /* Initialize frame types to RFC 2516 values.  Some broken peers apparently
+    use different frame types... sigh... */
+ 
-- 
2.7.4
