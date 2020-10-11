From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 11 Oct 2020 18:11:53 +0200
Subject: [Buildroot] [PATCH] package/apparmor: bump to version 3.0.0
Message-ID: <20201011161153.621450-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bump apparmor/libapparmor to version 3.0.0

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---

Clean tested with systemd and systemv

 ...inutils-fix-compilation-with-libintl.patch | 48 ----------
 ...replace-deprecated-egrep-with-grep-e.patch | 28 ------
 ...apparmor.functions-to-work-with-busy.patch | 37 --------
 package/apparmor/apparmor.hash                |  2 +-
 package/apparmor/apparmor.mk                  |  6 +-
 ...el-fixing-for-crosscompiling-environ.patch | 91 -------------------
 ...ng-setup.py-call-when-crosscompiling.patch | 30 ------
 package/libapparmor/libapparmor.hash          |  2 +-
 package/libapparmor/libapparmor.mk            |  6 +-
 9 files changed, 8 insertions(+), 242 deletions(-)
 delete mode 100644 package/apparmor/0001-parser-binutils-fix-compilation-with-libintl.patch
 delete mode 100644 package/apparmor/0002-replace-deprecated-egrep-with-grep-e.patch
 delete mode 100644 package/apparmor/0003-fix-regex-in-rc.apparmor.functions-to-work-with-busy.patch
 delete mode 100644 package/libapparmor/0001-m4-ac_python_devel-fixing-for-crosscompiling-environ.patch
 delete mode 100644 package/libapparmor/0002-libapparmor-fixing-setup.py-call-when-crosscompiling.patch

