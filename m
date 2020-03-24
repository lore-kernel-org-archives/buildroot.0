From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 24 Mar 2020 23:37:15 +0100
Subject: [Buildroot] [PATCH] package/libapparmor: new package
Message-ID: <20200324223715.20976-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds libapparmor and it's related tools.

The patch is quite complicated by the layout of the source tree:

* The first step is to compile libraries/libapparmor using the autotools
  infrastructure. Autoreconf is needed due to the attached patches.
  Libapparmor library needs to be installed in staging directory before
  compiling the rest of the tools.
* The second step is to compile tools and optional components distrubuted
  in sub directories, this is done in POST_INSTALL_STAGING_HOOKS.
* If python3 is available, swig bindings and python utils are compiled.
* parser/apparmor.systemd is actually a systemv init script
* Package will enable profiles cache if the system is writable
* All Apparmor kernel code is now upstream, so no other patches are
  needed.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
Patches are already sent upstream.

 DEVELOPERS                                    |  1 +
 linux/linux.mk                                |  6 ++
 package/Config.in                             |  1 +
 ...el-fixing-for-crosscompiling-environ.patch | 95 +++++++++++++++++++
 ...ng-setup.py-call-when-crosscompiling.patch | 30 ++++++
 package/libapparmor/Config.in                 | 34 +++++++
 package/libapparmor/libapparmor.hash          |  3 +
 package/libapparmor/libapparmor.mk            | 87 +++++++++++++++++
 8 files changed, 257 insertions(+)
 create mode 100644 package/libapparmor/0001-m4-ac_python_devel-fixing-for-crosscompiling-environ.patch
 create mode 100644 package/libapparmor/0002-libapparmor-fixing-setup.py-call-when-crosscompiling.patch
 create mode 100644 package/libapparmor/Config.in
 create mode 100644 package/libapparmor/libapparmor.hash
 create mode 100644 package/libapparmor/libapparmor.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index dd44331b85..a96b031def 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -188,6 +188,7 @@ N:	Angelo Compagnucci <angelo.compagnucci@gmail.com>
 F:	package/corkscrew/
 F:	package/fail2ban/
 F:	package/i2c-tools/
+F:	package/libapparmor/
 F:	package/mender/
 F:	package/mender-artifact/
 F:	package/mono/
diff --git a/linux/linux.mk b/linux/linux.mk
index 4b60f33ff3..5032481069 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -359,6 +359,12 @@ define LINUX_KCONFIG_FIXUP_CMDS
 	$(if $(BR2_PACKAGE_INTEL_MICROCODE),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_MICROCODE,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_MICROCODE_INTEL,$(@D)/.config))
+	$(if $(BR2_PACKAGE_LIBAPPARMOR),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_AUDIT,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_APPARMOR,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_DEFAULT_SECURITY_APPARMOR,$(@D)/.config)
+		$(call KCONFIG_SET_OPT,CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE,1,$(@D)/.config))
 	$(if $(BR2_PACKAGE_KTAP),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ENABLE_DEFAULT_TRACERS,$(@D)/.config)
diff --git a/package/Config.in b/package/Config.in
index edf7687ab7..d9ed053b77 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1862,6 +1862,7 @@ endif
 endmenu
 
 menu "Security"
+	source "package/libapparmor/Config.in"
 	source "package/libselinux/Config.in"
 	source "package/libsemanage/Config.in"
 	source "package/libsepol/Config.in"
