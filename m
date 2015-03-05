From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Mar 2015 17:44:09 -0300
Subject: [Buildroot] [PATCH 2/2] samba4: bump to version 4.2.0
In-Reply-To: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>
References: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1425588249-20942-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now with support for AD DC, ADS and clustering features.
All dropped patches are upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...001-build-find-FILE_OFFSET_BITS-via-array.patch |  56 -------
 ...able-libbsd.patch => 0001-disable-libbsd.patch} |  12 +-
 ...uild-allow-some-python-variable-overrides.patch |  47 ------
 .../0003-build-find-blkcnt_t-size-via-array.patch  |  54 -------
 .../0004-build-unify-and-fix-endian-tests.patch    | 165 ---------------------
 ...fsamba-CHECK_SIZEOF-cross-compile-friendl.patch |  68 ---------
 .../0006-build-tweak-SIZEOF-utmp-ut_line.patch     |  33 -----
 package/samba4/Config.in                           |  35 +++--
 package/samba4/samba4.hash                         |   2 +-
 package/samba4/samba4.mk                           | 100 +++++++------
 10 files changed, 91 insertions(+), 481 deletions(-)
 delete mode 100644 package/samba4/0001-build-find-FILE_OFFSET_BITS-via-array.patch
 rename package/samba4/{0007-disable-libbsd.patch => 0001-disable-libbsd.patch} (66%)
 delete mode 100644 package/samba4/0002-build-allow-some-python-variable-overrides.patch
 delete mode 100644 package/samba4/0003-build-find-blkcnt_t-size-via-array.patch
 delete mode 100644 package/samba4/0004-build-unify-and-fix-endian-tests.patch
 delete mode 100644 package/samba4/0005-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch
 delete mode 100644 package/samba4/0006-build-tweak-SIZEOF-utmp-ut_line.patch

diff --git a/package/samba4/0001-build-find-FILE_OFFSET_BITS-via-array.patch b/package/samba4/0001-build-find-FILE_OFFSET_BITS-via-array.patch
deleted file mode 100644
index 8dae44d..0000000
--- a/package/samba4/0001-build-find-FILE_OFFSET_BITS-via-array.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 16d88e7813a7739c070a7a1cf6388fd4f236fd99 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Fri, 31 Jan 2014 06:45:18 -0300
-Subject: [PATCHv2] build: find FILE_OFFSET_BITS via array
-
-This makes cross-compiling happy, use a trick similar to autoconf's
-AC_CHECK_SIZEOF macro.
-Basically we make an array:
-
-static int array[1 - 2 * !(((long int)(sizeof(off_t))) < 8)];
-
-This gives -1 multiplied by the negation of the condition
-(sizeof(off_t) < 8) cast to a long int.
-So if the condition is true it gives array[(-1 * 0)] (remember the
-condition is cast and negated) thus passing a build test with a 0-sized
-array.
-If it's false it gives array[(-1 * 1)] thus failing with a
-negative-sized array.
-
-Status: Upstream.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- lib/ccan/wscript | 11 +++++++----
- 1 file changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/lib/ccan/wscript b/lib/ccan/wscript
-index 59b8205..81039d0 100644
---- a/lib/ccan/wscript
-+++ b/lib/ccan/wscript
-@@ -127,15 +127,18 @@ def configure(conf):
-     # Only check for FILE_OFFSET_BITS=64 if off_t is normally small:
-     # use raw routines because wrappers include previous _GNU_SOURCE
-     # or _FILE_OFFSET_BITS defines.
-+    # The math for these tests is:
-+    # array[-1 * !((int)(condition)) ] (condition is true) = array[0] = builds
-+    # array[-1 * !((int)(condition)) ] (condition is false) = array[-1] = fails
-     conf.check(fragment="""#include <sys/types.h>
--               int main(void) { return !(sizeof(off_t) < 8); }""",
--               execute=True, msg='Checking for small off_t',
-+               int main(void) { static int test_array[1 - 2 * !(((long int)(sizeof(off_t))) < 8)]; }""",
-+               msg='Checking for small off_t',
-                define_name='SMALL_OFF_T')
-     # Unreliable return value above, hence use define.
-     if conf.CONFIG_SET('SMALL_OFF_T'):
-         conf.check(fragment="""#include <sys/types.h>
--                   int main(void) { return !(sizeof(off_t) >= 8); }""",
--                   execute=True, msg='Checking for -D_FILE_OFFSET_BITS=64',
-+		   int main(void) { static int test_array[1 - 2 * !(((long int)(sizeof(off_t))) >= 8)]; }""",
-+                   msg='Checking for -D_FILE_OFFSET_BITS=64',
-                    ccflags='-D_FILE_OFFSET_BITS=64',
-                    define_name='HAVE_FILE_OFFSET_BITS')
- 
--- 
-1.8.3.2
-
diff --git a/package/samba4/0007-disable-libbsd.patch b/package/samba4/0001-disable-libbsd.patch
similarity index 66%
rename from package/samba4/0007-disable-libbsd.patch
rename to package/samba4/0001-disable-libbsd.patch
index b29a812..67f79d0 100644
--- a/package/samba4/0007-disable-libbsd.patch
+++ b/package/samba4/0001-disable-libbsd.patch
@@ -5,10 +5,10 @@ and bsd/unistd.h get included.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-diff -Nura samba-4.1.7.orig/lib/replace/wscript samba-4.1.7/lib/replace/wscript
---- samba-4.1.7.orig/lib/replace/wscript	2014-04-17 04:59:14.000000000 -0300
-+++ samba-4.1.7/lib/replace/wscript	2014-05-19 09:17:25.561947774 -0300
-@@ -253,15 +253,6 @@
+diff -Nura samba-4.2.0rc1.orig/lib/replace/wscript samba-4.2.0rc1/lib/replace/wscript
+--- samba-4.2.0rc1.orig/lib/replace/wscript	2014-10-01 06:17:32.000000000 -0300
++++ samba-4.2.0rc1/lib/replace/wscript	2014-10-01 07:21:13.559498987 -0300
+@@ -282,15 +282,6 @@
      conf.CHECK_FUNCS('strtouq strtoll __strtoll strtoq memalign posix_memalign')
      conf.CHECK_FUNCS('prctl')
  
