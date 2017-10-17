From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 17 Oct 2017 14:54:44 -0400
Subject: [Buildroot] [PATCH v9 5/5] policycoreutils: split packages and bump
	to 2.7
In-Reply-To: <20171017185444.13989-1-Adamduskett@outlook.com>
References: <20171017185444.13989-1-Adamduskett@outlook.com>
Message-ID: <20171017185444.13989-5-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Policycoreutils was broken up into several packages, as such several
changes needed to happen for this patch to work:

- Remove patches 3, 4, and 5 as they no longer apply.
- Refresh patches 1 and 2 to work with version 2.7
- Remove semodule_${deps,expand,link,package} and sestatus from the makedirs
  in the mk file.
- Remove restorecond from the make and config file. (Seperate package)
- Remove Audit2allow from the make and config file. (In a different package)
- Remove the package sepolgen
- Add the package selinux-python
- Add the package restorecond
- Add the package semodule-utils
- Add the relevant Config.in.legacy options into the menu.

Because these are utilities that work on top of python, the older versions of
these utilites still work, and as such this should be a single patch.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
Changes v1 -> v2:
  - Combine this patch, sepolgen removal, restorecond, and selinux-python
    into a single patch. (Adam)
  - Add Config.in.legacy entries for: Audit2allow, sepolgen, and audit2allow
    (Arnout) 
  - Remove excess SOB lines from policycoreutils patches. (Arnout)
  - Fixed line length in restorecond Config.in (Arnout)
  - Added comment about _FILE_OFFSET_BITS in restorecond.mk (Arnout)
  - Fixed capitalization in restorecond.mk comment. (Arnout)
  - Added comment in selinux-python help explaining that if no package is
    selected, that no package will be built. (Arnout)
  - Removed sepolgen from requirements of selinux-python. (Arnout)
  - Moved python selection up to BR2_PACKAGE_SELINUX_PYTHON level. (Arnout)
  - Added global comment for when selinux-python is not available. (Arnout)
  - Added global comment for when audit2allow is not available. (Arnout)
  - Cleaned up audit2allow help text (Arnout)
  - Removed left over selinux-python host make commands.  No packages require
    host variants of selinux-python packages anymore.

Changes v2 -> v3:
  - Remove host-sepolgen from policycoreutils.mk (Matthew Weber)
  - Add COPYING license file to policycoreutils.hash.
  
Changes v3 -> v4:
  - Fix Config.in.legacy logic (Thomas)
  restorecond:
  - Changed depends on BR2_PACKAGE_DBUS to select. (Thomas)
  - Added missing upstream URL. (Thomas)
  - Added Config.in comment (Thomas)
  - Changed installed restorecond init.d script to S20restorecond (Thomas)
  - Removed host generic-package call from .mk file. (Thomas)
  selinux-python:
  - changed "selinux python" to "selinux-python" (Thomas)
  - Removed "packages" comment. (Thomas)
  - Removed "python3" comments. (Thomas)
  - Changed "SELinux Python" to "selinux-python" (Thomas)

Changes v4 -> v5:
  - Fix building the host variant of policycoreutils by removing make
    directories that no longer exist in HOST_POLICYCOREUTILS_MAKE_DIRS
    and from HOST_POLICYCOREUTILS_INSTALL_CMDS. (Matthew Weber)

Changes v5 -> v6:
  - None
  
Changes v6 -> v7:
  - Added package semodule-utils, without these utilities, audit2allow will
    fail to run.    
  - semodule-utils is selected if audit2allow is selected.

Changes v7 -> v8:
  - None.

Changes v8 -> v9:
  - None

 Config.in.legacy                                   |  29 +++
 DEVELOPERS                                         |   4 +-
 package/Config.in                                  |   4 +-
 ...IR-to-all-paths-that-use-an-absolute-path.patch | 120 ++-----------
 .../0002-Add-PREFIX-to-host-paths.patch            | 198 +++------------------
 .../0003-Remove-hardcoded-arch-variable.patch      |  43 -----
 ...licy-python-install-arguments-to-be-a-var.patch |  42 -----
 .../0005-Check-to-see-if-DBUS-is-enabled.patch     |  56 ------
 package/policycoreutils/Config.in                  |  43 -----
 package/policycoreutils/policycoreutils.hash       |   3 +-
 package/policycoreutils/policycoreutils.mk         |  42 +----
 package/restorecond/Config.in                      |  19 ++
 package/restorecond/restorecond.hash               |   2 +
 package/restorecond/restorecond.mk                 |  52 ++++++
 package/selinux-python/Config.in                   |  63 +++++++
 package/selinux-python/selinux-python.hash         |   2 +
 package/selinux-python/selinux-python.mk           |  50 ++++++
 package/semodule-utils/Config.in                   |  23 +++
 package/semodule-utils/semodule-utils.hash         |   2 +
 package/semodule-utils/semodule-utils.mk           |  27 +++
 package/sepolgen/Config.in                         |  19 --
 package/sepolgen/sepolgen.hash                     |   2 -
 package/sepolgen/sepolgen.mk                       |  49 -----
 23 files changed, 325 insertions(+), 569 deletions(-)
 delete mode 100644 package/policycoreutils/0003-Remove-hardcoded-arch-variable.patch
 delete mode 100644 package/policycoreutils/0004-Change-sepolicy-python-install-arguments-to-be-a-var.patch
 delete mode 100644 package/policycoreutils/0005-Check-to-see-if-DBUS-is-enabled.patch
 create mode 100644 package/restorecond/Config.in
 create mode 100644 package/restorecond/restorecond.hash
 create mode 100644 package/restorecond/restorecond.mk
 create mode 100644 package/selinux-python/Config.in
 create mode 100644 package/selinux-python/selinux-python.hash
 create mode 100644 package/selinux-python/selinux-python.mk
 create mode 100644 package/semodule-utils/Config.in
 create mode 100644 package/semodule-utils/semodule-utils.hash
 create mode 100644 package/semodule-utils/semodule-utils.mk
 delete mode 100644 package/sepolgen/Config.in
 delete mode 100644 package/sepolgen/sepolgen.hash
 delete mode 100644 package/sepolgen/sepolgen.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 748876880c..ea69f5a924 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,35 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.11"
 
+config BR2_PACKAGE_POLICYCOREUTILS_AUDIT2ALLOW
+	bool "policycoreutils audit2allow option removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_SELINUX_PYTHON
+	select BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW
+	help
+	  The policycoreutils package no longer offers audit2allow
+	  as a option. This package has been moved into the
+	  selinux-python package by the SELinux maintainers.
+
+config BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND
+	bool "policycoreutils restorecond option removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_RESTORECOND
+	help
+	  The policycoreutils package no longer offers restorecond
+	  as a option.  This package has been moved into a seperate
+	  package maintained by the SELinux maintainers.
+
+config BR2_PACKAGE_SEPOLGEN
+	bool "sepolgen package has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_SELINUX_PYTHON
+	select BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN
+	help
+	  Sepolgen is no longer a individual package, but instead has
+	  been moved into the selinux-python package by the SELinux
+	  maintainers.
+
 config BR2_PACKAGE_OPENOBEX_BLUEZ
 	bool "openobex bluez option removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index f35d6f3688..f52964bd90 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -41,8 +41,10 @@ F:	package/libsepol/
 F:	package/nginx-naxsi/
 F:	package/policycoreutils/
 F:	package/python-mutagen/