diff --git a/package/apparmor/0001-parser-binutils-fix-compilation-with-libintl.patch b/package/apparmor/0001-parser-binutils-fix-compilation-with-libintl.patch
deleted file mode 100644
index d3f4a51646..0000000000
--- a/package/apparmor/0001-parser-binutils-fix-compilation-with-libintl.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From c9fe40d9386a5e4cf99f44df9b98382d83f1c4f4 Mon Sep 17 00:00:00 2001
-From: Angelo Compagnucci <angelo@amarulasolutions.com>
-Date: Fri, 24 Apr 2020 17:34:24 +0200
-Subject: [PATCH] parser: binutils: fix compilation with libintl
-
-When libintl is available on the system, we need to link against the
-libintl library too.
-
-Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
----
- binutils/Makefile | 4 ++++
- parser/Makefile   | 5 +++++
- 2 files changed, 9 insertions(+)
-
-diff --git a/binutils/Makefile b/binutils/Makefile
-index 11459bec..d8c1b634 100644
---- a/binutils/Makefile
-+++ b/binutils/Makefile
-@@ -56,6 +56,10 @@ SBINTOOLS = aa-status
- 
- AALIB = -Wl,-Bstatic -lapparmor  -Wl,-Bdynamic -lpthread
- 
-+ifdef WITH_LIBINTL
-+	AALIB += -lintl
-+endif
-+
- ifdef USE_SYSTEM
-   # Using the system libapparmor so Makefile dependencies can't be used
-   LIBAPPARMOR_A =
-diff --git a/parser/Makefile b/parser/Makefile
-index eab64be9..998230ee 100644
---- a/parser/Makefile
-+++ b/parser/Makefile
-@@ -91,6 +91,11 @@ AAREOBJECTS = $(AAREOBJECT)
- AARE_LDFLAGS = -static-libgcc -static-libstdc++ -L. $(LDFLAGS)
- AALIB = -Wl,-Bstatic -lapparmor -Wl,-Bdynamic -lpthread
- 
-+ifdef WITH_LIBINTL
-+	AALIB += -lintl
-+endif
-+
-+
- ifdef USE_SYSTEM
-   # Using the system libapparmor so Makefile dependencies can't be used
-   LIBAPPARMOR_A =
--- 
-2.25.1
-
diff --git a/package/apparmor/0002-replace-deprecated-egrep-with-grep-e.patch b/package/apparmor/0002-replace-deprecated-egrep-with-grep-e.patch
deleted file mode 100644
index 4caefe447b..0000000000
--- a/package/apparmor/0002-replace-deprecated-egrep-with-grep-e.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 5f46dedd6e8109d845af118b36039a5d7dd05af9 Mon Sep 17 00:00:00 2001
-From: Christian Boltz <apparmor@cboltz.de>
-Date: Mon, 18 Mar 2019 19:17:16 +0100
-Subject: [PATCH] replace deprecated egrep with grep -e
-
-(cherry picked from commit 5f46dedd6e8109d845af118b36039a5d7dd05af9)
-Signed-off-by: Christian Boltz <apparmor@cboltz.de>
-Signed-off-by: Adam Duskett <Aduskett@gmail.com>
----
- parser/rc.apparmor.functions | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/parser/rc.apparmor.functions b/parser/rc.apparmor.functions
-index 22e8367..f3108f8 100644
---- a/parser/rc.apparmor.functions
-+++ b/parser/rc.apparmor.functions
-@@ -129,7 +129,7 @@ skip_profile() {
- 	     "${profile%.pacnew}" != "${profile}" ] ; then
- 		return 2
- 	fi
--	if echo "${profile}" | egrep -q '^.+\.new-[0-9\.]+_[0-9]+$'; then
-+	if echo "${profile}" | grep -E -q '^.+\.new-[0-9\.]+_[0-9]+$'; then
- 		return 2
- 	fi
- 
--- 
-2.26.2
-
diff --git a/package/apparmor/0003-fix-regex-in-rc.apparmor.functions-to-work-with-busy.patch b/package/apparmor/0003-fix-regex-in-rc.apparmor.functions-to-work-with-busy.patch
deleted file mode 100644
index c372a86998..0000000000
--- a/package/apparmor/0003-fix-regex-in-rc.apparmor.functions-to-work-with-busy.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 12764faa0a01bcc4e0ffc92ce308985dbad0d954 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Aduskett@gmail.com>
-Date: Thu, 7 May 2020 18:25:29 -0700
-Subject: [PATCH] fix regex in rc.apparmor.functions to work with busybox
-
-The following regex string in rc.apparmor.functions
-"^/.*[ \t]+flags[ \t]*=[ \t]*\([ \t]*complain[ \t]*\)[ \t]+{" is broken due to
-the unescaped {. GNU grep ignores the error. However, the Busybox grep does
-not and throws the error "unescaped character {"
-
-Escape the "{" character to fix this issue.
-
-Note: Upstream has rewritten large sections of the rc.apparmor.functions file
-and the function this patch fixes will no longer be necessary after the next
-version is released.
-
-Signed-off-by: Adam Duskett <Aduskett@gmail.com>
----
- parser/rc.apparmor.functions | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/parser/rc.apparmor.functions b/parser/rc.apparmor.functions
-index f3108f8..db0697c 100644
---- a/parser/rc.apparmor.functions
-+++ b/parser/rc.apparmor.functions
-@@ -140,7 +140,7 @@ force_complain() {
- 	local profile=$1
- 
- 	# if profile not in complain mode
--	if ! egrep -q "^/.*[ \t]+flags[ \t]*=[ \t]*\([ \t]*complain[ \t]*\)[ \t]+{" $profile ; then
-+	if ! grep -E -q "^/.*[ \t]+flags[ \t]*=[ \t]*\([ \t]*complain[ \t]*\)[ \t]+\{" $profile ; then
- 		local link="${PROFILE_DIR}/force-complain/`basename ${profile}`"
- 		if [ -e "$link" ] ; then
- 			aa_log_warning_msg "found $link, forcing complain mode"
--- 
-2.26.2
-
diff --git a/package/apparmor/apparmor.hash b/package/apparmor/apparmor.hash
index c7caef7beb..345a922812 100644
--- a/package/apparmor/apparmor.hash
+++ b/package/apparmor/apparmor.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  90bf86c07ffbe2c22be46d75c7345fad12d5911653c59750a37d59c63ad5d10e  apparmor-2.13.4.tar.gz
+sha256  66fd751fe51eb427d2aa864ee035b12d01d212fd595579275219b0148c43755e  apparmor-3.0.0.tar.gz
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
 sha256  dd54950fa69a3096fe907a466a454d217ccca9bca77398d5232704766d5a0040  parser/COPYING.GPL
diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index 51820999eb..4d08b0433b 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # When updating the version here, please also update the libapparmor package
-APPARMOR_VERSION_MAJOR = 2.13
-APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).4
-APPARMOR_SITE = https://launchpad.net/apparmor/$(APPARMOR_VERSION_MAJOR)/$(APPARMOR_VERSION)/+download
+APPARMOR_VERSION_MAJOR = 3.0
+APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).0
+APPARMOR_SITE = https://launchpad.net/apparmor/$(APPARMOR_VERSION_MAJOR)/$(APPARMOR_VERSION_MAJOR)/+download
 APPARMOR_DL_SUBDIR = libapparmor
 APPARMOR_LICENSE = GPL-2.0
 APPARMOR_LICENSE_FILES = LICENSE parser/COPYING.GPL
