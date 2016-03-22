From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 23:02:40 +0100
Subject: [Buildroot] [ PATCH Selinux v11] policycoreutils: new package
In-Reply-To: <1458128534-14714-1-git-send-email-niranjan.reddy@rockwellcollins.com>
References: <1458128534-14714-1-git-send-email-niranjan.reddy@rockwellcollins.com>
Message-ID: <20160322230240.1a75e145@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I really wanted to apply this patch and finally get the remaining
SELinux support in, but there are still some really wrong things in
there.

On Wed, 16 Mar 2016 17:12:14 +0530, Niranjan Reddy wrote:
> From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> 
> This package contains the core policy utilities that are required
> for basic operation of an SELinux system.Four patchs are included
> in this package.

Minor typos: space after ".", patchs -> patches.

> Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
> Allow-CFLAGS-to-be-overwritten.patch
> Change-sepolicy-python-install-arguments-to-be-a-var.patch
> disable-dbus.patch

Completely useless to just give the filenames, especially when they are
wrong.


> diff --git a/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
> new file mode 100644
> index 0000000..0192e5c
> --- /dev/null
> +++ b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
> @@ -0,0 +1,275 @@
> +From 92d7cc3539f8bfc68b2f2bf688375647abf73ee7 Mon Sep 17 00:00:00 2001
> +From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> +Date: Fri, 10 Jul 2015 11:44:08 -0500
> +Subject: Add DESTDIR to all paths that use an absolute path
> +
> +To aid in cross compiling, add the DESTDIR variable to the start of all
> +of the paths used during compilation. Most paths already used DESTDIR.
> +
> +Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

This patch does a *LOT* more than adding DESTDIR. Just check by
yourself. Read your own patch! It should be split in several patches.

> +---
> + Makefile                |  4 ++--
> + audit2allow/Makefile    |  2 +-
> + load_policy/Makefile    |  2 +-
> + mcstrans/src/Makefile   | 22 +++++++++++++---------
> + mcstrans/utils/Makefile | 11 +++++++----
> + newrole/Makefile        | 12 ++++++------
> + restorecond/Makefile    |  6 ++++--
> + run_init/Makefile       | 12 ++++++------
> + sepolicy/Makefile       |  2 +-
> + setfiles/Makefile       |  4 ++--
> + 10 files changed, 43 insertions(+), 34 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 3980799..0fca022 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -1,8 +1,8 @@
> + SUBDIRS = sepolicy setfiles semanage load_policy newrole run_init sandbox secon audit2allow audit2why sestatus semodule_package semodule semodule_link semodule_expand semodule_deps sepolgen-ifgen setsebool scripts po man gui
> + 
> +-INOTIFYH = $(shell ls /usr/include/sys/inotify.h 2>/dev/null)
> ++INOTIFYH = $(shell ls $(DESTDIR)/usr/include/sys/inotify.h 2>/dev/null)

This is not super great, as it assumes DESTDIR is passed at build time,
which is not very standard. But OK, that's the easiest solution. But it
should *definitely* be explained in the description of the patch, as
it's non trivial.

> + 
> +-ifeq (${INOTIFYH}, /usr/include/sys/inotify.h)
> ++ifeq (${INOTIFYH}, $(DESTDIR)/usr/include/sys/inotify.h)
> + 	SUBDIRS += restorecond
> + endif
> + 
> +diff --git a/audit2allow/Makefile b/audit2allow/Makefile
> +index 88635d4..1647b5a 100644
> +--- a/audit2allow/Makefile
> ++++ b/audit2allow/Makefile
> +@@ -3,7 +3,7 @@ PREFIX ?= $(DESTDIR)/usr
> + BINDIR ?= $(PREFIX)/bin
> + LIBDIR ?= $(PREFIX)/lib
> + MANDIR ?= $(PREFIX)/share/man
> +-LOCALEDIR ?= /usr/share/locale
> ++LOCALEDIR ?= $(PREFIX)/share/locale

This is not about adding DESTDIR, but about changing an hardcoded /usr
to $(PREFIX).

In addition, in the INOTIFYH fix above, you don't change usr/ to
$(PREFIX).

> + 
> + all: ;
> + 
> +diff --git a/load_policy/Makefile b/load_policy/Makefile
> +index 7c5bab0..5cd0bbb 100644
> +--- a/load_policy/Makefile
> ++++ b/load_policy/Makefile
> +@@ -3,7 +3,7 @@ PREFIX ?= $(DESTDIR)/usr
> + SBINDIR ?= $(DESTDIR)/sbin
> + USRSBINDIR ?= $(PREFIX)/sbin
> + MANDIR ?= $(PREFIX)/share/man
> +-LOCALEDIR ?= /usr/share/locale
> ++LOCALEDIR ?= $(PREFIX)/share/locale

