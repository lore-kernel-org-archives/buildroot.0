From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Tue, 14 Jul 2015 09:28:23 -0500
Subject: [Buildroot] [PATCH v8 01/16] policycoreutils: new package
In-Reply-To: <CAHXCMML5nEattdjgAHfBXPhXct=7kcu3zQcPUGHasUWozQ3GbQ@mail.gmail.com>
References: <1436570882-56442-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1436570882-56442-2-git-send-email-clayton.shotwell@rockwellcollins.com>
 <CAHXCMML5nEattdjgAHfBXPhXct=7kcu3zQcPUGHasUWozQ3GbQ@mail.gmail.com>
Message-ID: <CANn-YGTpn+yVcQxGt+TNCEVu5jWsb07ck-S4tQSRRDgqKbuJMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,

On Tue, Jul 14, 2015 at 7:26 AM, Samuel Martin <s.martin49@gmail.com> wrote:
> Clayton, all,
>
> On Sat, Jul 11, 2015 at 1:27 AM, Clayton Shotwell
> <clayton.shotwell@rockwellcollins.com> wrote:
> [...]
>> diff --git a/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
>> new file mode 100644
>> index 0000000..016980f
>> --- /dev/null
>> +++ b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
>> @@ -0,0 +1,258 @@
>> +From a8eea90050551e42d4dc81867853f351282f9f90 Mon Sep 17 00:00:00 2001
>> +From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
>> +Date: Fri, 10 Jul 2015 11:44:08 -0500
>> +Subject: [PATCH 1/3] Add DESTDIR to all paths that use an absolute path
>> +
>> +To aid in cross compiling, add the DESTDIR variable to the start of all
>> +of the paths used during compilation. Most paths already used DESTDIR.
>> +
>> +Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
>> +---
>> + Makefile                |  4 ++--
>> + audit2allow/Makefile    |  2 +-
>> + load_policy/Makefile    |  2 +-
>> + mcstrans/src/Makefile   | 11 +++++++----
>> + mcstrans/utils/Makefile |  9 ++++++---
>> + newrole/Makefile        | 12 ++++++------
>> + restorecond/Makefile    |  6 ++++--
>> + run_init/Makefile       | 12 ++++++------
>> + sepolicy/Makefile       |  2 +-
>> + setfiles/Makefile       |  4 ++--
>> + 10 files changed, 36 insertions(+), 28 deletions(-)
>> +
>> +diff --git a/Makefile b/Makefile
>> +index 3980799..0fca022 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -1,8 +1,8 @@
>> + SUBDIRS = sepolicy setfiles semanage load_policy newrole run_init sandbox secon audit2allow audit2why sestatus semodule_package semodule semodule_link semodule_expand semodule_deps sepolgen-ifgen setsebool scripts po man gui
>> +
>> +-INOTIFYH = $(shell ls /usr/include/sys/inotify.h 2>/dev/null)
>> ++INOTIFYH = $(shell ls $(DESTDIR)/usr/include/sys/inotify.h 2>/dev/null)
>> +
>> +-ifeq (${INOTIFYH}, /usr/include/sys/inotify.h)
>> ++ifeq (${INOTIFYH}, $(DESTDIR)/usr/include/sys/inotify.h)
>> +       SUBDIRS += restorecond
>> + endif
>> +
>> +diff --git a/audit2allow/Makefile b/audit2allow/Makefile
>> +index 88635d4..933e520 100644
>> +--- a/audit2allow/Makefile
>> ++++ b/audit2allow/Makefile
>> +@@ -3,7 +3,7 @@ PREFIX ?= $(DESTDIR)/usr
>> + BINDIR ?= $(PREFIX)/bin
>> + LIBDIR ?= $(PREFIX)/lib
>> + MANDIR ?= $(PREFIX)/share/man
>> +-LOCALEDIR ?= /usr/share/locale
>> ++LOCALEDIR ?= $(DESTDIR)/usr/share/locale
> nit: could be set to: $(PREFIX)/share/locale

That does make it a little cleaner. I'll change all of the DESTDIR to
PREFIX for this change.

