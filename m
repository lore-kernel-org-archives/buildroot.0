From: Vadim Kochan <vadim4j@gmail.com>
Date: Thu,  7 Mar 2019 01:14:29 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/efl: Fix build with mesa
Message-ID: <20190306231429.22849-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

efl does not compile with mesa without OpenGL ES because it checks for
GL_ES_VERSION_2_0 and declares own GLintptr and GLsizeiptr types if such
version is not defined, but mesa declares them too for OpenGL version
1.5, so fix it by add check also for OpenGL 1.5 where these types are
defined.

Use patch from:
	https://git.enlightenment.org/core/efl.git/commit/?id=0d2b624f1e24240a1c4e651aa1cfe9a8dd10a573

Fixes:
	http://autobuild.buildroot.net/results/62ca120f1e54e8c3ae445f98b2624b526569f007

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---

v2:
    1) Add signed-off to efl fix patch

 ...e-GLintptr-etc.-also-ndefed-for-GL_VERSIO.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/efl/0001-evas-gl-make-GLintptr-etc.-also-ndefed-for-GL_VERSIO.patch

diff --git a/package/efl/0001-evas-gl-make-GLintptr-etc.-also-ndefed-for-GL_VERSIO.patch b/package/efl/0001-evas-gl-make-GLintptr-etc.-also-ndefed-for-GL_VERSIO.patch
new file mode 100644
index 0000000000..b64a200ffb
--- /dev/null
+++ b/package/efl/0001-evas-gl-make-GLintptr-etc.-also-ndefed-for-GL_VERSIO.patch
@@ -0,0 +1,34 @@
+From d045dd99acdd47be238642d4f9384dccacde2b42 Mon Sep 17 00:00:00 2001
+From: "Carsten Haitzler (Rasterman)" <raster@rasterman.com>
+Date: Sat, 15 Dec 2018 16:19:01 +0000
+Subject: [PATCH] evas gl - make GLintptr etc. also ndefed for GL_VERSION_1_5
+ fix typedef
+
+It seems that GL_VERSION_1_5 define == these provided by gl already. At
+least reading the mesa headers I do, so this should fix T7502
+
+Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
+---
+ src/lib/evas/Evas_GL.h | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/lib/evas/Evas_GL.h b/src/lib/evas/Evas_GL.h
+index fa3e6f4..5524d82 100644
+--- a/src/lib/evas/Evas_GL.h
++++ b/src/lib/evas/Evas_GL.h
+@@ -4272,9 +4272,11 @@ typedef signed int       GLfixed;      // Changed khronos_int32_t
+ 
+ #ifndef GL_ES_VERSION_2_0
+ /* GL types for handling large vertex buffer objects */
+-#include <stddef.h>
++# ifndef GL_VERSION_1_5
++#  include <stddef.h>
+ typedef ptrdiff_t GLintptr;     // Changed khronos_intptr_t
+ typedef ptrdiff_t GLsizeiptr;   // Changed khronos_ssize_t
++# endif
+ #endif
+ 
+ /* Some definitions from GLES 3.0.
+-- 
+2.14.1
+
-- 
2.14.1