+F:	package/restorecond/
 F:	package/refpolicy/
-F:	package/sepolgen/
+F:	package/selinux-python/
+F:  package/semodule-utils/
 F:	package/setools/
 F:	package/sngrep/
 
diff --git a/package/Config.in b/package/Config.in
index aa0f2d7f8e..a3e678939a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1842,7 +1842,9 @@ menu "Security"
 	source "package/paxtest/Config.in"
 	source "package/policycoreutils/Config.in"
 	source "package/refpolicy/Config.in"
-	source "package/sepolgen/Config.in"
+	source "package/restorecond/Config.in"
+	source "package/selinux-python/Config.in"
+	source "package/semodule-utils/Config.in"
 	source "package/setools/Config.in"
 endmenu
 
diff --git a/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
index bbd6895e7f..3c0ddcc54b 100644
--- a/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
+++ b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
@@ -1,3 +1,8 @@
+From 85763549c53b2907dab094163f1404b2233f8029 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Adamduskett@outlook.com>
+Date: Mon, 9 Oct 2017 16:51:20 -0400
+Subject: [PATCH] Add DESTDIR to setfiles
+
 The addition of this patch makes the use of DESTDIR
 mandatory as there are conditional checks which would fail if it's not
 defined.
@@ -8,124 +13,23 @@ accomodate version 2.5
 Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
 Signed-off-by: Adam Duskett <AdamDuskett@outlook.com>
-Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 ---
- policycoreutils/Makefile             | 2 +-
- policycoreutils/newrole/Makefile     | 4 ++--
- policycoreutils/restorecond/Makefile | 5 +++--
- policycoreutils/run_init/Makefile    | 4 ++--
- policycoreutils/sepolicy/Makefile    | 2 +-
- policycoreutils/sestatus/Makefile    | 2 +-
- policycoreutils/setfiles/Makefile    | 4 ++--
- 7 files changed, 12 insertions(+), 11 deletions(-)
+ setfiles/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/Makefile b/Makefile
-index 962ac12..0634a2a 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,6 +1,6 @@
- SUBDIRS = sepolicy setfiles semanage load_policy newrole run_init sandbox secon audit2allow sestatus semodule_package semodule semodule_link semodule_expand semodule_deps sepolgen-ifgen setsebool scripts po man gui hll
- 
--INOTIFYH = $(shell ls /usr/include/sys/inotify.h 2>/dev/null)
-+INOTIFYH = $(shell ls $(DESTDIR)/usr/include/sys/inotify.h 2>/dev/null)
- 
- ifeq (${INOTIFYH}, /usr/include/sys/inotify.h)
- 	SUBDIRS += restorecond
-diff --git a/newrole/Makefile b/newrole/Makefile
-index 646cd4d..f124a6a 100644
---- a/newrole/Makefile
-+++ b/newrole/Makefile
-@@ -4,8 +4,8 @@ BINDIR ?= $(PREFIX)/bin
- MANDIR ?= $(PREFIX)/share/man
- ETCDIR ?= $(DESTDIR)/etc
- LOCALEDIR = /usr/share/locale
--PAMH = $(shell ls /usr/include/security/pam_appl.h 2>/dev/null)
--AUDITH = $(shell ls /usr/include/libaudit.h 2>/dev/null)
-+PAMH = $(shell ls $(DESTDIR)/usr/include/security/pam_appl.h 2>/dev/null)
-+AUDITH = $(shell ls $(DESTDIR)/usr/include/libaudit.h 2>/dev/null)
- # Enable capabilities to permit newrole to generate audit records.
- # This will make newrole a setuid root program.
- # The capabilities used are: CAP_AUDIT_WRITE.
-diff --git a/restorecond/Makefile b/restorecond/Makefile
-index f99e1e7..92a4a4d 100644
---- a/restorecond/Makefile
-+++ b/restorecond/Makefile
-@@ -11,11 +11,12 @@ autostart_DATA = sealertauto.desktop
- INITDIR ?= $(DESTDIR)/etc/rc.d/init.d
- SELINUXDIR = $(DESTDIR)/etc/selinux
- 
--DBUSFLAGS = -DHAVE_DBUS -I/usr/include/dbus-1.0 -I/usr/lib64/dbus-1.0/include -I/usr/lib/dbus-1.0/include
-+DBUSFLAGS = -DHAVE_DBUS -I$(DESTDIR)/usr/include/dbus-1.0 -I$(DESTDIR)/usr/lib64/dbus-1.0/include -I$(DESTDIR)/usr/lib/dbus-1.0/include
- DBUSLIB = -ldbus-glib-1 -ldbus-1
- 
- CFLAGS ?= -g -Werror -Wall -W
--override CFLAGS += -I$(PREFIX)/include $(DBUSFLAGS) -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/lib/glib-2.0/include
-+override CFLAGS += -I$(DESTDIR)/usr/include $(DBUSFLAGS) -I$(DESTDIR)/usr/include/glib-2.0 \
-+-I$(DESTDIR)/usr/lib64/glib-2.0/include -I$(DESTDIR)/usr/lib/glib-2.0/include
- 
- LDLIBS += -lselinux $(DBUSLIB) -lglib-2.0 -L$(LIBDIR)
- 
-diff --git a/run_init/Makefile b/run_init/Makefile
-index 5815a08..c81179b 100644
---- a/run_init/Makefile
-+++ b/run_init/Makefile
-@@ -5,8 +5,8 @@ SBINDIR ?= $(PREFIX)/sbin
- MANDIR ?= $(PREFIX)/share/man
- ETCDIR ?= $(DESTDIR)/etc
- LOCALEDIR ?= /usr/share/locale
--PAMH = $(shell ls /usr/include/security/pam_appl.h 2>/dev/null)
--AUDITH = $(shell ls /usr/include/libaudit.h 2>/dev/null)
-+PAMH = $(shell ls $(DESTDIR)/usr/include/security/pam_appl.h 2>/dev/null)
-+AUDITH = $(shell ls $(DESTDIR)/usr/include/libaudit.h 2>/dev/null)
- 
- CFLAGS ?= -Werror -Wall -W
- override CFLAGS += -I$(PREFIX)/include -DUSE_NLS -DLOCALEDIR="\"$(LOCALEDIR)\"" -DPACKAGE="\"policycoreutils\""
-diff --git a/sepolicy/Makefile b/sepolicy/Makefile
-index 39d46e8..6624373 100644
---- a/sepolicy/Makefile
-+++ b/sepolicy/Makefile
-@@ -12,7 +12,7 @@ LOCALEDIR ?= /usr/share/locale
- BASHCOMPLETIONDIR ?= $(DESTDIR)/usr/share/bash-completion/completions
- SHAREDIR ?= $(PREFIX)/share/sandbox
- CFLAGS ?= -Wall -Werror -Wextra -W
--override CFLAGS += -I$(PREFIX)/include -DPACKAGE="policycoreutils" -DSHARED -shared
-+override CFLAGS = $(LDFLAGS) -I$(DESTDIR)/usr/include -DPACKAGE="policycoreutils" -Wall -Werror -Wextra -W  -DSHARED -shared
- 
- BASHCOMPLETIONS=sepolicy-bash-completion.sh
- 
-diff --git a/sestatus/Makefile b/sestatus/Makefile
-index c04ff00..e10c32c 100644
---- a/sestatus/Makefile
-+++ b/sestatus/Makefile
-@@ -6,7 +6,7 @@ ETCDIR ?= $(DESTDIR)/etc
- LIBDIR ?= $(PREFIX)/lib
- 
- CFLAGS ?= -Werror -Wall -W
--override CFLAGS += -I$(PREFIX)/include -D_FILE_OFFSET_BITS=64
-+override CFLAGS += -I$(DESTDIR)/usr/include -D_FILE_OFFSET_BITS=64
- LDLIBS = -lselinux -L$(LIBDIR)
- 
- all: sestatus
 diff --git a/setfiles/Makefile b/setfiles/Makefile
