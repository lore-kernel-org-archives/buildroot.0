From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 16 Jan 2018 09:21:53 +0100
Subject: [Buildroot] [PATCH] libselinux: add patch to make the build process
 more standard
Message-ID: <20180116082153.8425-1-marcus.folkesson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch the Makefiles to make PREFIX and DESTDIR follow standard
semantics to get rid of DESTDIR during compile time in
libselinux.mk and generate proper pkg-config files.

Fixes:
 http://autobuild.buildroot.net/results/74d27370c7623e89e401203a485193340e992e7c/

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 ...build-follow-standard-semantics-for-DESTD.patch | 137 +++++++++++++++++++++
 package/libselinux/0003-revert-ln-relative.patch   |  24 ----
 package/libselinux/0004-revert-ln-relative.patch   |  24 ++++
 package/libselinux/libselinux.mk                   |   8 +-
 4 files changed, 163 insertions(+), 30 deletions(-)
 create mode 100644 package/libselinux/0003-libselinux-build-follow-standard-semantics-for-DESTD.patch
 delete mode 100644 package/libselinux/0003-revert-ln-relative.patch
 create mode 100644 package/libselinux/0004-revert-ln-relative.patch

diff --git a/package/libselinux/0003-libselinux-build-follow-standard-semantics-for-DESTD.patch b/package/libselinux/0003-libselinux-build-follow-standard-semantics-for-DESTD.patch
new file mode 100644
index 0000000000..089eef414e
--- /dev/null
+++ b/package/libselinux/0003-libselinux-build-follow-standard-semantics-for-DESTD.patch
@@ -0,0 +1,137 @@
+libselinux: build: follow standard semantics for DESTDIR and PREFIX
+
+This patch solves the following issues:
+- The pkg-config files generates odd paths when using DESTDIR without PREFIX
+- DESTDIR is needed during compile time to compute library and header paths which it should not.
+- Installing with both DESTDIR and PREFIX set gives us odd paths
+- Make usage of DESTDIR and PREFIX more standard
+
+Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
+
+diff -durN libselinux.orig/include/Makefile libselinux/include/Makefile
+--- libselinux.orig/include/Makefile	2018-01-12 12:42:30.898709792 +0100
++++ libselinux/include/Makefile	2018-01-12 10:02:57.745478435 +0100
+@@ -1,6 +1,6 @@
+ # Installation directories.
+-PREFIX ?= $(DESTDIR)/usr
+-INCDIR ?= $(PREFIX)/include/selinux
++PREFIX ?= /usr
++INCDIR = $(DESTDIR)$(PREFIX)/include/selinux
+ 
+ all:
+ 
+diff -durN libselinux.orig/man/Makefile libselinux/man/Makefile
+--- libselinux.orig/man/Makefile	2018-01-12 12:42:30.898709792 +0100
++++ libselinux/man/Makefile	2018-01-12 10:02:57.745478435 +0100
+@@ -1,7 +1,8 @@
+ # Installation directories.
+-MAN8DIR ?= $(DESTDIR)/usr/share/man/man8
+-MAN5DIR ?= $(DESTDIR)/usr/share/man/man5
+-MAN3DIR ?= $(DESTDIR)/usr/share/man/man3
++PREFIX	?= /usr
++MAN8DIR ?= $(DESTDIR)$(PREFIX)/share/man/man8
++MAN5DIR ?= $(DESTDIR)$(PREFIX)/share/man/man5
++MAN3DIR ?= $(DESTDIR)$(PREFIX)/share/man/man3
+ 
+ all:
+ 
+diff -durN libselinux.orig/src/libselinux.pc.in libselinux/src/libselinux.pc.in
+--- libselinux.orig/src/libselinux.pc.in	2018-01-12 12:42:30.905376458 +0100
++++ libselinux/src/libselinux.pc.in	2018-01-12 10:02:57.745478435 +0100
+@@ -1,6 +1,6 @@
+ prefix=@prefix@
+ exec_prefix=${prefix}
+-libdir=${exec_prefix}/@libdir@
++libdir=@libdir@
+ includedir=@includedir@
+ 
+ Name: libselinux
+diff -durN libselinux.orig/src/Makefile libselinux/src/Makefile
+--- libselinux.orig/src/Makefile	2018-01-12 12:42:30.902043126 +0100
++++ libselinux/src/Makefile	2018-01-12 10:02:57.745478435 +0100
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
+@@ -19,8 +19,6 @@
+ RUBYINC ?= $(shell $(RUBY) -e 'puts "-I" + RbConfig::CONFIG["rubyarchhdrdir"] + " -I" + RbConfig::CONFIG["rubyhdrdir"]')
+ RUBYLIBS ?= $(shell $(RUBY) -e 'puts "-L" + RbConfig::CONFIG["libdir"] + " -L" + RbConfig::CONFIG["archlibdir"] + " " + RbConfig::CONFIG["LIBRUBYARG_SHARED"]')
+ RUBYINSTALL ?= $(DESTDIR)$(shell $(RUBY) -e 'puts RbConfig::CONFIG["vendorarchdir"]')
+-LIBBASE ?= $(shell basename $(LIBDIR))
+-LIBSEPOLA ?= $(LIBDIR)/libsepol.a
+ 
+ VERSION = $(shell cat ../VERSION)
+ LIBVERSION = 1
+@@ -148,7 +146,7 @@
+ 	ln -sf $@ $(TARGET)
+ 
+ $(LIBPC): $(LIBPC).in ../VERSION
+-	sed -e 's/@VERSION@/$(VERSION)/; s:@prefix@:$(PREFIX):; s:@libdir@:$(LIBBASE):; s:@includedir@:$(INCLUDEDIR):' < $< > $@
++	sed -e 's/@VERSION@/$(VERSION)/; s:@prefix@:$(PREFIX):; s:@libdir@:$(LIBDIR):; s:@includedir@:$(INCLUDEDIR):' < $< > $@
+ 
+ selinuxswig_python_exception.i: ../include/selinux/selinux.h
+ 	bash -e exception.sh > $@ || (rm -f $@ ; false)
+@@ -156,8 +154,8 @@
+ $(AUDIT2WHYLOBJ): audit2why.c
+ 	$(CC) $(filter-out -Werror, $(CFLAGS)) $(PYINC) -fPIC -DSHARED -c -o $@ $<
+ 
+-$(AUDIT2WHYSO): $(AUDIT2WHYLOBJ) $(LIBSEPOLA)
+-	$(CC) $(CFLAGS) $(LDFLAGS) -L. -shared -o $@ $^ -lselinux $(PYLIBS)
++$(AUDIT2WHYSO): $(AUDIT2WHYLOBJ)
++	$(CC) $(CFLAGS) $(LDFLAGS) -L. -shared -o $@ $^ -lselinux $(PYLIBS) -l:libsepol.a
+ 
+ %.o:  %.c policy.h
+ 	$(CC) $(CFLAGS) $(TLSFLAGS) -c -o $@ $<
+@@ -177,13 +175,13 @@
+ 	$(SWIG) $<
+ 
+ install: all 
+-	test -d $(LIBDIR) || install -m 755 -d $(LIBDIR)
+-	install -m 644 $(LIBA) $(LIBDIR)
+-	test -d $(SHLIBDIR) || install -m 755 -d $(SHLIBDIR)
+-	install -m 755 $(LIBSO) $(SHLIBDIR)
+-	test -d $(LIBDIR)/pkgconfig || install -m 755 -d $(LIBDIR)/pkgconfig
+-	install -m 644 $(LIBPC) $(LIBDIR)/pkgconfig
+-	ln -sf --relative $(SHLIBDIR)/$(LIBSO) $(LIBDIR)/$(TARGET)
++	test -d $(LIBINSTALL) || install -m 755 -d $(LIBINSTALL)
++	install -m 644 $(LIBA) $(LIBINSTALL)
++	test -d $(LIBINSTALL) || install -m 755 -d $(LIBINSTALL)
++	install -m 755 $(LIBSO) $(LIBINSTALL)
++	test -d $(LIBINSTALL)/pkgconfig || install -m 755 -d $(LIBINSTALL)/pkgconfig
++	install -m 644 $(LIBPC) $(LIBINSTALL)/pkgconfig
++	ln -sf --relative $(LIBINSTALL)/$(LIBSO) $(LIBINSTALL)/$(TARGET)
+ 
+ install-pywrap: pywrap
+ 	test -d $(PYSITEDIR)/selinux || install -m 755 -d $(PYSITEDIR)/selinux
+@@ -196,7 +194,7 @@
+ 	install -m 755 $(SWIGRUBYSO) $(RUBYINSTALL)/selinux.so
+ 
+ relabel:
+-	/sbin/restorecon $(SHLIBDIR)/$(LIBSO)
++	/sbin/restorecon $(LIBINSTALL)/$(LIBSO)
+ 
+ clean-pywrap:
+ 	-rm -f $(SWIGLOBJ) $(SWIGSO) $(AUDIT2WHYLOBJ) $(AUDIT2WHYSO)
+diff -durN libselinux.orig/utils/Makefile libselinux/utils/Makefile
+--- libselinux.orig/utils/Makefile	2018-01-12 12:42:30.905376458 +0100
++++ libselinux/utils/Makefile	2018-01-12 10:02:57.745478435 +0100
+@@ -1,8 +1,6 @@
+ # Installation directories.
+-PREFIX ?= $(DESTDIR)/usr
+-LIBDIR ?= $(PREFIX)/lib
+-SBINDIR ?= $(PREFIX)/sbin
+-INCLUDEDIR ?= $(PREFIX)/include
++PREFIX ?= /usr
++SBINDIR ?= $(DESTDIR)$(PREFIX)/sbin
+ 
+ OS ?= $(shell uname)
+ 
diff --git a/package/libselinux/0003-revert-ln-relative.patch b/package/libselinux/0003-revert-ln-relative.patch
deleted file mode 100644
index b8ad07000a..0000000000
--- a/package/libselinux/0003-revert-ln-relative.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Makefile: revert libselinux: use ln --relative to create .so symlinks
-
-This reverts 71393a181d63c9baae5fe8dcaeb9411d1f253998
-
-ln --relative is too recent to be available in all distributions,
-especially enterprise-grade distros that can stick around as long as
-they are maintained (up to 10 years in some cases?).
-
-For the sake of Buildroot, revert the upstream patch.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN a/src/Makefile b/src/Makefile
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -151,7 +151,7 @@
- 	install -m 755 $(LIBSO) $(SHLIBDIR)
- 	test -d $(LIBDIR)/pkgconfig || install -m 755 -d $(LIBDIR)/pkgconfig
- 	install -m 644 $(LIBPC) $(LIBDIR)/pkgconfig
--	ln -sf --relative $(SHLIBDIR)/$(LIBSO) $(LIBDIR)/$(TARGET)
-+	cd $(LIBDIR) && ln -sf ../../`basename $(SHLIBDIR)`/$(LIBSO) $(TARGET)
- 
- install-pywrap: pywrap
- 	test -d $(PYLIBDIR)/site-packages/selinux || install -m 755 -d $(PYLIBDIR)/site-packages/selinux
diff --git a/package/libselinux/0004-revert-ln-relative.patch b/package/libselinux/0004-revert-ln-relative.patch
new file mode 100644
index 0000000000..f72afa1b0a
--- /dev/null
+++ b/package/libselinux/0004-revert-ln-relative.patch
@@ -0,0 +1,24 @@
+Makefile: revert libselinux: use ln --relative to create .so symlinks
+
+This reverts 71393a181d63c9baae5fe8dcaeb9411d1f253998
+
+ln --relative is too recent to be available in all distributions,
+especially enterprise-grade distros that can stick around as long as
+they are maintained (up to 10 years in some cases?).
+
+For the sake of Buildroot, revert the upstream patch.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durNw libselinux-2.7.orig/src/Makefile libselinux-2.7/src/Makefile
+--- libselinux-2.7.orig/src/Makefile	2018-01-15 20:53:50.168525700 +0100
++++ libselinux-2.7/src/Makefile	2018-01-15 20:55:27.061858005 +0100
+@@ -181,7 +181,7 @@
+ 	install -m 755 $(LIBSO) $(LIBINSTALL)
+ 	test -d $(LIBINSTALL)/pkgconfig || install -m 755 -d $(LIBINSTALL)/pkgconfig
+ 	install -m 644 $(LIBPC) $(LIBINSTALL)/pkgconfig
+-	ln -sf --relative $(LIBINSTALL)/$(LIBSO) $(LIBINSTALL)/$(TARGET)
++	cd $(LIBINSTALL) && ln -sf $(LIBSO) $(TARGET)
+ 
+ install-pywrap: pywrap
+ 	test -d $(PYSITEDIR)/selinux || install -m 755 -d $(PYSITEDIR)/selinux
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 8ac8000de5..f5ec1ec550 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -45,15 +45,13 @@ LIBSELINUX_MAKE_INSTALL_TARGETS += install-pywrap
 # invocation as the rest of the library.
 define LIBSELINUX_BUILD_PYTHON_BINDINGS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		$(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR) swigify pywrap
+		$(LIBSELINUX_MAKE_OPTS) swigify pywrap
 endef
 endif # python || python3
 
 define LIBSELINUX_BUILD_CMDS
-	# DESTDIR is needed during the compile to compute library and
-	# header paths.
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		$(LIBSELINUX_MAKE_OPTS) DESTDIR=$(STAGING_DIR) all
+		$(LIBSELINUX_MAKE_OPTS)  all
 	$(LIBSELINUX_BUILD_PYTHON_BINDINGS)
 endef
 
@@ -85,10 +83,8 @@ HOST_LIBSELINUX_PYINC = -I$(HOST_DIR)/include/python$(PYTHON_VERSION_MAJOR)/
 HOST_LIBSELINUX_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
 endif
 
-# DESTDIR is needed during the compile to compute library and header paths.
 HOST_LIBSELINUX_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
-	DESTDIR=$(HOST_DIR) \
 	PREFIX=$(HOST_DIR) \
 	LDFLAGS="$(HOST_LDFLAGS) -lpcre -lpthread" \
 	PYINC="$(HOST_LIBSELINUX_PYINC)" \
-- 
2.15.1
