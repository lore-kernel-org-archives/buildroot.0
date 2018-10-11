From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 21:41:48 +0200
Subject: [Buildroot] [git commit] libselinux: bump to version 2.8
Message-ID: <20181011200602.1BD1283460@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e89db296d720c633f32344ae931914fdeb22ff22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove second patch (already in version), see
  https://github.com/SELinuxProject/selinux/commit/b24980ec07af66c4b419f8053aa65e97b36e558d
- Update third patch
- For target variant, set SHLIBDIR=/usr/lib because by default it is set
  to /lib and LIBDIR is set to $(PREFIX)/lib (with PREFIX=/usr)
- For host variant, set SHLIBDIR=$(HOST_DIR)/lib otherwise shared
  library will be installed in /lib (PREFIX is not used to install
  shared library)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...build-follow-standard-semantics-for-DESTD.patch | 137 ---------------------
 ...elative.patch => 0002-revert-ln-relative.patch} |  14 ++-
 ...uild-break-around-__atomic_-with-GCC-4.7.patch} |   0
 package/libselinux/libselinux.hash                 |   5 +-
 package/libselinux/libselinux.mk                   |  10 +-
 5 files changed, 19 insertions(+), 147 deletions(-)

diff --git a/package/libselinux/0002-libselinux-build-follow-standard-semantics-for-DESTD.patch b/package/libselinux/0002-libselinux-build-follow-standard-semantics-for-DESTD.patch
deleted file mode 100644
index 089eef414e..0000000000
--- a/package/libselinux/0002-libselinux-build-follow-standard-semantics-for-DESTD.patch
+++ /dev/null
@@ -1,137 +0,0 @@
-libselinux: build: follow standard semantics for DESTDIR and PREFIX
-
-This patch solves the following issues:
-- The pkg-config files generates odd paths when using DESTDIR without PREFIX
-- DESTDIR is needed during compile time to compute library and header paths which it should not.
-- Installing with both DESTDIR and PREFIX set gives us odd paths
-- Make usage of DESTDIR and PREFIX more standard
-
-Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
-
-diff -durN libselinux.orig/include/Makefile libselinux/include/Makefile
---- libselinux.orig/include/Makefile	2018-01-12 12:42:30.898709792 +0100
-+++ libselinux/include/Makefile	2018-01-12 10:02:57.745478435 +0100
-@@ -1,6 +1,6 @@
- # Installation directories.
--PREFIX ?= $(DESTDIR)/usr
--INCDIR ?= $(PREFIX)/include/selinux
-+PREFIX ?= /usr
-+INCDIR = $(DESTDIR)$(PREFIX)/include/selinux
- 
- all:
- 
-diff -durN libselinux.orig/man/Makefile libselinux/man/Makefile
---- libselinux.orig/man/Makefile	2018-01-12 12:42:30.898709792 +0100
-+++ libselinux/man/Makefile	2018-01-12 10:02:57.745478435 +0100
-@@ -1,7 +1,8 @@
- # Installation directories.
--MAN8DIR ?= $(DESTDIR)/usr/share/man/man8
--MAN5DIR ?= $(DESTDIR)/usr/share/man/man5
--MAN3DIR ?= $(DESTDIR)/usr/share/man/man3
-+PREFIX	?= /usr
-+MAN8DIR ?= $(DESTDIR)$(PREFIX)/share/man/man8
-+MAN5DIR ?= $(DESTDIR)$(PREFIX)/share/man/man5
-+MAN3DIR ?= $(DESTDIR)$(PREFIX)/share/man/man3
- 
- all:
- 
-diff -durN libselinux.orig/src/libselinux.pc.in libselinux/src/libselinux.pc.in
---- libselinux.orig/src/libselinux.pc.in	2018-01-12 12:42:30.905376458 +0100
-+++ libselinux/src/libselinux.pc.in	2018-01-12 10:02:57.745478435 +0100
-@@ -1,6 +1,6 @@
- prefix=@prefix@
- exec_prefix=${prefix}
--libdir=${exec_prefix}/@libdir@
-+libdir=@libdir@
- includedir=@includedir@
- 
- Name: libselinux
-diff -durN libselinux.orig/src/Makefile libselinux/src/Makefile
---- libselinux.orig/src/Makefile	2018-01-12 12:42:30.902043126 +0100
-+++ libselinux/src/Makefile	2018-01-12 10:02:57.745478435 +0100
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
-@@ -19,8 +19,6 @@
- RUBYINC ?= $(shell $(RUBY) -e 'puts "-I" + RbConfig::CONFIG["rubyarchhdrdir"] + " -I" + RbConfig::CONFIG["rubyhdrdir"]')
- RUBYLIBS ?= $(shell $(RUBY) -e 'puts "-L" + RbConfig::CONFIG["libdir"] + " -L" + RbConfig::CONFIG["archlibdir"] + " " + RbConfig::CONFIG["LIBRUBYARG_SHARED"]')
- RUBYINSTALL ?= $(DESTDIR)$(shell $(RUBY) -e 'puts RbConfig::CONFIG["vendorarchdir"]')
--LIBBASE ?= $(shell basename $(LIBDIR))
--LIBSEPOLA ?= $(LIBDIR)/libsepol.a
- 
- VERSION = $(shell cat ../VERSION)
- LIBVERSION = 1
-@@ -148,7 +146,7 @@
- 	ln -sf $@ $(TARGET)
- 
- $(LIBPC): $(LIBPC).in ../VERSION
--	sed -e 's/@VERSION@/$(VERSION)/; s:@prefix@:$(PREFIX):; s:@libdir@:$(LIBBASE):; s:@includedir@:$(INCLUDEDIR):' < $< > $@
-+	sed -e 's/@VERSION@/$(VERSION)/; s:@prefix@:$(PREFIX):; s:@libdir@:$(LIBDIR):; s:@includedir@:$(INCLUDEDIR):' < $< > $@
- 
- selinuxswig_python_exception.i: ../include/selinux/selinux.h
- 	bash -e exception.sh > $@ || (rm -f $@ ; false)
-@@ -156,8 +154,8 @@
- $(AUDIT2WHYLOBJ): audit2why.c
- 	$(CC) $(filter-out -Werror, $(CFLAGS)) $(PYINC) -fPIC -DSHARED -c -o $@ $<
- 
--$(AUDIT2WHYSO): $(AUDIT2WHYLOBJ) $(LIBSEPOLA)
--	$(CC) $(CFLAGS) $(LDFLAGS) -L. -shared -o $@ $^ -lselinux $(PYLIBS)
-+$(AUDIT2WHYSO): $(AUDIT2WHYLOBJ)
-+	$(CC) $(CFLAGS) $(LDFLAGS) -L. -shared -o $@ $^ -lselinux $(PYLIBS) -l:libsepol.a
- 
- %.o:  %.c policy.h
- 	$(CC) $(CFLAGS) $(TLSFLAGS) -c -o $@ $<
-@@ -177,13 +175,13 @@
- 	$(SWIG) $<
- 
- install: all 
--	test -d $(LIBDIR) || install -m 755 -d $(LIBDIR)
--	install -m 644 $(LIBA) $(LIBDIR)
--	test -d $(SHLIBDIR) || install -m 755 -d $(SHLIBDIR)
--	install -m 755 $(LIBSO) $(SHLIBDIR)
--	test -d $(LIBDIR)/pkgconfig || install -m 755 -d $(LIBDIR)/pkgconfig
--	install -m 644 $(LIBPC) $(LIBDIR)/pkgconfig
--	ln -sf --relative $(SHLIBDIR)/$(LIBSO) $(LIBDIR)/$(TARGET)
-+	test -d $(LIBINSTALL) || install -m 755 -d $(LIBINSTALL)
-+	install -m 644 $(LIBA) $(LIBINSTALL)
-+	test -d $(LIBINSTALL) || install -m 755 -d $(LIBINSTALL)
-+	install -m 755 $(LIBSO) $(LIBINSTALL)
-+	test -d $(LIBINSTALL)/pkgconfig || install -m 755 -d $(LIBINSTALL)/pkgconfig
-+	install -m 644 $(LIBPC) $(LIBINSTALL)/pkgconfig
-+	ln -sf --relative $(LIBINSTALL)/$(LIBSO) $(LIBINSTALL)/$(TARGET)
- 
- install-pywrap: pywrap
- 	test -d $(PYSITEDIR)/selinux || install -m 755 -d $(PYSITEDIR)/selinux
-@@ -196,7 +194,7 @@
- 	install -m 755 $(SWIGRUBYSO) $(RUBYINSTALL)/selinux.so
- 
- relabel:
--	/sbin/restorecon $(SHLIBDIR)/$(LIBSO)
-+	/sbin/restorecon $(LIBINSTALL)/$(LIBSO)
- 
- clean-pywrap:
- 	-rm -f $(SWIGLOBJ) $(SWIGSO) $(AUDIT2WHYLOBJ) $(AUDIT2WHYSO)
-diff -durN libselinux.orig/utils/Makefile libselinux/utils/Makefile
---- libselinux.orig/utils/Makefile	2018-01-12 12:42:30.905376458 +0100
-+++ libselinux/utils/Makefile	2018-01-12 10:02:57.745478435 +0100
-@@ -1,8 +1,6 @@
- # Installation directories.
--PREFIX ?= $(DESTDIR)/usr
--LIBDIR ?= $(PREFIX)/lib
--SBINDIR ?= $(PREFIX)/sbin
--INCLUDEDIR ?= $(PREFIX)/include
-+PREFIX ?= /usr
-+SBINDIR ?= $(DESTDIR)$(PREFIX)/sbin
- 
- OS ?= $(shell uname)
- 
diff --git a/package/libselinux/0003-revert-ln-relative.patch b/package/libselinux/0002-revert-ln-relative.patch
similarity index 55%
rename from package/libselinux/0003-revert-ln-relative.patch
rename to package/libselinux/0002-revert-ln-relative.patch
index f72afa1b0a..f7beab2697 100644
--- a/package/libselinux/0003-revert-ln-relative.patch
+++ b/package/libselinux/0002-revert-ln-relative.patch
@@ -9,16 +9,18 @@ they are maintained (up to 10 years in some cases?).
 For the sake of Buildroot, revert the upstream patch.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Update for 2.8 (with assumption that SHLIBDIR=LIBDIR)]
 
 diff -durNw libselinux-2.7.orig/src/Makefile libselinux-2.7/src/Makefile
 --- libselinux-2.7.orig/src/Makefile	2018-01-15 20:53:50.168525700 +0100
 +++ libselinux-2.7/src/Makefile	2018-01-15 20:55:27.061858005 +0100
 @@ -181,7 +181,7 @@