-index 98f4f7d..eb26ed0 100644
+index c08e2dd..36c0638 100644
 --- a/setfiles/Makefile
 +++ b/setfiles/Makefile
-@@ -3,13 +3,13 @@ PREFIX ?= $(DESTDIR)/usr
+@@ -3,7 +3,7 @@ PREFIX ?= $(DESTDIR)/usr
  SBINDIR ?= $(DESTDIR)/sbin
  MANDIR = $(PREFIX)/share/man
  LIBDIR ?= $(PREFIX)/lib
--AUDITH = $(shell ls /usr/include/libaudit.h 2>/dev/null)
-+AUDITH = $(shell ls  $(DESTDIR)/usr/include/libaudit.h 2>/dev/null)
+-AUDITH ?= $(shell test -f /usr/include/libaudit.h && echo y)
++AUDITH ?= $(shell test -f $(DESTDIR)/include/libaudit.h && echo y)
  
- PROGRESS_STEP=$(shell grep "^\#define STAR_COUNT" restore.h | awk -S '{ print $$3 }')
  ABORT_ON_ERRORS=$(shell grep "^\#define ABORT_ON_ERRORS" setfiles.c | awk -S '{ print $$3 }')
  
- CFLAGS ?= -g -Werror -Wall -W
--override CFLAGS += -I$(PREFIX)/include
-+override CFLAGS += -I$(DESTDIR)/usr/include
- LDLIBS = -lselinux -lsepol -L$(LIBDIR)
- 
- ifeq ($(AUDITH), /usr/include/libaudit.h)
 -- 
-2.7.4
+2.13.6
 
diff --git a/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch b/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch
index 56aae74ba0..32d2ae92e6 100644
--- a/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch
+++ b/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch
@@ -1,6 +1,6 @@
-From 7f99a727cdb8160d49bb0d0554fc88787980c971 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Aduskett@gmail.com>
-Date: Thu, 14 Jul 2016 13:16:03 -0400
+From a221304344b3f9db7e86d928cf97d77542bcf456 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Adamduskett@outlook.com>
+Date: Mon, 9 Oct 2017 16:47:19 -0400
 Subject: [PATCH] Add PREFIX to host paths
 
 Updates the remaining hardcoded host paths used in the build to be
@@ -11,201 +11,59 @@ Updated to work with version 2.5
 Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
 Signed-off-by: Adam Duskett <AdamDuskett@outlook.com>
-Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 ---
- policycoreutils/Makefile              |  4 +++-
- policycoreutils/audit2allow/Makefile  |  2 +-
- policycoreutils/load_policy/Makefile  |  2 +-
- policycoreutils/mcstrans/src/Makefile | 17 +++++++++--------
- policycoreutils/newrole/Makefile      |  8 ++++----
- policycoreutils/run_init/Makefile     |  8 ++++----
- policycoreutils/sepolicy/Makefile     |  2 +-
- policycoreutils/setfiles/Makefile     |  4 ++--
- 8 files changed, 25 insertions(+), 22 deletions(-)
+ load_policy/Makefile | 2 +-
+ newrole/Makefile     | 6 +++---
+ run_init/Makefile    | 6 +++---
+ 3 files changed, 7 insertions(+), 7 deletions(-)
 
-diff --git a/Makefile b/Makefile
-index 0634a2a..bd99b1c 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,8 +1,10 @@
-+PREFIX  ?= $(DESTDIR)/usr
-+
- SUBDIRS = sepolicy setfiles semanage load_policy newrole run_init sandbox secon audit2allow sestatus semodule_package semodule semodule_link semodule_expand semodule_deps sepolgen-ifgen setsebool scripts po man gui hll
- 
- INOTIFYH = $(shell ls $(DESTDIR)/usr/include/sys/inotify.h 2>/dev/null)
- 
--ifeq (${INOTIFYH}, /usr/include/sys/inotify.h)
-+ifeq (${INOTIFYH}, $(PREFIX)/include/sys/inotify.h)
- 	SUBDIRS += restorecond
- endif
- 
-diff --git a/audit2allow/Makefile b/audit2allow/Makefile
-index 87d2502..d4108fe 100644
---- a/audit2allow/Makefile
-+++ b/audit2allow/Makefile
-@@ -5,7 +5,7 @@ PREFIX ?= $(DESTDIR)/usr
- BINDIR ?= $(PREFIX)/bin
- LIBDIR ?= $(PREFIX)/lib
- MANDIR ?= $(PREFIX)/share/man
--LOCALEDIR ?= /usr/share/locale
-+LOCALEDIR ?= $(PREFIX)/share/locale
- 
- all: audit2why
- 
 diff --git a/load_policy/Makefile b/load_policy/Makefile
-index 7c5bab0..5cd0bbb 100644
+index b85833c..6a45f31 100644
 --- a/load_policy/Makefile
 +++ b/load_policy/Makefile
-@@ -3,7 +3,7 @@ PREFIX ?= $(DESTDIR)/usr
+@@ -2,7 +2,7 @@
+ PREFIX ?= $(DESTDIR)/usr
  SBINDIR ?= $(DESTDIR)/sbin
- USRSBINDIR ?= $(PREFIX)/sbin
  MANDIR ?= $(PREFIX)/share/man
 -LOCALEDIR ?= /usr/share/locale
 +LOCALEDIR ?= $(PREFIX)/share/locale
  
  CFLAGS ?= -Werror -Wall -W
