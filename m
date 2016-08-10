From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Wed, 10 Aug 2016 20:10:40 +0300
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2016.09-eng008
Message-ID: <1470849040-9200-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As described at:
4520524ba055706236db9f00dd79f1b2e2e87fde
this commit continues a series of updates of ARC tools.
This time we're updating tools to arc-2016.09-eng008.

Main updates were made for gcc. It was switched to GCC 6 and to
OSABI v4.

Besides this patch fixes buildroot ARC failures connected to
"crtbeginT.o" object file missing. This issue lead to two main errors:

1) "crtbeginT.o: No such file or directory", e. g. bootutils-1.0.0.
No comments are required here I hope.

2) Errors like "compiler cannot create executables", e.g.:
  a) host-gcc-final-arc-2016.09-eng007 static build,
  b) aespipe-2.4c.
That was caused because the test to determine if compiler is able to
create executables was failing due to missing "crtbeginT.o" file.

We still keep GDB as it is of arc-2016.03 release because there're some
issues we'd like to resolve before releasing it to wider audience.

So again note this is next engineering builds of arc-2016.09 series
and it might have all kinds of breakages, please don't use it for
production builds.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 package/binutils/Config.in.host                    |   2 +-
 .../0300-ld-makefile.patch                         |   0
 .../0301-check-ldrunpath-length.patch              |   0
 .../0500-add-sysroot-fix-from-bug-3049.patch       |   0
 .../0600-poison-system-directories.patch           |   0
 .../0700-PIE-fixes-in-for-ARC-bfd.patch            |   0
 .../0701-Fixed-init-fini-linker-options.patch      |   0
 ...x-undefined-symbols-aborting-on-PIE-cases.patch |   0
 .../0800-Fixed-issue-in-tvheadend-package.patch    |   0
 package/binutils/binutils.hash                     |   2 +-
 package/binutils/binutils.mk                       |   2 +-
 package/gcc/Config.in.host                         |   2 +-
 .../130-fix_build_with_gcc-6.patch                 | 153 ------------
 package/gcc/arc-2016.09-eng007/130-pr43538.patch   |  25 --
 .../305-libmudflap-susv3-legacy.patch              |  49 ----
 package/gcc/arc-2016.09-eng007/842-PR60155.patch   | 111 ---------
 .../850-libstdcxx-uclibc-c99.patch                 | 273 ---------------------
 .../arc-2016.09-eng007/851-PR-other-56780.patch    | 244 ------------------
 .../930-libgcc-disable-split-stack-nothreads.patch |  14 --
 .../301-missing-execinfo_h.patch                   |   6 +-
 .../gcc/arc-2016.09-eng008/860-cilk-wchar.patch    |  56 +++++
 .../940-uclinux-enable-threads.patch               |  19 ++
 package/gcc/gcc.hash                               |   2 +-
 23 files changed, 83 insertions(+), 877 deletions(-)
 rename package/binutils/{arc-2016.09-eng007 => arc-2016.09-eng008}/0300-ld-makefile.patch (100%)
 rename package/binutils/{arc-2016.09-eng007 => arc-2016.09-eng008}/0301-check-ldrunpath-length.patch (100%)
 rename package/binutils/{arc-2016.09-eng007 => arc-2016.09-eng008}/0500-add-sysroot-fix-from-bug-3049.patch (100%)
 rename package/binutils/{arc-2016.09-eng007 => arc-2016.09-eng008}/0600-poison-system-directories.patch (100%)
 rename package/binutils/{arc-2016.09-eng007 => arc-2016.09-eng008}/0700-PIE-fixes-in-for-ARC-bfd.patch (100%)
 rename package/binutils/{arc-2016.09-eng007 => arc-2016.09-eng008}/0701-Fixed-init-fini-linker-options.patch (100%)
 rename package/binutils/{arc-2016.09-eng007 => arc-2016.09-eng008}/0702-Fix-undefined-symbols-aborting-on-PIE-cases.patch (100%)
 rename package/binutils/{arc-2016.09-eng007 => arc-2016.09-eng008}/0800-Fixed-issue-in-tvheadend-package.patch (100%)
 delete mode 100644 package/gcc/arc-2016.09-eng007/130-fix_build_with_gcc-6.patch
 delete mode 100644 package/gcc/arc-2016.09-eng007/130-pr43538.patch
 delete mode 100644 package/gcc/arc-2016.09-eng007/305-libmudflap-susv3-legacy.patch
 delete mode 100644 package/gcc/arc-2016.09-eng007/842-PR60155.patch
 delete mode 100644 package/gcc/arc-2016.09-eng007/850-libstdcxx-uclibc-c99.patch
 delete mode 100644 package/gcc/arc-2016.09-eng007/851-PR-other-56780.patch
 delete mode 100644 package/gcc/arc-2016.09-eng007/930-libgcc-disable-split-stack-nothreads.patch
 rename package/gcc/{arc-2016.09-eng007 => arc-2016.09-eng008}/301-missing-execinfo_h.patch (67%)
 create mode 100644 package/gcc/arc-2016.09-eng008/860-cilk-wchar.patch
 create mode 100644 package/gcc/arc-2016.09-eng008/940-uclinux-enable-threads.patch

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 92ca998..ab83aff 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -28,7 +28,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2016.09-eng007"	if BR2_arc
+	default "arc-2016.09-eng008"	if BR2_arc
 	default "2.24"		if BR2_BINUTILS_VERSION_2_24_X
 	default "2.25.1"	if BR2_BINUTILS_VERSION_2_25_X
 	default "2.26.1"	if BR2_BINUTILS_VERSION_2_26_X