This is also changing /usr to PREFIX, which has nothing to do with
using DESTDIR.

> + 
> + CFLAGS ?= -Werror -Wall -W
> + override CFLAGS += $(LDFLAGS) -I$(PREFIX)/include -DUSE_NLS -DLOCALEDIR="\"$(LOCALEDIR)\"" -DPACKAGE="\"policycoreutils\""
> +diff --git a/mcstrans/src/Makefile b/mcstrans/src/Makefile
> +index fb44490..a0666f1 100644
> +--- a/mcstrans/src/Makefile
> ++++ b/mcstrans/src/Makefile
> +@@ -1,22 +1,26 @@
> +-ARCH = $(shell uname -i)
> ++# Installation directories.
> ++PREFIX  ?= $(DESTDIR)/usr
> ++SBINDIR ?= $(DESTDIR)/sbin
> ++INITDIR ?= $(DESTDIR)/etc/rc.d/init.d

This has nothing to do with adding DESTDIR, and there is no explanation
why adding those variable definitions here is necessary. Thos
definitions are normally below, why are you moving there up here?

> ++
> ++ARCH ?= $(shell uname -i)

Looks good, but needs to be explained in the patch description (and in
a separate patch).

> + ifeq "$(ARCH)" "x86_64"
> + 	# In case of 64 bit system, use these lines
> +-	LIBDIR=/usr/lib64
> +-else 
> ++	LIBDIR=$(PREFIX)/lib64
> ++else
> + ifeq "$(ARCH)" "i686"
> + 	# In case of 32 bit system, use these lines
> +-	LIBDIR=/usr/lib
> ++	LIBDIR=$(PREFIX)/lib
> + else
> + ifeq "$(ARCH)" "i386"
> + 	# In case of 32 bit system, use these lines
> +-	LIBDIR=/usr/lib
> ++	LIBDIR=$(PREFIX)/lib
> ++else
> ++	# Default to these lines if arch is unknown
> ++	LIBDIR=$(PREFIX)/lib

This is all /usr -> $(PREFIX) replacement, nothing to do with DESTDIR.

> + endif
> + endif
> + endif
> +-# Installation directories.
> +-PREFIX  ?= $(DESTDIR)/usr
> +-SBINDIR ?= $(DESTDIR)/sbin
> +-INITDIR ?= $(DESTDIR)/etc/rc.d/init.d
> + 
> + PROG_SRC=mcstrans.c  mcscolor.c  mcstransd.c  mls_level.c
> + PROG_OBJS= $(patsubst %.c,%.o,$(PROG_SRC))
> +diff --git a/mcstrans/utils/Makefile b/mcstrans/utils/Makefile
> +index 1ffb027..da5c152 100644
> +--- a/mcstrans/utils/Makefile
> ++++ b/mcstrans/utils/Makefile
> +@@ -2,18 +2,21 @@
> + PREFIX ?= $(DESTDIR)/usr
> + BINDIR ?= $(PREFIX)/sbin
> + 
> +-ARCH = $(shell uname -i)
> ++ARCH ?= $(shell uname -i)
> + ifeq "$(ARCH)" "x86_64"
> +         # In case of 64 bit system, use these lines
> +-        LIBDIR=/usr/lib64
> ++        LIBDIR=$(PREFIX)/lib64
> + else
> + ifeq "$(ARCH)" "i686"
> +         # In case of 32 bit system, use these lines
> +-        LIBDIR=/usr/lib
> ++        LIBDIR=$(PREFIX)/lib
> + else
> + ifeq "$(ARCH)" "i386"
> +         # In case of 32 bit system, use these lines
> +-        LIBDIR=/usr/lib
> ++        LIBDIR=$(PREFIX)/lib
> ++else
> ++        # Default to these lines if arch is unknown
> ++        LIBDIR=$(PREFIX)/lib

Same comments as above;