>> +
>> + CFLAGS ?= -Werror -Wall -W
>> + override CFLAGS += $(LDFLAGS) -I$(PREFIX)/include -DUSE_NLS -DLOCALEDIR="\"$(LOCALEDIR)\"" -DPACKAGE="\"policycoreutils\""
>> +diff --git a/mcstrans/src/Makefile b/mcstrans/src/Makefile
>> +index fb44490..1982b43 100644
>> +--- a/mcstrans/src/Makefile
>> ++++ b/mcstrans/src/Makefile
>> +@@ -1,15 +1,18 @@
>> + ARCH = $(shell uname -i)
> This can break target build, no? Unless you set ARCH=... on the right
> of make. (I don't something like that in the *.mk.)
> Note that for the host, BR2_HOSTARCH is also defined.

Good point. Seems like a lot of trouble to determine which lib
directory to use. I'll look making the ARCH variable a ?= and see
about defining the ARCH in policycoreutils.mk.

>> + ifeq "$(ARCH)" "x86_64"
>> +       # In case of 64 bit system, use these lines
>> +-      LIBDIR=/usr/lib64
>> +-else
>> ++      LIBDIR=$(DESTDIR)/usr/lib64
>> ++else
>> + ifeq "$(ARCH)" "i686"
>> +       # In case of 32 bit system, use these lines
>> +-      LIBDIR=/usr/lib
>> ++      LIBDIR=$(DESTDIR)/usr/lib
>> + else
>> + ifeq "$(ARCH)" "i386"
>> +       # In case of 32 bit system, use these lines
>> +-      LIBDIR=/usr/lib
>> ++      LIBDIR=$(DESTDIR)/usr/lib
>> ++else
>> ++      # Default to these lines if arch is unknown
>> ++      LIBDIR=$(DESTDIR)/usr/lib
>> + endif
>> + endif
> Note that a couple of targets set BR2_ARCH to i486 or i586, see [1].

I'll have to look through some different architecture to see which
ones use lib and which use lib64.

[...]

>> diff --git a/package/policycoreutils/0002-Allow-CFLAGS-to-be-overwritten.patch b/package/policycoreutils/0002-Allow-CFLAGS-to-be-overwritten.patch
>> new file mode 100644
>> index 0000000..54aecae
>> --- /dev/null
>> +++ b/package/policycoreutils/0002-Allow-CFLAGS-to-be-overwritten.patch
>> @@ -0,0 +1,57 @@
>> +From 656740d38ad34cbd5a89e900dab82ec521d0a522 Mon Sep 17 00:00:00 2001
>> +From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
>> +Date: Fri, 10 Jul 2015 11:47:09 -0500
>> +Subject: [PATCH 2/3] Allow CFLAGS to be overwritten
>> +
>> +Allow all CFLAGS declarations to be overwritten to aid in cross
>> +compiling.
>> +
>> +Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
>> +---
>> + sepolicy/Makefile | 2 +-
>> + sestatus/Makefile | 2 +-
>> + setfiles/Makefile | 2 +-
>> + 3 files changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/sepolicy/Makefile b/sepolicy/Makefile
>> +index 1074d26..9d44ac2 100644
>> +--- a/sepolicy/Makefile
>> ++++ b/sepolicy/Makefile
>> +@@ -9,7 +9,7 @@ LOCALEDIR ?= $(DESTDIR)/usr/share/locale
>> + PYTHON ?= /usr/bin/python
>> + BASHCOMPLETIONDIR ?= $(DESTDIR)/etc/bash_completion.d/
>> + SHAREDIR ?= $(PREFIX)/share/sandbox
>> +-override CFLAGS = $(LDFLAGS) -I$(PREFIX)/include -DPACKAGE="policycoreutils" -Wall -Werror -Wextra -W  -DSHARED -shared
>> ++override CFLAGS += $(LDFLAGS) -I$(PREFIX)/include -DPACKAGE="policycoreutils" -Wall -Werror -Wextra -W  -DSHARED -shared
> Ditch -Werror here please, otherwise it will always be in the CFLAGS :-/

Will it? I would assume it would only apply for the calls in this
Makefile. I checked the make output and could not find a reference to
any of the flags being used. I'm going to leave it as is for now.

>> +
>> + BASHCOMPLETIONS=sepolicy-bash-completion.sh
>> +
>> +diff --git a/sestatus/Makefile b/sestatus/Makefile
>> +index c5db7a3..c04ff00 100644
>> +--- a/sestatus/Makefile
>> ++++ b/sestatus/Makefile
>> +@@ -5,7 +5,7 @@ MANDIR = $(PREFIX)/share/man
>> + ETCDIR ?= $(DESTDIR)/etc
>> + LIBDIR ?= $(PREFIX)/lib
>> +
>> +-CFLAGS = -Werror -Wall -W
>> ++CFLAGS ?= -Werror -Wall -W
>> + override CFLAGS += -I$(PREFIX)/include -D_FILE_OFFSET_BITS=64
>> + LDLIBS = -lselinux -L$(LIBDIR)
>> +
>> +diff --git a/setfiles/Makefile b/setfiles/Makefile
>> +index dc04d9a..67d9ef0 100644
>> +--- a/setfiles/Makefile
>> ++++ b/setfiles/Makefile
>> +@@ -8,7 +8,7 @@ AUDITH = $(shell ls $(DESTDIR)/usr/include/libaudit.h 2>/dev/null)
>> + PROGRESS_STEP=$(shell grep "^\#define STAR_COUNT" restore.h | awk -S '{ print $$3 }')
>> + ABORT_ON_ERRORS=$(shell grep "^\#define ABORT_ON_ERRORS" setfiles.c | awk -S '{ print $$3 }')
>> +
>> +-CFLAGS = -g -Werror -Wall -W
>> ++CFLAGS ?= -g -Werror -Wall -W
>> + override CFLAGS += -I$(PREFIX)/include
>> + LDLIBS = -lselinux -lsepol -L$(LIBDIR)
>> +
>> +--
>> +1.9.1
>> +
>> diff --git a/package/policycoreutils/0003-Change-sepolicy-python-install-arguments-to-be-a-var.patch b/package/policycoreutils/0003-Change-sepolicy-python-install-arguments-to-be-a-var.patch
>> new file mode 100644
>> index 0000000..4e35d92
>> --- /dev/null
>> +++ b/package/policycoreutils/0003-Change-sepolicy-python-install-arguments-to-be-a-var.patch
>> @@ -0,0 +1,42 @@
>> +From c8f1022be057cfe28101fbd0d6dedf6f42477ffc Mon Sep 17 00:00:00 2001
>> +From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
>> +Date: Fri, 10 Jul 2015 11:56:49 -0500
>> +Subject: [PATCH 3/3] Change sepolicy python install arguments to be a variable
>> +
>> +To allow the python install arguments to be overwritten, change the
>> +arguments to be a variable. This also cleans up the DESTDIR detection a
>> +little bit.
>> +
>> +Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
>> +---
>> + sepolicy/Makefile | 7 ++++++-
>> + 1 file changed, 6 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/sepolicy/Makefile b/sepolicy/Makefile
>> +index 9d44ac2..bd8a383 100644
>> +--- a/sepolicy/Makefile
>> ++++ b/sepolicy/Makefile
>> +@@ -7,6 +7,11 @@ SBINDIR ?= $(PREFIX)/sbin
>> + MANDIR ?= $(PREFIX)/share/man
>> + LOCALEDIR ?= $(DESTDIR)/usr/share/locale
>> + PYTHON ?= /usr/bin/python
>> ++ifneq (,$(DESTDIR))
>> ++PYTHON_INSTALL_ARGS ?= --root $(DESTDIR)
> Why not a += ?
> Can it be preset through the env. or command line?

I was looking at the python package framework and it handles the host
vs target builds quite differently. The --root needs to be set to / in
the target builds and not set at all for the host builds. By doing it
this way, I can keep the original file almost the same but still
provide the hooks Buildroot needs to install it in the correct place.

>> ++else
>> ++PYTHON_INSTALL_ARGS ?=
>> ++endif
>> + BASHCOMPLETIONDIR ?= $(DESTDIR)/etc/bash_completion.d/
>> + SHAREDIR ?= $(PREFIX)/share/sandbox
>> + override CFLAGS += $(LDFLAGS) -I$(PREFIX)/include -DPACKAGE="policycoreutils" -Wall -Werror -Wextra -W  -DSHARED -shared
>> +@@ -23,7 +28,7 @@ clean:
>> +       -rm -rf build *~ \#* *pyc .#*
>> +
>> + install:
>> +-      $(PYTHON) setup.py install `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
>> ++      $(PYTHON) setup.py install $(PYTHON_INSTALL_ARGS)
>> +       [ -d $(BINDIR) ] || mkdir -p $(BINDIR)
>> +       install -m 755 sepolicy.py $(BINDIR)/sepolicy
>> +       -mkdir -p $(MANDIR)/man8
>> +--
>> +1.9.1
>> +
>> diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
>> new file mode 100644
>> index 0000000..1dc01c4
>> --- /dev/null
>> +++ b/package/policycoreutils/Config.in
>> @@ -0,0 +1,59 @@
>> +config BR2_PACKAGE_POLICYCOREUTILS
>> +       bool "policycoreutils"
>> +       select BR2_PACKAGE_LIBSEMANAGE
>> +       select BR2_PACKAGE_LIBCAP_NG
>> +       select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
>> +       depends on BR2_TOOLCHAIN_HAS_THREADS # libsemanage
>> +       depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # uses fts.h
>> +       help
>> +         Policycoreutils is a collection of policy utilities (originally
>> +         the "core" set of utilities needed to use SELinux, although it
>> +         has grown a bit over time), which have different dependencies.
>> +         sestatus, secon, run_init, and newrole only use libselinux.
>> +         load_policy and setfiles only use libselinux and libsepol.
>> +         semodule and semanage use libsemanage (and thus bring in
>> +         dependencies on libsepol and libselinux as well). setsebool
>> +         uses libselinux to make non-persistent boolean changes (via
>> +         the kernel interface) and uses libsemanage to make persistent
>> +         boolean changes.
>> +
>> +         The base package will install the following utilities:
>> +             load_policy
>> +             newrole
>> +             restorecond
>> +             run_init
>> +             secon
>> +             semodule
>> +             semodule_deps
>> +             semodule_expand
>> +             semodule_link
>> +             semodule_package
>> +             sepolgen-ifgen
>> +             sestatus
>> +             setfiles
>> +             setsebool
>> +
>> +         http://selinuxproject.org/page/Main_Page
>> +
>> +comment "policycoreutils needs a glibc or musl toolchain w/ threads"
>> +       depends on !BR2_TOOLCHAIN_HAS_THREADS  \
>> +               || !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
>> +
>> +if BR2_PACKAGE_POLICYCOREUTILS
>> +
>> +config BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND
>> +       bool "restorecond Utility"
>> +       select BR2_PACKAGE_DBUS_GLIB
>> +       depends on BR2_PACKAGE_DBUS
> Why a "depends on" instead of a select?

This was a suggestion from Thomas P. Since DBUS is a large package
with a lot of infrastructure, depend on it (it is also a dependency of
DBUS_GLIB) and select dbus-glib

>> +       depends on BR2_USE_WCHAR # glib2
>> +       depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
>> +       depends on BR2_USE_MMU # glib2
>> +       help
>> +         Enable restorecond to be built
>> +
>> +comment "restorecond needs a toolchain w/ wchar, threads, dbus"
>> +       depends on BR2_USE_MMU
>> +       depends on BR2_PACKAGE_DBUS
>> +       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
>> +
>> +endif
>> diff --git a/package/policycoreutils/policycoreutils.hash b/package/policycoreutils/policycoreutils.hash
>> new file mode 100644
>> index 0000000..575dd25
>> --- /dev/null
>> +++ b/package/policycoreutils/policycoreutils.hash
>> @@ -0,0 +1,2 @@
>> +# https://github.com/SELinuxProject/selinux/wiki/Releases
>> +sha256 b6881741f9f9988346a73bfeccb0299941dc117349753f0ef3f23ee86f06c1b5  policycoreutils-2.1.14.tar.gz
>> diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
>> new file mode 100644
>> index 0000000..2b954b9
>> --- /dev/null
>> +++ b/package/policycoreutils/policycoreutils.mk
>> @@ -0,0 +1,107 @@
>> +################################################################################
>> +#
>> +# policycoreutils
>> +#
>> +################################################################################
>> +
>> +POLICYCOREUTILS_VERSION = 2.1.14
>> +POLICYCOREUTILS_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
>> +POLICYCOREUTILS_LICENSE = GPLv2
>> +POLICYCOREUTILS_LICENSE_FILES = COPYING
>> +
>> +# gettext for load_policy.c use of libintl_* functions
>> +POLICYCOREUTILS_DEPENDENCIES = libsemanage libcap-ng $(if $(BR2_NEEDS_GETTEXT),gettext)
>> +
>> +ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
>> +POLICYCOREUTILS_DEPENDENCIES += linux-pam
>> +POLICYCOREUTILS_MAKE_OPTS += NAMESPACE_PRIV=y
>> +define POLICYCOREUTILS_INSTALL_TARGET_LINUX_PAM_CONFS
>> +       $(INSTALL) -D -m 0644 $(@D)/newrole/newrole-lspp.pamd $(TARGET_DIR)/etc/pam.d/newrole
>> +       $(INSTALL) -D -m 0644 $(@D)/run_init/run_init.pamd $(TARGET_DIR)/etc/pam.d/run_init
>> +endef
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_AUDIT),y)
>> +POLICYCOREUTILS_DEPENDENCIES += audit
>> +POLICYCOREUTILS_MAKE_OPTS += AUDIT_LOG_PRIV=y
>> +endif
>> +
>> +# Enable LSPP_PRIV if both audit and linux pam are enabled
>> +ifeq ($(BR2_PACKAGE_LINUX_PAM)$(BR2_PACKAGE_AUDIT),yy)
>> +POLICYCOREUTILS_MAKE_OPTS += LSPP_PRIV=y
>> +endif
>> +
>> +# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
>> +# large file support.
>> +# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
>> +POLICYCOREUTILS_MAKE_OPTS = \
> s/=/+=/
> Otherwise, options set for linux-pam and audit are lost.
>
> Also, no ARCH=$(BR2_ARCH) in the *_MAKE_OPTS (see my comment above)?

Will add per comment above.

Thanks,
Clayton

Clayton Shotwell
Senior Software Engineer, Rockwell Collins
clayton.shotwell at rockwellcollins.com
