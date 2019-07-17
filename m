From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 17 Jul 2019 20:17:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/tesseract-ocr: fix build on uclibc
Message-ID: <20190717181757.14059-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/bdfbafa105ddf0b9b9399d94b557d318ad587d79

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-scanutils.cpp-include-sys-types.h.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/tesseract-ocr/0001-scanutils.cpp-include-sys-types.h.patch

diff --git a/package/tesseract-ocr/0001-scanutils.cpp-include-sys-types.h.patch b/package/tesseract-ocr/0001-scanutils.cpp-include-sys-types.h.patch
new file mode 100644
index 0000000000..bbacfb7a86
--- /dev/null
+++ b/package/tesseract-ocr/0001-scanutils.cpp-include-sys-types.h.patch
@@ -0,0 +1,38 @@
+From 0172d83d500a1287b1403e7b9398a1bcd417fdb7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 17 Jul 2019 20:10:23 +0200
+Subject: [PATCH] scanutils.cpp: include sys/types.h
+
+Include sys/types.h (if available) to avoid the following build failure:
+
+scanutils.cpp: In function 'int tvfscanf(FILE*, const char*, va_list)':
+scanutils.cpp:217:3: error: 'off_t' was not declared in this scope
+   off_t start_off = ftell(stream)
+
+Fixes:
+ - http://autobuild.buildroot.org/results/bdfbafa105ddf0b9b9399d94b557d318ad587d79
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/tesseract-ocr/tesseract/pull/2579]
+---
+ src/ccutil/scanutils.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/ccutil/scanutils.cpp b/src/ccutil/scanutils.cpp
+index da0c6918..5c2af6da 100644
+--- a/src/ccutil/scanutils.cpp
++++ b/src/ccutil/scanutils.cpp
+@@ -26,6 +26,10 @@
+ #include <cstring>
+ #include <limits>       // for std::numeric_limits
+ 
++#ifdef HAVE_SYS_TYPES_H
++#include <sys/types.h>  // for off_t
++#endif
++
+ #include "scanutils.h"
+ 
+ enum Flags {
+-- 
+2.20.1
+
-- 
2.20.1
