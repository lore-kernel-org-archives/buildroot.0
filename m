From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 13 May 2015 16:39:19 -0500
Subject: [Buildroot] [PATCH v5 06/24] policycoreutils: new package
In-Reply-To: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1431553177-7280-7-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

---
Changes v4 -> v5:
  - Updated depends and removed glibc dependency (Matt W.)
  - Updated site to github (Matt W.)
  - Added host python 2/3 support (Matt W.)
  - Removed sandbox and mctrans support (Matt W.)
  - Removed restorcon init script (Matt W.)
  - Agree as optional settings were removed so menu isn't needed
    (Suggested by Ryan B. and Thomas P.)
  - added Config.in select for LIBCAP_NG (Suggested by Thomas P.)
  - cleaned up pam/audit ifeq (Suggested by Thomas P.)
  - fixed CFLAGS to include target_cflags instead of += (Suggested by
    Thomas P.)
  - Refactored lists of build/install steps into loops  (Suggested by
    Thomas P.)
  - Removed += on first host depends assignment (Suggested by Thomas P.)
  - Refactored host make opts assignments (Suggested by Thomas P.)
  - Limited to glibc because of fts.h, some uclibc toolchains have it
    others don't.  Eventually this would be good to fix with the updated
    method of file traversal. (Matt W.)
  - Gettext fixups for uclibc support.  Counter productive as we
    now limit to glibc only. (Matt W.)
  - Added musl as possible lib type (Matt W.)
  - Removed largefile dependency (Clayton S.)
  - Changed dbus-glib select to a depends on in the Config.in (suggested
    by Ryan B.)

Changes v3 -> v4:
  - Add a select for the libselinux Python bindings when debugging
    is enabled.  This will cause Python to be built for the target
    (suggested by Thomas P.)
  - Cleaned up the configure comments (suggested by Thomas).
  - Added a dependency on BR2_USE_MMU for the debugging option
    because python requires it (suggested by Thomas P.)
  - Removed the dependencies on audit and linux-pam. Both packages
    are now optional dependencies based on whether or not the package
    has been selected
  - Moved the dependency on dbus-glib to only the restorecond option
    where it is used
  - Added a INSTALL_INIT_SYSV for the restorecond daemon rather than
    just installing it directly
  - Adding a dependency on glibc
  - Removed the clean commands

Changes v2 -> v3:
  - Added dependencies on BR2_TOOLCHAIN_HAS_THREADS and BR2_LARGEFILE
    (suggested by Thomas P.)
  - Changes patch naming convention (suggested by Thomas P.)
  - Added selects for linux-pam and audit

Changes v1 -> v2:
  - General cleanup to the mk file to conform to the standard format
  - Fixed the patch naming to avoid using the version number
  - Cleaned up the patch to include a signed-off-by line
  - Changed package dependencies into selects in the config
---
 package/Config.in                                  |   1 +
 .../policycoreutils/0001-cross-compile-fixes.patch | 332 +++++++++++++++++++++
 package/policycoreutils/Config.in                  |  53 ++++
 package/policycoreutils/policycoreutils.hash       |   2 +
 package/policycoreutils/policycoreutils.mk         | 107 +++++++
 5 files changed, 495 insertions(+)
 create mode 100644 package/policycoreutils/0001-cross-compile-fixes.patch
 create mode 100644 package/policycoreutils/Config.in
 create mode 100644 package/policycoreutils/policycoreutils.hash
 create mode 100644 package/policycoreutils/policycoreutils.mk

diff --git a/package/Config.in b/package/Config.in
index 5473772..b99a7e0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1338,6 +1338,7 @@ menu "Real-Time"
 endmenu
 
 menu "Security"
+	source "package/policycoreutils/Config.in"
 	source "package/setools/Config.in"
 endmenu
 