- 	install -m 755 $(LIBSO) $(LIBINSTALL)
- 	test -d $(LIBINSTALL)/pkgconfig || install -m 755 -d $(LIBINSTALL)/pkgconfig
- 	install -m 644 $(LIBPC) $(LIBINSTALL)/pkgconfig
--	ln -sf --relative $(LIBINSTALL)/$(LIBSO) $(LIBINSTALL)/$(TARGET)
-+	cd $(LIBINSTALL) && ln -sf $(LIBSO) $(TARGET)
+	install -m 755 $(LIBSO) $(DESTDIR)$(SHLIBDIR)
+	test -d $(DESTDIR)$(LIBDIR)/pkgconfig || install -m 755 -d $(DESTDIR)$(LIBDIR)/pkgconfig
+	install -m 644 $(LIBPC) $(DESTDIR)$(LIBDIR)/pkgconfig
+-	ln -sf --relative $(DESTDIR)$(SHLIBDIR)/$(LIBSO) $(DESTDIR)$(LIBDIR)/$(TARGET)
++	cd $(DESTDIR)$(LIBDIR) && ln -sf $(LIBSO) $(TARGET)
  
  install-pywrap: pywrap
- 	test -d $(PYSITEDIR)/selinux || install -m 755 -d $(PYSITEDIR)/selinux
+	test -d $(DESTDIR)$(PYTHONLIBDIR)/selinux || install -m 755 -d $(DESTDIR)$(PYTHONLIBDIR)/selinux
diff --git a/package/libselinux/0004-Fix-build-break-around-__atomic_-with-GCC-4.7.patch b/package/libselinux/0003-Fix-build-break-around-__atomic_-with-GCC-4.7.patch
similarity index 100%
rename from package/libselinux/0004-Fix-build-break-around-__atomic_-with-GCC-4.7.patch
rename to package/libselinux/0003-Fix-build-break-around-__atomic_-with-GCC-4.7.patch
diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
index 3c60d5111d..fb8e350434 100644
--- a/package/libselinux/libselinux.hash
+++ b/package/libselinux/libselinux.hash
@@ -1,2 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 d0fec0769b3ad60aa7baf9b9a4b7a056827769dc2dadda0dc0eb59b3d1c18c57 libselinux-2.7.tar.gz
+sha256 31db96ec7643ce10912b3c3f98506a08a9116dcfe151855fd349c3fda96187e1 libselinux-2.8.tar.gz
+
+# Hash for license file
+sha256 86657b4c0fe868d7cbd977cb04c63b6c667e08fa51595a7bc846ad4bed8fc364 LICENSE
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 97b4f03062..b09634740a 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSELINUX_VERSION = 2.7
-LIBSELINUX_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804
+LIBSELINUX_VERSION = 2.8
+LIBSELINUX_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20180524
 LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
 
