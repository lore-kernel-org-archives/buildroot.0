From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jul 2016 22:04:46 +0200
Subject: [Buildroot] [PATCH] package/duma: fix build with C++14
Message-ID: <1468181086-17042-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.org/results/f7f/f7fc0092ec43a5a4bc38b5e6878842df77f32d3a/
    http://autobuild.buildroot.org/results/7ae/7ae0d5e4821c70077fc1731f578e8222e9d6691b/
    http://autobuild.buildroot.org/results/438/438032a6d6a38c9929cd26dffb8b3c5d1aed9106/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/duma/0003-fix-C++14.patch | 65 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 package/duma/0003-fix-C++14.patch

diff --git a/package/duma/0003-fix-C++14.patch b/package/duma/0003-fix-C++14.patch
new file mode 100644
index 0000000..d19213c
--- /dev/null
+++ b/package/duma/0003-fix-C++14.patch
@@ -0,0 +1,65 @@
+dumapp: fix for C++14
+
+With C++14, the way exceptions are specified has changed (somehow, don't
+ask me), thus causing build failures:
+
+    dumapp.cpp: In function ?void* operator new(std::size_t)?:
+    dumapp.cpp:192:19: error: declaration of ?void* operator new(std::size_t) throw (std::bad_alloc)? has a different exception specifier
+     void * DUMA_CDECL operator new( DUMA_SIZE_T size )
+                       ^~~~~~~~
+    In file included from dumapp.cpp:39:0:
+    dumapp.h:91:23: note: from previous declaration ?void* operator new(std::size_t)?
+     void * DUMA_CDECL operator new(DUMA_SIZE_T) throw(std::bad_alloc);
+                       ^~~~~~~~
+
+This is most evident with gcc-6.x, since the default C++ standard has
+changed from C++11 to C++14, thus exposing these new failures.
+
+Fix that by guarding the exception handling, a bit like was done
+with GRASS GIS (thanks DuckDuckGo):
+
+    https://trac.osgeo.org/grass/changeset?old_path=%2F&old=68817&new_path=%2F&new=68818&sfp_email=&sfph_mail=
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Note: The last commit in DUMA's CVS repo was more than 7 years ago.
+I doubt it is still active, so the patch was not sent upstream. :-/
+
+diff -durN duma-2.5.15.orig/dumapp.cpp duma-2.5.15/dumapp.cpp
+--- duma-2.5.15.orig/dumapp.cpp	2008-08-03 22:46:06.000000000 +0200
++++ duma-2.5.15/dumapp.cpp	2016-07-10 21:55:22.670386099 +0200
+@@ -190,7 +190,9 @@
+  * (11) = (a) ; ASW
+  */
+ void * DUMA_CDECL operator new( DUMA_SIZE_T size )
++#ifdef DUMA_EXCEPTION_SPECS
+ throw(std::bad_alloc)
++#endif
+ {
+   return duma_new_operator(size, EFA_NEW_ELEM, true  DUMA_PARAMS_UK);
+ }
+@@ -254,7 +256,9 @@
+  * (21) = (a) ; AAW
+  */
+ void * DUMA_CDECL operator new[]( DUMA_SIZE_T size )
++#ifdef DUMA_EXCEPTION_SPECS
+ throw(std::bad_alloc)
++#endif
+ {
+   return duma_new_operator(size, EFA_NEW_ARRAY, true  DUMA_PARAMS_UK);
+ }
+diff -durN duma-2.5.15.orig/dumapp.h duma-2.5.15/dumapp.h
+--- duma-2.5.15.orig/dumapp.h	2009-04-11 14:41:44.000000000 +0200
++++ duma-2.5.15/dumapp.h	2016-07-10 21:55:22.670386099 +0200
+@@ -35,6 +35,10 @@
+ 
+ #include "duma.h"
+ 
++#if __cplusplus < 201103L
++  #define DUMA_EXCEPTION_SPECS 1
++#endif
++
+ /* remove previous macro definitions */
+ #include "noduma.h"
+ 
-- 
2.7.4
