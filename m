From: stefan.nickl at gmail.com <stefan.nickl@gmail.com>
Date: Sat, 15 Oct 2016 20:25:14 +0200
Subject: [Buildroot] [PATCH] pppd: Provide error() implementation in
	pppoe-discovery
Message-ID: <1476555914-22201-1-git-send-email-Stefan.Nickl@gmail.com>
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

So with glibc this builds, but will probably crash when the assertion is
triggered. As the assertion is unlikely to fail, nobody has noticed.

The build however fails with musl libc or uClibc since they don't
provide the doppelganger.

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>

--
I noticed pppd failing in the autobuild for uClibc due to one of the issues
that also prevent it from building with musl.  This should fix building
for both, as well as a latent bug when built against glibc.

diff --git a/pppd/plugins/rp-pppoe/pppoe-discovery.c b/pppd/plugins/rp-pppoe/pppoe-discovery.c
index 3d3bf4e..55037df 100644
--- a/pppd/plugins/rp-pppoe/pppoe-discovery.c
+++ b/pppd/plugins/rp-pppoe/pppoe-discovery.c
@@ -9,6 +9,7 @@
  *
  */
 
+#include <stdarg.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
@@ -55,6 +56,14 @@ void die(int status)
 	exit(status);
 }
 
+void error(char *fmt, ...)
+{
+    va_list pvar;
+    va_start(pvar, fmt);
+    vfprintf(stderr, fmt, pvar);
+    va_end(pvar);
+}
+
 /* Initialize frame types to RFC 2516 values.  Some broken peers apparently
    use different frame types... sigh... */
 
