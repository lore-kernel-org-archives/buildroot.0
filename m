From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 25 Sep 2013 14:32:48 -0500
Subject: [Buildroot] [PATCH v3 13/16] policycoreutils: new package
In-Reply-To: <1380137571-688-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1380137571-688-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1380137571-688-14-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Changes v2 -> v3:
  - Added dependencies on BR2_TOOLCHAIN_HAS_THREADS and BR2_LARGEFILE (suggested by Thomas).
  - Changes patch naming convention (suggested by Thomas).
  - Added selects for linux-pam and audit.
Changes v1 -> v2:
  - General cleanup to the mk file to conform to the standard format.
  - Fixed the patch naming to avoid using the version number.
  - Cleaned up the patch to include a signed-off-by line.
  - Changed package dependencies into selects in the config.

 package/Config.in                                  |    1 +
 package/policycoreutils/Config.in                  |   76 +++++
 package/policycoreutils/S15restorecond             |   85 +++++
 .../policycoreutils-0001-cross-compile-fixes.patch |  332 ++++++++++++++++++++
 package/policycoreutils/policycoreutils.mk         |  230 ++++++++++++++
 5 files changed, 724 insertions(+), 0 deletions(-)
 create mode 100644 package/policycoreutils/Config.in
 create mode 100755 package/policycoreutils/S15restorecond
 create mode 100644 package/policycoreutils/policycoreutils-0001-cross-compile-fixes.patch
 create mode 100644 package/policycoreutils/policycoreutils.mk

diff --git a/package/Config.in b/package/Config.in
index e551c42..2c45e2f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -919,6 +919,7 @@ source "package/xenomai/Config.in"
 endmenu
 
 menu "Security"
+source "package/policycoreutils/Config.in"
 source "package/sepolgen/Config.in"
 source "package/setools/Config.in"
 endmenu
diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
new file mode 100644
index 0000000..6551da8
--- /dev/null
+++ b/package/policycoreutils/Config.in
@@ -0,0 +1,76 @@
+config BR2_PACKAGE_POLICYCOREUTILS
+	bool "policycoreutils"
+	select BR2_PACKAGE_LIBSEMANAGE
+	select BR2_PACKAGE_LINUX_PAM
+	select BR2_PACKAGE_AUDIT
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_LARGEFILE
+	help
+	  Policycoreutils is a collection of policy utilities (originally 
+	  the "core" set of utilities needed to use SELinux, although it 
+	  has grown a bit over time), which have different dependencies. 
+	  sestatus, secon, run_init, and newrole only use libselinux. 
+	  load_policy and setfiles only use libselinux and libsepol. 
+	  semodule and semanage use libsemanage (and thus bring in 
+	  dependencies on libsepol and libselinux as well). setsebool 
+	  uses libselinux to make non-persistent boolean changes (via 
+	  the kernel interface) and uses libsemanage to make persistent 
+	  boolean changes. 
+	  
+	  The base package will install the following utilities:
+	      load_policy
+	      newrole
+	      restorecond
+	      run_init
+	      secon
+	      semodule
+	      semodule_deps
+	      semodule_expand
+	      semodule_link
+	      semodule_package
+	      sepolgen-ifgen
+	      sestatus
+	      setfiles
+	      setsebool
+	      
+	  http://selinuxproject.org/page/Main_Page
+
+comment "policycoreutils support requires a toolchain with large file and threading support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE
+
+if BR2_PACKAGE_POLICYCOREUTILS
+
+config BR2_PACKAGE_POLICYCOREUTILS_POLICY_DEBUGGING
+	bool "Policy Debugging Utilities"
+	select BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_SEPOLGEN
+	select BR2_PACKAGE_SETOOLS
+	help
+	  Enable policy debugging packages to be built.  These are being included
+	  separately because of dependencies.
+	      audit2allow
+	      audit2why
+	      semanage
+	      sepolicy
+	      scripts
+
+config BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND
+	bool "restorecond Utility"
+	help
+	  Enable restorecond to be built
+
+config BR2_PACKAGE_POLICYCOREUTILS_MCSTRANS
+	bool "mcstrans Utility"
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_LIBCAP
+	help
+	  Enable mcstrans to be built
+
+config BR2_PACKAGE_POLICYCOREUTILS_SANDBOX
+	bool "sandbox Utility"
+	select BR2_PACKAGE_POLICYCOREUTILS_POLICY_DEBUGGING
+	select BR2_PACKAGE_LIBCGROUP
+	help
+	  Enable sandbox to be built
+
+endif
diff --git a/package/policycoreutils/S15restorecond b/package/policycoreutils/S15restorecond
new file mode 100755
index 0000000..e408281
--- /dev/null
+++ b/package/policycoreutils/S15restorecond
@@ -0,0 +1,85 @@
+#!/bin/sh
+#
+# restorecond:		Daemon used to maintain path file context
+#
+# description:	restorecond uses inotify to look for creation of new files \
+# listed in the /etc/selinux/restorecond.conf file, and restores the \
+# correct security context.
+#
+# processname: /usr/sbin/restorecond
+# config: /etc/selinux/restorecond.conf 
+# pidfile: /var/run/restorecond.pid
+#
+# Return values according to LSB for all commands but status:
+# 0 - success
+# 1 - generic or unspecified error
+# 2 - invalid or excess argument(s)
+# 3 - unimplemented feature (e.g. "reload")
+# 4 - insufficient privilege
+# 5 - program is not installed
+# 6 - program is not configured
+# 7 - program is not running
+
+PATH=/sbin:/bin:/usr/bin:/usr/sbin
+
+[ -x /usr/sbin/selinuxenabled ] && /usr/sbin/selinuxenabled || exit 7
+
+# Check that we are root ... so non-root users stop here
+test $EUID = 0  || exit 4
+
+test -x /usr/sbin/restorecond  || exit 5
+test -f /etc/selinux/restorecond.conf  || exit 6
+
+RETVAL=0
+
+start() 
+{
+	echo -n $"Starting restorecond: "
+	unset HOME MAIL USER USERNAME
+	/usr/sbin/restorecond 
+	RETVAL=$?
+	touch /var/lock/subsys/restorecond
+	echo
+	return $RETVAL
+}
+
+stop() 
+{
+	echo -n $"Shutting down restorecond: "
+	killproc restorecond
+	RETVAL=$?
+	rm -f  /var/lock/subsys/restorecond
+	echo
+	return $RETVAL
+}
+
+restart() 
+{
+	stop
+	start
+}
+
+# See how we were called.
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  status)
+	status restorecond
+	RETVAL=$?
+	;;
+  force-reload|restart|reload)
+	restart
+	;;
+  condrestart)
+	[ -e /var/lock/subsys/restorecond ] && restart || :
+	;;
+  *)
+	echo $"Usage: $0 {start|stop|restart|force-reload|status|condrestart}"
+	RETVAL=3
+esac
+
+exit $RETVAL
diff --git a/package/policycoreutils/policycoreutils-0001-cross-compile-fixes.patch b/package/policycoreutils/policycoreutils-0001-cross-compile-fixes.patch
new file mode 100644
index 0000000..8f47907
--- /dev/null
+++ b/package/policycoreutils/policycoreutils-0001-cross-compile-fixes.patch
@@ -0,0 +1,332 @@
+Patch to enable cross compile build and install.
+
+Signed-off-by Clayton Shotwell <clshotwe@rockwellcollins.com>
+
+diff -urN a/audit2allow/Makefile b/audit2allow/Makefile
+--- a/audit2allow/Makefile	2013-02-05 19:43:22.000000000 -0600
++++ b/audit2allow/Makefile	2013-08-23 09:16:21.282917254 -0500
+@@ -3,7 +3,7 @@
+ BINDIR ?= $(PREFIX)/bin
+ LIBDIR ?= $(PREFIX)/lib
+ MANDIR ?= $(PREFIX)/share/man
+-LOCALEDIR ?= /usr/share/locale
++LOCALEDIR ?= $(DESTDIR)/usr/share/locale
+ 
+ all: ;
+ 
+diff -urN a/load_policy/Makefile b/load_policy/Makefile
+--- a/load_policy/Makefile	2013-02-05 19:43:22.000000000 -0600
++++ b/load_policy/Makefile	2013-08-23 09:16:21.282917254 -0500
+@@ -3,7 +3,7 @@
+ SBINDIR ?= $(DESTDIR)/sbin
+ USRSBINDIR ?= $(PREFIX)/sbin
+ MANDIR ?= $(PREFIX)/share/man
+-LOCALEDIR ?= /usr/share/locale
++LOCALEDIR ?= $(DESTDIR)/usr/share/locale
+ 
+ CFLAGS ?= -Werror -Wall -W
+ override CFLAGS += $(LDFLAGS) -I$(PREFIX)/include -DUSE_NLS -DLOCALEDIR="\"$(LOCALEDIR)\"" -DPACKAGE="\"policycoreutils\""
+diff -urN a/Makefile b/Makefile
+--- a/Makefile	2013-02-05 19:43:22.000000000 -0600
++++ b/Makefile	2013-08-23 09:16:21.292985286 -0500
+@@ -1,8 +1,8 @@
+ SUBDIRS = sepolicy setfiles semanage load_policy newrole run_init sandbox secon audit2allow audit2why sestatus semodule_package semodule semodule_link semodule_expand semodule_deps sepolgen-ifgen setsebool scripts po man gui
+ 
+-INOTIFYH = $(shell ls /usr/include/sys/inotify.h 2>/dev/null)
++INOTIFYH = $(shell ls $(DESTDIR)/usr/include/sys/inotify.h 2>/dev/null)
+ 
+-ifeq (${INOTIFYH}, /usr/include/sys/inotify.h)
++ifeq (${INOTIFYH}, $(DESTDIR)/usr/include/sys/inotify.h)
+ 	SUBDIRS += restorecond
+ endif
+ 
+diff -urN a/mcstrans/src/Makefile b/mcstrans/src/Makefile
+--- a/mcstrans/src/Makefile	2013-02-05 19:43:22.000000000 -0600
++++ b/mcstrans/src/Makefile	2013-08-23 09:41:18.782916946 -0500
+@@ -1,22 +1,8 @@
+-ARCH = $(shell uname -i)
+-ifeq "$(ARCH)" "x86_64"
+-	# In case of 64 bit system, use these lines
+-	LIBDIR=/usr/lib64
+-else 
+-ifeq "$(ARCH)" "i686"
+-	# In case of 32 bit system, use these lines
+-	LIBDIR=/usr/lib
+-else
+-ifeq "$(ARCH)" "i386"
+-	# In case of 32 bit system, use these lines
+-	LIBDIR=/usr/lib
+-endif
+-endif
+-endif
+ # Installation directories.
+ PREFIX  ?= $(DESTDIR)/usr
+-SBINDIR ?= $(DESTDIR)/sbin
+-INITDIR ?= $(DESTDIR)/etc/rc.d/init.d
++LIBDIR  ?= $(PREFIX)/lib
++SBINDIR ?= $(PREFIX)/sbin
++INITDIR ?= $(DESTDIR)/etc/init.d
+ 
+ PROG_SRC=mcstrans.c  mcscolor.c  mcstransd.c  mls_level.c
+ PROG_OBJS= $(patsubst %.c,%.o,$(PROG_SRC))
+@@ -40,5 +26,5 @@
+ 	install -m 755 $(INITSCRIPT).init $(INITDIR)/$(INITSCRIPT)
+ 
+ clean: 
+-	-rm -f $(OBJS) $(LOBJS) $(TARGET) $(PROG) $(PROG_OBJS) *~ \#*
++	-rm -f $(PROG) $(PROG_OBJS) *.o *~ \#*
+ 
+diff -urN a/mcstrans/utils/Makefile b/mcstrans/utils/Makefile
+--- a/mcstrans/utils/Makefile	2013-02-05 19:43:22.000000000 -0600
++++ b/mcstrans/utils/Makefile	2013-08-23 09:16:21.292985286 -0500
+@@ -1,24 +1,8 @@
+ # Installation directories.
+ PREFIX ?= $(DESTDIR)/usr
++LIBDIR  ?= $(PREFIX)/lib
+ BINDIR ?= $(PREFIX)/sbin
+ 
+-ARCH = $(shell uname -i)
+-ifeq "$(ARCH)" "x86_64"
+-        # In case of 64 bit system, use these lines
+-        LIBDIR=/usr/lib64
+-else
+-ifeq "$(ARCH)" "i686"
+-        # In case of 32 bit system, use these lines
+-        LIBDIR=/usr/lib
+-else
+-ifeq "$(ARCH)" "i386"
+-        # In case of 32 bit system, use these lines
+-        LIBDIR=/usr/lib
+-endif
+-endif
+-endif
+-
+-
+ CFLAGS ?= -Wall
+ override CFLAGS += -I../src -D_GNU_SOURCE
+ LDLIBS += -L../src ../src/mcstrans.o ../src/mls_level.o -lselinux -lpcre $(LIBDIR)/libsepol.a
+diff -urN a/newrole/Makefile b/newrole/Makefile
+--- a/newrole/Makefile	2013-02-05 19:43:22.000000000 -0600
++++ b/newrole/Makefile	2013-08-23 09:16:21.292985286 -0500
+@@ -3,9 +3,9 @@
+ BINDIR ?= $(PREFIX)/bin
+ MANDIR ?= $(PREFIX)/share/man
+ ETCDIR ?= $(DESTDIR)/etc
+-LOCALEDIR = /usr/share/locale
+-PAMH = $(shell ls /usr/include/security/pam_appl.h 2>/dev/null)
+-AUDITH = $(shell ls /usr/include/libaudit.h 2>/dev/null)
++LOCALEDIR = $(DESTDIR)/usr/share/locale
++PAMH = $(shell ls $(DESTDIR)/usr/include/security/pam_appl.h 2>/dev/null)
++AUDITH = $(shell ls $(DESTDIR)/usr/include/libaudit.h 2>/dev/null)
+ # Enable capabilities to permit newrole to generate audit records.
+ # This will make newrole a setuid root program.
+ # The capabilities used are: CAP_AUDIT_WRITE.
+@@ -24,7 +24,7 @@
+ EXTRA_OBJS =
+ override CFLAGS += -DVERSION=\"$(VERSION)\" $(LDFLAGS) -I$(PREFIX)/include -DUSE_NLS -DLOCALEDIR="\"$(LOCALEDIR)\"" -DPACKAGE="\"policycoreutils\""
+ LDLIBS += -lselinux -L$(PREFIX)/lib
+-ifeq ($(PAMH), /usr/include/security/pam_appl.h)
++ifeq ($(PAMH), $(DESTDIR)/usr/include/security/pam_appl.h)
+ 	override CFLAGS += -DUSE_PAM
+ 	EXTRA_OBJS += hashtab.o
+ 	LDLIBS += -lpam -lpam_misc
+@@ -32,7 +32,7 @@
+ 	override CFLAGS += -D_XOPEN_SOURCE=500
+ 	LDLIBS += -lcrypt
+ endif
+-ifeq ($(AUDITH), /usr/include/libaudit.h)
++ifeq ($(AUDITH), $(DESTDIR)/usr/include/libaudit.h)
+ 	override CFLAGS += -DUSE_AUDIT
+ 	LDLIBS += -laudit
+ endif
+@@ -66,7 +66,7 @@
+ 	test -d $(MANDIR)/man1 || install -m 755 -d $(MANDIR)/man1
+ 	install -m $(MODE) newrole $(BINDIR)
+ 	install -m 644 newrole.1 $(MANDIR)/man1/
+-ifeq ($(PAMH), /usr/include/security/pam_appl.h)
++ifeq ($(PAMH), $(DESTDIR)/usr/include/security/pam_appl.h)
+ 	test -d $(ETCDIR)/pam.d || install -m 755 -d $(ETCDIR)/pam.d
+ ifeq ($(LSPP_PRIV),y)
+ 	install -m 644 newrole-lspp.pamd $(ETCDIR)/pam.d/newrole
+diff -urN a/restorecond/Makefile b/restorecond/Makefile
+--- a/restorecond/Makefile	2013-02-05 19:43:22.000000000 -0600
++++ b/restorecond/Makefile	2013-08-23 09:16:21.292985286 -0500
+@@ -2,24 +2,29 @@
+ PREFIX ?= $(DESTDIR)/usr
+ SBINDIR ?= $(PREFIX)/sbin
+ LIBDIR ?= $(PREFIX)/lib
+-MANDIR = $(PREFIX)/share/man
++MANDIR ?= $(PREFIX)/share/man
+ AUTOSTARTDIR = $(DESTDIR)/etc/xdg/autostart
+ DBUSSERVICEDIR = $(DESTDIR)/usr/share/dbus-1/services
+ 
+ autostart_DATA = sealertauto.desktop
+-INITDIR = $(DESTDIR)/etc/rc.d/init.d
++INITDIR = $(DESTDIR)/etc/init.d
+ SELINUXDIR = $(DESTDIR)/etc/selinux
+ 
+-DBUSFLAGS = -DHAVE_DBUS -I/usr/include/dbus-1.0 -I/usr/lib64/dbus-1.0/include -I/usr/lib/dbus-1.0/include
++DBUSFLAGS = -DHAVE_DBUS -I$(PREFIX)/include/dbus-1.0 -I$(PREFIX)/lib64/dbus-1.0/include \
++		-I$(PREFIX)/lib/dbus-1.0/include
+ DBUSLIB = -ldbus-glib-1 -ldbus-1
+ 
+ CFLAGS ?= -g -Werror -Wall -W
+-override CFLAGS += -I$(PREFIX)/include $(DBUSFLAGS) -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/lib/glib-2.0/include
++override CFLAGS += -I$(PREFIX)/include $(DBUSFLAGS) -I$(PREFIX)/include/glib-2.0 \
++		-I$(PREFIX)/lib64/glib-2.0/include -I$(PREFIX)/lib/glib-2.0/include
+ 
+ LDLIBS += -lselinux $(DBUSLIB) -lglib-2.0 -L$(LIBDIR)
+ 
+ all: restorecond
+ 
++%.o: %.c
++	$(CC) $(CFLAGS) -c -o $@ $<
++
+ restorecond.o utmpwatcher.o stringslist.o user.o watch.o: restorecond.h
+ 
+ restorecond:  ../setfiles/restore.o restorecond.o utmpwatcher.o stringslist.o user.o watch.o
+diff -urN a/run_init/Makefile b/run_init/Makefile
+--- a/run_init/Makefile	2013-02-05 19:43:22.000000000 -0600
++++ b/run_init/Makefile	2013-08-23 09:16:21.292985286 -0500
+@@ -4,21 +4,21 @@
+ SBINDIR ?= $(PREFIX)/sbin
+ MANDIR ?= $(PREFIX)/share/man
+ ETCDIR ?= $(DESTDIR)/etc
+-LOCALEDIR ?= /usr/share/locale
+-PAMH = $(shell ls /usr/include/security/pam_appl.h 2>/dev/null)
+-AUDITH = $(shell ls /usr/include/libaudit.h 2>/dev/null)
++LOCALEDIR ?= $(DESTDIR)/usr/share/locale
++PAMH = $(shell ls $(DESTDIR)/usr/include/security/pam_appl.h 2>/dev/null)
++AUDITH = $(shell ls $(DESTDIR)/usr/include/libaudit.h 2>/dev/null)
+ 
+ CFLAGS ?= -Werror -Wall -W
+ override CFLAGS += -I$(PREFIX)/include -DUSE_NLS -DLOCALEDIR="\"$(LOCALEDIR)\"" -DPACKAGE="\"policycoreutils\""
+ LDLIBS += -lselinux -L$(PREFIX)/lib
+-ifeq ($(PAMH), /usr/include/security/pam_appl.h)
++ifeq ($(PAMH), $(DESTDIR)/usr/include/security/pam_appl.h)
+ 	override CFLAGS += -DUSE_PAM
+ 	LDLIBS += -lpam -lpam_misc
+ else
+ 	override CFLAGS += -D_XOPEN_SOURCE=500
+ 	LDLIBS += -lcrypt
+ endif
+-ifeq ($(AUDITH), /usr/include/libaudit.h)
++ifeq ($(AUDITH), $(DESTDIR)/usr/include/libaudit.h)
+ 	override CFLAGS += -DUSE_AUDIT
+ 	LDLIBS += -laudit
+ endif
+@@ -38,7 +38,7 @@
+ 	install -m 755 open_init_pty $(SBINDIR)
+ 	install -m 644 run_init.8 $(MANDIR)/man8/
+ 	install -m 644 open_init_pty.8 $(MANDIR)/man8/
+-ifeq ($(PAMH), /usr/include/security/pam_appl.h)
++ifeq ($(PAMH), $(DESTDIR)/usr/include/security/pam_appl.h)
+ 	install -m 644 run_init.pamd $(ETCDIR)/pam.d/run_init
+ endif
+ 
+diff -urN a/semodule/Makefile b/semodule/Makefile
+--- a/semodule/Makefile	2013-02-05 19:43:22.000000000 -0600
++++ b/semodule/Makefile	2013-08-23 09:16:21.302924109 -0500
+@@ -2,7 +2,7 @@
+ PREFIX ?= $(DESTDIR)/usr
+ INCLUDEDIR ?= $(PREFIX)/include
+ SBINDIR ?= $(PREFIX)/sbin
+-MANDIR = $(PREFIX)/share/man
++MANDIR ?= $(PREFIX)/share/man
+ LIBDIR ?= $(PREFIX)/lib
+ 
+ CFLAGS ?= -Werror -Wall -W
+diff -urN a/sepolicy/Makefile b/sepolicy/Makefile
+--- a/sepolicy/Makefile	2013-02-05 19:43:22.000000000 -0600
++++ b/sepolicy/Makefile	2013-08-23 09:16:21.302924109 -0500
+@@ -5,25 +5,32 @@
+ BINDIR ?= $(PREFIX)/bin
+ SBINDIR ?= $(PREFIX)/sbin
+ MANDIR ?= $(PREFIX)/share/man
+-LOCALEDIR ?= /usr/share/locale
++LOCALEDIR ?= $(DESTDIR)/usr/share/locale
+ PYTHON ?= /usr/bin/python
+ BASHCOMPLETIONDIR ?= $(DESTDIR)/etc/bash_completion.d/
+ SHAREDIR ?= $(PREFIX)/share/sandbox
+-override CFLAGS = $(LDFLAGS) -I$(PREFIX)/include -DPACKAGE="policycoreutils" -Wall -Werror -Wextra -W  -DSHARED -shared
++override CFLAGS += $(LDFLAGS) -I$(PREFIX)/include -DPACKAGE="policycoreutils" -Wall -Werror -Wextra -W  -DSHARED -shared
+ 
+ BASHCOMPLETIONS=sepolicy-bash-completion.sh 
+ 
++PYTHON_ARGS = LDSHARED="$(CC) -shared" \
++		CROSS_COMPILING=yes              \
++		_python_sysroot=$(DESTDIR)       \
++		_python_srcdir=$(PYTHON_SRC)     \
++		_python_prefix=/usr              \
++		_python_exec_prefix=/usr
++
+ all: python-build
+ 
+ python-build: info.c search.c common.h policy.h policy.c
+-	$(PYTHON) setup.py build
++	$(PYTHON_ARGS) $(PYTHON) setup.py build
+ 
+ clean:
+ 	$(PYTHON) setup.py clean
+ 	-rm -rf build *~ \#* *pyc .#*
+ 
+ install:
+-	$(PYTHON) setup.py install `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
++	$(PYTHON_ARGS) $(PYTHON) setup.py install --prefix=$(PREFIX)
+ 	[ -d $(BINDIR) ] || mkdir -p $(BINDIR)
+ 	install -m 755 sepolicy.py $(BINDIR)/sepolicy
+ 	-mkdir -p $(MANDIR)/man8
+diff -urN a/sestatus/Makefile b/sestatus/Makefile
+--- a/sestatus/Makefile	2013-02-05 19:43:22.000000000 -0600
++++ b/sestatus/Makefile	2013-08-23 09:16:21.302924109 -0500
+@@ -1,11 +1,11 @@
+ # Installation directories.
+ PREFIX ?= $(DESTDIR)/usr
+ SBINDIR ?= $(PREFIX)/sbin
+-MANDIR = $(PREFIX)/share/man
++MANDIR ?= $(PREFIX)/share/man
+ ETCDIR ?= $(DESTDIR)/etc
+ LIBDIR ?= $(PREFIX)/lib
+ 
+-CFLAGS = -Werror -Wall -W
++CFLAGS ?= -Werror -Wall -W
+ override CFLAGS += -I$(PREFIX)/include -D_FILE_OFFSET_BITS=64
+ LDLIBS = -lselinux -L$(LIBDIR)
+ 
+diff -urN a/setfiles/Makefile b/setfiles/Makefile
+--- a/setfiles/Makefile	2013-02-05 19:43:22.000000000 -0600
++++ b/setfiles/Makefile	2013-08-23 09:16:21.302924109 -0500
+@@ -1,24 +1,27 @@
+ # Installation directories.
+ PREFIX ?= $(DESTDIR)/usr
+ SBINDIR ?= $(DESTDIR)/sbin
+-MANDIR = $(PREFIX)/share/man
++MANDIR ?= $(PREFIX)/share/man
+ LIBDIR ?= $(PREFIX)/lib
+-AUDITH = $(shell ls /usr/include/libaudit.h 2>/dev/null)
++AUDITH = $(shell ls $(DESTDIR)/usr/include/libaudit.h 2>/dev/null)
+ 
+-PROGRESS_STEP=$(shell grep "^\#define STAR_COUNT" restore.h | awk -S '{ print $$3 }')
+-ABORT_ON_ERRORS=$(shell grep "^\#define ABORT_ON_ERRORS" setfiles.c | awk -S '{ print $$3 }')
++PROGRESS_STEP=$(shell grep "^\#define STAR_COUNT" restore.h | awk '{ print $$3 }')
++ABORT_ON_ERRORS=$(shell grep "^\#define ABORT_ON_ERRORS" setfiles.c | awk '{ print $$3 }')
+ 
+-CFLAGS = -g -Werror -Wall -W
++CFLAGS ?= -g -Werror -Wall -W
+ override CFLAGS += -I$(PREFIX)/include
+ LDLIBS = -lselinux -lsepol -L$(LIBDIR)
+ 
+-ifeq ($(AUDITH), /usr/include/libaudit.h)
++ifeq ($(AUDITH), $(DESTDIR)/usr/include/libaudit.h)
+ 	override CFLAGS += -DUSE_AUDIT
+ 	LDLIBS += -laudit
+ endif
+ 
+ all: setfiles restorecon man
+ 
++%.o: %.c
++	$(CC) $(CFLAGS) -c -o $@ $<
++
+ setfiles:  setfiles.o restore.o
+ 
+ restorecon: setfiles
diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
new file mode 100644
index 0000000..d4926f3
--- /dev/null
+++ b/package/policycoreutils/policycoreutils.mk
@@ -0,0 +1,230 @@
+################################################################################
+#
+# policycoreutils
+#
+################################################################################
+
+POLICYCOREUTILS_VERSION = 2.1.14
+POLICYCOREUTILS_SITE = http://userspace.selinuxproject.org/releases/20130423/
+POLICYCOREUTILS_LICENSE = GPLv2
+POLICYCOREUTILS_LICENSE_FILES = COPYING
+
+# Both audit and linux-pam are required by the LSPP_PRIV=y option below
+POLICYCOREUTILS_DEPENDENCIES = libsemanage libcap-ng dbus-glib \
+	libglib2 linux-pam audit
+
+ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_POLICY_DEBUGGING),y)
+
+POLICYCOREUTILS_DEPENDENCIES += python host-python sepolgen setools
+
+POLICYCOREUTILS_DEBUGGING_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) \
+	PYTHON="$(HOST_DIR)/usr/bin/python" \
+	PYLIBVER="python$(PYTHON_VERSION_MAJOR)" \
+	PYTHON_SRC="$(BUILD_DIR)/python$(PYTHON_VERSION)"
+
+define POLICYCOREUTILS_DEBUGGING_BUILD_CMDS
+	$(MAKE) -C $(@D)/audit2allow $(POLICYCOREUTILS_DEBUGGING_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" all
+	$(MAKE) -C $(@D)/audit2why $(POLICYCOREUTILS_DEBUGGING_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" all
+	$(MAKE) -C $(@D)/scripts $(POLICYCOREUTILS_DEBUGGING_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" all
+	$(MAKE) -C $(@D)/semanage $(POLICYCOREUTILS_DEBUGGING_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" all
+	$(MAKE) -C $(@D)/sepolicy $(POLICYCOREUTILS_DEBUGGING_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" all
+endef
+
+define POLICYCOREUTILS_DEBUGGING_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D)/audit2allow $(POLICYCOREUTILS_DEBUGGING_MAKE_OPTS) \
+		DESTDIR="$(TARGET_DIR)" install
+	$(MAKE) -C $(@D)/audit2why $(POLICYCOREUTILS_DEBUGGING_MAKE_OPTS) \
+		DESTDIR="$(TARGET_DIR)" install
+	$(MAKE) -C $(@D)/scripts $(POLICYCOREUTILS_DEBUGGING_MAKE_OPTS) \
+		DESTDIR="$(TARGET_DIR)" install
+	$(MAKE) -C $(@D)/semanage $(POLICYCOREUTILS_DEBUGGING_MAKE_OPTS) \
+		DESTDIR="$(TARGET_DIR)" install
+	$(MAKE) -C $(@D)/sepolicy $(POLICYCOREUTILS_DEBUGGING_MAKE_OPTS) \
+		DESTDIR="$(TARGET_DIR)" install
+endef
+
+endif # End of BR2_PACKAGE_POLICYCOREUTILS_POLICY_DEBUGGING
+
+ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND),y)
+
+define POLICYCOREUTILS_RESTORECOND_BUILD_CMDS
+	$(MAKE) -C $(@D)/restorecond $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" all
+endef
+
+define POLICYCOREUTILS_RESTORECOND_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D)/restorecond $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR="$(TARGET_DIR)" install
+	rm $(TARGET_DIR)/etc/init.d/restorecond
+	$(INSTALL) -m 0755 package/policycoreutils/S15restorecond \
+		$(TARGET_DIR)/etc/init.d/
+endef
+
+endif # End of BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND
+
+ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_MCSTRANS),y)
+
+POLICYCOREUTILS_DEPENDENCIES += pcre libcap
+
+define POLICYCOREUTILS_MCSTRANS_BUILD_CMDS
+	$(MAKE) -C $(@D)/mcstrans $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" all
+endef
+
+define POLICYCOREUTILS_MCSTRANS_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D)/mcstrans $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR="$(TARGET_DIR)" install
+endef
+
+endif # End of BR2_PACKAGE_POLICYCOREUTILS_MCSTRANS
+
+ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_SANDBOX),y)
+
+POLICYCOREUTILS_DEPENDENCIES += libcgroup
+
+define POLICYCOREUTILS_SANDBOX_BUILD_CMDS
+	$(MAKE) -C $(@D)/sandbox $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" all
+endef
+
+define POLICYCOREUTILS_SANDBOX_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D)/sandbox $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR="$(TARGET_DIR)" install
+endef
+
+endif # End of BR2_PACKAGE_POLICYCOREUTILS_SANDBOX
+
+define POLICYCOREUTILS_INSTALL_TARGET_PAM_CONFS
+	$(INSTALL) -D -m 0644 $(@D)/newrole/newrole-lspp.pamd \
+		$(TARGET_DIR)/etc/pam.d/newrole
+	$(INSTALL) -D -m 0644 $(@D)/run_init/run_init.pamd \
+		$(TARGET_DIR)/etc/pam.d/run_init
+endef
+
+# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h 
+# large file support.
+# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
+POLICYCOREUTILS_MAKE_OPTS = \
+	$(TARGET_CONFIGURE_OPTS) \
+	CFLAGS+="-U_FILE_OFFSET_BITS" \
+	LSPP_PRIV=y
+
+define POLICYCOREUTILS_BUILD_CMDS
+	$(MAKE) -C $(@D)/load_policy $(POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" all
+	$(MAKE) -C $(@D)/newrole $(POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" all
+	$(MAKE) -C $(@D)/restorecond $(POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" all
+	$(MAKE) -C $(@D)/run_init $(POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" all
+	$(MAKE) -C $(@D)/secon $(POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" all
+	$(MAKE) -C $(@D)/semodule $(POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" all
+	$(MAKE) -C $(@D)/semodule_deps $(POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" all
+	$(MAKE) -C $(@D)/semodule_expand $(POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" all
+	$(MAKE) -C $(@D)/semodule_link $(POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" all
+	$(MAKE) -C $(@D)/semodule_package $(POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" all
+	$(MAKE) -C $(@D)/sepolgen-ifgen $(POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" all
+	$(MAKE) -C $(@D)/sestatus $(POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" all
+	$(MAKE) -C $(@D)/setfiles $(POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" all
+	$(MAKE) -C $(@D)/setsebool $(POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" all
+	$(POLICYCOREUTILS_DEBUGGING_BUILD_CMDS)
+	$(POLICYCOREUTILS_RESTORECOND_BUILD_CMDS)
+	$(POLICYCOREUTILS_MCSTRANS_BUILD_CMDS)
+	$(POLICYCOREUTILS_SANDBOX_BUILD_CMDS)
+endef
+
+define POLICYCOREUTILS_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D)/load_policy      DESTDIR="$(TARGET_DIR)" install
+	$(MAKE) -C $(@D)/newrole          DESTDIR="$(TARGET_DIR)" install
+	$(MAKE) -C $(@D)/restorecond      DESTDIR="$(TARGET_DIR)" install
+	$(MAKE) -C $(@D)/run_init         DESTDIR="$(TARGET_DIR)" install
+	$(MAKE) -C $(@D)/secon            DESTDIR="$(TARGET_DIR)" install
+	$(MAKE) -C $(@D)/semodule         DESTDIR="$(TARGET_DIR)" install
+	$(MAKE) -C $(@D)/semodule_deps    DESTDIR="$(TARGET_DIR)" install
+	$(MAKE) -C $(@D)/semodule_expand  DESTDIR="$(TARGET_DIR)" install
+	$(MAKE) -C $(@D)/semodule_link    DESTDIR="$(TARGET_DIR)" install
+	$(MAKE) -C $(@D)/semodule_package DESTDIR="$(TARGET_DIR)" install
+	$(MAKE) -C $(@D)/sepolgen-ifgen   DESTDIR="$(TARGET_DIR)" install
+	$(MAKE) -C $(@D)/sestatus         DESTDIR="$(TARGET_DIR)" install
+	$(MAKE) -C $(@D)/setfiles         DESTDIR="$(TARGET_DIR)" install
+	$(MAKE) -C $(@D)/setsebool        DESTDIR="$(TARGET_DIR)" install
+	$(POLICYCOREUTILS_INSTALL_TARGET_PAM_CONFS)
+	$(POLICYCOREUTILS_DEBUGGING_INSTALL_TARGET_CMDS)
+	$(POLICYCOREUTILS_RESTORECOND_INSTALL_TARGET_CMDS)
+	$(POLICYCOREUTILS_MCSTRANS_INSTALL_TARGET_CMDS)
+	$(POLICYCOREUTILS_SANDBOX_INSTALL_TARGET_CMDS)
+endef
+
+define POLICYCOREUTILS_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean DESTDIR=$(STAGING_DIR)
+	$(MAKE) -C $(@D)/mcstrans clean DESTDIR=$(STAGING_DIR)
+	$(MAKE) -C $(@D)/restorecond clean DESTDIR=$(STAGING_DIR)
+endef
+
+HOST_POLICYCOREUTILS_DEPENDENCIES = host-libsemanage
+
+# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h 
+# large file support.
+# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
+HOST_POLICYCOREUTILS_MAKE_OPTS = \
+	$(HOST_CONFIGURE_OPTS) \
+	CFLAGS+="-U_FILE_OFFSET_BITS" \
+	LSPP_PRIV=y
+
+# Note: We are only building the programs required by the refpolicy build
+define HOST_POLICYCOREUTILS_BUILD_CMDS
+	$(MAKE) -C $(@D)/semodule $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR=$(HOST_DIR)
+	$(MAKE) -C $(@D)/semodule_package $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR=$(HOST_DIR)
+	$(MAKE) -C $(@D)/semodule_link $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR=$(HOST_DIR)
+	$(MAKE) -C $(@D)/semodule_expand $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR=$(HOST_DIR)
+	$(MAKE) -C $(@D)/semodule_deps $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR=$(HOST_DIR)
+	$(MAKE) -C $(@D)/load_policy $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR=$(HOST_DIR)
+	$(MAKE) -C $(@D)/setfiles $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR=$(HOST_DIR)
+endef
+
+define HOST_POLICYCOREUTILS_INSTALL_CMDS
+	$(MAKE) -C $(@D)/semodule install $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR=$(HOST_DIR)
+	$(MAKE) -C $(@D)/semodule_package install $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR=$(HOST_DIR)
+	$(MAKE) -C $(@D)/semodule_link install $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR=$(HOST_DIR)
+	$(MAKE) -C $(@D)/semodule_expand install $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR=$(HOST_DIR)
+	$(MAKE) -C $(@D)/semodule_deps install $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR=$(HOST_DIR)
+	$(MAKE) -C $(@D)/load_policy install $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR=$(HOST_DIR)
+	$(MAKE) -C $(@D)/setfiles install $(HOST_POLICYCOREUTILS_MAKE_OPTS) \
+		DESTDIR=$(HOST_DIR)
+endef
+
+define HOST_POLICYCOREUTILS_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean DESTDIR=$(HOST_DIR)
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.7.1
