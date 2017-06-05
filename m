From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  5 Jun 2017 17:45:18 +0200
Subject: [Buildroot] [PATCH v2] package/sunxi-mali: fix conflicting data
	types between GLES2/gl2.h and GLES/gl.h
Message-ID: <20170605154518.20805-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When OpenGL ES 1.1 and OpenGL ES 2.0 are used at the same time, the
build fail since GLintptr and GLsizeiptr data type are not the same in
GLES2/gl2.h and GLES/gl.h.

Also sync the data type of GLbyte, GLubyte, GLfloat, GLclampf and
GLfixed.

Fixes:
http://autobuild.buildroot.net/results/258/25898b45cefde9661d8ac87dd84bc883bb5283d1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Spenser Gilliland <spenser@gillilanding.com>
---
v2: fix a typo in title
    Also change all remaining data type (Thomas)
---
 ...ting-data-types-between-GLES2-gl2.h-and-G.patch | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/sunxi-mali/0003-fix-conflicting-data-types-between-GLES2-gl2.h-and-G.patch

diff --git a/package/sunxi-mali/0003-fix-conflicting-data-types-between-GLES2-gl2.h-and-G.patch b/package/sunxi-mali/0003-fix-conflicting-data-types-between-GLES2-gl2.h-and-G.patch
new file mode 100644
index 0000000..62e1b17
--- /dev/null
+++ b/package/sunxi-mali/0003-fix-conflicting-data-types-between-GLES2-gl2.h-and-G.patch
@@ -0,0 +1,57 @@
+From 5bf4d4f9c759fdb3c0db61a781042223236169c6 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Mon, 5 Jun 2017 12:40:16 +0200
+Subject: [PATCH] fix conflicting data types between GLES2/gl2.h and GLES/gl.h
+
+When OpenGL ES 1.1 and OpenGL ES 2.0 are used at the same time, the
+build fail since GLintptr and GLsizeiptr data type are not the same in
+GLES2/gl2.h and GLES/gl.h.
+
+Also sync the data type of GLbyte, GLubyte, GLfloat, GLclampf and
+GLfixed.
+
+Fixes:
+http://autobuild.buildroot.net/results/258/25898b45cefde9661d8ac87dd84bc883bb5283d1
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ include/GLES/gl.h | 15 +++++++--------
+ 1 file changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/include/GLES/gl.h b/include/GLES/gl.h
+index a6bb591..799408b 100644
+--- a/include/GLES/gl.h
++++ b/include/GLES/gl.h
+@@ -18,22 +18,21 @@ typedef void             GLvoid;
+ typedef unsigned int     GLenum;
+ typedef unsigned char    GLboolean;
+ typedef unsigned int     GLbitfield;
+-typedef signed char		   GLbyte;
++typedef khronos_int8_t   GLbyte;
+ typedef short            GLshort;
+ typedef int              GLint;
+ typedef int              GLsizei;
+-typedef unsigned char			GLubyte;
++typedef khronos_uint8_t  GLubyte;
+ typedef unsigned short   GLushort;
+ typedef unsigned int     GLuint;
+-typedef float  GLfloat;
+-typedef float  GLclampf;
+-typedef signed int  GLfixed;
++typedef khronos_float_t  GLfloat;
++typedef khronos_float_t  GLclampf;
++typedef khronos_int32_t  GLfixed;
+ typedef signed int  GLclampx;
+ typedef char GLchar;
+ 
+-typedef int * GLintptr;
+-typedef int *  GLsizeiptr;
+-
++typedef khronos_intptr_t GLintptr;
++typedef khronos_ssize_t  GLsizeiptr;
+ 
+ /*************************************************************/
+ 
+-- 
+2.9.4
+
-- 
2.9.4
