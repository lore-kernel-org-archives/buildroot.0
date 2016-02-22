From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 22 Feb 2016 09:23:27 -0300
Subject: [Buildroot] [PATCH v2 4/4] gtest,
	gmock: Move download link away from Google Code
In-Reply-To: <1456143807-3350-1-git-send-email-casantos@datacom.ind.br>
References: <1456143807-3350-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <1456143807-3350-5-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Google Code is being shut down. The google code site which hosts the
source .zip for gtest and gmock references github.com/google/googletest,
now.

Change the GTEST_SITE and GMOCK_SITE to this new github repo, fix the
version, fix the paths, and remove the custom extraction commands.

GitHub contains a combination of the former gtest and gmock repos, moved
to the sibling directories "googletest" and "googlemock", respectively.

The repo is a bit funky, however:

1) The code underneath the "release-1.7.0" tag has gtest as in the
   google code repo, with minor changes (mostly support script and
   Microsoft C++ Builder project files, not relevant for buildroot
   purposes).

2) There is no tag corresponding to gmock 1.7.0. We circumvent this by
   refering to the commit id corresponding to gmock 1.7.0.

3) The "gtest" subdir was removed from the gmock code. We solve this by
   adding a patch to provide a copy of acx_pthread.m4 from gtest; then
   we configure refering to the gtest installed under $(STAGING_DIR).

These changes are required to ensure that gtest and gmock builds don't
fail if/when Google Code disappears. Forthcoming patches will replace
gtest and gmock by a "googletest" package and upgrade to the current
HEAD, which is laid out as described above.

Signed-off-by: Alan Ott <alan@softiron.co.uk>
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/gmock/0001-force-use-python2.patch         |   8 -
 ...0002-Copy-acx_pthread.m4-from-GTest-1.7.0.patch | 394 +++++++++++++++++++++
 package/gmock/Config.in                            |   2 +-
 package/gmock/gmock.hash                           |   4 +-
 package/gmock/gmock.mk                             |  23 +-
 package/gtest/0001-force-use-python2.patch         |  12 +
 package/gtest/Config.in                            |   2 +-
 package/gtest/gtest.hash                           |   4 +-
 package/gtest/gtest.mk                             |  11 +-
 9 files changed, 424 insertions(+), 36 deletions(-)
 create mode 100644 package/gmock/0002-Copy-acx_pthread.m4-from-GTest-1.7.0.patch
 create mode 100644 package/gtest/0001-force-use-python2.patch

diff --git a/package/gmock/0001-force-use-python2.patch b/package/gmock/0001-force-use-python2.patch
index 5dcb231..32eea1a 100644
--- a/package/gmock/0001-force-use-python2.patch
+++ b/package/gmock/0001-force-use-python2.patch
@@ -2,14 +2,6 @@ Force use of Python 2 even when Python 3 is the default Python interpreter.
 
 Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
 
---- ./gtest/scripts/fuse_gtest_files.py.orig	2013-09-18 14:48:30.000000000 -0300
-+++ ./gtest/scripts/fuse_gtest_files.py	2015-07-22 15:42:53.291591205 -0300
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python2
- #
- # Copyright 2009, Google Inc.
- # All rights reserved.
 --- ./scripts/generator/gmock_gen.py.orig	2013-09-18 14:50:15.000000000 -0300
 +++ ./scripts/generator/gmock_gen.py	2015-07-22 17:06:51.071815634 -0300
 @@ -1,4 +1,4 @@