> + endif
> + endif
> + endif
> +diff --git a/newrole/Makefile b/newrole/Makefile
> +index 646cd4d..045e3b7 100644
> +--- a/newrole/Makefile
> ++++ b/newrole/Makefile
> +@@ -3,9 +3,9 @@ PREFIX ?= $(DESTDIR)/usr
> + BINDIR ?= $(PREFIX)/bin
> + MANDIR ?= $(PREFIX)/share/man
> + ETCDIR ?= $(DESTDIR)/etc
> +-LOCALEDIR = /usr/share/locale
> +-PAMH = $(shell ls /usr/include/security/pam_appl.h 2>/dev/null)
> +-AUDITH = $(shell ls /usr/include/libaudit.h 2>/dev/null)
> ++LOCALEDIR = $(PREFIX)/share/locale
> ++PAMH = $(shell ls $(PREFIX)/include/security/pam_appl.h 2>/dev/null)
> ++AUDITH = $(shell ls $(PREFIX)/include/libaudit.h 2>/dev/null)

This is *completely* wrong. It will look at /usr/include/libaudit.h
and /usr/include/security/pam_appl.h on your build machine to decide
where pam and audit support is available. If you follow the fix done
earlier for INOTIFYH, you should do:

AUDITH = $(shell ls $(DESTDIR)/usr/include/libaudit.h 2>/dev/null)

> + # Enable capabilities to permit newrole to generate audit records.
> + # This will make newrole a setuid root program.
> + # The capabilities used are: CAP_AUDIT_WRITE.
> +@@ -24,7 +24,7 @@ CFLAGS ?= -Werror -Wall -W
> + EXTRA_OBJS =
> + override CFLAGS += -DVERSION=\"$(VERSION)\" $(LDFLAGS) -I$(PREFIX)/include -DUSE_NLS -DLOCALEDIR="\"$(LOCALEDIR)\"" -DPACKAGE="\"policycoreutils\""
> + LDLIBS += -lselinux -L$(PREFIX)/lib
> +-ifeq ($(PAMH), /usr/include/security/pam_appl.h)
> ++ifeq ($(PAMH), $(PREFIX)/include/security/pam_appl.h)

Same comment as above.

> + 	override CFLAGS += -DUSE_PAM
> + 	EXTRA_OBJS += hashtab.o
> + 	LDLIBS += -lpam -lpam_misc
> +@@ -32,7 +32,7 @@ else
> + 	override CFLAGS += -D_XOPEN_SOURCE=500
> + 	LDLIBS += -lcrypt
> + endif
> +-ifeq ($(AUDITH), /usr/include/libaudit.h)
> ++ifeq ($(AUDITH), $(PREFIX)/include/libaudit.h)

Ditto.

> + 	override CFLAGS += -DUSE_AUDIT
> + 	LDLIBS += -laudit
> + endif
> +@@ -66,7 +66,7 @@ install: all
> + 	test -d $(MANDIR)/man1 || install -m 755 -d $(MANDIR)/man1
> + 	install -m $(MODE) newrole $(BINDIR)
> + 	install -m 644 newrole.1 $(MANDIR)/man1/
> +-ifeq ($(PAMH), /usr/include/security/pam_appl.h)
> ++ifeq ($(PAMH), $(PREFIX)/include/security/pam_appl.h)

Ditto.

> + 	test -d $(ETCDIR)/pam.d || install -m 755 -d $(ETCDIR)/pam.d
> + ifeq ($(LSPP_PRIV),y)
> + 	install -m 644 newrole-lspp.pamd $(ETCDIR)/pam.d/newrole
> +diff --git a/restorecond/Makefile b/restorecond/Makefile
> +index 3074542..7c40f95 100644
> +--- a/restorecond/Makefile
> ++++ b/restorecond/Makefile
> +@@ -10,11 +10,13 @@ autostart_DATA = sealertauto.desktop
> + INITDIR = $(DESTDIR)/etc/rc.d/init.d
> + SELINUXDIR = $(DESTDIR)/etc/selinux
> + 
> +-DBUSFLAGS = -DHAVE_DBUS -I/usr/include/dbus-1.0 -I/usr/lib64/dbus-1.0/include -I/usr/lib/dbus-1.0/include
> ++DBUSFLAGS = -DHAVE_DBUS -I$(PREFIX)/include/dbus-1.0 -I$(PREFIX)/lib64/dbus-1.0/include \
> ++		-I$(PREFIX)/lib/dbus-1.0/include

Completely wrong. This will add -I/usr/include/dbus-1.0 when
cross-compiling. Bad.

> + DBUSLIB = -ldbus-glib-1 -ldbus-1
> + 
> + CFLAGS ?= -g -Werror -Wall -W
> +-override CFLAGS += -I$(PREFIX)/include $(DBUSFLAGS) -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/lib/glib-2.0/include
> ++override CFLAGS += -I$(PREFIX)/include $(DBUSFLAGS) -I$(PREFIX)/include/glib-2.0 \
> ++		-I$(PREFIX)/lib64/glib-2.0/include -I$(PREFIX)/lib/glib-2.0/include

