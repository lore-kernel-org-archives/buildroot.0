From: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
Date: Fri, 7 Oct 2016 13:08:04 -0500
Subject: [Buildroot] [v3 1/2] policycoreutils: new package
In-Reply-To: <CANQCQpZm1T8OWfKVYJ_sAo3P2aiMpTb9Fc4Z833ti660ZD6NOQ@mail.gmail.com>
References: <1468715720-2156-1-git-send-email-Aduskett@gmail.com>
 <CANQCQpZm1T8OWfKVYJ_sAo3P2aiMpTb9Fc4Z833ti660ZD6NOQ@mail.gmail.com>
Message-ID: <CAKGmAFq6eHWBN11nu2q76cmdfNgqnLt1BY-QAGoWFRmSbw4a6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Performed a build with this package enabled using the qemu selinux
defconfig (updated for kernel 4.7) which is part of the outstanding
v12 patchset found
here:http://patchwork.ozlabs.org/bundle/matthewlweber/rc_selinux/.
Tested-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>

On Fri, Oct 7, 2016 at 1:01 PM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Bryce,
>
> On Sat, Jul 16, 2016 at 7:35 PM, Adam Duskett <aduskett@gmail.com> wrote:
> > This package contains the core policy utilities that are required
> > for basic operation of an SELinux system.
> >
> > This package was updated to work with version 2.5 and is being submitted
> > with no other differences compared to the previous version
> > submitted here: https://patchwork.ozlabs.org/patch/641329/
> >
> > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
>
> +Bryce as he didn't have the original email.
>
> > ---
> > Changes:
> >
> > v2 - v3:
> >  - No changes
> >
> > v1 - v2:
> >  - No changes
> >
> >
> >  package/Config.in                                  |   1 +
> >  ...IR-to-all-paths-that-use-an-absolute-path.patch | 131 +++++++++++++
> >  .../0002-Add-PREFIX-to-host-paths.patch            | 211 +++++++++++++++++++++
> >  .../0003-Remove-hardcoded-arch-variable.patch      |  43 +++++
> >  ...licy-python-install-arguments-to-be-a-var.patch |  42 ++++
> >  .../0005-Check-to-see-if-DBUS-is-enabled.patch     |  56 ++++++
> >  package/policycoreutils/Config.in                  |  59 ++++++
> >  package/policycoreutils/policycoreutils.hash       |   2 +
> >  package/policycoreutils/policycoreutils.mk         | 111 +++++++++++
> >  9 files changed, 656 insertions(+)
> >  create mode 100644 package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
> >  create mode 100644 package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch
> >  create mode 100644 package/policycoreutils/0003-Remove-hardcoded-arch-variable.patch
> >  create mode 100644 package/policycoreutils/0004-Change-sepolicy-python-install-arguments-to-be-a-var.patch
> >  create mode 100644 package/policycoreutils/0005-Check-to-see-if-DBUS-is-enabled.patch
> >  create mode 100644 package/policycoreutils/Config.in
> >  create mode 100644 package/policycoreutils/policycoreutils.hash
> >  create mode 100644 package/policycoreutils/policycoreutils.mk
> >
> > diff --git a/package/Config.in b/package/Config.in
> > index 009b828..cc875e8 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1619,6 +1619,7 @@ menu "Real-Time"
> >  endmenu
> >
> >  menu "Security"
> > +       source "package/policycoreutils/Config.in"
> >         source "package/setools/Config.in"
> >  endmenu
> >
> > diff --git a/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
> > new file mode 100644
> > index 0000000..bbd6895
> > --- /dev/null
> > +++ b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
> > @@ -0,0 +1,131 @@
> > +The addition of this patch makes the use of DESTDIR
> > +mandatory as there are conditional checks which would fail if it's not
> > +defined.
> > +
> > +This patch was updated from the patch provided by Niranjan Reddy to
> > +accomodate version 2.5
> > +
> > +Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> > +Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
> > +Signed-off-by: Adam Duskett <AdamDuskett@outlook.com>
> > +Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> > +---
> > + policycoreutils/Makefile             | 2 +-
> > + policycoreutils/newrole/Makefile     | 4 ++--
> > + policycoreutils/restorecond/Makefile | 5 +++--
> > + policycoreutils/run_init/Makefile    | 4 ++--
> > + policycoreutils/sepolicy/Makefile    | 2 +-
> > + policycoreutils/sestatus/Makefile    | 2 +-
> > + policycoreutils/setfiles/Makefile    | 4 ++--
> > + 7 files changed, 12 insertions(+), 11 deletions(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index 962ac12..0634a2a 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -1,6 +1,6 @@
> > + SUBDIRS = sepolicy setfiles semanage load_policy newrole run_init sandbox secon audit2allow sestatus semodule_package semodule semodule_link semodule_expand semodule_deps sepolgen-ifgen setsebool scripts po man gui hll
> > +
> > +-INOTIFYH = $(shell ls /usr/include/sys/inotify.h 2>/dev/null)
> > ++INOTIFYH = $(shell ls $(DESTDIR)/usr/include/sys/inotify.h 2>/dev/null)
> > +
> > + ifeq (${INOTIFYH}, /usr/include/sys/inotify.h)
> > +       SUBDIRS += restorecond
> > +diff --git a/newrole/Makefile b/newrole/Makefile
> > +index 646cd4d..f124a6a 100644
> > +--- a/newrole/Makefile
> > ++++ b/newrole/Makefile
> > +@@ -4,8 +4,8 @@ BINDIR ?= $(PREFIX)/bin
> > + MANDIR ?= $(PREFIX)/share/man
> > + ETCDIR ?= $(DESTDIR)/etc
> > + LOCALEDIR = /usr/share/locale
> > +-PAMH = $(shell ls /usr/include/security/pam_appl.h 2>/dev/null)
> > +-AUDITH = $(shell ls /usr/include/libaudit.h 2>/dev/null)
> > ++PAMH = $(shell ls $(DESTDIR)/usr/include/security/pam_appl.h 2>/dev/null)
> > ++AUDITH = $(shell ls $(DESTDIR)/usr/include/libaudit.h 2>/dev/null)
> > + # Enable capabilities to permit newrole to generate audit records.
> > + # This will make newrole a setuid root program.
> > + # The capabilities used are: CAP_AUDIT_WRITE.
> > +diff --git a/restorecond/Makefile b/restorecond/Makefile
> > +index f99e1e7..92a4a4d 100644
> > +--- a/restorecond/Makefile
> > ++++ b/restorecond/Makefile
> > +@@ -11,11 +11,12 @@ autostart_DATA = sealertauto.desktop
> > + INITDIR ?= $(DESTDIR)/etc/rc.d/init.d
> > + SELINUXDIR = $(DESTDIR)/etc/selinux
> > +
> > +-DBUSFLAGS = -DHAVE_DBUS -I/usr/include/dbus-1.0 -I/usr/lib64/dbus-1.0/include -I/usr/lib/dbus-1.0/include
> > ++DBUSFLAGS = -DHAVE_DBUS -I$(DESTDIR)/usr/include/dbus-1.0 -I$(DESTDIR)/usr/lib64/dbus-1.0/include -I$(DESTDIR)/usr/lib/dbus-1.0/include
> > + DBUSLIB = -ldbus-glib-1 -ldbus-1
> > +
> > + CFLAGS ?= -g -Werror -Wall -W
> > +-override CFLAGS += -I$(PREFIX)/include $(DBUSFLAGS) -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/lib/glib-2.0/include
> > ++override CFLAGS += -I$(DESTDIR)/usr/include $(DBUSFLAGS) -I$(DESTDIR)/usr/include/glib-2.0 \
> > ++-I$(DESTDIR)/usr/lib64/glib-2.0/include -I$(DESTDIR)/usr/lib/glib-2.0/include
> > +
> > + LDLIBS += -lselinux $(DBUSLIB) -lglib-2.0 -L$(LIBDIR)
> > +
> > +diff --git a/run_init/Makefile b/run_init/Makefile
> > +index 5815a08..c81179b 100644
> > +--- a/run_init/Makefile
> > ++++ b/run_init/Makefile
> > +@@ -5,8 +5,8 @@ SBINDIR ?= $(PREFIX)/sbin
> > + MANDIR ?= $(PREFIX)/share/man
> > + ETCDIR ?= $(DESTDIR)/etc
> > + LOCALEDIR ?= /usr/share/locale
> > +-PAMH = $(shell ls /usr/include/security/pam_appl.h 2>/dev/null)
> > +-AUDITH = $(shell ls /usr/include/libaudit.h 2>/dev/null)
> > ++PAMH = $(shell ls $(DESTDIR)/usr/include/security/pam_appl.h 2>/dev/null)
> > ++AUDITH = $(shell ls $(DESTDIR)/usr/include/libaudit.h 2>/dev/null)
> > +
> > + CFLAGS ?= -Werror -Wall -W
> > + override CFLAGS += -I$(PREFIX)/include -DUSE_NLS -DLOCALEDIR="\"$(LOCALEDIR)\"" -DPACKAGE="\"policycoreutils\""
> > +diff --git a/sepolicy/Makefile b/sepolicy/Makefile
> > +index 39d46e8..6624373 100644
> > +--- a/sepolicy/Makefile
> > ++++ b/sepolicy/Makefile
> > +@@ -12,7 +12,7 @@ LOCALEDIR ?= /usr/share/locale
> > + BASHCOMPLETIONDIR ?= $(DESTDIR)/usr/share/bash-completion/completions
> > + SHAREDIR ?= $(PREFIX)/share/sandbox
> > + CFLAGS ?= -Wall -Werror -Wextra -W
> > +-override CFLAGS += -I$(PREFIX)/include -DPACKAGE="policycoreutils" -DSHARED -shared
> > ++override CFLAGS = $(LDFLAGS) -I$(DESTDIR)/usr/include -DPACKAGE="policycoreutils" -Wall -Werror -Wextra -W  -DSHARED -shared
> > +
> > + BASHCOMPLETIONS=sepolicy-bash-completion.sh
> > +
> > +diff --git a/sestatus/Makefile b/sestatus/Makefile
> > +index c04ff00..e10c32c 100644
> > +--- a/sestatus/Makefile
> > ++++ b/sestatus/Makefile
> > +@@ -6,7 +6,7 @@ ETCDIR ?= $(DESTDIR)/etc
> > + LIBDIR ?= $(PREFIX)/lib
> > +
> > + CFLAGS ?= -Werror -Wall -W
> > +-override CFLAGS += -I$(PREFIX)/include -D_FILE_OFFSET_BITS=64
> > ++override CFLAGS += -I$(DESTDIR)/usr/include -D_FILE_OFFSET_BITS=64
> > + LDLIBS = -lselinux -L$(LIBDIR)
> > +
> > + all: sestatus
> > +diff --git a/setfiles/Makefile b/setfiles/Makefile
> > +index 98f4f7d..eb26ed0 100644
> > +--- a/setfiles/Makefile
> > ++++ b/setfiles/Makefile
> > +@@ -3,13 +3,13 @@ PREFIX ?= $(DESTDIR)/usr
> > + SBINDIR ?= $(DESTDIR)/sbin
> > + MANDIR = $(PREFIX)/share/man
> > + LIBDIR ?= $(PREFIX)/lib
> > +-AUDITH = $(shell ls /usr/include/libaudit.h 2>/dev/null)
> > ++AUDITH = $(shell ls  $(DESTDIR)/usr/include/libaudit.h 2>/dev/null)
> > +
> > + PROGRESS_STEP=$(shell grep "^\#define STAR_COUNT" restore.h | awk -S '{ print $$3 }')
> > + ABORT_ON_ERRORS=$(shell grep "^\#define ABORT_ON_ERRORS" setfiles.c | awk -S '{ print $$3 }')
> > +
> > + CFLAGS ?= -g -Werror -Wall -W
> > +-override CFLAGS += -I$(PREFIX)/include
> > ++override CFLAGS += -I$(DESTDIR)/usr/include
> > + LDLIBS = -lselinux -lsepol -L$(LIBDIR)
> > +
> > + ifeq ($(AUDITH), /usr/include/libaudit.h)
> > +--
> > +2.7.4
> > +
> > diff --git a/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch b/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch
> > new file mode 100644
> > index 0000000..ba7a478
> > --- /dev/null
> > +++ b/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch
> > @@ -0,0 +1,211 @@
> > +From 7f99a727cdb8160d49bb0d0554fc88787980c971 Mon Sep 17 00:00:00 2001
> > +From: Adam Duskett <Aduskett@gmail.com>
> > +Date: Thu, 14 Jul 2016 13:16:03 -0400
> > +Subject: [PATCH 2/5] Add PREFIX to host paths
> > +
> > +Updates the remaining hardcoded host paths used in the build to be
> > +prefixed with a PREFIX path to allow cross compilation.
> > +
> > +Updated to work with version 2.5
> > +
> > +Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> > +Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
> > +Signed-off-by: Adam Duskett <AdamDuskett@outlook.com>
> > +Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> > +---
> > + policycoreutils/Makefile              |  4 +++-
> > + policycoreutils/audit2allow/Makefile  |  2 +-
> > + policycoreutils/load_policy/Makefile  |  2 +-
> > + policycoreutils/mcstrans/src/Makefile | 17 +++++++++--------
> > + policycoreutils/newrole/Makefile      |  8 ++++----
> > + policycoreutils/run_init/Makefile     |  8 ++++----
> > + policycoreutils/sepolicy/Makefile     |  2 +-
> > + policycoreutils/setfiles/Makefile     |  4 ++--
> > + 8 files changed, 25 insertions(+), 22 deletions(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index 0634a2a..bd99b1c 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -1,8 +1,10 @@
> > ++PREFIX  ?= $(DESTDIR)/usr
> > ++
> > + SUBDIRS = sepolicy setfiles semanage load_policy newrole run_init sandbox secon audit2allow sestatus semodule_package semodule semodule_link semodule_expand semodule_deps sepolgen-ifgen setsebool scripts po man gui hll
> > +
> > + INOTIFYH = $(shell ls $(DESTDIR)/usr/include/sys/inotify.h 2>/dev/null)
> > +
> > +-ifeq (${INOTIFYH}, /usr/include/sys/inotify.h)
> > ++ifeq (${INOTIFYH}, $(PREFIX)/include/sys/inotify.h)
> > +       SUBDIRS += restorecond
> > + endif
> > +
> > +diff --git a/audit2allow/Makefile b/audit2allow/Makefile
> > +index 87d2502..d4108fe 100644
> > +--- a/audit2allow/Makefile
> > ++++ b/audit2allow/Makefile
> > +@@ -5,7 +5,7 @@ PREFIX ?= $(DESTDIR)/usr
> > + BINDIR ?= $(PREFIX)/bin
> > + LIBDIR ?= $(PREFIX)/lib
> > + MANDIR ?= $(PREFIX)/share/man
> > +-LOCALEDIR ?= /usr/share/locale
> > ++LOCALEDIR ?= $(PREFIX)/share/locale
> > +
> > + all: audit2why
> > +
> > +diff --git a/load_policy/Makefile b/load_policy/Makefile
> > +index 7c5bab0..5cd0bbb 100644
> > +--- a/load_policy/Makefile
> > ++++ b/load_policy/Makefile
> > +@@ -3,7 +3,7 @@ PREFIX ?= $(DESTDIR)/usr
> > + SBINDIR ?= $(DESTDIR)/sbin
> > + USRSBINDIR ?= $(PREFIX)/sbin
> > + MANDIR ?= $(PREFIX)/share/man
> > +-LOCALEDIR ?= /usr/share/locale
> > ++LOCALEDIR ?= $(PREFIX)/share/locale
> > +
> > + CFLAGS ?= -Werror -Wall -W
> > + override CFLAGS += $(LDFLAGS) -I$(PREFIX)/include -DUSE_NLS -DLOCALEDIR="\"$(LOCALEDIR)\"" -DPACKAGE="\"policycoreutils\""
> > +diff --git a/mcstrans/src/Makefile b/mcstrans/src/Makefile
> > +index 907a1f1..6fda57e 100644
> > +--- a/mcstrans/src/Makefile
> > ++++ b/mcstrans/src/Makefile
> > +@@ -1,23 +1,24 @@
> > + ARCH = $(shell uname -i)
> > ++# Installation directories.
> > ++PREFIX  ?= $(DESTDIR)/usr
> > ++SBINDIR ?= $(DESTDIR)/sbin
> > ++INITDIR ?= $(DESTDIR)/etc/rc.d/init.d
> > ++SYSTEMDDIR ?= $(DESTDIR)/usr/lib/systemd
> > ++
> > + ifeq "$(ARCH)" "x86_64"
> > +       # In case of 64 bit system, use these lines
> > +-      LIBDIR=/usr/lib64
> > ++      LIBDIR=$(PREFIX)/lib64
> > + else
> > + ifeq "$(ARCH)" "i686"
> > +       # In case of 32 bit system, use these lines
> > +-      LIBDIR=/usr/lib
> > ++      LIBDIR=$(PREFIX)/lib
> > + else
> > + ifeq "$(ARCH)" "i386"
> > +       # In case of 32 bit system, use these lines
> > +-      LIBDIR=/usr/lib
> > ++      LIBDIR=$(PREFIX)/lib
> > + endif
> > + endif
> > + endif
> > +-# Installation directories.
> > +-PREFIX  ?= $(DESTDIR)/usr
> > +-SBINDIR ?= $(DESTDIR)/sbin
> > +-INITDIR ?= $(DESTDIR)/etc/rc.d/init.d
> > +-SYSTEMDDIR ?= $(DESTDIR)/usr/lib/systemd
> > +
> > + PROG_SRC=mcstrans.c  mcscolor.c  mcstransd.c  mls_level.c
> > + PROG_OBJS= $(patsubst %.c,%.o,$(PROG_SRC))
> > +diff --git a/newrole/Makefile b/newrole/Makefile
> > +index f124a6a..b687a09 100644
> > +--- a/newrole/Makefile
> > ++++ b/newrole/Makefile
> > +@@ -3,7 +3,7 @@ PREFIX ?= $(DESTDIR)/usr
> > + BINDIR ?= $(PREFIX)/bin
> > + MANDIR ?= $(PREFIX)/share/man
> > + ETCDIR ?= $(DESTDIR)/etc
> > +-LOCALEDIR = /usr/share/locale
> > ++LOCALEDIR =  $(PREFIX)/share/locale
> > + PAMH = $(shell ls $(DESTDIR)/usr/include/security/pam_appl.h 2>/dev/null)
> > + AUDITH = $(shell ls $(DESTDIR)/usr/include/libaudit.h 2>/dev/null)
> > + # Enable capabilities to permit newrole to generate audit records.
> > +@@ -24,7 +24,7 @@ CFLAGS ?= -Werror -Wall -W
> > + EXTRA_OBJS =
> > + override CFLAGS += -DVERSION=\"$(VERSION)\" $(LDFLAGS) -I$(PREFIX)/include -DUSE_NLS -DLOCALEDIR="\"$(LOCALEDIR)\"" -DPACKAGE="\"policycoreutils\""
> > + LDLIBS += -lselinux -L$(PREFIX)/lib
> > +-ifeq ($(PAMH), /usr/include/security/pam_appl.h)
> > ++ifeq ($(PAMH), $(PREFIX)/include/security/pam_appl.h)
> > +       override CFLAGS += -DUSE_PAM
> > +       EXTRA_OBJS += hashtab.o
> > +       LDLIBS += -lpam -lpam_misc
> > +@@ -32,7 +32,7 @@ else
> > +       override CFLAGS += -D_XOPEN_SOURCE=500
> > +       LDLIBS += -lcrypt
> > + endif
> > +-ifeq ($(AUDITH), /usr/include/libaudit.h)
> > ++ifeq ($(AUDITH), $(PREFIX)/include/libaudit.h)
> > +       override CFLAGS += -DUSE_AUDIT
> > +       LDLIBS += -laudit
> > + endif
> > +@@ -66,7 +66,7 @@ install: all
> > +       test -d $(MANDIR)/man1 || install -m 755 -d $(MANDIR)/man1
> > +       install -m $(MODE) newrole $(BINDIR)
> > +       install -m 644 newrole.1 $(MANDIR)/man1/
> > +-ifeq ($(PAMH), /usr/include/security/pam_appl.h)
> > ++ifeq ($(PAMH), $(PREFIX)/include/security/pam_appl.h)
> > +       test -d $(ETCDIR)/pam.d || install -m 755 -d $(ETCDIR)/pam.d
> > + ifeq ($(LSPP_PRIV),y)
> > +       install -m 644 newrole-lspp.pamd $(ETCDIR)/pam.d/newrole
> > +diff --git a/run_init/Makefile b/run_init/Makefile
> > +index c81179b..ce0df9f 100644
> > +--- a/run_init/Makefile
> > ++++ b/run_init/Makefile
> > +@@ -4,21 +4,21 @@ PREFIX ?= $(DESTDIR)/usr
> > + SBINDIR ?= $(PREFIX)/sbin
> > + MANDIR ?= $(PREFIX)/share/man
> > + ETCDIR ?= $(DESTDIR)/etc
> > +-LOCALEDIR ?= /usr/share/locale
> > ++LOCALEDIR ?= $(PREFIX)/share/locale
> > + PAMH = $(shell ls $(DESTDIR)/usr/include/security/pam_appl.h 2>/dev/null)
> > + AUDITH = $(shell ls $(DESTDIR)/usr/include/libaudit.h 2>/dev/null)
> > +
> > + CFLAGS ?= -Werror -Wall -W
> > + override CFLAGS += -I$(PREFIX)/include -DUSE_NLS -DLOCALEDIR="\"$(LOCALEDIR)\"" -DPACKAGE="\"policycoreutils\""
> > + LDLIBS += -lselinux -L$(PREFIX)/lib
> > +-ifeq ($(PAMH), /usr/include/security/pam_appl.h)
> > ++ifeq ($(PAMH), $(PREFIX)/include/security/pam_appl.h)
> > +       override CFLAGS += -DUSE_PAM
> > +       LDLIBS += -lpam -lpam_misc
> > + else
> > +       override CFLAGS += -D_XOPEN_SOURCE=500
> > +       LDLIBS += -lcrypt
> > + endif
> > +-ifeq ($(AUDITH), /usr/include/libaudit.h)
> > ++ifeq ($(AUDITH), $(PREFIX)/include/libaudit.h)
> > +       override CFLAGS += -DUSE_AUDIT
> > +       LDLIBS += -laudit
> > + endif
> > +@@ -38,7 +38,7 @@ install: all
> > +       install -m 755 open_init_pty $(SBINDIR)
> > +       install -m 644 run_init.8 $(MANDIR)/man8/
> > +       install -m 644 open_init_pty.8 $(MANDIR)/man8/
> > +-ifeq ($(PAMH), /usr/include/security/pam_appl.h)
> > ++ifeq ($(PAMH), $(PREFIX)/include/security/pam_appl.h)
> > +       install -m 644 run_init.pamd $(ETCDIR)/pam.d/run_init
> > + endif
> > +
> > +diff --git a/sepolicy/Makefile b/sepolicy/Makefile
> > +index 6624373..a16f8de 100644
> > +--- a/sepolicy/Makefile
> > ++++ b/sepolicy/Makefile
> > +@@ -8,7 +8,7 @@ BINDIR ?= $(PREFIX)/bin
> > + SBINDIR ?= $(PREFIX)/sbin
> > + DATADIR ?= $(PREFIX)/share
> > + MANDIR ?= $(PREFIX)/share/man
> > +-LOCALEDIR ?= /usr/share/locale
> > ++LOCALEDIR ?= $(PREFIX)/share/locale
> > + BASHCOMPLETIONDIR ?= $(DESTDIR)/usr/share/bash-completion/completions
> > + SHAREDIR ?= $(PREFIX)/share/sandbox
> > + CFLAGS ?= -Wall -Werror -Wextra -W
> > +diff --git a/setfiles/Makefile b/setfiles/Makefile
> > +index eb26ed0..3c6b80d 100644
> > +--- a/setfiles/Makefile
> > ++++ b/setfiles/Makefile
> > +@@ -12,7 +12,7 @@ CFLAGS ?= -g -Werror -Wall -W
> > + override CFLAGS += -I$(DESTDIR)/usr/include
> > + LDLIBS = -lselinux -lsepol -L$(LIBDIR)
> > +
> > +-ifeq ($(AUDITH), /usr/include/libaudit.h)
> > ++ifeq ($(AUDITH), $(PREFIX)/include/libaudit.h)
> > +       override CFLAGS += -DUSE_AUDIT
> > +       LDLIBS += -laudit
> > + endif
> > +--
> > +2.7.4
> > +
> > diff --git a/package/policycoreutils/0003-Remove-hardcoded-arch-variable.patch b/package/policycoreutils/0003-Remove-hardcoded-arch-variable.patch
> > new file mode 100644
> > index 0000000..bf48051
> > --- /dev/null
> > +++ b/package/policycoreutils/0003-Remove-hardcoded-arch-variable.patch
> > @@ -0,0 +1,43 @@
> > +From 7424f2bea0cb412e96202f596ad8077131589f40 Mon Sep 17 00:00:00 2001
> > +From: Adam Duskett <Aduskett@gmail.com>
> > +Date: Thu, 14 Jul 2016 13:18:24 -0400
> > +Subject: [PATCH 3/5] Remove hardcoded arch variable.
> > +
> > +Allow the ARCH value to be passed in as original configuration was
> > +solely based on host architecture.
> > +
> > +This patch was updated to work with version 2.5
> > +
> > +Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> > +Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
> > +Signed-off-by: Adam Duskett <AdamDuskett@outlook.com>
> > +Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> > +---
> > + policycoreutils/mcstrans/src/Makefile   | 1 -
> > + policycoreutils/mcstrans/utils/Makefile | 1 -
> > + 2 files changed, 2 deletions(-)
> > +
> > +diff --git a/mcstrans/src/Makefile b/mcstrans/src/Makefile
> > +index 6fda57e..7b4489f 100644
> > +--- a/mcstrans/src/Makefile
> > ++++ b/mcstrans/src/Makefile
> > +@@ -1,4 +1,3 @@
> > +-ARCH = $(shell uname -i)
> > + # Installation directories.
> > + PREFIX  ?= $(DESTDIR)/usr
> > + SBINDIR ?= $(DESTDIR)/sbin
> > +diff --git a/mcstrans/utils/Makefile b/mcstrans/utils/Makefile
> > +index 1ffb027..912fe12 100644
> > +--- a/mcstrans/utils/Makefile
> > ++++ b/mcstrans/utils/Makefile
> > +@@ -2,7 +2,6 @@
> > + PREFIX ?= $(DESTDIR)/usr
> > + BINDIR ?= $(PREFIX)/sbin
> > +
> > +-ARCH = $(shell uname -i)
> > + ifeq "$(ARCH)" "x86_64"
> > +         # In case of 64 bit system, use these lines
> > +         LIBDIR=/usr/lib64
> > +--
> > +2.7.4
> > +
> > diff --git a/package/policycoreutils/0004-Change-sepolicy-python-install-arguments-to-be-a-var.patch b/package/policycoreutils/0004-Change-sepolicy-python-install-arguments-to-be-a-var.patch
> > new file mode 100644
> > index 0000000..7c4b417
> > --- /dev/null
> > +++ b/package/policycoreutils/0004-Change-sepolicy-python-install-arguments-to-be-a-var.patch
> > @@ -0,0 +1,42 @@
> > +From 27fd1c85ca95b5d66ab0241a08242a75b60b375c Mon Sep 17 00:00:00 2001
> > +From: Adam Duskett <Aduskett@gmail.com>
> > +Date: Thu, 14 Jul 2016 13:22:57 -0400
> > +Subject: [PATCH 4/5] Change sepolicy python install arguments to be a variable
> > +
> > +To allow the python install arguments to be overwritten, change the
> > +arguments to be a variable. This also cleans up the DESTDIR detection a
> > +little bit.
> > +
> > +Updated to work with version 2.5
> > +
> > +Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> > +Signed-off-by: Adam Duskett <AdamDuskett@outlook.com>
> > +Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> > +---
> > + policycoreutils/sepolicy/Makefile | 5 ++++-
> > + 1 file changed, 4 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/sepolicy/Makefile b/sepolicy/Makefile
> > +index a16f8de..2013301 100644
> > +--- a/sepolicy/Makefile
> > ++++ b/sepolicy/Makefile
> > +@@ -1,4 +1,7 @@
> > + PYTHON ?= python
> > ++ifneq ($(DESTDIR),)
> > ++PYTHON_INSTALL_ARGS ?= --root $(DESTDIR)
> > ++endif
> > +
> > + # Installation directories.
> > + PREFIX ?= $(DESTDIR)/usr
> > +@@ -32,7 +35,7 @@ test:
> > +       @$(PYTHON) test_sepolicy.py -v
> > +
> > + install:
> > +-      $(PYTHON) setup.py install `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
> > ++      $(PYTHON) setup.py install $(PYTHON_INSTALL_ARGS)
> > +       [ -d $(BINDIR) ] || mkdir -p $(BINDIR)
> > +       install -m 755 sepolicy.py $(BINDIR)/sepolicy
> > +       (cd $(BINDIR); ln -sf sepolicy sepolgen)
> > +--
> > +2.7.4
> > +
> > diff --git a/package/policycoreutils/0005-Check-to-see-if-DBUS-is-enabled.patch b/package/policycoreutils/0005-Check-to-see-if-DBUS-is-enabled.patch
> > new file mode 100644
> > index 0000000..1e57af1
> > --- /dev/null
> > +++ b/package/policycoreutils/0005-Check-to-see-if-DBUS-is-enabled.patch
> > @@ -0,0 +1,56 @@
> > +From d1bc28c5b2efe60a0ee04d9c171928d0f3475654 Mon Sep 17 00:00:00 2001
> > +From: Adam Duskett <Aduskett@gmail.com>
> > +Date: Thu, 14 Jul 2016 13:26:23 -0400
> > +Subject: [PATCH 5/5] Check to see if DBUS is enabled.
> > +
> > +Adds a condition to prevent linking against dbus when at build time
> > +dbus has not been enabled.
> > +
> > +Updated for 2.5.
> > +
> > +Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > +Signed-off-by: Adam Duskett <AdamDuskett@outlook.com>
> > +Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> > +---
> > + policycoreutils/restorecond/Makefile | 2 ++
> > + policycoreutils/restorecond/user.c   | 2 +-
> > + 2 files changed, 3 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/restorecond/Makefile b/restorecond/Makefile
> > +index 92a4a4d..95f38a6 100644
> > +--- a/restorecond/Makefile
> > ++++ b/restorecond/Makefile
> > +@@ -11,8 +11,10 @@ autostart_DATA = sealertauto.desktop
> > + INITDIR ?= $(DESTDIR)/etc/rc.d/init.d
> > + SELINUXDIR = $(DESTDIR)/etc/selinux
> > +
> > ++ifdef ENABLE_DBUS
> > + DBUSFLAGS = -DHAVE_DBUS -I$(DESTDIR)/usr/include/dbus-1.0 -I$(DESTDIR)/usr/lib64/dbus-1.0/include -I$(DESTDIR)/usr/lib/dbus-1.0/include
> > + DBUSLIB = -ldbus-glib-1 -ldbus-1
> > ++endif
> > +
> > + CFLAGS ?= -g -Werror -Wall -W
> > + override CFLAGS += -I$(DESTDIR)/usr/include $(DBUSFLAGS) -I$(DESTDIR)/usr/include/glib-2.0 \
> > +diff --git a/restorecond/user.c b/restorecond/user.c
> > +index 714aae7..a04cddb 100644
> > +--- a/restorecond/user.c
> > ++++ b/restorecond/user.c
> > +@@ -54,7 +54,6 @@ static const char *PATH="/org/selinux/Restorecond";
> > + static const char *INTERFACE="org.selinux.RestorecondIface";
> > + static const char *RULE="type='signal',interface='org.selinux.RestorecondIface'";
> > +
> > +-static int local_lock_fd = -1;
> > +
> > + static DBusHandlerResult
> > + signal_filter (DBusConnection *connection  __attribute__ ((__unused__)), DBusMessage *message, void *user_data)
> > +@@ -101,6 +100,7 @@ static int dbus_server(GMainLoop *loop) {
> > + #include <selinux/selinux.h>
> > + #include <sys/file.h>
> > +
> > ++static int local_lock_fd = -1;
> > + /* size of the event structure, not counting name */
> > + #define EVENT_SIZE  (sizeof (struct inotify_event))
> > + /* reasonable guess as to size of 1024 events */
> > +--
> > +2.7.4
> > +
> > diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
> > new file mode 100644
> > index 0000000..519d1d9
> > --- /dev/null
> > +++ b/package/policycoreutils/Config.in
> > @@ -0,0 +1,59 @@
> > +config BR2_PACKAGE_POLICYCOREUTILS
> > +       bool "policycoreutils"
> > +       select BR2_PACKAGE_LIBSEMANAGE
> > +       select BR2_PACKAGE_LIBCAP_NG
> > +       select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
> > +       depends on BR2_TOOLCHAIN_HAS_THREADS # libsemanage
> > +       depends on !BR2_STATIC_LIBS #libsemanage
> > +       depends on !BR2_arc #libsemanage
> > +       depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # uses fts.h
> > +       help
> > +         Policycoreutils is a collection of policy utilities (originally
> > +         the "core" set of utilities needed to use SELinux, although it
> > +         has grown a bit over time), which have different dependencies.
> > +         sestatus, secon, run_init, and newrole only use libselinux.
> > +         load_policy and setfiles only use libselinux and libsepol.
> > +         semodule and semanage use libsemanage (and thus bring in
> > +         dependencies on libsepol and libselinux as well). setsebool
> > +         uses libselinux to make non-persistent boolean changes (via
> > +         the kernel interface) and uses libsemanage to make persistent
> > +         boolean changes.
> > +
> > +         The base package will install the following utilities:
> > +             load_policy
> > +             newrole
> > +             restorecond
> > +             run_init
> > +             secon
> > +             semodule
> > +             semodule_deps
> > +             semodule_expand
> > +             semodule_link
> > +             semodule_package
> > +             sepolgen-ifgen
> > +             sestatus
> > +             setfiles
> > +             setsebool
> > +
> > +         http://selinuxproject.org/page/Main_Page
> > +
> > +comment "policycoreutils needs a glibc or musl toolchain w/ threads"
> > +       depends on !BR2_TOOLCHAIN_HAS_THREADS  \
> > +               || !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
> > +
> > +if BR2_PACKAGE_POLICYCOREUTILS
> > +
> > +config BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND
> > +       bool "restorecond Utility"
> > +       select BR2_PACKAGE_LIBGLIB2 #glib2
> > +       depends on BR2_USE_WCHAR # glib2
> > +       depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> > +       depends on BR2_USE_MMU # glib2
> > +       help
> > +         Enable restorecond to be built
> > +
> > +comment "restorecond needs a toolchain w/ wchar, threads"
> > +       depends on BR2_USE_MMU
> > +       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> > +
> > +endif
> > diff --git a/package/policycoreutils/policycoreutils.hash b/package/policycoreutils/policycoreutils.hash
> > new file mode 100644
> > index 0000000..44cb0c3
> > --- /dev/null
> > +++ b/package/policycoreutils/policycoreutils.hash
> > @@ -0,0 +1,2 @@
> > +# https://github.com/SELinuxProject/selinux/wiki/Releases
> > +sha256 329382cfe9fa977678abf541dcd8fe3847cf0c83b24654c8f7322343907078a1 policycoreutils-2.5.tar.gz
> > diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
> > new file mode 100644
> > index 0000000..6611cdb
> > --- /dev/null
> > +++ b/package/policycoreutils/policycoreutils.mk
> > @@ -0,0 +1,111 @@
> > +################################################################################
> > +#
> > +# policycoreutils
> > +#
> > +################################################################################
> > +
> > +POLICYCOREUTILS_VERSION = 2.5
> > +POLICYCOREUTILS_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223
> > +POLICYCOREUTILS_LICENSE = GPLv2
> > +POLICYCOREUTILS_LICENSE_FILES = COPYING
> > +
> > +# gettext for load_policy.c use of libintl_* functions
> > +POLICYCOREUTILS_DEPENDENCIES = libsemanage libcap-ng $(if $(BR2_NEEDS_GETTEXT),gettext)
> > +
> > +ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
> > +POLICYCOREUTILS_DEPENDENCIES += linux-pam
> > +POLICYCOREUTILS_MAKE_OPTS += NAMESPACE_PRIV=y
> > +define POLICYCOREUTILS_INSTALL_TARGET_LINUX_PAM_CONFS
> > +       $(INSTALL) -D -m 0644 $(@D)/newrole/newrole-lspp.pamd $(TARGET_DIR)/etc/pam.d/newrole
> > +       $(INSTALL) -D -m 0644 $(@D)/run_init/run_init.pamd $(TARGET_DIR)/etc/pam.d/run_init
> > +endef
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_AUDIT),y)
> > +POLICYCOREUTILS_DEPENDENCIES += audit
> > +POLICYCOREUTILS_MAKE_OPTS += AUDIT_LOG_PRIV=y
> > +endif
> > +
> > +# Enable LSPP_PRIV if both audit and linux pam are enabled
> > +ifeq ($(BR2_PACKAGE_LINUX_PAM)$(BR2_PACKAGE_AUDIT),yy)
> > +POLICYCOREUTILS_MAKE_OPTS += LSPP_PRIV=y
> > +endif
> > +
> > +# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
> > +# large file support.
> > +# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
> > +POLICYCOREUTILS_MAKE_OPTS += \
> > +       CC="$(TARGET_CC)" \
> > +       CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
> > +       LDFLAGS="$(TARGET_LDFLAGS) $(if $(BR2_NEEDS_GETTEXT),-lintl)" \
> > +       ARCH="$(BR2_ARCH)"
> > +
> > +POLICYCOREUTILS_MAKE_DIRS = load_policy newrole run_init \
> > +       secon semodule semodule_deps semodule_expand semodule_link \
> > +       semodule_package sepolgen-ifgen sestatus setfiles setsebool
> > +
> > +ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND),y)
> > +POLICYCOREUTILS_MAKE_DIRS += restorecond
> > +endif
> > +#The source has been patched to require a DESTDIR path which is
> > +#prefixed to all filesystem paths which were by default hardcoded to
> > +#host system paths.
> > +define POLICYCOREUTILS_BUILD_CMDS
> > +       for dir in $(POLICYCOREUTILS_MAKE_DIRS) ; do \
> > +               $(MAKE) -C $(@D)/$${dir} $(POLICYCOREUTILS_MAKE_OPTS) DESTDIR=$(STAGING_DIR) all || exit 1 ; \
> > +       done
> > +endef
> > +
> > +define POLICYCOREUTILS_INSTALL_TARGET_CMDS
> > +       for dir in $(POLICYCOREUTILS_MAKE_DIRS) ; do \
> > +               $(MAKE) -C $(@D)/$${dir} $(POLICYCOREUTILS_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install || exit 1 ; \
> > +       done
> > +endef
> > +
> > +HOST_POLICYCOREUTILS_DEPENDENCIES = host-libsemanage host-dbus-glib host-sepolgen host-setools
> > +
> > +# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
> > +# large file support.
> > +# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
> > +HOST_POLICYCOREUTILS_MAKE_OPTS = \
> > +       CC="$(HOSTCC)" \
> > +       CFLAGS="$(HOST_CFLAGS) -U_FILE_OFFSET_BITS" \
> > +       PYTHON="$(HOST_DIR)/usr/bin/python" \
> > +       PYTHON_INSTALL_ARGS="$(HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS)" \
> > +       ARCH="$(HOSTARCH)" \
> > +       LDFLAGS="$(HOST_LDFLAGS)"
> > +
> > +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> > +HOST_POLICYCOREUTILS_DEPENDENCIES += host-python3
> > +HOST_POLICYCOREUTILS_MAKE_OPTS += \
> > +       PYLIBVER="python$(PYTHON3_VERSION_MAJOR)"
> > +else
> > +HOST_POLICYCOREUTILS_DEPENDENCIES += host-python
> > +HOST_POLICYCOREUTILS_MAKE_OPTS += \
> > +       PYLIBVER="python$(PYTHON_VERSION_MAJOR)"
> > +endif
> > +
> > +# Note: We are only building the programs required by the refpolicy build
> > +HOST_POLICYCOREUTILS_MAKE_DIRS = load_policy semodule semodule_deps semodule_expand semodule_link \
> > +       semodule_package setfiles restorecond audit2allow scripts semanage sepolicy
> > +
> > +define HOST_POLICYCOREUTILS_BUILD_CMDS
> > +       for dir in $(HOST_POLICYCOREUTILS_MAKE_DIRS) ; do \
> > +               $(MAKE) -C $(@D)/$${dir} $(HOST_POLICYCOREUTILS_MAKE_OPTS) DESTDIR=$(HOST_DIR) all || exit 1 ; \
> > +       done
> > +endef
> > +#The source has been patched to require a DESTDIR path which is
> > +#prefixed to all filesystem paths which were by default hardcoded to
> > +#host system paths.
> > +define HOST_POLICYCOREUTILS_INSTALL_CMDS
> > +       for dir in $(HOST_POLICYCOREUTILS_MAKE_DIRS) ; do \
> > +               $(MAKE) -C $(@D)/$${dir} $(HOST_POLICYCOREUTILS_MAKE_OPTS) DESTDIR=$(HOST_DIR) install || exit 1 ; \
> > +       done
> > +       # Fix python paths
> > +       $(SED) 's%/usr/bin/%$(HOST_DIR)/usr/bin/%g' $(HOST_DIR)/usr/bin/audit2allow
> > +       $(SED) 's%/usr/bin/%$(HOST_DIR)/usr/bin/%g' $(HOST_DIR)/usr/bin/sepolgen-ifgen
> > +       $(SED) 's%/usr/bin/%$(HOST_DIR)/usr/bin/%g' $(HOST_DIR)/usr/bin/sepolicy
> > +endef
> > +
> > +$(eval $(generic-package))
> > +$(eval $(host-generic-package))
> > --
> > 2.7.4
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
> --
> Matthew L Weber / Pr Software Engineer
> Airborne Information Systems / Security Systems and Software / Secure Platforms
> MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
> www.rockwellcollins.com
>
> Note: Any Export License Required Information and License Restricted
> Third Party Intellectual Property (TPIP) content must be encrypted and
> sent to matthew.weber at corp.rockwellcollins.com.




-- 


Bryce Ferguson
Software Engineer
Airborne Information Solutions \ Secure Platforms

400 Collins Rd NE Cedar Rapids, Iowa 52498

Bryce.Ferguson at rockwellcollins.com
