From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 11 Oct 2018 21:37:06 +0200
Subject: [Buildroot] [PATCH v3,7/8] selinux-python: bump to version 2.8
In-Reply-To: <20181011193707.20510-1-fontaine.fabrice@gmail.com>
References: <20181011193707.20510-1-fontaine.fabrice@gmail.com>
Message-ID: <20181011193707.20510-7-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove first patch (alread in version), see:
  https://github.com/SELinuxProject/selinux/commit/11aaf180ef128551d9f8d65dbd32961e99670914
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (after review of Thomas Petazzoni):
 - move removal of symlink in libselinux.mk and libsepol.mk in a
   dedicated patch
 - Set back usage of DESTDIR and use SHLIBDIR instead for host variant
 - Add a comment for usage of SHLIBDIR in target variant

Changes v1 -> v2 (after review of Matthew Weber and Marcus Folkesson):
 - fix build failure of host packages: use DESTDIR instead of
   PREFIX=$(HOST_DIR) to install host variant of libselinux, libsepol,
   libsemanage
 - Remove libselinux.so and libsepol.so symbolic link (not needed)

 ...-follow-standard-semantics-for-DESTD.patch | 117 ------------------
 package/selinux-python/selinux-python.hash    |   5 +-
 package/selinux-python/selinux-python.mk      |   4 +-
 3 files changed, 6 insertions(+), 120 deletions(-)
 delete mode 100644 package/selinux-python/0001-python-build-follow-standard-semantics-for-DESTD.patch

