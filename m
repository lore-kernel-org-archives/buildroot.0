From: Daniel Nelson <daniel@sigpwr.com>
Date: Sun, 27 Jan 2013 11:03:02 -0800
Subject: [Buildroot] [PATCH] Fix PYC-only installation for Python3
Message-ID: <1359313382-2257-1-git-send-email-daniel@sigpwr.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

This is my first buildroot/open source submission. I'd appreciate some feedback.

Python3 changes the behavior of .pyc caching, breaking the PYC-only option in buildroot. The details are in http://www.python.org/dev/peps/pep-3147

I've added a configure flag to Python3, and corresponding logic in buildroot.

Thoughts?

Thanks,

Daniel Nelson

---
 ...ython3-3.3-012-support-pre-pep3147-stdlib.patch | 121 +++++++++++++++++++++
 package/python3/python3.mk                         |   4 +
 2 files changed, 125 insertions(+)
 create mode 100644 package/python3/python3-3.3-012-support-pre-pep3147-stdlib.patch

diff --git a/package/python3/python3-3.3-012-support-pre-pep3147-stdlib.patch b/package/python3/python3-3.3-012-support-pre-pep3147-stdlib.patch
new file mode 100644
index 0000000..fadd5e1
--- /dev/null
+++ b/package/python3/python3-3.3-012-support-pre-pep3147-stdlib.patch
@@ -0,0 +1,121 @@
+--- python3-3.3.0/configure.ac	2013-01-26 19:12:56.446601796 -0800
++++ python3-3.3.0-new/configure.ac	2013-01-26 19:11:31.632687123 -0800
+@@ -1827,6 +1828,28 @@
+     LIBTOOL_CRUFT=$LIBTOOL_CRUFT' -compatibility_version $(VERSION) -current_version $(VERSION)';;
+ esac
+ 
++STDLIB_CACHE_FLAGS=
++STDLIB_CACHE_TYPE=pep3147
++AC_MSG_CHECKING(for --with-stdlib-cache)
++AC_ARG_WITH(stdlib-cache,
++    AS_HELP_STRING([--with-stdlib-cache=type], [select type of stdlib cache ("pep3147", or "old")]),
++[
++	AC_MSG_RESULT($withval)
++    STDLIB_CACHE_TYPE=$withval
++],
++[
++ 	AC_MSG_RESULT(${STDLIB_CACHE_TYPE})
++])
++case $STDLIB_CACHE_TYPE in
++    pep3147)
++        STDLIB_CACHE_FLAGS="" 
++        ;;
++    old)
++        STDLIB_CACHE_FLAGS="-b"
++        ;;
++esac
++AC_SUBST(STDLIB_CACHE_FLAGS)
++
+ AC_MSG_CHECKING(for --enable-framework)
+ if test "$enable_framework"
+ then
+--- python3-3.3.0/configure	2012-09-29 01:00:50.000000000 -0700
++++ python3-3.3.0-new/configure	2013-01-26 19:11:38.562839350 -0800
+@@ -633,6 +653,7 @@
+ LDCXXSHARED
+ LDSHARED
+ SO
++STDLIB_CACHE_FLAGS
+ LIBTOOL_CRUFT
+ OTHER_LIBTOOL_OPT
+ UNIVERSAL_ARCH_FLAGS
+@@ -765,6 +787,7 @@
+ enable_shared
+ enable_profiling
+ with_pydebug
++with_stdlib_cache
+ with_libs
+ with_system_expat
+ with_system_ffi
+@@ -1437,6 +1458,8 @@
+                           compiler
+   --with-suffix=.exe      set executable suffix
+   --with-pydebug          build with Py_DEBUG defined
++  --with-stdlib-cache=type
++                          select type of stdlib cache ("pep3147", or "old")
+   --with-libs='lib1 ...'  link against additional libs
+   --with-system-expat     build pyexpat module using an installed expat
+                           library
+@@ -8246,6 +8290,35 @@
+     LIBTOOL_CRUFT=$LIBTOOL_CRUFT' -compatibility_version $(VERSION) -current_version $(VERSION)';;
+ esac
+ 
++STDLIB_CACHE_FLAGS=
++STDLIB_CACHE_TYPE=pep3147
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for --with-stdlib-cache" >&5
++$as_echo_n "checking for --with-stdlib-cache... " >&6; }
++
++# Check whether --with-stdlib-cache was given.
++if test "${with_stdlib_cache+set}" = set; then :
++  withval=$with_stdlib_cache;
++	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $withval" >&5
++$as_echo "$withval" >&6; }
++    STDLIB_CACHE_TYPE=$withval
++
++else
++
++ 	{ $as_echo "$as_me:${as_lineno-$LINENO}: result: ${STDLIB_CACHE_TYPE}" >&5
++$as_echo "${STDLIB_CACHE_TYPE}" >&6; }
++
++fi
++
++case $STDLIB_CACHE_TYPE in
++    pep3147)
++        STDLIB_CACHE_FLAGS=""
++        ;;
++    old)
++        STDLIB_CACHE_FLAGS="-b"
++        ;;
++esac
++
++
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking for --enable-framework" >&5
+ $as_echo_n "checking for --enable-framework... " >&6; }
+ if test "$enable_framework"
+--- python3-3.3.0/Makefile.pre.in	2013-01-26 19:12:56.438601609 -0800
++++ python3-3.3.0-new/Makefile.pre.in	2013-01-26 19:10:22.466167415 -0800
+@@ -143,6 +143,9 @@
+ # Options to enable prebinding (for fast startup prior to Mac OS X 10.3)
+ OTHER_LIBTOOL_OPT=@OTHER_LIBTOOL_OPT@
+ 
++# Option to enable old-style precompiled stdlib
++STDLIB_CACHE_FLAGS=@STDLIB_CACHE_FLAGS@
++
+ # Environment to run shared python without installed libraries
+ RUNSHARED=       @RUNSHARED@
+ 
+@@ -1079,12 +1082,12 @@
+ 	fi
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-d $(LIBDEST) -f \
++		-d $(LIBDEST) -f $(STDLIB_CACHE_FLAGS) \
+ 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+ 		$(DESTDIR)$(LIBDEST)
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-d $(LIBDEST)/site-packages -f \
++		-d $(LIBDEST)/site-packages -f $(STDLIB_CACHE_FLAGS) \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index e7c0983..51fed51 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -70,6 +70,10 @@ else
 PYTHON3_CONF_OPT += --with-expat=none
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
+PYTHON3_CONF_OPT += --with-stdlib-cache=old
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON3_SQLITE),y)
 PYTHON3_DEPENDENCIES += sqlite
 endif
-- 
1.8.1
