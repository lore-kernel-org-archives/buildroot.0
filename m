From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2011 18:05:22 +0200
Subject: [Buildroot] [PATCH 1/2] python: fix build by adding some more
	patches
In-Reply-To: <cover.1316361915.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316361915.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f2b4925c219cf64cb2cda4a81889cd8418dd0690.1316361915.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The removal of -L flags from TARGET_LDFLAGS in
7e3e8ec040b06d6e2fb69e55c004f1ebc02c76d0 has trigerred some more
issues with Python, requiring some more hacky fixes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../python-2.7-004-no-host-headers-libs.patch      |   22 ++++-
 .../python-2.7-014-verbose-module-build.patch      |   19 +++++
 ...7-015-distutils-cross-compilation-support.patch |   84 ++++++++++++++++++++
 3 files changed, 120 insertions(+), 5 deletions(-)
 create mode 100644 package/python/python-2.7-014-verbose-module-build.patch
 create mode 100644 package/python/python-2.7-015-distutils-cross-compilation-support.patch

diff --git a/package/python/python-2.7-004-no-host-headers-libs.patch b/package/python/python-2.7-004-no-host-headers-libs.patch
index 033776d..aed8de6 100644
--- a/package/python/python-2.7-004-no-host-headers-libs.patch
+++ b/package/python/python-2.7-004-no-host-headers-libs.patch
@@ -26,7 +26,19 @@ Index: Python-2.7.1/setup.py
  
          # Add paths specified in the environment variables LDFLAGS and
          # CPPFLAGS for header and library files.
-@@ -388,17 +389,6 @@
+@@ -360,10 +361,7 @@
+         # directly since an inconsistently reproducible issue comes up where
+         # the environment variable is not set even though the value were passed
+         # into configure and stored in the Makefile (issue found on OS X 10.3).
+-        for env_var, arg_name, dir_list in (
+-                ('LDFLAGS', '-R', self.compiler.runtime_library_dirs),
+-                ('LDFLAGS', '-L', self.compiler.library_dirs),
+-                ('CPPFLAGS', '-I', self.compiler.include_dirs)):
++        for env_var, arg_name, dir_list in ():
+             env_val = sysconfig.get_config_var(env_var)
+             if env_val:
+                 # To prevent optparse from raising an exception about any
+@@ -388,17 +386,6 @@
                      for directory in reversed(options.dirs):
                          add_dir_to_list(dir_list, directory)
  
@@ -44,7 +56,7 @@ Index: Python-2.7.1/setup.py
          try:
              have_unicode = unicode
          except NameError:
-@@ -407,11 +397,16 @@
+@@ -407,11 +394,16 @@
          # lib_dirs and inc_dirs are used to search for files;
          # if a file is found in one of those directories, it can
          # be assumed that no additional -I,-L directives are needed.
@@ -66,7 +78,7 @@ Index: Python-2.7.1/setup.py
          exts = []
          missing = []
  
-@@ -844,6 +839,9 @@
+@@ -844,6 +836,9 @@
              db_inc_paths.append('/pkg/db-3.%d/include' % x)
              db_inc_paths.append('/opt/db-3.%d/include' % x)
  
@@ -76,7 +88,7 @@ Index: Python-2.7.1/setup.py
          # Add some common subdirectories for Sleepycat DB to the list,
          # based on the standard include directories. This way DB3/4 gets
          # picked up when it is installed in a non-standard prefix and
-@@ -996,6 +994,9 @@
+@@ -996,6 +991,9 @@
          MIN_SQLITE_VERSION = ".".join([str(x)
                                      for x in MIN_SQLITE_VERSION_NUMBER])
  
@@ -86,7 +98,7 @@ Index: Python-2.7.1/setup.py
          # Scan the default include directories before the SQLite specific
          # ones. This allows one to override the copy of sqlite on OSX,
          # where /usr/include contains an old version of sqlite.
-@@ -1095,6 +1096,8 @@
+@@ -1095,6 +1093,8 @@
          # the more recent berkeleydb's db.h file first in the include path
          # when attempting to compile and it will fail.
          f = "/usr/include/db.h"