diff --git a/package/selinux-python/0001-python-build-follow-standard-semantics-for-DESTD.patch b/package/selinux-python/0001-python-build-follow-standard-semantics-for-DESTD.patch
deleted file mode 100644
index 156701a818..0000000000
--- a/package/selinux-python/0001-python-build-follow-standard-semantics-for-DESTD.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-python: build: follow standard semantics for DESTDIR and PREFIX
-
-Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
-
-diff -durN python.orig/audit2allow/Makefile python/audit2allow/Makefile
---- python.orig/audit2allow/Makefile	2017-08-04 15:31:00.000000000 +0200
-+++ python/audit2allow/Makefile	2018-01-17 09:44:35.659573123 +0100
-@@ -1,19 +1,17 @@
- PYTHON ?= python
- 
- # Installation directories.
--PREFIX ?= $(DESTDIR)/usr
--BINDIR ?= $(PREFIX)/bin
--LIBDIR ?= $(PREFIX)/lib
--MANDIR ?= $(PREFIX)/share/man
--LOCALEDIR ?= /usr/share/locale
--INCLUDEDIR ?= $(PREFIX)/include
--LIBSEPOLA ?= $(LIBDIR)/libsepol.a
-+PREFIX ?= /usr
-+BINDIR ?= $(DESTDIR)$(PREFIX)/bin
-+LIBDIR ?= $(DESTDIR)$(PREFIX)/lib
-+MANDIR ?= $(DESTDIR)$(PREFIX)/share/man
- 
- CFLAGS ?= -Werror -Wall -W
- 
- all: audit2why sepolgen-ifgen-attr-helper
- 
--sepolgen-ifgen-attr-helper: sepolgen-ifgen-attr-helper.o $(LIBSEPOLA)
-+sepolgen-ifgen-attr-helper: sepolgen-ifgen-attr-helper.o
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ -l:libsepol.a
- 
- audit2why:
- 	ln -sf audit2allow audit2why
-diff -durN python.orig/chcat/Makefile python/chcat/Makefile
---- python.orig/chcat/Makefile	2017-08-04 15:31:00.000000000 +0200
-+++ python/chcat/Makefile	2018-01-17 09:44:35.659573123 +0100
-@@ -1,8 +1,8 @@
- # Installation directories.
--PREFIX ?= $(DESTDIR)/usr
--BINDIR ?= $(PREFIX)/bin
--MANDIR ?= $(PREFIX)/share/man
--LOCALEDIR ?= $(PREFIX)/share/locale
-+PREFIX ?= /usr
-+BINDIR ?= $(DESTDIR)$(PREFIX)/bin
-+MANDIR ?= $(DESTDIR)$(PREFIX)/share/man
-+LOCALEDIR ?= $(DESTDIR)$(PREFIX)/share/locale
- 
- .PHONY: all
- all: chcat
-diff -durN python.orig/semanage/Makefile python/semanage/Makefile
---- python.orig/semanage/Makefile	2017-08-04 15:31:00.000000000 +0200
-+++ python/semanage/Makefile	2018-01-17 09:44:43.676239705 +0100
-@@ -1,13 +1,12 @@
- PYTHON ?= python
- 
- # Installation directories.
--PREFIX ?= $(DESTDIR)/usr
--LIBDIR ?= $(PREFIX)/lib
--SBINDIR ?= $(PREFIX)/sbin
--MANDIR = $(PREFIX)/share/man
--PYTHONLIBDIR ?= $(shell $(PYTHON) -c "from distutils.sysconfig import *; print(get_python_lib(1))")
-+PREFIX ?= /usr
-+SBINDIR ?= $(DESTDIR)$(PREFIX)/sbin
-+MANDIR = $(DESTDIR)$(PREFIX)/share/man
-+PYTHONLIBDIR ?= $(shell $(PYTHON) -c "from distutils.sysconfig import *; print(get_python_lib(prefix='$(PREFIX)'))")
- PACKAGEDIR ?= $(DESTDIR)/$(PYTHONLIBDIR)
--BASHCOMPLETIONDIR ?= $(DESTDIR)/usr/share/bash-completion/completions
-+BASHCOMPLETIONDIR ?= $(DESTDIR)$(PREFIX)/share/bash-completion/completions
- 
- TARGETS=semanage
- 
-diff -durN python.orig/sepolgen/src/sepolgen/Makefile python/sepolgen/src/sepolgen/Makefile
---- python.orig/sepolgen/src/sepolgen/Makefile	2017-08-04 15:31:00.000000000 +0200
-+++ python/sepolgen/src/sepolgen/Makefile	2018-01-17 09:44:35.659573123 +0100
-@@ -1,5 +1,6 @@
-+PREFIX ?= /usr
- PYTHON ?= python
--PYTHONLIBDIR ?= $(shell $(PYTHON) -c "from distutils.sysconfig import *; print(get_python_lib(1))")
-+PYTHONLIBDIR ?= $(shell $(PYTHON) -c "from distutils.sysconfig import *; print(get_python_lib(prefix='$(PREFIX)'))")
- PACKAGEDIR ?= $(DESTDIR)/$(PYTHONLIBDIR)/sepolgen
- 
- all:
-diff -durN python.orig/sepolicy/Makefile python/sepolicy/Makefile
---- python.orig/sepolicy/Makefile	2017-08-04 15:31:00.000000000 +0200
-+++ python/sepolicy/Makefile	2018-01-17 09:44:35.659573123 +0100
-@@ -1,14 +1,14 @@
- PYTHON ?= python
- 
- # Installation directories.
--PREFIX ?= $(DESTDIR)/usr
--LIBDIR ?= $(PREFIX)/lib
--BINDIR ?= $(PREFIX)/bin
--DATADIR ?= $(PREFIX)/share
--MANDIR ?= $(PREFIX)/share/man
--LOCALEDIR ?= /usr/share/locale
--BASHCOMPLETIONDIR ?= $(DESTDIR)/usr/share/bash-completion/completions
--SHAREDIR ?= $(PREFIX)/share/sandbox
-+PREFIX ?= /usr
-+LIBDIR ?= $(DESTDIR)$(PREFIX)/lib
-+BINDIR ?= $(DESTDIR)$(PREFIX)/bin
-+DATADIR ?= $(DESTDIR)$(PREFIX)/share
-+MANDIR ?= $(DESTDIR)$(PREFIX)/share/man
-+LOCALEDIR ?= $(DESTDIR)$(PREFIX)/share/locale
-+BASHCOMPLETIONDIR ?= $(DESTDIR)$(PREFIX)/share/bash-completion/completions
-+SHAREDIR ?= $(DESTDIR)$(PREFIX)/share/sandbox
- CFLAGS ?= -Wall -Werror -Wextra -W
- override CFLAGS += -DPACKAGE="policycoreutils" -DSHARED -shared
- 
-@@ -30,7 +30,7 @@
- 	@$(PYTHON) test_sepolicy.py -v
- 
- install:
--	$(PYTHON) setup.py install `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
-+	$(PYTHON) setup.py install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
- 	[ -d $(BINDIR) ] || mkdir -p $(BINDIR)
- 	install -m 755 sepolicy.py $(BINDIR)/sepolicy
- 	(cd $(BINDIR); ln -sf sepolicy sepolgen)
diff --git a/package/selinux-python/selinux-python.hash b/package/selinux-python/selinux-python.hash
index 42fe575e7b..99965004fc 100644
--- a/package/selinux-python/selinux-python.hash
+++ b/package/selinux-python/selinux-python.hash
@@ -1,2 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 4217cb965ecda96c91e15ffcc2e7ddd13ecc2bf5631100f3cd072a7616f140ed selinux-python-2.7.tar.gz
+sha256 e69f5e24820cb247a3d881a9c90efba1e64d76af863c82fb81bc3b87ed71e238 selinux-python-2.8.tar.gz
+
+# Hash for license file
+sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
index 25a2d04105..2de55f33cb 100644
--- a/package/selinux-python/selinux-python.mk
+++ b/package/selinux-python/selinux-python.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SELINUX_PYTHON_VERSION = 2.7
-SELINUX_PYTHON_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804
+SELINUX_PYTHON_VERSION = 2.8
+SELINUX_PYTHON_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20180524
 SELINUX_PYTHON_LICENSE = GPL-2.0
 SELINUX_PYTHON_LICENSE_FILES = COPYING
 
-- 
2.17.1
