From: Samuel Martin <s.martin49@gmail.com>
Date: Thu,  2 Jan 2014 20:00:57 +0100
Subject: [Buildroot] [PATCH v2] cwiid: new package
Message-ID: <1388689257-31068-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch only add the native cwiid library and a couple of tools.

The 2 first cwiid patches are retrieved from upstream and fix build
issues, so does the 3rd one.
The 4th patch allows to disable wmgui build, so allows to reduce to
number of dependencies.

Cc: Eric Jarrige <eric.jarrige@armadeus.org>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- fix missing 'select' in Config.in
- disable ldconfig call
---
 package/Config.in                                  |   1 +
 package/cwiid/Config.in                            |  25 ++++
 ...id-0001-fix-link-options-for-as-needed-90.patch | 166 +++++++++++++++++++++
 .../cwiid-0002-Update-for-BlueZ-changes.patch      |  28 ++++
 ...linking-by-adding-the-missing-lbluetooth-.patch |  27 ++++
 ...-0004-configure-make-wmgui-build-optional.patch |  64 ++++++++
 package/cwiid/cwiid.mk                             |  30 ++++
 7 files changed, 341 insertions(+)
 create mode 100644 package/cwiid/Config.in
 create mode 100644 package/cwiid/cwiid-0001-fix-link-options-for-as-needed-90.patch
 create mode 100644 package/cwiid/cwiid-0002-Update-for-BlueZ-changes.patch
 create mode 100644 package/cwiid/cwiid-0003-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch
 create mode 100644 package/cwiid/cwiid-0004-configure-make-wmgui-build-optional.patch
 create mode 100644 package/cwiid/cwiid.mk

diff --git a/package/Config.in b/package/Config.in
index f5a55f1..7d508ce 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -264,6 +264,7 @@ source "package/acpid/Config.in"
 source "package/avrdude/Config.in"
 source "package/cdrkit/Config.in"
 source "package/cryptsetup/Config.in"
+source "package/cwiid/Config.in"
 source "package/dbus/Config.in"
 source "package/dbus-glib/Config.in"
 source "package/dbus-python/Config.in"
diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
new file mode 100644
index 0000000..db53b5a
--- /dev/null
+++ b/package/cwiid/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_CWIID
+	bool "cwiid"
+	depends on !BR2_avr32 # bluez_utils
+	depends on !BR2_PREFER_STATIC_LIB # bluez_utils
+	depends on BR2_USE_WCHAR # bluez_utils -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils -> dbus, alsa-lib, libglib2
+	depends on BR2_USE_MMU # bluez_utils -> dbus, libglib2
+	select BR2_PACKAGE_BLUEZ_UTILS
+	help
+	  A collection of Linux tools written in C for interfacing to the
+	  Nintendo Wiimote.
+
+	  http://abstrakraft.org/cwiid/
+
+if BR2_PACKAGE_CWIID
+config BR2_PACKAGE_CWIID_WMGUI
+	bool "wmgui"
+	depends on BR2_PACKAGE_XORG7 # libgtk2
+	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
+	depends on BR2_USE_MMU # libgtk2 -> libglib2
+	depends on BR2_INSTALL_LIBSTDCPP # libgtk2 -> pango
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBGTK2
+endif
diff --git a/package/cwiid/cwiid-0001-fix-link-options-for-as-needed-90.patch b/package/cwiid/cwiid-0001-fix-link-options-for-as-needed-90.patch
new file mode 100644
index 0000000..806ddaa
--- /dev/null
+++ b/package/cwiid/cwiid-0001-fix-link-options-for-as-needed-90.patch
@@ -0,0 +1,166 @@
+From 6af678616531eb1f3d3d0a052313ef9d8125bac7 Mon Sep 17 00:00:00 2001
+From: "L. Donnie Smith" <donnie.smith@gatech.edu>
+Date: Thu, 4 Feb 2010 22:53:41 -0500
+Subject: [PATCH] fix link options for --as-needed (#90)
+
+also fix a couple of includes
+---
+ common/include/app.mak    | 2 +-
+ common/include/lib.mak.in | 4 ++--
+ common/include/plugin.mak | 2 +-
+ lswm/Makefile.in          | 2 +-
+ python/Makefile.in        | 2 +-
+ python/Wiimote.c          | 2 +-
+ python/cwiidmodule.c      | 2 +-
+ wmdemo/wmdemo.c           | 1 +
+ wmgui/Makefile.in         | 2 +-
+ wminput/Makefile.in       | 2 +-
+ wminput/main.c            | 1 +
+ 11 files changed, 12 insertions(+), 10 deletions(-)
+
+diff --git a/common/include/app.mak b/common/include/app.mak
+index f00cf12..c26d0ff 100644
+--- a/common/include/app.mak
++++ b/common/include/app.mak
+@@ -10,7 +10,7 @@ DEST_INST_DIR = $(ROOTDIR)$(INST_DIR)
+ all: $(APP_NAME)
+ 
+ $(APP_NAME): $(OBJECTS)
+-	$(CC) -o $@ $(OBJECTS) $(LDFLAGS) $(LDLIBS)
++	$(CC) $(LDFLAGS) -o $@ $(OBJECTS) $(LDLIBS)
+ 
+ install: $(APP_NAME)
+ 	install -D $(APP_NAME) $(DEST_INST_DIR)/$(APP_NAME)
+diff --git a/common/include/lib.mak.in b/common/include/lib.mak.in
+index 5e81ff3..3afbb14 100644
+--- a/common/include/lib.mak.in
++++ b/common/include/lib.mak.in
+@@ -25,8 +25,8 @@ $(STATIC_LIB): $(OBJECTS)
+ 	ar rcs $(STATIC_LIB) $(OBJECTS)
+ 
+ $(SHARED_LIB): $(OBJECTS)
+-	$(CC) -shared -Wl,-soname,$(SO_NAME) $(LDFLAGS) $(LDLIBS) \
+-	      -o $(SHARED_LIB) $(OBJECTS)
++	$(CC) -shared -Wl,-soname,$(SO_NAME) $(LDFLAGS) -o $(SHARED_LIB) \
++	      $(OBJECTS) $(LDLIBS)
+ 
+ install: install_header install_static install_shared
+ 
+diff --git a/common/include/plugin.mak b/common/include/plugin.mak
+index 0f61502..a2d5c85 100644
+--- a/common/include/plugin.mak
++++ b/common/include/plugin.mak
+@@ -16,7 +16,7 @@ DEST_INST_DIR = $(INST_DIR)
+ all: $(LIB_NAME)
+ 
+ $(LIB_NAME): $(OBJECTS)
+-	$(CC) -shared $(LDFLAGS) $(LDLIBS) -o $(LIB_NAME) $(OBJECTS)
++	$(CC) -shared $(LDFLAGS) -o $(LIB_NAME) $(OBJECTS) $(LDLIBS)
+ 
+ install: $(LIB_NAME)
+ 	install -D $(LIB_NAME) $(DEST_INST_DIR)/$(LIB_NAME)
+diff --git a/lswm/Makefile.in b/lswm/Makefile.in
+index 79e8b5b..017104f 100644
+--- a/lswm/Makefile.in
++++ b/lswm/Makefile.in
+@@ -8,7 +8,7 @@ SOURCES = lswm.c
+ 
+ CFLAGS += -I at top_builddir@/libcwiid
+ LDFLAGS += -L at top_builddir@/libcwiid
+-LDLIBS += -lcwiid
++LDLIBS += -lcwiid -lbluetooth
+ INST_DIR = @bindir@
+ 
+ include $(COMMON)/include/app.mak
+diff --git a/python/Makefile.in b/python/Makefile.in
+index 0d7efdf..0ca57ca 100644
+--- a/python/Makefile.in
++++ b/python/Makefile.in
+@@ -7,7 +7,7 @@ ifdef ROOTDIR
+ endif
+ 
+ all:
+-	$(PYTHON) setup.py build_ext $(DEBUGFLAGS) -I at top_builddir@/libcwiid -L at top_builddir@/libcwiid -lcwiid
++	$(PYTHON) setup.py build_ext $(DEBUGFLAGS) -I at top_builddir@/libcwiid -L at top_builddir@/libcwiid -lcwiid -lbluetooth
+ 
+ install:
+ 	$(PYTHON) setup.py install --install-lib=${libdir}/python at PYTHON_VERSION@/site-packages $(SET_ROOT_DIR)
+diff --git a/python/Wiimote.c b/python/Wiimote.c
+index 794e7e2..523185e 100644
+--- a/python/Wiimote.c
++++ b/python/Wiimote.c
+@@ -24,7 +24,7 @@
+ #include "structmember.h"
+ #include <errno.h>
+ #include <bluetooth/bluetooth.h>
+-#include "cwiid.h"
++#include <cwiid.h>
+ 
+ #if (PY_VERSION_HEX < 0x02050000)
+   #ifndef PY_SSIZE_T_MIN
+diff --git a/python/cwiidmodule.c b/python/cwiidmodule.c
+index f6a8f33..a01ed82 100644
+--- a/python/cwiidmodule.c
++++ b/python/cwiidmodule.c
+@@ -24,7 +24,7 @@
+ 
+ #include <stdlib.h>
+ 
+-#include "cwiid.h"
++#include <cwiid.h>
+ #include "structmember.h"
+ 
+ /* externally defined types */
+diff --git a/wmdemo/wmdemo.c b/wmdemo/wmdemo.c
+index 70a25a1..b7aaa7f 100644
+--- a/wmdemo/wmdemo.c
++++ b/wmdemo/wmdemo.c
+@@ -2,6 +2,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ 
++#include <bluetooth/bluetooth.h>
+ #include <cwiid.h>
+ 
+ /* This is a sample program written to demonstrate basic CWiid libwiimote
+diff --git a/wmgui/Makefile.in b/wmgui/Makefile.in
+index 41b205e..14d1c1e 100644
+--- a/wmgui/Makefile.in
++++ b/wmgui/Makefile.in
+@@ -8,7 +8,7 @@ SOURCES = main.c interface.c support.c
+ 
+ CFLAGS += @GTK_CFLAGS@ -I at top_builddir@/libcwiid
+ LDFLAGS += -L at top_builddir@/libcwiid
+-LDLIBS += @GTK_LIBS@ -lm -lcwiid
++LDLIBS += @GTK_LIBS@ -lcwiid -lbluetooth -lm
+ INST_DIR = @bindir@
+ 
+ include $(COMMON)/include/app.mak
+diff --git a/wminput/Makefile.in b/wminput/Makefile.in
+index 009d4d5..d3c3679 100644
+--- a/wminput/Makefile.in
++++ b/wminput/Makefile.in
+@@ -14,7 +14,7 @@ CFLAGS += -I at top_builddir@/libcwiid \
+ 	-DWMINPUT_CONFIG_DIR=\"$(WMINPUT_CONFIG_DIR)\" \
+ 	-DCWIID_PLUGINS_DIR=\"$(CWIID_PLUGINS_DIR)\"
+ 
+-LDLIBS += -lcwiid -ldl
++LDLIBS += -lcwiid -lbluetooth -ldl -lpthread
+ LDFLAGS += -L at top_builddir@/libcwiid -rdynamic
+ INST_DIR = @bindir@
+ 
+diff --git a/wminput/main.c b/wminput/main.c
+index c3a7445..bbc98d9 100644
+--- a/wminput/main.c
++++ b/wminput/main.c
+@@ -30,6 +30,7 @@
+ #include <signal.h>
+ #include <sys/types.h>
+ #include <unistd.h>
++#include <bluetooth/bluetooth.h>
+ 
+ #include <cwiid.h>
+ 
+-- 
+1.8.5.2
+
diff --git a/package/cwiid/cwiid-0002-Update-for-BlueZ-changes.patch b/package/cwiid/cwiid-0002-Update-for-BlueZ-changes.patch
new file mode 100644
index 0000000..c0d78a8
--- /dev/null
+++ b/package/cwiid/cwiid-0002-Update-for-BlueZ-changes.patch
@@ -0,0 +1,28 @@
+From c5dd7d4a9af5a7d8ead8ad26d9e5e0f8f8292d29 Mon Sep 17 00:00:00 2001
+From: "L. Donnie Smith" <donnie.smith@gatech.edu>
+Date: Sun, 30 Nov 2008 22:34:08 +0000
+Subject: [PATCH] Update for BlueZ changes.
+
+git-svn-id: http://abstrakraft.org/cwiid/svn/trunk at 183 918edb2d-ff29-0410-9de2-eb38e7f22bc7
+---
+ libcwiid/bluetooth.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libcwiid/bluetooth.c b/libcwiid/bluetooth.c
+index 63284a8..e986f75 100644
+--- a/libcwiid/bluetooth.c
++++ b/libcwiid/bluetooth.c
+@@ -122,8 +122,8 @@ int cwiid_get_bdinfo_array(int dev_id, unsigned int timeout, int max_bdinfo,
+ 		}
+ 
+ 		/* timeout (10000) in milliseconds */
+-		if (hci_remote_name(sock, &dev_list[i].bdaddr, BT_NAME_LEN,
+-		                    (*bdinfo)[bdinfo_count].name, 10000)) {
++		if (hci_read_remote_name(sock, &dev_list[i].bdaddr, BT_NAME_LEN,
++		                         (*bdinfo)[bdinfo_count].name, 10000)) {
+ 			cwiid_err(NULL, "Bluetooth name read error");
+ 			err = 1;
+ 			goto CODA;
+-- 
+1.8.5.2
+
diff --git a/package/cwiid/cwiid-0003-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch b/package/cwiid/cwiid-0003-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch
new file mode 100644
index 0000000..e1e4ec4
--- /dev/null
+++ b/package/cwiid/cwiid-0003-wmdemo-fix-linking-by-adding-the-missing-lbluetooth-.patch
@@ -0,0 +1,27 @@
+From af6bffb5b8b71e99e0f9bbbd2cf1fbd695a643c2 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sat, 8 Dec 2012 13:32:40 +0100
+Subject: [PATCH 1/2] wmdemo: fix linking by adding the missing -lbluetooth to
+ LDLIBS
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ wmdemo/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/wmdemo/Makefile.in b/wmdemo/Makefile.in
+index 56aed58..1eccc02 100644
+--- a/wmdemo/Makefile.in
++++ b/wmdemo/Makefile.in
+@@ -8,7 +8,7 @@ SOURCES = wmdemo.c
+ 
+ CFLAGS += -I at top_builddir@/libcwiid
+ LDFLAGS += -L at top_builddir@/libcwiid
+-LDLIBS += -lcwiid
++LDLIBS += -lcwiid -lbluetooth
+ INST_DIR = @bindir@
+ 
+ include $(COMMON)/include/app.mak
+-- 
+1.8.5.2
+
diff --git a/package/cwiid/cwiid-0004-configure-make-wmgui-build-optional.patch b/package/cwiid/cwiid-0004-configure-make-wmgui-build-optional.patch
new file mode 100644
index 0000000..f5eff33
--- /dev/null
+++ b/package/cwiid/cwiid-0004-configure-make-wmgui-build-optional.patch
@@ -0,0 +1,64 @@
+From dbb578450974db5decc24560da4aeaed838849a1 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Thu, 2 Jan 2014 14:03:07 +0100
+Subject: [PATCH 2/2] configure: make wmgui build optional
+
+So, make gtk-2 and glib2 dependencies optional (only needed by wmgui)
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ Makefile.in  |  2 +-
+ configure.ac | 17 +++++++++++++----
+ 2 files changed, 14 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 6d3ac98..3d2fb45 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -3,7 +3,7 @@
+ include @top_builddir@/defs.mak
+ 
+ LIB_DIRS = libcwiid
+-BIN_DIRS = wmgui wminput lswm
++BIN_DIRS = @WMGUI@ wminput lswm
+ DOC_DIRS = man doc
+ ifdef PYTHON
+ BIND_DIRS = python
+diff --git a/configure.ac b/configure.ac
+index 82ca3e1..d146cb6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -15,6 +15,11 @@ if test "$YACC" != "bison -y"; then
+ 	AC_MSG_ERROR([bison not found])
+ fi
+ 
++AC_ARG_ENABLE(
++	[wmgui],
++	[AS_HELP_STRING([--disable-wmgui],[Do not build wmgui binary (also drop the gtk-2/glib2 dependency)])],
++	[ENABLE_WMGUI="$enableval"],[ENABLE_WMGUI=yes])
++
+ AC_ARG_WITH(
+ 	[python],
+ 	[AS_HELP_STRING([--without-python],[compile without python support])],
+@@ -98,10 +103,14 @@ else
+ fi
+ AC_SUBST(LDCONFIG)
+ 
+-pkg_modules="gtk+-2.0 >= 2.0.0 gthread-2.0"
+-PKG_CHECK_MODULES([GTK], [$pkg_modules])
+-AC_SUBST(GTK_CFLAGS)
+-AC_SUBST(GTK_LIBS)
++AS_IF(
++	[test "x$ENABLE_WMGUI" = xyes],
++	[pkg_modules="gtk+-2.0 >= 2.0.0 gthread-2.0" ;
++	PKG_CHECK_MODULES([GTK], [$pkg_modules])
++	AC_SUBST(GTK_CFLAGS)
++	AC_SUBST(GTK_LIBS)
++	AC_SUBST(WMGUI, wmgui)]
++)
+ 
+ AC_OUTPUT(
+ 	[Makefile]
+-- 
+1.8.5.2
+
diff --git a/package/cwiid/cwiid.mk b/package/cwiid/cwiid.mk
new file mode 100644
index 0000000..cce7a7f
--- /dev/null
+++ b/package/cwiid/cwiid.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# cwiid
+#
+################################################################################
+
+CWIID_VERSION = 0.6.00
+CWIID_SOURCE = cwiid-$(CWIID_VERSION).tgz
+CWIID_SITE = http://abstrakraft.org/cwiid/downloads
+CWIID_LICENSE = GPLv2+
+CWIID_LICENSE_FILES = COPYING
+
+CWIID_AUTORECONF = YES
+CWIID_INSTALL_STAGING = YES
+
+CWIID_DEPENDENCIES = host-pkgconf host-bison host-flex bluez_utils
+
+# Disable python support. This disables the 2 following things:
+#   - wminput Python plugin support
+#   - cwiid Python module
+CWIID_CONF_OPT = --without-python --disable-ldconfig
+
+ifeq ($(BR2_PACKAGE_CWIID_WMGUI),y)
+CWIID_DEPENDENCIES += libgtk2 libglib2
+CWIID_CONF_OPT += --enable-wmgui
+else
+CWIID_CONF_OPT += --disable-wmgui
+endif
+
+$(eval $(autotools-package))
-- 
1.8.5.2