diff --git a/package/binutils/arc-2016.09-eng007/0300-ld-makefile.patch b/package/binutils/arc-2016.09-eng008/0300-ld-makefile.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng007/0300-ld-makefile.patch
rename to package/binutils/arc-2016.09-eng008/0300-ld-makefile.patch
diff --git a/package/binutils/arc-2016.09-eng007/0301-check-ldrunpath-length.patch b/package/binutils/arc-2016.09-eng008/0301-check-ldrunpath-length.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng007/0301-check-ldrunpath-length.patch
rename to package/binutils/arc-2016.09-eng008/0301-check-ldrunpath-length.patch
diff --git a/package/binutils/arc-2016.09-eng007/0500-add-sysroot-fix-from-bug-3049.patch b/package/binutils/arc-2016.09-eng008/0500-add-sysroot-fix-from-bug-3049.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng007/0500-add-sysroot-fix-from-bug-3049.patch
rename to package/binutils/arc-2016.09-eng008/0500-add-sysroot-fix-from-bug-3049.patch
diff --git a/package/binutils/arc-2016.09-eng007/0600-poison-system-directories.patch b/package/binutils/arc-2016.09-eng008/0600-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng007/0600-poison-system-directories.patch
rename to package/binutils/arc-2016.09-eng008/0600-poison-system-directories.patch
diff --git a/package/binutils/arc-2016.09-eng007/0700-PIE-fixes-in-for-ARC-bfd.patch b/package/binutils/arc-2016.09-eng008/0700-PIE-fixes-in-for-ARC-bfd.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng007/0700-PIE-fixes-in-for-ARC-bfd.patch
rename to package/binutils/arc-2016.09-eng008/0700-PIE-fixes-in-for-ARC-bfd.patch
diff --git a/package/binutils/arc-2016.09-eng007/0701-Fixed-init-fini-linker-options.patch b/package/binutils/arc-2016.09-eng008/0701-Fixed-init-fini-linker-options.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng007/0701-Fixed-init-fini-linker-options.patch
rename to package/binutils/arc-2016.09-eng008/0701-Fixed-init-fini-linker-options.patch
diff --git a/package/binutils/arc-2016.09-eng007/0702-Fix-undefined-symbols-aborting-on-PIE-cases.patch b/package/binutils/arc-2016.09-eng008/0702-Fix-undefined-symbols-aborting-on-PIE-cases.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng007/0702-Fix-undefined-symbols-aborting-on-PIE-cases.patch
rename to package/binutils/arc-2016.09-eng008/0702-Fix-undefined-symbols-aborting-on-PIE-cases.patch
diff --git a/package/binutils/arc-2016.09-eng007/0800-Fixed-issue-in-tvheadend-package.patch b/package/binutils/arc-2016.09-eng008/0800-Fixed-issue-in-tvheadend-package.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng007/0800-Fixed-issue-in-tvheadend-package.patch
rename to package/binutils/arc-2016.09-eng008/0800-Fixed-issue-in-tvheadend-package.patch
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 502e338..b8ba89d 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -4,4 +4,4 @@ sha512  0b36dda0e6d32cd25613c0e64b56b28312515c54d6a159efd3db9a86717f114ab0a0a1f6
 sha512  9d9165609fd3b0f20d616f9891fc8e2b466eb13e2bfce40125e12427f8f201d20e2b8322bb6cb2b45e8df812f0e8ac059149f8a1f69ba3ed9d86a35c6a540b67  binutils-2.26.1.tar.bz2
 
 # Locally calculated (fetched from Github)
-sha512  5ab5d45671ad57eff8f8688260c425ca5b10440b89fd54387a68e7834abee190c540bd2d19292d119f2add6fdf5d39d378315f97384ae26e74d9917b1e163291  binutils-arc-2016.09-eng007.tar.gz
+sha512  ab2914329cd2c725de567d7d2b6c3018779f0c3109dcbb26663e379d38434f48fd35cd46f680cc47165b6dc77aa35571ed2c09499161fd11bb86dcf5fa7ec068  binutils-arc-2016.09-eng008.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 68f7707..aeabf75 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,7 +9,7 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2016.09-eng007
+BINUTILS_VERSION = arc-2016.09-eng008
 else
 BINUTILS_VERSION = 2.25.1
 endif
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 2b54959..6ab7f00 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -107,7 +107,7 @@ config BR2_GCC_VERSION
 	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
 	default "5.4.0"     if BR2_GCC_VERSION_5_X
 	default "6.1.0" if BR2_GCC_VERSION_6_X
