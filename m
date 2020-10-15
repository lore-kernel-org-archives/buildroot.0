From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 15 Oct 2020 18:46:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/apparmor: fix build on uclibc
Message-ID: <20201015164604.963072-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build of version 3.0.0 with uclibc

Fixes:
 - http://autobuild.buildroot.org/results/aea20bd5539fad35385565ffeb7e6ac566507017

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...orce-host-cpp-to-detect-reallocarray.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/apparmor/0001-parser-Makefile-dont-force-host-cpp-to-detect-reallocarray.patch

diff --git a/package/apparmor/0001-parser-Makefile-dont-force-host-cpp-to-detect-reallocarray.patch b/package/apparmor/0001-parser-Makefile-dont-force-host-cpp-to-detect-reallocarray.patch
new file mode 100644
index 0000000000..0510489d55
--- /dev/null
+++ b/package/apparmor/0001-parser-Makefile-dont-force-host-cpp-to-detect-reallocarray.patch
@@ -0,0 +1,37 @@
+From 0dbcbee70097ecde66708064ec1dedfa64e581e8 Mon Sep 17 00:00:00 2001
+From: Armin Kuster <akuster@mvista.com>
+Date: Wed, 7 Oct 2020 20:50:38 -0700
+Subject: [PATCH] parser/Makefile: dont force host cpp to detect reallocarray
+
+In cross build environments, using the hosts cpp gives incorrect
+detection of reallocarray. Change cpp to a variable.
+
+fixes:
+parser_misc.c: In function 'int capable_add_cap(const char*, int, unsigned int, capability_flags)':
+| parser_misc.c:297:37: error: 'reallocarray' was not declared in this scope
+|   297 |   tmp = (struct capability_table *) reallocarray(cap_table, sizeof(struct capability_table), cap_table_size+1);
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+[Retrieved from:
+https://gitlab.com/ffontaine/apparmor/-/commit/0dbcbee70097ecde66708064ec1dedfa64e581e8]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ parser/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/parser/Makefile b/parser/Makefile
+index acef3d77a..8250ac451 100644
+--- a/parser/Makefile
++++ b/parser/Makefile
+@@ -54,7 +54,7 @@ endif
+ CPPFLAGS += -D_GNU_SOURCE
+ 
+ STDLIB_INCLUDE:="\#include <stdlib.h>"
+-HAVE_REALLOCARRAY:=$(shell echo $(STDLIB_INCLUDE) | cpp ${CPPFLAGS} | grep -q reallocarray && echo true)
++HAVE_REALLOCARRAY:=$(shell echo $(STDLIB_INCLUDE) | ${CPP} ${CPPFLAGS} | grep -q reallocarray && echo true)
+ 
+ WARNINGS = -Wall
+ CXX_WARNINGS = ${WARNINGS} ${EXTRA_WARNINGS}
+-- 
+GitLab
+
-- 
2.28.0