Same.

> + 
> + LDLIBS += -lselinux $(DBUSLIB) -lglib-2.0 -L$(LIBDIR)
> + 
> +diff --git a/run_init/Makefile b/run_init/Makefile
> +index 12b39b4..da49c41 100644
> +--- a/run_init/Makefile
> ++++ b/run_init/Makefile
> +@@ -4,21 +4,21 @@ PREFIX ?= $(DESTDIR)/usr
> + SBINDIR ?= $(PREFIX)/sbin
> + MANDIR ?= $(PREFIX)/share/man
> + ETCDIR ?= $(DESTDIR)/etc
> +-LOCALEDIR ?= /usr/share/locale
> +-PAMH = $(shell ls /usr/include/security/pam_appl.h 2>/dev/null)
> +-AUDITH = $(shell ls /usr/include/libaudit.h 2>/dev/null)
> ++LOCALEDIR ?= $(PREFIX)/share/locale
> ++PAMH = $(shell ls $(PREFIX)/include/security/pam_appl.h 2>/dev/null)
> ++AUDITH = $(shell ls $(PREFIX)/include/libaudit.h 2>/dev/null)

Also wrong.

> + 
> + CFLAGS ?= -Werror -Wall -W
> + override CFLAGS += -I$(PREFIX)/include -DUSE_NLS -DLOCALEDIR="\"$(LOCALEDIR)\"" -DPACKAGE="\"policycoreutils\""
> + LDLIBS += -lselinux -L$(PREFIX)/lib
> +-ifeq ($(PAMH), /usr/include/security/pam_appl.h)
> ++ifeq ($(PAMH), $(PREFIX)/include/security/pam_appl.h)

Ditto.

> + 	override CFLAGS += -DUSE_PAM
> + 	LDLIBS += -lpam -lpam_misc
> + else
> + 	override CFLAGS += -D_XOPEN_SOURCE=500
> + 	LDLIBS += -lcrypt
> + endif
> +-ifeq ($(AUDITH), /usr/include/libaudit.h)
> ++ifeq ($(AUDITH), $(PREFIX)/include/libaudit.h)

Ditto.

> + 	override CFLAGS += -DUSE_AUDIT
> + 	LDLIBS += -laudit
> + endif
> +@@ -38,7 +38,7 @@ install: all
> + 	install -m 755 open_init_pty $(SBINDIR)
> + 	install -m 644 run_init.8 $(MANDIR)/man8/
> + 	install -m 644 open_init_pty.8 $(MANDIR)/man8/
> +-ifeq ($(PAMH), /usr/include/security/pam_appl.h)
> ++ifeq ($(PAMH), $(PREFIX)/include/security/pam_appl.h)

Ditto.

> + 	install -m 644 run_init.pamd $(ETCDIR)/pam.d/run_init
> + endif
> + 
> +diff --git a/sepolicy/Makefile b/sepolicy/Makefile
> +index 11b534f..1249546 100644
> +--- a/sepolicy/Makefile
> ++++ b/sepolicy/Makefile
> +@@ -5,7 +5,7 @@ LIBDIR ?= $(PREFIX)/lib
> + BINDIR ?= $(PREFIX)/bin
> + SBINDIR ?= $(PREFIX)/sbin
> + MANDIR ?= $(PREFIX)/share/man
> +-LOCALEDIR ?= /usr/share/locale
> ++LOCALEDIR ?= $(PREFIX)/share/locale
> + PYTHON ?= /usr/bin/python
> + BASHCOMPLETIONDIR ?= $(DESTDIR)/etc/bash_completion.d/
> + SHAREDIR ?= $(PREFIX)/share/sandbox
> +diff --git a/setfiles/Makefile b/setfiles/Makefile
> +index 4b44b3c..ebc22c8 100644
> +--- a/setfiles/Makefile
> ++++ b/setfiles/Makefile
> +@@ -3,7 +3,7 @@ PREFIX ?= $(DESTDIR)/usr
> + SBINDIR ?= $(DESTDIR)/sbin
> + MANDIR = $(PREFIX)/share/man
> + LIBDIR ?= $(PREFIX)/lib
> +-AUDITH = $(shell ls /usr/include/libaudit.h 2>/dev/null)
> ++AUDITH = $(shell ls $(PREFIX)/include/libaudit.h 2>/dev/null)

Still wrong.

