From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 13:24:50 +0200
Subject: [Buildroot] [git commit] log4cpp: fix musl compile
Message-ID: <20160715112509.9F37A82231@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91972fa22d1194cb357b7957bc11bafd93055d23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Include proper config.h (via log4cpp/Portability.hh) to fix the
evaluate of LOG4CPP_HAVE_STDINT_H in the file tests/Clock.hh

Fixes [1]:

  Clock.hh:17:13: error: 'int64_t' does not name a type
       typedef int64_t usec_t;

[1] http://autobuild.buildroot.net/results/186/1867632f30531da69f06b965bc833817400f618f

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/log4cpp/0001-Fix-musl-compile.patch | 34 +++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/log4cpp/0001-Fix-musl-compile.patch b/package/log4cpp/0001-Fix-musl-compile.patch
new file mode 100644
index 0000000..f1a13a0
--- /dev/null
+++ b/package/log4cpp/0001-Fix-musl-compile.patch
@@ -0,0 +1,34 @@
+From 17562259fb6684f351a70b98b4f3b438927ba1aa Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 11 Jul 2016 22:58:31 +0200
+Subject: [PATCH] Fix musl compile.
+
+Include proper config.h (via log4cpp/Portability.hh) to fix the
+evaluate of LOG4CPP_HAVE_STDINT_H in the file tests/Clock.hh
+
+Fixes:
+
+  Clock.hh:17:13: error: 'int64_t' does not name a type
+       typedef int64_t usec_t;
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ log4cpp/tests/Clock.hh | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/log4cpp/tests/Clock.hh b/log4cpp/tests/Clock.hh
+index 4bf0ca4..45c6467 100644
+--- a/log4cpp/tests/Clock.hh
++++ b/log4cpp/tests/Clock.hh
+@@ -6,6 +6,8 @@
+ #ifndef __CLOCK_H
+ #define __CLOCK_H
+ 
++#include <log4cpp/Portability.hh>
++
+ #ifdef LOG4CPP_HAVE_STDINT_H
+ #include <stdint.h>
+ #endif // LOG4CPP_HAVE_STDINT_H
+-- 
+2.8.1
+
