From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 17 Aug 2020 22:13:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/lttng-tools: fix build with musl
Message-ID: <20200817201335.3767619-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/0c49b3e90361ced63cad4807dbe1b13c595f5f97

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...nts-ns-tp.h-Fix-build-with-musl-libc.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/lttng-tools/0001-tests-gen-ust-events-ns-tp.h-Fix-build-with-musl-libc.patch

diff --git a/package/lttng-tools/0001-tests-gen-ust-events-ns-tp.h-Fix-build-with-musl-libc.patch b/package/lttng-tools/0001-tests-gen-ust-events-ns-tp.h-Fix-build-with-musl-libc.patch
new file mode 100644
index 0000000000..e3e0f3a777
--- /dev/null
+++ b/package/lttng-tools/0001-tests-gen-ust-events-ns-tp.h-Fix-build-with-musl-libc.patch
@@ -0,0 +1,46 @@
+From 73f906d4d6806afb1962751ccb0fe6c15f320d94 Mon Sep 17 00:00:00 2001
+From: Ovidiu Panait <ovidiu.panait@windriver.com>
+Date: Mon, 18 May 2020 16:39:26 +0300
+Subject: [PATCH] tests: gen-ust-events-ns/tp.h: Fix build with musl libc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix the following build error with musl libc:
+In file included from ../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/tp.h:14,
+                 from ../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/tp.c:10:
+../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/tp.h:17:10: error: unknown type name 'ino_t'; did you mean 'int8_t'?
+   17 |  TP_ARGS(ino_t, ns_ino),
+      |          ^~~~~
+../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/tp.h:17:10: error: unknown type name 'ino_t'; did you mean 'int8_t'?
+   17 |  TP_ARGS(ino_t, ns_ino),
+      |          ^~~~~
+../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/./tp.h:17:2: error: unknown type name 'ino_t'; did you mean 'int8_t'?
+   17 |  TP_ARGS(ino_t, ns_ino),
+      |  ^~~~~~~
+../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/./tp.h:17:2: error: unknown type name 'ino_t'; did you mean 'int8_t'?
+   17 |  TP_ARGS(ino_t, ns_ino),
+      |  ^~~~~~~
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+Signed-off-by: J?r?mie Galarneau <jeremie.galarneau@efficios.com>
+Change-Id: Ic7a73c6754fc30a62bdf6519062c07be65a2eaba
+[Retrieved from:
+https://github.com/lttng/lttng-tools/commit/73f906d4d6806afb1962751ccb0fe6c15f320d94]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tests/utils/testapp/gen-ust-events-ns/tp.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/utils/testapp/gen-ust-events-ns/tp.h b/tests/utils/testapp/gen-ust-events-ns/tp.h
+index 4dbfed51a..e0ddb29a6 100644
+--- a/tests/utils/testapp/gen-ust-events-ns/tp.h
++++ b/tests/utils/testapp/gen-ust-events-ns/tp.h
+@@ -11,6 +11,7 @@
+ #if !defined(_TRACEPOINT_TP_H) || defined(TRACEPOINT_HEADER_MULTI_READ)
+ #define _TRACEPOINT_TP_H
+ 
++#include <sys/types.h>
+ #include <lttng/tracepoint.h>
+ 
+ TRACEPOINT_EVENT(tp, tptest,
-- 
2.27.0