> + 
> + PROGRESS_STEP=$(shell grep "^\#define STAR_COUNT" restore.h | awk -S '{ print $$3 }')
> + ABORT_ON_ERRORS=$(shell grep "^\#define ABORT_ON_ERRORS" setfiles.c | awk -S '{ print $$3 }')
> +@@ -12,7 +12,7 @@ CFLAGS = -g -Werror -Wall -W
> + override CFLAGS += -I$(PREFIX)/include
> + LDLIBS = -lselinux -lsepol -L$(LIBDIR)
> + 
> +-ifeq ($(AUDITH), /usr/include/libaudit.h)
> ++ifeq ($(AUDITH), $(PREFIX)/include/libaudit.h)

Here as well.

> + 	override CFLAGS += -DUSE_AUDIT
> + 	LDLIBS += -laudit
> + endif
> +-- 
> +1.9.1
> +
> diff --git a/package/policycoreutils/0002-Allow-CFLAGS-to-be-overwritten.patch b/package/policycoreutils/0002-Allow-CFLAGS-to-be-overwritten.patch
> new file mode 100644
> index 0000000..b6e6d99
> --- /dev/null
> +++ b/package/policycoreutils/0002-Allow-CFLAGS-to-be-overwritten.patch
> @@ -0,0 +1,57 @@
> +From cfce1180f96cca5e7444d94b2ebc39213d7dac75 Mon Sep 17 00:00:00 2001
> +From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> +Date: Fri, 10 Jul 2015 11:47:09 -0500
> +Subject: Allow CFLAGS to be overwritten
> +
> +Allow all CFLAGS declarations to be overwritten to aid in cross
> +compiling.
> +
> +Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> +---
> + sepolicy/Makefile | 2 +-
> + sestatus/Makefile | 2 +-
> + setfiles/Makefile | 2 +-
> + 3 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/sepolicy/Makefile b/sepolicy/Makefile
> +index 1249546..a52667a 100644
> +--- a/sepolicy/Makefile
> ++++ b/sepolicy/Makefile
> +@@ -9,7 +9,7 @@ LOCALEDIR ?= $(PREFIX)/share/locale
> + PYTHON ?= /usr/bin/python
> + BASHCOMPLETIONDIR ?= $(DESTDIR)/etc/bash_completion.d/
> + SHAREDIR ?= $(PREFIX)/share/sandbox
> +-override CFLAGS = $(LDFLAGS) -I$(PREFIX)/include -DPACKAGE="policycoreutils" -Wall -Werror -Wextra -W  -DSHARED -shared
> ++override CFLAGS += $(LDFLAGS) -I$(PREFIX)/include -DPACKAGE="policycoreutils" -Wall -Werror -Wextra -W  -DSHARED -shared

-I$(PREFIX)/include -> bad, as it will add -I/usr/include when
cross-compiling.

> + 
> + BASHCOMPLETIONS=sepolicy-bash-completion.sh 
> + 
> +diff --git a/sestatus/Makefile b/sestatus/Makefile
> +index c5db7a3..c04ff00 100644
> +--- a/sestatus/Makefile
> ++++ b/sestatus/Makefile
> +@@ -5,7 +5,7 @@ MANDIR = $(PREFIX)/share/man
> + ETCDIR ?= $(DESTDIR)/etc
> + LIBDIR ?= $(PREFIX)/lib
> + 
> +-CFLAGS = -Werror -Wall -W
> ++CFLAGS ?= -Werror -Wall -W
> + override CFLAGS += -I$(PREFIX)/include -D_FILE_OFFSET_BITS=64

Again here.

> + LDLIBS = -lselinux -L$(LIBDIR)
> + 
> +diff --git a/setfiles/Makefile b/setfiles/Makefile
> +index ebc22c8..7c48814 100644
> +--- a/setfiles/Makefile
> ++++ b/setfiles/Makefile
> +@@ -8,7 +8,7 @@ AUDITH = $(shell ls $(PREFIX)/include/libaudit.h 2>/dev/null)
> + PROGRESS_STEP=$(shell grep "^\#define STAR_COUNT" restore.h | awk -S '{ print $$3 }')
> + ABORT_ON_ERRORS=$(shell grep "^\#define ABORT_ON_ERRORS" setfiles.c | awk -S '{ print $$3 }')
> + 
> +-CFLAGS = -g -Werror -Wall -W
> ++CFLAGS ?= -g -Werror -Wall -W
> + override CFLAGS += -I$(PREFIX)/include

And here.

Please build with BR2_COMPILER_PARANOID_UNSAFE_PATH=y to detect such
problems.

