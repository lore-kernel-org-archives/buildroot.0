From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 15:43:53 +0200
Subject: [Buildroot] [git commit] atftp: fix musl compile
Message-ID: <20150418134409.9651280791@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef33c008e3c5048d1442f8b0f6336db2fa8d79a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- add missing __THROW, __BEGIN_DECLS, __END_DECLS and __attribute_pure__
  defines in atftp own argz.h file

- add missing sys/types.h include in tftp.h and tftpd.h

Fixes [1]:

argz.h:61:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'extern'
 extern error_t __argz_create (char *__const __argv[], char **__restrict __argz,
 ^
argz.h: In function 'argz_create':
argz.h:64:34: error: expected declaration specifiers before '__THROW'
        size_t *__restrict __len) __THROW;

[1] http://autobuild.buildroot.net/results/b7f/b7f205ea2066788ea78a1a819f1b592e84e2455e/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...gz.h-fix-musl-compile-add-missing-defines.patch |   42 ++++++++++++++++++++
 ...-tftpd.h-fix-musl-compile-missing-include.patch |   40 +++++++++++++++++++
 2 files changed, 82 insertions(+), 0 deletions(-)

diff --git a/package/atftp/0002-argz.h-fix-musl-compile-add-missing-defines.patch b/package/atftp/0002-argz.h-fix-musl-compile-add-missing-defines.patch
new file mode 100644
index 0000000..0679ef3
--- /dev/null
+++ b/package/atftp/0002-argz.h-fix-musl-compile-add-missing-defines.patch
@@ -0,0 +1,42 @@
+From 543e67919f5cacf309ac88ab091331e41af4224b Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 16 Apr 2015 22:41:57 +0200
+Subject: [PATCH] argz.h: fix musl compile (add missing defines)
+
+Add __THROW, __BEGIN_DECLS, __END_DECLS and __attribute_pure__ defines.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ argz.h | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/argz.h b/argz.h
+index 582be55..bdf9f62 100644
+--- a/argz.h
++++ b/argz.h
+@@ -48,6 +48,22 @@
+ # define __const const
+ #endif
+ 
++#ifndef __THROW
++# define __THROW
++#endif
++
++#ifndef __BEGIN_DECLS
++# define __BEGIN_DECLS
++#endif
++
++#ifndef __END_DECLS
++# define __END_DECLS
++#endif
++
++#ifndef __attribute_pure__
++# define __attribute_pure__
++#endif
++
+ #ifndef __error_t_defined
+ typedef int error_t;
+ #endif
+-- 
+2.1.4
+
diff --git a/package/atftp/0003-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch b/package/atftp/0003-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch
new file mode 100644
index 0000000..485e71a
--- /dev/null
+++ b/package/atftp/0003-tftp.h-tftpd.h-fix-musl-compile-missing-include.patch
@@ -0,0 +1,40 @@
+From 77e399899d9d7297d23c321811b628febdf0fd92 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 16 Apr 2015 22:43:49 +0200
+Subject: [PATCH] tftp.h/tftpd.h: fix musl compile (missing include)
+
+Add sys/types.h include for u_char typedef.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ tftp.h  | 1 +
+ tftpd.h | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/tftp.h b/tftp.h
+index 12bd6aa..32a3f63 100644
+--- a/tftp.h
++++ b/tftp.h
+@@ -19,6 +19,7 @@
+ 
+ #include <sys/time.h>
+ #include <sys/times.h>
++#include <sys/types.h>
+ #include "tftp_def.h"
+ #include "config.h"
+ 
+diff --git a/tftpd.h b/tftpd.h
+index 945065e..60d3a49 100644
+--- a/tftpd.h
++++ b/tftpd.h
+@@ -20,6 +20,7 @@
+ #include <pthread.h>
+ #include <arpa/tftp.h>
+ #include <arpa/inet.h>
++#include <sys/types.h>
+ #include "tftp_io.h"
+ 
+ /*
+-- 
+2.1.4
+
