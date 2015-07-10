From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Fri, 10 Jul 2015 18:27:47 -0500
Subject: [Buildroot] [PATCH v8 01/16] policycoreutils: new package
In-Reply-To: <1436570882-56442-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1436570882-56442-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <1436570882-56442-2-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

---
Changes v7 -> v8:
  - Cleaned up indentations in policycoreutils.mk (Suggested by
    Thomas P.)
  - Fixed sed separator (Suggested by Thomas P.)
  - Cleaned up cross compile patches and make options (Suggested by
    Thomas P.)
  - Changed dbus-glib dependency to a select and cleaned up the
    dependencies (Suggested by Thomas P.)

Changes v6 -> v7:
  - No changes

Changes v5 -> v6:
  - No changes

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
 ...IR-to-all-paths-that-use-an-absolute-path.patch | 258 +++++++++++++++++++++
 .../0002-Allow-CFLAGS-to-be-overwritten.patch      |  57 +++++
 ...licy-python-install-arguments-to-be-a-var.patch |  42 ++++
 package/policycoreutils/Config.in                  |  59 +++++
 package/policycoreutils/policycoreutils.hash       |   2 +
 package/policycoreutils/policycoreutils.mk         | 107 +++++++++
 7 files changed, 526 insertions(+)
 create mode 100644 package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
 create mode 100644 package/policycoreutils/0002-Allow-CFLAGS-to-be-overwritten.patch
 create mode 100644 package/policycoreutils/0003-Change-sepolicy-python-install-arguments-to-be-a-var.patch
 create mode 100644 package/policycoreutils/Config.in
 create mode 100644 package/policycoreutils/policycoreutils.hash
 create mode 100644 package/policycoreutils/policycoreutils.mk

diff --git a/package/Config.in b/package/Config.in
index d9b0794..8aea808 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1351,6 +1351,7 @@ menu "Real-Time"
 endmenu
 
 menu "Security"
+	source "package/policycoreutils/Config.in"
 	source "package/setools/Config.in"
 endmenu
 