- override CFLAGS += $(LDFLAGS) -I$(PREFIX)/include -DUSE_NLS -DLOCALEDIR="\"$(LOCALEDIR)\"" -DPACKAGE="\"policycoreutils\""
-diff --git a/mcstrans/src/Makefile b/mcstrans/src/Makefile
-index 907a1f1..6fda57e 100644
---- a/mcstrans/src/Makefile
-+++ b/mcstrans/src/Makefile
-@@ -1,23 +1,24 @@
- ARCH = $(shell uname -i)
-+# Installation directories.
-+PREFIX  ?= $(DESTDIR)/usr
-+SBINDIR ?= $(DESTDIR)/sbin
-+INITDIR ?= $(DESTDIR)/etc/rc.d/init.d
-+SYSTEMDDIR ?= $(DESTDIR)/usr/lib/systemd
-+
- ifeq "$(ARCH)" "x86_64"
- 	# In case of 64 bit system, use these lines
--	LIBDIR=/usr/lib64
-+	LIBDIR=$(PREFIX)/lib64
- else 
- ifeq "$(ARCH)" "i686"
- 	# In case of 32 bit system, use these lines
--	LIBDIR=/usr/lib
-+	LIBDIR=$(PREFIX)/lib
- else
- ifeq "$(ARCH)" "i386"
- 	# In case of 32 bit system, use these lines
--	LIBDIR=/usr/lib
-+	LIBDIR=$(PREFIX)/lib
- endif
- endif
- endif
--# Installation directories.
--PREFIX  ?= $(DESTDIR)/usr
--SBINDIR ?= $(DESTDIR)/sbin
--INITDIR ?= $(DESTDIR)/etc/rc.d/init.d
--SYSTEMDDIR ?= $(DESTDIR)/usr/lib/systemd
- 
- PROG_SRC=mcstrans.c  mcscolor.c  mcstransd.c  mls_level.c
- PROG_OBJS= $(patsubst %.c,%.o,$(PROG_SRC))
+ override CFLAGS += $(LDFLAGS) -DUSE_NLS -DLOCALEDIR="\"$(LOCALEDIR)\"" -DPACKAGE="\"policycoreutils\""
 diff --git a/newrole/Makefile b/newrole/Makefile
-index f124a6a..b687a09 100644
+index 196af92..896708f 100644
 --- a/newrole/Makefile
 +++ b/newrole/Makefile
-@@ -3,7 +3,7 @@ PREFIX ?= $(DESTDIR)/usr
+@@ -3,9 +3,9 @@ PREFIX ?= $(DESTDIR)/usr
  BINDIR ?= $(PREFIX)/bin
  MANDIR ?= $(PREFIX)/share/man
  ETCDIR ?= $(DESTDIR)/etc
 -LOCALEDIR = /usr/share/locale
-+LOCALEDIR =  $(PREFIX)/share/locale
- PAMH = $(shell ls $(DESTDIR)/usr/include/security/pam_appl.h 2>/dev/null)
- AUDITH = $(shell ls $(DESTDIR)/usr/include/libaudit.h 2>/dev/null)
+-PAMH ?= $(shell test -f /usr/include/security/pam_appl.h && echo y)
+-AUDITH ?= $(shell test -f /usr/include/libaudit.h && echo y)
++LOCALEDIR = $(PREFIX)/share/locale
++PAMH ?= $(shell test -f $(PREFIX)/include/security/pam_appl.h && echo y)
++AUDITH ?= $(shell test -f $(PREFIX)/include/libaudit.h && echo y)
  # Enable capabilities to permit newrole to generate audit records.
-@@ -24,7 +24,7 @@ CFLAGS ?= -Werror -Wall -W
- EXTRA_OBJS =
- override CFLAGS += -DVERSION=\"$(VERSION)\" $(LDFLAGS) -I$(PREFIX)/include -DUSE_NLS -DLOCALEDIR="\"$(LOCALEDIR)\"" -DPACKAGE="\"policycoreutils\""
- LDLIBS += -lselinux -L$(PREFIX)/lib
--ifeq ($(PAMH), /usr/include/security/pam_appl.h)
-+ifeq ($(PAMH), $(PREFIX)/include/security/pam_appl.h)
- 	override CFLAGS += -DUSE_PAM
- 	EXTRA_OBJS += hashtab.o
- 	LDLIBS += -lpam -lpam_misc
-@@ -32,7 +32,7 @@ else
- 	override CFLAGS += -D_XOPEN_SOURCE=500
- 	LDLIBS += -lcrypt
- endif
--ifeq ($(AUDITH), /usr/include/libaudit.h)
-+ifeq ($(AUDITH), $(PREFIX)/include/libaudit.h)
- 	override CFLAGS += -DUSE_AUDIT
- 	LDLIBS += -laudit
- endif
-@@ -66,7 +66,7 @@ install: all
- 	test -d $(MANDIR)/man1 || install -m 755 -d $(MANDIR)/man1
- 	install -m $(MODE) newrole $(BINDIR)
- 	install -m 644 newrole.1 $(MANDIR)/man1/
--ifeq ($(PAMH), /usr/include/security/pam_appl.h)
-+ifeq ($(PAMH), $(PREFIX)/include/security/pam_appl.h)
- 	test -d $(ETCDIR)/pam.d || install -m 755 -d $(ETCDIR)/pam.d
- ifeq ($(LSPP_PRIV),y)
- 	install -m 644 newrole-lspp.pamd $(ETCDIR)/pam.d/newrole
+ # This will make newrole a setuid root program.
+ # The capabilities used are: CAP_AUDIT_WRITE.
 diff --git a/run_init/Makefile b/run_init/Makefile
-index c81179b..ce0df9f 100644
+index 921f0b0..e1566fc 100644
 --- a/run_init/Makefile
 +++ b/run_init/Makefile
-@@ -4,21 +4,21 @@ PREFIX ?= $(DESTDIR)/usr
+@@ -4,9 +4,9 @@ PREFIX ?= $(DESTDIR)/usr
  SBINDIR ?= $(PREFIX)/sbin
  MANDIR ?= $(PREFIX)/share/man
  ETCDIR ?= $(DESTDIR)/etc
 -LOCALEDIR ?= /usr/share/locale
+-PAMH ?= $(shell test -f /usr/include/security/pam_appl.h && echo y)
+-AUDITH ?= $(shell test -f /usr/include/libaudit.h && echo y)
 +LOCALEDIR ?= $(PREFIX)/share/locale
- PAMH = $(shell ls $(DESTDIR)/usr/include/security/pam_appl.h 2>/dev/null)
- AUDITH = $(shell ls $(DESTDIR)/usr/include/libaudit.h 2>/dev/null)
++PAMH ?= $(shell test -f $(PREFIX)/include/security/pam_appl.h && echo y)
++AUDITH ?= $(shell test -f $(PREFIX)/include/libaudit.h && echo y)
  
  CFLAGS ?= -Werror -Wall -W