@@ -18,8 +18,8 @@ diff -Nura samba-4.1.7.orig/lib/replace/wscript samba-4.1.7/lib/replace/wscript
 -                checklibc=True)
 -    if not conf.CHECK_FUNCS('getpeereid'):
 -        conf.CHECK_FUNCS_IN('getpeereid', 'bsd', headers='sys/types.h bsd/unistd.h')
--    if not conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h'):
--        conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h')
+-    if not conf.CHECK_FUNCS_IN('setproctitle', 'setproctitle', headers='setproctitle.h'):
+-        conf.CHECK_FUNCS_IN('setproctitle', 'bsd', headers='sys/types.h bsd/unistd.h')
 -
      conf.CHECK_CODE('''
                  struct ucred cred;
diff --git a/package/samba4/0002-build-allow-some-python-variable-overrides.patch b/package/samba4/0002-build-allow-some-python-variable-overrides.patch
deleted file mode 100644
index 91634b9..0000000
--- a/package/samba4/0002-build-allow-some-python-variable-overrides.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From fdbdf04a9ab3f3a204e95106c4f8f6729d0bab1a Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 4 Feb 2014 14:11:52 -0300
-Subject: [PATCH] build: allow some python variable overrides
-
-The python variables (settings) are fetched from a running python
-interpreter which usually isn't the target one when cross compiling,
-hence libraries and flags aren't the same and can pollute the target
-build.
-Allow some of these variables to be redefined via environment variables
-in order to aid cross-compiling.
-According to testing python_LDFLAGS and python_LIBDIR should be enough.
-
-Status: Upstream.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- buildtools/wafadmin/Tools/python.py | 13 +++++++++++++
- 1 file changed, 13 insertions(+)
-
-diff --git a/buildtools/wafadmin/Tools/python.py b/buildtools/wafadmin/Tools/python.py
-index ab1e817..35c61c2 100644
---- a/buildtools/wafadmin/Tools/python.py
-+++ b/buildtools/wafadmin/Tools/python.py
-@@ -193,6 +193,19 @@ MACOSX_DEPLOYMENT_TARGET = %r
- """ % (python, python_prefix, python_SO, python_SYSLIBS, python_LDFLAGS, python_SHLIBS,
- 	python_LIBDIR, python_LIBPL, INCLUDEPY, Py_ENABLE_SHARED, python_MACOSX_DEPLOYMENT_TARGET))
- 
-+	# Allow some python overrides from env vars for cross-compiling
-+	os_env = dict(os.environ)
-+
-+	override_python_LDFLAGS = os_env.get('python_LDFLAGS', None)
-+	if override_python_LDFLAGS is not None:
-+		conf.log.write("python_LDFLAGS override from environment = %r\n" % (override_python_LDFLAGS))
-+		python_LDFLAGS = override_python_LDFLAGS
-+
-+	override_python_LIBDIR = os_env.get('python_LIBDIR', None)
-+	if override_python_LIBDIR is not None:
-+		conf.log.write("python_LIBDIR override from environment = %r\n" % (override_python_LIBDIR))
-+		python_LIBDIR = override_python_LIBDIR
-+
- 	if python_MACOSX_DEPLOYMENT_TARGET:
- 		conf.env['MACOSX_DEPLOYMENT_TARGET'] = python_MACOSX_DEPLOYMENT_TARGET
- 		conf.environ['MACOSX_DEPLOYMENT_TARGET'] = python_MACOSX_DEPLOYMENT_TARGET
--- 
-1.8.3.2
-
diff --git a/package/samba4/0003-build-find-blkcnt_t-size-via-array.patch b/package/samba4/0003-build-find-blkcnt_t-size-via-array.patch
deleted file mode 100644
index f6e4d03..0000000
--- a/package/samba4/0003-build-find-blkcnt_t-size-via-array.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 934f8c8e9439de4f15b2e61016d5d29233d8d5fa Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 16 Apr 2014 08:01:36 -0300
-Subject: [PATCH 5/5] build: find blkcnt_t size via array
-
-Using the same trick as commit 0d9bb86293c9d39298786df095c73a6251b08b7e
-find blkcnt_t size via an array so that it can be determined via build
-rather than running it.
-
-Status: Upstream.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- source3/wscript | 22 ++++++++++++----------
- 1 file changed, 12 insertions(+), 10 deletions(-)
-
-diff --git a/source3/wscript b/source3/wscript
-index aade503..6a5728f 100644
---- a/source3/wscript
-+++ b/source3/wscript
-@@ -277,18 +277,20 @@ int main(int argc, char **argv)
-                                 headers='sys/types.h sys/stat.h unistd.h')
- 
-     if "HAVE_BLKCNT_T" in conf.env:
--	conf.CHECK_CODE('''
--	return sizeof(blkcnt_t) == 4 ? 0 : 1''',
--		'SIZEOF_BLKCNT_T_4', execute=True,
--		headers='replace.h sys/types.h sys/stat.h unistd.h',
--		msg="Checking whether blkcnt_t is 32 bit")
-+        conf.CHECK_CODE('''
-+        static int test_array[1 - 2 * !(((long int)(sizeof(blkcnt_t))) <= 4)];''',
-+                'SIZEOF_BLKCNT_T_4',
-+                headers='replace.h sys/types.h sys/stat.h unistd.h',
-+                msg="Checking whether blkcnt_t is 32 bit")
- 
-+    # If sizeof is 4 it can't be 8
-     if "HAVE_BLKCNT_T" in conf.env:
--	conf.CHECK_CODE('''
--	return sizeof(blkcnt_t) == 8 ? 0 : 1''',
--		'SIZEOF_BLKCNT_T_8', execute=True,
--		headers='replace.h sys/types.h sys/stat.h unistd.h',
--		msg="Checking whether blkcnt_t is 64 bit")
-+        if not conf.CONFIG_SET('SIZEOF_BLKCNT_T_4'):
-+            conf.CHECK_CODE('''
-+            static int test_array[1 - 2 * !(((long int)(sizeof(blkcnt_t))) <= 8)];''',
-+                    'SIZEOF_BLKCNT_T_8',
-+                    headers='replace.h sys/types.h sys/stat.h unistd.h',
-+                    msg="Checking whether blkcnt_t is 64 bit")
- 
-     # Check for POSIX capability support
-     conf.CHECK_FUNCS_IN('cap_get_proc', 'cap', headers='sys/capability.h')
--- 
-1.8.3.2
-
diff --git a/package/samba4/0004-build-unify-and-fix-endian-tests.patch b/package/samba4/0004-build-unify-and-fix-endian-tests.patch
deleted file mode 100644
index 3fdfe6e..0000000
--- a/package/samba4/0004-build-unify-and-fix-endian-tests.patch
+++ /dev/null
@@ -1,165 +0,0 @@
-From ee4e06b7223fb2925bc887c89216a66029d44862 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 1 Apr 2014 06:41:47 -0300
-Subject: [PATCH 2/5] build: unify and fix endian tests
-
-Unify the endian tests out of lib/ccan/wscript into wafsamba since
-they're almost cross-compile friendly.
-While at it fix them to be so by moving the preprocessor directives out
-of main scope since that will fail.
-And keep the WORDS_BIGENDIAN, HAVE_LITTLE_ENDIAN and HAVE_BIG_ENDIAN
-defines separate because of different codebases.
-
-Status: Upstream.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- buildtools/wafsamba/wscript | 65 ++++++++++++++++++++++++++++++++++++++++++---
- lib/ccan/wscript            | 55 --------------------------------------
- 2 files changed, 62 insertions(+), 58 deletions(-)
-
-diff --git a/buildtools/wafsamba/wscript b/buildtools/wafsamba/wscript
-index 7984227..1a2cfe6 100755
---- a/buildtools/wafsamba/wscript
-+++ b/buildtools/wafsamba/wscript
-@@ -390,9 +390,68 @@ def configure(conf):
-     else:
-         conf.define('SHLIBEXT', "so", quote=True)
- 
--    conf.CHECK_CODE('long one = 1; return ((char *)(&one))[0]',
--                    execute=True,
--                    define='WORDS_BIGENDIAN')
-+    # First try a header check for cross-compile friendlyness
-+    conf.CHECK_CODE(code = """#ifdef __BYTE_ORDER
-+                        #define B __BYTE_ORDER
-+                        #elif defined(BYTE_ORDER)
-+                        #define B BYTE_ORDER
-+                        #endif
-+
-+                        #ifdef __LITTLE_ENDIAN
-+                        #define LITTLE __LITTLE_ENDIAN
-+                        #elif defined(LITTLE_ENDIAN)
-+                        #define LITTLE LITTLE_ENDIAN
-+                        #endif
-+
-+                        #if !defined(LITTLE) || !defined(B) || LITTLE != B
-+                        #error Not little endian.
-+                        #endif
-+                        int main(void) { return 0; }""",
-+                            addmain=False,
-+                            headers="endian.h sys/endian.h",
-+                            define="HAVE_LITTLE_ENDIAN")
-+    conf.CHECK_CODE(code = """#ifdef __BYTE_ORDER
-+                        #define B __BYTE_ORDER
-+                        #elif defined(BYTE_ORDER)
-+                        #define B BYTE_ORDER
-+                        #endif
-+
-+                        #ifdef __BIG_ENDIAN
-+                        #define BIG __BIG_ENDIAN
-+                        #elif defined(BIG_ENDIAN)
-+                        #define BIG BIG_ENDIAN
-+                        #endif
-+
-+                        #if !defined(BIG) || !defined(B) || BIG != B
-+                        #error Not big endian.
-+                        #endif
-+                        int main(void) { return 0; }""",
-+                            addmain=False,
-+                            headers="endian.h sys/endian.h",
-+                            define="HAVE_BIG_ENDIAN")
-+
-+    if not conf.CONFIG_SET("HAVE_BIG_ENDIAN") and not conf.CONFIG_SET("HAVE_LITTLE_ENDIAN"):
-+        # That didn't work!  Do runtime test.
-+        conf.CHECK_CODE("""union { int i; char c[sizeof(int)]; } u;
-+            u.i = 0x01020304;
-+            return u.c[0] == 0x04 && u.c[1] == 0x03 && u.c[2] == 0x02 && u.c[3] == 0x01 ? 0 : 1;""",
-+                          addmain=True, execute=True,
-+                          define='HAVE_LITTLE_ENDIAN',
-+                          msg="Checking for HAVE_LITTLE_ENDIAN - runtime")
-+        conf.CHECK_CODE("""union { int i; char c[sizeof(int)]; } u;
-+            u.i = 0x01020304;
-+            return u.c[0] == 0x01 && u.c[1] == 0x02 && u.c[2] == 0x03 && u.c[3] == 0x04 ? 0 : 1;""",
-+                          addmain=True, execute=True,
-+                          define='HAVE_BIG_ENDIAN',
-+                          msg="Checking for HAVE_BIG_ENDIAN - runtime")
-+
-+    # Extra sanity check.
-+    if conf.CONFIG_SET("HAVE_BIG_ENDIAN") == conf.CONFIG_SET("HAVE_LITTLE_ENDIAN"):
-+        Logs.error("Failed endian determination.  The PDP-11 is back?")
-+	sys.exit(1)
-+    else:
-+        if conf.CONFIG_SET("HAVE_BIG_ENDIAN"):
-+            conf.DEFINE('WORDS_BIGENDIAN', 1)
- 
-     # check if signal() takes a void function
-     if conf.CHECK_CODE('return *(signal (0, 0)) (0) == 1',
-diff --git a/lib/ccan/wscript b/lib/ccan/wscript
-index 1c5f337..0e540db 100644
---- a/lib/ccan/wscript
-+++ b/lib/ccan/wscript
-@@ -25,61 +25,6 @@ def configure(conf):
-     conf.CHECK_CODE('int __attribute__((used)) func(int x) { return x; }',
-                     addmain=False, link=False, cflags=conf.env['WERROR_CFLAGS'],
-                     define='HAVE_ATTRIBUTE_USED')
--    # We try to use headers for a compile-time test.
--    conf.CHECK_CODE(code = """#ifdef __BYTE_ORDER
--                        #define B __BYTE_ORDER
--                        #elif defined(BYTE_ORDER)
--                        #define B BYTE_ORDER
--                        #endif
--
--                        #ifdef __LITTLE_ENDIAN
--                        #define LITTLE __LITTLE_ENDIAN
--                        #elif defined(LITTLE_ENDIAN)
--                        #define LITTLE LITTLE_ENDIAN
--                        #endif
--
--                        #if !defined(LITTLE) || !defined(B) || LITTLE != B
--                        #error Not little endian.
--                        #endif""",
--                           headers="endian.h sys/endian.h",
--                           define="HAVE_LITTLE_ENDIAN")
--    conf.CHECK_CODE(code = """#ifdef __BYTE_ORDER
--                        #define B __BYTE_ORDER
--                        #elif defined(BYTE_ORDER)
--                        #define B BYTE_ORDER
--                        #endif
--
--                        #ifdef __BIG_ENDIAN
--                        #define BIG __BIG_ENDIAN
--                        #elif defined(BIG_ENDIAN)
--                        #define BIG BIG_ENDIAN
--                        #endif
--
--                        #if !defined(BIG) || !defined(B) || BIG != B
--                        #error Not big endian.
--                        #endif""",
--                           headers="endian.h sys/endian.h",
--                           define="HAVE_BIG_ENDIAN")
--
--    if not conf.CONFIG_SET("HAVE_BIG_ENDIAN") and not conf.CONFIG_SET("HAVE_LITTLE_ENDIAN"):
--        # That didn't work!  Do runtime test.
--        conf.CHECK_CODE("""union { int i; char c[sizeof(int)]; } u;
--	  u.i = 0x01020304;
--	  return u.c[0] == 0x04 && u.c[1] == 0x03 && u.c[2] == 0x02 && u.c[3] == 0x01 ? 0 : 1;""",
--                        addmain=True, execute=True,
--                        define='HAVE_LITTLE_ENDIAN',
--                        msg="Checking for HAVE_LITTLE_ENDIAN - runtime")
--        conf.CHECK_CODE("""union { int i; char c[sizeof(int)]; } u;
--	  u.i = 0x01020304;
--	  return u.c[0] == 0x01 && u.c[1] == 0x02 && u.c[2] == 0x03 && u.c[3] == 0x04 ? 0 : 1;""",
--                        addmain=True, execute=True,
--                        define='HAVE_BIG_ENDIAN',
--                        msg="Checking for HAVE_BIG_ENDIAN - runtime")
--
--    # Extra sanity check.
--    if conf.CONFIG_SET("HAVE_BIG_ENDIAN") == conf.CONFIG_SET("HAVE_LITTLE_ENDIAN"):
--        Logs.error("Failed endian determination.  The PDP-11 is back?")
--        sys.exit(1)
- 
-     conf.CHECK_CODE('return __builtin_choose_expr(1, 0, "garbage");',
-                     link=True,
--- 
-1.8.3.2
-
diff --git a/package/samba4/0005-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch b/package/samba4/0005-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch
deleted file mode 100644
index 72176cb..0000000
--- a/package/samba4/0005-build-make-wafsamba-CHECK_SIZEOF-cross-compile-friendl.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From fd3eb1e9f712e4c96c0b55d4203745afb2bcc8c2 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 9 Apr 2014 10:21:59 -0300
-Subject: [PATCH 3/5] build: make wafsamba CHECK_SIZEOF cross-compile friendly
-
-Use the same trick as commit 0d9bb86293c9d39298786df095c73a6251b08b7e
-We do the same array trick iteratively starting from 1 (byte) by powers
-of 2 up to 32.
-
-The new 'critical' option is used to make the invocation die or not
-according to each test.
-The default is True since normally it's expected to find a proper
-result and should error out if not.
-
-Status: Upstream.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- buildtools/wafsamba/samba_autoconf.py | 28 ++++++++++++++++------------
- 1 file changed, 16 insertions(+), 12 deletions(-)
-
-diff --git a/buildtools/wafsamba/samba_autoconf.py b/buildtools/wafsamba/samba_autoconf.py
-index 59d9e79..f60ce9d 100644
---- a/buildtools/wafsamba/samba_autoconf.py
-+++ b/buildtools/wafsamba/samba_autoconf.py
-@@ -304,23 +304,27 @@ def CHECK_FUNCS(conf, list, link=True, lib=None, headers=None):
- 
- 
- @conf
--def CHECK_SIZEOF(conf, vars, headers=None, define=None):
-+def CHECK_SIZEOF(conf, vars, headers=None, define=None, critical=True):
-     '''check the size of a type'''
--    ret = True
-     for v in TO_LIST(vars):
-         v_define = define
-+        ret = False
-         if v_define is None:
-             v_define = 'SIZEOF_%s' % v.upper().replace(' ', '_')
--        if not CHECK_CODE(conf,
--                          'printf("%%u", (unsigned)sizeof(%s))' % v,
--                          define=v_define,
--                          execute=True,
--                          define_ret=True,
--                          quote=False,
--                          headers=headers,
--                          local_include=False,
--                          msg="Checking size of %s" % v):
--            ret = False
-+        for size in list((1, 2, 4, 8, 16, 32)):
-+            if CHECK_CODE(conf,
-+                      'static int test_array[1 - 2 * !(((long int)(sizeof(%s))) <= %d)];' % (v, size),
-+                      define=v_define,
-+                      quote=False,
-+                      headers=headers,
-+                      local_include=False,
-+                      msg="Checking if size of %s == %d" % (v, size)):
-+                conf.DEFINE(v_define, size)
-+                ret = True
-+                break
-+        if not ret and critical:
-+            Logs.error("Couldn't determine size of '%s'" % v)
-+            sys.exit(1)
-     return ret
- 
- @conf
--- 
-1.8.3.2
-
diff --git a/package/samba4/0006-build-tweak-SIZEOF-utmp-ut_line.patch b/package/samba4/0006-build-tweak-SIZEOF-utmp-ut_line.patch
deleted file mode 100644
index 28f5f10..0000000
--- a/package/samba4/0006-build-tweak-SIZEOF-utmp-ut_line.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 1a7f4f5e3fbbe83e147fffdfe00d7f37181a8ec1 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 9 Apr 2014 10:39:06 -0300
-Subject: [PATCH 4/5] build: tweak SIZEOF utmp->ut_line
-
-Set the critical parameter of CHECK_SIZEOF utmp->ut_line to False since
-it's used to find out if utmp support should be enabled.
-This is necessary with the introduction of the cross-compile aware
-CHECK_SIZEOF.
-
-Status: Upstream.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- source3/wscript | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/source3/wscript b/source3/wscript
-index e81a47b..aade503 100644
---- a/source3/wscript
-+++ b/source3/wscript
-@@ -812,7 +812,7 @@ msg.msg_acctrightslen = sizeof(fd);
-                         'PUTUTLINE_RETURNS_UTMP', headers='utmp.h',
-                         msg="Checking whether pututline returns pointer")
-         conf.CHECK_SIZEOF(['((struct utmp *)NULL)->ut_line'], headers='utmp.h',
--                          define='SIZEOF_UTMP_UT_LINE')
-+                          define='SIZEOF_UTMP_UT_LINE', critical=False)
-         if not conf.CONFIG_SET('SIZEOF_UTMP_UT_LINE'):
-             conf.env.with_utmp = False
-         elif int(conf.env.SIZEOF_UTMP_UT_LINE) < 15:
--- 
-1.8.3.2
-
diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index b841f42..5a83ab8 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -1,11 +1,10 @@
+comment "samba4 needs an (e)glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
 config BR2_PACKAGE_SAMBA4
 	bool "samba4"
 	depends on !BR2_PACKAGE_SAMBA
-	depends on BR2_INET_IPV6
-	depends on BR2_USE_MMU # fork()
-	depends on BR2_USE_WCHAR # e2fsprogs
-	depends on BR2_LARGEFILE
-	depends on BR2_TOOLCHAIN_HAS_THREADS # talloc python threads
+	depends on BR2_TOOLCHAIN_USES_GLIBC # needs nss.h, $ORIGIN support
 	depends on !BR2_nios2 # binary too large, relocations don't fit
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_POPT
@@ -18,7 +17,25 @@ config BR2_PACKAGE_SAMBA4
 
 	  http://www.samba.org/
 
-comment "samba4 needs a toolchain w/ IPv6, wchar, largfile, threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || \
-		!BR2_USE_WCHAR || !BR2_INET_IPV6
-	depends on BR2_USE_MMU
+if BR2_PACKAGE_SAMBA4
+
+config BR2_PACKAGE_SAMBA4_AD_DC
+	bool "AD DC"
+	select BR2_PACKAGE_GNUTLS
+	help
+	  Enable Active Directory Domain Controller functionality.
+
+config BR2_PACKAGE_SAMBA4_ADS
+	bool "ADS"
+	select BR2_PACKAGE_OPENLDAP
+	help
+	  Enable Active Directory member Server functionality.
+
+config BR2_PACKAGE_SAMBA4_SMBTORTURE
+	bool "smbtorture"
+	help
+	  Install the smbtorture test suite.
+	  It's normally used for validation and stress testing.
+	  Approximately +5 MB of stripped uncompressed target space.
+
+endif
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 721c3dc..3dbea5a 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	7aeb5d09e9c84bbeeb4b98d33404e9dbc4d99c54e64a447cc9c4d57e9255cb1d	samba-4.1.17.tar.gz
+sha256	66a6057815a971fee64fbe936ff6cbad542421a4bd52cba8d8d41afc9abc490f	samba-4.2.0.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index bd8ed12..cb6ff0a 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.1.17
-SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
+SAMBA4_VERSION = 4.2.0
+SAMBA4_SITE = http://ftp.samba.org/pub/samba
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_LICENSE = GPLv3+
 SAMBA4_LICENSE_FILES = COPYING
@@ -14,61 +14,63 @@ SAMBA4_DEPENDENCIES = host-e2fsprogs host-heimdal e2fsprogs popt python zlib \
 	$(if $(BR2_PACKAGE_READLINE),readline)
 
 ifeq ($(BR2_PACKAGE_ACL),y)
-	SAMBA4_CONF_OPTS += --with-acl-support
-	SAMBA4_DEPENDENCIES += acl
+SAMBA4_CONF_OPTS += --with-acl-support
+SAMBA4_DEPENDENCIES += acl
 else
-	SAMBA4_CONF_OPTS += --without-acl-support
+SAMBA4_CONF_OPTS += --without-acl-support
 endif
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
-	SAMBA4_CONF_ENV += CUPS_CONFIG="$(STAGING_DIR)/usr/bin/cups-config"
-	SAMBA4_CONF_OPTS += --enable-cups
-	SAMBA4_DEPENDENCIES += cups
+SAMBA4_CONF_ENV += CUPS_CONFIG="$(STAGING_DIR)/usr/bin/cups-config"
+SAMBA4_CONF_OPTS += --enable-cups
+SAMBA4_DEPENDENCIES += cups
 else
-	SAMBA4_CONF_OPTS += --disable-cups
+SAMBA4_CONF_OPTS += --disable-cups
 endif
 
 ifeq ($(BR2_PACKAGE_LIBAIO),y)
-	SAMBA4_CONF_OPTS += --with-aio-support
-	SAMBA4_DEPENDENCIES += libaio
+SAMBA4_CONF_OPTS += --with-aio-support
+SAMBA4_DEPENDENCIES += libaio
 else
-	SAMBA4_CONF_OPTS += --without-aio-support
+SAMBA4_CONF_OPTS += --without-aio-support
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_AVAHI_DAEMON),yy)
-	SAMBA4_CONF_OPTS += --enable-avahi
-	SAMBA4_DEPENDENCIES += avahi
+SAMBA4_CONF_OPTS += --enable-avahi
+SAMBA4_DEPENDENCIES += avahi
 else
-	SAMBA4_CONF_OPTS += --disable-avahi
+SAMBA4_CONF_OPTS += --disable-avahi
 endif
 
 ifeq ($(BR2_PACKAGE_GAMIN),y)
-	SAMBA4_CONF_OPTS += --with-fam
-	SAMBA4_DEPENDENCIES += gamin
+SAMBA4_CONF_OPTS += --with-fam
+SAMBA4_DEPENDENCIES += gamin
 else
-	SAMBA4_CONF_OPTS += --without-fam
+SAMBA4_CONF_OPTS += --without-fam
 endif
 
 ifeq ($(BR2_PACKAGE_GETTEXT),y)
-	SAMBA4_CONF_OPTS += --with-gettext=$(STAGING_DIR)/usr
-	SAMBA4_DEPENDENCIES += gettext
+SAMBA4_CONF_OPTS += --with-gettext=$(STAGING_DIR)/usr
+SAMBA4_DEPENDENCIES += gettext
 else
-	SAMBA4_CONF_OPTS += --without-gettext
-endif
-
-ifeq ($(BR2_PACKAGE_GNUTLS),y)
-	SAMBA4_CONF_OPTS += --enable-gnutls
-	SAMBA4_DEPENDENCIES += gnutls
-else
-	SAMBA4_CONF_OPTS += --disable-gnutls
+SAMBA4_CONF_OPTS += --without-gettext
 endif
 
 ifeq ($(BR2_PACKAGE_NCURSES_TARGET_FORM)$(BR2_PACKAGE_NCURSES_TARGET_MENU)$(BR2_PACKAGE_NCURSES_TARGET_PANEL),yyy)
-	SAMBA4_DEPENDENCIES += ncurses
+SAMBA4_DEPENDENCIES += ncurses
 else
-	SAMBA4_CONF_OPTS += --without-regedit
+SAMBA4_CONF_OPTS += --without-regedit
 endif
 
+# The ctdb tests (cluster) need bash and take up some space
+# They're normally intended for debugging so remove them
+define SAMBA4_REMOVE_CTDB_TESTS
+	rm -rf $(TARGET_DIR)/usr/lib/ctdb-tests
+	rm -rf $(TARGET_DIR)/usr/share/ctdb-tests
+	rm -f $(TARGET_DIR)/usr/bin/ctdb_run_*tests
+endef
+SAMBA4_POST_INSTALL_TARGET_HOOKS += SAMBA4_REMOVE_CTDB_TESTS
+
 define SAMBA4_CONFIGURE_CMDS
 	cp package/samba4/samba4-cache.txt $(@D)/cache.txt;
 	echo 'Checking uname machine type: $(BR2_ARCH)' >>$(@D)/cache.txt;
@@ -93,9 +95,7 @@ define SAMBA4_CONFIGURE_CMDS
 			--without-pam \
 			--without-dmapi \
 			--disable-glusterfs \
-			--without-ldap \
-			--without-cluster-support \
-			--without-ads \
+			--with-cluster-support \
 			--bundled-libraries='!asn1_compile,!compile_et' \
 			$(SAMBA4_CONF_OPTS) \
 	)
@@ -119,18 +119,34 @@ endef
 SAMBA4_POST_INSTALL_TARGET_HOOKS += SAMBA4_BUILD_PYC_FILES
 endif
 
+ifeq ($(BR2_PACKAGE_SAMBA4_AD_DC),)
+SAMBA4_CONF_OPTS += --without-ad-dc
+endif
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+SAMBA4_CONF_OPTS += --enable-gnutls
+SAMBA4_DEPENDENCIES += gnutls
+else
+SAMBA4_CONF_OPTS += --disable-gnutls
+endif
+
+ifeq ($(BR2_PACKAGE_SAMBA4_ADS),y)
+SAMBA4_CONF_OPTS += --with-ads --with-ldap --with-shared-modules=idmap_ad
+SAMBA4_DEPENDENCIES += openldap
+else
+SAMBA4_CONF_OPTS += --without-ads --without-ldap
+endif
+
+ifeq ($(BR2_PACKAGE_SAMBA4_SMBTORTURE),)
+define SAMBA4_REMOVE_SMBTORTURE
+	rm -f $(TARGET_DIR)/usr/bin/smbtorture
+endef
+SAMBA4_POST_INSTALL_TARGET_HOOKS += SAMBA4_REMOVE_SMBTORTURE
+endif
+
 define SAMBA4_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/samba4/S91smb \
 		$(TARGET_DIR)/etc/init.d/S91smb
 endef
 
-# uClibc doesn't honor $ORIGIN so we need to move a few libs
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-define SAMBA4_MOVE_LIBS
-	mv -f $(TARGET_DIR)/usr/lib/samba/libreplace* $(TARGET_DIR)/usr/lib
-	mv -f $(TARGET_DIR)/usr/lib/samba/libtalloc* $(TARGET_DIR)/usr/lib
-endef
-SAMBA4_POST_INSTALL_TARGET_HOOKS += SAMBA4_MOVE_LIBS
-endif
-
 $(eval $(generic-package))
-- 
2.0.5
