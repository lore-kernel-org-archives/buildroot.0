From: Olivier Singla <olivier.singla@gmail.com>
Date: Tue,  2 Aug 2016 21:14:13 -0400
Subject: [Buildroot] [PATCH 1/1] shellinabox - Patch to support latest
	buildroot environment
Message-ID: <1470186853-21468-1-git-send-email-olivier.singla@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Olivier <osingla@localhost.localdomain>

Signed-off-by: Olivier <osingla@localhost.localdomain>
---
 .../0002-launcher.c-fix-ttydef-utmpx.patch         | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/shellinabox/0002-launcher.c-fix-ttydef-utmpx.patch

diff --git a/package/shellinabox/0002-launcher.c-fix-ttydef-utmpx.patch b/package/shellinabox/0002-launcher.c-fix-ttydef-utmpx.patch
new file mode 100644
index 0000000..54cb699
--- /dev/null
+++ b/package/shellinabox/0002-launcher.c-fix-ttydef-utmpx.patch
@@ -0,0 +1,28 @@
+launcher.c: added include to <sys/ttydefaults.h> to avoid missing definitions
+launcher.c: do not include utmpx.h (since ptsname_r is already defined in stdlib.h)
+
+Signed-off-by:  "Olivier Singla" <olivier.singla@gmail.com>
+
+--- shellinabox-v2.19/shellinabox/launcher.c.orig	2016-08-01 18:43:01.628002777 -0400
++++ shellinabox-v2.19/shellinabox/launcher.c	2016-08-01 18:45:14.943444066 -0400
+@@ -81,6 +81,10 @@
+ #include <sys/uio.h>
+ #endif
+ 
++#ifndef TTYDEF_IFLAG
++#include <sys/ttydefaults.h>
++#endif
++
+ #ifdef HAVE_UTIL_H
+ #include <util.h>
+ #endif
+@@ -90,7 +94,8 @@
+ #endif
+ 
+ #ifdef HAVE_UTMPX_H
+-#include <utmpx.h>
++//#include <utmpx.h>
++#undef HAVE_UTMPX_H
+ #endif
+ 
+ #if defined(HAVE_SECURITY_PAM_APPL_H)
-- 
2.5.5
