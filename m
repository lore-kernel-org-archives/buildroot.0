From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jan 2018 23:22:25 +0100
Subject: [Buildroot] [git commit] libsemanage: add patch to make the build
 process more standard
Message-ID: <20180116224330.E559F81339@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36186c5f11636468a9a1e7457c983fc588aec1c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch the Makefiles to make PREFIX and DESTDIR follow standard
semantics to get rid of DESTDIR during compile time in
libsemanage.mk and generate proper pkg-config files.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...build-follow-standard-semantics-for-DESTD.patch | 118 +++++++++++++++++++++
 package/libsemanage/libsemanage.mk                 |   6 +-
 2 files changed, 119 insertions(+), 5 deletions(-)

diff --git a/package/libsemanage/0002-libsemanage-build-follow-standard-semantics-for-DESTD.patch b/package/libsemanage/0002-libsemanage-build-follow-standard-semantics-for-DESTD.patch
new file mode 100644
index 0000000..47ac6bd
--- /dev/null
+++ b/package/libsemanage/0002-libsemanage-build-follow-standard-semantics-for-DESTD.patch
@@ -0,0 +1,118 @@
+libsemanage: build: follow standard semantics for DESTDIR and PREFIX
+
+This patch solves the following issues:
+- DESTDIR is needed during compile time to compute library and header paths which it should not.
+- Installing with both DESTDIR and PREFIX set gives us odd paths
+- Make usage of DESTDIR and PREFIX more standard
+
+Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
+
+diff -durN libsemanage.orig/include/Makefile libsemanage/include/Makefile
+--- libsemanage.orig/include/Makefile	2018-01-12 12:42:30.915376458 +0100
++++ libsemanage/include/Makefile	2018-01-12 10:04:18.632144240 +0100
+@@ -1,6 +1,6 @@
+ # Installation directories.
+-PREFIX ?= $(DESTDIR)/usr
+-INCDIR ?= $(PREFIX)/include/semanage
++PREFIX ?= /usr
++INCDIR ?= $(DESTDIR)$(PREFIX)/include/semanage
+ 
+ all:
+ 
+diff -durN libsemanage.orig/man/Makefile libsemanage/man/Makefile
+--- libsemanage.orig/man/Makefile	2018-01-12 12:42:30.915376458 +0100
++++ libsemanage/man/Makefile	2018-01-12 10:04:18.632144240 +0100
+@@ -1,6 +1,7 @@
+ # Installation directories.
+-MAN3DIR ?= $(DESTDIR)/usr/share/man/man3
+-MAN5DIR ?= $(DESTDIR)/usr/share/man/man5
++PREFIX ?= /usr
++MAN3DIR ?= $(DESTDIR)$(PREFIX)/share/man/man3
++MAN5DIR ?= $(DESTDIR)$(PREFIX)/share/man/man5
+ 
+ all:
+ 
+diff -durN libsemanage.orig/src/libsemanage.pc.in libsemanage/src/libsemanage.pc.in
+--- libsemanage.orig/src/libsemanage.pc.in	2018-01-12 12:42:30.918709792 +0100
++++ libsemanage/src/libsemanage.pc.in	2018-01-12 10:04:18.632144240 +0100
+@@ -1,6 +1,6 @@
+ prefix=@prefix@
+ exec_prefix=${prefix}
+-libdir=${exec_prefix}/@libdir@
++libdir=@libdir@
+ includedir=@includedir@
+ 
+ Name: libsemanage
+diff -durN libsemanage.orig/src/Makefile libsemanage/src/Makefile
+--- libsemanage.orig/src/Makefile	2018-01-12 12:42:30.918709792 +0100
++++ libsemanage/src/Makefile	2018-01-12 10:04:18.632144240 +0100
+@@ -8,10 +8,10 @@
+ PKG_CONFIG ?= pkg-config
+ 
+ # Installation directories.
+-PREFIX ?= $(DESTDIR)/usr
++PREFIX ?= /usr
+ LIBDIR ?= $(PREFIX)/lib
+-SHLIBDIR ?= $(DESTDIR)/lib
+ INCLUDEDIR ?= $(PREFIX)/include
++LIBINSTALL = $(DESTDIR)$(LIBDIR)
+ PYINC ?= $(shell $(PKG_CONFIG) --cflags $(PYPREFIX))
+ PYLIBS ?= $(shell $(PKG_CONFIG) --libs $(PYPREFIX))
+ PYSITEDIR ?= $(DESTDIR)$(shell $(PYTHON) -c 'import site; print(site.getsitepackages()[0])')
+@@ -20,8 +20,6 @@
+ RUBYLIBS ?= $(shell $(RUBY) -e 'puts "-L" + RbConfig::CONFIG["libdir"] + " -L" + RbConfig::CONFIG["archlibdir"] + " " + RbConfig::CONFIG["LIBRUBYARG_SHARED"]')
+ RUBYINSTALL ?= $(DESTDIR)$(shell $(RUBY) -e 'puts RbConfig::CONFIG["vendorarchdir"]')
+ 
+-LIBBASE=$(shell basename $(LIBDIR))
+-
+ DEFAULT_SEMANAGE_CONF_LOCATION=$(DESTDIR)/etc/selinux/semanage.conf
+ 
+ ifeq ($(DEBUG),1)
+@@ -95,7 +93,7 @@
+ 	ln -sf $@ $(TARGET)
+ 
+ $(LIBPC): $(LIBPC).in ../VERSION
+-	sed -e 's/@VERSION@/$(VERSION)/; s:@prefix@:$(PREFIX):; s:@libdir@:$(LIBBASE):; s:@includedir@:$(INCLUDEDIR):' < $< > $@
++	sed -e 's/@VERSION@/$(VERSION)/; s:@prefix@:$(PREFIX):; s:@libdir@:$(LIBDIR):; s:@includedir@:$(INCLUDEDIR):' < $< > $@
+ 
+ semanageswig_python_exception.i: ../include/semanage/semanage.h
+ 	bash -e exception.sh > $@ || (rm -f $@ ; false)
+@@ -136,13 +134,13 @@
+ 	$(SWIG) $<
+ 
+ install: all 
+-	test -d $(LIBDIR) || install -m 755 -d $(LIBDIR)
+-	install -m 644 $(LIBA) $(LIBDIR)
+-	install -m 755 $(LIBSO) $(LIBDIR)
+-	test -d $(LIBDIR)/pkgconfig || install -m 755 -d $(LIBDIR)/pkgconfig
+-	install -m 644 $(LIBPC) $(LIBDIR)/pkgconfig
++	test -d $(LIBINSTALL) || install -m 755 -d $(LIBINSTALL)
++	install -m 644 $(LIBA) $(LIBINSTALL)
++	install -m 755 $(LIBSO) $(LIBINSTALL)
++	test -d $(LIBINSTALL)/pkgconfig || install -m 755 -d $(LIBINSTALL)/pkgconfig
++	install -m 644 $(LIBPC) $(LIBINSTALL)/pkgconfig
+ 	test -f $(DEFAULT_SEMANAGE_CONF_LOCATION) || install -m 644 -D semanage.conf $(DEFAULT_SEMANAGE_CONF_LOCATION)
+-	cd $(LIBDIR) && ln -sf $(LIBSO) $(TARGET)
++	cd $(LIBINSTALL) && ln -sf $(LIBSO) $(TARGET)
+ 
+ install-pywrap: pywrap 
+ 	test -d $(PYSITEDIR) || install -m 755 -d $(PYSITEDIR)
+@@ -155,7 +153,7 @@
+ 	install -m 755 $(SWIGRUBYSO) $(RUBYINSTALL)/semanage.so
+ 
+ relabel:
+-	/sbin/restorecon $(LIBDIR)/$(LIBSO)
++	/sbin/restorecon $(LIBINSTALL)/$(LIBSO)
+ 
+ clean: 
+ 	-rm -f $(LIBPC) $(OBJS) $(LOBJS) $(LIBA) $(LIBSO) $(SWIGLOBJ) $(SWIGSO) $(SWIGRUBYSO) $(TARGET) conf-parse.c conf-parse.h conf-scan.c *.o *.lo *~
+diff -durN libsemanage.orig/tests/Makefile libsemanage/tests/Makefile
+--- libsemanage.orig/tests/Makefile	2018-01-12 12:42:30.922043125 +0100
++++ libsemanage/tests/Makefile	2018-01-12 10:04:18.632144240 +0100
+@@ -1,6 +1,3 @@
+-PREFIX ?= $(DESTDIR)/usr
+-LIBDIR ?= $(PREFIX)/lib
+-
+ # Add your test source files here:
+ SOURCES = $(sort $(wildcard *.c))
+ 
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 829409f..b6e50e2 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -14,9 +14,7 @@ LIBSEMANAGE_INSTALL_STAGING = YES
 LIBSEMANAGE_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
 
 define LIBSEMANAGE_BUILD_CMDS
-	# DESTDIR is needed during the compile to compute library and
-	# header paths.
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(STAGING_DIR) all
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS) all
 endef
 
 define LIBSEMANAGE_INSTALL_STAGING_CMDS
@@ -30,10 +28,8 @@ endef
 HOST_LIBSEMANAGE_DEPENDENCIES = host-bison host-audit host-libsepol host-libselinux \
 				host-ustr host-bzip2 host-swig
 
-# DESTDIR is needed during the compile to compute library and header paths.
 HOST_LIBSEMANAGE_MAKE_OPTS += \
 	$(HOST_CONFIGURE_OPTS) \
-	DESTDIR=$(HOST_DIR) \
 	PREFIX=$(HOST_DIR) \
 	SWIG_LIB="$(HOST_DIR)/share/swig/$(SWIG_VERSION)/"
 
