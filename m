From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2011 18:05:23 +0200
Subject: [Buildroot] [PATCH 2/2] python: bump to 2.7.2
In-Reply-To: <cover.1316361915.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316361915.git.thomas.petazzoni@free-electrons.com>
Message-ID: <3f13b97000923b43c4aeb1977db948f9dd103f81.1316361915.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is mostly a mechanical bump, with a refresh of all the patches to
accomodate the offsets, and some minor conflict resolution.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../python/python-2.7-001-support-for-build.patch  |   43 ++++++++--------
 .../python-2.7-002-cross-compile-variable.patch    |   18 +++---
 ...on-2.7-003-no-import-when-cross-compiling.patch |    6 +-
 .../python-2.7-004-no-host-headers-libs.patch      |   22 ++++----
 .../python-2.7-005-staging-headers-libs.patch      |   10 ++--
 .../python/python-2.7-006-disable-extensions.patch |   26 +++++-----
 .../python-2.7-007-do-not-generate-pyo-files.patch |    8 ++--
 .../python/python-2.7-008-reread-environment.patch |   16 +++---
 package/python/python-2.7-009-python-symlink.patch |    8 ++--
 ...python-2.7-010-change-pyconfig-h-location.patch |   24 ++++----
 package/python/python-2.7-011-no-rpath.patch       |   14 +++---
 .../python-2.7-012-correct-32bit-64bit-check.patch |   10 ++--
 .../python-2.7-013-fix-linux-3-compilation.patch   |   22 ++++----
 .../python-2.7-014-verbose-module-build.patch      |    8 ++--
 ...7-015-distutils-cross-compilation-support.patch |   14 +++---
 .../python-2.7-100-optional-test-modules.patch     |   47 +++++++----------
 package/python/python-2.7-101-optional-pydoc.patch |   32 ++++++------
 package/python/python-2.7-102-optional-2to3.patch  |   55 +++++++++-----------
 .../python/python-2.7-103-optional-sqlite.patch    |    8 ++--
 package/python/python-2.7-104-optional-tk.patch    |   35 ++++++------
 .../python/python-2.7-105-optional-curses.patch    |   20 ++++----
 package/python/python-2.7-106-optional-expat.patch |   32 ++++++------
 .../python-2.7-107-optional-codecs-cjk.patch       |    8 ++--
 package/python/python-2.7-108-optional-nis.patch   |    8 ++--
 .../python-2.7-109-optional-unicodedata.patch      |    8 ++--
 package/python/python-2.7-110-optional-db.patch    |   37 +++++++------
 package/python/python-2.7-111-optional-ssl.patch   |    8 ++--
 package/python/python-2.7-112-optional-bzip2.patch |    8 ++--
 package/python/python-2.7-113-optional-zlib.patch  |    8 ++--
 package/python/python.mk                           |    2 +-
 30 files changed, 279 insertions(+), 286 deletions(-)

diff --git a/package/python/python-2.7-001-support-for-build.patch b/package/python/python-2.7-001-support-for-build.patch
index 2795e65..b0430a4 100644
--- a/package/python/python-2.7-001-support-for-build.patch
+++ b/package/python/python-2.7-001-support-for-build.patch
@@ -22,11 +22,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  configure.in    |   17 +++++++++++++++++
  2 files changed, 34 insertions(+), 15 deletions(-)
 
-Index: Python-2.7.1/Makefile.pre.in
+Index: Python-2.7.2/Makefile.pre.in
 ===================================================================
---- Python-2.7.1.orig/Makefile.pre.in
-+++ Python-2.7.1/Makefile.pre.in
-@@ -178,7 +178,8 @@
+--- Python-2.7.2.orig/Makefile.pre.in
++++ Python-2.7.2/Makefile.pre.in
+@@ -181,7 +181,8 @@
  UNICODE_OBJS=   @UNICODE_OBJS@
  
  PYTHON=		python$(EXE)
@@ -36,7 +36,7 @@ Index: Python-2.7.1/Makefile.pre.in
  
  # The task to run while instrument when building the profile-opt target
  PROFILE_TASK=	$(srcdir)/Tools/pybench/pybench.py -n 2 --with-gc --with-syscheck
-@@ -210,7 +211,8 @@
+@@ -213,7 +214,8 @@
  
  ##########################################################################
  # Parser
@@ -46,7 +46,7 @@ Index: Python-2.7.1/Makefile.pre.in
  
  POBJS=		\
  		Parser/acceler.o \
-@@ -404,8 +406,8 @@
+@@ -407,8 +409,8 @@
  # Build the shared modules
  sharedmods: $(BUILDPYTHON)
  	@case $$MAKEFLAGS in \
@@ -57,15 +57,16 @@ Index: Python-2.7.1/Makefile.pre.in
  	esac
  
  # Build static library
-@@ -536,12 +538,12 @@
- 	$(MAINCC) -c $(PY_CFLAGS) -o $@ $(srcdir)/Modules/python.c
+@@ -540,13 +542,13 @@
  