@@ -14,11 +14,14 @@ LIBSELINUX_DEPENDENCIES = libsepol pcre
 LIBSELINUX_INSTALL_STAGING = YES
 
 # Filter out D_FILE_OFFSET_BITS=64. This fixes errors caused by glibc 2.22.
+# Set SHLIBDIR to /usr/lib so it has the same value than LIBDIR, as a result
+# we won't have to use a relative path in 0002-revert-ln-relative.patch
 LIBSELINUX_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
 	CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))" \
 	LDFLAGS="$(TARGET_LDFLAGS) -lpcre -lpthread" \
-	ARCH=$(KERNEL_ARCH)
+	ARCH=$(KERNEL_ARCH) \
+	SHLIBDIR=/usr/lib
 
 LIBSELINUX_MAKE_INSTALL_TARGETS = install
 
@@ -86,6 +89,7 @@ endif
 HOST_LIBSELINUX_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
 	PREFIX=$(HOST_DIR) \
+	SHLIBDIR=$(HOST_DIR)/lib \
 	LDFLAGS="$(HOST_LDFLAGS) -lpcre -lpthread" \
 	PYINC="$(HOST_LIBSELINUX_PYINC)" \
 	PYSITEDIR="$(HOST_DIR)/lib/$(HOST_LIBSELINUX_PYLIBVER)/site-packages" \
