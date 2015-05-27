From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 27 May 2015 17:17:06 -0500
Subject: [Buildroot] [PATCH v6 02/22] setools: new package
In-Reply-To: <1432765046-1223-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1432765046-1223-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1432765046-1223-3-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

---
Changes v5 -> v6:
  - Fixed spelling error in Config.in file (Suggested by Thomas P.)
  - Added missing libsepol dependency to the target setool (Suggested by
    Thomas P.)
  - Added a comment to explain why the autoreconfigure is happening
    (Suggested by Thomas P.)
  - Reworked the host setools Python configure variables (Suggested by
    Thomas P.)
  - Removed unneeded libtool patch option and autoreconf opts (Suggested
    by Thomas P.)

Changes v4 -> v5:
  - Added dependency on libsepol (Matt W.)
  - Removed limitation of arch it could build for  (Matt W.)
  - Removed depends on GLIBC (Matt W.)
  - Consolidated python configuration (Ryan B.)
  - Removed swig (patch and enabling), it's only needed for
    graphical apol tool (Ryan B.)
  - Added comment to cross compile patch about not upstreaming.
    The package is stable and no updates/reworking since 2013.
    Currently a 4.0 version is in the works but is a major
    build infrastructure rework when compared to 3.3.x. (Ryan B.)
  - Added comments noting why autoreconf and not libtool patch
    (Suggested by Thomas P.)
  - Added comments explaining why python on host but not target
    (Suggested by Thomas P.)
  - Add a dependency on not static libs because libselinux requires not
    static libs. (Clayton S.)
  - Added licene info (Clayton S.)
  - Added depends on C++ (Matt W.)
  - Removed largefile dependency (Clayton S.)

Changes v3 -> v4:
  - No changes

Changes v2 -> v3:
  - Fixed kconfig menu as sepolgen removal removed initial menu
    entry to add to

Changes v1 -> v2:
  - Handle Python 2 vs. Python 3 for the host package.
  - Added hash file
  - Updated download site
---
 package/Config.in                              |   4 +
 package/setools/0001-cross-compile-fixes.patch | 125 +++++++++++++++++++++++++
 package/setools/Config.in                      |  25 +++++
 package/setools/setools.hash                   |   4 +
 package/setools/setools.mk                     |  84 +++++++++++++++++
 5 files changed, 242 insertions(+)
 create mode 100644 package/setools/0001-cross-compile-fixes.patch
 create mode 100644 package/setools/Config.in
 create mode 100644 package/setools/setools.hash
 create mode 100644 package/setools/setools.mk

diff --git a/package/Config.in b/package/Config.in
index e0c2e2a..cab7f66 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1338,6 +1338,10 @@ menu "Real-Time"
 	source "package/xenomai/Config.in"
 endmenu
 
+menu "Security"
+	source "package/setools/Config.in"
+endmenu
+
 menu "Shell and utilities"
 comment "Shells"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/setools/0001-cross-compile-fixes.patch b/package/setools/0001-cross-compile-fixes.patch
