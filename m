From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Mon,  9 May 2016 16:12:28 +0200
Subject: [Buildroot] [PATCH] gcc: fix 5.x version build when using gcc6 on
	host
Message-ID: <1462803148-1388-1-git-send-email-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When we use gcc6 on host PC and try to build gcc5 in Buildroot we fail
on host-gcc-final. This issue is already known [1] and fixed in gcc, but
there is no gcc5 release containing this fix yet.

Add upstream patch (r233720 [2]) to fix building host-gcc-final.

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69959
[2] https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=233720

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 .../gcc/5.3.0/931-fix-build-when-using-gcc6.patch  | 155 +++++++++++++++++++++
 1 file changed, 155 insertions(+)
 create mode 100644 package/gcc/5.3.0/931-fix-build-when-using-gcc6.patch

diff --git a/package/gcc/5.3.0/931-fix-build-when-using-gcc6.patch b/package/gcc/5.3.0/931-fix-build-when-using-gcc6.patch
new file mode 100644
index 0000000..65f3d98
--- /dev/null
+++ b/package/gcc/5.3.0/931-fix-build-when-using-gcc6.patch
@@ -0,0 +1,155 @@
+From 1e5f1089dec3af328fd03125d6778f666d0bd4e4 Mon Sep 17 00:00:00 2001
+From: edlinger <edlinger@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 25 Feb 2016 15:33:50 +0000
+Subject: [PATCH] fix build when using gcc6
+
+2016-02-25  Bernd Edlinger  <bernd.edlinger@hotmail.de>
+
+        Backported from mainline
+        2016-02-19  Jakub Jelinek  <jakub@redhat.com>
+                    Bernd Edlinger  <bernd.edlinger@hotmail.de>
+
+        * Make-lang.in: Invoke gperf with -L C++.
+        * cfns.gperf: Remove prototypes for hash and libc_name_p
+        inlines.
+        * cfns.h: Regenerated.
+        * except.c (nothrow_libfn_p): Adjust.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-5-branch at 233720 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+ gcc/cp/Make-lang.in |  2 +-
+ gcc/cp/cfns.gperf   | 10 ++--------
+ gcc/cp/cfns.h       | 41 ++++++++++++++---------------------------
+ gcc/cp/except.c     |  3 ++-
+ 5 files changed, 31 insertions(+), 37 deletions(-)
+
+
+diff --git a/gcc/cp/Make-lang.in b/gcc/cp/Make-lang.in
+index e98beb1..b09fb02 100644
+--- a/gcc/cp/Make-lang.in
++++ b/gcc/cp/Make-lang.in
+@@ -111,7 +111,7 @@ else
+ # deleting the $(srcdir)/cp/cfns.h file.
+ $(srcdir)/cp/cfns.h:
+ endif
+-	gperf -o -C -E -k '1-6,$$' -j1 -D -N 'libc_name_p' -L ANSI-C \
++	gperf -o -C -E -k '1-6,$$' -j1 -D -N 'libc_name_p' -L C++ \
+ 		$(srcdir)/cp/cfns.gperf --output-file $(srcdir)/cp/cfns.h
+ 
+ #
+diff --git a/gcc/cp/cfns.gperf b/gcc/cp/cfns.gperf
+index 68acd3d..214ecf6 100644
+--- a/gcc/cp/cfns.gperf
++++ b/gcc/cp/cfns.gperf
+@@ -1,3 +1,5 @@
++%language=C++
++%define class-name libc_name
+ %{
+ /* Copyright (C) 2000-2015 Free Software Foundation, Inc.
+ 
+@@ -16,14 +18,6 @@ for more details.
+ You should have received a copy of the GNU General Public License
+ along with GCC; see the file COPYING3.  If not see
+ <http://www.gnu.org/licenses/>.  */
+-#ifdef __GNUC__
+-__inline
+-#endif
+-static unsigned int hash (const char *, unsigned int);
+-#ifdef __GNUC__
+-__inline
+-#endif
+-const char * libc_name_p (const char *, unsigned int);
+ %}
+ %%
+ # The standard C library functions, for feeding to gperf; the result is used
+diff --git a/gcc/cp/cfns.h b/gcc/cp/cfns.h
+index 1c6665d..596f413 100644
+--- a/gcc/cp/cfns.h
++++ b/gcc/cp/cfns.h
+@@ -1,5 +1,5 @@
+-/* ANSI-C code produced by gperf version 3.0.3 */
+-/* Command-line: gperf -o -C -E -k '1-6,$' -j1 -D -N libc_name_p -L ANSI-C cfns.gperf  */
++/* C++ code produced by gperf version 3.0.4 */
++/* Command-line: gperf -o -C -E -k '1-6,$' -j1 -D -N libc_name_p -L C++ --output-file cfns.h cfns.gperf  */
+ 
+ #if !((' ' == 32) && ('!' == 33) && ('"' == 34) && ('#' == 35) \
+       && ('%' == 37) && ('&' == 38) && ('\'' == 39) && ('(' == 40) \
+@@ -28,7 +28,7 @@
+ #error "gperf generated tables don't work with this execution character set. Please report a bug to <bug-gnu-gperf@gnu.org>."
+ #endif
+ 
+-#line 1 "cfns.gperf"
++#line 3 "cfns.gperf"
+ 
+ /* Copyright (C) 2000-2015 Free Software Foundation, Inc.
+ 
+@@ -47,25 +47,18 @@ for more details.
+ You should have received a copy of the GNU General Public License
+ along with GCC; see the file COPYING3.  If not see
+ <http://www.gnu.org/licenses/>.  */
+-#ifdef __GNUC__
+-__inline
+-#endif
+-static unsigned int hash (const char *, unsigned int);
+-#ifdef __GNUC__
+-__inline
+-#endif
+-const char * libc_name_p (const char *, unsigned int);
+ /* maximum key range = 391, duplicates = 0 */
+ 
+-#ifdef __GNUC__
+-__inline
+-#else
+-#ifdef __cplusplus
+-inline
+-#endif
+-#endif
+-static unsigned int
+-hash (register const char *str, register unsigned int len)
++class libc_name
++{
++private:
++  static inline unsigned int hash (const char *str, unsigned int len);
++public:
++  static const char *libc_name_p (const char *str, unsigned int len);
++};
++
++inline unsigned int
++libc_name::hash (register const char *str, register unsigned int len)
+ {
+   static const unsigned short asso_values[] =
+     {
+@@ -122,14 +115,8 @@ hash (register const char *str, register unsigned int len)
+   return hval + asso_values[(unsigned char)str[len - 1]];
+ }
+ 
+-#ifdef __GNUC__
+-__inline
+-#ifdef __GNUC_STDC_INLINE__
+-__attribute__ ((__gnu_inline__))
+-#endif
+-#endif
+ const char *
+-libc_name_p (register const char *str, register unsigned int len)
++libc_name::libc_name_p (register const char *str, register unsigned int len)
+ {
+   enum
+     {
+diff --git a/gcc/cp/except.c b/gcc/cp/except.c
+index 3ff1ce6..2f2e396 100644
+--- a/gcc/cp/except.c
++++ b/gcc/cp/except.c
+@@ -1040,7 +1040,8 @@ nothrow_libfn_p (const_tree fn)
+      unless the system headers are playing rename tricks, and if
+      they are, we don't want to be confused by them.  */
+   id = DECL_NAME (fn);
+-  return !!libc_name_p (IDENTIFIER_POINTER (id), IDENTIFIER_LENGTH (id));
++  return !!libc_name::libc_name_p (IDENTIFIER_POINTER (id),
++				   IDENTIFIER_LENGTH (id));
+ }
+ 
+ /* Returns nonzero if an exception of type FROM will be caught by a
+-- 
+2.8.2
+
-- 
2.8.2