- override CFLAGS += -I$(PREFIX)/include -DUSE_NLS -DLOCALEDIR="\"$(LOCALEDIR)\"" -DPACKAGE="\"policycoreutils\""
- LDLIBS += -lselinux -L$(PREFIX)/lib
--ifeq ($(PAMH), /usr/include/security/pam_appl.h)
-+ifeq ($(PAMH), $(PREFIX)/include/security/pam_appl.h)
- 	override CFLAGS += -DUSE_PAM
- 	LDLIBS += -lpam -lpam_misc
- else
- 	override CFLAGS += -D_XOPEN_SOURCE=500
- 	LDLIBS += -lcrypt
- endif
--ifeq ($(AUDITH), /usr/include/libaudit.h)
-+ifeq ($(AUDITH), $(PREFIX)/include/libaudit.h)
- 	override CFLAGS += -DUSE_AUDIT
- 	LDLIBS += -laudit
- endif
-@@ -38,7 +38,7 @@ install: all
- 	install -m 755 open_init_pty $(SBINDIR)
- 	install -m 644 run_init.8 $(MANDIR)/man8/
- 	install -m 644 open_init_pty.8 $(MANDIR)/man8/
--ifeq ($(PAMH), /usr/include/security/pam_appl.h)
-+ifeq ($(PAMH), $(PREFIX)/include/security/pam_appl.h)
- 	install -m 644 run_init.pamd $(ETCDIR)/pam.d/run_init
- endif
- 
-diff --git a/sepolicy/Makefile b/sepolicy/Makefile
-index 6624373..a16f8de 100644
---- a/sepolicy/Makefile
-+++ b/sepolicy/Makefile
-@@ -8,7 +8,7 @@ BINDIR ?= $(PREFIX)/bin
- SBINDIR ?= $(PREFIX)/sbin
- DATADIR ?= $(PREFIX)/share
- MANDIR ?= $(PREFIX)/share/man
--LOCALEDIR ?= /usr/share/locale
-+LOCALEDIR ?= $(PREFIX)/share/locale
- BASHCOMPLETIONDIR ?= $(DESTDIR)/usr/share/bash-completion/completions
- SHAREDIR ?= $(PREFIX)/share/sandbox
- CFLAGS ?= -Wall -Werror -Wextra -W
-diff --git a/setfiles/Makefile b/setfiles/Makefile
-index eb26ed0..3c6b80d 100644
---- a/setfiles/Makefile
-+++ b/setfiles/Makefile
-@@ -12,7 +12,7 @@ CFLAGS ?= -g -Werror -Wall -W
- override CFLAGS += -I$(DESTDIR)/usr/include
- LDLIBS = -lselinux -lsepol -L$(LIBDIR)
- 
--ifeq ($(AUDITH), /usr/include/libaudit.h)
-+ifeq ($(AUDITH), $(PREFIX)/include/libaudit.h)
- 	override CFLAGS += -DUSE_AUDIT
- 	LDLIBS += -laudit
- endif
+ override CFLAGS += -DUSE_NLS -DLOCALEDIR="\"$(LOCALEDIR)\"" -DPACKAGE="\"policycoreutils\""
 -- 
-2.7.4
+2.13.6
 