diff --git a/package/libapparmor/0001-m4-ac_python_devel-fixing-for-crosscompiling-environ.patch b/package/libapparmor/0001-m4-ac_python_devel-fixing-for-crosscompiling-environ.patch
new file mode 100644
index 0000000000..87b5916ce0
--- /dev/null
+++ b/package/libapparmor/0001-m4-ac_python_devel-fixing-for-crosscompiling-environ.patch
@@ -0,0 +1,95 @@
+From 7cf4d292a3ab245d2594dff902c8c9942d3f8de8 Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo@amarulasolutions.com>
+Date: Tue, 24 Mar 2020 22:53:37 +0100
+Subject: [PATCH 1/2] m4: ac_python_devel: fixing for crosscompiling
+ environments
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
+ libraries/libapparmor/m4/ac_python_devel.m4 | 23 +++++++++++++++------
+ 1 file changed, 17 insertions(+), 6 deletions(-)
+
+diff --git a/libraries/libapparmor/m4/ac_python_devel.m4 b/libraries/libapparmor/m4/ac_python_devel.m4
+index 2ea7dc77..7fc20765 100644
+--- a/libraries/libapparmor/m4/ac_python_devel.m4
++++ b/libraries/libapparmor/m4/ac_python_devel.m4
+@@ -13,6 +13,11 @@ AC_DEFUN([AC_PYTHON_DEVEL],[
+            PYTHON_VERSION=""
+         fi
+ 
++        AC_PATH_PROG([PYTHON_CONFIG],[python[$PYTHON_VERSION]-config])
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
+@@ -136,10 +141,13 @@ sys.stdout.write('%s\n' % distutils.sysconfig.get_python_lib(0,0));"`
+         # libraries which must be linked in when embedding
+         #
+         AC_MSG_CHECKING(python extra libraries)
++        if type $PYTHON_CONFIG; then
++                PYTHON_EXTRA_LIBS=`$PYTHON_CONFIG --libs --embed`
++        fi
+         if test -z "$PYTHON_EXTRA_LIBS"; then
+            PYTHON_EXTRA_LIBS=`$PYTHON -c "import sys; import distutils.sysconfig; \
+ conf = distutils.sysconfig.get_config_var; \
+-sys.stdout.write('%s %s\n' % (conf('LOCALMODLIBS'), conf('LIBS')))"`
++sys.stdout.write('%s %s %s\n' % (conf('BLDLIBRARY'), conf('LOCALMODLIBS'), conf('LIBS')))"`
+         fi
+         AC_MSG_RESULT([$PYTHON_EXTRA_LIBS])
+         AC_SUBST(PYTHON_EXTRA_LIBS)
+@@ -148,6 +156,9 @@ sys.stdout.write('%s %s\n' % (conf('LOCALMODLIBS'), conf('LIBS')))"`
+         # linking flags needed when embedding
+         #
+         AC_MSG_CHECKING(python extra linking flags)
++        if type $PYTHON_CONFIG; then
++                PYTHON_EXTRA_LDFLAGS=`$PYTHON_CONFIG --ldflags --embed`
++        fi
+         if test -z "$PYTHON_EXTRA_LDFLAGS"; then
+                 PYTHON_EXTRA_LDFLAGS=`$PYTHON -c "import sys; import distutils.sysconfig; \
+ conf = distutils.sysconfig.get_config_var; \
+@@ -164,7 +175,7 @@ sys.stdout.write('%s\n' % conf('LINKFORSHARED'))"`
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
index 0000000000..98735a514c
--- /dev/null
+++ b/package/libapparmor/0002-libapparmor-fixing-setup.py-call-when-crosscompiling.patch
@@ -0,0 +1,30 @@
+From 5c8d0f440b370cc6748d5d4e67bf182a8084dcda Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo@amarulasolutions.com>
+Date: Tue, 24 Mar 2020 23:02:08 +0100
+Subject: [PATCH 2/2] libapparmor: fixing setup.py call when crosscompiling
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
diff --git a/package/libapparmor/Config.in b/package/libapparmor/Config.in
new file mode 100644
index 0000000000..c93199cf37
--- /dev/null
+++ b/package/libapparmor/Config.in
@@ -0,0 +1,34 @@
+config BR2_PACKAGE_LIBAPPARMOR
+	bool "libapparmor"
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_GREP
+	select BR2_PACKAGE_PYTHON3_READLINE if BR2_PACKAGE_PYTHON3
+	help
+	  AppArmor is an effective and easy-to-use Linux application
+	  security system. AppArmor proactively protects the operating
+	  system and applications from external or internal threats,
+	  even zero-day attacks, by enforcing good behavior and
+	  preventing even unknown application flaws from being exploited.
+	  AppArmor security policies completely define what system
+	  resources individual applications can access, and with what
+	  privileges. A number of default policies are included with
+	  AppArmor, and using a combination of advanced static analysis
+	  and learning-based tools, AppArmor policies for even very
+	  complex applications can be deployed successfully in a
+	  matter of hours.
+
+	  http://wiki.apparmor.net
+
+if BR2_PACKAGE_LIBAPPARMOR
+
+config BR2_PACKAGE_LIBAPPARMOR_PROFILES
+	bool "install profiles"
+	default y
+	help
+	  This option install Apparmor default profiles
+
+endif
+
+comment "AppArmor needs needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/libapparmor/libapparmor.hash b/package/libapparmor/libapparmor.hash
new file mode 100644
index 0000000000..e5ae65d91c
--- /dev/null
+++ b/package/libapparmor/libapparmor.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  267053234c68cdb122c5294d7c276b6e2f5fa7e75c6c2d23e3ce69f95d9a7639  apparmor-2.13.3.tar.gz
+sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
new file mode 100644
index 0000000000..ac3b6bbf0f
--- /dev/null
+++ b/package/libapparmor/libapparmor.mk
@@ -0,0 +1,87 @@
+################################################################################
+#
+# libapparmor
+#
+################################################################################
+
+LIBAPPARMOR_BASE_VERSION = 2.13
+LIBAPPARMOR_VERSION = $(LIBAPPARMOR_BASE_VERSION).3
+LIBAPPARMOR_SOURCE = apparmor-$(LIBAPPARMOR_VERSION).tar.gz
+LIBAPPARMOR_SITE = https://launchpad.net/apparmor/$(LIBAPPARMOR_BASE_VERSION)/$(LIBAPPARMOR_VERSION)/+download
+LIBAPPARMOR_LICENSE = GPL-2.0
+LIBAPPARMOR_LICENSE_FILES = LICENSE
+LIBAPPARMOR_SUBDIR = libraries/libapparmor
+LIBAPPARMOR_AUTORECONF = YES
+LIBAPPARMOR_INSTALL_STAGING = YES
+LIBAPPARMOR_CONF_OPTS = --enable-static --enable-man-pages=no
+
+LIBAPPARMOR_SUBDIRS = parser binutils
+
+ifeq ($(BR2_PACKAGE_LIBAPPARMOR_PROFILES),y)
+LIBAPPARMOR_SUBDIRS += profiles
+endif
+
+ifeq ($(BR2_PACKAGE_APACHE),y)
+LIBAPPARMOR_DEPENDENCIES += apache
+LIBAPPARMOR_SUBDIRS += changehat/mod_apparmor
+LIBAPPARMOR_SUBDIRS_BUILD_OPTS += APXS=$(STAGING_DIR)/usr/bin/apxs
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+LIBAPPARMOR_DEPENDENCIES += linux-pam
+LIBAPPARMOR_SUBDIRS += changehat/pam_apparmor
+endif
+
+LIBAPPARMOR_SUBDIRS_BUILD_OPTS = USE_SYSTEM=1
+
+LIBAPPARMOR_SUBDIRS_BUILD_CMD = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
+	$(MAKE) $(LIBAPPARMOR_SUBDIRS_BUILD_OPTS) \
+	-C $(@D)/$(d)
+
+# libapparmor source code is in libraries/libapparmor and needs to be compiled
+# and installed in staging before actually compiling subdirs components
+define LIBAPPARMOR_SUBDIRS_BUILD_CMDS
+	$(foreach d,$(LIBAPPARMOR_SUBDIRS), \
+		$(LIBAPPARMOR_SUBDIRS_BUILD_CMD)
+	)
+endef
+LIBAPPARMOR_POST_INSTALL_STAGING_HOOKS += LIBAPPARMOR_SUBDIRS_BUILD_CMDS
+
+define LIBAPPARMOR_SUBDIRS_INSTALL_TARGET_CMDS
+	$(foreach d,$(LIBAPPARMOR_SUBDIRS), \
+		$(LIBAPPARMOR_SUBDIRS_BUILD_CMD) DESTDIR=$(TARGET_DIR) install
+	)
+endef
+LIBAPPARMOR_POST_INSTALL_TARGET_HOOKS += LIBAPPARMOR_SUBDIRS_INSTALL_TARGET_CMDS
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+
+LIBAPPARMOR_CONF_OPTS += --with-python PYTHON=$(HOST_DIR)/usr/bin/python3 \
+	PYTHON_CONFIG=$(STAGING_DIR)/usr/bin/python3-config
+LIBAPPARMOR_DEPENDENCIES += host-python3 host-swig python3
+LIBAPPARMOR_SUBDIRS += utils
+LIBAPPARMOR_SUBDIRS_BUILD_CMD += PYTHON=$(HOST_DIR)/usr/bin/python3
+
+endif
+
+# Enabling rules caching if the system is mounted R/W
+ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
+define LIBAPPARMOR_ENABLE_PROFILE_CACHE
+	$(SED) '/^#write-cache/c\write-cache' $(TARGET_DIR)/etc/apparmor/parser.conf
+endef
+LIBAPPARMOR_POST_INSTALL_TARGET_HOOKS += LIBAPPARMOR_ENABLE_PROFILE_CACHE
+endif
+
+define LIBAPPARMOR_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(@D)/parser/apparmor.systemd \
+		$(TARGET_DIR)/etc/init.d/S10apparmor
+endef
+
+define LIBAPPARMOR_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0755 $(@D)/parser/apparmor.systemd \
+		$(TARGET_DIR)/lib/apparmor/apparmor.systemd
+	$(INSTALL) -D -m 0755 $(@D)/parser/apparmor.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/apparmor.service
+endef
+
+$(eval $(autotools-package))
-- 
2.17.1