diff --git a/package/policycoreutils/0001-cross-compile-fixes.patch b/package/policycoreutils/0001-cross-compile-fixes.patch
new file mode 100644
index 0000000..8f47907
--- /dev/null
+++ b/package/policycoreutils/0001-cross-compile-fixes.patch
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
diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
new file mode 100644
index 0000000..733b896
--- /dev/null
+++ b/package/policycoreutils/Config.in
@@ -0,0 +1,53 @@
+config BR2_PACKAGE_POLICYCOREUTILS
+	bool "policycoreutils"
+	select BR2_PACKAGE_LIBSEMANAGE
+	select BR2_PACKAGE_LIBCAP_NG
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libsemanage
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # uses fts.h
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
+comment "policycoreutils needs a toolchain w/ threads, glibc or musl"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS  \
+		|| !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+
+if BR2_PACKAGE_POLICYCOREUTILS
+
+config BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND
+	bool "restorecond Utility"
+	depends on BR2_PACKAGE_DBUS_GLIB
+	help
+	  Enable restorecond to be built
+
+comment "restorecond needs dbus-glib"
+	depends on !BR2_PACKAGE_DBUS_GLIB
+
+endif
diff --git a/package/policycoreutils/policycoreutils.hash b/package/policycoreutils/policycoreutils.hash
new file mode 100644
index 0000000..575dd25
--- /dev/null
+++ b/package/policycoreutils/policycoreutils.hash
@@ -0,0 +1,2 @@
+# https://github.com/SELinuxProject/selinux/wiki/Releases
+sha256 b6881741f9f9988346a73bfeccb0299941dc117349753f0ef3f23ee86f06c1b5  policycoreutils-2.1.14.tar.gz
diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
new file mode 100644
index 0000000..b03ea5c
--- /dev/null
+++ b/package/policycoreutils/policycoreutils.mk
@@ -0,0 +1,107 @@
+################################################################################
+#
+# policycoreutils
+#
+################################################################################
+
+POLICYCOREUTILS_VERSION = 2.1.14
+POLICYCOREUTILS_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
+POLICYCOREUTILS_LICENSE = GPLv2
+POLICYCOREUTILS_LICENSE_FILES = COPYING
+
+# gettext for load_policy.c use of libintl_* functions
+POLICYCOREUTILS_DEPENDENCIES = libsemanage libcap-ng $(if $(BR2_NEEDS_GETTEXT),gettext)
+
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+	POLICYCOREUTILS_DEPENDENCIES += linux-pam
+	POLICYCOREUTILS_MAKE_OPTS += NAMESPACE_PRIV=y
+define POLICYCOREUTILS_INSTALL_TARGET_LINUX_PAM_CONFS
+	$(INSTALL) -D -m 0644 $(@D)/newrole/newrole-lspp.pamd $(TARGET_DIR)/etc/pam.d/newrole
+	$(INSTALL) -D -m 0644 $(@D)/run_init/run_init.pamd $(TARGET_DIR)/etc/pam.d/run_init
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+	POLICYCOREUTILS_DEPENDENCIES += audit
+	POLICYCOREUTILS_MAKE_OPTS += AUDIT_LOG_PRIV=y
+endif
+
+# Enable LSPP_PRIV if both audit and linux pam are enabled
+ifeq ($(BR2_PACKAGE_LINUX_PAM)$(BR2_PACKAGE_AUDIT),yy)
+	POLICYCOREUTILS_MAKE_OPTS += LSPP_PRIV=y
+endif
+
+# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
+# large file support.
+# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
+POLICYCOREUTILS_MAKE_OPTS = \
+	$(TARGET_CONFIGURE_OPTS) \
+	CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
+	LDFLAGS="$(TARGET_LDFLAGS) $(if $(BR2_NEEDS_GETTEXT),-lintl)"
+
+POLICYCOREUTILS_MAKE_DIRS = load_policy newrole run_init \
+	secon semodule semodule_deps semodule_expand semodule_link \
+	semodule_package sepolgen-ifgen sestatus setfiles setsebool
+
+ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND),y)
+POLICYCOREUTILS_DEPENDENCIES += dbus-glib
+POLICYCOREUTILS_MAKE_DIRS += restorecond
+endif
+
+define POLICYCOREUTILS_BUILD_CMDS
+	for dir in $(POLICYCOREUTILS_MAKE_DIRS) ; do \
+		$(MAKE) -C $(@D)/$${dir} $(POLICYCOREUTILS_MAKE_OPTS) DESTDIR=$(STAGING_DIR) all || exit 1 ; \
+	done
+endef
+
+define POLICYCOREUTILS_INSTALL_TARGET_CMDS
+	for dir in $(POLICYCOREUTILS_MAKE_DIRS) ; do \
+		$(MAKE) -C $(@D)/$${dir} $(POLICYCOREUTILS_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install || exit 1 ; \
+	done
+endef
+
+HOST_POLICYCOREUTILS_DEPENDENCIES = host-libsemanage host-dbus-glib host-sepolgen host-setools
+
+# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
+# large file support.
+# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
+HOST_POLICYCOREUTILS_MAKE_OPTS = \
+	$(HOST_CONFIGURE_OPTS) \
+	CFLAGS+="-U_FILE_OFFSET_BITS" \
+	PYTHON="$(HOST_DIR)/usr/bin/python"
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+HOST_POLICYCOREUTILS_DEPENDENCIES += host-python3
+HOST_POLICYCOREUTILS_MAKE_OPTS += \
+	PYLIBVER="python$(PYTHON3_VERSION_MAJOR)" \
+	PYTHON_SRC="$(BUILD_DIR)/host-python$(PYTHON3_VERSION)"
+else
+HOST_POLICYCOREUTILS_DEPENDENCIES += host-python
+HOST_POLICYCOREUTILS_MAKE_OPTS += \
+	PYLIBVER="python$(PYTHON_VERSION_MAJOR)" \
+	PYTHON_SRC="$(BUILD_DIR)/host-python$(PYTHON_VERSION)"
+endif
+
+# Note: We are only building the programs required by the refpolicy build
+HOST_POLICYCOREUTILS_MAKE_DIRS = load_policy semodule semodule_deps semodule_expand semodule_link \
+	semodule_package setfiles restorecond audit2allow audit2why scripts semanage sepolicy
+
+define HOST_POLICYCOREUTILS_BUILD_CMDS
+	for dir in $(HOST_POLICYCOREUTILS_MAKE_DIRS) ; do \
+		$(MAKE) -C $(@D)/$${dir} $(HOST_POLICYCOREUTILS_MAKE_OPTS) DESTDIR=$(HOST_DIR) all || exit 1 ; \
+	done
+endef
+
+define HOST_POLICYCOREUTILS_INSTALL_CMDS
+	for dir in $(HOST_POLICYCOREUTILS_MAKE_DIRS) ; do \
+		$(MAKE) -C $(@D)/$${dir} $(HOST_POLICYCOREUTILS_MAKE_OPTS) DESTDIR=$(HOST_DIR) install || exit 1 ; \
+	done
+	# Fix python paths
+	$(SED) 's~/usr/bin/~$(HOST_DIR)/usr/bin/~g' $(HOST_DIR)/usr/bin/audit2allow
+	$(SED) 's~/usr/bin/~$(HOST_DIR)/usr/bin/~g' $(HOST_DIR)/usr/bin/audit2why
+	$(SED) 's~/usr/bin/~$(HOST_DIR)/usr/bin/~g' $(HOST_DIR)/usr/bin/sepolgen-ifgen
+	$(SED) 's~/usr/bin/~$(HOST_DIR)/usr/bin/~g' $(HOST_DIR)/usr/bin/sepolicy
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.9.1
