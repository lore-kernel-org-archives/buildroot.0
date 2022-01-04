Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0B0C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 16:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB9A960AB1;
	Tue,  4 Jan 2022 16:47:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aJv9wZbvFBWx; Tue,  4 Jan 2022 16:47:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE21E60BD6;
	Tue,  4 Jan 2022 16:47:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7EF2C1BF5EA
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 16:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DB23400FB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 16:46:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B7sjiQaKen2q for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 16:46:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B6B940113
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 16:46:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A29D682BC6; Tue,  4 Jan 2022 16:40:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 17:41:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5131f6f28e384eb9dca1b11f571536e38d3ee9d
X-Git-Newrev: 40a09b263486b95f000547860da451b32ad19174
X-Patchwork-Hint: ignore
Message-Id: <20220104164044.A29D682BC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libapparmor: fix build with python
 3.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=40a09b263486b95f000547860da451b32ad19174
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of python3 to version
3.10.1 in commit 25b1fc2898d68ddf2674b14c738045875fc5a2dc:

configure: error: cannot import Python module "distutils".
Please check your Python installation. The error was:
<string>:1: DeprecationWarning: The distutils package is deprecated and slated for removal in Python 3.12. Use setuptools or check PEP 632 for potential alternatives

Fixes:
 - http://autobuild.buildroot.org/results//f3e400cbb5b00fbd7f0cb421c993e46b64ec5ac5

_AUTORECONF was already set to YES even though it was no longer needed
since the patches were removed with the bump to 3.0.1 in 2cacda2591. So
just update the comment.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...lace-deprecated-distutils-with-setuptools.patch | 244 +++++++++++++++++++++
 package/libapparmor/libapparmor.mk                 |   4 +-
 2 files changed, 246 insertions(+), 2 deletions(-)

