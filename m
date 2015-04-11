From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Apr 2015 09:59:22 +0200
Subject: [Buildroot] [PATCH 1/2] package/gcc: Fix compiling jsoncpp with musl
Message-ID: <1428739163-3413-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[ 16%] Building CXX object src/lib_json/CMakeFiles/jsoncpp_lib.dir/json_value.cpp.o
In file included from /home/fli4l/br3/output/host/usr/lib/gcc/x86_64-buildroot-linux-musl/4.9.2/include/xmmintrin.h:34:0,
                 from /home/fli4l/br3/output/host/usr/lib/gcc/x86_64-buildroot-linux-musl/4.9.2/include/x86intrin.h:31,
                 from /home/fli4l/br3/output/host/usr/x86_64-buildroot-linux-musl/include/c++/4.9.2/x86_64-buildroot-linux-musl/bits/opt_random.h:33,
                 from /home/fli4l/br3/output/host/usr/x86_64-buildroot-linux-musl/include/c++/4.9.2/random:50,
                 from /home/fli4l/br3/output/host/usr/x86_64-buildroot-linux-musl/include/c++/4.9.2/bits/stl_algo.h:66,
                 from /home/fli4l/br3/output/host/usr/x86_64-buildroot-linux-musl/include/c++/4.9.2/algorithm:62,
                 from /home/fli4l/br3/output/build/jsoncpp-1.6.1/src/lib_json/json_value.cpp:20:
/home/fli4l/br3/output/host/usr/lib/gcc/x86_64-buildroot-linux-musl/4.9.2/include/mm_malloc.h:34:64: error: declaration of 'int posix_memalign(void**, size_t, size_t) throw ()' has a different exception specifier
 extern "C" int posix_memalign (void **, size_t, size_t) throw ();
                                                                ^
In file included from /home/fli4l/br3/output/build/jsoncpp-1.6.1/include/json/assertions.h:9:0,
                 from /home/fli4l/br3/output/build/jsoncpp-1.6.1/src/lib_json/json_value.cpp:7:
/home/fli4l/br3/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/stdlib.h:98:5: error: from previous declaration 'int posix_memalign(void**, size_t, size_t)'
 int posix_memalign (void **, size_t, size_t);
     ^
make[2]: *** [src/lib_json/CMakeFiles/jsoncpp_lib.dir/json_value.cpp.o] Error 1

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../gcc/4.7.4/901-musl-posix_memalign-c++.patch    |   32 ++++++++++++++++++++
 .../gcc/4.8.4/901-musl-posix_memalign-c++.patch    |   32 ++++++++++++++++++++
 .../gcc/4.9.2/901-musl-posix_memalign-c++.patch    |   32 ++++++++++++++++++++
 3 files changed, 96 insertions(+)
 create mode 100644 package/gcc/4.7.4/901-musl-posix_memalign-c++.patch
 create mode 100644 package/gcc/4.8.4/901-musl-posix_memalign-c++.patch
 create mode 100644 package/gcc/4.9.2/901-musl-posix_memalign-c++.patch