> + LDLIBS = -lselinux -lsepol -L$(LIBDIR)
> + 
> +-- 
> +1.9.1
> +
> diff --git a/package/policycoreutils/0003-Change-sepolicy-python-install-arguments-to-be-a-var.patch b/package/policycoreutils/0003-Change-sepolicy-python-install-arguments-to-be-a-var.patch
> new file mode 100644
> index 0000000..5bbfb76
> --- /dev/null
> +++ b/package/policycoreutils/0003-Change-sepolicy-python-install-arguments-to-be-a-var.patch
> @@ -0,0 +1,42 @@
> +From 4bb3e6bda68fe52fcd2df4f27c5900f4b0d50fa1 Mon Sep 17 00:00:00 2001
> +From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> +Date: Fri, 10 Jul 2015 11:56:49 -0500
> +Subject: Change sepolicy python install arguments to be a variable
> +
> +To allow the python install arguments to be overwritten, change the
> +arguments to be a variable. This also cleans up the DESTDIR detection a
> +little bit.
> +
> +Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> +---
> + sepolicy/Makefile | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/sepolicy/Makefile b/sepolicy/Makefile
> +index a52667a..4a10df6 100644
> +--- a/sepolicy/Makefile
> ++++ b/sepolicy/Makefile
> +@@ -7,6 +7,11 @@ SBINDIR ?= $(PREFIX)/sbin
> + MANDIR ?= $(PREFIX)/share/man
> + LOCALEDIR ?= $(PREFIX)/share/locale
> + PYTHON ?= /usr/bin/python
> ++ifneq (,$(DESTDIR))
> ++PYTHON_INSTALL_ARGS ?= --root $(DESTDIR)
> ++else
> ++PYTHON_INSTALL_ARGS ?=
> ++endif

Sounds good, but could be a bit simpler:

ifneq ($(DESTDIR),)
PYTHON_INSTALL_ARGS ?= --root $(DESTDIR)
endif

