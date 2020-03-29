From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2020 16:01:43 +0200
Subject: [Buildroot] [PATCH 7/9 v5] package/libapparmor: enable python
 bindings
In-Reply-To: <cover.1585490494.git.yann.morin.1998@free.fr>
References: <cover.1585490494.git.yann.morin.1998@free.fr>
Message-ID: <0283e3de1555af272d80a93d9f5f31ea88278376.1585490494.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[yann.morin.1998 at free.fr: split off into its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...el-fixing-for-crosscompiling-environ.patch | 96 +++++++++++++++++++
 ...ng-setup.py-call-when-crosscompiling.patch | 30 ++++++
 package/libapparmor/libapparmor.mk            | 17 +++-
 3 files changed, 141 insertions(+), 2 deletions(-)
 create mode 100644 package/libapparmor/0001-m4-ac_python_devel-fixing-for-crosscompiling-environ.patch
 create mode 100644 package/libapparmor/0002-libapparmor-fixing-setup.py-call-when-crosscompiling.patch

diff --git a/package/libapparmor/0001-m4-ac_python_devel-fixing-for-crosscompiling-environ.patch b/package/libapparmor/0001-m4-ac_python_devel-fixing-for-crosscompiling-environ.patch
new file mode 100644
index 0000000000..7b902d5970
--- /dev/null
+++ b/package/libapparmor/0001-m4-ac_python_devel-fixing-for-crosscompiling-environ.patch
@@ -0,0 +1,96 @@
+From 235ce271f3fee53b918317ebb73a47b3c6a7ae03 Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo@amarulasolutions.com>
+Date: Tue, 24 Mar 2020 22:53:37 +0100
+Subject: [PATCH] m4: ac_python_devel: fixing for crosscompiling environments
+
+In a crosscompiling environment it's common to have a python executable
+running for the host system with a python-config reporting the host
+configuration and a second python-config reporting the target configuration.
+In such cases, relying on the default oython-config is wrong and breaks
+the cross compilation.
+
+This patch adds a PYTHON_CONFIG variable that can be pointed to the second
+python-config and fixes the rest of the m4 accordingly.
+
+Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
+---
+ libraries/libapparmor/m4/ac_python_devel.m4 | 25 ++++++++++++++++-----
+ 1 file changed, 19 insertions(+), 6 deletions(-)
+
+diff --git a/libraries/libapparmor/m4/ac_python_devel.m4 b/libraries/libapparmor/m4/ac_python_devel.m4
+index 2ea7dc77..6454e2d8 100644
+--- a/libraries/libapparmor/m4/ac_python_devel.m4
++++ b/libraries/libapparmor/m4/ac_python_devel.m4
+@@ -13,6 +13,11 @@ AC_DEFUN([AC_PYTHON_DEVEL],[
+            PYTHON_VERSION=""
+         fi
+ 
++        AC_PATH_PROG([PYTHON_CONFIG],[`basename [$PYTHON]-config`])
++        if test -z "$PYTHON_CONFIG"; then
++           AC_MSG_ERROR([Cannot find python$PYTHON_VERSION-config in your system path])
++        fi
++
+         #
+         # Check for a version of Python >= 2.1.0
+         #
+@@ -79,8 +84,8 @@ $ac_distutils_result])
+         # Check for Python include path
+         #
+         AC_MSG_CHECKING([for Python include path])
+-        if type $PYTHON-config; then
+-                PYTHON_CPPFLAGS=`$PYTHON-config --includes`
++        if type $PYTHON_CONFIG; then
++                PYTHON_CPPFLAGS=`$PYTHON_CONFIG --includes`
+         fi
+         if test -z "$PYTHON_CPPFLAGS"; then
+                 python_path=`$PYTHON -c "import sys; import distutils.sysconfig;\
+@@ -97,8 +102,8 @@ sys.stdout.write('%s\n' % distutils.sysconfig.get_python_inc());"`
+         # Check for Python library path
+         #
+         AC_MSG_CHECKING([for Python library path])
+-        if type $PYTHON-config; then
+-                PYTHON_LDFLAGS=`$PYTHON-config --ldflags`
++        if type $PYTHON_CONFIG; then
++                PYTHON_LDFLAGS=`$PYTHON_CONFIG --ldflags`
+         fi
+         if test -z "$PYTHON_LDFLAGS"; then
+                 # (makes two attempts to ensure we've got a version number
+@@ -136,10 +141,14 @@ sys.stdout.write('%s\n' % distutils.sysconfig.get_python_lib(0,0));"`
+         # libraries which must be linked in when embedding
+         #
+         AC_MSG_CHECKING(python extra libraries)
++        if type $PYTHON_CONFIG; then
++                PYTHON_EXTRA_LIBS=`$PYTHON_CONFIG --libs --embed` || \
++                        PYTHON_EXTRA_LIBS=''
++        fi
+         if test -z "$PYTHON_EXTRA_LIBS"; then
+            PYTHON_EXTRA_LIBS=`$PYTHON -c "import sys; import distutils.sysconfig; \
+ conf = distutils.sysconfig.get_config_var; \
+-sys.stdout.write('%s %s\n' % (conf('LOCALMODLIBS'), conf('LIBS')))"`
++sys.stdout.write('%s %s %s\n' % (conf('BLDLIBRARY'), conf('LOCALMODLIBS'), conf('LIBS')))"`
+         fi
+         AC_MSG_RESULT([$PYTHON_EXTRA_LIBS])
+         AC_SUBST(PYTHON_EXTRA_LIBS)
+@@ -148,6 +157,10 @@ sys.stdout.write('%s %s\n' % (conf('LOCALMODLIBS'), conf('LIBS')))"`
+         # linking flags needed when embedding
+         #
+         AC_MSG_CHECKING(python extra linking flags)
++        if type $PYTHON_CONFIG; then
++                PYTHON_EXTRA_LDFLAGS=`$PYTHON_CONFIG --ldflags --embed` || \
++                        PYTHON_EXTRA_LDFLAGS=''
++        fi
+         if test -z "$PYTHON_EXTRA_LDFLAGS"; then
+                 PYTHON_EXTRA_LDFLAGS=`$PYTHON -c "import sys; import distutils.sysconfig; \
+ conf = distutils.sysconfig.get_config_var; \
+@@ -164,7 +177,7 @@ sys.stdout.write('%s\n' % conf('LINKFORSHARED'))"`
+         # save current global flags
+         ac_save_LIBS="$LIBS"
+         ac_save_CPPFLAGS="$CPPFLAGS"
+-        LIBS="$ac_save_LIBS $PYTHON_LDFLAGS"
++        LIBS="$ac_save_LIBS $PYTHON_EXTRA_LIBS $PYTHON_LDFLAGS"
+         CPPFLAGS="$ac_save_CPPFLAGS $PYTHON_CPPFLAGS"
+         AC_TRY_LINK([
+                 #include <Python.h>
+-- 
+2.17.1
+
diff --git a/package/libapparmor/0002-libapparmor-fixing-setup.py-call-when-crosscompiling.patch b/package/libapparmor/0002-libapparmor-fixing-setup.py-call-when-crosscompiling.patch
new file mode 100644
index 0000000000..8d6ca86e47
--- /dev/null
+++ b/package/libapparmor/0002-libapparmor-fixing-setup.py-call-when-crosscompiling.patch
@@ -0,0 +1,30 @@
+From cf61d1257b9a5f12fdf6f4dd6a2746f77b23a8a0 Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo@amarulasolutions.com>
+Date: Tue, 24 Mar 2020 23:02:08 +0100
+Subject: [PATCH] libapparmor: fixing setup.py call when crosscompiling
+
+When crosscompiling, setupy.py should be called passing the settings
+discovered by ac_python_devel.m4 and not using the default system
+settings.
+
+Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
+---
+ libraries/libapparmor/swig/python/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libraries/libapparmor/swig/python/Makefile.am b/libraries/libapparmor/swig/python/Makefile.am
+index 421acba9..6c60181e 100644
+--- a/libraries/libapparmor/swig/python/Makefile.am
++++ b/libraries/libapparmor/swig/python/Makefile.am
+@@ -11,7 +11,7 @@ MOSTLYCLEANFILES=libapparmor_wrap.c LibAppArmor.py
+ 
+ all-local: libapparmor_wrap.c setup.py
+ 	if test ! -f libapparmor_wrap.c; then cp $(srcdir)/libapparmor_wrap.c . ; fi
+-	$(PYTHON) setup.py build
++	CC="$(CC)" CFLAGS="$(PYTHON_CPPFLAGS)" LDSHARED="$(CC) -shared" LDFLAGS="$(PYTHON_LDFLAGS)" $(PYTHON) setup.py build
+ 
+ install-exec-local:
+ 	$(PYTHON) setup.py install --root="/$(DESTDIR)" --prefix="$(prefix)"
+-- 
+2.17.1
+
diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
index 8173d138d6..4d6bb6d82b 100644
--- a/package/libapparmor/libapparmor.mk
+++ b/package/libapparmor/libapparmor.mk
@@ -16,13 +16,26 @@ LIBAPPARMOR_DEPENDENCIES = host-bison host-flex host-pkgconf
 LIBAPPARMOR_SUBDIR = libraries/libapparmor
 LIBAPPARMOR_INSTALL_STAGING = YES
 
+# Patches 0001 and 0002 touch Makefile.am and an m4 file
+LIBAPPARMOR_AUTORECONF = YES
+
 # Most AppArmor tools will want to link to the static lib.
 # ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
 # provided by autoconf relies on wchar_t.
 LIBAPPARMOR_CONF_OPTS = \
 	ac_cv_prog_cc_c99=-std=gnu99 \
 	--enable-static \
-	--enable-man-pages=no \
-	--without-python
+	--enable-man-pages=no
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LIBAPPARMOR_DEPENDENCIES += host-python3 host-swig python3
+LIBAPPARMOR_CONF_OPTS += \
+	--with-python \
+	PYTHON=$(HOST_DIR)/usr/bin/python3 \
+	PYTHON_CONFIG=$(STAGING_DIR)/usr/bin/python3-config \
+	SWIG=$(SWIG)
+else
+LIBAPPARMOR_CONF_OPTS += --without-python
+endif
 
 $(eval $(autotools-package))
-- 
2.20.1
