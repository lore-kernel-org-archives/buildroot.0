From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 01:18:11 +0100
Subject: [Buildroot] [PATCH 21/33] rrdtool: add python binding support
In-Reply-To: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1353543503-8952-22-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/rrdtool/Config.in                         |  8 +++++++
 package/rrdtool/rrdtool-fix-python-includes.patch | 29 +++++++++++++++++++++++
 package/rrdtool/rrdtool.mk                        | 19 +++++++++++++--
 3 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 package/rrdtool/rrdtool-fix-python-includes.patch

diff --git a/package/rrdtool/Config.in b/package/rrdtool/Config.in
index d315b57..ed3f71e 100644
--- a/package/rrdtool/Config.in
+++ b/package/rrdtool/Config.in
@@ -11,5 +11,13 @@ config BR2_PACKAGE_RRDTOOL
 
 	  http://oss.oetiker.ch/rrdtool/
 
+if BR2_PACKAGE_RRDTOOL
+
+config BR2_PACKAGE_RRDTOOL_PYTHON
+	bool "Python bindings"
+	depends on BR2_PACKAGE_PYTHON
+
+endif
+
 comment "rrdtool requires a toolchain with WCHAR support"
 	depends on !BR2_USE_WCHAR
diff --git a/package/rrdtool/rrdtool-fix-python-includes.patch b/package/rrdtool/rrdtool-fix-python-includes.patch
new file mode 100644
index 0000000..07ff3df
--- /dev/null
+++ b/package/rrdtool/rrdtool-fix-python-includes.patch
@@ -0,0 +1,29 @@
+Allow to override the python include directories.
+When cross-compiling python extensions, python headers must be taken from the
+staging directory, not the host one.
+
+This patch avoids to run into some weird, ununderstable error about LONG_BIT
+definition, especially when the build and the target machine have different
+bitwises.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+--- rrdtool-1.2.30.orig/acinclude.m4	2012-11-17 11:33:40.194321803 +0100
++++ rrdtool-1.2.30/acinclude.m4	2012-11-17 12:18:12.490326127 +0100
+@@ -467,9 +467,13 @@ AC_MSG_CHECKING(for headers required to
+ dnl deduce PYTHON_INCLUDES
+ py_prefix=`$PYTHON -c "import sys; print sys.prefix"`
+ py_exec_prefix=`$PYTHON -c "import sys; print sys.exec_prefix"`
+-PYTHON_INCLUDES="-I${py_prefix}/include/python${PYTHON_VERSION}"
+-if test "$py_prefix" != "$py_exec_prefix"; then
+-  PYTHON_INCLUDES="$PYTHON_INCLUDES -I${py_exec_prefix}/include/python${PYTHON_VERSION}"
++if test "x$am_cv_python_includes" = "x" ; then
++  PYTHON_INCLUDES="-I${py_prefix}/include/python${PYTHON_VERSION}"
++  if test "$py_prefix" != "$py_exec_prefix"; then
++    PYTHON_INCLUDES="$PYTHON_INCLUDES -I${py_exec_prefix}/include/python${PYTHON_VERSION}"
++  fi
++else
++  PYTHON_INCLUDES="-I${am_cv_python_includes}"
+ fi
+ AC_SUBST(PYTHON_INCLUDES)
+ dnl check if the headers exist:
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index 7521aba..8799a85 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -11,8 +11,23 @@ RRDTOOL_AUTORECONF = YES
 RRDTOOL_INSTALL_STAGING = YES
 RRDTOOL_CONF_ENV = rd_cv_ieee_works=yes rd_cv_null_realloc=nope \
 			ac_cv_func_mmap_fixed_mapped=yes
-RRDTOOL_CONF_OPT = --disable-perl --disable-python --disable-ruby \
-			--disable-tcl --program-transform-name=''
+RRDTOOL_CONF_OPT = --program-transform-name='' \
+			--disable-perl \
+			--disable-ruby \
+			--disable-tcl \
+
+ifneq ($(BR2_PACKAGE_RRDTOOL_PYTHON),)
+RRDTOOL_CONF_OPT += --enable-python
+RRDTOOL_CONF_ENV += \
+	am_cv_pathless_PYTHON=python \
+	ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python \
+	am_cv_python_platform=linux2 \
+	am_cv_python_includes=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
+RRDTOOL_DEPENDENCIES += python
+else
+RRDTOOL_CONF_OPT += --disable-python
+endif
+
 RRDTOOL_MAKE = $(MAKE1)
 
 define RRDTOOL_REMOVE_EXAMPLES
-- 
1.8.0