diff --git a/package/libapparmor/0001-replace-deprecated-distutils-with-setuptools.patch b/package/libapparmor/0001-replace-deprecated-distutils-with-setuptools.patch
new file mode 100644
index 0000000000..5aed31d0b5
--- /dev/null
+++ b/package/libapparmor/0001-replace-deprecated-distutils-with-setuptools.patch
@@ -0,0 +1,244 @@
+From 21e5a721ab2abe26bb12b9da7accc39d4fff9804 Mon Sep 17 00:00:00 2001
+From: Georgia Garcia <georgia.garcia@canonical.com>
+Date: Wed, 10 Nov 2021 19:50:35 +0000
+Subject: [PATCH] replace deprecated distutils with setuptools
+
+Adds python3 setuptools as a build dependency for libapparmor
+
+Fixes: https://gitlab.com/apparmor/apparmor/-/issues/202
+MR: https://gitlab.com/apparmor/apparmor/-/merge_requests/813
+Signed-off-by: Georgia Garcia <georgia.garcia@canonical.com>
+Acked-by: Christian Boltz <apparmor@cboltz.de>
+
+[Retrieved (and updated to remove changes on .gitlab-ci.yml and
+README.md) from:
+https://gitlab.com/apparmor/apparmor/-/commit/21e5a721ab2abe26bb12b9da7accc39d4fff9804]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ .gitignore                                    |  3 ++
+ .gitlab-ci.yml                                |  2 +-
+ libraries/libapparmor/m4/ac_python_devel.m4   | 36 +++++++++----------
+ libraries/libapparmor/swig/python/Makefile.am |  2 +-
+ libraries/libapparmor/swig/python/setup.py.in |  2 +-
+ .../libapparmor/swig/python/test/Makefile.am  |  2 +-
+ profiles/Makefile                             |  2 +-
+ utils/Makefile                                |  1 +
+ utils/python-tools-setup.py                   |  6 ++--
+ utils/test/Makefile                           |  2 +-
+ utils/test/README.md                          |  2 +-
+ 11 files changed, 32 insertions(+), 28 deletions(-)
+
+diff --git a/.gitignore b/.gitignore
+index 78a06fdf9..4782a351a 100644
+--- a/.gitignore
++++ b/.gitignore
+@@ -160,6 +160,7 @@ libraries/libapparmor/swig/perl/libapparmor_wrap.c
+ libraries/libapparmor/swig/perl/libapparmor_wrap.o
+ libraries/libapparmor/swig/perl/pm_to_blib
+ libraries/libapparmor/swig/python/LibAppArmor.py
++libraries/libapparmor/swig/python/LibAppArmor.egg-info/
+ libraries/libapparmor/swig/python/build/
+ libraries/libapparmor/swig/python/libapparmor_wrap.c
+ libraries/libapparmor/swig/python/Makefile
+@@ -204,6 +205,8 @@ utils/*.tmp
+ utils/po/*.mo
+ utils/apparmor/*.pyc
+ utils/apparmor/rule/*.pyc
++utils/apparmor.egg-info/
++utils/build/
+ utils/htmlcov/
+ utils/test/common_test.pyc
+ utils/test/.coverage
+diff --git a/libraries/libapparmor/m4/ac_python_devel.m4 b/libraries/libapparmor/m4/ac_python_devel.m4
+index 1da29d873..f21f70ce7 100644
+--- a/libraries/libapparmor/m4/ac_python_devel.m4
++++ b/libraries/libapparmor/m4/ac_python_devel.m4
+@@ -66,17 +66,17 @@ variable to configure. See ``configure --help'' for reference.
+         fi
+ 
+         #
+-        # Check if you have distutils, else fail
++        # Check if you have setuptools, else fail
+         #
+-        AC_MSG_CHECKING([for the distutils Python package])
+-        ac_distutils_result=`$PYTHON -c "import distutils" 2>&1`
+-        if test -z "$ac_distutils_result"; then
++        AC_MSG_CHECKING([for the setuptools Python package])
++        ac_setuptools_result=`$PYTHON -c "import setuptools" 2>&1`
++        if test -z "$ac_setuptools_result"; then
+                 AC_MSG_RESULT([yes])
+         else
+                 AC_MSG_RESULT([no])
+-                AC_MSG_ERROR([cannot import Python module "distutils".
++                AC_MSG_ERROR([cannot import Python module "setuptools".
+ Please check your Python installation. The error was:
+-$ac_distutils_result])
++$ac_setuptools_result])
+                 PYTHON_VERSION=""
+         fi
+ 
+@@ -88,8 +88,8 @@ $ac_distutils_result])
+                 PYTHON_CPPFLAGS=`$PYTHON_CONFIG --includes`
+         fi
+         if test -z "$PYTHON_CPPFLAGS"; then
+-                python_path=`$PYTHON -c "import sys; import distutils.sysconfig;\
+-sys.stdout.write('%s\n' % distutils.sysconfig.get_python_inc());"`
++                python_path=`$PYTHON -c "import sys; import sysconfig;\
++sys.stdout.write('%s\n' % sysconfig.get_path('include'));"`
+                 if test -n "${python_path}"; then
+                         python_path="-I$python_path"
+                 fi
+@@ -108,8 +108,8 @@ sys.stdout.write('%s\n' % distutils.sysconfig.get_python_inc());"`
+         if test -z "$PYTHON_LDFLAGS"; then
+                 # (makes two attempts to ensure we've got a version number
+                 # from the interpreter)
+-                py_version=`$PYTHON -c "import sys; from distutils.sysconfig import *; \
+-sys.stdout.write('%s\n' % ''.join(get_config_vars('VERSION')))"`
++                py_version=`$PYTHON -c "import sys; import sysconfig; \
++sys.stdout.write('%s\n' % ''.join(sysconfig.get_config_vars('VERSION')))"`
+                 if test "$py_version" == "[None]"; then
+                         if test -n "$PYTHON_VERSION"; then
+                                 py_version=$PYTHON_VERSION
+@@ -119,8 +119,8 @@ sys.stdout.write("%s\n" % sys.version[[:3]])"`
+                         fi
+                 fi
+ 
+-                PYTHON_LDFLAGS=`$PYTHON -c "import sys; from distutils.sysconfig import *; \
+-sys.stdout.write('-L' + get_python_lib(0,1) + ' -lpython\n')"`$py_version`$PYTHON -c \
++                PYTHON_LDFLAGS=`$PYTHON -c "import sys; import sysconfig; \
++sys.stdout.write('-L' + sysconfig.get_path('stdlib') + ' -lpython\n')"`$py_version`$PYTHON -c \
+ "import sys; sys.stdout.write('%s' % getattr(sys,'abiflags',''))"`
+         fi
+         AC_MSG_RESULT([$PYTHON_LDFLAGS])
+@@ -131,8 +131,8 @@ sys.stdout.write('-L' + get_python_lib(0,1) + ' -lpython\n')"`$py_version`$PYTHO
+         #
+         AC_MSG_CHECKING([for Python site-packages path])
+         if test -z "$PYTHON_SITE_PKG"; then
+-                PYTHON_SITE_PKG=`$PYTHON -c "import sys; import distutils.sysconfig; \
+-sys.stdout.write('%s\n' % distutils.sysconfig.get_python_lib(0,0));"`
++                PYTHON_SITE_PKG=`$PYTHON -c "import sys; import sysconfig; \
++sys.stdout.write('%s\n' % sysconfig.get_path('purelib'));"`
+         fi
+         AC_MSG_RESULT([$PYTHON_SITE_PKG])
+         AC_SUBST([PYTHON_SITE_PKG])
+@@ -146,8 +146,8 @@ sys.stdout.write('%s\n' % distutils.sysconfig.get_python_lib(0,0));"`
+                         PYTHON_EXTRA_LIBS=''
+         fi
+         if test -z "$PYTHON_EXTRA_LIBS"; then
+-           PYTHON_EXTRA_LIBS=`$PYTHON -c "import sys; import distutils.sysconfig; \
+-conf = distutils.sysconfig.get_config_var; \
++           PYTHON_EXTRA_LIBS=`$PYTHON -c "import sys; import sysconfig; \
++conf = sysconfig.get_config_var; \
+ sys.stdout.write('%s %s %s\n' % (conf('BLDLIBRARY'), conf('LOCALMODLIBS'), conf('LIBS')))"`
+         fi
+         AC_MSG_RESULT([$PYTHON_EXTRA_LIBS])
+@@ -162,8 +162,8 @@ sys.stdout.write('%s %s %s\n' % (conf('BLDLIBRARY'), conf('LOCALMODLIBS'), conf(
+                         PYTHON_EXTRA_LDFLAGS=''
+         fi
+         if test -z "$PYTHON_EXTRA_LDFLAGS"; then
+-                PYTHON_EXTRA_LDFLAGS=`$PYTHON -c "import sys; import distutils.sysconfig; \
+-conf = distutils.sysconfig.get_config_var; \
++                PYTHON_EXTRA_LDFLAGS=`$PYTHON -c "import sys; import sysconfig; \
++conf = sysconfig.get_config_var; \
+ sys.stdout.write('%s\n' % conf('LINKFORSHARED'))"`
+         fi
+         AC_MSG_RESULT([$PYTHON_EXTRA_LDFLAGS])
+diff --git a/libraries/libapparmor/swig/python/Makefile.am b/libraries/libapparmor/swig/python/Makefile.am
+index 04edff003..bf05fe0fc 100644
+--- a/libraries/libapparmor/swig/python/Makefile.am
++++ b/libraries/libapparmor/swig/python/Makefile.am
+@@ -21,7 +21,7 @@ install-exec-local:
+ 
+ clean-local:
+ 	if test -x "$(PYTHON)"; then $(PYTHON) setup.py clean; fi
+-	rm -rf build
++	rm -rf build LibAppArmor.egg-info
+ 	if test $(top_srcdir) != $(top_builddir) ; then rm -f libapparmor_wrap.c ; fi
+ 
+ endif
+diff --git a/libraries/libapparmor/swig/python/setup.py.in b/libraries/libapparmor/swig/python/setup.py.in
+index 32abd46b2..b23e40746 100644
+--- a/libraries/libapparmor/swig/python/setup.py.in
++++ b/libraries/libapparmor/swig/python/setup.py.in
+@@ -1,4 +1,4 @@
+-from distutils.core import setup, Extension
++from setuptools import setup, Extension
+ import string
+ 
+ setup(name          = 'LibAppArmor',
+diff --git a/libraries/libapparmor/swig/python/test/Makefile.am b/libraries/libapparmor/swig/python/test/Makefile.am
+index 7287819c9..9dccfdef6 100644
+--- a/libraries/libapparmor/swig/python/test/Makefile.am
++++ b/libraries/libapparmor/swig/python/test/Makefile.am
+@@ -11,7 +11,7 @@ test_python.py: test_python.py.in $(top_builddir)/config.status
+ CLEANFILES = test_python.py
+ 
+ # bah, how brittle is this?
+-PYTHON_DIST_BUILD_PATH = '$(builddir)/../build/$$($(PYTHON) -c "import distutils.util; import platform; print(\"lib.%s-%s\" %(distutils.util.get_platform(), platform.python_version()[:3]))")'
++PYTHON_DIST_BUILD_PATH = '$(builddir)/../build/$$($(PYTHON) -c "import sysconfig; print(\"lib.%s-%s\" %(sysconfig.get_platform(), sysconfig.get_python_version()))")'
+ 
+ TESTS	= test_python.py
+ TESTS_ENVIRONMENT = \
+diff --git a/profiles/Makefile b/profiles/Makefile
+index c471e58e8..0b7f2655d 100644
+--- a/profiles/Makefile
++++ b/profiles/Makefile
+@@ -41,7 +41,7 @@ ifdef USE_SYSTEM
+     LOGPROF?=aa-logprof
+ else
+     # PYTHON_DIST_BUILD_PATH based on libapparmor/swig/python/test/Makefile.am
+-    PYTHON_DIST_BUILD_PATH = ../libraries/libapparmor/swig/python/build/$$($(PYTHON) -c "import distutils.util; import platform; print(\"lib.%s-%s\" %(distutils.util.get_platform(), platform.python_version()[:3]))")
++    PYTHON_DIST_BUILD_PATH = ../libraries/libapparmor/swig/python/build/$$($(PYTHON) -c "import sysconfig; print(\"lib.%s-%s\" %(sysconfig.get_platform(), sysconfig.get_python_version()))")
+     LIBAPPARMOR_PATH=../libraries/libapparmor/src/.libs/
+     LD_LIBRARY_PATH=$(LIBAPPARMOR_PATH):$(PYTHON_DIST_BUILD_PATH)
+     PYTHONPATH=../utils/:$(PYTHON_DIST_BUILD_PATH)
+diff --git a/utils/Makefile b/utils/Makefile
+index 1f08f259a..91a15107b 100644
+--- a/utils/Makefile
++++ b/utils/Makefile
+@@ -72,6 +72,7 @@ clean: pod_clean
+ 	rm -rf staging/ build/
+ 	rm -f apparmor/*.pyc apparmor/rule/*.pyc
+ 	rm -rf apparmor/__pycache__/ apparmor/rule/__pycache__/
++	rm -rf apparmor.egg-info/
+ 
+ # ${CAPABILITIES} is defined in common/Make.rules
+ .PHONY: check_severity_db
+diff --git a/utils/python-tools-setup.py b/utils/python-tools-setup.py
+index 30ce0cb05..2cbde8fc1 100644
+--- a/utils/python-tools-setup.py
++++ b/utils/python-tools-setup.py
+@@ -20,14 +20,14 @@
+ # Note: --version=... must be the last argument to this script
+ #
+ 
+-from distutils.command.install import install as _install
+-from distutils.core import setup
++from setuptools.command.install import install as _install
++from setuptools import setup
+ import os
+ import shutil
+ import sys
+ 
+ class Install(_install, object):
+-    '''Override distutils to install the files where we want them.'''
++    '''Override setuptools to install the files where we want them.'''
+     def run(self):
+         # Now byte-compile everything
+         super(Install, self).run()
+diff --git a/utils/test/Makefile b/utils/test/Makefile
+index 90354aa50..9126bdd71 100644
+--- a/utils/test/Makefile
++++ b/utils/test/Makefile
+@@ -32,7 +32,7 @@ ifdef USE_SYSTEM
+     PARSER=
+ else
+     # PYTHON_DIST_BUILD_PATH based on libapparmor/swig/python/test/Makefile.am
+-    PYTHON_DIST_BUILD_PATH = ../../libraries/libapparmor/swig/python/build/$$($(PYTHON) -c "import distutils.util; import platform; print(\"lib.%s-%s\" %(distutils.util.get_platform(), platform.python_version()[:3]))")
++    PYTHON_DIST_BUILD_PATH = ../../libraries/libapparmor/swig/python/build/$$($(PYTHON) -c "import sysconfig; print(\"lib.%s-%s\" %(sysconfig.get_platform(), sysconfig.get_python_version()))")
+     LIBAPPARMOR_PATH=../../libraries/libapparmor/src/.libs/
+     LD_LIBRARY_PATH=$(LIBAPPARMOR_PATH):$(PYTHON_DIST_BUILD_PATH)
+     PYTHONPATH=..:$(PYTHON_DIST_BUILD_PATH)
+-- 
+GitLab
+
diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
index 0d5822a56d..f3d744e3e7 100644
--- a/package/libapparmor/libapparmor.mk
+++ b/package/libapparmor/libapparmor.mk
@@ -16,7 +16,7 @@ LIBAPPARMOR_DEPENDENCIES = host-bison host-flex host-pkgconf
 LIBAPPARMOR_SUBDIR = libraries/libapparmor
 LIBAPPARMOR_INSTALL_STAGING = YES
 
-# Patches 0001 and 0002 touch Makefile.am and an m4 file
+# Patch 0001 touches Makefile.am and m4 files
 LIBAPPARMOR_AUTORECONF = YES
 
 # Most AppArmor tools will want to link to the static lib.
@@ -28,7 +28,7 @@ LIBAPPARMOR_CONF_OPTS = \
 	--disable-man-pages
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-LIBAPPARMOR_DEPENDENCIES += host-python3 host-swig python3
+LIBAPPARMOR_DEPENDENCIES += host-python3 host-python3-setuptools host-swig python3
 LIBAPPARMOR_CONF_OPTS += \
 	--with-python \
 	PYTHON=$(HOST_DIR)/usr/bin/python3 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