new file mode 100644
index 0000000..1a4af0c
--- /dev/null
+++ b/package/setools/0001-cross-compile-fixes.patch
@@ -0,0 +1,125 @@
+Correct build issues to enable cross compiling.  These changes require the
+package to be auto reconfigured.
+
+These updates were not upsteamed as the 3.3.x version has stablized and they
+were only taking bug fixes.  Also the 4.0 preview has completely reworked
+the build infrastructure which will require this to be revisited.
+
+Signed-off-by Clayton Shotwell <clshotwe@rockwellcollins.com>
+
+diff -urN a/configure.ac b/configure.ac
+--- a/configure.ac	2013-01-16 10:36:24.000000000 -0600
++++ b/configure.ac	2013-07-12 08:22:10.380255248 -0500
+@@ -448,8 +448,9 @@
+               sepol_srcdir="")
+ if test "x${sepol_srcdir}" = "x"; then
+    sepol_srcdir=${sepol_devel_libdir}
+-   AC_CHECK_FILE([${sepol_srcdir}/libsepol.a],,
+-      AC_MSG_ERROR([make sure libsepol-static is installed]))
++   if test ! -f ${sepol_srcdir}/libsepol.a; then
++      AC_MSG_ERROR([could not find precompiled libsepol.a])
++   fi
+ else
+    AC_MSG_CHECKING([for compatible sepol source tree])
+    sepol_version=${sepol_srcdir}/VERSION
+@@ -484,8 +485,9 @@
+    AC_CHECK_HEADER([sepol/policydb/policydb.h], , AC_MSG_ERROR([could not find sepol source tree]))
+    CFLAGS="${sepol_src_save_CFLAGS}"
+    CPPFLAGS="${sepol_src_save_CPPFLAGS}"
+-   AC_CHECK_FILE([${sepol_srcdir}/libsepol.a],,
+-      AC_MSG_ERROR([could not find precompiled libsepol.a]))
++   if test ! -f ${sepol_srcdir}/libsepol.a; then
++      AC_MSG_ERROR([could not find precompiled libsepol.a])
++   fi
+    sepol_devel_incdir="${sepol_srcdir}/../include"
+ fi
+ SELINUX_CFLAGS="-I${sepol_devel_incdir} -I${selinux_devel_incdir}"
+@@ -578,12 +580,13 @@
+                          [AC_LANG_SOURCE([
+ #include <sepol/policydb/expand.h>
+ int main () {
+-  return expand_module_avrules(NULL, NULL, NULL, NULL, NULL, 0, 0);
++  return expand_module_avrules(NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0);
+ }])],
+                          AC_MSG_RESULT([yes]),
+                          AC_MSG_ERROR([this version of libsepol is incompatible with SETools]))
+     fi
+     sepol_new_expand_boolmap="yes"
++    sepol_new_user_role_mapping="yes"
+ else
+     sepol_new_expand_boolmap="no"
+ fi
+@@ -607,7 +610,8 @@
+     exit(EXIT_FAILURE);
+ }])],
+     sepol_policy_version_max=`cat conftest.data`,
+-    AC_MSG_FAILURE([could not determine maximum libsepol policy version]))
++    AC_MSG_FAILURE([could not determine maximum libsepol policy version]),
++    sepol_policy_version_max="26")
+ AC_DEFINE_UNQUOTED(SEPOL_POLICY_VERSION_MAX, ${sepol_policy_version_max}, [maximum policy version supported by libsepol])
+ CFLAGS="${sepol_save_CFLAGS}"
+ CPPFLAGS="${sepol_save_CPPFLAGS}"
+@@ -631,7 +635,7 @@
+     changequote([,])dnl
+     selinux_save_CFLAGS="${CFLAGS}"
+     CFLAGS="${SELINUX_CFLAGS} ${SELINUX_LIB_FLAG} -lselinux -lsepol ${CFLAGS}"
+-    gcc ${CFLAGS} -o conftest conftest.c >&5
++    ${CC} ${CFLAGS} -o conftest conftest.c >&5
+     selinux_policy_dir=`./conftest`
+     AC_MSG_RESULT(${selinux_policy_dir})
+     CFLAGS="${selinux_save_CFLAGS}"
+diff -urN a/libqpol/src/policy_define.c b/libqpol/src/policy_define.c
+--- a/libqpol/src/policy_define.c	2013-01-16 10:36:24.000000000 -0600
++++ b/libqpol/src/policy_define.c	2013-07-12 08:22:10.380255248 -0500
+@@ -2135,7 +2135,7 @@
+ #ifdef HAVE_SEPOL_ROLE_ATTRS
+ 	if (role_set_expand(&roles, &e_roles, policydbp, NULL, NULL))
+ #elif HAVE_SEPOL_USER_ROLE_MAPPING
+-	if (role_set_expand(&roles, &e_roles, policydbp, NULL))
++	if (role_set_expand(&roles, &e_roles, policydbp, NULL, NULL))
+ #else
+ 	if (role_set_expand(&roles, &e_roles, policydbp))
+ #endif
+diff -urN a/m4/ac_python_devel.m4 b/m4/ac_python_devel.m4
+--- a/m4/ac_python_devel.m4	2013-01-16 10:36:22.000000000 -0600
++++ b/m4/ac_python_devel.m4	2013-07-12 08:22:10.380255248 -0500
+@@ -234,7 +234,7 @@
+ 	AC_MSG_CHECKING([consistency of all components of python development environment])
+ 	AC_LANG_PUSH([C])
+ 	# save current global flags
+-	LIBS="$ac_save_LIBS $PYTHON_LDFLAGS"
++	LIBS="$ac_save_LIBS $PYTHON_EXTRA_LIBS $PYTHON_LDFLAGS"
+ 	CPPFLAGS="$ac_save_CPPFLAGS $PYTHON_CPPFLAGS"
+ 	AC_TRY_LINK([
+ 		#include <Python.h>
+diff -urN a/python/setools/Makefile.am b/python/setools/Makefile.am
+--- a/python/setools/Makefile.am	2013-01-16 10:36:22.000000000 -0600
++++ b/python/setools/Makefile.am	2013-07-12 08:22:19.200251011 -0500
+@@ -22,13 +22,13 @@
+ python-build: sesearch.c seinfo.c
+ 	@mkdir -p setools
+ 	@cp __init__.py setools
+-	LIBS="$(QPOL_LIB_FLAG) $(APOL_LIB_FLAG)" INCLUDES="$(QPOL_CFLAGS) $(APOL_CFLAGS)" $(PYTHON) setup.py build
++	LIBS="$(QPOL_LIB_FLAG) $(APOL_LIB_FLAG)" LIBDIRS="$(PYTHON_LDFLAGS)" INCLUDES="$(PYTHON_CPPFLAGS) $(QPOL_CFLAGS) $(APOL_CFLAGS)" CC="$(CC)" CFLAGS="$(CFLAGS)" LDSHARED="$(CC) -shared" LDFLAGS="$(LDFLAGS)" $(PYTHON) setup.py build_ext
+ 
+ install-exec-hook:
+-	$(PYTHON) setup.py install `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
++	$(PYTHON) setup.py install `test -n "$(DESTDIR)" && echo --prefix=$(DESTDIR)/usr`
+ 
+ uninstall-hook: 
+-	$(PYTHON) setup.py uninstall `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
++	$(PYTHON) setup.py uninstall `test -n "$(DESTDIR)" && echo --prefix=$(DESTDIR)/usr`
+ 
+ clean-local:
+ 	$(PYTHON) setup.py clean -a 
+--- a/python/setools/setup.py	2013-01-16 10:36:22.000000000 -0600
++++ b/python/setools/setup.py	2013-09-04 09:17:48.452916991 -0500
+@@ -8,7 +8,7 @@
+ try:
+     inc=os.getenv("INCLUDES").split(" ")    
+     INCLUDES=map(lambda x: x[2:], inc)
+-    LIBDIRS=map(lambda x: "/".join(x.split("/")[:-1]), os.getenv("LIBS").split())
++    LIBDIRS=map(lambda x: "/".join(x.split("/")[:-1]), os.getenv("LIBS").split()) + map(lambda x: x[2:], os.getenv("LIBDIRS").split())
+ except:
+     INCLUDES=""
+     LIBDIRS=""
diff --git a/package/setools/Config.in b/package/setools/Config.in
new file mode 100644
index 0000000..57397a5
--- /dev/null
+++ b/package/setools/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_SETOOLS
+	bool "setools"
+	select BR2_PACKAGE_LIBSELINUX
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_BZIP2
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  SETools is an open source project designed to facilitate
+	  SELinux policy analysis. The primary tools are:
+	   * apol - analyze a SELinux policy.
+	   * seaudit - analyze audit messages from SELinux.
+	   * seaudit-report - generate highly-customized audit log
+	     reports.
+	   * sechecker - command line tool for performing modular
+	     checks on an SELinux policy.
+	   * sediff - semantic policy difference tool for SELinux.
+	   * secmds - command-line tools to analyze and search SELinux
+             policy.
+
+comment "setools needs a toolchain w/ threads, C++, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| !BR2_INSTALL_LIBSTDCPP
diff --git a/package/setools/setools.hash b/package/setools/setools.hash
new file mode 100644
index 0000000..3fac21d
--- /dev/null
+++ b/package/setools/setools.hash
@@ -0,0 +1,4 @@
+# From https://github.com/TresysTechnology/setools3/wiki/Download
+md5	d68d0d4e4da0f01da0f208782ff04b91	setools-3.3.8.tar.bz2
+#Locally computed
+sha256	44387ecc9a231ec536a937783440cd8960a72c51f14bffc1604b7525e341e999	setools-3.3.8.tar.bz2
diff --git a/package/setools/setools.mk b/package/setools/setools.mk
new file mode 100644
index 0000000..90195f0
--- /dev/null
+++ b/package/setools/setools.mk
@@ -0,0 +1,84 @@
+################################################################################
+#
+# setools
+#
+################################################################################
+
+SETOOLS_VERSION = 3.3.8
+SETOOLS_SOURCE = setools-$(SETOOLS_VERSION).tar.bz2
+SETOOLS_SITE = https://raw.githubusercontent.com/wiki/TresysTechnology/setools3/files/dists/setools-$(SETOOLS_VERSION)/
+SETOOLS_DEPENDENCIES = libselinux libsepol sqlite libxml2 bzip2
+SETOOLS_INSTALL_STAGING = YES
+SETOOLS_LICENSE = GPLv2+ LGPLv2.1+
+SETOOLS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
+
+# configure.ac is patched by the cross compile patch,
+# so autoreconf is necessary
+SETOOLS_AUTORECONF = YES
+
+# Notes: Need "disable-selinux-check" so the configure does not check to see
+#        if host has selinux enabled.
+#        No python support as only the libraries and commandline tools are
+#        installed on target
+SETOOLS_CONF_OPTS = \
+	--disable-debug \
+	--disable-gui \
+	--disable-bwidget-check \
+	--disable-selinux-check \
+	--disable-swig-java \
+	--disable-swig-python \
+	--disable-swig-tcl \
+	--with-sepol-devel="$(STAGING_DIR)/usr" \
+	--with-selinux-devel="$(STAGING_DIR)/usr"
+
+HOST_SETOOLS_DEPENDENCIES = host-libselinux host-libsepol host-sqlite \
+	host-libxml2 host-bzip2
+
+# configure.ac is patched by the cross compile patch,
+# so autoreconf is necessary
+HOST_SETOOLS_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+HOST_SETOOLS_PYTHON_VERSION=$(PYTHON3_VERSION_MAJOR)
+HOST_SETOOLS_DEPENDENCIES += host-python3
+HOST_SETOOLS_CONF_ENV += am_cv_python_version=$(PYTHON3_VERSION)
+else
+HOST_SETOOLS_PYTHON_VERSION=$(PYTHON_VERSION_MAJOR)
+HOST_SETOOLS_DEPENDENCIES += host-python
+HOST_SETOOLS_CONF_ENV += am_cv_python_version=$(PYTHON_VERSION)
+endif
+
+HOST_SETOOLS_PYTHON_SITE_PACKAGES = $(HOST_DIR)/usr/lib/python$(HOST_SETOOLS_PYTHON_VERSION)/site-packages
+HOST_SETOOLS_PYTHON_INCLUDES = $(HOST_DIR)/usr/include/python$(HOST_SETOOLS_PYTHON_VERSION)
+HOST_SETOOLS_PYTHON_LIB = -lpython$(HOST_SETOOLS_PYTHON_VERSION)
+
+# Notes: Need "disable-selinux-check" so the configure does not check to see
+#        if host has selinux enabled.
+#        Host builds with python support to enable tools for offline target
+#        policy analysis
+HOST_SETOOLS_CONF_OPTS = \
+	--disable-debug \
+	--disable-gui \
+	--disable-bwidget-check \
+	--disable-selinux-check \
+	--disable-swig-java \
+	--disable-swig-python \
+	--disable-swig-tcl \
+	--with-sepol-devel="$(HOST_DIR)/usr" \
+	--with-selinux-devel="$(HOST_DIR)/usr" \
+	PYTHON_LDFLAGS="-L$(HOST_DIR)/usr/lib/" \
+	PYTHON_CPPFLAGS="-I$(HOST_SETOOLS_PYTHON_INCLUDES)" \
+	PYTHON_SITE_PKG="$(HOST_SETOOLS_PYTHON_SITE_PACKAGES)" \
+	PYTHON_EXTRA_LIBS="-lpthread -ldl -lutil $(HOST_SETOOLS_PYTHON_LIB)"
+
+HOST_SETOOLS_CONF_ENV += \
+	am_cv_pathless_PYTHON=python \
+	ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python \
+	am_cv_python_platform=linux2 \
+	am_cv_python_version=$(HOST_SETOOLS_PYTHON_VERSION) \
+	am_cv_python_pythondir=$(HOST_SETOOLS_PYTHON_SITE_PACKAGES) \
+	am_cv_python_pyexecdir=$(HOST_SETOOLS_PYTHON_SITE_PACKAGES) \
+	am_cv_python_includes=-I$(HOST_SETOOLS_PYTHON_INCLUDES)
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.9.1
