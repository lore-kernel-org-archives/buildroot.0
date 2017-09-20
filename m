From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Sep 2017 19:53:42 +0200
Subject: [Buildroot] [git commit] package/python3: bump to 3.6.2
Message-ID: <20170920175711.8684D8082C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e6e8d37b549033c9dc2ac21ed600708a890894f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump Python3 version to 3.6.2.

Patches dropped:

"Support PGEN_FOR_BUILD and FREEZE_IMPORTLIB_FOR_BUILD"

Rationale: With commit 9d02f562961efd12d3c8317a10916db7f77330cc, code
generation step of building CPython now became explicit (instead of
always performed as a part of 'make' invocation) and more granular. We
no longer need to use Parser/pgen at all and tricking the build system
into using different Programs/_freeze_importlib can be done as a part
of recipe.

Additional info about the build change can be found at
https://bugs.python.org/issue23404

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-Make-the-build-of-pyc-files-conditional.patch | 14 ++---
 ...gy_getaddrinfo-configure-test-when-cross-.patch |  8 +--
 ...ructure-to-disable-the-build-of-certain-e.patch | 18 +++---
 ...ibrary-header-paths-for-cross-compilation.patch |  8 +--
 ...n-t-look-in-usr-lib-termcap-for-libraries.patch |  6 +-
 .../python3/0006-Don-t-add-multiarch-paths.patch   |  6 +-
 .../0007-Abort-on-failed-module-build.patch        |  6 +-
 package/python3/0008-Serial-ioctl-workaround.patch |  6 +-
 ...st-the-shebang-of-Python-scripts-for-cros.patch |  6 +-
 ...-config.sh.in-ensure-sed-invocations-only.patch |  6 +-
 ...stem-locale-and-set-to-default-when-addin.patch |  6 +-
 ...0012-Add-importlib-fix-for-PEP-3147-issue.patch |  6 +-
 ...on-to-disable-installation-of-test-module.patch | 14 ++---
 .../0014-Add-an-option-to-disable-pydoc.patch      | 22 ++++----
 .../0015-Add-an-option-to-disable-lib2to3.patch    | 24 ++++----
 ...-Add-option-to-disable-the-sqlite3-module.patch | 16 +++---
 ...17-Add-an-option-to-disable-the-tk-module.patch | 16 +++---
 ...dd-an-option-to-disable-the-curses-module.patch | 14 ++---
 .../0019-Add-an-option-to-disable-expat.patch      | 18 +++---
 .../0020-Add-an-option-to-disable-CJK-codecs.patch |  8 +--
 .../0021-Add-an-option-to-disable-NIS.patch        |  8 +--
 ...0022-Add-an-option-to-disable-unicodedata.patch |  8 +--
 .../0023-Add-an-option-to-disable-IDLE.patch       | 20 +++----
 .../0024-Add-an-option-to-disable-decimal.patch    | 12 ++--
 ...-option-to-disable-the-ossaudiodev-module.patch |  8 +--
 ...Add-an-option-to-disable-openssl-support.patch} |  8 +--
 ...N_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch | 64 ----------------------
 ...an-option-to-disable-the-readline-module.patch} |  8 +--
 ...ons-to-disable-zlib-bzip2-and-xz-modules.patch} |  8 +--
 package/python3/python3.hash                       |  6 +-
 package/python3/python3.mk                         | 60 ++++++++++++++------
 31 files changed, 199 insertions(+), 239 deletions(-)

diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index 326f15e..4a8e4e8 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -1,4 +1,4 @@
-From 1c2d155d1ef3da49b5ed970ab8d63958c516e9b9 Mon Sep 17 00:00:00 2001
+From e568f4deb7c648e3265154574db753601636cdda Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 16:21:31 -0800
 Subject: [PATCH] Make the build of pyc files conditional
@@ -15,10 +15,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  2 files changed, 8 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 8f27d73..b78a765 100644
+index 82e830727e..b38bd79121 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1308,6 +1308,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+@@ -1311,6 +1311,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
@@ -26,7 +26,7 @@ index 8f27d73..b78a765 100644
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST) -f \
-@@ -1335,6 +1336,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+@@ -1338,6 +1339,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
@@ -35,10 +35,10 @@ index 8f27d73..b78a765 100644
  		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
 diff --git a/configure.ac b/configure.ac
-index 9eacf52..8e7b2ad 100644
+index 962006704f..a76b5444df 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1122,6 +1122,12 @@ fi
+@@ -1113,6 +1113,12 @@ fi
  
  AC_MSG_CHECKING(LDLIBRARY)
  
@@ -52,5 +52,5 @@ index 9eacf52..8e7b2ad 100644
  # library that we build, but we do not want to link against it (we
  # will find it with a -framework option). For this reason there is an
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
index 49a1422..e997f47 100644
--- a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
+++ b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
@@ -1,4 +1,4 @@
-From cc5adc98d981cff5acf0f1c52bf7ae4709a35fc3 Mon Sep 17 00:00:00 2001
+From 8ec1677d16bef6d6ee5cee4ff004dfa3d0428e88 Mon Sep 17 00:00:00 2001
 From: Vanya Sergeev <vsergeev@gmail.com>
 Date: Wed, 23 Dec 2015 11:30:33 +0100
 Subject: [PATCH] Disable buggy_getaddrinfo configure test when cross-compiling
@@ -10,10 +10,10 @@ Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 8e7b2ad..250b23b 100644
+index a76b5444df..5f87c4db5a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3908,7 +3908,7 @@ fi
+@@ -3939,7 +3939,7 @@ fi
  
  AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
  
@@ -23,5 +23,5 @@ index 8e7b2ad..250b23b 100644
  	if test $ipv6 = yes
  	then
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
index bf8cd92..76555d2 100644
--- a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
+++ b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
@@ -1,4 +1,4 @@
-From 300143451b42717eb05fc8b876f25ff4b202d8c4 Mon Sep 17 00:00:00 2001
+From 2c2afc80831c518e5daf3df6c9e4c4ac0a7be001 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 16:33:22 -0800
 Subject: [PATCH] Add infrastructure to disable the build of certain extensions
@@ -44,10 +44,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  3 files changed, 12 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index b78a765..0e06ddb 100644
+index b38bd79121..4ce917ab8d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -188,6 +188,8 @@ FILEMODE=	644
+@@ -190,6 +190,8 @@ FILEMODE=	644
  # configure script arguments
  CONFIG_ARGS=	@CONFIG_ARGS@
  