diff --git a/package/gcc/4.7.4/901-musl-posix_memalign-c++.patch b/package/gcc/4.7.4/901-musl-posix_memalign-c++.patch
new file mode 100644
index 0000000..4869eb8
--- /dev/null
+++ b/package/gcc/4.7.4/901-musl-posix_memalign-c++.patch
@@ -0,0 +1,32 @@
+Downloaded from
+http://git.alpinelinux.org/cgit/aports/tree/main/gcc/musl-posix_memalign-c++.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+Fix conflicting prototype of posix_memalign for c++
+http://www.openwall.com/lists/musl/2013/11/10/1
+
+--- ./gcc/config/i386/pmm_malloc.h.orig
++++ ./gcc/config/i386/pmm_malloc.h
+@@ -28,11 +28,7 @@
+ 
+ /* We can't depend on <stdlib.h> since the prototype of posix_memalign
+    may not be visible.  */
+-#ifndef __cplusplus
+-extern int posix_memalign (void **, size_t, size_t);
+-#else
+-extern "C" int posix_memalign (void **, size_t, size_t) throw ();
+-#endif
++extern int __gcc_posix_memalign (void **, size_t, size_t) __asm__("posix_memalign");
+ 
+ static __inline void *
+ _mm_malloc (size_t size, size_t alignment)
+@@ -42,7 +38,7 @@
+     return malloc (size);
+   if (alignment == 2 || (sizeof (void *) == 8 && alignment == 4))
+     alignment = sizeof (void *);
+-  if (posix_memalign (&ptr, alignment, size) == 0)
++  if (__gcc_posix_memalign (&ptr, alignment, size) == 0)
+     return ptr;
+   else
+     return NULL;
diff --git a/package/gcc/4.8.4/901-musl-posix_memalign-c++.patch b/package/gcc/4.8.4/901-musl-posix_memalign-c++.patch
new file mode 100644
index 0000000..4869eb8
--- /dev/null
+++ b/package/gcc/4.8.4/901-musl-posix_memalign-c++.patch
@@ -0,0 +1,32 @@
+Downloaded from
+http://git.alpinelinux.org/cgit/aports/tree/main/gcc/musl-posix_memalign-c++.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+Fix conflicting prototype of posix_memalign for c++
+http://www.openwall.com/lists/musl/2013/11/10/1
+
+--- ./gcc/config/i386/pmm_malloc.h.orig
++++ ./gcc/config/i386/pmm_malloc.h
+@@ -28,11 +28,7 @@
+ 
+ /* We can't depend on <stdlib.h> since the prototype of posix_memalign
+    may not be visible.  */
+-#ifndef __cplusplus
+-extern int posix_memalign (void **, size_t, size_t);
+-#else
+-extern "C" int posix_memalign (void **, size_t, size_t) throw ();
+-#endif
++extern int __gcc_posix_memalign (void **, size_t, size_t) __asm__("posix_memalign");
+ 
+ static __inline void *
+ _mm_malloc (size_t size, size_t alignment)
+@@ -42,7 +38,7 @@
+     return malloc (size);
+   if (alignment == 2 || (sizeof (void *) == 8 && alignment == 4))
+     alignment = sizeof (void *);
+-  if (posix_memalign (&ptr, alignment, size) == 0)
++  if (__gcc_posix_memalign (&ptr, alignment, size) == 0)
+     return ptr;
+   else
+     return NULL;
diff --git a/package/gcc/4.9.2/901-musl-posix_memalign-c++.patch b/package/gcc/4.9.2/901-musl-posix_memalign-c++.patch
new file mode 100644
index 0000000..4869eb8
--- /dev/null
+++ b/package/gcc/4.9.2/901-musl-posix_memalign-c++.patch
@@ -0,0 +1,32 @@
+Downloaded from
+http://git.alpinelinux.org/cgit/aports/tree/main/gcc/musl-posix_memalign-c++.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+Fix conflicting prototype of posix_memalign for c++
+http://www.openwall.com/lists/musl/2013/11/10/1
+
+--- ./gcc/config/i386/pmm_malloc.h.orig
++++ ./gcc/config/i386/pmm_malloc.h
+@@ -28,11 +28,7 @@
+ 
+ /* We can't depend on <stdlib.h> since the prototype of posix_memalign
+    may not be visible.  */
+-#ifndef __cplusplus
+-extern int posix_memalign (void **, size_t, size_t);
+-#else
+-extern "C" int posix_memalign (void **, size_t, size_t) throw ();
+-#endif
++extern int __gcc_posix_memalign (void **, size_t, size_t) __asm__("posix_memalign");
+ 
+ static __inline void *
+ _mm_malloc (size_t size, size_t alignment)
+@@ -42,7 +38,7 @@
+     return malloc (size);
+   if (alignment == 2 || (sizeof (void *) == 8 && alignment == 4))
+     alignment = sizeof (void *);
+-  if (posix_memalign (&ptr, alignment, size) == 0)
++  if (__gcc_posix_memalign (&ptr, alignment, size) == 0)
+     return ptr;
+   else
+     return NULL;
-- 
1.7.10.4
