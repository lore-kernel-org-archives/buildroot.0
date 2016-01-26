From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 26 Jan 2016 23:17:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/openpgm: fix musl build
Message-ID: <1453846632-1691-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/854/854554827ead82f29b293ddceced6eb7fbfeec27/
http://autobuild.buildroot.net/results/aa2/aa2cf491dfb199a349afd107046f428107a583a0//
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/openpgm/0003-musl.patch | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/openpgm/0003-musl.patch

diff --git a/package/openpgm/0003-musl.patch b/package/openpgm/0003-musl.patch
new file mode 100644
index 0000000..5b296a3
--- /dev/null
+++ b/package/openpgm/0003-musl.patch
@@ -0,0 +1,39 @@
+Fix musl build
+
+Downloaded from
+http://git.alpinelinux.org/cgit/aports/plain/main/openpgm/openpgm-fix-includes.patch
+and adjusted paths by prefixing with "openpgm/pgm/"
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+--- ./openpgm/pgm/include/pgm/types.h
++++ ./openpgm/pgm/include/pgm/types.h
+@@ -27,6 +27,7 @@
+ 
+ #ifndef _MSC_VER
+ #	include <sys/param.h>
++#	include <sys/types.h>
+ #endif
+ #include <pgm/macros.h>
+ 
+--- ./openpgm/pgm/include/impl/security.h
++++ ./openpgm/pgm/include/impl/security.h
+@@ -33,7 +33,6 @@
+ #include <stdio.h>
+ #include <stdarg.h>
+ #include <sys/types.h>
+-#include <sys/timeb.h>
+ #include <impl/i18n.h>
+ #include <impl/errno.h>
+ #include <impl/string.h>
+@@ -41,6 +40,8 @@
+ PGM_BEGIN_DECLS
+ 
+ #ifdef HAVE_FTIME
++#include <sys/timeb.h>
++
+ static inline
+ errno_t
+ #	if   !defined( _WIN32 )
+
-- 
2.7.0.rc3