diff --git a/package/policycoreutils/0003-Remove-hardcoded-arch-variable.patch b/package/policycoreutils/0003-Remove-hardcoded-arch-variable.patch
deleted file mode 100644
index 375fb577f7..0000000000
--- a/package/policycoreutils/0003-Remove-hardcoded-arch-variable.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 7424f2bea0cb412e96202f596ad8077131589f40 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Aduskett@gmail.com>
-Date: Thu, 14 Jul 2016 13:18:24 -0400
-Subject: [PATCH] Remove hardcoded arch variable.
-
-Allow the ARCH value to be passed in as original configuration was
-solely based on host architecture.
-
-This patch was updated to work with version 2.5
-
-Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
-Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
-Signed-off-by: Adam Duskett <AdamDuskett@outlook.com>
-Signed-off-by: Adam Duskett <Aduskett@gmail.com>
----
- policycoreutils/mcstrans/src/Makefile   | 1 -
- policycoreutils/mcstrans/utils/Makefile | 1 -
- 2 files changed, 2 deletions(-)
-
-diff --git a/mcstrans/src/Makefile b/mcstrans/src/Makefile
-index 6fda57e..7b4489f 100644
---- a/mcstrans/src/Makefile
-+++ b/mcstrans/src/Makefile
-@@ -1,4 +1,3 @@
--ARCH = $(shell uname -i)
- # Installation directories.
- PREFIX  ?= $(DESTDIR)/usr
- SBINDIR ?= $(DESTDIR)/sbin
-diff --git a/mcstrans/utils/Makefile b/mcstrans/utils/Makefile
-index 1ffb027..912fe12 100644
---- a/mcstrans/utils/Makefile
-+++ b/mcstrans/utils/Makefile
-@@ -2,7 +2,6 @@
- PREFIX ?= $(DESTDIR)/usr
- BINDIR ?= $(PREFIX)/sbin
- 
--ARCH = $(shell uname -i)
- ifeq "$(ARCH)" "x86_64"
-         # In case of 64 bit system, use these lines
-         LIBDIR=/usr/lib64
--- 
-2.7.4
-
diff --git a/package/policycoreutils/0004-Change-sepolicy-python-install-arguments-to-be-a-var.patch b/package/policycoreutils/0004-Change-sepolicy-python-install-arguments-to-be-a-var.patch
deleted file mode 100644
index 636b722b70..0000000000
--- a/package/policycoreutils/0004-Change-sepolicy-python-install-arguments-to-be-a-var.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 27fd1c85ca95b5d66ab0241a08242a75b60b375c Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Aduskett@gmail.com>
-Date: Thu, 14 Jul 2016 13:22:57 -0400
-Subject: [PATCH] Change sepolicy python install arguments to be a variable
-
-To allow the python install arguments to be overwritten, change the
-arguments to be a variable. This also cleans up the DESTDIR detection a
-little bit.
-
-Updated to work with version 2.5
-
-Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
-Signed-off-by: Adam Duskett <AdamDuskett@outlook.com>
-Signed-off-by: Adam Duskett <Aduskett@gmail.com>
----
- policycoreutils/sepolicy/Makefile | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/sepolicy/Makefile b/sepolicy/Makefile
-index a16f8de..2013301 100644
---- a/sepolicy/Makefile
-+++ b/sepolicy/Makefile
-@@ -1,4 +1,7 @@
- PYTHON ?= python
-+ifneq ($(DESTDIR),)
-+PYTHON_INSTALL_ARGS ?= --root $(DESTDIR)
-+endif
- 
- # Installation directories.
- PREFIX ?= $(DESTDIR)/usr
-@@ -32,7 +35,7 @@ test:
- 	@$(PYTHON) test_sepolicy.py -v
- 
- install:
--	$(PYTHON) setup.py install `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
-+	$(PYTHON) setup.py install $(PYTHON_INSTALL_ARGS)
- 	[ -d $(BINDIR) ] || mkdir -p $(BINDIR)
- 	install -m 755 sepolicy.py $(BINDIR)/sepolicy
- 	(cd $(BINDIR); ln -sf sepolicy sepolgen)
--- 
-2.7.4
-
diff --git a/package/policycoreutils/0005-Check-to-see-if-DBUS-is-enabled.patch b/package/policycoreutils/0005-Check-to-see-if-DBUS-is-enabled.patch
deleted file mode 100644
index 37ffac8de8..0000000000
--- a/package/policycoreutils/0005-Check-to-see-if-DBUS-is-enabled.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From d1bc28c5b2efe60a0ee04d9c171928d0f3475654 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Aduskett@gmail.com>
-Date: Thu, 14 Jul 2016 13:26:23 -0400
-Subject: [PATCH] Check to see if DBUS is enabled.
-
-Adds a condition to prevent linking against dbus when at build time
-dbus has not been enabled.
-
-Updated for 2.5.
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
-Signed-off-by: Adam Duskett <AdamDuskett@outlook.com>
-Signed-off-by: Adam Duskett <Aduskett@gmail.com>
----
- policycoreutils/restorecond/Makefile | 2 ++
- policycoreutils/restorecond/user.c   | 2 +-
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/restorecond/Makefile b/restorecond/Makefile
-index 92a4a4d..95f38a6 100644
---- a/restorecond/Makefile
-+++ b/restorecond/Makefile
-@@ -11,8 +11,10 @@ autostart_DATA = sealertauto.desktop
- INITDIR ?= $(DESTDIR)/etc/rc.d/init.d
- SELINUXDIR = $(DESTDIR)/etc/selinux
- 
-+ifdef ENABLE_DBUS
- DBUSFLAGS = -DHAVE_DBUS -I$(DESTDIR)/usr/include/dbus-1.0 -I$(DESTDIR)/usr/lib64/dbus-1.0/include -I$(DESTDIR)/usr/lib/dbus-1.0/include
- DBUSLIB = -ldbus-glib-1 -ldbus-1
-+endif
- 
- CFLAGS ?= -g -Werror -Wall -W
- override CFLAGS += -I$(DESTDIR)/usr/include $(DBUSFLAGS) -I$(DESTDIR)/usr/include/glib-2.0 \
-diff --git a/restorecond/user.c b/restorecond/user.c
-index 714aae7..a04cddb 100644
---- a/restorecond/user.c
-+++ b/restorecond/user.c
-@@ -54,7 +54,6 @@ static const char *PATH="/org/selinux/Restorecond";
- static const char *INTERFACE="org.selinux.RestorecondIface";
- static const char *RULE="type='signal',interface='org.selinux.RestorecondIface'";
- 
--static int local_lock_fd = -1;
- 
- static DBusHandlerResult
- signal_filter (DBusConnection *connection  __attribute__ ((__unused__)), DBusMessage *message, void *user_data)
-@@ -101,6 +100,7 @@ static int dbus_server(GMainLoop *loop) {
- #include <selinux/selinux.h>
- #include <sys/file.h>
- 
-+static int local_lock_fd = -1;
- /* size of the event structure, not counting name */
- #define EVENT_SIZE  (sizeof (struct inotify_event))
- /* reasonable guess as to size of 1024 events */
--- 
-2.7.4
-
diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
index 6b58d6ea33..0d69fb51a5 100644
--- a/package/policycoreutils/Config.in
+++ b/package/policycoreutils/Config.in
@@ -28,54 +28,11 @@ config BR2_PACKAGE_POLICYCOREUTILS
 	  The base package will install the following utilities:
 	      load_policy
 	      newrole
-	      restorecond
 	      run_init
 	      secon
 	      semodule
-	      semodule_deps
-	      semodule_expand
-	      semodule_link
-	      semodule_package
-	      sepolgen-ifgen
 	      sestatus
 	      setfiles
 	      setsebool
 
 	  http://selinuxproject.org/page/Main_Page
-
-if BR2_PACKAGE_POLICYCOREUTILS
-
-config BR2_PACKAGE_POLICYCOREUTILS_AUDIT2ALLOW
-	bool "audit2allow"
-	depends on BR2_USE_WCHAR # python3, sepolgen
-	depends on BR2_USE_MMU # python3, sepolgen
-	depends on BR2_TOOLCHAIN_HAS_THREADS # python3, sepolgen, checkpolicy
-	depends on !BR2_STATIC_LIBS # python3, sepolgen
-	depends on BR2_TOOLCHAIN_USES_GLIBC # checkpolicy
-	depends on !BR2_arc # checkpolicy
-	select BR2_PACKAGE_SEPOLGEN
-	select BR2_PACKAGE_CHECKPOLICY
-	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
-	help
-	  Enable audit2allow to be built
-
-comment "audit2allow needs a glibc toolchain w/ wchar, threads, dynamic library"
-	depends on BR2_USE_MMU
-	depends on !BR2_arc
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
-
-config BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND
-	bool "restorecond"
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	select BR2_PACKAGE_LIBGLIB2
-	help
-	  Enable restorecond to be built
-
-comment "restorecond needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
-endif
diff --git a/package/policycoreutils/policycoreutils.hash b/package/policycoreutils/policycoreutils.hash
index 999a7788d2..241905ca22 100644
--- a/package/policycoreutils/policycoreutils.hash
+++ b/package/policycoreutils/policycoreutils.hash
@@ -1,2 +1,3 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 68891b376f5048edc53c6ccb2fca44da3dc7f4563f4b6894e201d70c04a05a29 policycoreutils-2.6.tar.gz
+sha256 0a1b8a4a323b854981c6755ff025fe98a0f1cff307f109abb260f0490f13e4f4 policycoreutils-2.7.tar.gz
+sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 6fec4afb25..21c5470cec 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-POLICYCOREUTILS_VERSION = 2.6
-POLICYCOREUTILS_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014
+POLICYCOREUTILS_VERSION = 2.7
+POLICYCOREUTILS_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804
 POLICYCOREUTILS_LICENSE = GPL-2.0
 POLICYCOREUTILS_LICENSE_FILES = COPYING
 
@@ -41,28 +41,8 @@ POLICYCOREUTILS_MAKE_OPTS += \
 
 POLICYCOREUTILS_MAKE_DIRS = \
 	load_policy newrole run_init \
-	secon semodule semodule_deps \
-	semodule_expand semodule_link \
-	semodule_package sepolgen-ifgen \
-	sestatus setfiles setsebool
-
-ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_RESTORECOND),y)
-POLICYCOREUTILS_MAKE_DIRS += restorecond
-POLICYCOREUTILS_DEPENDENCIES += libglib2
-endif
-
-ifeq ($(BR2_PACKAGE_POLICYCOREUTILS_AUDIT2ALLOW),y)
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-POLICYCOREUTILS_DEPENDENCIES += python3
-POLICYCOREUTILS_MAKE_OPTS += PYLIBVER="python$(PYTHON3_VERSION_MAJOR)"
-else
-POLICYCOREUTILS_DEPENDENCIES += python
-POLICYCOREUTILS_MAKE_OPTS += PYLIBVER="python$(PYTHON_VERSION_MAJOR)"
-endif
-
-POLICYCOREUTILS_DEPENDENCIES += sepolgen checkpolicy
-POLICYCOREUTILS_MAKE_DIRS += audit2allow
-endif
+	secon semodule sestatus setfiles \
+	setsebool
 
 # We need to pass DESTDIR at build time because it's used by
 # policycoreutils build system to find headers and libraries.
@@ -81,8 +61,7 @@ define POLICYCOREUTILS_INSTALL_TARGET_CMDS
 endef
 
 HOST_POLICYCOREUTILS_DEPENDENCIES = \
-	host-libsemanage host-dbus-glib \
-	host-sepolgen host-setools
+	host-libsemanage host-dbus-glib host-setools
 
 # Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
 # large file support.
@@ -112,10 +91,9 @@ endif
 
 # Note: We are only building the programs required by the refpolicy build
 HOST_POLICYCOREUTILS_MAKE_DIRS = \
-	load_policy semodule semodule_deps \
-	semodule_expand semodule_link \
-	semodule_package setfiles restorecond \
-	audit2allow scripts semanage sepolicy
+	load_policy newrole run_init \
+	secon semodule sestatus setfiles \
+	setsebool
 
 define HOST_POLICYCOREUTILS_BUILD_CMDS
 	$(foreach d,$(HOST_POLICYCOREUTILS_MAKE_DIRS),
@@ -127,10 +105,6 @@ define HOST_POLICYCOREUTILS_INSTALL_CMDS
 	$(foreach d,$(HOST_POLICYCOREUTILS_MAKE_DIRS),
 		$(MAKE) -C $(@D)/$(d) $(HOST_POLICYCOREUTILS_MAKE_OPTS) install
 	)
-	# Fix python paths
-	$(SED) 's%/usr/bin/%$(HOST_DIR)/bin/%g' $(HOST_DIR)/bin/audit2allow
-	$(SED) 's%/usr/bin/%$(HOST_DIR)/bin/%g' $(HOST_DIR)/bin/sepolgen-ifgen
-	$(SED) 's%/usr/bin/%$(HOST_DIR)/bin/%g' $(HOST_DIR)/bin/sepolicy
 endef
 
 $(eval $(generic-package))
diff --git a/package/restorecond/Config.in b/package/restorecond/Config.in
new file mode 100644
index 0000000000..46fcec1dc2
--- /dev/null
+++ b/package/restorecond/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_RESTORECOND
+	bool "restorecond"
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_TOOLCHAIN_USES_GLIBC #libselinux
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_LIBSELINUX
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  restorecond is a daemon that watches for file creation and
+	  then sets the default SELinux file context for that file.
+	  
+	  https://github.com/SELinuxProject/selinux/wiki/Releases
+	  
+comment "restorecond needs a toolchain w/ glibc, wchar, threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_MMU || \
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/restorecond/restorecond.hash b/package/restorecond/restorecond.hash
new file mode 100644
index 0000000000..f52bbd2161
--- /dev/null
+++ b/package/restorecond/restorecond.hash
@@ -0,0 +1,2 @@
+# https://github.com/SELinuxProject/selinux/wiki/Releases
+sha256 cb8e0a8d706cb2c1f105125f3514dffffefcbcfb49199183a7f91ab0bdf1f24d restorecond-2.7.tar.gz
diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
new file mode 100644
index 0000000000..31a7110ac6
--- /dev/null
+++ b/package/restorecond/restorecond.mk
@@ -0,0 +1,52 @@
+################################################################################
+#
+# restorecond
+#
+################################################################################
+
+RESTORECOND_VERSION = 2.7
+RESTORECOND_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804
+RESTORECOND_LICENSE = GPL-2.0
+RESTORECOND_LICENSE_FILES = COPYING
+
+RESTORECOND_DEPENDENCIES = libglib2 libselinux dbus-glib
+
+# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
+# large file support.
+# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
+RESTORECOND_MAKE_OPTS += \
+	$(TARGET_CONFIGURE_OPTS) \
+	CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
+	CPPFLAGS="$(TARGET_CPPFLAGS) -U_FILE_OFFSET_BITS" \
+	ARCH="$(BR2_ARCH)"
+
+# We need to pass DESTDIR at build time because it's used by
+# restorecond build system to find headers and libraries.
+define RESTORECOND_BUILD_CMDS
+	$(MAKE) -C $(@D) $(RESTORECOND_MAKE_OPTS) DESTDIR=$(STAGING_DIR) all
+endef
+
+define RESTORECOND_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D $(@D)/restorecond.init \
+		$(TARGET_DIR)/etc/init.d/S20restorecond
+endef
+
+define RESTORECOND_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -m 0644 -D $(@D)/restorecond.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/restorecond.service
+    
+    mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+    ln -fs ../../../../usr/lib/systemd/system/restorecond.service \
+        $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/restorecond.service
+
+	$(INSTALL) -m 0600 -D $(@D)/org.selinux.Restorecond.service \
+		$(TARGET_DIR)/etc/systemd/system/org.selinux.Restorecond.service
+endef
+
+define RESTORECOND_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/restorecond.conf $(TARGET_DIR)/etc/selinux/restorecond.conf
+	$(INSTALL) -m 0644 -D $(@D)/restorecond_user.conf $(TARGET_DIR)/etc/selinux/restorecond_user.conf
+	$(INSTALL) -m 0755 -D $(@D)/restorecond $(TARGET_DIR)/usr/sbin/restorecond
+endef
+
+$(eval $(generic-package))
diff --git a/package/selinux-python/Config.in b/package/selinux-python/Config.in
new file mode 100644
index 0000000000..44fdc1e4e6
--- /dev/null
+++ b/package/selinux-python/Config.in
@@ -0,0 +1,63 @@
+menuconfig BR2_PACKAGE_SELINUX_PYTHON
+	bool "selinux-python"
+	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
+	depends on BR2_USE_MMU
+	depends on BR2_USE_WCHAR 
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	help
+	  A set of SELinux tools written in python that help with
+	  managing a system with SELinux enabled. If no packages are
+	  selected nothing will actually be built.
+	  https://github.com/SELinuxProject/selinux/wiki
+
+if BR2_PACKAGE_SELINUX_PYTHON
+
+config BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW
+	bool "audit2allow"
+	depends on BR2_USE_WCHAR # sepolgen
+	depends on BR2_USE_MMU # sepolgen
+	depends on BR2_TOOLCHAIN_HAS_THREADS # sepolgen, checkpolicy
+	depends on !BR2_STATIC_LIBS # sepolgen
+	depends on BR2_TOOLCHAIN_USES_GLIBC # checkpolicy
+	depends on !BR2_arc # checkpolicy
+	select BR2_PACKAGE_CHECKPOLICY
+	select BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN
+	select BR2_PACKAGE_SEMODULE_UTILS
+	help
+	  This module installs two programs:
+  	  
+  	  audit2allow - Generate SELinux policy allow/dontaudit rules
+  	  from logs of denied operations.
+  	  
+  	  audit2why - translates SELinux audit messages into a
+  	  description of why the access was denied (audit2allow -w)
+
+comment "audit2allow needs a glibc toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_arc
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
+
+config BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN
+	bool "sepolgen"
+	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_SEMODULE_UTILS
+	help
+	  This package contains a Python module that allows you to
+	  generate an initial SELinux policy module template.
+
+comment "sepolgen needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
+
+endif
+
+comment "selinux-python packages needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
diff --git a/package/selinux-python/selinux-python.hash b/package/selinux-python/selinux-python.hash
new file mode 100644
index 0000000000..42fe575e7b
--- /dev/null
+++ b/package/selinux-python/selinux-python.hash
@@ -0,0 +1,2 @@
+# https://github.com/SELinuxProject/selinux/wiki/Releases
+sha256 4217cb965ecda96c91e15ffcc2e7ddd13ecc2bf5631100f3cd072a7616f140ed selinux-python-2.7.tar.gz
diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
new file mode 100644
index 0000000000..9a4622da44
--- /dev/null
+++ b/package/selinux-python/selinux-python.mk
@@ -0,0 +1,50 @@
+################################################################################
+#
+# selinux-python
+#
+################################################################################
+
+SELINUX_PYTHON_VERSION = 2.7
+SELINUX_PYTHON_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804
+SELINUX_PYTHON_LICENSE = GPL-2.0
+SELINUX_PYTHON_LICENSE_FILES = COPYING
+
+SELINUX_PYTHON_MAKE_OPTS += \
+	$(TARGET_CONFIGURE_OPTS) \
+	ARCH="$(BR2_ARCH)" \
+	LIBDIR="$(STAGING_DIR)/usr/lib"
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+SELINUX_PYTHON_DEPENDENCIES += python3
+SELINUX_PYTHON_MAKE_OPTS += \
+	PYTHONLIBDIR="usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+else
+SELINUX_PYTHON_DEPENDENCIES += python
+SELINUX_PYTHON_MAKE_OPTS += \
+	PYTHONLIBDIR="usr/lib/python$(PYTHON_VERSION_MAJOR)"
+endif
+
+ifeq ($(BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW),y)
+SELINUX_PYTHON_DEPENDENCIES += checkpolicy
+SELINUX_PYTHON_MAKE_DIRS += audit2allow
+endif
+
+ifeq ($(BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN),y)
+SELINUX_PYTHON_MAKE_DIRS += sepolgen/src/sepolgen
+endif
+
+define SELINUX_PYTHON_BUILD_CMDS
+	$(foreach d,$(SELINUX_PYTHON_MAKE_DIRS),
+		$(MAKE) -C $(@D)/$(d) $(SELINUX_PYTHON_MAKE_OPTS) \
+			DESTDIR=$(STAGING_DIR) all
+	)
+endef
+
+define SELINUX_PYTHON_INSTALL_TARGET_CMDS
+	$(foreach d,$(SELINUX_PYTHON_MAKE_DIRS),
+		$(MAKE) -C $(@D)/$(d) $(SELINUX_PYTHON_MAKE_OPTS) \
+			DESTDIR=$(TARGET_DIR) install
+	)
+endef
+
+$(eval $(generic-package))
diff --git a/package/semodule-utils/Config.in b/package/semodule-utils/Config.in
new file mode 100644
index 0000000000..6dc59ba501
--- /dev/null
+++ b/package/semodule-utils/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_SEMODULE_UTILS
+	bool "semodule-utils"
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_TOOLCHAIN_USES_GLIBC #libselinux
+	select BR2_PACKAGE_LIBSEPOL
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  semodule-utils is a package that contains tools for handling
+	  selinux modules.
+	  
+	  The package will install the following utilities:
+  	  * semodule_deps - Show the dependencies between SELinux policy packages.
+  	  * semodule_expand - Expand a SELinux policy module package.
+  	  * semodule_link - Link SELinux policy module packages together
+	  * semodule_package - Create a SELinux policy module package.
+	  
+	  https://github.com/SELinuxProject/selinux/wiki/Releases
+	  
+comment "semodule-utils needs a toolchain w/ glibc, wchar, threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_MMU || \
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/semodule-utils/semodule-utils.hash b/package/semodule-utils/semodule-utils.hash
new file mode 100644
index 0000000000..18c8217ca6
--- /dev/null
+++ b/package/semodule-utils/semodule-utils.hash
@@ -0,0 +1,2 @@
+# https://github.com/SELinuxProject/selinux/wiki/Releases
+sha256 90c98b3362a43b4da2a51a9176820a56f3e615225e23e3395bc566c4490786ba semodule-utils-2.7.tar.gz
diff --git a/package/semodule-utils/semodule-utils.mk b/package/semodule-utils/semodule-utils.mk
new file mode 100644
index 0000000000..2c8923f82e
--- /dev/null
+++ b/package/semodule-utils/semodule-utils.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# semodule-utils
+#
+################################################################################
+
+SEMODULE_UTILS_VERSION = 2.7
+SEMODULE_UTILS_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804
+SEMODULE_UTILS_LICENSE = GPL-2.0
+SEMODULE_UTILS_LICENSE_FILES = COPYING
+SEMODULE_UTILS_DEPENDENCIES = libselinux
+
+SEMODULE_UTILS_MAKE_OPTS += \
+	$(TARGET_CONFIGURE_OPTS) \
+	LIBSEPOLA=$(STAGING_DIR)/usr/lib/libsepol.a
+
+# We need to pass DESTDIR at build time because it's used by
+# semodule-utils build system to find headers and libraries.
+define SEMODULE_UTILS_BUILD_CMDS
+	$(MAKE) -C $(@D) $(SEMODULE_UTILS_MAKE_OPTS) DESTDIR=$(STAGING_DIR) all
+endef
+
+define SEMODULE_UTILS_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) $(SEMODULE_UTILS_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
diff --git a/package/sepolgen/Config.in b/package/sepolgen/Config.in
deleted file mode 100644
index 8dd90388c8..0000000000
--- a/package/sepolgen/Config.in
+++ /dev/null
@@ -1,19 +0,0 @@
-config BR2_PACKAGE_SEPOLGEN
-	bool "sepolgen"
-	depends on BR2_USE_WCHAR # python3
-	depends on BR2_USE_MMU # python3
-	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
-	depends on !BR2_STATIC_LIBS # python3
-	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
-	help
-	  This package contains a Python module that forms the core of
-	  the modern audit2allow (which is a part of the package
-	  policycoreutils).  It contains infrastructure for parsing
-	  SELinux related messages as produced by the audit system.
-	  It has facilities for generating policy based on required
-	  access.
-
-comment "sepolgen needs a toolchain w/ wchar, threads, dynamic library"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
diff --git a/package/sepolgen/sepolgen.hash b/package/sepolgen/sepolgen.hash
deleted file mode 100644
index b338a7019f..0000000000
--- a/package/sepolgen/sepolgen.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 6a327b1576d914e57ad796a541a7a9bcceefb14c445355559993de0fdb8e7a60  sepolgen-2.6.tar.gz
diff --git a/package/sepolgen/sepolgen.mk b/package/sepolgen/sepolgen.mk
deleted file mode 100644
index ab7f18d857..0000000000
--- a/package/sepolgen/sepolgen.mk
+++ /dev/null
@@ -1,49 +0,0 @@
-################################################################################
-#
-# sepolgen
-#
-################################################################################
-
-SEPOLGEN_VERSION = 2.6
-SEPOLGEN_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014
-SEPOLGEN_LICENSE = GPL-2.0
-SEPOLGEN_LICENSE_FILES = COPYING
-
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-SEPOLGEN_DEPENDENCIES = python3
-SEPOLGEN_MAKE_CMDS = $(TARGET_CONFIGURE_OPTS) \
-	PYTHONLIBDIR=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
-else
-SEPOLGEN_DEPENDENCIES = python
-SEPOLGEN_MAKE_CMDS = $(TARGET_CONFIGURE_OPTS) \
-	PYTHONLIBDIR=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
-endif
-
-define SEPOLGEN_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_SEPOLGEN_MAKE_CMDS) DESTDIR=$(TARGET_DIR)
-endef
-
-define SEPOLGEN_INSTALL_TARGET_CMDS
-	$(MAKE_ENV) $(MAKE) -C $(@D) $(SEPOLGEN_MAKE_CMDS) DESTDIR=$(TARGET_DIR) install
-endef
-
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-HOST_SEPOLGEN_DEPENDENCIES = host-python3
-HOST_SEPOLGEN_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
-	PYTHONLIBDIR=lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
-else
-HOST_SEPOLGEN_DEPENDENCIES = host-python
-HOST_SEPOLGEN_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
-	PYTHONLIBDIR=lib/python$(PYTHON_VERSION_MAJOR)/site-packages
-endif
-
-define HOST_SEPOLGEN_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_SEPOLGEN_MAKE_CMDS) DESTDIR=$(HOST_DIR)
-endef
-
-define HOST_SEPOLGEN_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_SEPOLGEN_MAKE_CMDS) DESTDIR=$(HOST_DIR) install
-endef
-
-$(eval $(generic-package))
-$(eval $(host-generic-package))
-- 
2.13.6