- 
--$(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
-+$(GRAMMAR_H) $(GRAMMAR_C): $(PGEN_FOR_BUILD) $(GRAMMAR_INPUT)
+ # Use a stamp file to prevent make -j invoking pgen twice
+ $(GRAMMAR_H) $(GRAMMAR_C): Parser/pgen.stamp
+-Parser/pgen.stamp: $(PGEN) $(GRAMMAR_INPUT)
++Parser/pgen.stamp: $(PGEN_FOR_BUILD) $(GRAMMAR_INPUT)
  		-@$(INSTALL) -d Include
--		-$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
-+		-$(PGEN_FOR_BUILD) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
+-		$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
++		$(PGEN_FOR_BUILD) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
+ 		-touch Parser/pgen.stamp
  
 -$(PGEN):	$(PGENOBJS)
 -		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
@@ -74,7 +75,7 @@ Index: Python-2.7.1/Makefile.pre.in
  
  Parser/grammar.o:	$(srcdir)/Parser/grammar.c \
  				$(srcdir)/Include/token.h \
-@@ -921,25 +923,25 @@
+@@ -926,25 +928,25 @@
  	done
  	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
  	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
@@ -105,7 +106,7 @@ Index: Python-2.7.1/Makefile.pre.in
  
  # Create the PLATDIR source directory, if one wasn't distributed..
  $(srcdir)/Lib/$(PLATDIR):
-@@ -1044,7 +1046,7 @@
+@@ -1049,7 +1051,7 @@
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: sharedmods
@@ -114,20 +115,20 @@ Index: Python-2.7.1/Makefile.pre.in
  	   	--prefix=$(prefix) \
  		--install-scripts=$(BINDIR) \
  		--install-platlib=$(DESTSHARED) \
-@@ -1183,7 +1185,7 @@
+@@ -1188,7 +1190,7 @@
  	find . -name '*.gc??' -exec rm -f {} ';'
  
  clobber: clean profile-removal
 -	-rm -f $(BUILDPYTHON) $(PGEN) $(LIBRARY) $(LDLIBRARY) $(DLLLIBRARY) \
 +	-rm -f $(BUILDPYTHON) $(BUILDPGEN) $(LIBRARY) $(LDLIBRARY) $(DLLLIBRARY) \
- 		tags TAGS \
+ 		tags TAGS Parser/pgen.stamp \
  		config.cache config.log pyconfig.h Modules/config.c
  	-rm -rf build platform
-Index: Python-2.7.1/configure.in
+Index: Python-2.7.2/configure.in
 ===================================================================
---- Python-2.7.1.orig/configure.in
-+++ Python-2.7.1/configure.in
-@@ -4291,6 +4291,23 @@
+--- Python-2.7.2.orig/configure.in
++++ Python-2.7.2/configure.in
+@@ -4305,6 +4305,23 @@
  done
  AC_MSG_RESULT(done)
  
diff --git a/package/python/python-2.7-002-cross-compile-variable.patch b/package/python/python-2.7-002-cross-compile-variable.patch
index 04b71b0..f91ee71 100644
--- a/package/python/python-2.7-002-cross-compile-variable.patch
+++ b/package/python/python-2.7-002-cross-compile-variable.patch
@@ -15,11 +15,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  configure.in    |    3 +++
  2 files changed, 6 insertions(+), 3 deletions(-)
 
-Index: Python-2.7.1/Makefile.pre.in
+Index: Python-2.7.2/Makefile.pre.in
 ===================================================================
---- Python-2.7.1.orig/Makefile.pre.in
-+++ Python-2.7.1/Makefile.pre.in
-@@ -406,8 +406,8 @@
+--- Python-2.7.2.orig/Makefile.pre.in
++++ Python-2.7.2/Makefile.pre.in
+@@ -409,8 +409,8 @@
  # Build the shared modules
  sharedmods: $(BUILDPYTHON)
  	@case $$MAKEFLAGS in \
@@ -30,7 +30,7 @@ Index: Python-2.7.1/Makefile.pre.in
  	esac
  
  # Build static library
-@@ -1046,7 +1046,7 @@
+@@ -1051,7 +1051,7 @@
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: sharedmods
@@ -39,11 +39,11 @@ Index: Python-2.7.1/Makefile.pre.in
  	   	--prefix=$(prefix) \
  		--install-scripts=$(BINDIR) \
  		--install-platlib=$(DESTSHARED) \
-Index: Python-2.7.1/configure.in
+Index: Python-2.7.2/configure.in
 ===================================================================
---- Python-2.7.1.orig/configure.in
-+++ Python-2.7.1/configure.in
-@@ -4308,6 +4308,9 @@
+--- Python-2.7.2.orig/configure.in
++++ Python-2.7.2/configure.in
+@@ -4322,6 +4322,9 @@
  AC_ARG_VAR(PYTHON_FOR_BUILD,[build system Python])
  AC_ARG_VAR(PGEN_FOR_BUILD,[build system Python pgen])
  
diff --git a/package/python/python-2.7-003-no-import-when-cross-compiling.patch b/package/python/python-2.7-003-no-import-when-cross-compiling.patch
index 162ba50..17d6702 100644
--- a/package/python/python-2.7-003-no-import-when-cross-compiling.patch
+++ b/package/python/python-2.7-003-no-import-when-cross-compiling.patch
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  setup.py |    4 ++++
  1 file changed, 4 insertions(+)
 
-Index: Python-2.7.1/setup.py
+Index: Python-2.7.2/setup.py
 ===================================================================
---- Python-2.7.1.orig/setup.py
-+++ Python-2.7.1/setup.py
+--- Python-2.7.2.orig/setup.py
++++ Python-2.7.2/setup.py
 @@ -304,6 +304,10 @@
              self.announce('WARNING: skipping import check for Cygwin-based "%s"'
                  % ext.name)
diff --git a/package/python/python-2.7-004-no-host-headers-libs.patch b/package/python/python-2.7-004-no-host-headers-libs.patch
index aed8de6..c0c528a 100644
--- a/package/python/python-2.7-004-no-host-headers-libs.patch
+++ b/package/python/python-2.7-004-no-host-headers-libs.patch
@@ -10,23 +10,25 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  setup.py |   39 +++++++++++++++++++++------------------
  1 file changed, 21 insertions(+), 18 deletions(-)
 
-Index: Python-2.7.1/setup.py
+Index: Python-2.7.2/setup.py
 ===================================================================
---- Python-2.7.1.orig/setup.py
-+++ Python-2.7.1/setup.py
-@@ -351,8 +351,9 @@
+--- Python-2.7.2.orig/setup.py
++++ Python-2.7.2/setup.py
+@@ -373,9 +373,10 @@
  
      def detect_modules(self):
          # Ensure that /usr/local is always used
 -        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
 -        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
+-        self.add_multiarch_paths()
 +        if os.environ.get('CROSS_COMPILING') != 'yes':
 +            add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
 +            add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
++            self.add_multiarch_paths()
  
          # Add paths specified in the environment variables LDFLAGS and
          # CPPFLAGS for header and library files.
-@@ -360,10 +361,7 @@
+@@ -383,10 +384,7 @@
          # directly since an inconsistently reproducible issue comes up where
          # the environment variable is not set even though the value were passed
          # into configure and stored in the Makefile (issue found on OS X 10.3).
@@ -38,7 +40,7 @@ Index: Python-2.7.1/setup.py
              env_val = sysconfig.get_config_var(env_var)
              if env_val:
                  # To prevent optparse from raising an exception about any
-@@ -388,17 +386,6 @@
+@@ -411,17 +409,6 @@
                      for directory in reversed(options.dirs):
                          add_dir_to_list(dir_list, directory)
  
@@ -56,7 +58,7 @@ Index: Python-2.7.1/setup.py
          try:
              have_unicode = unicode
          except NameError:
-@@ -407,11 +394,16 @@
+@@ -430,11 +417,16 @@
          # lib_dirs and inc_dirs are used to search for files;
          # if a file is found in one of those directories, it can
          # be assumed that no additional -I,-L directives are needed.
@@ -78,7 +80,7 @@ Index: Python-2.7.1/setup.py
          exts = []
          missing = []
  
-@@ -844,6 +836,9 @@
+@@ -867,6 +859,9 @@
              db_inc_paths.append('/pkg/db-3.%d/include' % x)
              db_inc_paths.append('/opt/db-3.%d/include' % x)
  
@@ -88,7 +90,7 @@ Index: Python-2.7.1/setup.py
          # Add some common subdirectories for Sleepycat DB to the list,
          # based on the standard include directories. This way DB3/4 gets
          # picked up when it is installed in a non-standard prefix and
-@@ -996,6 +991,9 @@
+@@ -1019,6 +1014,9 @@
          MIN_SQLITE_VERSION = ".".join([str(x)
                                      for x in MIN_SQLITE_VERSION_NUMBER])
  
@@ -98,7 +100,7 @@ Index: Python-2.7.1/setup.py
          # Scan the default include directories before the SQLite specific
          # ones. This allows one to override the copy of sqlite on OSX,
          # where /usr/include contains an old version of sqlite.
-@@ -1095,6 +1093,8 @@
+@@ -1118,6 +1116,8 @@
          # the more recent berkeleydb's db.h file first in the include path
          # when attempting to compile and it will fail.
          f = "/usr/include/db.h"
diff --git a/package/python/python-2.7-005-staging-headers-libs.patch b/package/python/python-2.7-005-staging-headers-libs.patch
index 170e819..cd378f2 100644
--- a/package/python/python-2.7-005-staging-headers-libs.patch
+++ b/package/python/python-2.7-005-staging-headers-libs.patch
@@ -12,12 +12,12 @@ Patch ported to python2.7 by Maxime Ripard <ripard@archos.com>
  setup.py |   13 +++++++++++++
  1 file changed, 13 insertions(+)
 
-Index: Python-2.7.1/setup.py
+Index: Python-2.7.2/setup.py
 ===================================================================
---- Python-2.7.1.orig/setup.py
-+++ Python-2.7.1/setup.py
-@@ -350,6 +350,19 @@
-         return sys.platform
+--- Python-2.7.2.orig/setup.py
++++ Python-2.7.2/setup.py
+@@ -372,6 +372,19 @@
+             os.unlink(tmpfile)
  
      def detect_modules(self):
 +        try:
diff --git a/package/python/python-2.7-006-disable-extensions.patch b/package/python/python-2.7-006-disable-extensions.patch
index 642ebc5..f62a50f 100644
--- a/package/python/python-2.7-006-disable-extensions.patch
+++ b/package/python/python-2.7-006-disable-extensions.patch
@@ -38,11 +38,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  setup.py        |    5 ++++-
  3 files changed, 11 insertions(+), 4 deletions(-)
 
-Index: Python-2.7.1/Makefile.pre.in
+Index: Python-2.7.2/Makefile.pre.in
 ===================================================================
---- Python-2.7.1.orig/Makefile.pre.in
-+++ Python-2.7.1/Makefile.pre.in
-@@ -141,6 +141,8 @@
+--- Python-2.7.2.orig/Makefile.pre.in
++++ Python-2.7.2/Makefile.pre.in
+@@ -144,6 +144,8 @@
  # configure script arguments
  CONFIG_ARGS=	@CONFIG_ARGS@
  
@@ -51,7 +51,7 @@ Index: Python-2.7.1/Makefile.pre.in
  
  # Subdirectories with code
  SRCDIRS= 	@SRCDIRS@
-@@ -406,8 +408,8 @@
+@@ -409,8 +411,8 @@
  # Build the shared modules
  sharedmods: $(BUILDPYTHON)
  	@case $$MAKEFLAGS in \
@@ -62,7 +62,7 @@ Index: Python-2.7.1/Makefile.pre.in
  	esac
  
  # Build static library
-@@ -1046,7 +1048,7 @@
+@@ -1051,7 +1053,7 @@
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: sharedmods
@@ -71,11 +71,11 @@ Index: Python-2.7.1/Makefile.pre.in
  	   	--prefix=$(prefix) \
  		--install-scripts=$(BINDIR) \
  		--install-platlib=$(DESTSHARED) \
-Index: Python-2.7.1/configure.in
+Index: Python-2.7.2/configure.in
 ===================================================================
---- Python-2.7.1.orig/configure.in
-+++ Python-2.7.1/configure.in
-@@ -2084,6 +2084,8 @@
+--- Python-2.7.2.orig/configure.in
++++ Python-2.7.2/configure.in
+@@ -2098,6 +2098,8 @@
  
  AC_PATH_TOOL([PKG_CONFIG], [pkg-config])
  
@@ -84,10 +84,10 @@ Index: Python-2.7.1/configure.in
  # Check for use of the system expat library
  AC_MSG_CHECKING(for --with-system-expat)
  AC_ARG_WITH(system_expat,
-Index: Python-2.7.1/setup.py
+Index: Python-2.7.2/setup.py
 ===================================================================
---- Python-2.7.1.orig/setup.py
-+++ Python-2.7.1/setup.py
+--- Python-2.7.2.orig/setup.py
++++ Python-2.7.2/setup.py
 @@ -21,7 +21,10 @@
  COMPILED_WITH_PYDEBUG = hasattr(sys, 'gettotalrefcount')
  
diff --git a/package/python/python-2.7-007-do-not-generate-pyo-files.patch b/package/python/python-2.7-007-do-not-generate-pyo-files.patch
index 2cb90cc..4ae5ef5 100644
--- a/package/python/python-2.7-007-do-not-generate-pyo-files.patch
+++ b/package/python/python-2.7-007-do-not-generate-pyo-files.patch
@@ -13,11 +13,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  Makefile.pre.in |    9 ---------
  1 file changed, 9 deletions(-)
 
-Index: Python-2.7.1/Makefile.pre.in
+Index: Python-2.7.2/Makefile.pre.in
 ===================================================================
---- Python-2.7.1.orig/Makefile.pre.in
-+++ Python-2.7.1/Makefile.pre.in
-@@ -929,20 +929,11 @@
+--- Python-2.7.2.orig/Makefile.pre.in
++++ Python-2.7.2/Makefile.pre.in
+@@ -934,20 +934,11 @@
  		-d $(LIBDEST) -f \
  		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
  		$(DESTDIR)$(LIBDEST)
diff --git a/package/python/python-2.7-008-reread-environment.patch b/package/python/python-2.7-008-reread-environment.patch
index e36d0cf..4ca22a4 100644
--- a/package/python/python-2.7-008-reread-environment.patch
+++ b/package/python/python-2.7-008-reread-environment.patch
@@ -25,11 +25,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  setup.py        |    3 +++
  2 files changed, 6 insertions(+), 3 deletions(-)
 
-Index: Python-2.7.1/Makefile.pre.in
+Index: Python-2.7.2/Makefile.pre.in
 ===================================================================
---- Python-2.7.1.orig/Makefile.pre.in
-+++ Python-2.7.1/Makefile.pre.in
-@@ -408,8 +408,8 @@
+--- Python-2.7.2.orig/Makefile.pre.in
++++ Python-2.7.2/Makefile.pre.in
+@@ -411,8 +411,8 @@
  # Build the shared modules
  sharedmods: $(BUILDPYTHON)
  	@case $$MAKEFLAGS in \
@@ -40,7 +40,7 @@ Index: Python-2.7.1/Makefile.pre.in
  	esac
  
  # Build static library
-@@ -1039,7 +1039,7 @@
+@@ -1044,7 +1044,7 @@
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: sharedmods
@@ -49,10 +49,10 @@ Index: Python-2.7.1/Makefile.pre.in
  	   	--prefix=$(prefix) \
  		--install-scripts=$(BINDIR) \
  		--install-platlib=$(DESTSHARED) \
-Index: Python-2.7.1/setup.py
+Index: Python-2.7.2/setup.py
 ===================================================================
---- Python-2.7.1.orig/setup.py
-+++ Python-2.7.1/setup.py
+--- Python-2.7.2.orig/setup.py
++++ Python-2.7.2/setup.py
 @@ -20,6 +20,9 @@
  # Were we compiled --with-pydebug or with #define Py_DEBUG?
  COMPILED_WITH_PYDEBUG = hasattr(sys, 'gettotalrefcount')
diff --git a/package/python/python-2.7-009-python-symlink.patch b/package/python/python-2.7-009-python-symlink.patch
index f284dba..1b1d0c8 100644
--- a/package/python/python-2.7-009-python-symlink.patch
+++ b/package/python/python-2.7-009-python-symlink.patch
@@ -10,11 +10,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  Makefile.pre.in |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: Python-2.7.1/Makefile.pre.in
+Index: Python-2.7.2/Makefile.pre.in
 ===================================================================
---- Python-2.7.1.orig/Makefile.pre.in
-+++ Python-2.7.1/Makefile.pre.in
-@@ -791,7 +791,7 @@
+--- Python-2.7.2.orig/Makefile.pre.in
++++ Python-2.7.2/Makefile.pre.in
+@@ -796,7 +796,7 @@
  	then rm -f $(DESTDIR)$(BINDIR)/$(PYTHON); \
  	else true; \
  	fi
diff --git a/package/python/python-2.7-010-change-pyconfig-h-location.patch b/package/python/python-2.7-010-change-pyconfig-h-location.patch
index fddc6c8..9b95ddb 100644
--- a/package/python/python-2.7-010-change-pyconfig-h-location.patch
+++ b/package/python/python-2.7-010-change-pyconfig-h-location.patch
@@ -26,10 +26,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  Makefile.pre.in            |    3 ++-
  3 files changed, 5 insertions(+), 3 deletions(-)
 
-Index: Python-2.7.1/Lib/distutils/sysconfig.py
+Index: Python-2.7.2/Lib/distutils/sysconfig.py
 ===================================================================
---- Python-2.7.1.orig/Lib/distutils/sysconfig.py
-+++ Python-2.7.1/Lib/distutils/sysconfig.py
+--- Python-2.7.2.orig/Lib/distutils/sysconfig.py
++++ Python-2.7.2/Lib/distutils/sysconfig.py
 @@ -193,7 +193,8 @@
          else:
              inc_dir = project_base
@@ -40,11 +40,11 @@ Index: Python-2.7.1/Lib/distutils/sysconfig.py
      if get_python_version() < '2.2':
          config_h = 'config.h'
      else:
-Index: Python-2.7.1/Lib/sysconfig.py
+Index: Python-2.7.2/Lib/sysconfig.py
 ===================================================================
---- Python-2.7.1.orig/Lib/sysconfig.py
-+++ Python-2.7.1/Lib/sysconfig.py
-@@ -371,7 +371,7 @@
+--- Python-2.7.2.orig/Lib/sysconfig.py
++++ Python-2.7.2/Lib/sysconfig.py
+@@ -356,7 +356,7 @@
          else:
              inc_dir = _PROJECT_BASE
      else:
@@ -53,11 +53,11 @@ Index: Python-2.7.1/Lib/sysconfig.py
      return os.path.join(inc_dir, 'pyconfig.h')
  
  def get_scheme_names():
-Index: Python-2.7.1/Makefile.pre.in
+Index: Python-2.7.2/Makefile.pre.in
 ===================================================================
---- Python-2.7.1.orig/Makefile.pre.in
-+++ Python-2.7.1/Makefile.pre.in
-@@ -967,7 +967,6 @@
+--- Python-2.7.2.orig/Makefile.pre.in
++++ Python-2.7.2/Makefile.pre.in
+@@ -972,7 +972,6 @@
  		echo $(INSTALL_DATA) $$i $(INCLUDEPY); \
  		$(INSTALL_DATA) $$i $(DESTDIR)$(INCLUDEPY); \
  	done
@@ -65,7 +65,7 @@ Index: Python-2.7.1/Makefile.pre.in
  
  # Install the library and miscellaneous stuff needed for extending/embedding
  # This goes into $(exec_prefix)
-@@ -1001,6 +1000,8 @@
+@@ -1006,6 +1005,8 @@
  	$(INSTALL_DATA) Modules/python.o $(DESTDIR)$(LIBPL)/python.o
  	$(INSTALL_DATA) $(srcdir)/Modules/config.c.in $(DESTDIR)$(LIBPL)/config.c.in
  	$(INSTALL_DATA) Makefile $(DESTDIR)$(LIBPL)/Makefile
diff --git a/package/python/python-2.7-011-no-rpath.patch b/package/python/python-2.7-011-no-rpath.patch
index 700c4be..3422dce 100644
--- a/package/python/python-2.7-011-no-rpath.patch
+++ b/package/python/python-2.7-011-no-rpath.patch
@@ -13,11 +13,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  setup.py |   21 ++++++++++++++++++---
  1 file changed, 18 insertions(+), 3 deletions(-)
 
-Index: Python-2.7.1/setup.py
+Index: Python-2.7.2/setup.py
 ===================================================================
---- Python-2.7.1.orig/setup.py
-+++ Python-2.7.1/setup.py
-@@ -977,6 +977,12 @@
+--- Python-2.7.2.orig/setup.py
++++ Python-2.7.2/setup.py
+@@ -997,6 +997,12 @@
                  print "bsddb lib dir:", dblib_dir, " inc dir:", db_incdir
              db_incs = [db_incdir]
              dblibs = [dblib]
@@ -30,7 +30,7 @@ Index: Python-2.7.1/setup.py
              # We add the runtime_library_dirs argument because the
              # BerkeleyDB lib we're linking against often isn't in the
              # system dynamic library search path.  This is usually
-@@ -986,7 +992,7 @@
+@@ -1006,7 +1012,7 @@
              exts.append(Extension('_bsddb', ['_bsddb.c'],
                                    depends = ['bsddb.h'],
                                    library_dirs=dblib_dir,
@@ -39,7 +39,7 @@ Index: Python-2.7.1/setup.py
                                    include_dirs=db_incs,
                                    libraries=dblibs))
          else:
-@@ -1092,12 +1098,17 @@
+@@ -1112,12 +1118,17 @@
              else:
                  sqlite_extra_link_args = ()
  
@@ -58,7 +58,7 @@ Index: Python-2.7.1/setup.py
                                    extra_link_args=sqlite_extra_link_args,
                                    libraries=["sqlite3",]))
          else:
-@@ -1198,9 +1209,13 @@
+@@ -1218,9 +1229,13 @@
                  elif cand == "bdb":
                      if db_incs is not None:
                          print "building dbm using bdb"
diff --git a/package/python/python-2.7-012-correct-32bit-64bit-check.patch b/package/python/python-2.7-012-correct-32bit-64bit-check.patch
index 88006f0..bfccbfd 100644
--- a/package/python/python-2.7-012-correct-32bit-64bit-check.patch
+++ b/package/python/python-2.7-012-correct-32bit-64bit-check.patch
@@ -16,10 +16,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  setup.py |   12 ++++++++++--
  1 file changed, 10 insertions(+), 2 deletions(-)
 
-Index: Python-2.7.1/setup.py
+Index: Python-2.7.2/setup.py
 ===================================================================
---- Python-2.7.1.orig/setup.py
-+++ Python-2.7.1/setup.py
+--- Python-2.7.2.orig/setup.py
++++ Python-2.7.2/setup.py
 @@ -29,6 +29,14 @@
  except KeyError:
      disabled_module_list = list()
@@ -35,7 +35,7 @@ Index: Python-2.7.1/setup.py
  def add_dir_to_list(dirlist, dir):
      """Add the directory 'dir' to the list 'dirlist' (at the front) if
      1) 'dir' is not already in 'dirlist'
-@@ -608,7 +616,7 @@
+@@ -628,7 +636,7 @@
          exts.append( Extension('audioop', ['audioop.c']) )
  
          # Disabled on 64-bit platforms
@@ -44,7 +44,7 @@ Index: Python-2.7.1/setup.py
              # Operations on images
              exts.append( Extension('imageop', ['imageop.c']) )
          else:
-@@ -1424,7 +1432,7 @@
+@@ -1444,7 +1452,7 @@
                  missing.append('_codecs_%s' % loc)
  
          # Dynamic loading module
diff --git a/package/python/python-2.7-013-fix-linux-3-compilation.patch b/package/python/python-2.7-013-fix-linux-3-compilation.patch
index a43ec7e..e834b9f 100644
--- a/package/python/python-2.7-013-fix-linux-3-compilation.patch
+++ b/package/python/python-2.7-013-fix-linux-3-compilation.patch
@@ -1,20 +1,22 @@
-diff -r 683202530137 configure
---- a/configure	Fri Aug 12 11:40:39 2011 +0300
-+++ b/configure	Fri Aug 12 14:02:18 2011 +0200
-@@ -3055,6 +3055,7 @@ then
- 	cygwin*) MACHDEP="cygwin";;
+Index: Python-2.7.2/configure
+===================================================================
+--- Python-2.7.2.orig/configure
++++ Python-2.7.2/configure
+@@ -3007,6 +3007,7 @@
  	darwin*) MACHDEP="darwin";;
+ 	atheos*) MACHDEP="atheos";;
          irix646) MACHDEP="irix6";;
 +        linux*) MACHDEP="linux2";;
  	'')	MACHDEP="unknown";;
  	esac
  fi
-diff -r 683202530137 configure.in
---- a/configure.in	Fri Aug 12 11:40:39 2011 +0300
-+++ b/configure.in	Fri Aug 12 14:02:18 2011 +0200
-@@ -307,6 +307,7 @@ then
- 	cygwin*) MACHDEP="cygwin";;
+Index: Python-2.7.2/configure.in
+===================================================================
+--- Python-2.7.2.orig/configure.in
++++ Python-2.7.2/configure.in
+@@ -297,6 +297,7 @@
  	darwin*) MACHDEP="darwin";;
+ 	atheos*) MACHDEP="atheos";;
          irix646) MACHDEP="irix6";;
 +        linux*) MACHDEP="linux2";;
  	'')	MACHDEP="unknown";;
diff --git a/package/python/python-2.7-014-verbose-module-build.patch b/package/python/python-2.7-014-verbose-module-build.patch
index a5be60f..ea81e55 100644
--- a/package/python/python-2.7-014-verbose-module-build.patch
+++ b/package/python/python-2.7-014-verbose-module-build.patch
@@ -4,11 +4,11 @@ Patch borrowed from OpenBricks.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
-Index: Python-2.7.1/Makefile.pre.in
+Index: Python-2.7.2/Makefile.pre.in
 ===================================================================
---- Python-2.7.1.orig/Makefile.pre.in
-+++ Python-2.7.1/Makefile.pre.in
-@@ -408,7 +408,7 @@
+--- Python-2.7.2.orig/Makefile.pre.in
++++ Python-2.7.2/Makefile.pre.in
+@@ -411,7 +411,7 @@
  # Build the shared modules
  sharedmods: $(BUILDPYTHON)
  	@case $$MAKEFLAGS in \
diff --git a/package/python/python-2.7-015-distutils-cross-compilation-support.patch b/package/python/python-2.7-015-distutils-cross-compilation-support.patch
index 16cfd7f..8304091 100644
--- a/package/python/python-2.7-015-distutils-cross-compilation-support.patch
+++ b/package/python/python-2.7-015-distutils-cross-compilation-support.patch
@@ -8,10 +8,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  Lib/distutils/sysconfig.py |    7 ++++---
  1 files changed, 4 insertions(+), 3 deletions(-)
 
-Index: Python-2.7.1/Lib/distutils/sysconfig.py
+Index: Python-2.7.2/Lib/distutils/sysconfig.py
 ===================================================================
---- Python-2.7.1.orig/Lib/distutils/sysconfig.py
-+++ Python-2.7.1/Lib/distutils/sysconfig.py
+--- Python-2.7.2.orig/Lib/distutils/sysconfig.py
++++ Python-2.7.2/Lib/distutils/sysconfig.py
 @@ -19,13 +19,22 @@
  from distutils.errors import DistutilsPlatformError
  
@@ -56,11 +56,11 @@ Index: Python-2.7.1/Lib/distutils/sysconfig.py
      lib_dir = get_python_lib(plat_specific=1, standard_lib=1)
      return os.path.join(lib_dir, "config", "Makefile")
  
-Index: Python-2.7.1/configure.in
+Index: Python-2.7.2/configure.in
 ===================================================================
---- Python-2.7.1.orig/configure.in
-+++ Python-2.7.1/configure.in
-@@ -4424,6 +4424,21 @@
+--- Python-2.7.2.orig/configure.in
++++ Python-2.7.2/configure.in
+@@ -4328,6 +4328,21 @@
  CROSS_COMPILING=$cross_compiling
  AC_SUBST(CROSS_COMPILING)
  
diff --git a/package/python/python-2.7-100-optional-test-modules.patch b/package/python/python-2.7-100-optional-test-modules.patch
index b51ea57..fc49d52 100644
--- a/package/python/python-2.7-100-optional-test-modules.patch
+++ b/package/python/python-2.7-100-optional-test-modules.patch
@@ -10,20 +10,19 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  configure.in    |    6 ++++++
  2 files changed, 33 insertions(+), 13 deletions(-)
 
-Index: Python-2.7.1/Makefile.pre.in
+Index: Python-2.7.2/Makefile.pre.in
 ===================================================================
---- Python-2.7.1.orig/Makefile.pre.in
-+++ Python-2.7.1/Makefile.pre.in
-@@ -851,23 +851,37 @@
+--- Python-2.7.2.orig/Makefile.pre.in
++++ Python-2.7.2/Makefile.pre.in
+@@ -856,23 +856,30 @@
  	plat-mac/lib-scriptpackages/SystemEvents \
  	plat-mac/lib-scriptpackages/Terminal 
  PLATMACPATH=:plat-mac:plat-mac/lib-scriptpackages
 -LIBSUBDIRS=	lib-tk lib-tk/test lib-tk/test/test_tkinter \
--                lib-tk/test/test_ttk site-packages test test/data \
--		test/decimaltestdata test/xmltestdata \
+-		lib-tk/test/test_ttk site-packages test test/data \
+-		test/cjkencodings test/decimaltestdata test/xmltestdata test/subprocessdata \
 -		test/tracedmodules \
-+LIBSUBDIRS=	lib-tk \
-+                site-packages \
++LIBSUBDIRS=	lib-tk  site-packages \
  		encodings compiler hotshot \
 -		email email/mime email/test email/test/data \
 -		json json/tests \
@@ -38,8 +37,8 @@ Index: Python-2.7.1/Makefile.pre.in
 +		sqlite3 \
 +		logging bsddb csv importlib wsgiref \
 +		lib2to3 lib2to3/fixes lib2to3/pgen2 \
-+		ctypes ctypes/macholib idlelib idlelib/Icons \
-+		distutils distutils/command $(XMLLIBSUBDIRS) \
++		ctypes  ctypes/macholib idlelib idlelib/Icons \
++		distutils distutils/command  $(XMLLIBSUBDIRS) \
  		multiprocessing multiprocessing/dummy \
 -		unittest unittest/test \
 +		unittest \
@@ -47,29 +46,23 @@ Index: Python-2.7.1/Makefile.pre.in
  		curses pydoc_data $(MACHDEPS)
 +
 +ifeq (@TEST_MODULES@,yes)
-+LIBSUBDIRS +=	lib-tk/test lib-tk/test/test_tkinter	\
-+	      	lib-tk/test/test_ttk test test/data	\
-+		test/decimaltestdata test/xmltestdata 	\
-+		test/tracedmodules   			\
-+		email/test email/test/data		\
-+		sqlite3/test				\
-+		bsddb/test				\
-+		lib2to3/tests				\
-+		lib2to3/tests/data			\
-+		lib2to3/tests/data/fixers		\
-+		lib2to3/tests/data/fixers/myfixes	\
-+		ctypes/test distutils/tests		\
-+		unittest/test
++LIBSUBDIRS += lib-tk/test lib-tk/test/test_tkinter \
++		lib-tk/test/test_ttk test test/data \
++		test/cjkencodings test/decimaltestdata test/xmltestdata test/subprocessdata \
++		test/tracedmodules email/test email/test/data \
++		json/tests sqlite3/test bsddb/test lib2to3/tests \
++		lib2to3/tests/data lib2to3/tests/data/fixers lib2to3/tests/data/fixers/myfixes \
++		ctypes/test distutils/tests unittest/test
 +endif
 +
  libinstall:	build_all $(srcdir)/Lib/$(PLATDIR)
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
-Index: Python-2.7.1/configure.in
+Index: Python-2.7.2/configure.in
 ===================================================================
---- Python-2.7.1.orig/configure.in
-+++ Python-2.7.1/configure.in
-@@ -2393,6 +2393,12 @@
+--- Python-2.7.2.orig/configure.in
++++ Python-2.7.2/configure.in
+@@ -2408,6 +2408,12 @@
  fi
  
  
diff --git a/package/python/python-2.7-101-optional-pydoc.patch b/package/python/python-2.7-101-optional-pydoc.patch
index 8d51dc9..195abcc 100644
--- a/package/python/python-2.7-101-optional-pydoc.patch
+++ b/package/python/python-2.7-101-optional-pydoc.patch
@@ -11,11 +11,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  setup.py        |   10 +++++++---
  3 files changed, 17 insertions(+), 4 deletions(-)
 
-Index: Python-2.7.1/Makefile.pre.in
+Index: Python-2.7.2/Makefile.pre.in
 ===================================================================
---- Python-2.7.1.orig/Makefile.pre.in
-+++ Python-2.7.1/Makefile.pre.in
-@@ -864,7 +864,7 @@
+--- Python-2.7.2.orig/Makefile.pre.in
++++ Python-2.7.2/Makefile.pre.in
+@@ -868,7 +868,7 @@
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		lib-old \
@@ -23,9 +23,9 @@ Index: Python-2.7.1/Makefile.pre.in
 +		curses $(MACHDEPS)
  
  ifeq (@TEST_MODULES@,yes)
- LIBSUBDIRS +=	lib-tk/test lib-tk/test/test_tkinter	\
-@@ -882,6 +882,10 @@
- 		unittest/test
+ LIBSUBDIRS += lib-tk/test lib-tk/test/test_tkinter \
+@@ -880,6 +880,10 @@
+ 		ctypes/test distutils/tests unittest/test
  endif
  
 +ifeq (@PYDOC@,yes)
@@ -35,11 +35,11 @@ Index: Python-2.7.1/Makefile.pre.in
  libinstall:	build_all $(srcdir)/Lib/$(PLATDIR)
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
-Index: Python-2.7.1/configure.in
+Index: Python-2.7.2/configure.in
 ===================================================================
---- Python-2.7.1.orig/configure.in
-+++ Python-2.7.1/configure.in
-@@ -2392,6 +2392,11 @@
+--- Python-2.7.2.orig/configure.in
++++ Python-2.7.2/configure.in
+@@ -2407,6 +2407,11 @@
          esac])
  fi
  
@@ -51,11 +51,11 @@ Index: Python-2.7.1/configure.in
  
  AC_SUBST(TEST_MODULES)
  
-Index: Python-2.7.1/setup.py
+Index: Python-2.7.2/setup.py
 ===================================================================
---- Python-2.7.1.orig/setup.py
-+++ Python-2.7.1/setup.py
-@@ -2072,6 +2072,12 @@
+--- Python-2.7.2.orig/setup.py
++++ Python-2.7.2/setup.py
+@@ -2092,6 +2092,12 @@
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -68,7 +68,7 @@ Index: Python-2.7.1/setup.py
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2092,9 +2098,7 @@
+@@ -2112,9 +2118,7 @@
            ext_modules=[Extension('_struct', ['_struct.c'])],
  
            # Scripts to install
diff --git a/package/python/python-2.7-102-optional-2to3.patch b/package/python/python-2.7-102-optional-2to3.patch
index 3550db1..1e04540 100644
--- a/package/python/python-2.7-102-optional-2to3.patch
+++ b/package/python/python-2.7-102-optional-2to3.patch
@@ -11,34 +11,29 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  setup.py        |    5 +++--
  3 files changed, 26 insertions(+), 9 deletions(-)
 
-Index: Python-2.7.1/Makefile.pre.in
+Index: Python-2.7.2/Makefile.pre.in
 ===================================================================
---- Python-2.7.1.orig/Makefile.pre.in
-+++ Python-2.7.1/Makefile.pre.in
-@@ -856,9 +856,7 @@
- 		encodings compiler hotshot \
- 		email email/mime \
+--- Python-2.7.2.orig/Makefile.pre.in
++++ Python-2.7.2/Makefile.pre.in
+@@ -862,7 +862,6 @@
  		json \
--		sqlite3 \
+ 		sqlite3 \
  		logging bsddb csv importlib wsgiref \
 -		lib2to3 lib2to3/fixes lib2to3/pgen2 \
- 		ctypes ctypes/macholib idlelib idlelib/Icons \
- 		distutils distutils/command $(XMLLIBSUBDIRS) \
+ 		ctypes  ctypes/macholib idlelib idlelib/Icons \
+ 		distutils distutils/command  $(XMLLIBSUBDIRS) \
  		multiprocessing multiprocessing/dummy \
-@@ -872,12 +870,7 @@
- 		test/decimaltestdata test/xmltestdata 	\
- 		test/tracedmodules   			\
- 		email/test email/test/data		\
--		sqlite3/test				\
- 		bsddb/test				\
--		lib2to3/tests				\
--		lib2to3/tests/data			\
--		lib2to3/tests/data/fixers		\
--		lib2to3/tests/data/fixers/myfixes	\
- 		ctypes/test distutils/tests		\
- 		unittest/test
+@@ -875,8 +874,7 @@
+ 		lib-tk/test/test_ttk test test/data \
+ 		test/cjkencodings test/decimaltestdata test/xmltestdata test/subprocessdata \
+ 		test/tracedmodules email/test email/test/data \
+-		json/tests sqlite3/test bsddb/test lib2to3/tests \
+-		lib2to3/tests/data lib2to3/tests/data/fixers lib2to3/tests/data/fixers/myfixes \
++		json/tests sqlite3/test bsddb/test \
+ 		ctypes/test distutils/tests unittest/test
  endif
-@@ -886,6 +879,23 @@
+ 
+@@ -884,6 +882,23 @@
  LIBSUBDIRS += pydoc_data
  endif
  
@@ -62,11 +57,11 @@ Index: Python-2.7.1/Makefile.pre.in
  libinstall:	build_all $(srcdir)/Lib/$(PLATDIR)
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
-Index: Python-2.7.1/configure.in
+Index: Python-2.7.2/configure.in
 ===================================================================
---- Python-2.7.1.orig/configure.in
-+++ Python-2.7.1/configure.in
-@@ -2404,6 +2404,12 @@
+--- Python-2.7.2.orig/configure.in
++++ Python-2.7.2/configure.in
+@@ -2419,6 +2419,12 @@
  	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
  	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
  
@@ -79,11 +74,11 @@ Index: Python-2.7.1/configure.in
  # Check for enable-ipv6
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
-Index: Python-2.7.1/setup.py
+Index: Python-2.7.2/setup.py
 ===================================================================
---- Python-2.7.1.orig/setup.py
-+++ Python-2.7.1/setup.py
-@@ -2073,10 +2073,11 @@
+--- Python-2.7.2.orig/setup.py
++++ Python-2.7.2/setup.py
+@@ -2093,10 +2093,11 @@
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
diff --git a/package/python/python-2.7-103-optional-sqlite.patch b/package/python/python-2.7-103-optional-sqlite.patch
index 08e8b5d..4172bae 100644
--- a/package/python/python-2.7-103-optional-sqlite.patch
+++ b/package/python/python-2.7-103-optional-sqlite.patch
@@ -6,11 +6,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  configure.in |    9 +++++++++
  1 file changed, 9 insertions(+)
 
-Index: Python-2.7.1/configure.in
+Index: Python-2.7.2/configure.in
 ===================================================================
---- Python-2.7.1.orig/configure.in
-+++ Python-2.7.1/configure.in
-@@ -2392,6 +2392,15 @@
+--- Python-2.7.2.orig/configure.in
++++ Python-2.7.2/configure.in
+@@ -2407,6 +2407,15 @@
          esac])
  fi
  
diff --git a/package/python/python-2.7-104-optional-tk.patch b/package/python/python-2.7-104-optional-tk.patch
index 6bcdcb8..12f1236 100644
--- a/package/python/python-2.7-104-optional-tk.patch
+++ b/package/python/python-2.7-104-optional-tk.patch
@@ -7,31 +7,30 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  configure.in    |    9 +++++++++
  2 files changed, 19 insertions(+), 4 deletions(-)
 
-Index: Python-2.7.1/Makefile.pre.in
+Index: Python-2.7.2/Makefile.pre.in
 ===================================================================
---- Python-2.7.1.orig/Makefile.pre.in
-+++ Python-2.7.1/Makefile.pre.in
-@@ -851,8 +851,7 @@
+--- Python-2.7.2.orig/Makefile.pre.in
++++ Python-2.7.2/Makefile.pre.in
+@@ -856,7 +856,7 @@
  	plat-mac/lib-scriptpackages/SystemEvents \
  	plat-mac/lib-scriptpackages/Terminal 
  PLATMACPATH=:plat-mac:plat-mac/lib-scriptpackages
--LIBSUBDIRS=	lib-tk \
--                site-packages \
+-LIBSUBDIRS=	lib-tk  site-packages \
 +LIBSUBDIRS=	site-packages \
  		encodings compiler hotshot \
  		email email/mime \
  		json \
-@@ -865,8 +864,7 @@
+@@ -870,8 +870,7 @@
  		curses $(MACHDEPS)
  
  ifeq (@TEST_MODULES@,yes)
--LIBSUBDIRS +=	lib-tk/test lib-tk/test/test_tkinter	\
--	      	lib-tk/test/test_ttk test test/data	\
-+LIBSUBDIRS +=	test test/data	\
- 		test/decimaltestdata test/xmltestdata 	\
- 		test/tracedmodules   			\
- 		email/test email/test/data		\
-@@ -896,6 +894,14 @@
+-LIBSUBDIRS += lib-tk/test lib-tk/test/test_tkinter \
+-		lib-tk/test/test_ttk test test/data \
++LIBSUBDIRS +=   test test/data \
+ 		test/cjkencodings test/decimaltestdata test/xmltestdata test/subprocessdata \
+ 		test/tracedmodules email/test email/test/data \
+ 		json/tests sqlite3/test bsddb/test \
+@@ -899,6 +898,14 @@
  endif
  endif
  
@@ -46,11 +45,11 @@ Index: Python-2.7.1/Makefile.pre.in
  libinstall:	build_all $(srcdir)/Lib/$(PLATDIR)
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
-Index: Python-2.7.1/configure.in
+Index: Python-2.7.2/configure.in
 ===================================================================
---- Python-2.7.1.orig/configure.in
-+++ Python-2.7.1/configure.in
-@@ -2401,6 +2401,15 @@
+--- Python-2.7.2.orig/configure.in
++++ Python-2.7.2/configure.in
+@@ -2416,6 +2416,15 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python/python-2.7-105-optional-curses.patch b/package/python/python-2.7-105-optional-curses.patch
index 3a1ceab..e3705cb 100644
--- a/package/python/python-2.7-105-optional-curses.patch
+++ b/package/python/python-2.7-105-optional-curses.patch
@@ -7,11 +7,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  configure.in    |    9 +++++++++
  2 files changed, 14 insertions(+), 1 deletion(-)
 
-Index: Python-2.7.1/Makefile.pre.in
+Index: Python-2.7.2/Makefile.pre.in
 ===================================================================
---- Python-2.7.1.orig/Makefile.pre.in
-+++ Python-2.7.1/Makefile.pre.in
-@@ -861,7 +861,7 @@
+--- Python-2.7.2.orig/Makefile.pre.in
++++ Python-2.7.2/Makefile.pre.in
+@@ -867,7 +867,7 @@
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		lib-old \
@@ -19,8 +19,8 @@ Index: Python-2.7.1/Makefile.pre.in
 +		$(MACHDEPS)
  
  ifeq (@TEST_MODULES@,yes)
- LIBSUBDIRS +=	test test/data	\
-@@ -902,6 +902,10 @@
+ LIBSUBDIRS +=   test test/data \
+@@ -906,6 +906,10 @@
  endif
  endif
  
@@ -31,11 +31,11 @@ Index: Python-2.7.1/Makefile.pre.in
  libinstall:	build_all $(srcdir)/Lib/$(PLATDIR)
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
-Index: Python-2.7.1/configure.in
+Index: Python-2.7.2/configure.in
 ===================================================================
---- Python-2.7.1.orig/configure.in
-+++ Python-2.7.1/configure.in
-@@ -2410,6 +2410,15 @@
+--- Python-2.7.2.orig/configure.in
++++ Python-2.7.2/configure.in
+@@ -2425,6 +2425,15 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
diff --git a/package/python/python-2.7-106-optional-expat.patch b/package/python/python-2.7-106-optional-expat.patch
index 24272d9..be1b4a3 100644
--- a/package/python/python-2.7-106-optional-expat.patch
+++ b/package/python/python-2.7-106-optional-expat.patch
@@ -14,20 +14,20 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  setup.py        |    2 +-
  3 files changed, 19 insertions(+), 7 deletions(-)
 
-Index: Python-2.7.1/Makefile.pre.in
+Index: Python-2.7.2/Makefile.pre.in
 ===================================================================
---- Python-2.7.1.orig/Makefile.pre.in
-+++ Python-2.7.1/Makefile.pre.in
-@@ -857,7 +857,7 @@
- 		json \
+--- Python-2.7.2.orig/Makefile.pre.in
++++ Python-2.7.2/Makefile.pre.in
+@@ -863,7 +863,7 @@
+ 		sqlite3 \
  		logging bsddb csv importlib wsgiref \
- 		ctypes ctypes/macholib idlelib idlelib/Icons \
--		distutils distutils/command $(XMLLIBSUBDIRS) \
+ 		ctypes  ctypes/macholib idlelib idlelib/Icons \
+-		distutils distutils/command  $(XMLLIBSUBDIRS) \
 +		distutils distutils/command \
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		lib-old \
-@@ -906,6 +906,10 @@
+@@ -910,6 +910,10 @@
  LIBSUBDIRS += curses
  endif
  
@@ -38,11 +38,11 @@ Index: Python-2.7.1/Makefile.pre.in
  libinstall:	build_all $(srcdir)/Lib/$(PLATDIR)
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
-Index: Python-2.7.1/configure.in
+Index: Python-2.7.2/configure.in
 ===================================================================
---- Python-2.7.1.orig/configure.in
-+++ Python-2.7.1/configure.in
-@@ -2087,13 +2087,21 @@
+--- Python-2.7.2.orig/configure.in
++++ Python-2.7.2/configure.in
+@@ -2102,13 +2102,21 @@
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
@@ -69,11 +69,11 @@ Index: Python-2.7.1/configure.in
  
  # Check for use of the system libffi library
  AC_MSG_CHECKING(for --with-system-ffi)
-Index: Python-2.7.1/setup.py
+Index: Python-2.7.2/setup.py
 ===================================================================
---- Python-2.7.1.orig/setup.py
-+++ Python-2.7.1/setup.py
-@@ -1383,7 +1383,7 @@
+--- Python-2.7.2.orig/setup.py
++++ Python-2.7.2/setup.py
+@@ -1403,7 +1403,7 @@
          #
          # More information on Expat can be found at www.libexpat.org.
          #
diff --git a/package/python/python-2.7-107-optional-codecs-cjk.patch b/package/python/python-2.7-107-optional-codecs-cjk.patch
index 1b0541b..8ba61fe 100644
--- a/package/python/python-2.7-107-optional-codecs-cjk.patch
+++ b/package/python/python-2.7-107-optional-codecs-cjk.patch
@@ -6,11 +6,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  configure.in |    6 ++++++
  1 file changed, 6 insertions(+)
 
-Index: Python-2.7.1/configure.in
+Index: Python-2.7.2/configure.in
 ===================================================================
---- Python-2.7.1.orig/configure.in
-+++ Python-2.7.1/configure.in
-@@ -2409,6 +2409,12 @@
+--- Python-2.7.2.orig/configure.in
++++ Python-2.7.2/configure.in
+@@ -2424,6 +2424,12 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python/python-2.7-108-optional-nis.patch b/package/python/python-2.7-108-optional-nis.patch
index 35be7ff..212f8d6 100644
--- a/package/python/python-2.7-108-optional-nis.patch
+++ b/package/python/python-2.7-108-optional-nis.patch
@@ -9,11 +9,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  configure.in |    6 ++++++
  1 file changed, 6 insertions(+)
 
-Index: Python-2.7.1/configure.in
+Index: Python-2.7.2/configure.in
 ===================================================================
---- Python-2.7.1.orig/configure.in
-+++ Python-2.7.1/configure.in
-@@ -2415,6 +2415,12 @@
+--- Python-2.7.2.orig/configure.in
++++ Python-2.7.2/configure.in
+@@ -2430,6 +2430,12 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk"
    	  fi])
  
diff --git a/package/python/python-2.7-109-optional-unicodedata.patch b/package/python/python-2.7-109-optional-unicodedata.patch
index 9973c3c..229ba8c 100644
--- a/package/python/python-2.7-109-optional-unicodedata.patch
+++ b/package/python/python-2.7-109-optional-unicodedata.patch
@@ -6,11 +6,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  configure.in |    6 ++++++
  1 file changed, 6 insertions(+)
 
-Index: Python-2.7.1/configure.in
+Index: Python-2.7.2/configure.in
 ===================================================================
---- Python-2.7.1.orig/configure.in
-+++ Python-2.7.1/configure.in
-@@ -2421,6 +2421,12 @@
+--- Python-2.7.2.orig/configure.in
++++ Python-2.7.2/configure.in
+@@ -2436,6 +2436,12 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python/python-2.7-110-optional-db.patch b/package/python/python-2.7-110-optional-db.patch
index 5589ed3..0d5ee0c 100644
--- a/package/python/python-2.7-110-optional-db.patch
+++ b/package/python/python-2.7-110-optional-db.patch
@@ -11,28 +11,29 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  configure.in    |   22 ++++++++++++++++++++++
  2 files changed, 30 insertions(+), 2 deletions(-)
 
-Index: Python-2.7.1/Makefile.pre.in
+Index: Python-2.7.2/Makefile.pre.in
 ===================================================================
---- Python-2.7.1.orig/Makefile.pre.in
-+++ Python-2.7.1/Makefile.pre.in
-@@ -855,7 +855,7 @@
- 		encodings compiler hotshot \
+--- Python-2.7.2.orig/Makefile.pre.in
++++ Python-2.7.2/Makefile.pre.in
+@@ -861,7 +861,7 @@
  		email email/mime \
  		json \
+ 		sqlite3 \
 -		logging bsddb csv importlib wsgiref \
 +		logging csv importlib wsgiref \
- 		ctypes ctypes/macholib idlelib idlelib/Icons \
+ 		ctypes  ctypes/macholib idlelib idlelib/Icons \
  		distutils distutils/command \
  		multiprocessing multiprocessing/dummy \
-@@ -868,7 +868,6 @@
- 		test/decimaltestdata test/xmltestdata 	\
- 		test/tracedmodules   			\
- 		email/test email/test/data		\
--		bsddb/test				\
- 		ctypes/test distutils/tests		\
- 		unittest/test
+@@ -873,7 +873,7 @@
+ LIBSUBDIRS +=   test test/data \
+ 		test/cjkencodings test/decimaltestdata test/xmltestdata test/subprocessdata \
+ 		test/tracedmodules email/test email/test/data \
+-		json/tests sqlite3/test bsddb/test \
++		json/tests sqlite3/test \
+ 		ctypes/test distutils/tests unittest/test
  endif
-@@ -910,6 +909,13 @@
+ 
+@@ -914,6 +914,13 @@
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
@@ -46,11 +47,11 @@ Index: Python-2.7.1/Makefile.pre.in
  libinstall:	build_all $(srcdir)/Lib/$(PLATDIR)
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
-Index: Python-2.7.1/configure.in
+Index: Python-2.7.2/configure.in
 ===================================================================
---- Python-2.7.1.orig/configure.in
-+++ Python-2.7.1/configure.in
-@@ -2421,6 +2421,28 @@
+--- Python-2.7.2.orig/configure.in
++++ Python-2.7.2/configure.in
+@@ -2436,6 +2436,28 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python/python-2.7-111-optional-ssl.patch b/package/python/python-2.7-111-optional-ssl.patch
index ff38507..5885b4e 100644
--- a/package/python/python-2.7-111-optional-ssl.patch
+++ b/package/python/python-2.7-111-optional-ssl.patch
@@ -6,11 +6,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  configure.in |    6 ++++++
  1 file changed, 6 insertions(+)
 
-Index: Python-2.7.1/configure.in
+Index: Python-2.7.2/configure.in
 ===================================================================
---- Python-2.7.1.orig/configure.in
-+++ Python-2.7.1/configure.in
-@@ -2421,6 +2421,12 @@
+--- Python-2.7.2.orig/configure.in
++++ Python-2.7.2/configure.in
+@@ -2436,6 +2436,12 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python/python-2.7-112-optional-bzip2.patch b/package/python/python-2.7-112-optional-bzip2.patch
index f2e4e7c..83a2479 100644
--- a/package/python/python-2.7-112-optional-bzip2.patch
+++ b/package/python/python-2.7-112-optional-bzip2.patch
@@ -5,11 +5,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  configure.in |    6 ++++++
  1 file changed, 6 insertions(+)
 
-Index: Python-2.7.1/configure.in
+Index: Python-2.7.2/configure.in
 ===================================================================
---- Python-2.7.1.orig/configure.in
-+++ Python-2.7.1/configure.in
-@@ -2427,6 +2427,12 @@
+--- Python-2.7.2.orig/configure.in
++++ Python-2.7.2/configure.in
+@@ -2442,6 +2442,12 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl"
    	  fi])
  
diff --git a/package/python/python-2.7-113-optional-zlib.patch b/package/python/python-2.7-113-optional-zlib.patch
index b5d9665..f24eb17 100644
--- a/package/python/python-2.7-113-optional-zlib.patch
+++ b/package/python/python-2.7-113-optional-zlib.patch
@@ -5,11 +5,11 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  configure.in |    6 ++++++
  1 file changed, 6 insertions(+)
 
-Index: Python-2.7.1/configure.in
+Index: Python-2.7.2/configure.in
 ===================================================================
---- Python-2.7.1.orig/configure.in
-+++ Python-2.7.1/configure.in
-@@ -2433,6 +2433,12 @@
+--- Python-2.7.2.orig/configure.in
++++ Python-2.7.2/configure.in
+@@ -2448,6 +2448,12 @@
              DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} bz2"
           fi])
  
diff --git a/package/python/python.mk b/package/python/python.mk
index 724fd1a..596770a 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 PYTHON_VERSION_MAJOR = 2.7
-PYTHON_VERSION       = $(PYTHON_VERSION_MAJOR).1
+PYTHON_VERSION       = $(PYTHON_VERSION_MAJOR).2
 PYTHON_SOURCE        = Python-$(PYTHON_VERSION).tar.bz2
 PYTHON_SITE          = http://python.org/ftp/python/$(PYTHON_VERSION)
 
-- 
1.7.4.1