diff --git a/package/python/python-2.7-014-verbose-module-build.patch b/package/python/python-2.7-014-verbose-module-build.patch
new file mode 100644
index 0000000..a5be60f
--- /dev/null
+++ b/package/python/python-2.7-014-verbose-module-build.patch
@@ -0,0 +1,19 @@
+Enables verbose output when building modules
+
+Patch borrowed from OpenBricks.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: Python-2.7.1/Makefile.pre.in
+===================================================================
+--- Python-2.7.1.orig/Makefile.pre.in
++++ Python-2.7.1/Makefile.pre.in
+@@ -408,7 +408,7 @@
+ # Build the shared modules
+ sharedmods: $(BUILDPYTHON)
+ 	@case $$MAKEFLAGS in \
+-	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" CONFIG_ARGS="$(CONFIG_ARGS)" $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py -q build;; \
++	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" CONFIG_ARGS="$(CONFIG_ARGS)" $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py build;; \
+ 	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' CROSS_COMPILING=@CROSS_COMPILING@ DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" CONFIG_ARGS="$(CONFIG_ARGS)" $(PYTHON_FOR_BUILD) -E $(srcdir)/setup.py build;; \
+ 	esac
+ 
diff --git a/package/python/python-2.7-015-distutils-cross-compilation-support.patch b/package/python/python-2.7-015-distutils-cross-compilation-support.patch
new file mode 100644
index 0000000..16cfd7f
--- /dev/null
+++ b/package/python/python-2.7-015-distutils-cross-compilation-support.patch
@@ -0,0 +1,84 @@
+Add some cross-compilation fixes to distutils
+
+Inspired by work done by Marc Kleine-Budde <mkl@pengutronix.de> in
+PTXdist.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Lib/distutils/sysconfig.py |    7 ++++---
+ 1 files changed, 4 insertions(+), 3 deletions(-)
+
+Index: Python-2.7.1/Lib/distutils/sysconfig.py
+===================================================================
+--- Python-2.7.1.orig/Lib/distutils/sysconfig.py
++++ Python-2.7.1/Lib/distutils/sysconfig.py
+@@ -19,13 +19,22 @@
+ from distutils.errors import DistutilsPlatformError
+ 
+ # These are needed in a couple of spots, so just compute them once.
+-PREFIX = os.path.normpath(sys.prefix)
+-EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
++EXECUTABLE_DIRNAME = os.path.dirname(os.path.realpath(sys.executable))
++if os.environ.get('CROSS_COMPILING') == 'yes':
++    _sysroot=os.environ.get('_python_sysroot')
++    PREFIX = os.path.normpath(_sysroot + os.environ.get('_python_prefix'))
++    EXEC_PREFIX = os.path.normpath(_sysroot + os.environ.get('_python_exec_prefix'))
++    if '_python_srcdir' in os.environ:
++        EXECUTABLE_DIRNAME = os.path.normpath(os.environ['_python_srcdir'])
++else:
++    PREFIX = os.path.normpath(sys.prefix)
++    EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
++
+ 
+ # Path to the base directory of the project. On Windows the binary may
+ # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
+ # it'll live in project/PCbuild/amd64.
+-project_base = os.path.dirname(os.path.abspath(sys.executable))
++project_base = EXECUTABLE_DIRNAME
+ if os.name == "nt" and "pcbuild" in project_base[-8:].lower():
+     project_base = os.path.abspath(os.path.join(project_base, os.path.pardir))
+ # PC/VS7.1
+@@ -74,7 +83,7 @@
+ 
+     if os.name == "posix":
+         if python_build:
+-            buildir = os.path.dirname(sys.executable)
++            buildir = EXECUTABLE_DIRNAME
+             if plat_specific:
+                 # python.h is located in the buildir
+                 inc_dir = buildir
+@@ -206,7 +215,7 @@
+ def get_makefile_filename():
+     """Return full pathname of installed Makefile from the Python build."""
+     if python_build:
+-        return os.path.join(os.path.dirname(sys.executable), "Makefile")
++        return os.path.join(EXECUTABLE_DIRNAME, "Makefile")
+     lib_dir = get_python_lib(plat_specific=1, standard_lib=1)
+     return os.path.join(lib_dir, "config", "Makefile")
+ 
+Index: Python-2.7.1/configure.in
+===================================================================
+--- Python-2.7.1.orig/configure.in
++++ Python-2.7.1/configure.in
+@@ -4424,6 +4424,21 @@
+ CROSS_COMPILING=$cross_compiling
+ AC_SUBST(CROSS_COMPILING)
+ 
++#
++# Cross compiling
++#
++# special RUNSHARED
++if test "$cross_compiling" = "yes"; then
++    RUNSHARED="\
++               CROSS_COMPILING=yes \
++               _python_cross_host=${ac_cv_host} \
++               _python_sysroot=\"\$(sysroot)\" \
++               _python_srcdir=\"\$(srcdir)\" \
++               _python_prefix=\"\$(prefix)\" \
++               _python_exec_prefix=\"\$(exec_prefix)\""
++fi
++
++
+ # generate output files
+ AC_CONFIG_FILES(Makefile.pre Modules/Setup.config Misc/python.pc)
+ AC_CONFIG_FILES([Modules/ld_so_aix], [chmod +x Modules/ld_so_aix])
-- 
1.7.4.1