diff --git a/package/gmock/0002-Copy-acx_pthread.m4-from-GTest-1.7.0.patch b/package/gmock/0002-Copy-acx_pthread.m4-from-GTest-1.7.0.patch
new file mode 100644
index 0000000..bfd1fb7
--- /dev/null
+++ b/package/gmock/0002-Copy-acx_pthread.m4-from-GTest-1.7.0.patch
@@ -0,0 +1,394 @@
+From ce161690607999c8448ab26f754f65abfc57c7e2 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.ind.br>
+Date: Fri, 19 Feb 2016 09:21:10 -0200
+Subject: [PATCH] Copy acx_pthread.m4 from GTest 1.7.0
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ acx_pthread.m4 | 363 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ configure.ac   |   2 +-
+ 2 files changed, 364 insertions(+), 1 deletion(-)
+ create mode 100644 acx_pthread.m4
+
+diff --git a/acx_pthread.m4 b/acx_pthread.m4
+new file mode 100644
+index 0000000..2cf20de
+--- /dev/null
++++ b/acx_pthread.m4
+@@ -0,0 +1,363 @@
++# This was retrieved from
++#    http://svn.0pointer.de/viewvc/trunk/common/acx_pthread.m4?revision=1277&root=avahi
++# See also (perhaps for new versions?)
++#    http://svn.0pointer.de/viewvc/trunk/common/acx_pthread.m4?root=avahi
++#
++# We've rewritten the inconsistency check code (from avahi), to work
++# more broadly.  In particular, it no longer assumes ld accepts -zdefs.
++# This caused a restructing of the code, but the functionality has only
++# changed a little.
++
++dnl @synopsis ACX_PTHREAD([ACTION-IF-FOUND[, ACTION-IF-NOT-FOUND]])
++dnl
++dnl @summary figure out how to build C programs using POSIX threads
++dnl
++dnl This macro figures out how to build C programs using POSIX threads.
++dnl It sets the PTHREAD_LIBS output variable to the threads library and
++dnl linker flags, and the PTHREAD_CFLAGS output variable to any special
++dnl C compiler flags that are needed. (The user can also force certain
++dnl compiler flags/libs to be tested by setting these environment
++dnl variables.)
++dnl
++dnl Also sets PTHREAD_CC to any special C compiler that is needed for
++dnl multi-threaded programs (defaults to the value of CC otherwise).
++dnl (This is necessary on AIX to use the special cc_r compiler alias.)
++dnl
++dnl NOTE: You are assumed to not only compile your program with these
++dnl flags, but also link it with them as well. e.g. you should link
++dnl with $PTHREAD_CC $CFLAGS $PTHREAD_CFLAGS $LDFLAGS ... $PTHREAD_LIBS
++dnl $LIBS
++dnl
++dnl If you are only building threads programs, you may wish to use
++dnl these variables in your default LIBS, CFLAGS, and CC:
++dnl
++dnl        LIBS="$PTHREAD_LIBS $LIBS"
++dnl        CFLAGS="$CFLAGS $PTHREAD_CFLAGS"
++dnl        CC="$PTHREAD_CC"
++dnl
++dnl In addition, if the PTHREAD_CREATE_JOINABLE thread-attribute
++dnl constant has a nonstandard name, defines PTHREAD_CREATE_JOINABLE to
++dnl that name (e.g. PTHREAD_CREATE_UNDETACHED on AIX).
++dnl
++dnl ACTION-IF-FOUND is a list of shell commands to run if a threads
++dnl library is found, and ACTION-IF-NOT-FOUND is a list of commands to
++dnl run it if it is not found. If ACTION-IF-FOUND is not specified, the
++dnl default action will define HAVE_PTHREAD.
++dnl
++dnl Please let the authors know if this macro fails on any platform, or
++dnl if you have any other suggestions or comments. This macro was based
++dnl on work by SGJ on autoconf scripts for FFTW (www.fftw.org) (with
++dnl help from M. Frigo), as well as ac_pthread and hb_pthread macros
++dnl posted by Alejandro Forero Cuervo to the autoconf macro repository.
++dnl We are also grateful for the helpful feedback of numerous users.
++dnl
++dnl @category InstalledPackages
++dnl @author Steven G. Johnson <stevenj@alum.mit.edu>
++dnl @version 2006-05-29
++dnl @license GPLWithACException
++dnl 
++dnl Checks for GCC shared/pthread inconsistency based on work by
++dnl Marcin Owsiany <marcin@owsiany.pl>
++
++
++AC_DEFUN([ACX_PTHREAD], [
++AC_REQUIRE([AC_CANONICAL_HOST])
++AC_LANG_SAVE
++AC_LANG_C
++acx_pthread_ok=no
++
++# We used to check for pthread.h first, but this fails if pthread.h
++# requires special compiler flags (e.g. on True64 or Sequent).
++# It gets checked for in the link test anyway.
++
++# First of all, check if the user has set any of the PTHREAD_LIBS,
++# etcetera environment variables, and if threads linking works using
++# them:
++if test x"$PTHREAD_LIBS$PTHREAD_CFLAGS" != x; then
++        save_CFLAGS="$CFLAGS"
++        CFLAGS="$CFLAGS $PTHREAD_CFLAGS"
++        save_LIBS="$LIBS"
++        LIBS="$PTHREAD_LIBS $LIBS"
++        AC_MSG_CHECKING([for pthread_join in LIBS=$PTHREAD_LIBS with CFLAGS=$PTHREAD_CFLAGS])
++        AC_TRY_LINK_FUNC(pthread_join, acx_pthread_ok=yes)
++        AC_MSG_RESULT($acx_pthread_ok)
++        if test x"$acx_pthread_ok" = xno; then
++                PTHREAD_LIBS=""
++                PTHREAD_CFLAGS=""
++        fi
++        LIBS="$save_LIBS"
++        CFLAGS="$save_CFLAGS"
++fi
++
++# We must check for the threads library under a number of different
++# names; the ordering is very important because some systems
++# (e.g. DEC) have both -lpthread and -lpthreads, where one of the
++# libraries is broken (non-POSIX).
++
++# Create a list of thread flags to try.  Items starting with a "-" are
++# C compiler flags, and other items are library names, except for "none"
++# which indicates that we try without any flags at all, and "pthread-config"
++# which is a program returning the flags for the Pth emulation library.
++
++acx_pthread_flags="pthreads none -Kthread -kthread lthread -pthread -pthreads -mthreads pthread --thread-safe -mt pthread-config"
++
++# The ordering *is* (sometimes) important.  Some notes on the
++# individual items follow:
++
++# pthreads: AIX (must check this before -lpthread)
++# none: in case threads are in libc; should be tried before -Kthread and
++#       other compiler flags to prevent continual compiler warnings
++# -Kthread: Sequent (threads in libc, but -Kthread needed for pthread.h)
++# -kthread: FreeBSD kernel threads (preferred to -pthread since SMP-able)
++# lthread: LinuxThreads port on FreeBSD (also preferred to -pthread)
++# -pthread: Linux/gcc (kernel threads), BSD/gcc (userland threads)
++# -pthreads: Solaris/gcc
++# -mthreads: Mingw32/gcc, Lynx/gcc
++# -mt: Sun Workshop C (may only link SunOS threads [-lthread], but it
++#      doesn't hurt to check since this sometimes defines pthreads too;
++#      also defines -D_REENTRANT)
++#      ... -mt is also the pthreads flag for HP/aCC
++# pthread: Linux, etcetera
++# --thread-safe: KAI C++
++# pthread-config: use pthread-config program (for GNU Pth library)
++
++case "${host_cpu}-${host_os}" in
++        *solaris*)
++
++        # On Solaris (at least, for some versions), libc contains stubbed
++        # (non-functional) versions of the pthreads routines, so link-based
++        # tests will erroneously succeed.  (We need to link with -pthreads/-mt/
++        # -lpthread.)  (The stubs are missing pthread_cleanup_push, or rather
++        # a function called by this macro, so we could check for that, but
++        # who knows whether they'll stub that too in a future libc.)  So,
++        # we'll just look for -pthreads and -lpthread first:
++
++        acx_pthread_flags="-pthreads pthread -mt -pthread $acx_pthread_flags"
++        ;;
++esac
++
++if test x"$acx_pthread_ok" = xno; then
++for flag in $acx_pthread_flags; do
++
++        case $flag in
++                none)
++                AC_MSG_CHECKING([whether pthreads work without any flags])
++                ;;
++
++                -*)
++                AC_MSG_CHECKING([whether pthreads work with $flag])
++                PTHREAD_CFLAGS="$flag"
++                ;;
++
++		pthread-config)
++		AC_CHECK_PROG(acx_pthread_config, pthread-config, yes, no)
++		if test x"$acx_pthread_config" = xno; then continue; fi
++		PTHREAD_CFLAGS="`pthread-config --cflags`"
++		PTHREAD_LIBS="`pthread-config --ldflags` `pthread-config --libs`"
++		;;
++
++                *)
++                AC_MSG_CHECKING([for the pthreads library -l$flag])
++                PTHREAD_LIBS="-l$flag"
++                ;;
++        esac
++
++        save_LIBS="$LIBS"
++        save_CFLAGS="$CFLAGS"
++        LIBS="$PTHREAD_LIBS $LIBS"
++        CFLAGS="$CFLAGS $PTHREAD_CFLAGS"
++
++        # Check for various functions.  We must include pthread.h,
++        # since some functions may be macros.  (On the Sequent, we
++        # need a special flag -Kthread to make this header compile.)
++        # We check for pthread_join because it is in -lpthread on IRIX
++        # while pthread_create is in libc.  We check for pthread_attr_init
++        # due to DEC craziness with -lpthreads.  We check for
++        # pthread_cleanup_push because it is one of the few pthread
++        # functions on Solaris that doesn't have a non-functional libc stub.
++        # We try pthread_create on general principles.
++        AC_TRY_LINK([#include <pthread.h>],
++                    [pthread_t th; pthread_join(th, 0);
++                     pthread_attr_init(0); pthread_cleanup_push(0, 0);
++                     pthread_create(0,0,0,0); pthread_cleanup_pop(0); ],
++                    [acx_pthread_ok=yes])
++
++        LIBS="$save_LIBS"
++        CFLAGS="$save_CFLAGS"
++
++        AC_MSG_RESULT($acx_pthread_ok)
++        if test "x$acx_pthread_ok" = xyes; then
++                break;
++        fi
++
++        PTHREAD_LIBS=""
++        PTHREAD_CFLAGS=""
++done
++fi
++
++# Various other checks:
++if test "x$acx_pthread_ok" = xyes; then
++        save_LIBS="$LIBS"
++        LIBS="$PTHREAD_LIBS $LIBS"
++        save_CFLAGS="$CFLAGS"
++        CFLAGS="$CFLAGS $PTHREAD_CFLAGS"
++
++        # Detect AIX lossage: JOINABLE attribute is called UNDETACHED.
++	AC_MSG_CHECKING([for joinable pthread attribute])
++	attr_name=unknown
++	for attr in PTHREAD_CREATE_JOINABLE PTHREAD_CREATE_UNDETACHED; do
++	    AC_TRY_LINK([#include <pthread.h>], [int attr=$attr; return attr;],
++                        [attr_name=$attr; break])
++	done
++        AC_MSG_RESULT($attr_name)
++        if test "$attr_name" != PTHREAD_CREATE_JOINABLE; then
++            AC_DEFINE_UNQUOTED(PTHREAD_CREATE_JOINABLE, $attr_name,
++                               [Define to necessary symbol if this constant
++                                uses a non-standard name on your system.])
++        fi
++
++        AC_MSG_CHECKING([if more special flags are required for pthreads])
++        flag=no
++        case "${host_cpu}-${host_os}" in
++            *-aix* | *-freebsd* | *-darwin*) flag="-D_THREAD_SAFE";;
++            *solaris* | *-osf* | *-hpux*) flag="-D_REENTRANT";;
++        esac
++        AC_MSG_RESULT(${flag})
++        if test "x$flag" != xno; then
++            PTHREAD_CFLAGS="$flag $PTHREAD_CFLAGS"
++        fi
++
++        LIBS="$save_LIBS"
++        CFLAGS="$save_CFLAGS"
++        # More AIX lossage: must compile with xlc_r or cc_r
++	if test x"$GCC" != xyes; then
++          AC_CHECK_PROGS(PTHREAD_CC, xlc_r cc_r, ${CC})
++        else
++          PTHREAD_CC=$CC
++	fi
++
++	# The next part tries to detect GCC inconsistency with -shared on some
++	# architectures and systems. The problem is that in certain
++	# configurations, when -shared is specified, GCC "forgets" to
++	# internally use various flags which are still necessary.
++	
++	#
++	# Prepare the flags
++	#
++	save_CFLAGS="$CFLAGS"
++	save_LIBS="$LIBS"
++	save_CC="$CC"
++	
++	# Try with the flags determined by the earlier checks.
++	#
++	# -Wl,-z,defs forces link-time symbol resolution, so that the
++	# linking checks with -shared actually have any value
++	#
++	# FIXME: -fPIC is required for -shared on many architectures,
++	# so we specify it here, but the right way would probably be to
++	# properly detect whether it is actually required.
++	CFLAGS="-shared -fPIC -Wl,-z,defs $CFLAGS $PTHREAD_CFLAGS"
++	LIBS="$PTHREAD_LIBS $LIBS"
++	CC="$PTHREAD_CC"
++	
++	# In order not to create several levels of indentation, we test
++	# the value of "$done" until we find the cure or run out of ideas.
++	done="no"
++	
++	# First, make sure the CFLAGS we added are actually accepted by our
++	# compiler.  If not (and OS X's ld, for instance, does not accept -z),
++	# then we can't do this test.
++	if test x"$done" = xno; then
++	   AC_MSG_CHECKING([whether to check for GCC pthread/shared inconsistencies])
++	   AC_TRY_LINK(,, , [done=yes])
++	
++	   if test "x$done" = xyes ; then
++	      AC_MSG_RESULT([no])
++	   else
++	      AC_MSG_RESULT([yes])
++	   fi
++	fi
++	
++	if test x"$done" = xno; then
++	   AC_MSG_CHECKING([whether -pthread is sufficient with -shared])
++	   AC_TRY_LINK([#include <pthread.h>],
++	      [pthread_t th; pthread_join(th, 0);
++	      pthread_attr_init(0); pthread_cleanup_push(0, 0);
++	      pthread_create(0,0,0,0); pthread_cleanup_pop(0); ],
++	      [done=yes])
++	   
++	   if test "x$done" = xyes; then
++	      AC_MSG_RESULT([yes])
++	   else
++	      AC_MSG_RESULT([no])
++	   fi
++	fi
++	
++	#
++	# Linux gcc on some architectures such as mips/mipsel forgets
++	# about -lpthread
++	#
++	if test x"$done" = xno; then
++	   AC_MSG_CHECKING([whether -lpthread fixes that])
++	   LIBS="-lpthread $PTHREAD_LIBS $save_LIBS"
++	   AC_TRY_LINK([#include <pthread.h>],
++	      [pthread_t th; pthread_join(th, 0);
++	      pthread_attr_init(0); pthread_cleanup_push(0, 0);
++	      pthread_create(0,0,0,0); pthread_cleanup_pop(0); ],
++	      [done=yes])
++	
++	   if test "x$done" = xyes; then
++	      AC_MSG_RESULT([yes])
++	      PTHREAD_LIBS="-lpthread $PTHREAD_LIBS"
++	   else
++	      AC_MSG_RESULT([no])
++	   fi
++	fi
++	#
++	# FreeBSD 4.10 gcc forgets to use -lc_r instead of -lc
++	#
++	if test x"$done" = xno; then
++	   AC_MSG_CHECKING([whether -lc_r fixes that])
++	   LIBS="-lc_r $PTHREAD_LIBS $save_LIBS"
++	   AC_TRY_LINK([#include <pthread.h>],
++	       [pthread_t th; pthread_join(th, 0);
++	        pthread_attr_init(0); pthread_cleanup_push(0, 0);
++	        pthread_create(0,0,0,0); pthread_cleanup_pop(0); ],
++	       [done=yes])
++	
++	   if test "x$done" = xyes; then
++	      AC_MSG_RESULT([yes])
++	      PTHREAD_LIBS="-lc_r $PTHREAD_LIBS"
++	   else
++	      AC_MSG_RESULT([no])
++	   fi
++	fi
++	if test x"$done" = xno; then
++	   # OK, we have run out of ideas
++	   AC_MSG_WARN([Impossible to determine how to use pthreads with shared libraries])
++	
++	   # so it's not safe to assume that we may use pthreads
++	   acx_pthread_ok=no
++	fi
++	
++	CFLAGS="$save_CFLAGS"
++	LIBS="$save_LIBS"
++	CC="$save_CC"
++else
++        PTHREAD_CC="$CC"
++fi
++
++AC_SUBST(PTHREAD_LIBS)
++AC_SUBST(PTHREAD_CFLAGS)
++AC_SUBST(PTHREAD_CC)
++
++# Finally, execute ACTION-IF-FOUND/ACTION-IF-NOT-FOUND:
++if test x"$acx_pthread_ok" = xyes; then
++        ifelse([$1],,AC_DEFINE(HAVE_PTHREAD,1,[Define if you have POSIX threads libraries and header files.]),[$1])
++        :
++else
++        acx_pthread_ok=no
++        $2
++fi
++AC_LANG_RESTORE
++])dnl ACX_PTHREAD
+diff --git a/configure.ac b/configure.ac
+index d268d5d..90bb3bc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1,4 +1,4 @@
+-m4_include(gtest/m4/acx_pthread.m4)
++m4_include(acx_pthread.m4)
+ 
+ AC_INIT([Google C++ Mocking Framework],
+         [1.7.0],
+-- 
+2.5.0
+
diff --git a/package/gmock/Config.in b/package/gmock/Config.in
index ec3eb92..19c1cf1 100644
--- a/package/gmock/Config.in
+++ b/package/gmock/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_GMOCK
 	    * works on Linux, Mac OS X, Windows, Windows Mobile, minGW, and
 	      Symbian.
 
-	    http://code.google.com/p/googlemock/
+	  https://github.com/google/googletest
 
 	  There are both host and target packages. The target one has include
 	  files required to compile the tests and the static libraries required
diff --git a/package/gmock/gmock.hash b/package/gmock/gmock.hash
index 2b71739..21b776a 100644
--- a/package/gmock/gmock.hash
+++ b/package/gmock/gmock.hash
@@ -1,2 +1,2 @@
-# Locally computed
-sha256 26fcbb5925b74ad5fc8c26b0495dfc96353f4d553492eb97e85a8a6d2f43095b  gmock-1.7.0.zip
+# Locally computed:
+sha256	604a6ded96ce29fb9b899cfe3ce33c2eedc7c3f9ff88d8afef338bcbad4c4108	gmock-1.7.0.tar.gz
diff --git a/package/gmock/gmock.mk b/package/gmock/gmock.mk
index a0351d0..7860146 100644
--- a/package/gmock/gmock.mk
+++ b/package/gmock/gmock.mk
@@ -6,13 +6,17 @@
 
 # Make sure this remains the same version as the gtest one
 GMOCK_VERSION = 1.7.0
-GMOCK_SOURCE = gmock-$(GMOCK_VERSION).zip
-GMOCK_SITE = http://googlemock.googlecode.com/files
+
+# We must use a commit id because there is no version tag for GMock 1.7.0 on GitHub.
+GMOCK_VERSION_COMMIT = 35877b7967315f34fb77edd5077e3bc59eba4072
+GMOCK_SITE = $(call github,google,googletest,$(GMOCK_VERSION_COMMIT))
+
 GMOCK_INSTALL_STAGING = YES
 GMOCK_INSTALL_TARGET = NO
 GMOCK_LICENSE = BSD-3c
 GMOCK_LICENSE_FILES = LICENSE
 GMOCK_DEPENDENCIES = gtest host-gmock
+GMOCK_AUTORECONF = YES
 
 # GMock 1.7.0 relies on Python 2.7 syntax which is NOT compatible with Python3.
 HOST_GMOCK_DEPENDENCIES = host-python
@@ -24,11 +28,7 @@ HOST_GMOCK_PYTHONPATH=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-pac
 #   "Google Mock can be used as a DLL, but the same DLL must contain Google
 #    Test as well.  See Google Test's README file for instructions on how to
 #    set up necessary compiler settings".
-GMOCK_CONF_OPTS = --enable-static --disable-shared
-
-define GMOCK_EXTRACT_CMDS
-	$(UNZIP) $(DL_DIR)/$(GMOCK_SOURCE) -d $(BUILD_DIR)
-endef
+GMOCK_CONF_OPTS = --enable-static --disable-shared --with-gtest=$(STAGING_DIR)/usr
 
 # We can't use the default rule for autotools-package staging because it fails
 # because it tries to rebuild/install gtest stuff and fails after this error:
@@ -41,15 +41,6 @@ define GMOCK_INSTALL_STAGING_CMDS
 	cp -rp $(@D)/include/gmock/* $(STAGING_DIR)/usr/include/gmock/
 endef
 
-# Unzipping inside $(@D) and moving everything from the created subdirectory is
-# required because unzipping directly in $(BUILD_DIR) would cause host-gmock to
-# overwrite the gmock subdir instead of unzipping in a host-gmock subdir.
-define HOST_GMOCK_EXTRACT_CMDS
-	$(UNZIP) $(DL_DIR)/$(GMOCK_SOURCE) -d $(@D)
-	mv $(@D)/gmock-$(GMOCK_VERSION)/* $(@D)
-	rmdir $(@D)/gmock-$(GMOCK_VERSION)
-endef
-
 define HOST_GMOCK_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/scripts/generator/gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen.py
 	ln -sf gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen
diff --git a/package/gtest/0001-force-use-python2.patch b/package/gtest/0001-force-use-python2.patch
new file mode 100644
index 0000000..a6ca333
--- /dev/null
+++ b/package/gtest/0001-force-use-python2.patch
@@ -0,0 +1,12 @@
+Force use of Python 2 even when Python 3 is the default Python interpreter.
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+
+--- ./scripts/fuse_gtest_files.py.orig	2013-09-18 14:48:30.000000000 -0300
++++ ./scripts/fuse_gtest_files.py	2015-07-22 15:42:53.291591205 -0300
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python2
+ #
+ # Copyright 2009, Google Inc.
+ # All rights reserved.
diff --git a/package/gtest/Config.in b/package/gtest/Config.in
index c07f13b..355b736 100644
--- a/package/gtest/Config.in
+++ b/package/gtest/Config.in
@@ -19,7 +19,7 @@ config BR2_PACKAGE_GTEST
 	  This package allows running testsuites on the target which
 	  might be advantageous in certain cases.
 
-	  http://code.google.com/p/googletest/
+	  https://github.com/google/googletest
 
 comment "gtest needs a toolchain w/ C++, wchar, threads"
 	depends on BR2_USE_MMU
diff --git a/package/gtest/gtest.hash b/package/gtest/gtest.hash
index 8ff79cb..76b4a0e 100644
--- a/package/gtest/gtest.hash
+++ b/package/gtest/gtest.hash
@@ -1,2 +1,2 @@
-# From http://code.google.com/p/googletest/downloads/detail?name=gtest-1.7.0.zip&can=2&q=
-sha1	f85f6d2481e2c6c4a18539e391aa4ea8ab0394af	gtest-1.7.0.zip
+# Locally computed:
+sha256	f73a6546fdf9fce9ff93a5015e0333a8af3062a152a9ad6bcb772c96687016cc	gtest-1.7.0.tar.gz
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index da08621..cc26042 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -6,8 +6,11 @@
 
 # Make sure this remains the same version as the gmock one
 GTEST_VERSION = 1.7.0
-GTEST_SOURCE = gtest-$(GTEST_VERSION).zip
-GTEST_SITE = http://googletest.googlecode.com/files
+
+# Get rid of the spurious "release-" prefix in the tag applied at GitHub.
+GTEST_VERSION_TAG = release-$(GTEST_VERSION)
+GTEST_SITE = $(call github,google,googletest,$(GTEST_VERSION_TAG))
+
 GTEST_INSTALL_STAGING = YES
 GTEST_INSTALL_TARGET = NO
 GTEST_LICENSE = BSD-3c
@@ -22,10 +25,6 @@ GTEST_LICENSE_FILES = LICENSE
 # the gtest sources.
 GTEST_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
 
-define GTEST_EXTRACT_CMDS
-	$(UNZIP) $(DL_DIR)/$(GTEST_SOURCE) -d $(BUILD_DIR)
-endef
-
 define GTEST_INSTALL_STAGING_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/libgtest.a $(STAGING_DIR)/usr/lib/libgtest.a
 	$(INSTALL) -D -m 0755 $(@D)/libgtest_main.a $(STAGING_DIR)/usr/lib/libgtest_main.a
-- 
2.5.0
