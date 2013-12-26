From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 23:31:32 +0100
Subject: [Buildroot] [git commit] python: fix invalid library paths leaking
	into the build, and other improvements
Message-ID: <20131226223144.C00B99C1F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b07b9d181ddea2282d8f6018b2f8b808439f67ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit improves the cross-compilation patches we have on top of
Python, to fix the problem of host library paths leaking into the
build of target modules, as seen at:

 http://autobuild.buildroot.org/results/fcc/fccd7e08cd9d4713eb4208097dd48c5ab25749bc/build-end.log
 http://autobuild.buildroot.org/results/0bd/0bda780bf4b759b12edec26ac20b88cde617db4d/build-end.log

To do so, it ensures that the right python2.7/config/Makefile is used
when building target modules, and adjusts at runtime the paths read
from this Makefile if we are cross-compiling.

In addition, it installs the pgen program into the host directory, and
points the target python build to use python and pgen from $(HOST_DIR)
instead of from the host python source directory, which looks cleaner.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-python.mk                              |    7 ++-
 ...7-015-distutils-cross-compilation-support.patch |   73 +++++++++++++++----
 package/python/python.mk                           |   28 ++++----
 3 files changed, 75 insertions(+), 33 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 5f137d5..79e6bcf 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -29,7 +29,6 @@ PKG_PYTHON_DISTUTILS_ENV = \
 	LDSHARED="$(TARGET_CROSS)gcc -shared" \
 	CROSS_COMPILING=yes \
 	_python_sysroot=$(STAGING_DIR) \
-	_python_srcdir=$(PYTHON_DIR) \
 	_python_prefix=/usr \
 	_python_exec_prefix=/usr
 
@@ -50,7 +49,11 @@ HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPT = \
 PKG_PYTHON_SETUPTOOLS_ENV = \
 	PATH="$(TARGET_PATH)" \
 	PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
-	PYTHONXCPREFIX="$(STAGING_DIR)/usr/"
+	PYTHONXCPREFIX="$(STAGING_DIR)/usr/" \
+	CROSS_COMPILING=yes \
+	_python_sysroot=$(STAGING_DIR) \
+	_python_prefix=/usr \
+	_python_exec_prefix=/usr
 
 PKG_PYTHON_SETUPTOOLS_INSTALL_OPT = \
 	--prefix=$(TARGET_DIR)/usr \
diff --git a/package/python/python-2.7-015-distutils-cross-compilation-support.patch b/package/python/python-2.7-015-distutils-cross-compilation-support.patch
index 8304091..7fd404e 100644
--- a/package/python/python-2.7-015-distutils-cross-compilation-support.patch
+++ b/package/python/python-2.7-015-distutils-cross-compilation-support.patch
@@ -8,27 +8,44 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  Lib/distutils/sysconfig.py |    7 ++++---
  1 files changed, 4 insertions(+), 3 deletions(-)
 
-Index: Python-2.7.2/Lib/distutils/sysconfig.py
+Index: b/Lib/distutils/sysconfig.py
 ===================================================================
---- Python-2.7.2.orig/Lib/distutils/sysconfig.py
-+++ Python-2.7.2/Lib/distutils/sysconfig.py
-@@ -19,13 +19,22 @@
+--- a/Lib/distutils/sysconfig.py
++++ b/Lib/distutils/sysconfig.py
+@@ -18,14 +18,38 @@
+ 
  from distutils.errors import DistutilsPlatformError
  
- # These are needed in a couple of spots, so just compute them once.
+-# These are needed in a couple of spots, so just compute them once.
 -PREFIX = os.path.normpath(sys.prefix)
 -EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
-+EXECUTABLE_DIRNAME = os.path.dirname(os.path.realpath(sys.executable))
 +if os.environ.get('CROSS_COMPILING') == 'yes':
 +    _sysroot=os.environ.get('_python_sysroot')
 +    PREFIX = os.path.normpath(_sysroot + os.environ.get('_python_prefix'))
 +    EXEC_PREFIX = os.path.normpath(_sysroot + os.environ.get('_python_exec_prefix'))
-+    if '_python_srcdir' in os.environ:
-+        EXECUTABLE_DIRNAME = os.path.normpath(os.environ['_python_srcdir'])
++    # In the cross-compilation case, we have two cases:
++    #
++    #  1/ We're currently cross-compiling Python itself. In this case,
++    #  EXECUTABLE_DIRNAME should point to the source directory of the
++    #  target Python, so that the rest of the code, especially the
++    #  _python_build() function will properly understand that we are
++    #  building Python itself. In this case, _python_srcdir is
++    #  defined.
++    #
++    #  2/ We're currently cross-compiling third party Python
++    #  modules. In this case, EXECUTABLE_DIRNAME should point to where
++    #  the target python executable is installed in the sysroot, so
++    #  that the proper Makefile is going to be read. In this case,
++    #  _python_srcdir is not defined.
++    #
++    if os.environ.get('_python_srcdir') is not None:
++        EXECUTABLE_DIRNAME = os.environ.get('_python_srcdir')
++    else:
++        EXECUTABLE_DIRNAME = os.path.join(_sysroot, "usr/bin")
 +else:
 +    PREFIX = os.path.normpath(sys.prefix)
 +    EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
-+
++    EXECUTABLE_DIRNAME = os.path.dirname(os.path.realpath(sys.executable))
  
  # Path to the base directory of the project. On Windows the binary may
  # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
@@ -38,7 +55,7 @@ Index: Python-2.7.2/Lib/distutils/sysconfig.py
  if os.name == "nt" and "pcbuild" in project_base[-8:].lower():
      project_base = os.path.abspath(os.path.join(project_base, os.path.pardir))
  # PC/VS7.1