-	default "arc-2016.09-eng007" if BR2_GCC_VERSION_4_8_ARC
+	default "arc-2016.09-eng008" if BR2_GCC_VERSION_4_8_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/arc-2016.09-eng007/130-fix_build_with_gcc-6.patch b/package/gcc/arc-2016.09-eng007/130-fix_build_with_gcc-6.patch
deleted file mode 100644
index 62ac3cb..0000000
--- a/package/gcc/arc-2016.09-eng007/130-fix_build_with_gcc-6.patch
+++ /dev/null
@@ -1,153 +0,0 @@
-From 1e5f1089dec3af328fd03125d6778f666d0bd4e4 Mon Sep 17 00:00:00 2001
-From: edlinger <edlinger@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Thu, 25 Feb 2016 15:33:50 +0000
-Subject: [PATCH 1/1] 2016-02-25  Bernd Edlinger  <bernd.edlinger@hotmail.de>
-
-        Backported from mainline
-        2016-02-19  Jakub Jelinek  <jakub@redhat.com>
-                    Bernd Edlinger  <bernd.edlinger@hotmail.de>
-
-        * Make-lang.in: Invoke gperf with -L C++.
-        * cfns.gperf: Remove prototypes for hash and libc_name_p
-        inlines.
-        * cfns.h: Regenerated.
-        * except.c (nothrow_libfn_p): Adjust.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-5-branch at 233720 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- gcc/cp/Make-lang.in |    2 +-
- gcc/cp/cfns.gperf   |   10 ++--------
- gcc/cp/cfns.h       |   41 ++++++++++++++---------------------------
- gcc/cp/except.c     |    3 ++-
- 5 files changed, 31 insertions(+), 37 deletions(-)
-
-diff --git a/gcc/cp/Make-lang.in b/gcc/cp/Make-lang.in
-index e98beb1..b09fb02 100644
---- a/gcc/cp/Make-lang.in
-+++ b/gcc/cp/Make-lang.in
-@@ -111,7 +111,7 @@ else
- # deleting the $(srcdir)/cp/cfns.h file.
- $(srcdir)/cp/cfns.h:
- endif
--	gperf -o -C -E -k '1-6,$$' -j1 -D -N 'libc_name_p' -L ANSI-C \
-+	gperf -o -C -E -k '1-6,$$' -j1 -D -N 'libc_name_p' -L C++ \
- 		$(srcdir)/cp/cfns.gperf --output-file $(srcdir)/cp/cfns.h
- 
- #
-diff --git a/gcc/cp/cfns.gperf b/gcc/cp/cfns.gperf
-index 68acd3d..214ecf6 100644
---- a/gcc/cp/cfns.gperf
-+++ b/gcc/cp/cfns.gperf
-@@ -1,3 +1,5 @@
-+%language=C++
-+%define class-name libc_name
- %{
- /* Copyright (C) 2000-2015 Free Software Foundation, Inc.
- 
-@@ -16,14 +18,6 @@ for more details.
- You should have received a copy of the GNU General Public License
- along with GCC; see the file COPYING3.  If not see
- <http://www.gnu.org/licenses/>.  */
--#ifdef __GNUC__
--__inline
--#endif
--static unsigned int hash (const char *, unsigned int);
--#ifdef __GNUC__
--__inline
--#endif
--const char * libc_name_p (const char *, unsigned int);
- %}
- %%
- # The standard C library functions, for feeding to gperf; the result is used
-diff --git a/gcc/cp/cfns.h b/gcc/cp/cfns.h
-index 1c6665d..596f413 100644
---- a/gcc/cp/cfns.h
-+++ b/gcc/cp/cfns.h
-@@ -1,5 +1,5 @@
--/* ANSI-C code produced by gperf version 3.0.3 */
--/* Command-line: gperf -o -C -E -k '1-6,$' -j1 -D -N libc_name_p -L ANSI-C cfns.gperf  */
-+/* C++ code produced by gperf version 3.0.4 */
-+/* Command-line: gperf -o -C -E -k '1-6,$' -j1 -D -N libc_name_p -L C++ --output-file cfns.h cfns.gperf  */
- 
- #if !((' ' == 32) && ('!' == 33) && ('"' == 34) && ('#' == 35) \
-       && ('%' == 37) && ('&' == 38) && ('\'' == 39) && ('(' == 40) \
-@@ -28,7 +28,7 @@
- #error "gperf generated tables don't work with this execution character set. Please report a bug to <bug-gnu-gperf@gnu.org>."
- #endif
- 
--#line 1 "cfns.gperf"
-+#line 3 "cfns.gperf"
- 
- /* Copyright (C) 2000-2015 Free Software Foundation, Inc.
- 
-@@ -47,25 +47,18 @@ for more details.
- You should have received a copy of the GNU General Public License
- along with GCC; see the file COPYING3.  If not see
- <http://www.gnu.org/licenses/>.  */
--#ifdef __GNUC__
--__inline
--#endif
--static unsigned int hash (const char *, unsigned int);
--#ifdef __GNUC__
--__inline
--#endif
--const char * libc_name_p (const char *, unsigned int);
- /* maximum key range = 391, duplicates = 0 */
- 
--#ifdef __GNUC__
--__inline
--#else
--#ifdef __cplusplus
--inline
--#endif
--#endif
--static unsigned int
--hash (register const char *str, register unsigned int len)
-+class libc_name
-+{
-+private:
-+  static inline unsigned int hash (const char *str, unsigned int len);
-+public:
-+  static const char *libc_name_p (const char *str, unsigned int len);
-+};
-+
-+inline unsigned int
-+libc_name::hash (register const char *str, register unsigned int len)
- {
-   static const unsigned short asso_values[] =
-     {
-@@ -122,14 +115,8 @@ hash (register const char *str, register unsigned int len)
-   return hval + asso_values[(unsigned char)str[len - 1]];
- }
- 
--#ifdef __GNUC__
--__inline
--#ifdef __GNUC_STDC_INLINE__
--__attribute__ ((__gnu_inline__))
--#endif
--#endif
- const char *
--libc_name_p (register const char *str, register unsigned int len)
-+libc_name::libc_name_p (register const char *str, register unsigned int len)
- {
-   enum
-     {
-diff --git a/gcc/cp/except.c b/gcc/cp/except.c
-index 3ff1ce6..2f2e396 100644
---- a/gcc/cp/except.c
-+++ b/gcc/cp/except.c
-@@ -1040,7 +1040,8 @@ nothrow_libfn_p (const_tree fn)
-      unless the system headers are playing rename tricks, and if
-      they are, we don't want to be confused by them.  */
-   id = DECL_NAME (fn);
--  return !!libc_name_p (IDENTIFIER_POINTER (id), IDENTIFIER_LENGTH (id));
-+  return !!libc_name::libc_name_p (IDENTIFIER_POINTER (id),
-+				   IDENTIFIER_LENGTH (id));
- }
- 
- /* Returns nonzero if an exception of type FROM will be caught by a
--- 
-1.7.1
diff --git a/package/gcc/arc-2016.09-eng007/130-pr43538.patch b/package/gcc/arc-2016.09-eng007/130-pr43538.patch
deleted file mode 100644
index 19e57bb..0000000
--- a/package/gcc/arc-2016.09-eng007/130-pr43538.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From c037df1be41f8daf4d581d7ffa4ec8cfa640bccf Mon Sep 17 00:00:00 2001
-From: glisse <glisse@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Fri, 25 Apr 2014 08:03:08 +0000
-Subject: [PATCH] 2014-04-25  Marc Glisse  <marc.glisse@inria.fr>
-
-	PR target/43538
-	* mt-gnu: Don't reset CXXFLAGS_FOR_TARGET.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 209784 138bc75d-0d04-0410-961f-82ee72b054a4
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
- config/mt-gnu    | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/config/mt-gnu b/config/mt-gnu
-index 15bf417..5c696f5 100644
---- a/config/mt-gnu
-+++ b/config/mt-gnu
-@@ -1 +1 @@
--CXXFLAGS_FOR_TARGET = $(CXXFLAGS) -D_GNU_SOURCE
-+CXXFLAGS_FOR_TARGET += -D_GNU_SOURCE
--- 
-2.1.4
-
diff --git a/package/gcc/arc-2016.09-eng007/305-libmudflap-susv3-legacy.patch b/package/gcc/arc-2016.09-eng007/305-libmudflap-susv3-legacy.patch
deleted file mode 100644
index 35d5f50..0000000
--- a/package/gcc/arc-2016.09-eng007/305-libmudflap-susv3-legacy.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Index: gcc-4.8.0/libmudflap/mf-hooks2.c
-===================================================================
---- gcc-4.8.0.orig/libmudflap/mf-hooks2.c	2013-02-03 18:48:05.000000000 +0100
-+++ gcc-4.8.0/libmudflap/mf-hooks2.c	2013-03-23 17:39:43.000000000 +0100
-@@ -424,7 +424,7 @@
- {
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(s, n, __MF_CHECK_WRITE, "bzero region");
--  bzero (s, n);
-+  memset (s, 0, n);
- }
- 
- 
-@@ -434,7 +434,7 @@
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(src, n, __MF_CHECK_READ, "bcopy src");
-   MF_VALIDATE_EXTENT(dest, n, __MF_CHECK_WRITE, "bcopy dest");
--  bcopy (src, dest, n);
-+  memmove (dest, src, n);
- }
- 
- 
-@@ -444,7 +444,7 @@
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(s1, n, __MF_CHECK_READ, "bcmp 1st arg");
-   MF_VALIDATE_EXTENT(s2, n, __MF_CHECK_READ, "bcmp 2nd arg");
--  return bcmp (s1, s2, n);
-+  return n == 0 ? 0 : memcmp (s1, s2, n);
- }
- 
- 
-@@ -453,7 +453,7 @@
-   size_t n = strlen (s);
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "index region");
--  return index (s, c);
-+  return strchr (s, c);
- }
- 
- 
-@@ -462,7 +462,7 @@
-   size_t n = strlen (s);
-   TRACE ("%s\n", __PRETTY_FUNCTION__);
-   MF_VALIDATE_EXTENT(s, CLAMPADD(n, 1), __MF_CHECK_READ, "rindex region");
--  return rindex (s, c);
-+  return strrchr (s, c);
- }
- 
- /* XXX:  stpcpy, memccpy */
diff --git a/package/gcc/arc-2016.09-eng007/842-PR60155.patch b/package/gcc/arc-2016.09-eng007/842-PR60155.patch
deleted file mode 100644
index 7bc2122..0000000
--- a/package/gcc/arc-2016.09-eng007/842-PR60155.patch
+++ /dev/null
@@ -1,111 +0,0 @@
-From gcc bugzilla https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60155
-Upstream status: in trunk.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- trunk/gcc/gcse.c	2014/02/12 14:50:06	207726
-+++ trunk/gcc/gcse.c	2014/04/04 22:25:51	209134
-@@ -2502,6 +2502,65 @@
-       }
- }
- 
-+struct set_data
-+{
-+  rtx insn;
-+  const_rtx set;
-+  int nsets;
-+};
-+
-+/* Increment number of sets and record set in DATA.  */
-+
-+static void
-+record_set_data (rtx dest, const_rtx set, void *data)
-+{
-+  struct set_data *s = (struct set_data *)data;
-+
-+  if (GET_CODE (set) == SET)
-+    {
-+      /* We allow insns having multiple sets, where all but one are
-+	 dead as single set insns.  In the common case only a single
-+	 set is present, so we want to avoid checking for REG_UNUSED
-+	 notes unless necessary.  */
-+      if (s->nsets == 1
-+	  && find_reg_note (s->insn, REG_UNUSED, SET_DEST (s->set))
-+	  && !side_effects_p (s->set))
-+	s->nsets = 0;
-+
-+      if (!s->nsets)
-+	{
-+	  /* Record this set.  */
-+	  s->nsets += 1;
-+	  s->set = set;
-+	}
-+      else if (!find_reg_note (s->insn, REG_UNUSED, dest)
-+	       || side_effects_p (set))
-+	s->nsets += 1;
-+    }
-+}
-+
-+static const_rtx
-+single_set_gcse (rtx insn)
-+{
-+  struct set_data s;
-+  rtx pattern;
-+  
-+  gcc_assert (INSN_P (insn));
-+
-+  /* Optimize common case.  */
-+  pattern = PATTERN (insn);
-+  if (GET_CODE (pattern) == SET)
-+    return pattern;
-+
-+  s.insn = insn;
-+  s.nsets = 0;
-+  note_stores (pattern, record_set_data, &s);
-+
-+  /* Considered invariant insns have exactly one set.  */
-+  gcc_assert (s.nsets == 1);
-+  return s.set;
-+}
-+
- /* Emit move from SRC to DEST noting the equivalence with expression computed
-    in INSN.  */
- 
-@@ -2509,7 +2568,8 @@
- gcse_emit_move_after (rtx dest, rtx src, rtx insn)
- {
-   rtx new_rtx;
--  rtx set = single_set (insn), set2;
-+  const_rtx set = single_set_gcse (insn);
-+  rtx set2;
-   rtx note;
-   rtx eqv = NULL_RTX;
- 
-@@ -3369,13 +3429,12 @@
- 	      FOR_EACH_VEC_ELT (occrs_to_hoist, j, occr)
- 		{
- 		  rtx insn;
--		  rtx set;
-+		  const_rtx set;
- 
- 		  gcc_assert (!occr->deleted_p);
- 
- 		  insn = occr->insn;
--		  set = single_set (insn);
--		  gcc_assert (set);
-+		  set = single_set_gcse (insn);
- 
- 		  /* Create a pseudo-reg to store the result of reaching
- 		     expressions into.  Get the mode for the new pseudo
-@@ -3456,10 +3515,8 @@
- {
-   rtx reg;
-   enum reg_class pressure_class;
--  rtx set = single_set (insn);
-+  const_rtx set = single_set_gcse (insn);
- 
--  /* Considered invariant insns have only one set.  */
--  gcc_assert (set != NULL_RTX);
-   reg = SET_DEST (set);
-   if (GET_CODE (reg) == SUBREG)
-     reg = SUBREG_REG (reg);
diff --git a/package/gcc/arc-2016.09-eng007/850-libstdcxx-uclibc-c99.patch b/package/gcc/arc-2016.09-eng007/850-libstdcxx-uclibc-c99.patch
deleted file mode 100644
index 792976f..0000000
--- a/package/gcc/arc-2016.09-eng007/850-libstdcxx-uclibc-c99.patch
+++ /dev/null
@@ -1,273 +0,0 @@
-Allow C99-depending features of libstdc++ with uClibc
-
-The libstdc++ code is fairly restrictive on how it checks for C99
-compatibility: it requires *complete* C99 support to enable certain
-features. For example, uClibc provides a good number of C99 features,
-but not C99 complex number support. For this reason, libstdc++
-completely disables many the standard C++ methods that can in fact
-work because uClibc provides the necessary functions.
-
-This patch is similar and highly inspired from
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58393, but implemented in
-a way that doesn't involve changing the configure.ac script, as
-autoreconfiguring gcc is complicated. It simply relies on the fact
-that uClibc defines the __UCLIBC__ definition.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/libstdc++-v3/config/locale/generic/c_locale.h
-===================================================================
---- a/libstdc++-v3/config/locale/generic/c_locale.h
-+++ b/libstdc++-v3/config/locale/generic/c_locale.h
-@@ -70,7 +70,7 @@
-     __builtin_va_list __args;
-     __builtin_va_start(__args, __fmt);
- 
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-     const int __ret = __builtin_vsnprintf(__out, __size, __fmt, __args);
- #else
-     const int __ret = __builtin_vsprintf(__out, __fmt, __args);
-Index: b/libstdc++-v3/config/locale/gnu/c_locale.h
-===================================================================
---- a/libstdc++-v3/config/locale/gnu/c_locale.h
-+++ b/libstdc++-v3/config/locale/gnu/c_locale.h
-@@ -88,7 +88,7 @@
-     __builtin_va_list __args;
-     __builtin_va_start(__args, __fmt);
- 
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-     const int __ret = __builtin_vsnprintf(__out, __size, __fmt, __args);
- #else
-     const int __ret = __builtin_vsprintf(__out, __fmt, __args);
-Index: b/libstdc++-v3/include/bits/basic_string.h
-===================================================================
---- a/libstdc++-v3/include/bits/basic_string.h
-+++ b/libstdc++-v3/include/bits/basic_string.h
-@@ -2809,7 +2809,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if ((__cplusplus >= 201103L) && defined(_GLIBCXX_USE_C99) \
-+#if ((__cplusplus >= 201103L) && (defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)) \
-      && !defined(_GLIBCXX_HAVE_BROKEN_VSWPRINTF))
- 
- #include <ext/string_conversions.h>
-Index: b/libstdc++-v3/include/bits/locale_facets.tcc
-===================================================================
---- a/libstdc++-v3/include/bits/locale_facets.tcc
-+++ b/libstdc++-v3/include/bits/locale_facets.tcc
-@@ -987,7 +987,7 @@
- 	char __fbuf[16];
- 	__num_base::_S_format_float(__io, __fbuf, __mod);
- 
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 	// First try a buffer perhaps big enough (most probably sufficient
- 	// for non-ios_base::fixed outputs)
- 	int __cs_size = __max_digits * 3;
-Index: b/libstdc++-v3/include/bits/locale_facets_nonio.tcc
-===================================================================
---- a/libstdc++-v3/include/bits/locale_facets_nonio.tcc
-+++ b/libstdc++-v3/include/bits/locale_facets_nonio.tcc
-@@ -572,7 +572,7 @@
-     {
-       const locale __loc = __io.getloc();
-       const ctype<_CharT>& __ctype = use_facet<ctype<_CharT> >(__loc);
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-       // First try a buffer perhaps big enough.
-       int __cs_size = 64;
-       char* __cs = static_cast<char*>(__builtin_alloca(__cs_size));
-Index: b/libstdc++-v3/include/c_compatibility/math.h
-===================================================================
---- a/libstdc++-v3/include/c_compatibility/math.h
-+++ b/libstdc++-v3/include/c_compatibility/math.h
-@@ -56,7 +56,7 @@
- using std::floor;
- using std::fmod;
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- using std::fpclassify;
- using std::isfinite;
- using std::isinf;
-Index: b/libstdc++-v3/include/c_compatibility/wchar.h
-===================================================================
---- a/libstdc++-v3/include/c_compatibility/wchar.h
-+++ b/libstdc++-v3/include/c_compatibility/wchar.h
-@@ -103,7 +103,7 @@
- using std::wmemset;
- using std::wcsftime;
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- using std::wcstold;
- using std::wcstoll;
- using std::wcstoull;
-Index: b/libstdc++-v3/include/c_global/cstdlib
-===================================================================
---- a/libstdc++-v3/include/c_global/cstdlib
-+++ b/libstdc++-v3/include/c_global/cstdlib
-@@ -182,7 +182,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef _Exit
- #undef llabs
-Index: b/libstdc++-v3/include/c_global/cwchar
-===================================================================
---- a/libstdc++-v3/include/c_global/cwchar
-+++ b/libstdc++-v3/include/c_global/cwchar
-@@ -232,7 +232,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef wcstold
- #undef wcstoll
-@@ -289,7 +289,7 @@
-   using std::vwscanf;
- #endif
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-   using std::wcstold;
-   using std::wcstoll;
-   using std::wcstoull;
-Index: b/libstdc++-v3/include/c_std/cstdio
-===================================================================
---- a/libstdc++-v3/include/c_std/cstdio
-+++ b/libstdc++-v3/include/c_std/cstdio
-@@ -139,7 +139,7 @@
-   using ::vsprintf;
- } // namespace std
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef snprintf
- #undef vfscanf
-Index: b/libstdc++-v3/include/c_std/cstdlib
-===================================================================
---- a/libstdc++-v3/include/c_std/cstdlib
-+++ b/libstdc++-v3/include/c_std/cstdlib
-@@ -180,7 +180,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef _Exit
- #undef llabs
-Index: b/libstdc++-v3/include/c_std/cwchar
-===================================================================
---- a/libstdc++-v3/include/c_std/cwchar
-+++ b/libstdc++-v3/include/c_std/cwchar
-@@ -228,7 +228,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef wcstold
- #undef wcstoll
-Index: b/libstdc++-v3/include/ext/vstring.h
-===================================================================
---- a/libstdc++-v3/include/ext/vstring.h
-+++ b/libstdc++-v3/include/ext/vstring.h
-@@ -2571,7 +2571,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if ((__cplusplus >= 201103L) && defined(_GLIBCXX_USE_C99))
-+#if ((__cplusplus >= 201103L) && (defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)))
- 
- #include <ext/string_conversions.h>
- 
-Index: b/libstdc++-v3/include/tr1/cstdio
-===================================================================
---- a/libstdc++-v3/include/tr1/cstdio
-+++ b/libstdc++-v3/include/tr1/cstdio
-@@ -33,7 +33,7 @@
- 
- #include <cstdio>
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- namespace std _GLIBCXX_VISIBILITY(default)
- {
-Index: b/libstdc++-v3/include/tr1/cstdlib
-===================================================================
---- a/libstdc++-v3/include/tr1/cstdlib
-+++ b/libstdc++-v3/include/tr1/cstdlib
-@@ -35,7 +35,7 @@
- 
- #if _GLIBCXX_HOSTED
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- namespace std _GLIBCXX_VISIBILITY(default)
- {
-Index: b/libstdc++-v3/include/tr1/cwchar
-===================================================================
---- a/libstdc++-v3/include/tr1/cwchar
-+++ b/libstdc++-v3/include/tr1/cwchar
-@@ -52,7 +52,7 @@
-   using std::vwscanf;
- #endif
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-   using std::wcstold;
-   using std::wcstoll;
-   using std::wcstoull;
-Index: b/libstdc++-v3/include/tr1/stdlib.h
-===================================================================
---- a/libstdc++-v3/include/tr1/stdlib.h
-+++ b/libstdc++-v3/include/tr1/stdlib.h
-@@ -33,7 +33,7 @@
- 
- #if _GLIBCXX_HOSTED
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- using std::tr1::atoll;
- using std::tr1::strtoll;
-Index: b/libstdc++-v3/src/c++11/debug.cc
-===================================================================
---- a/libstdc++-v3/src/c++11/debug.cc
-+++ b/libstdc++-v3/src/c++11/debug.cc
-@@ -787,7 +787,7 @@
- 				     int __n __attribute__ ((__unused__)), 
- 				     const char* __fmt, _Tp __s) const throw ()
-     {
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-       std::snprintf(__buf, __n, __fmt, __s);
- #else
-       std::sprintf(__buf, __fmt, __s);
-Index: b/libstdc++-v3/include/c_global/cstdio
-===================================================================
---- a/libstdc++-v3/include/c_global/cstdio
-+++ b/libstdc++-v3/include/c_global/cstdio
-@@ -139,7 +139,7 @@
-   using ::vsprintf;
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef snprintf
- #undef vfscanf
diff --git a/package/gcc/arc-2016.09-eng007/851-PR-other-56780.patch b/package/gcc/arc-2016.09-eng007/851-PR-other-56780.patch
deleted file mode 100644
index feb4339..0000000
--- a/package/gcc/arc-2016.09-eng007/851-PR-other-56780.patch
+++ /dev/null
@@ -1,244 +0,0 @@
-From afe990251bd9b3a063f03da31a3b8d139d033bc3 Mon Sep 17 00:00:00 2001
-From: ian <ian@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Sat, 1 Jun 2013 00:20:49 +0000
-Subject: [PATCH] PR other/56780
-
-* libiberty/configure.ac: Move test for --enable-install-libiberty
-outside of the 'with_target_subdir' test so that it actually gets
-run.  Add output messages to show the test result.
-* libiberty/configure: Regenerate.
-* libiberty/Makefile.in (install_to_libdir): Place the
-installation of the libiberty library in the same guard as that
-used for the headers to prevent it being installed unless
-requested via --enable-install-libiberty.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 199570 138bc75d-0d04-0410-961f-82ee72b054a4
-
-libiberty: fix --enable-install-libiberty flag [PR 56780]
-
-Commit 199570 fixed the --disable-install-libiberty behavior, but it also
-added a bug where the enable path never works because the initial clear
-of target_header_dir wasn't deleted.  So we end up initializing properly
-at the top only to reset it at the end all the time.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 206367 138bc75d-0d04-0410-961f-82ee72b054a4
-
-[Romain
-  squash the two upstream commits
-  Remove the ChangeLog]
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- libiberty/Makefile.in  | 24 ++++++++++-----------
- libiberty/configure    | 57 +++++++++++++++++++++++++++-----------------------
- libiberty/configure.ac | 47 ++++++++++++++++++++++-------------------
- 3 files changed, 68 insertions(+), 60 deletions(-)
-
-diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in
-index f6a3ebd..75ff82d 100644
---- a/libiberty/Makefile.in
-+++ b/libiberty/Makefile.in
-@@ -355,19 +355,19 @@ install-strip: install
- # since it will be passed the multilib flags.
- MULTIOSDIR = `$(CC) $(CFLAGS) -print-multi-os-directory`
- install_to_libdir: all
--	${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR)
--	$(INSTALL_DATA) $(TARGETLIB) $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n
--	( cd $(DESTDIR)$(libdir)/$(MULTIOSDIR) ; chmod 644 $(TARGETLIB)n ;$(RANLIB) $(TARGETLIB)n )
--	mv -f $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)
- 	if test -n "${target_header_dir}"; then \
--	  case "${target_header_dir}" in \
--	    /*)    thd=${target_header_dir};; \
--	    *)     thd=${includedir}/${target_header_dir};; \
--	  esac; \
--	  ${mkinstalldirs} $(DESTDIR)$${thd}; \
--	  for h in ${INSTALLED_HEADERS}; do \
--	    ${INSTALL_DATA} $$h $(DESTDIR)$${thd}; \
--	  done; \
-+		${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR); \
-+		$(INSTALL_DATA) $(TARGETLIB) $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n; \
-+		( cd $(DESTDIR)$(libdir)/$(MULTIOSDIR) ; chmod 644 $(TARGETLIB)n ;$(RANLIB) $(TARGETLIB)n ); \
-+		mv -f $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB)n $(DESTDIR)$(libdir)/$(MULTIOSDIR)/$(TARGETLIB); \
-+		case "${target_header_dir}" in \
-+		  /*)    thd=${target_header_dir};; \
-+		  *)     thd=${includedir}/${target_header_dir};; \
-+		esac; \
-+		${mkinstalldirs} $(DESTDIR)$${thd}; \
-+		for h in ${INSTALLED_HEADERS}; do \
-+		  ${INSTALL_DATA} $$h $(DESTDIR)$${thd}; \
-+		done; \
- 	fi
- 	@$(MULTIDO) $(FLAGS_TO_PASS) multi-do DO=install
- 
-diff --git a/libiberty/configure b/libiberty/configure
-index 5367027..4feb95a 100755
---- a/libiberty/configure
-+++ b/libiberty/configure
-@@ -675,8 +675,8 @@ with_cross_host
- with_newlib
- enable_maintainer_mode
- enable_multilib
--enable_largefile
- enable_install_libiberty
-+enable_largefile
- '
-       ac_precious_vars='build_alias
- host_alias
-@@ -1303,8 +1303,8 @@ Optional Features:
-                           enable make rules and dependencies not useful
-                           (and sometimes confusing) to the casual installer
-   --enable-multilib       build many library versions (default)
-+  --enable-install-libiberty       Install headers and library for end users
-   --disable-largefile     omit support for large files
--  --enable-install-libiberty       Install headers for end users
- 
- Optional Packages:
-   --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
-@@ -2784,6 +2784,35 @@ if test $cross_compiling = no && test $multilib = yes \
-    cross_compiling=maybe
- fi
- 
-+# We may wish to install the target headers somewhere.
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether to install libiberty headers and static library" >&5
-+$as_echo_n "checking whether to install libiberty headers and static library... " >&6; }
-+
-+# Check whether --enable-install-libiberty was given.
-+if test "${enable_install_libiberty+set}" = set; then :
-+  enableval=$enable_install_libiberty; enable_install_libiberty=$enableval
-+else
-+  enable_install_libiberty=no
-+fi
-+
-+# Option parsed, now set things appropriately.
-+case x"$enable_install_libiberty" in
-+  xyes|x)
-+    target_header_dir=libiberty
-+    ;;
-+  xno)
-+    target_header_dir=
-+    ;;
-+  *)
-+    # This could be sanity-checked in various ways...
-+    target_header_dir="${enable_install_libiberty}"
-+    ;;
-+esac
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $enable_install_libiberty" >&5
-+$as_echo "$enable_install_libiberty" >&6; }
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: target_header_dir = $target_header_dir" >&5
-+$as_echo "$as_me: target_header_dir = $target_header_dir" >&6;}
-+
- 
- ac_ext=c
- ac_cpp='$CPP $CPPFLAGS'
-@@ -5476,7 +5505,6 @@ fi
- 
- setobjs=
- CHECK=
--target_header_dir=
- if test -n "${with_target_subdir}"; then
- 
-   # We are being configured as a target library.  AC_REPLACE_FUNCS
-@@ -5759,29 +5787,6 @@ _ACEOF
- 
-   esac
- 
--  # We may wish to install the target headers somewhere.
--  # Check whether --enable-install-libiberty was given.
--if test "${enable_install_libiberty+set}" = set; then :
--  enableval=$enable_install_libiberty; enable_install_libiberty=$enableval
--else
--  enable_install_libiberty=no
--fi
--
--  # Option parsed, now set things appropriately.
--  case x"$enable_install_libiberty" in
--    xyes|x)
--      target_header_dir=libiberty
--      ;;
--    xno)
--      target_header_dir=
--      ;;
--    *)
--      # This could be sanity-checked in various ways...
--      target_header_dir="${enable_install_libiberty}"
--      ;;
--  esac
--
--
- else
- 
-    # Not a target library, so we set things up to run the test suite.
-diff --git a/libiberty/configure.ac b/libiberty/configure.ac
-index c763894..f17e6b6 100644
---- a/libiberty/configure.ac
-+++ b/libiberty/configure.ac
-@@ -128,6 +128,31 @@ if test $cross_compiling = no && test $multilib = yes \
-    cross_compiling=maybe
- fi
- 
-+# We may wish to install the target headers somewhere.
-+AC_MSG_CHECKING([whether to install libiberty headers and static library])
-+dnl install-libiberty is disabled by default
-+
-+AC_ARG_ENABLE(install-libiberty,
-+[  --enable-install-libiberty       Install headers and library for end users],
-+enable_install_libiberty=$enableval,
-+enable_install_libiberty=no)dnl
-+
-+# Option parsed, now set things appropriately.
-+case x"$enable_install_libiberty" in
-+  xyes|x)
-+    target_header_dir=libiberty
-+    ;;
-+  xno)   
-+    target_header_dir=
-+    ;;
-+  *) 
-+    # This could be sanity-checked in various ways...
-+    target_header_dir="${enable_install_libiberty}"
-+    ;;
-+esac
-+AC_MSG_RESULT($enable_install_libiberty)
-+AC_MSG_NOTICE([target_header_dir = $target_header_dir])
-+
- GCC_NO_EXECUTABLES
- AC_PROG_CC
- AC_SYS_LARGEFILE
-@@ -380,7 +405,6 @@ fi
- 
- setobjs=
- CHECK=
--target_header_dir=
- if test -n "${with_target_subdir}"; then
- 
-   # We are being configured as a target library.  AC_REPLACE_FUNCS
-@@ -492,27 +516,6 @@ if test -n "${with_target_subdir}"; then
- 
-   esac
- 
--  # We may wish to install the target headers somewhere.
--  AC_ARG_ENABLE(install-libiberty,
--  [  --enable-install-libiberty       Install headers for end users],
--  enable_install_libiberty=$enableval,
--  enable_install_libiberty=no)dnl
--  
--  # Option parsed, now set things appropriately.
--  case x"$enable_install_libiberty" in
--    xyes|x)
--      target_header_dir=libiberty
--      ;;
--    xno)   
--      target_header_dir=
--      ;;
--    *) 
--      # This could be sanity-checked in various ways...
--      target_header_dir="${enable_install_libiberty}"
--      ;;
--  esac
--
--
- else
- 
-    # Not a target library, so we set things up to run the test suite.
--- 
-1.9.3
-
diff --git a/package/gcc/arc-2016.09-eng007/930-libgcc-disable-split-stack-nothreads.patch b/package/gcc/arc-2016.09-eng007/930-libgcc-disable-split-stack-nothreads.patch
deleted file mode 100644
index 7799c12..0000000
--- a/package/gcc/arc-2016.09-eng007/930-libgcc-disable-split-stack-nothreads.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-disable split-stack for non-thread builds
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur gcc-4.8.5.orig/libgcc/config/t-stack gcc-4.8.5/libgcc/config/t-stack
---- gcc-4.8.5.orig/libgcc/config/t-stack	2010-10-01 21:31:49.000000000 +0200
-+++ gcc-4.8.5/libgcc/config/t-stack	2016-03-07 05:28:12.000000000 +0100
-@@ -1,4 +1,6 @@
- # Makefile fragment to provide generic support for -fsplit-stack.
- # This should be used in config.host for any host which supports
- # -fsplit-stack.
-+ifeq ($(enable_threads),yes)
- LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
-+endif
diff --git a/package/gcc/arc-2016.09-eng007/301-missing-execinfo_h.patch b/package/gcc/arc-2016.09-eng008/301-missing-execinfo_h.patch
similarity index 67%
rename from package/gcc/arc-2016.09-eng007/301-missing-execinfo_h.patch
rename to package/gcc/arc-2016.09-eng008/301-missing-execinfo_h.patch
index 00efda2..2d0e7ba 100644
--- a/package/gcc/arc-2016.09-eng007/301-missing-execinfo_h.patch
+++ b/package/gcc/arc-2016.09-eng008/301-missing-execinfo_h.patch
@@ -1,7 +1,7 @@
-Index: gcc-4.8.0/boehm-gc/include/gc.h
+Index: b/boehm-gc/include/gc.h
 ===================================================================
---- gcc-4.8.0.orig/boehm-gc/include/gc.h	2007-04-23 23:10:09.000000000 +0200
-+++ gcc-4.8.0/boehm-gc/include/gc.h	2013-03-23 17:39:20.000000000 +0100
+--- a/boehm-gc/include/gc.h
++++ b/boehm-gc/include/gc.h
 @@ -503,7 +503,7 @@
  #if defined(__linux__) || defined(__GLIBC__)
  # include <features.h>
diff --git a/package/gcc/arc-2016.09-eng008/860-cilk-wchar.patch b/package/gcc/arc-2016.09-eng008/860-cilk-wchar.patch
new file mode 100644
index 0000000..1d9916f
--- /dev/null
+++ b/package/gcc/arc-2016.09-eng008/860-cilk-wchar.patch
@@ -0,0 +1,56 @@
+[PATCH] cilk: fix build without wchar
+
+When building against uClibc with wchar support disabled, WCHAR_MIN and
+WCHAR_MAX are not defined leading to compilation errors.
+
+Fix it by only including the wchar code if available.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ libcilkrts/include/cilk/reducer_min_max.h |    8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+Index: b/libcilkrts/include/cilk/reducer_min_max.h
+===================================================================
+--- a/libcilkrts/include/cilk/reducer_min_max.h
++++ b/libcilkrts/include/cilk/reducer_min_max.h
+@@ -3154,7 +3154,9 @@
+ CILK_C_REDUCER_MAX_INSTANCE(char,               char,       CHAR_MIN)
+ CILK_C_REDUCER_MAX_INSTANCE(unsigned char,      uchar,      0)
+ CILK_C_REDUCER_MAX_INSTANCE(signed char,        schar,      SCHAR_MIN)
++#ifdef WCHAR_MIN
+ CILK_C_REDUCER_MAX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MIN)
++#endif
+ CILK_C_REDUCER_MAX_INSTANCE(short,              short,      SHRT_MIN)
+ CILK_C_REDUCER_MAX_INSTANCE(unsigned short,     ushort,     0)
+ CILK_C_REDUCER_MAX_INSTANCE(int,                int,        INT_MIN)
+@@ -3306,7 +3308,9 @@
+ CILK_C_REDUCER_MAX_INDEX_INSTANCE(char,               char,       CHAR_MIN)
+ CILK_C_REDUCER_MAX_INDEX_INSTANCE(unsigned char,      uchar,      0)
+ CILK_C_REDUCER_MAX_INDEX_INSTANCE(signed char,        schar,      SCHAR_MIN)
++#ifdef WCHAR_MIN
+ CILK_C_REDUCER_MAX_INDEX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MIN)
++#endif
+ CILK_C_REDUCER_MAX_INDEX_INSTANCE(short,              short,      SHRT_MIN)
+ CILK_C_REDUCER_MAX_INDEX_INSTANCE(unsigned short,     ushort,     0)
+ CILK_C_REDUCER_MAX_INDEX_INSTANCE(int,                int,        INT_MIN)
+@@ -3432,7 +3436,9 @@
+ CILK_C_REDUCER_MIN_INSTANCE(char,               char,       CHAR_MAX)
+ CILK_C_REDUCER_MIN_INSTANCE(unsigned char,      uchar,      CHAR_MAX)
+ CILK_C_REDUCER_MIN_INSTANCE(signed char,        schar,      SCHAR_MAX)
++#ifdef WCHAR_MAX
+ CILK_C_REDUCER_MIN_INSTANCE(wchar_t,            wchar_t,    WCHAR_MAX)
++#endif
+ CILK_C_REDUCER_MIN_INSTANCE(short,              short,      SHRT_MAX)
+ CILK_C_REDUCER_MIN_INSTANCE(unsigned short,     ushort,     USHRT_MAX)
+ CILK_C_REDUCER_MIN_INSTANCE(int,                int,        INT_MAX)
+@@ -3584,7 +3590,9 @@
+ CILK_C_REDUCER_MIN_INDEX_INSTANCE(char,               char,       CHAR_MAX)
+ CILK_C_REDUCER_MIN_INDEX_INSTANCE(unsigned char,      uchar,      CHAR_MAX)
+ CILK_C_REDUCER_MIN_INDEX_INSTANCE(signed char,        schar,      SCHAR_MAX)
++#ifdef WCHAR_MAX
+ CILK_C_REDUCER_MIN_INDEX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MAX)
++#endif
+ CILK_C_REDUCER_MIN_INDEX_INSTANCE(short,              short,      SHRT_MAX)
+ CILK_C_REDUCER_MIN_INDEX_INSTANCE(unsigned short,     ushort,     USHRT_MAX)
+ CILK_C_REDUCER_MIN_INDEX_INSTANCE(int,                int,        INT_MAX)
diff --git a/package/gcc/arc-2016.09-eng008/940-uclinux-enable-threads.patch b/package/gcc/arc-2016.09-eng008/940-uclinux-enable-threads.patch
new file mode 100644
index 0000000..5532656
--- /dev/null
+++ b/package/gcc/arc-2016.09-eng008/940-uclinux-enable-threads.patch
@@ -0,0 +1,19 @@
+Enable POSIX threads for uClinux targets
+Reported upstream:
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71721
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-6.1.0.orig/gcc/config.gcc gcc-6.1.0/gcc/config.gcc
+--- gcc-6.1.0.orig/gcc/config.gcc	2016-04-11 12:14:59.000000000 +0200
++++ gcc-6.1.0/gcc/config.gcc	2016-07-02 20:04:25.732169982 +0200
+@@ -833,6 +833,9 @@
+ *-*-uclinux*)
+   extra_options="$extra_options gnu-user.opt"
+   use_gcc_stdint=wrap
++  case ${enable_threads} in
++    "" | yes | posix) thread_file='posix' ;;
++  esac
+   tm_defines="$tm_defines DEFAULT_LIBC=LIBC_UCLIBC SINGLE_LIBC"
+   ;;
+ *-*-rdos*)
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index ecde393..e463e04 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -12,4 +12,4 @@ sha512  2941cc950c8f2409a314df497631f9b0266211aa74746c1839c46e04f1c7c299afe2528d
 sha512  eeed3e2018b8c012aabce419e8d718fde701e5c3c179b4486c61ba46e5736eecc8fccdd18b01fcd973a42c6ad3116dbbe2ee247fe3757d622d373f93ebaf8d2e  gcc-6.1.0.tar.bz2
 
 # Locally calculated (fetched from Github)
-sha512  f798e450ae3095538c5b12c785eab00f8f4084d3ff3e5e2dfd05ed20e0a20d4e754d87359482962d85c9082cb9fcbbf100d9eab6dfd2dbdccbecdcbf680ff23a  gcc-arc-2016.09-eng007.tar.gz
+sha512  481302b50c8d6a3db3ea0a3c3713666d3aea990461cf0e1e0a670a2db90b8f2024e02a2fab6f2e7ccba14a92ca82218db0b585ace1aa932f5ae109e21ddbc83e  gcc-arc-2016.09-eng008.tar.gz
-- 
2.5.5
