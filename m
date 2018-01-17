From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 22:24:22 +0100
Subject: [Buildroot] [git commit] selinux-python: add patch to make the
 build process more standard
Message-ID: <20180117212637.9E5B183EE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab491361694063e7231a34a4a42a176511dc6d13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch the Makefiles to make PREFIX and DESTDIR follow standard
semantics to get rid of DESTDIR during compile time in
selinux-python.mk.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...build-follow-standard-semantics-for-DESTD.patch | 117 +++++++++++++++++++++
 package/selinux-python/selinux-python.mk           |   2 +-
 2 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/package/selinux-python/0001-python-build-follow-standard-semantics-for-DESTD.patch b/package/selinux-python/0001-python-build-follow-standard-semantics-for-DESTD.patch
new file mode 100644
index 0000000..156701a
--- /dev/null
+++ b/package/selinux-python/0001-python-build-follow-standard-semantics-for-DESTD.patch
@@ -0,0 +1,117 @@
+python: build: follow standard semantics for DESTDIR and PREFIX
+
+Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
+
+diff -durN python.orig/audit2allow/Makefile python/audit2allow/Makefile
+--- python.orig/audit2allow/Makefile	2017-08-04 15:31:00.000000000 +0200
++++ python/audit2allow/Makefile	2018-01-17 09:44:35.659573123 +0100
+@@ -1,19 +1,17 @@
+ PYTHON ?= python
+ 
+ # Installation directories.
+-PREFIX ?= $(DESTDIR)/usr
+-BINDIR ?= $(PREFIX)/bin
+-LIBDIR ?= $(PREFIX)/lib
+-MANDIR ?= $(PREFIX)/share/man
+-LOCALEDIR ?= /usr/share/locale
+-INCLUDEDIR ?= $(PREFIX)/include
+-LIBSEPOLA ?= $(LIBDIR)/libsepol.a
++PREFIX ?= /usr
++BINDIR ?= $(DESTDIR)$(PREFIX)/bin
++LIBDIR ?= $(DESTDIR)$(PREFIX)/lib
++MANDIR ?= $(DESTDIR)$(PREFIX)/share/man
+ 
+ CFLAGS ?= -Werror -Wall -W
+ 
+ all: audit2why sepolgen-ifgen-attr-helper
+ 
+-sepolgen-ifgen-attr-helper: sepolgen-ifgen-attr-helper.o $(LIBSEPOLA)
++sepolgen-ifgen-attr-helper: sepolgen-ifgen-attr-helper.o
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ -l:libsepol.a
+ 
+ audit2why:
+ 	ln -sf audit2allow audit2why
+diff -durN python.orig/chcat/Makefile python/chcat/Makefile
+--- python.orig/chcat/Makefile	2017-08-04 15:31:00.000000000 +0200
++++ python/chcat/Makefile	2018-01-17 09:44:35.659573123 +0100
+@@ -1,8 +1,8 @@
+ # Installation directories.
+-PREFIX ?= $(DESTDIR)/usr
+-BINDIR ?= $(PREFIX)/bin
+-MANDIR ?= $(PREFIX)/share/man
+-LOCALEDIR ?= $(PREFIX)/share/locale
++PREFIX ?= /usr
++BINDIR ?= $(DESTDIR)$(PREFIX)/bin
++MANDIR ?= $(DESTDIR)$(PREFIX)/share/man
++LOCALEDIR ?= $(DESTDIR)$(PREFIX)/share/locale
+ 
+ .PHONY: all
+ all: chcat
+diff -durN python.orig/semanage/Makefile python/semanage/Makefile
+--- python.orig/semanage/Makefile	2017-08-04 15:31:00.000000000 +0200
++++ python/semanage/Makefile	2018-01-17 09:44:43.676239705 +0100
+@@ -1,13 +1,12 @@
+ PYTHON ?= python
+ 
+ # Installation directories.
+-PREFIX ?= $(DESTDIR)/usr
+-LIBDIR ?= $(PREFIX)/lib
+-SBINDIR ?= $(PREFIX)/sbin
+-MANDIR = $(PREFIX)/share/man
+-PYTHONLIBDIR ?= $(shell $(PYTHON) -c "from distutils.sysconfig import *; print(get_python_lib(1))")
++PREFIX ?= /usr
++SBINDIR ?= $(DESTDIR)$(PREFIX)/sbin
++MANDIR = $(DESTDIR)$(PREFIX)/share/man
++PYTHONLIBDIR ?= $(shell $(PYTHON) -c "from distutils.sysconfig import *; print(get_python_lib(prefix='$(PREFIX)'))")
+ PACKAGEDIR ?= $(DESTDIR)/$(PYTHONLIBDIR)
+-BASHCOMPLETIONDIR ?= $(DESTDIR)/usr/share/bash-completion/completions
++BASHCOMPLETIONDIR ?= $(DESTDIR)$(PREFIX)/share/bash-completion/completions
+ 
+ TARGETS=semanage
+ 
+diff -durN python.orig/sepolgen/src/sepolgen/Makefile python/sepolgen/src/sepolgen/Makefile
+--- python.orig/sepolgen/src/sepolgen/Makefile	2017-08-04 15:31:00.000000000 +0200
++++ python/sepolgen/src/sepolgen/Makefile	2018-01-17 09:44:35.659573123 +0100
+@@ -1,5 +1,6 @@
++PREFIX ?= /usr
+ PYTHON ?= python
+-PYTHONLIBDIR ?= $(shell $(PYTHON) -c "from distutils.sysconfig import *; print(get_python_lib(1))")
++PYTHONLIBDIR ?= $(shell $(PYTHON) -c "from distutils.sysconfig import *; print(get_python_lib(prefix='$(PREFIX)'))")
+ PACKAGEDIR ?= $(DESTDIR)/$(PYTHONLIBDIR)/sepolgen
+ 
+ all:
+diff -durN python.orig/sepolicy/Makefile python/sepolicy/Makefile
+--- python.orig/sepolicy/Makefile	2017-08-04 15:31:00.000000000 +0200
++++ python/sepolicy/Makefile	2018-01-17 09:44:35.659573123 +0100
+@@ -1,14 +1,14 @@
+ PYTHON ?= python
+ 
+ # Installation directories.
+-PREFIX ?= $(DESTDIR)/usr
+-LIBDIR ?= $(PREFIX)/lib
+-BINDIR ?= $(PREFIX)/bin
+-DATADIR ?= $(PREFIX)/share
+-MANDIR ?= $(PREFIX)/share/man
+-LOCALEDIR ?= /usr/share/locale
+-BASHCOMPLETIONDIR ?= $(DESTDIR)/usr/share/bash-completion/completions
+-SHAREDIR ?= $(PREFIX)/share/sandbox
++PREFIX ?= /usr
++LIBDIR ?= $(DESTDIR)$(PREFIX)/lib
++BINDIR ?= $(DESTDIR)$(PREFIX)/bin
++DATADIR ?= $(DESTDIR)$(PREFIX)/share
++MANDIR ?= $(DESTDIR)$(PREFIX)/share/man
++LOCALEDIR ?= $(DESTDIR)$(PREFIX)/share/locale
++BASHCOMPLETIONDIR ?= $(DESTDIR)$(PREFIX)/share/bash-completion/completions
++SHAREDIR ?= $(DESTDIR)$(PREFIX)/share/sandbox
+ CFLAGS ?= -Wall -Werror -Wextra -W
+ override CFLAGS += -DPACKAGE="policycoreutils" -DSHARED -shared
+ 
+@@ -30,7 +30,7 @@
+ 	@$(PYTHON) test_sepolicy.py -v
+ 
+ install:
+-	$(PYTHON) setup.py install `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
++	$(PYTHON) setup.py install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR)`
+ 	[ -d $(BINDIR) ] || mkdir -p $(BINDIR)
+ 	install -m 755 sepolicy.py $(BINDIR)/sepolicy
+ 	(cd $(BINDIR); ln -sf sepolicy sepolgen)
diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
index 9a4622d..25a2d04 100644
--- a/package/selinux-python/selinux-python.mk
+++ b/package/selinux-python/selinux-python.mk
@@ -36,7 +36,7 @@ endif
 define SELINUX_PYTHON_BUILD_CMDS
 	$(foreach d,$(SELINUX_PYTHON_MAKE_DIRS),
 		$(MAKE) -C $(@D)/$(d) $(SELINUX_PYTHON_MAKE_OPTS) \
-			DESTDIR=$(STAGING_DIR) all
+			all
 	)
 endef
 