-@@ -74,7 +83,7 @@
+@@ -74,7 +98,7 @@
  
      if os.name == "posix":
          if python_build:
@@ -47,7 +64,7 @@ Index: Python-2.7.2/Lib/distutils/sysconfig.py
              if plat_specific:
                  # python.h is located in the buildir
                  inc_dir = buildir
-@@ -206,7 +215,7 @@
+@@ -245,7 +269,7 @@
  def get_makefile_filename():
      """Return full pathname of installed Makefile from the Python build."""
      if python_build:
@@ -56,11 +73,23 @@ Index: Python-2.7.2/Lib/distutils/sysconfig.py
      lib_dir = get_python_lib(plat_specific=1, standard_lib=1)
      return os.path.join(lib_dir, "config", "Makefile")
  
-Index: Python-2.7.2/configure.in
+@@ -311,6 +335,11 @@
+             # `$$' is a literal `$' in make
+             tmpv = v.replace('$$', '')
+ 
++            # Adjust prefix and exec_prefix when we're cross compiling
++            if os.environ.get('CROSS_COMPILING') == "yes":
++                if n == "prefix" or n == "exec_prefix":
++                    v = _sysroot + v
++
+             if "$" in tmpv:
+                 notdone[n] = v
+             else:
+Index: b/configure.in
 ===================================================================
---- Python-2.7.2.orig/configure.in
-+++ Python-2.7.2/configure.in
-@@ -4328,6 +4328,21 @@
+--- a/configure.in
++++ b/configure.in
+@@ -4342,6 +4342,20 @@
  CROSS_COMPILING=$cross_compiling
  AC_SUBST(CROSS_COMPILING)
  
@@ -72,7 +101,6 @@ Index: Python-2.7.2/configure.in
 +    RUNSHARED="\
 +               CROSS_COMPILING=yes \
 +               _python_cross_host=${ac_cv_host} \
-+               _python_sysroot=\"\$(sysroot)\" \
 +               _python_srcdir=\"\$(srcdir)\" \
 +               _python_prefix=\"\$(prefix)\" \
 +               _python_exec_prefix=\"\$(exec_prefix)\""
@@ -82,3 +110,16 @@ Index: Python-2.7.2/configure.in
  # generate output files
  AC_CONFIG_FILES(Makefile.pre Modules/Setup.config Misc/python.pc)
  AC_CONFIG_FILES([Modules/ld_so_aix], [chmod +x Modules/ld_so_aix])
+Index: b/Lib/distutils/command/build_ext.py
+===================================================================
+--- a/Lib/distutils/command/build_ext.py
++++ b/Lib/distutils/command/build_ext.py
+@@ -237,7 +237,7 @@
+         if ((sys.platform.startswith('linux') or sys.platform.startswith('gnu')
+              or sys.platform.startswith('sunos'))
+             and sysconfig.get_config_var('Py_ENABLE_SHARED')):
+-            if sys.executable.startswith(os.path.join(sys.exec_prefix, "bin")):
++            if not sysconfig.python_build:
+                 # building third party extensions
+                 self.library_dirs.append(sysconfig.get_config_var('LIBDIR'))
+             else:
diff --git a/package/python/python.mk b/package/python/python.mk
index 6a6aaac..bc42e8f 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -51,6 +51,12 @@ PYTHON_DEPENDENCIES  = host-python libffi
 
 HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
 
+define HOST_PYTHON_INSTALL_PGEN
+	$(INSTALL) -m0755 -D $(@D)/Parser/pgen $(HOST_DIR)/usr/bin/python-pgen
+endef
+
+HOST_PYTHON_POST_INSTALL_HOOKS += HOST_PYTHON_INSTALL_PGEN
+
 PYTHON_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON_READLINE),y)
@@ -113,10 +119,15 @@ PYTHON_DEPENDENCIES += openssl
 endif
 
 PYTHON_CONF_ENV += \
-	PYTHON_FOR_BUILD=$(HOST_PYTHON_DIR)/python \
-	PGEN_FOR_BUILD=$(HOST_PYTHON_DIR)/Parser/pgen \
+	PYTHON_FOR_BUILD=$(HOST_DIR)/usr/bin/python \
+	PGEN_FOR_BUILD=$(HOST_DIR)/usr/bin/python-pgen \
 	ac_cv_have_long_long_format=yes
 
+PYTHON_MAKE_ENV += \
+	_python_sysroot=$(STAGING_DIR) \
+	PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/usr/include \
+	PYTHON_MODULES_LIB="$(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib"
+
 PYTHON_CONF_OPT += \
 	--without-cxx-main 	\
 	--without-doc-strings	\
@@ -129,19 +140,6 @@ PYTHON_CONF_OPT += \
 	--disable-nis		\
 	--disable-dbm
 
-PYTHON_MAKE_ENV = \
-	PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/usr/include \
-	PYTHON_MODULES_LIB="$(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib"
-
-# python distutils adds -L$LIBDIR when linking binary extensions, causing
-# trouble for cross compilation
-define PYTHON_FIXUP_LIBDIR
-	$(SED) 's|^LIBDIR=.*|LIBDIR= $(STAGING_DIR)/usr/lib|' \
-	   $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/config/Makefile
-endef
-
-PYTHON_POST_INSTALL_STAGING_HOOKS += PYTHON_FIXUP_LIBDIR
-
 #
 # Remove useless files. In the config/ directory, only the Makefile
 # and the pyconfig.h files are needed at runtime.