diff --git a/package/libapparmor/0001-m4-ac_python_devel-fixing-for-crosscompiling-environ.patch b/package/libapparmor/0001-m4-ac_python_devel-fixing-for-crosscompiling-environ.patch
deleted file mode 100644
index ecd8d6c163..0000000000
--- a/package/libapparmor/0001-m4-ac_python_devel-fixing-for-crosscompiling-environ.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 64e5c6b23de9c147881680f3daccb995263c34a3 Mon Sep 17 00:00:00 2001
-From: Angelo Compagnucci <angelo@amarulasolutions.com>
-Date: Tue, 24 Mar 2020 22:53:37 +0100
-Subject: [PATCH] m4: ac_python_devel: fixing for crosscompiling environments
-
-In a crosscompiling environment it's common to have a python executable
-running for the host system with a python-config reporting the host
-configuration and a second python-config reporting the target configuration.
-In such cases, relying on the default oython-config is wrong and breaks
-the cross compilation.
-
-This patch adds a PYTHON_CONFIG variable that can be pointed to the second
-python-config and fixes the rest of the m4 accordingly.
-
-Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
----
- libraries/libapparmor/m4/ac_python_devel.m4 | 23 ++++++++++++++++-----
- 1 file changed, 18 insertions(+), 5 deletions(-)
-
-diff --git a/libraries/libapparmor/m4/ac_python_devel.m4 b/libraries/libapparmor/m4/ac_python_devel.m4
-index 29cf090d..6454e2d8 100644
---- a/libraries/libapparmor/m4/ac_python_devel.m4
-+++ b/libraries/libapparmor/m4/ac_python_devel.m4
-@@ -13,6 +13,11 @@ AC_DEFUN([AC_PYTHON_DEVEL],[
-            PYTHON_VERSION=""
-         fi
- 
-+        AC_PATH_PROG([PYTHON_CONFIG],[`basename [$PYTHON]-config`])
-+        if test -z "$PYTHON_CONFIG"; then
-+           AC_MSG_ERROR([Cannot find python$PYTHON_VERSION-config in your system path])
-+        fi
-+
-         #
-         # Check for a version of Python >= 2.1.0
-         #
-@@ -79,8 +84,8 @@ $ac_distutils_result])
-         # Check for Python include path
-         #
-         AC_MSG_CHECKING([for Python include path])
--        if type $PYTHON-config; then
--                PYTHON_CPPFLAGS=`$PYTHON-config --includes`
-+        if type $PYTHON_CONFIG; then
-+                PYTHON_CPPFLAGS=`$PYTHON_CONFIG --includes`
-         fi
-         if test -z "$PYTHON_CPPFLAGS"; then
-                 python_path=`$PYTHON -c "import sys; import distutils.sysconfig;\
-@@ -97,8 +102,8 @@ sys.stdout.write('%s\n' % distutils.sysconfig.get_python_inc());"`
-         # Check for Python library path
-         #
-         AC_MSG_CHECKING([for Python library path])
--        if type $PYTHON-config; then
--                PYTHON_LDFLAGS=`$PYTHON-config --ldflags`
-+        if type $PYTHON_CONFIG; then
-+                PYTHON_LDFLAGS=`$PYTHON_CONFIG --ldflags`
-         fi
-         if test -z "$PYTHON_LDFLAGS"; then
-                 # (makes two attempts to ensure we've got a version number
-@@ -136,6 +141,10 @@ sys.stdout.write('%s\n' % distutils.sysconfig.get_python_lib(0,0));"`
-         # libraries which must be linked in when embedding
-         #
-         AC_MSG_CHECKING(python extra libraries)
-+        if type $PYTHON_CONFIG; then
-+                PYTHON_EXTRA_LIBS=`$PYTHON_CONFIG --libs --embed` || \
-+                        PYTHON_EXTRA_LIBS=''
-+        fi
-         if test -z "$PYTHON_EXTRA_LIBS"; then
-            PYTHON_EXTRA_LIBS=`$PYTHON -c "import sys; import distutils.sysconfig; \
- conf = distutils.sysconfig.get_config_var; \
-@@ -148,6 +157,10 @@ sys.stdout.write('%s %s %s\n' % (conf('BLDLIBRARY'), conf('LOCALMODLIBS'), conf(
-         # linking flags needed when embedding
-         #
-         AC_MSG_CHECKING(python extra linking flags)
-+        if type $PYTHON_CONFIG; then
-+                PYTHON_EXTRA_LDFLAGS=`$PYTHON_CONFIG --ldflags --embed` || \
-+                        PYTHON_EXTRA_LDFLAGS=''
-+        fi
-         if test -z "$PYTHON_EXTRA_LDFLAGS"; then
-                 PYTHON_EXTRA_LDFLAGS=`$PYTHON -c "import sys; import distutils.sysconfig; \
- conf = distutils.sysconfig.get_config_var; \
-@@ -164,7 +177,7 @@ sys.stdout.write('%s\n' % conf('LINKFORSHARED'))"`
-         # save current global flags
-         ac_save_LIBS="$LIBS"
-         ac_save_CPPFLAGS="$CPPFLAGS"
--        LIBS="$ac_save_LIBS $PYTHON_LDFLAGS $PYTHON_EXTRA_LIBS"
-+        LIBS="$ac_save_LIBS $PYTHON_EXTRA_LIBS $PYTHON_LDFLAGS"
-         CPPFLAGS="$ac_save_CPPFLAGS $PYTHON_CPPFLAGS"
-         AC_TRY_LINK([
-                 #include <Python.h>
--- 
-2.25.1
-
diff --git a/package/libapparmor/0002-libapparmor-fixing-setup.py-call-when-crosscompiling.patch b/package/libapparmor/0002-libapparmor-fixing-setup.py-call-when-crosscompiling.patch
deleted file mode 100644
index 8d6ca86e47..0000000000
--- a/package/libapparmor/0002-libapparmor-fixing-setup.py-call-when-crosscompiling.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From cf61d1257b9a5f12fdf6f4dd6a2746f77b23a8a0 Mon Sep 17 00:00:00 2001
-From: Angelo Compagnucci <angelo@amarulasolutions.com>
-Date: Tue, 24 Mar 2020 23:02:08 +0100
-Subject: [PATCH] libapparmor: fixing setup.py call when crosscompiling
-
-When crosscompiling, setupy.py should be called passing the settings
-discovered by ac_python_devel.m4 and not using the default system
-settings.
-
-Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
----
- libraries/libapparmor/swig/python/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libraries/libapparmor/swig/python/Makefile.am b/libraries/libapparmor/swig/python/Makefile.am
-index 421acba9..6c60181e 100644
---- a/libraries/libapparmor/swig/python/Makefile.am
-+++ b/libraries/libapparmor/swig/python/Makefile.am
-@@ -11,7 +11,7 @@ MOSTLYCLEANFILES=libapparmor_wrap.c LibAppArmor.py
- 
- all-local: libapparmor_wrap.c setup.py
- 	if test ! -f libapparmor_wrap.c; then cp $(srcdir)/libapparmor_wrap.c . ; fi
--	$(PYTHON) setup.py build
-+	CC="$(CC)" CFLAGS="$(PYTHON_CPPFLAGS)" LDSHARED="$(CC) -shared" LDFLAGS="$(PYTHON_LDFLAGS)" $(PYTHON) setup.py build
- 
- install-exec-local:
- 	$(PYTHON) setup.py install --root="/$(DESTDIR)" --prefix="$(prefix)"
--- 
-2.17.1
-
diff --git a/package/libapparmor/libapparmor.hash b/package/libapparmor/libapparmor.hash
index a0ff221914..61516d45cc 100644
--- a/package/libapparmor/libapparmor.hash
+++ b/package/libapparmor/libapparmor.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  90bf86c07ffbe2c22be46d75c7345fad12d5911653c59750a37d59c63ad5d10e  apparmor-2.13.4.tar.gz
+sha256  66fd751fe51eb427d2aa864ee035b12d01d212fd595579275219b0148c43755e  apparmor-3.0.0.tar.gz
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  libraries/libapparmor/COPYING.LGPL
diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
index 9562cd105f..5ece89b08a 100644
--- a/package/libapparmor/libapparmor.mk
+++ b/package/libapparmor/libapparmor.mk
@@ -5,10 +5,10 @@
 ################################################################################
 
 # When updating the version here, please also update the apparmor package
-LIBAPPARMOR_VERSION_MAJOR = 2.13
-LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).4
+LIBAPPARMOR_VERSION_MAJOR = 3.0
+LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).0
 LIBAPPARMOR_SOURCE = apparmor-$(LIBAPPARMOR_VERSION).tar.gz
-LIBAPPARMOR_SITE = https://launchpad.net/apparmor/$(LIBAPPARMOR_VERSION_MAJOR)/$(LIBAPPARMOR_VERSION)/+download
+LIBAPPARMOR_SITE = https://launchpad.net/apparmor/$(LIBAPPARMOR_VERSION_MAJOR)/$(LIBAPPARMOR_VERSION_MAJOR)/+download
 LIBAPPARMOR_LICENSE = LGPL-2.1
 LIBAPPARMOR_LICENSE_FILES = LICENSE libraries/libapparmor/COPYING.LGPL
 
-- 
2.25.1
