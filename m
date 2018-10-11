From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 22:02:00 +0200
Subject: [Buildroot] [git commit] libsemanage: bump to version 2.8
Message-ID: <20181011200602.2BEA882DD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af79f3b3b73c22024ca8f0008335ac881a9da1b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (already in version), see:
  https://github.com/SELinuxProject/selinux/commit/e15f61e5d2fe74c6e7c0a5f81083a93b508c35f7
- Add hash for license file
- Drop -L from PYTHONLIBDIR, which is now really used as a path, and
  not as flags.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...build-follow-standard-semantics-for-DESTD.patch | 118 ---------------------
 package/libsemanage/libsemanage.hash               |   5 +-
 package/libsemanage/libsemanage.mk                 |   8 +-
 3 files changed, 8 insertions(+), 123 deletions(-)

diff --git a/package/libsemanage/0001-libsemanage-build-follow-standard-semantics-for-DESTD.patch b/package/libsemanage/0001-libsemanage-build-follow-standard-semantics-for-DESTD.patch
deleted file mode 100644
index 47ac6bded5..0000000000
--- a/package/libsemanage/0001-libsemanage-build-follow-standard-semantics-for-DESTD.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-libsemanage: build: follow standard semantics for DESTDIR and PREFIX
-
-This patch solves the following issues:
-- DESTDIR is needed during compile time to compute library and header paths which it should not.
-- Installing with both DESTDIR and PREFIX set gives us odd paths
-- Make usage of DESTDIR and PREFIX more standard
-
-Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
-
-diff -durN libsemanage.orig/include/Makefile libsemanage/include/Makefile
---- libsemanage.orig/include/Makefile	2018-01-12 12:42:30.915376458 +0100
-+++ libsemanage/include/Makefile	2018-01-12 10:04:18.632144240 +0100
-@@ -1,6 +1,6 @@
- # Installation directories.
--PREFIX ?= $(DESTDIR)/usr
--INCDIR ?= $(PREFIX)/include/semanage
-+PREFIX ?= /usr
-+INCDIR ?= $(DESTDIR)$(PREFIX)/include/semanage
- 
- all:
- 
-diff -durN libsemanage.orig/man/Makefile libsemanage/man/Makefile
---- libsemanage.orig/man/Makefile	2018-01-12 12:42:30.915376458 +0100
-+++ libsemanage/man/Makefile	2018-01-12 10:04:18.632144240 +0100
-@@ -1,6 +1,7 @@
- # Installation directories.
--MAN3DIR ?= $(DESTDIR)/usr/share/man/man3
--MAN5DIR ?= $(DESTDIR)/usr/share/man/man5
-+PREFIX ?= /usr
-+MAN3DIR ?= $(DESTDIR)$(PREFIX)/share/man/man3
-+MAN5DIR ?= $(DESTDIR)$(PREFIX)/share/man/man5
- 
- all:
- 
-diff -durN libsemanage.orig/src/libsemanage.pc.in libsemanage/src/libsemanage.pc.in
---- libsemanage.orig/src/libsemanage.pc.in	2018-01-12 12:42:30.918709792 +0100
-+++ libsemanage/src/libsemanage.pc.in	2018-01-12 10:04:18.632144240 +0100
-@@ -1,6 +1,6 @@
- prefix=@prefix@
- exec_prefix=${prefix}
--libdir=${exec_prefix}/@libdir@
-+libdir=@libdir@
- includedir=@includedir@
- 
- Name: libsemanage
-diff -durN libsemanage.orig/src/Makefile libsemanage/src/Makefile
---- libsemanage.orig/src/Makefile	2018-01-12 12:42:30.918709792 +0100
-+++ libsemanage/src/Makefile	2018-01-12 10:04:18.632144240 +0100
-@@ -8,10 +8,10 @@
- PKG_CONFIG ?= pkg-config
- 
- # Installation directories.
--PREFIX ?= $(DESTDIR)/usr
-+PREFIX ?= /usr
- LIBDIR ?= $(PREFIX)/lib
--SHLIBDIR ?= $(DESTDIR)/lib
- INCLUDEDIR ?= $(PREFIX)/include
-+LIBINSTALL = $(DESTDIR)$(LIBDIR)
- PYINC ?= $(shell $(PKG_CONFIG) --cflags $(PYPREFIX))
- PYLIBS ?= $(shell $(PKG_CONFIG) --libs $(PYPREFIX))
- PYSITEDIR ?= $(DESTDIR)$(shell $(PYTHON) -c 'import site; print(site.getsitepackages()[0])')
-@@ -20,8 +20,6 @@
- RUBYLIBS ?= $(shell $(RUBY) -e 'puts "-L" + RbConfig::CONFIG["libdir"] + " -L" + RbConfig::CONFIG["archlibdir"] + " " + RbConfig::CONFIG["LIBRUBYARG_SHARED"]')
- RUBYINSTALL ?= $(DESTDIR)$(shell $(RUBY) -e 'puts RbConfig::CONFIG["vendorarchdir"]')
- 
--LIBBASE=$(shell basename $(LIBDIR))
--
- DEFAULT_SEMANAGE_CONF_LOCATION=$(DESTDIR)/etc/selinux/semanage.conf
- 
- ifeq ($(DEBUG),1)
-@@ -95,7 +93,7 @@
- 	ln -sf $@ $(TARGET)
- 
- $(LIBPC): $(LIBPC).in ../VERSION
--	sed -e 's/@VERSION@/$(VERSION)/; s:@prefix@:$(PREFIX):; s:@libdir@:$(LIBBASE):; s:@includedir@:$(INCLUDEDIR):' < $< > $@
-+	sed -e 's/@VERSION@/$(VERSION)/; s:@prefix@:$(PREFIX):; s:@libdir@:$(LIBDIR):; s:@includedir@:$(INCLUDEDIR):' < $< > $@
- 
- semanageswig_python_exception.i: ../include/semanage/semanage.h
- 	bash -e exception.sh > $@ || (rm -f $@ ; false)
-@@ -136,13 +134,13 @@
- 	$(SWIG) $<
- 
- install: all 
--	test -d $(LIBDIR) || install -m 755 -d $(LIBDIR)
--	install -m 644 $(LIBA) $(LIBDIR)
--	install -m 755 $(LIBSO) $(LIBDIR)
--	test -d $(LIBDIR)/pkgconfig || install -m 755 -d $(LIBDIR)/pkgconfig
--	install -m 644 $(LIBPC) $(LIBDIR)/pkgconfig
-+	test -d $(LIBINSTALL) || install -m 755 -d $(LIBINSTALL)
-+	install -m 644 $(LIBA) $(LIBINSTALL)
-+	install -m 755 $(LIBSO) $(LIBINSTALL)
-+	test -d $(LIBINSTALL)/pkgconfig || install -m 755 -d $(LIBINSTALL)/pkgconfig
-+	install -m 644 $(LIBPC) $(LIBINSTALL)/pkgconfig
- 	test -f $(DEFAULT_SEMANAGE_CONF_LOCATION) || install -m 644 -D semanage.conf $(DEFAULT_SEMANAGE_CONF_LOCATION)
--	cd $(LIBDIR) && ln -sf $(LIBSO) $(TARGET)
-+	cd $(LIBINSTALL) && ln -sf $(LIBSO) $(TARGET)
- 
- install-pywrap: pywrap 
- 	test -d $(PYSITEDIR) || install -m 755 -d $(PYSITEDIR)
-@@ -155,7 +153,7 @@
- 	install -m 755 $(SWIGRUBYSO) $(RUBYINSTALL)/semanage.so
- 
- relabel:
--	/sbin/restorecon $(LIBDIR)/$(LIBSO)
-+	/sbin/restorecon $(LIBINSTALL)/$(LIBSO)
- 
- clean: 
- 	-rm -f $(LIBPC) $(OBJS) $(LOBJS) $(LIBA) $(LIBSO) $(SWIGLOBJ) $(SWIGSO) $(SWIGRUBYSO) $(TARGET) conf-parse.c conf-parse.h conf-scan.c *.o *.lo *~
-diff -durN libsemanage.orig/tests/Makefile libsemanage/tests/Makefile
---- libsemanage.orig/tests/Makefile	2018-01-12 12:42:30.922043125 +0100
-+++ libsemanage/tests/Makefile	2018-01-12 10:04:18.632144240 +0100
-@@ -1,6 +1,3 @@
--PREFIX ?= $(DESTDIR)/usr
--LIBDIR ?= $(PREFIX)/lib
--
- # Add your test source files here:
- SOURCES = $(sort $(wildcard *.c))
- 
diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
index c386571591..5315514003 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,2 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 07e9477714ce6a4557a1fe924ea4cb06501b62d0fa0e3c0dc32a2cf47cb8d476 libsemanage-2.7.tar.gz
+sha256 1c0de8d2c51e5460926c21e371105c84a39087dfd8f8e9f0cc1d017e4cbea8e2 libsemanage-2.8.tar.gz
+
+# Hash for license file
+sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index b6e50e2848..d554a33356 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSEMANAGE_VERSION = 2.7
-LIBSEMANAGE_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804
+LIBSEMANAGE_VERSION = 2.8
+LIBSEMANAGE_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20180524
 LIBSEMANAGE_LICENSE = LGPL-2.1+
 LIBSEMANAGE_LICENSE_FILES = COPYING
 LIBSEMANAGE_DEPENDENCIES = host-bison host-flex audit libselinux ustr bzip2
@@ -37,13 +37,13 @@ ifeq ($(BR2_PACKAGE_PYTHON3),y)
 HOST_LIBSEMANAGE_DEPENDENCIES += host-python3
 HOST_LIBSEMANAGE_MAKE_OPTS += \
 	PYINC="-I$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR)m/" \
-	PYTHONLIBDIR="-L$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/" \
+	PYTHONLIBDIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/" \
 	PYLIBVER="python$(PYTHON3_VERSION_MAJOR)"
 else
 HOST_LIBSEMANAGE_DEPENDENCIES += host-python
 HOST_LIBSEMANAGE_MAKE_OPTS += \
 	PYINC="-I$(HOST_DIR)/include/python$(PYTHON_VERSION_MAJOR)/" \
-	PYTHONLIBDIR="-L$(HOST_DIR)/lib/python$(PYTHON_VERSION_MAJOR)/" \
+	PYTHONLIBDIR="$(HOST_DIR)/lib/python$(PYTHON_VERSION_MAJOR)/" \
 	PYLIBVER="python$(PYTHON_VERSION_MAJOR)"
 endif
 