diff --git a/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
new file mode 100644
index 0000000..016980f
--- /dev/null
+++ b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
@@ -0,0 +1,258 @@
+From a8eea90050551e42d4dc81867853f351282f9f90 Mon Sep 17 00:00:00 2001
+From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+Date: Fri, 10 Jul 2015 11:44:08 -0500
+Subject: [PATCH 1/3] Add DESTDIR to all paths that use an absolute path
+
+To aid in cross compiling, add the DESTDIR variable to the start of all
+of the paths used during compilation. Most paths already used DESTDIR.
+
+Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+---
+ Makefile                |  4 ++--
+ audit2allow/Makefile    |  2 +-
+ load_policy/Makefile    |  2 +-
+ mcstrans/src/Makefile   | 11 +++++++----
+ mcstrans/utils/Makefile |  9 ++++++---
+ newrole/Makefile        | 12 ++++++------
+ restorecond/Makefile    |  6 ++++--
+ run_init/Makefile       | 12 ++++++------
+ sepolicy/Makefile       |  2 +-
+ setfiles/Makefile       |  4 ++--
+ 10 files changed, 36 insertions(+), 28 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 3980799..0fca022 100644
+--- a/Makefile
++++ b/Makefile
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
+diff --git a/audit2allow/Makefile b/audit2allow/Makefile
+index 88635d4..933e520 100644
+--- a/audit2allow/Makefile
++++ b/audit2allow/Makefile
+@@ -3,7 +3,7 @@ PREFIX ?= $(DESTDIR)/usr
+ BINDIR ?= $(PREFIX)/bin
+ LIBDIR ?= $(PREFIX)/lib
+ MANDIR ?= $(PREFIX)/share/man
+-LOCALEDIR ?= /usr/share/locale
++LOCALEDIR ?= $(DESTDIR)/usr/share/locale
+ 
+ all: ;
+ 
+diff --git a/load_policy/Makefile b/load_policy/Makefile
+index 7c5bab0..4129d8f 100644
+--- a/load_policy/Makefile
++++ b/load_policy/Makefile
+@@ -3,7 +3,7 @@ PREFIX ?= $(DESTDIR)/usr
+ SBINDIR ?= $(DESTDIR)/sbin
+ USRSBINDIR ?= $(PREFIX)/sbin
+ MANDIR ?= $(PREFIX)/share/man
+-LOCALEDIR ?= /usr/share/locale
++LOCALEDIR ?= $(DESTDIR)/usr/share/locale
+ 
+ CFLAGS ?= -Werror -Wall -W
+ override CFLAGS += $(LDFLAGS) -I$(PREFIX)/include -DUSE_NLS -DLOCALEDIR="\"$(LOCALEDIR)\"" -DPACKAGE="\"policycoreutils\""
+diff --git a/mcstrans/src/Makefile b/mcstrans/src/Makefile
+index fb44490..1982b43 100644
+--- a/mcstrans/src/Makefile
++++ b/mcstrans/src/Makefile
+@@ -1,15 +1,18 @@
+ ARCH = $(shell uname -i)
+ ifeq "$(ARCH)" "x86_64"
+ 	# In case of 64 bit system, use these lines
+-	LIBDIR=/usr/lib64
+-else 
++	LIBDIR=$(DESTDIR)/usr/lib64
++else
+ ifeq "$(ARCH)" "i686"
+ 	# In case of 32 bit system, use these lines
+-	LIBDIR=/usr/lib
++	LIBDIR=$(DESTDIR)/usr/lib
+ else
+ ifeq "$(ARCH)" "i386"
+ 	# In case of 32 bit system, use these lines
+-	LIBDIR=/usr/lib
++	LIBDIR=$(DESTDIR)/usr/lib
++else
++	# Default to these lines if arch is unknown
++	LIBDIR=$(DESTDIR)/usr/lib
+ endif
+ endif
+ endif
+diff --git a/mcstrans/utils/Makefile b/mcstrans/utils/Makefile
+index 1ffb027..dcdc68b 100644
+--- a/mcstrans/utils/Makefile
++++ b/mcstrans/utils/Makefile
+@@ -5,15 +5,18 @@ BINDIR ?= $(PREFIX)/sbin
+ ARCH = $(shell uname -i)
+ ifeq "$(ARCH)" "x86_64"
+         # In case of 64 bit system, use these lines
+-        LIBDIR=/usr/lib64
++        LIBDIR=$(DESTDIR)/usr/lib64
+ else
+ ifeq "$(ARCH)" "i686"
+         # In case of 32 bit system, use these lines
+-        LIBDIR=/usr/lib
++        LIBDIR=$(DESTDIR)/usr/lib
+ else
+ ifeq "$(ARCH)" "i386"
+         # In case of 32 bit system, use these lines
+-        LIBDIR=/usr/lib
++        LIBDIR=$(DESTDIR)/usr/lib
++else
++        # Default to these lines if arch is unknown
++        LIBDIR=$(DESTDIR)/usr/lib
+ endif
+ endif
+ endif
+diff --git a/newrole/Makefile b/newrole/Makefile
+index 646cd4d..a876ff3 100644
+--- a/newrole/Makefile
++++ b/newrole/Makefile
+@@ -3,9 +3,9 @@ PREFIX ?= $(DESTDIR)/usr
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
+@@ -24,7 +24,7 @@ CFLAGS ?= -Werror -Wall -W
+ EXTRA_OBJS =
+ override CFLAGS += -DVERSION=\"$(VERSION)\" $(LDFLAGS) -I$(PREFIX)/include -DUSE_NLS -DLOCALEDIR="\"$(LOCALEDIR)\"" -DPACKAGE="\"policycoreutils\""
+ LDLIBS += -lselinux -L$(PREFIX)/lib
+-ifeq ($(PAMH), /usr/include/security/pam_appl.h)
++ifeq ($(PAMH), $(DESTDIR)/usr/include/security/pam_appl.h)
+ 	override CFLAGS += -DUSE_PAM
+ 	EXTRA_OBJS += hashtab.o
+ 	LDLIBS += -lpam -lpam_misc
+@@ -32,7 +32,7 @@ else
+ 	override CFLAGS += -D_XOPEN_SOURCE=500
+ 	LDLIBS += -lcrypt
+ endif
+-ifeq ($(AUDITH), /usr/include/libaudit.h)
++ifeq ($(AUDITH), $(DESTDIR)/usr/include/libaudit.h)
+ 	override CFLAGS += -DUSE_AUDIT
+ 	LDLIBS += -laudit
+ endif
+@@ -66,7 +66,7 @@ install: all
+ 	test -d $(MANDIR)/man1 || install -m 755 -d $(MANDIR)/man1
+ 	install -m $(MODE) newrole $(BINDIR)
+ 	install -m 644 newrole.1 $(MANDIR)/man1/
+-ifeq ($(PAMH), /usr/include/security/pam_appl.h)
++ifeq ($(PAMH), $(DESTDIR)/usr/include/security/pam_appl.h)
+ 	test -d $(ETCDIR)/pam.d || install -m 755 -d $(ETCDIR)/pam.d
+ ifeq ($(LSPP_PRIV),y)
+ 	install -m 644 newrole-lspp.pamd $(ETCDIR)/pam.d/newrole
+diff --git a/restorecond/Makefile b/restorecond/Makefile
+index 3074542..7c40f95 100644
+--- a/restorecond/Makefile
++++ b/restorecond/Makefile
+@@ -10,11 +10,13 @@ autostart_DATA = sealertauto.desktop
+ INITDIR = $(DESTDIR)/etc/rc.d/init.d
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
+diff --git a/run_init/Makefile b/run_init/Makefile
+index 12b39b4..3c6f58a 100644
+--- a/run_init/Makefile
++++ b/run_init/Makefile
+@@ -4,21 +4,21 @@ PREFIX ?= $(DESTDIR)/usr
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
+@@ -38,7 +38,7 @@ install: all
+ 	install -m 755 open_init_pty $(SBINDIR)
+ 	install -m 644 run_init.8 $(MANDIR)/man8/
+ 	install -m 644 open_init_pty.8 $(MANDIR)/man8/
+-ifeq ($(PAMH), /usr/include/security/pam_appl.h)
++ifeq ($(PAMH), $(DESTDIR)/usr/include/security/pam_appl.h)
+ 	install -m 644 run_init.pamd $(ETCDIR)/pam.d/run_init
+ endif
+ 
+diff --git a/sepolicy/Makefile b/sepolicy/Makefile
+index 11b534f..1074d26 100644
+--- a/sepolicy/Makefile
++++ b/sepolicy/Makefile
+@@ -5,7 +5,7 @@ LIBDIR ?= $(PREFIX)/lib
+ BINDIR ?= $(PREFIX)/bin
+ SBINDIR ?= $(PREFIX)/sbin
+ MANDIR ?= $(PREFIX)/share/man
+-LOCALEDIR ?= /usr/share/locale
++LOCALEDIR ?= $(DESTDIR)/usr/share/locale
+ PYTHON ?= /usr/bin/python
+ BASHCOMPLETIONDIR ?= $(DESTDIR)/etc/bash_completion.d/
+ SHAREDIR ?= $(PREFIX)/share/sandbox
+diff --git a/setfiles/Makefile b/setfiles/Makefile
+index 4b44b3c..dc04d9a 100644
+--- a/setfiles/Makefile
++++ b/setfiles/Makefile
+@@ -3,7 +3,7 @@ PREFIX ?= $(DESTDIR)/usr
+ SBINDIR ?= $(DESTDIR)/sbin
+ MANDIR = $(PREFIX)/share/man
+ LIBDIR ?= $(PREFIX)/lib
+-AUDITH = $(shell ls /usr/include/libaudit.h 2>/dev/null)
++AUDITH = $(shell ls $(DESTDIR)/usr/include/libaudit.h 2>/dev/null)
+ 
+ PROGRESS_STEP=$(shell grep "^\#define STAR_COUNT" restore.h | awk -S '{ print $$3 }')
+ ABORT_ON_ERRORS=$(shell grep "^\#define ABORT_ON_ERRORS" setfiles.c | awk -S '{ print $$3 }')
+@@ -12,7 +12,7 @@ CFLAGS = -g -Werror -Wall -W
+ override CFLAGS += -I$(PREFIX)/include
+ LDLIBS = -lselinux -lsepol -L$(LIBDIR)
+ 
+-ifeq ($(AUDITH), /usr/include/libaudit.h)
++ifeq ($(AUDITH), $(DESTDIR)/usr/include/libaudit.h)
+ 	override CFLAGS += -DUSE_AUDIT
+ 	LDLIBS += -laudit
+ endif
+-- 
+1.9.1
+
diff --git a/package/policycoreutils/0002-Allow-CFLAGS-to-be-overwritten.patch b/package/policycoreutils/0002-Allow-CFLAGS-to-be-overwritten.patch
new file mode 100644
index 0000000..54aecae
--- /dev/null
+++ b/package/policycoreutils/0002-Allow-CFLAGS-to-be-overwritten.patch
@@ -0,0 +1,57 @@
+From 656740d38ad34cbd5a89e900dab82ec521d0a522 Mon Sep 17 00:00:00 2001
+From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+Date: Fri, 10 Jul 2015 11:47:09 -0500
+Subject: [PATCH 2/3] Allow CFLAGS to be overwritten
+
+Allow all CFLAGS declarations to be overwritten to aid in cross
+compiling.
+
+Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+---
+ sepolicy/Makefile | 2 +-
+ sestatus/Makefile | 2 +-
+ setfiles/Makefile | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/sepolicy/Makefile b/sepolicy/Makefile
+index 1074d26..9d44ac2 100644
+--- a/sepolicy/Makefile
++++ b/sepolicy/Makefile
+@@ -9,7 +9,7 @@ LOCALEDIR ?= $(DESTDIR)/usr/share/locale
+ PYTHON ?= /usr/bin/python
+ BASHCOMPLETIONDIR ?= $(DESTDIR)/etc/bash_completion.d/
+ SHAREDIR ?= $(PREFIX)/share/sandbox
+-override CFLAGS = $(LDFLAGS) -I$(PREFIX)/include -DPACKAGE="policycoreutils" -Wall -Werror -Wextra -W  -DSHARED -shared
++override CFLAGS += $(LDFLAGS) -I$(PREFIX)/include -DPACKAGE="policycoreutils" -Wall -Werror -Wextra -W  -DSHARED -shared
+ 
+ BASHCOMPLETIONS=sepolicy-bash-completion.sh 
+ 
+diff --git a/sestatus/Makefile b/sestatus/Makefile
+index c5db7a3..c04ff00 100644
+--- a/sestatus/Makefile
++++ b/sestatus/Makefile
+@@ -5,7 +5,7 @@ MANDIR = $(PREFIX)/share/man
+ ETCDIR ?= $(DESTDIR)/etc
+ LIBDIR ?= $(PREFIX)/lib
+ 
+-CFLAGS = -Werror -Wall -W
++CFLAGS ?= -Werror -Wall -W
+ override CFLAGS += -I$(PREFIX)/include -D_FILE_OFFSET_BITS=64
+ LDLIBS = -lselinux -L$(LIBDIR)
+ 
+diff --git a/setfiles/Makefile b/setfiles/Makefile
+index dc04d9a..67d9ef0 100644
+--- a/setfiles/Makefile
++++ b/setfiles/Makefile
+@@ -8,7 +8,7 @@ AUDITH = $(shell ls $(DESTDIR)/usr/include/libaudit.h 2>/dev/null)
+ PROGRESS_STEP=$(shell grep "^\#define STAR_COUNT" restore.h | awk -S '{ print $$3 }')
+ ABORT_ON_ERRORS=$(shell grep "^\#define ABORT_ON_ERRORS" setfiles.c | awk -S '{ print $$3 }')
+ 
+-CFLAGS = -g -Werror -Wall -W
++CFLAGS ?= -g -Werror -Wall -W
+ override CFLAGS += -I$(PREFIX)/include
+ LDLIBS = -lselinux -lsepol -L$(LIBDIR)
+ 
+-- 
+1.9.1
+
diff --git a/package/policycoreutils/0003-Change-sepolicy-python-install-arguments-to-be-a-var.patch b/package/policycoreutils/0003-Change-sepolicy-python-install-arguments-to-be-a-var.patch
new file mode 100644
index 0000000..4e35d92
--- /dev/null
+++ b/package/policycoreutils/0003-Change-sepolicy-python-install-arguments-to-be-a-var.patch
@@ -0,0 +1,42 @@
+From c8f1022be057cfe28101fbd0d6dedf6f42477ffc Mon Sep 17 00:00:00 2001
+From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+Date: Fri, 10 Jul 2015 11:56:49 -0500
+Subject: [PATCH 3/3] Change sepolicy python install arguments to be a variable
+
+To allow the python install arguments to be overwritten, change the
+arguments to be a variable. This also cleans up the DESTDIR detection a
+little bit.
+
+Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+---
+ sepolicy/Makefile | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/sepolicy/Makefile b/sepolicy/Makefile
+index 9d44ac2..bd8a383 100644
+--- a/sepolicy/Makefile
++++ b/sepolicy/Makefile
+@@ -7,6 +7,11 @@ SBINDIR ?= $(PREFIX)/sbin
+ MANDIR ?= $(PREFIX)/share/man
+ LOCALEDIR ?= $(DESTDIR)/usr/share/locale
+ PYTHON ?= /usr/bin/python
++ifneq (,$(DESTDIR))
++PYTHON_INSTALL_ARGS ?= --root $(DESTDIR)
++else
++PYTHON_INSTALL_ARGS ?=
++endif
+ BASHCOMPLETIONDIR ?= $(DESTDIR)/etc/bash_completion.d/
+ SHAREDIR ?= $(PREFIX)/share/sandbox
+ override CFLAGS += $(LDFLAGS) -I$(PREFIX)/include -DPACKAGE="policycoreutils" -Wall -Werror -Wextra -W  -DSHARED -shared
+@@ -23,7 +28,7 @@ clean:
+ 	-rm -rf build *~ \#* *pyc .#*
+ 
+ install:
+-	$(PYTHON) setup.py install `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
++	$(PYTHON) setup.py install $(PYTHON_INSTALL_ARGS)
+ 	[ -d $(BINDIR) ] || mkdir -p $(BINDIR)
+ 	install -m 755 sepolicy.py $(BINDIR)/sepolicy
+ 	-mkdir -p $(MANDIR)/man8
+-- 
+1.9.1
+
diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
new file mode 100644
index 0000000..1dc01c4
--- /dev/null
+++ b/package/policycoreutils/Config.in
@@ -0,0 +1,59 @@
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
+comment "policycoreutils needs a glibc or musl toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS  \
+		|| !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+
+if BR2_PACKAGE_POLICYCOREUTILS
+
+config BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND
+	bool "restorecond Utility"
+	select BR2_PACKAGE_DBUS_GLIB
+	depends on BR2_PACKAGE_DBUS
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	help
+	  Enable restorecond to be built
+
+comment "restorecond needs a toolchain w/ wchar, threads, dbus"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_DBUS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
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
index 0000000..2b954b9
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
+POLICYCOREUTILS_DEPENDENCIES += linux-pam
+POLICYCOREUTILS_MAKE_OPTS += NAMESPACE_PRIV=y
+define POLICYCOREUTILS_INSTALL_TARGET_LINUX_PAM_CONFS
+	$(INSTALL) -D -m 0644 $(@D)/newrole/newrole-lspp.pamd $(TARGET_DIR)/etc/pam.d/newrole
+	$(INSTALL) -D -m 0644 $(@D)/run_init/run_init.pamd $(TARGET_DIR)/etc/pam.d/run_init
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+POLICYCOREUTILS_DEPENDENCIES += audit
+POLICYCOREUTILS_MAKE_OPTS += AUDIT_LOG_PRIV=y
+endif
+
+# Enable LSPP_PRIV if both audit and linux pam are enabled
+ifeq ($(BR2_PACKAGE_LINUX_PAM)$(BR2_PACKAGE_AUDIT),yy)
+POLICYCOREUTILS_MAKE_OPTS += LSPP_PRIV=y
+endif
+
+# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
+# large file support.
+# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
+POLICYCOREUTILS_MAKE_OPTS = \
+	CC="$(TARGET_CC)" \
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
+	CC="$(HOSTCC)" \
+	CFLAGS="$(HOST_CFLAGS) -U_FILE_OFFSET_BITS" \
+	PYTHON="$(HOST_DIR)/usr/bin/python" \
+	PYTHON_INSTALL_ARGS="$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)"
+
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+HOST_POLICYCOREUTILS_DEPENDENCIES += host-python3
+HOST_POLICYCOREUTILS_MAKE_OPTS += \
+	PYLIBVER="python$(PYTHON3_VERSION_MAJOR)"
+else
+HOST_POLICYCOREUTILS_DEPENDENCIES += host-python
+HOST_POLICYCOREUTILS_MAKE_OPTS += \
+	PYLIBVER="python$(PYTHON_VERSION_MAJOR)"
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
+	$(SED) 's%/usr/bin/%$(HOST_DIR)/usr/bin/%g' $(HOST_DIR)/usr/bin/audit2allow
+	$(SED) 's%/usr/bin/%$(HOST_DIR)/usr/bin/%g' $(HOST_DIR)/usr/bin/audit2why
+	$(SED) 's%/usr/bin/%$(HOST_DIR)/usr/bin/%g' $(HOST_DIR)/usr/bin/sepolgen-ifgen
+	$(SED) 's%/usr/bin/%$(HOST_DIR)/usr/bin/%g' $(HOST_DIR)/usr/bin/sepolicy
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.9.1