> + BASHCOMPLETIONDIR ?= $(DESTDIR)/etc/bash_completion.d/
> + SHAREDIR ?= $(PREFIX)/share/sandbox
> + override CFLAGS += $(LDFLAGS) -I$(PREFIX)/include -DPACKAGE="policycoreutils" -Wall -Werror -Wextra -W  -DSHARED -shared
> +@@ -23,7 +28,7 @@ clean:
> + 	-rm -rf build *~ \#* *pyc .#*
> + 
> + install:
> +-	$(PYTHON) setup.py install `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
> ++	$(PYTHON) setup.py install $(PYTHON_INSTALL_ARGS)
> + 	[ -d $(BINDIR) ] || mkdir -p $(BINDIR)
> + 	install -m 755 sepolicy.py $(BINDIR)/sepolicy
> + 	-mkdir -p $(MANDIR)/man8
> +-- 
> +1.9.1
> +
> diff --git a/package/policycoreutils/0004-disable-dbus.patch b/package/policycoreutils/0004-disable-dbus.patch
> new file mode 100644
> index 0000000..b685d0a
> --- /dev/null
> +++ b/package/policycoreutils/0004-disable-dbus.patch
> @@ -0,0 +1,14 @@
> +--- a/restorecond/Makefile	2016-02-25 13:23:23.286671669 -0600
> ++++ b/restorecond/Makefile	2016-03-03 12:44:25.032118694 -0600

Missing description + Signed-off-by in this patch.

> +@@ -10,9 +10,11 @@
> + INITDIR = $(DESTDIR)/etc/rc.d/init.d
> + SELINUXDIR = $(DESTDIR)/etc/selinux
> + 
> ++ifdef ENABLE_DBUS
> + DBUSFLAGS = -DHAVE_DBUS -I$(PREFIX)/include/dbus-1.0 -I$(PREFIX)/lib64/dbus-1.0/include \
> + 		-I$(PREFIX)/lib/dbus-1.0/include
> + DBUSLIB = -ldbus-glib-1 -ldbus-1
> ++endif
> + 
> + CFLAGS ?= -g -Werror -Wall -W
> + override CFLAGS += -I$(PREFIX)/include $(DBUSFLAGS) -I$(PREFIX)/include/glib-2.0 \
> diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
> new file mode 100644
> index 0000000..3131a02
> --- /dev/null
> +++ b/package/policycoreutils/Config.in
> @@ -0,0 +1,57 @@
> +config BR2_PACKAGE_POLICYCOREUTILS
> +	bool "policycoreutils"
> +	select BR2_PACKAGE_LIBSEMANAGE

libsemanage has lots of other dependencies:

        depends on BR2_TOOLCHAIN_HAS_THREADS
        depends on !BR2_STATIC_LIBS
        depends on !BR2_arc

You need to take them into account.

> +	select BR2_PACKAGE_LIBCAP_NG
> +	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libsemanage
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # uses fts.h
> +	help
> +	  Policycoreutils is a collection of policy utilities (originally
> +	  the "core" set of utilities needed to use SELinux, although it
> +	  has grown a bit over time), which have different dependencies.
> +	  sestatus, secon, run_init, and newrole only use libselinux.
> +	  load_policy and setfiles only use libselinux and libsepol.
> +	  semodule and semanage use libsemanage (and thus bring in
> +	  dependencies on libsepol and libselinux as well). setsebool
> +	  uses libselinux to make non-persistent boolean changes (via
> +	  the kernel interface) and uses libsemanage to make persistent
> +	  boolean changes.
> +
> +	  The base package will install the following utilities:
> +	      load_policy
> +	      newrole
> +	      restorecond
> +	      run_init
> +	      secon
> +	      semodule
> +	      semodule_deps
> +	      semodule_expand
> +	      semodule_link
> +	      semodule_package
> +	      sepolgen-ifgen
> +	      sestatus
> +	      setfiles
> +	      setsebool
> +
> +	  http://selinuxproject.org/page/Main_Page
> +
> +comment "policycoreutils needs a glibc or musl toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS  \
> +		|| !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
> +
> +if BR2_PACKAGE_POLICYCOREUTILS
> +
> +config BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND
> +	bool "restorecond Utility"
> +	select BR2_PACKAGE_LIBGLIB2 #glib2
> +	depends on BR2_USE_WCHAR # glib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> +	depends on BR2_USE_MMU # glib2
> +	help
> +	  Enable restorecond to be built
> +
> +comment "restorecond needs a toolchain w/ wchar, threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +
> +endif
> diff --git a/package/policycoreutils/policycoreutils.hash b/package/policycoreutils/policycoreutils.hash
> new file mode 100644
> index 0000000..575dd25
> --- /dev/null
> +++ b/package/policycoreutils/policycoreutils.hash
> @@ -0,0 +1,2 @@
> +# https://github.com/SELinuxProject/selinux/wiki/Releases
> +sha256 b6881741f9f9988346a73bfeccb0299941dc117349753f0ef3f23ee86f06c1b5  policycoreutils-2.1.14.tar.gz
> diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
> new file mode 100644
> index 0000000..aed2705
> --- /dev/null
> +++ b/package/policycoreutils/policycoreutils.mk
> @@ -0,0 +1,108 @@
> +################################################################################
> +#
> +# policycoreutils
> +#
> +################################################################################
> +
> +POLICYCOREUTILS_VERSION = 2.1.14
> +POLICYCOREUTILS_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
> +POLICYCOREUTILS_LICENSE = GPLv2
> +POLICYCOREUTILS_LICENSE_FILES = COPYING
> +
> +# gettext for load_policy.c use of libintl_* functions
> +POLICYCOREUTILS_DEPENDENCIES = libsemanage libcap-ng $(if $(BR2_NEEDS_GETTEXT),gettext)
> +
> +ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
> +POLICYCOREUTILS_DEPENDENCIES += linux-pam
> +POLICYCOREUTILS_MAKE_OPTS += NAMESPACE_PRIV=y
> +define POLICYCOREUTILS_INSTALL_TARGET_LINUX_PAM_CONFS
> +	$(INSTALL) -D -m 0644 $(@D)/newrole/newrole-lspp.pamd $(TARGET_DIR)/etc/pam.d/newrole
> +	$(INSTALL) -D -m 0644 $(@D)/run_init/run_init.pamd $(TARGET_DIR)/etc/pam.d/run_init
> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_AUDIT),y)
> +POLICYCOREUTILS_DEPENDENCIES += audit
> +POLICYCOREUTILS_MAKE_OPTS += AUDIT_LOG_PRIV=y
> +endif
> +
> +# Enable LSPP_PRIV if both audit and linux pam are enabled
> +ifeq ($(BR2_PACKAGE_LINUX_PAM)$(BR2_PACKAGE_AUDIT),yy)
> +POLICYCOREUTILS_MAKE_OPTS += LSPP_PRIV=y
> +endif
> +
> +# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
> +# large file support.
> +# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
> +POLICYCOREUTILS_MAKE_OPTS += \
> +	CC="$(TARGET_CC)" \
> +	CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
> +	LDFLAGS="$(TARGET_LDFLAGS) $(if $(BR2_NEEDS_GETTEXT),-lintl)" \
> +	ARCH="$(BR2_ARCH)" 
> +
> +POLICYCOREUTILS_MAKE_DIRS = load_policy newrole run_init \
> +	secon semodule semodule_deps semodule_expand semodule_link \
> +	semodule_package sepolgen-ifgen sestatus setfiles setsebool
> +
> +ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND),y)
> +POLICYCOREUTILS_MAKE_DIRS += restorecond
> +endif
> +
> +define POLICYCOREUTILS_BUILD_CMDS
> +	for dir in $(POLICYCOREUTILS_MAKE_DIRS) ; do \
> +		$(MAKE) -C $(@D)/$${dir} $(POLICYCOREUTILS_MAKE_OPTS) DESTDIR=$(STAGING_DIR) all || exit 1 ; \
> +	done

Please add a comment above this that explains why you're passing
DESTDIR=$(STAGING_DIR) at build time.

> +endef
> +
> +define POLICYCOREUTILS_INSTALL_TARGET_CMDS
> +	for dir in $(POLICYCOREUTILS_MAKE_DIRS) ; do \
> +		$(MAKE) -C $(@D)/$${dir} $(POLICYCOREUTILS_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install || exit 1 ; \
> +	done
> +endef
> +
> +HOST_POLICYCOREUTILS_DEPENDENCIES = host-libsemanage host-dbus-glib host-sepolgen host-setools
> +
> +# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
> +# large file support.
> +# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
> +HOST_POLICYCOREUTILS_MAKE_OPTS = \
> +	CC="$(HOSTCC)" \
> +	CFLAGS="$(HOST_CFLAGS) -U_FILE_OFFSET_BITS" \
> +	PYTHON="$(HOST_DIR)/usr/bin/python" \
> +	PYTHON_INSTALL_ARGS="$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)" \
> +	ARCH="$(HOSTARCH)" \
> +	LDFLAGS="$(HOST_LDFLAGS)"
> +
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +HOST_POLICYCOREUTILS_DEPENDENCIES += host-python3
> +HOST_POLICYCOREUTILS_MAKE_OPTS += \
> +	PYLIBVER="python$(PYTHON3_VERSION_MAJOR)"
> +else
> +HOST_POLICYCOREUTILS_DEPENDENCIES += host-python
> +HOST_POLICYCOREUTILS_MAKE_OPTS += \
> +	PYLIBVER="python$(PYTHON_VERSION_MAJOR)"
> +endif
> +
> +# Note: We are only building the programs required by the refpolicy build
> +HOST_POLICYCOREUTILS_MAKE_DIRS = load_policy semodule semodule_deps semodule_expand semodule_link \
> +	semodule_package setfiles restorecond audit2allow audit2why scripts semanage sepolicy
> +
> +define HOST_POLICYCOREUTILS_BUILD_CMDS
> +	for dir in $(HOST_POLICYCOREUTILS_MAKE_DIRS) ; do \
> +		$(MAKE) -C $(@D)/$${dir} $(HOST_POLICYCOREUTILS_MAKE_OPTS) DESTDIR=$(HOST_DIR) all || exit 1 ; \

DESTDIR=$(HOST_DIR) is wrong. You should instead use PREFIX=$(HOST_DIR)/usr.

> +define HOST_POLICYCOREUTILS_INSTALL_CMDS
> +	for dir in $(HOST_POLICYCOREUTILS_MAKE_DIRS) ; do \
> +		$(MAKE) -C $(@D)/$${dir} $(HOST_POLICYCOREUTILS_MAKE_OPTS) DESTDIR=$(HOST_DIR) install || exit 1 ; \

Ditto.

> +	done
> +	# Fix python paths
> +	$(SED) 's%/usr/bin/%$(HOST_DIR)/usr/bin/%g' $(HOST_DIR)/usr/bin/audit2allow
> +	$(SED) 's%/usr/bin/%$(HOST_DIR)/usr/bin/%g' $(HOST_DIR)/usr/bin/audit2why
> +	$(SED) 's%/usr/bin/%$(HOST_DIR)/usr/bin/%g' $(HOST_DIR)/usr/bin/sepolgen-ifgen
> +	$(SED) 's%/usr/bin/%$(HOST_DIR)/usr/bin/%g' $(HOST_DIR)/usr/bin/sepolicy

Sadly, this means more hardcoded paths, but I guess it's OK for now, I
prefer to sort out the other issues. This one can be solved later.

Could you rework your patch to solve the other issues raised above?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