@@ -56,7 +56,7 @@ index b78a765..0e06ddb 100644
  
  # Subdirectories with code
  SRCDIRS= 	@SRCDIRS@
-@@ -606,6 +608,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
+@@ -575,6 +577,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
  	esac; \
  	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
@@ -64,7 +64,7 @@ index b78a765..0e06ddb 100644
  		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
  
  
-@@ -1433,7 +1436,8 @@ libainstall:	all python-config
+@@ -1436,7 +1439,8 @@ libainstall:	@DEF_MAKE_RULE@ python-config
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: sharedmods
@@ -75,10 +75,10 @@ index b78a765..0e06ddb 100644
  		--install-scripts=$(BINDIR) \
  		--install-platlib=$(DESTSHARED) \
 diff --git a/configure.ac b/configure.ac
-index 250b23b..fc4e71a 100644
+index 5f87c4db5a..d5ee2aedfb 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2779,6 +2779,8 @@ LIBS="$withval $LIBS"
+@@ -2810,6 +2810,8 @@ LIBS="$withval $LIBS"
  
  PKG_PROG_PKG_CONFIG
  
@@ -88,7 +88,7 @@ index 250b23b..fc4e71a 100644
  AC_MSG_CHECKING(for --with-system-expat)
  AC_ARG_WITH(system_expat,
 diff --git a/setup.py b/setup.py
-index f04bf22..c5bce21 100644
+index fe477974bd..86643ae8bf 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -43,7 +43,11 @@ host_platform = get_platform()
@@ -105,5 +105,5 @@ index f04bf22..c5bce21 100644
  def add_dir_to_list(dirlist, dir):
      """Add the directory 'dir' to the list 'dirlist' (after any relative
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
index 89b8ed8..989943e 100644
--- a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
+++ b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From 7c21396776e10346dccd805d4250e26e8172a812 Mon Sep 17 00:00:00 2001
+From e359a7a3c4f9e70360a068bef19c95938fdacede Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:33:14 +0100
 Subject: [PATCH] Adjust library/header paths for cross-compilation
@@ -21,7 +21,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  2 files changed, 15 insertions(+), 5 deletions(-)
 
 diff --git a/Lib/distutils/command/build_ext.py b/Lib/distutils/command/build_ext.py
-index 74de782..d0c847b 100644
+index 74de782d8a..d0c847b365 100644
 --- a/Lib/distutils/command/build_ext.py
 +++ b/Lib/distutils/command/build_ext.py
 @@ -233,7 +233,10 @@ class build_ext(Command):
@@ -37,7 +37,7 @@ index 74de782..d0c847b 100644
                  # building python standard extensions
                  self.library_dirs.append('.')
 diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index 8bf1a70..5a02145 100644
+index 2bcd1dd288..422c13fa4f 100644
 --- a/Lib/distutils/sysconfig.py
 +++ b/Lib/distutils/sysconfig.py
 @@ -17,10 +17,17 @@ import sys
@@ -63,5 +63,5 @@ index 8bf1a70..5a02145 100644
  # Path to the base directory of the project. On Windows the binary may
  # live in project/PCBuild/win32 or project/PCBuild/amd64.
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
index fa0e33d..250d6ec 100644
--- a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
+++ b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
@@ -1,4 +1,4 @@
-From 0458813245e8ba3d5b567cd53303cbe975144e95 Mon Sep 17 00:00:00 2001
+From 01b588baf835ec95df7c5696eff1f6c07eaa1108 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:36:00 +0100
 Subject: [PATCH] Don't look in /usr/lib/termcap for libraries
@@ -9,7 +9,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 4 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index c5bce21..c5eb97d 100644
+index 86643ae8bf..cd00fbdbda 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -786,12 +786,9 @@ class PyBuildExt(build_ext):
@@ -27,5 +27,5 @@ index c5bce21..c5eb97d 100644
                                     libraries=readline_libs) )
          else:
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0006-Don-t-add-multiarch-paths.patch b/package/python3/0006-Don-t-add-multiarch-paths.patch
index 5a858e0..220c54c 100644
--- a/package/python3/0006-Don-t-add-multiarch-paths.patch
+++ b/package/python3/0006-Don-t-add-multiarch-paths.patch
@@ -1,4 +1,4 @@
-From 0d6f96e2fcc7d07000e9077622cd411e3b4a4569 Mon Sep 17 00:00:00 2001
+From 9055171433d5f6beae90815e8c075dc1e0938936 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:36:27 +0100
 Subject: [PATCH] Don't add multiarch paths
@@ -17,7 +17,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index c5eb97d..09fc3ee 100644
+index cd00fbdbda..c956fa08d1 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -497,10 +497,10 @@ class PyBuildExt(build_ext):
@@ -33,5 +33,5 @@ index c5eb97d..09fc3ee 100644
          # Add paths specified in the environment variables LDFLAGS and
          # CPPFLAGS for header and library files.
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0007-Abort-on-failed-module-build.patch b/package/python3/0007-Abort-on-failed-module-build.patch
index 09aa472..a44d6b3 100644
--- a/package/python3/0007-Abort-on-failed-module-build.patch
+++ b/package/python3/0007-Abort-on-failed-module-build.patch
@@ -1,4 +1,4 @@
-From 03936d5f998e60f234617b41f85053ea10b7a3d8 Mon Sep 17 00:00:00 2001
+From 63ab4a20076740bd39985c7dee3d6231cdc74c75 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:43:24 +0100
 Subject: [PATCH] Abort on failed module build
@@ -14,7 +14,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/setup.py b/setup.py
-index 09fc3ee..0be015e 100644
+index c956fa08d1..b3add2be76 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -312,6 +312,7 @@ class PyBuildExt(build_ext):
@@ -26,5 +26,5 @@ index 09fc3ee..0be015e 100644
          if self.failed_on_import:
              failed = self.failed_on_import[:]
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0008-Serial-ioctl-workaround.patch b/package/python3/0008-Serial-ioctl-workaround.patch
index 48ecd83..f303bd0 100644
--- a/package/python3/0008-Serial-ioctl-workaround.patch
+++ b/package/python3/0008-Serial-ioctl-workaround.patch
@@ -1,4 +1,4 @@
-From 076ac00569a0e6b330d75951c599a36464c4902b Mon Sep 17 00:00:00 2001
+From 20767cb868ff271f4501a6e023f367400882d75e Mon Sep 17 00:00:00 2001
 From: Baruch Siach <baruch@tkos.co.il>
 Date: Wed, 23 Dec 2015 11:44:02 +0100
 Subject: [PATCH] Serial ioctl() workaround
@@ -15,7 +15,7 @@ Signed-off-by: Baruch Siach <baruch@tkos.co.il>
  1 file changed, 2 insertions(+)
 
 diff --git a/Modules/termios.c b/Modules/termios.c
-index b78d33e..58b0444 100644
+index b78d33e688..58b0444565 100644
 --- a/Modules/termios.c
 +++ b/Modules/termios.c
 @@ -9,7 +9,9 @@
@@ -29,5 +29,5 @@ index b78d33e..58b0444 100644
  /* HP-UX requires that this be included to pick up MDCD, MCTS, MDSR,
   * MDTR, MRI, and MRTS (appearantly used internally by some things
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch b/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
index 015ecc0..ce84d11 100644
--- a/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
+++ b/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
@@ -1,4 +1,4 @@
-From 0d63a5df20abeea7a5f10eaceed376151565e766 Mon Sep 17 00:00:00 2001
+From 8869b15c754ae615203b65a99e043f56770bacd5 Mon Sep 17 00:00:00 2001
 From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
 Date: Wed, 23 Dec 2015 11:44:30 +0100
 Subject: [PATCH] Do not adjust the shebang of Python scripts for
@@ -18,7 +18,7 @@ Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/distutils/command/build_scripts.py b/Lib/distutils/command/build_scripts.py
-index ccc70e6..d6d5419 100644
+index ccc70e6465..d6d54195c1 100644
 --- a/Lib/distutils/command/build_scripts.py
 +++ b/Lib/distutils/command/build_scripts.py
 @@ -91,7 +91,7 @@ class build_scripts(Command):
@@ -31,5 +31,5 @@ index ccc70e6..d6d5419 100644
                           self.build_dir)
                  updated_files.append(outfile)
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch b/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
index 8a2391f..786e958 100644
--- a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
+++ b/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
@@ -1,4 +1,4 @@
-From 6bb211f4b53e92ffba793863f8c8b97a90f8dd3c Mon Sep 17 00:00:00 2001
+From da3880edac19100f69891f225cc2f07a82be1e52 Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Thu, 20 Nov 2014 13:24:59 +0100
 Subject: [PATCH] Misc/python-config.sh.in: ensure sed invocations only match
@@ -25,7 +25,7 @@ Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
  1 file changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/Misc/python-config.sh.in b/Misc/python-config.sh.in
-index 30c6927..f905a71 100644
+index 30c6927871..f905a7132f 100644
 --- a/Misc/python-config.sh.in
 +++ b/Misc/python-config.sh.in
 @@ -29,12 +29,12 @@ prefix_real=$(installed_prefix "$0")
@@ -56,5 +56,5 @@ index 30c6927..f905a71 100644
  PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
  INCDIR="-I$includedir/python${VERSION}${ABIFLAGS}"
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
index 139537b..1c14840 100644
--- a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
+++ b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
@@ -1,4 +1,4 @@
-From 147a1974d15654c579d5ac854f969d7393a20744 Mon Sep 17 00:00:00 2001
+From 660ea434ad8f921db74c0e3f93aa3ff5daac44f3 Mon Sep 17 00:00:00 2001
 From: Samuel Cabrero <samuelcabrero@gmail.com>
 Date: Wed, 23 Dec 2015 11:45:48 +0100
 Subject: [PATCH] Override system locale and set to default when adding gcc
@@ -20,7 +20,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 0be015e..c865172 100644
+index b3add2be76..29bfd174d2 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -457,7 +457,7 @@ class PyBuildExt(build_ext):
@@ -33,5 +33,5 @@ index 0be015e..c865172 100644
          in_incdirs = False
          inc_dirs = []
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch b/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
index b929fa3..ed0ca26 100644
--- a/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
+++ b/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
@@ -1,4 +1,4 @@
-From 7615840f2298aedc990db3d9be2badb19294a807 Mon Sep 17 00:00:00 2001
+From 9db508467be41bc35f06c0076c855b99a1519d24 Mon Sep 17 00:00:00 2001
 From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
 Date: Wed, 22 Feb 2017 16:48:49 -0800
 Subject: [PATCH] Add importlib fix for PEP 3147 issue
@@ -25,7 +25,7 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  1 file changed, 5 insertions(+), 33 deletions(-)
 
 diff --git a/Lib/importlib/_bootstrap_external.py b/Lib/importlib/_bootstrap_external.py
-index 9feec50..3550013 100644
+index 9feec50842..3550013d58 100644
 --- a/Lib/importlib/_bootstrap_external.py
 +++ b/Lib/importlib/_bootstrap_external.py
 @@ -275,8 +275,6 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
@@ -95,5 +95,5 @@ index 9feec50..3550013 100644
  
  
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
index 17a214f..fc27eda 100644
--- a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
+++ b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
@@ -1,4 +1,4 @@
-From 203087fe335a4b254c415f298ac6710d3f98b27e Mon Sep 17 00:00:00 2001
+From bba0896a05e6406076893dd2f4c3b330e41082a6 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:01:18 -0800
 Subject: [PATCH] Add an option to disable installation of test modules
@@ -16,10 +16,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  2 files changed, 41 insertions(+), 19 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 0e06ddb..029d3e3 100644
+index 4ce917ab8d..4110fff4ac 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1191,8 +1191,28 @@ maninstall:	altmaninstall
+@@ -1194,8 +1194,28 @@ maninstall:	altmaninstall
  
  # Install the library
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
@@ -50,7 +50,7 @@ index 0e06ddb..029d3e3 100644
  		test/audiodata \
  		test/capath test/data \
  		test/cjkencodings test/decimaltestdata test/xmltestdata \
-@@ -1226,29 +1246,26 @@ LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
+@@ -1229,29 +1249,26 @@ LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
  		test/test_importlib/namespace_pkgs/project3/parent/child \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
@@ -95,10 +95,10 @@ index 0e06ddb..029d3e3 100644
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 diff --git a/configure.ac b/configure.ac
-index fc4e71a..972eaca 100644
+index d5ee2aedfb..f924937fe1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3081,6 +3081,11 @@ if test "$posix_threads" = "yes"; then
+@@ -3112,6 +3112,11 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_atfork)
  fi
  
@@ -111,5 +111,5 @@ index fc4e71a..972eaca 100644
  # Check for enable-ipv6
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0014-Add-an-option-to-disable-pydoc.patch b/package/python3/0014-Add-an-option-to-disable-pydoc.patch
index b62a564..fc565cf 100644
--- a/package/python3/0014-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0014-Add-an-option-to-disable-pydoc.patch
@@ -1,4 +1,4 @@
-From 5255a7e995d67a7f192b4cf3921826a365c00281 Mon Sep 17 00:00:00 2001
+From 18a754e930e03d143d9392e49174cc370b334cdd Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:07:56 -0800
 Subject: [PATCH] Add an option to disable pydoc
@@ -17,10 +17,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  3 files changed, 20 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 029d3e3..92315f2 100644
+index 4110fff4ac..badb2af35d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1161,7 +1161,9 @@ bininstall: altbininstall
+@@ -1164,7 +1164,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -30,7 +30,7 @@ index 029d3e3..92315f2 100644
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
  	-rm -f $(DESTDIR)$(BINDIR)/pyvenv
-@@ -1209,7 +1211,7 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1212,7 +1214,7 @@ LIBSUBDIRS=	tkinter site-packages \
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
@@ -39,7 +39,7 @@ index 029d3e3..92315f2 100644
  
  TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		tkinter/test/test_ttk test \
-@@ -1266,6 +1268,10 @@ ifeq (@TEST_MODULES@,yes)
+@@ -1269,6 +1271,10 @@ ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
  
@@ -51,10 +51,10 @@ index 029d3e3..92315f2 100644
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 diff --git a/configure.ac b/configure.ac
-index 972eaca..654594a 100644
+index f924937fe1..1621fa1611 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3081,6 +3081,12 @@ if test "$posix_threads" = "yes"; then
+@@ -3112,6 +3112,12 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_atfork)
  fi
  
@@ -68,10 +68,10 @@ index 972eaca..654594a 100644
  
  AC_ARG_ENABLE(test-modules,
 diff --git a/setup.py b/setup.py
-index c865172..26bf414 100644
+index 29bfd174d2..94dd337fef 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2278,6 +2278,12 @@ def main():
+@@ -2281,6 +2281,12 @@ def main():
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -84,7 +84,7 @@ index c865172..26bf414 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2302,8 +2308,7 @@ def main():
+@@ -2305,8 +2311,7 @@ def main():
            # If you change the scripts installed here, you also need to
            # check the PyBuildScripts command above, and change the links
            # created by the bininstall target in Makefile.pre.in
@@ -95,5 +95,5 @@ index c865172..26bf414 100644
  
  # --install-platlib
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch b/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
index fc44e6f..e6a3938 100644
--- a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
+++ b/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
@@ -1,4 +1,4 @@
-From a60b0237cb8eb1899b5c4dcf71527437e79972c9 Mon Sep 17 00:00:00 2001
+From c2d279b4a19de7a32e8a73e320423f699d408380 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:15:31 -0800
 Subject: [PATCH] Add an option to disable lib2to3
@@ -17,10 +17,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  3 files changed, 21 insertions(+), 6 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 92315f2..8e67c91 100644
+index badb2af35d..931cc3ed07 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1165,7 +1165,9 @@ ifeq (@PYDOC@,yes)
+@@ -1168,7 +1168,9 @@ ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
  endif
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
@@ -30,7 +30,7 @@ index 92315f2..8e67c91 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pyvenv
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pyvenv-$(VERSION) pyvenv)
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
-@@ -1202,7 +1204,6 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1205,7 +1207,6 @@ LIBSUBDIRS=	tkinter site-packages \
  		html json http dbm xmlrpc \
  		sqlite3 \
  		logging csv wsgiref urllib \
@@ -38,7 +38,7 @@ index 92315f2..8e67c91 100644
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
  		distutils distutils/command $(XMLLIBSUBDIRS) \
-@@ -1252,9 +1253,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1255,9 +1256,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_email test/test_email/data \
  		test/test_json \
  		sqlite3/test \
@@ -48,7 +48,7 @@ index 92315f2..8e67c91 100644
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1264,6 +1262,14 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1267,6 +1265,14 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_tools test/test_warnings test/test_warnings/data \
  		unittest/test unittest/test/testmock
  
@@ -63,7 +63,7 @@ index 92315f2..8e67c91 100644
  ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
-@@ -1363,10 +1369,12 @@ ifeq (@PYC_BUILD@,yes)
+@@ -1366,10 +1372,12 @@ ifeq (@PYC_BUILD@,yes)
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  endif
@@ -77,10 +77,10 @@ index 92315f2..8e67c91 100644
  python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	# Substitution happens here, as the completely-expanded BINDIR
 diff --git a/configure.ac b/configure.ac
-index 654594a..b518cbe 100644
+index 1621fa1611..13b2edf8b7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3093,6 +3093,12 @@ AC_ARG_ENABLE(test-modules,
+@@ -3124,6 +3124,12 @@ AC_ARG_ENABLE(test-modules,
  	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
  	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
  
@@ -94,10 +94,10 @@ index 654594a..b518cbe 100644
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 diff --git a/setup.py b/setup.py
-index 26bf414..80ec79b 100644
+index 94dd337fef..76429e1326 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2279,10 +2279,11 @@ def main():
+@@ -2282,10 +2282,11 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -112,5 +112,5 @@ index 26bf414..80ec79b 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
index 9d34f6a..675e828 100644
--- a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
@@ -1,4 +1,4 @@
-From 59b833c2ee545e53bcb920e9509b67419c2fb1ad Mon Sep 17 00:00:00 2001
+From f2965dfb1aa4f6b3216f3bb1d20f99326f127079 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:20:45 -0800
 Subject: [PATCH] Add option to disable the sqlite3 module
@@ -13,10 +13,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  2 files changed, 14 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 8e67c91..3907f92 100644
+index 931cc3ed07..a1ce0712cd 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1202,7 +1202,6 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1205,7 +1205,6 @@ LIBSUBDIRS=	tkinter site-packages \
  		email email/mime \
  		ensurepip ensurepip/_bundled \
  		html json http dbm xmlrpc \
@@ -24,7 +24,7 @@ index 8e67c91..3907f92 100644
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
-@@ -1252,7 +1251,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1255,7 +1254,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_asyncio \
  		test/test_email test/test_email/data \
  		test/test_json \
@@ -32,7 +32,7 @@ index 8e67c91..3907f92 100644
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1270,6 +1268,11 @@ TESTSUBDIRS += lib2to3/tests			\
+@@ -1273,6 +1271,11 @@ TESTSUBDIRS += lib2to3/tests			\
  	lib2to3/tests/data/fixers/myfixes
  endif
  
@@ -45,10 +45,10 @@ index 8e67c91..3907f92 100644
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
 diff --git a/configure.ac b/configure.ac
-index b518cbe..a30c45d 100644
+index 13b2edf8b7..d7582cfea4 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3081,6 +3081,15 @@ if test "$posix_threads" = "yes"; then
+@@ -3112,6 +3112,15 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_atfork)
  fi
  
@@ -65,5 +65,5 @@ index b518cbe..a30c45d 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
index 925eb82..5619641 100644
--- a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
@@ -1,4 +1,4 @@
-From 4fc4260e66f8b004f14feb332c57a2d8fdd305de Mon Sep 17 00:00:00 2001
+From f96a00d42e714171f1d90501ed73594fddee570f Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:23:42 -0800
 Subject: [PATCH] Add an option to disable the tk module
@@ -13,10 +13,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  2 files changed, 17 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 3907f92..93ef34d 100644
+index a1ce0712cd..dc1e917cc3 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1196,7 +1196,7 @@ maninstall:	altmaninstall
+@@ -1199,7 +1199,7 @@ maninstall:	altmaninstall
  # Install the library
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
  
@@ -25,7 +25,7 @@ index 3907f92..93ef34d 100644
  		asyncio \
  		collections concurrent concurrent/futures encodings \
  		email email/mime \
-@@ -1213,8 +1213,7 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1216,8 +1216,7 @@ LIBSUBDIRS=	tkinter site-packages \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
  		curses
  
@@ -35,7 +35,7 @@ index 3907f92..93ef34d 100644
  		test/audiodata \
  		test/capath test/data \
  		test/cjkencodings test/decimaltestdata test/xmltestdata \
-@@ -1260,6 +1259,12 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1263,6 +1262,12 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_tools test/test_warnings test/test_warnings/data \
  		unittest/test unittest/test/testmock
  
@@ -49,10 +49,10 @@ index 3907f92..93ef34d 100644
  LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
  TESTSUBDIRS += lib2to3/tests			\
 diff --git a/configure.ac b/configure.ac
-index a30c45d..52887c9 100644
+index d7582cfea4..6a56a5b0c1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3090,6 +3090,15 @@ if test "$SQLITE3" = "no" ; then
+@@ -3121,6 +3121,15 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
@@ -69,5 +69,5 @@ index a30c45d..52887c9 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
index 18d6431..b68369c 100644
--- a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
@@ -1,4 +1,4 @@
-From 25cb62e9ff67c990be5a694d66394f20b7ca1fda Mon Sep 17 00:00:00 2001
+From 404aad42698c6d5cbd78421720f9a2bc0e8ec9fe Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:31:51 -0800
 Subject: [PATCH] Add an option to disable the curses module
@@ -13,10 +13,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  2 files changed, 14 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 93ef34d..3621130 100644
+index dc1e917cc3..6a6bc082cd 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1210,8 +1210,7 @@ LIBSUBDIRS=	site-packages \
+@@ -1213,8 +1213,7 @@ LIBSUBDIRS=	site-packages \
  		turtledemo \
  		multiprocessing multiprocessing/dummy \
  		unittest \
@@ -26,7 +26,7 @@ index 93ef34d..3621130 100644
  
  TESTSUBDIRS=	test \
  		test/audiodata \
-@@ -1265,6 +1264,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
+@@ -1268,6 +1267,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
  	tkinter/test/test_ttk
  endif
  
@@ -38,10 +38,10 @@ index 93ef34d..3621130 100644
  LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
  TESTSUBDIRS += lib2to3/tests			\
 diff --git a/configure.ac b/configure.ac
-index 52887c9..485f73c 100644
+index 6a56a5b0c1..5896b39ff9 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3099,6 +3099,15 @@ if test "$TK" = "no"; then
+@@ -3130,6 +3130,15 @@ if test "$TK" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
@@ -58,5 +58,5 @@ index 52887c9..485f73c 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0019-Add-an-option-to-disable-expat.patch b/package/python3/0019-Add-an-option-to-disable-expat.patch
index bdbfece..0ec0b21 100644
--- a/package/python3/0019-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0019-Add-an-option-to-disable-expat.patch
@@ -1,4 +1,4 @@
-From a7e1fc80dc729018e806d6f3202c852c0d69cba7 Mon Sep 17 00:00:00 2001
+From 63fc5bc90cb57460552b544cbed0c2939759ab9e Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:40:45 -0800
 Subject: [PATCH] Add an option to disable expat
@@ -20,10 +20,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  3 files changed, 19 insertions(+), 7 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 3621130..a9bdbde 100644
+index 6a6bc082cd..dc4b92b6fe 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1205,7 +1205,7 @@ LIBSUBDIRS=	site-packages \
+@@ -1208,7 +1208,7 @@ LIBSUBDIRS=	site-packages \
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
@@ -32,7 +32,7 @@ index 3621130..a9bdbde 100644
  		importlib \
  		turtledemo \
  		multiprocessing multiprocessing/dummy \
-@@ -1268,6 +1268,10 @@ ifeq (@CURSES@,yes)
+@@ -1271,6 +1271,10 @@ ifeq (@CURSES@,yes)
  LIBSUBDIRS += curses
  endif
  
@@ -44,10 +44,10 @@ index 3621130..a9bdbde 100644
  LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
  TESTSUBDIRS += lib2to3/tests			\
 diff --git a/configure.ac b/configure.ac
-index 485f73c..a426b3a 100644
+index 5896b39ff9..6f21482207 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2782,13 +2782,21 @@ PKG_PROG_PKG_CONFIG
+@@ -2813,13 +2813,21 @@ PKG_PROG_PKG_CONFIG
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
@@ -75,10 +75,10 @@ index 485f73c..a426b3a 100644
  # Check for use of the system libffi library
  AC_MSG_CHECKING(for --with-system-ffi)
 diff --git a/setup.py b/setup.py
-index 80ec79b..660bbd7 100644
+index 76429e1326..38aa5e605e 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1492,7 +1492,7 @@ class PyBuildExt(build_ext):
+@@ -1495,7 +1495,7 @@ class PyBuildExt(build_ext):
          #
          # More information on Expat can be found at www.libexpat.org.
          #
@@ -88,5 +88,5 @@ index 80ec79b..660bbd7 100644
              define_macros = []
              expat_lib = ['expat']
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch b/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
index 80c46a8..6b316d8 100644
--- a/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
+++ b/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
@@ -1,4 +1,4 @@
-From 4c2965ff24ab8b7351222b210f01ac7db52f4dc7 Mon Sep 17 00:00:00 2001
+From 3335500cb13a6bc1ab41dfcf00b33e6ade3b9764 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:49:55 +0100
 Subject: [PATCH] Add an option to disable CJK codecs
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index a426b3a..d88ae47 100644
+index 6f21482207..c7742faf41 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3098,6 +3098,12 @@ if test "$SQLITE3" = "no" ; then
+@@ -3129,6 +3129,12 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
@@ -26,5 +26,5 @@ index a426b3a..d88ae47 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0021-Add-an-option-to-disable-NIS.patch b/package/python3/0021-Add-an-option-to-disable-NIS.patch
index b5111cb..f49b23f 100644
--- a/package/python3/0021-Add-an-option-to-disable-NIS.patch
+++ b/package/python3/0021-Add-an-option-to-disable-NIS.patch
@@ -1,4 +1,4 @@
-From dd10e4ddda9fd4b8205169d223541ab0af506111 Mon Sep 17 00:00:00 2001
+From e52d4868cc1192f7e1c147aebaf4fc6f7de30357 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:50:11 +0100
 Subject: [PATCH] Add an option to disable NIS
@@ -12,10 +12,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index d88ae47..0099a4a 100644
+index c7742faf41..42a871bb09 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3104,6 +3104,12 @@ AC_ARG_ENABLE(codecs-cjk,
+@@ -3135,6 +3135,12 @@ AC_ARG_ENABLE(codecs-cjk,
  		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
  	fi])
  
@@ -29,5 +29,5 @@ index d88ae47..0099a4a 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0022-Add-an-option-to-disable-unicodedata.patch b/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
index 7ffcff2..9c207be 100644
--- a/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
+++ b/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
@@ -1,4 +1,4 @@
-From 949887ee3dbbb274539309d3c42ac04fdd67f34f Mon Sep 17 00:00:00 2001
+From 69d3e8f0438d01adde55e90eeabafa4abefd3b02 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:50:27 +0100
 Subject: [PATCH] Add an option to disable unicodedata
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 0099a4a..9820526 100644
+index 42a871bb09..1d610e132b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3110,6 +3110,12 @@ AC_ARG_ENABLE(nis,
+@@ -3141,6 +3141,12 @@ AC_ARG_ENABLE(nis,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
@@ -26,5 +26,5 @@ index 0099a4a..9820526 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0023-Add-an-option-to-disable-IDLE.patch b/package/python3/0023-Add-an-option-to-disable-IDLE.patch
index 99ae10b..da77c44 100644
--- a/package/python3/0023-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0023-Add-an-option-to-disable-IDLE.patch
@@ -1,4 +1,4 @@
-From 49814176a19247a39c55feb8e0eb3656cd801118 Mon Sep 17 00:00:00 2001
+From 5bbd94f014c89665d02a8a32442822ab7c5520d0 Mon Sep 17 00:00:00 2001
 From: Maxime Ripard <maxime.ripard@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:45:14 -0800
 Subject: [PATCH] Add an option to disable IDLE
@@ -16,10 +16,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  3 files changed, 15 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index a9bdbde..82b01c9 100644
+index dc4b92b6fe..3e43066d90 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1159,7 +1159,9 @@ bininstall: altbininstall
+@@ -1162,7 +1162,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION).pc python3.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -29,7 +29,7 @@ index a9bdbde..82b01c9 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -1204,7 +1206,6 @@ LIBSUBDIRS=	site-packages \
+@@ -1207,7 +1209,6 @@ LIBSUBDIRS=	site-packages \
  		html json http dbm xmlrpc \
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
@@ -37,7 +37,7 @@ index a9bdbde..82b01c9 100644
  		distutils distutils/command \
  		importlib \
  		turtledemo \
-@@ -1272,6 +1273,10 @@ ifeq (@EXPAT@,yes)
+@@ -1275,6 +1276,10 @@ ifeq (@EXPAT@,yes)
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
@@ -49,10 +49,10 @@ index a9bdbde..82b01c9 100644
  LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
  TESTSUBDIRS += lib2to3/tests			\
 diff --git a/configure.ac b/configure.ac
-index 9820526..72989a1 100644
+index 1d610e132b..2699e7ceb1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3152,6 +3152,12 @@ AC_ARG_ENABLE(lib2to3,
+@@ -3183,6 +3183,12 @@ AC_ARG_ENABLE(lib2to3,
  	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
  	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
  
@@ -66,10 +66,10 @@ index 9820526..72989a1 100644
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 diff --git a/setup.py b/setup.py
-index 660bbd7..1079eba 100644
+index 38aa5e605e..d642825c1e 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2279,11 +2279,13 @@ def main():
+@@ -2282,11 +2282,13 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -85,5 +85,5 @@ index 660bbd7..1079eba 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0024-Add-an-option-to-disable-decimal.patch b/package/python3/0024-Add-an-option-to-disable-decimal.patch
index 27a2421..76ef508 100644
--- a/package/python3/0024-Add-an-option-to-disable-decimal.patch
+++ b/package/python3/0024-Add-an-option-to-disable-decimal.patch
@@ -1,4 +1,4 @@
-From dc321780e26a9270f20b784f438a632bd952cbb3 Mon Sep 17 00:00:00 2001
+From 0870559b9af82b55f1fd8b35528510f563577256 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:51:31 +0100
 Subject: [PATCH] Add an option to disable decimal
@@ -15,10 +15,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  2 files changed, 13 insertions(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 72989a1..71aea1d 100644
+index 2699e7ceb1..e2c3b6f25c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2831,13 +2831,20 @@ AC_SUBST(LIBFFI_INCLUDEDIR)
+@@ -2862,13 +2862,20 @@ AC_SUBST(LIBFFI_INCLUDEDIR)
  AC_MSG_RESULT($with_system_ffi)
  
  # Check for use of the system libmpdec library
@@ -45,10 +45,10 @@ index 72989a1..71aea1d 100644
  # Check for support for loadable sqlite extensions
  AC_MSG_CHECKING(for --enable-loadable-sqlite-extensions)
 diff --git a/setup.py b/setup.py
-index 1079eba..c3a96c1 100644
+index d642825c1e..5b98255857 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2055,7 +2055,7 @@ class PyBuildExt(build_ext):
+@@ -2058,7 +2058,7 @@ class PyBuildExt(build_ext):
      def _decimal_ext(self):
          extra_compile_args = []
          undef_macros = []
@@ -58,5 +58,5 @@ index 1079eba..c3a96c1 100644
              libraries = [':libmpdec.so.2']
              sources = ['_decimal/_decimal.c']
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
index f8eeed0..418936c 100644
--- a/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
+++ b/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
@@ -1,4 +1,4 @@
-From 48f485cfdf79452308a0c6ac24a25c31bacbcbec Mon Sep 17 00:00:00 2001
+From a04fb6159e394ec8346cd49993fdf70db3e1b184 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:51:58 +0100
 Subject: [PATCH] Add an option to disable the ossaudiodev module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 71aea1d..9a61018 100644
+index e2c3b6f25c..8e3dded25e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2846,6 +2846,12 @@ else
+@@ -2877,6 +2877,12 @@ else
  fi
  AC_SUBST(MPDEC)
  
@@ -26,5 +26,5 @@ index 71aea1d..9a61018 100644
  AC_MSG_CHECKING(for --enable-loadable-sqlite-extensions)
  AC_ARG_ENABLE(loadable-sqlite-extensions,
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0027-Add-an-option-to-disable-openssl-support.patch b/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
similarity index 83%
rename from package/python3/0027-Add-an-option-to-disable-openssl-support.patch
rename to package/python3/0026-Add-an-option-to-disable-openssl-support.patch
index 348e511..065e506 100644
--- a/package/python3/0027-Add-an-option-to-disable-openssl-support.patch
+++ b/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
@@ -1,4 +1,4 @@
-From 275db73c38e9b2135c774c475826fa077f8835c4 Mon Sep 17 00:00:00 2001
+From 4b001683ad1cb1d90b7c389e67447a250fa9c218 Mon Sep 17 00:00:00 2001
 From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 Date: Wed, 22 Feb 2017 17:55:59 -0800
 Subject: [PATCH] Add an option to disable openssl support.
@@ -9,10 +9,10 @@ Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 3a12788..af12c09 100644
+index 8e3dded25e..28bcdabd67 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3132,6 +3132,12 @@ AC_ARG_ENABLE(unicodedata,
+@@ -3160,6 +3160,12 @@ AC_ARG_ENABLE(unicodedata,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
    	  fi])
  
@@ -26,5 +26,5 @@ index 3a12788..af12c09 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0026-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch b/package/python3/0026-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch
deleted file mode 100644
index 9de7621..0000000
--- a/package/python3/0026-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 0fbfab21290eeca5b908745e5fb51d2ab2a50aef Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 22 Feb 2017 17:53:40 -0800
-Subject: [PATCH] Support PGEN_FOR_BUILD and FREEZE_IMPORTLIB_FOR_BUILD
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[ Andrey Smirnov: ported to Python 3.6 ]
-Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
----
- Makefile.pre.in | 10 ++++++++++
- configure.ac    |  3 +++
- 2 files changed, 13 insertions(+)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 82b01c9..7c14a4e 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -719,10 +719,15 @@ Programs/_testembed: Programs/_testembed.o $(LIBRARY) $(LDLIBRARY) $(PY3LIBRARY)
- ############################################################################
- # Importlib
- 
-+ifeq (@FREEZE_IMPORTLIB_FOR_BUILD@,)
- Programs/_freeze_importlib.o: Programs/_freeze_importlib.c Makefile
- 
- Programs/_freeze_importlib: Programs/_freeze_importlib.o $(LIBRARY_OBJS_OMIT_FROZEN)
- 	$(LINKCC) $(PY_LDFLAGS) -o $@ Programs/_freeze_importlib.o $(LIBRARY_OBJS_OMIT_FROZEN) $(LIBS) $(MODLIBS) $(SYSLIBS) $(LDLAST)
-+else
-+Programs/_freeze_importlib: @FREEZE_IMPORTLIB_FOR_BUILD@
-+	cp $^ $@
-+endif
- 
- Python/importlib_external.h: @GENERATED_COMMENT@ $(srcdir)/Lib/importlib/_bootstrap_external.py Programs/_freeze_importlib Python/marshal.c
- 	./Programs/_freeze_importlib \
-@@ -796,8 +801,13 @@ $(GRAMMAR_H): @GENERATED_COMMENT@ $(GRAMMAR_INPUT) $(PGEN)
- $(GRAMMAR_C): @GENERATED_COMMENT@ $(GRAMMAR_H)
- 	touch $(GRAMMAR_C)
- 
-+ifeq (@PGEN_FOR_BUILD@,)
- $(PGEN): $(PGENOBJS)
- 		$(CC) $(OPT) $(PY_LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
-+else
-+$(PGEN): @PGEN_FOR_BUILD@
-+		cp $^ $@
-+endif
- 
- Parser/grammar.o:	$(srcdir)/Parser/grammar.c \
- 				$(srcdir)/Include/token.h \
-diff --git a/configure.ac b/configure.ac
-index 9a61018..3a12788 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -91,6 +91,9 @@ fi
- AC_SUBST(PYTHON_FOR_BUILD)
- AC_SUBST(GENERATED_COMMENT)
- 
-+AC_SUBST(PGEN_FOR_BUILD)
-+AC_SUBST(FREEZE_IMPORTLIB_FOR_BUILD)
-+
- dnl Ensure that if prefix is specified, it does not end in a slash. If
- dnl it does, we get path names containing '//' which is both ugly and
- dnl can cause trouble.
--- 
-2.9.3
-
diff --git a/package/python3/0028-Add-an-option-to-disable-the-readline-module.patch b/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
similarity index 82%
rename from package/python3/0028-Add-an-option-to-disable-the-readline-module.patch
rename to package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
index 0c50451..eb19675 100644
--- a/package/python3/0028-Add-an-option-to-disable-the-readline-module.patch
+++ b/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
@@ -1,4 +1,4 @@
-From 57e9ef788c27a112b79e489b375882f66f818b0a Mon Sep 17 00:00:00 2001
+From d35deaa5c65c29f2a56a29fd5fc1dadadd485eaf Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 23:29:05 +0100
 Subject: [PATCH] Add an option to disable the readline module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index af12c09..64dadb4 100644
+index 28bcdabd67..484f6ebaca 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3138,6 +3138,12 @@ AC_ARG_ENABLE(openssl,
+@@ -3166,6 +3166,12 @@ AC_ARG_ENABLE(openssl,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
  	  fi])
  
@@ -26,5 +26,5 @@ index af12c09..64dadb4 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/0029-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch b/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
similarity index 87%
rename from package/python3/0029-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
rename to package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
index 733b8db..39330ac 100644
--- a/package/python3/0029-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
+++ b/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
@@ -1,4 +1,4 @@
-From 25c72356a587dbc3a08679c6713be02a18f7e646 Mon Sep 17 00:00:00 2001
+From 9e95f88906f850caa789977dab4b0f256b575254 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 23:31:11 +0100
 Subject: [PATCH] Add options to disable zlib, bzip2 and xz modules
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 18 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 64dadb4..92e9abe 100644
+index 484f6ebaca..79538df0cf 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3144,6 +3144,24 @@ AC_ARG_ENABLE(readline,
+@@ -3172,6 +3172,24 @@ AC_ARG_ENABLE(readline,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
  	  fi])
  
@@ -38,5 +38,5 @@ index 64dadb4..92e9abe 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.9.3
+2.13.5
 
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 26d08de..f4734db 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-361/
-md5 692b4fc3a2ba0d54d1495d4ead5b0b5c Python-3.6.1.tar.xz
+# From https://www.python.org/downloads/release/python-362/
+md5 2c68846471994897278364fc18730dd9 Python-3.6.2.tar.xz
 # Locally computed
-sha256 a01810ddfcec216bcdb357a84bfaafdfaa0ca42bbdaa4cb7ff74f5a9961e4041 Python-3.6.1.tar.xz
+sha256 9229773be41ed144370f47f0f626a1579931f5a390f1e8e3853174d52edd64a9 Python-3.6.2.tar.xz
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index a18dc7f..7473737 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.6
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).1
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = http://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
@@ -18,11 +18,8 @@ PYTHON3_LICENSE_FILES = LICENSE
 # the Python sources, but instead use an external libffi library.
 PYTHON3_LIBTOOL_PATCH = NO
 
-# Python needs itself and a "pgen" program to build itself, both being
-# provided in the Python sources. So in order to cross-compile Python,
-# we need to build a host Python first. This host Python is also
-# installed in $(HOST_DIR), as it is needed when cross-compiling
-# third-party Python modules.
+# This host Python is installed in $(HOST_DIR), as it is needed when
+# cross-compiling third-party Python modules.
 
 HOST_PYTHON3_CONF_OPTS += \
 	--without-ensurepip \
@@ -162,21 +159,48 @@ PYTHON3_CONF_OPTS += \
 	--disable-idle3 \
 	--disable-pyc-build
 
-# Python builds two tools to generate code: 'pgen' and
-# '_freeze_importlib'. Unfortunately, for the target Python, they are
-# built for the target, while we need to run them at build time. So
-# when installing host-python, we copy them to
-# $(HOST_DIR)/bin. And then, when building the target python
-# package, we tell the configure script where they are located.
-define HOST_PYTHON3_INSTALL_TOOLS
-	cp $(@D)/Parser/pgen $(HOST_DIR)/bin/python-pgen
+
+#
+# Some of CPython's source code is generated using Python interpreter
+# and some helper tools such as "Programs/_freeze_importlib" or
+# "Parser/pgen" (look for regen-* targets in Makefile.pre.in for more
+# info). Normally CPython codebase ships with those files
+# pre-generated, so just regular "make" with no additional steps
+# should be sufficient for a succesfull build, however due to
+# Buildroot's "Add importlib fix for PEP 3147 issue" custom patch we
+# end up modifying "Lib/importlib/_bootstrap_external.py" which means
+# we have to do "regen-importlib" step before building CPython
+# (Importlib is a builtin module that needs to be "frozen"/converted
+# to a C array of bytecode using "Programs/_freeze_importlib")
+#
+# To achive that we add pre-build steps to host-python3 as well as
+# python3 that execute "regen-importlib" target.
+#
+# Unfortunately, for the target Python, "Programs/_freeze_importlib"
+# is built for the target, while we need to run them at build time. So
+# when installing host-python3, we copy them to $(HOST_DIR)/bin...
+#
+define HOST_PYTHON3_MAKE_REGEN_IMPORTLIB
+	$(HOST_MAKE_ENV) $(PYTHON3_CONF_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) regen-importlib
 	cp $(@D)/Programs/_freeze_importlib $(HOST_DIR)/bin/python-freeze-importlib
 endef
-HOST_PYTHON3_POST_INSTALL_HOOKS += HOST_PYTHON3_INSTALL_TOOLS
 
-PYTHON3_CONF_ENV += \
-	PGEN_FOR_BUILD=$(HOST_DIR)/bin/python-pgen \
-	FREEZE_IMPORTLIB_FOR_BUILD=$(HOST_DIR)/bin/python-freeze-importlib
+HOST_PYTHON3_PRE_BUILD_HOOKS += HOST_PYTHON3_MAKE_REGEN_IMPORTLIB
+#
+# ... And then, when building the target python we first buid
+# 'Programs/_freeze_importlib' to force GNU Make to update all of the
+# prerequisites of 'Programs/_freeze_importlib', then copy our stashed
+# "host-usable" version over the one that was just build and then
+# build "regen-importlib" target
+#
+define PYTHON3_MAKE_REGEN_IMPORTLIB
+	$(TARGET_MAKE_ENV) $(PYTHON3_CONF_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) Programs/_freeze_importlib
+	cp $(HOST_DIR)/bin/python-freeze-importlib $(@D)/Programs/_freeze_importlib
+	$(TARGET_MAKE_ENV) $(PYTHON3_CONF_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) regen-importlib
+endef
+
+PYTHON3_PRE_BUILD_HOOKS += PYTHON3_MAKE_REGEN_IMPORTLIB
+
 
 #
 # Remove useless files. In the config/ directory, only the Makefile
