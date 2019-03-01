From: Vadim Kochan <vadim4j@gmail.com>
Date: Fri,  1 Mar 2019 02:23:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/efl: Fix build without OpenGL ES
Message-ID: <20190301002311.17071-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

efl does not compile without OpenGL ES because it checks for
GL_ES_VERSION_2_0 and declares own GLintptr and GLsizeiptr
types if such version is not defined, so fix it by add check also for
OpenGL 1.5 where these types are defined.

Fixes:
	http://autobuild.buildroot.net/results/62ca120f1e54e8c3ae445f98b2624b526569f007

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 ...x-check-definition-of-GLsizeiptr-and-GLin.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/efl/0001-lib-evas-Fix-check-definition-of-GLsizeiptr-and-GLin.patch

diff --git a/package/efl/0001-lib-evas-Fix-check-definition-of-GLsizeiptr-and-GLin.patch b/package/efl/0001-lib-evas-Fix-check-definition-of-GLsizeiptr-and-GLin.patch
new file mode 100644
index 0000000000..07672981d3
--- /dev/null
+++ b/package/efl/0001-lib-evas-Fix-check-definition-of-GLsizeiptr-and-GLin.patch
@@ -0,0 +1,30 @@
+From 161af4faa3b30f0b2db1f9642fca559eeed05da2 Mon Sep 17 00:00:00 2001
+From: Vadim Kochan <vadim4j@gmail.com>
+Date: Fri, 1 Mar 2019 01:05:31 +0200
+Subject: [PATCH 1/1] lib: evas: Fix check definition of GLsizeiptr and
+ GLintprt
+
+GLsizeiptr and GLintptr also defined in GL 1.5 version,
+so add check for both GL and GLES versions.
+
+Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
+---
+ src/lib/evas/Evas_GL.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lib/evas/Evas_GL.h b/src/lib/evas/Evas_GL.h
+index fa3e6f4..1928f16 100644
+--- a/src/lib/evas/Evas_GL.h
++++ b/src/lib/evas/Evas_GL.h
+@@ -4270,7 +4270,7 @@ typedef signed int       GLfixed;      // Changed khronos_int32_t
+ # endif
+ #endif
+ 
+-#ifndef GL_ES_VERSION_2_0
++#if !defined(GL_VERSION_1_5) && !defined(GL_ES_VERSION_2_0)
+ /* GL types for handling large vertex buffer objects */
+ #include <stddef.h>
+ typedef ptrdiff_t GLintptr;     // Changed khronos_intptr_t
+-- 
+2.14.1
+
-- 
2.14.1
