From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 21:41:49 +0200
Subject: [Buildroot] [git commit] libsepol: bump to version 2.8
Message-ID: <20181011200602.240C382DD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=acab06123855496e2956053ea49940c0f3299df8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove first patch (already in version):
  https://github.com/SELinuxProject/selinux/commit/f8532f17731c82df9956aa1c92f7fb08bd65bf05
- Update second and third patch
- For target variant, set SHLIBDIR=/usr/lib because by default it is set
  to /lib and LIBDIR is set to $(PREFIX)/lib (with PREFIX=/usr)
- For host variant, set SHLIBDIR=$(HOST_DIR)/lib otherwise shared
  library will be installed in /lib (PREFIX is not used to install
  shared library)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...build-follow-standard-semantics-for-DESTD.patch | 109 ---------------------
 ...c-only.patch => 0001-support-static-only.patch} |  16 +--
 ...elative.patch => 0002-revert-ln-relative.patch} |  10 +-
 package/libsepol/libsepol.hash                     |   5 +-
 package/libsepol/libsepol.mk                       |  15 ++-
 5 files changed, 29 insertions(+), 126 deletions(-)

diff --git a/package/libsepol/0001-libsepol-build-follow-standard-semantics-for-DESTD.patch b/package/libsepol/0001-libsepol-build-follow-standard-semantics-for-DESTD.patch
deleted file mode 100644
index 1daf7206d3..0000000000
--- a/package/libsepol/0001-libsepol-build-follow-standard-semantics-for-DESTD.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-libsepol: build: follow standard semantics for DESTDIR and PREFIX
-
-This patch solves the following issues:
-- The pkg-config files generates odd paths when using DESTDIR without PREFIX
-- DESTDIR is needed during compile time to compute library and header paths which it should not.
-- Installing with both DESTDIR and PREFIX set gives us odd paths
-- Make usage of DESTDIR and PREFIX more standard
-
-Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
-
-diff -durN libsepol.orig/include/Makefile libsepol/include/Makefile
---- libsepol.orig/include/Makefile	2018-01-12 12:42:30.908709792 +0100
-+++ libsepol/include/Makefile	2018-01-12 09:58:04.322148228 +0100
-@@ -1,6 +1,6 @@
- # Installation directories.
--PREFIX ?= $(DESTDIR)/usr
--INCDIR ?= $(PREFIX)/include/sepol
-+PREFIX ?= /usr
-+INCDIR = $(DESTDIR)$(PREFIX)/include/sepol
- CILDIR ?= ../cil
- 
- all:
-diff -durN libsepol.orig/man/Makefile libsepol/man/Makefile
---- libsepol.orig/man/Makefile	2018-01-12 12:42:30.912043126 +0100
-+++ libsepol/man/Makefile	2018-01-12 09:58:04.322148228 +0100
-@@ -1,6 +1,7 @@
- # Installation directories.
--MAN8DIR ?= $(DESTDIR)/usr/share/man/man8
--MAN3DIR ?= $(DESTDIR)/usr/share/man/man3
-+PREFIX ?= /usr
-+MAN8DIR ?= $(DESTDIR)$(PREFIX)/share/man/man8
-+MAN3DIR ?= $(DESTDIR)$(PREFIX)/share/man/man3
- 
- all:
- 
-diff -durN libsepol.orig/src/libsepol.pc.in libsepol/src/libsepol.pc.in
---- libsepol.orig/src/libsepol.pc.in	2018-01-12 12:42:30.912043126 +0100
-+++ libsepol/src/libsepol.pc.in	2018-01-12 09:58:04.322148228 +0100
-@@ -1,6 +1,6 @@
- prefix=@prefix@
- exec_prefix=${prefix}
--libdir=${exec_prefix}/@libdir@
-+libdir=@libdir@
- includedir=@includedir@
- 
- Name: libsepol
-diff -durN libsepol.orig/src/Makefile libsepol/src/Makefile
---- libsepol.orig/src/Makefile	2018-01-12 12:42:30.912043126 +0100
-+++ libsepol/src/Makefile	2018-01-12 09:58:04.322148228 +0100
-@@ -1,11 +1,10 @@
- # Installation directories.
--PREFIX ?= $(DESTDIR)/usr
-+PREFIX ?= /usr
- INCLUDEDIR ?= $(PREFIX)/include
- LIBDIR ?= $(PREFIX)/lib
--SHLIBDIR ?= $(DESTDIR)/lib
- RANLIB ?= ranlib
--LIBBASE ?= $(shell basename $(LIBDIR))
- CILDIR ?= ../cil
-+LIBINSTALL = $(DESTDIR)$(LIBDIR)
- 
- VERSION = $(shell cat ../VERSION)
- LIBVERSION = 1
-@@ -52,7 +51,7 @@
- 	ln -sf $@ $(TARGET) 
- 
- $(LIBPC): $(LIBPC).in ../VERSION
--	sed -e 's/@VERSION@/$(VERSION)/; s:@prefix@:$(PREFIX):; s:@libdir@:$(LIBBASE):; s:@includedir@:$(INCLUDEDIR):' < $< > $@
-+	sed -e 's/@VERSION@/$(VERSION)/; s:@prefix@:$(PREFIX):; s:@libdir@:$(LIBDIR):; s:@includedir@:$(INCLUDEDIR):' < $< > $@
- 
- $(LIBMAP): $(LIBMAP).in
- ifneq ($(DISABLE_CIL),y)
-@@ -80,16 +79,16 @@
- 	$(CC) $(CFLAGS) -fPIC -DSHARED -c -o $@ $<
- 
- install: all
--	test -d $(LIBDIR) || install -m 755 -d $(LIBDIR)
--	install -m 644 $(LIBA) $(LIBDIR)
--	test -d $(SHLIBDIR) || install -m 755 -d $(SHLIBDIR)
--	install -m 755 $(LIBSO) $(SHLIBDIR)
--	test -d $(LIBDIR)/pkgconfig || install -m 755 -d $(LIBDIR)/pkgconfig
--	install -m 644 $(LIBPC) $(LIBDIR)/pkgconfig
--	$(LN) -sf --relative $(SHLIBDIR)/$(LIBSO) $(LIBDIR)/$(TARGET)
-+	test -d $(LIBINSTALL) || install -m 755 -d $(LIBINSTALL)
-+	install -m 644 $(LIBA) $(LIBINSTALL)
-+	test -d $(LIBINSTALL) || install -m 755 -d $(LIBINSTALL)
-+	install -m 755 $(LIBSO) $(LIBINSTALL)
-+	test -d $(LIBINSTALL)/pkgconfig || install -m 755 -d $(LIBINSTALL)/pkgconfig
-+	install -m 644 $(LIBPC) $(LIBINSTALL)/pkgconfig
-+	$(LN) -sf --relative $(LIBINSTALL)/$(LIBSO) $(LIBINSTALL)/$(TARGET)
- 
- relabel:
--	/sbin/restorecon $(SHLIBDIR)/$(LIBSO)
-+	/sbin/restorecon $(LIBINSTALL)/$(LIBSO)
- 
- clean: 
- 	-rm -f $(LIBPC) $(LIBMAP) $(OBJS) $(LOBJS) $(LIBA) $(LIBSO) $(TARGET) $(CIL_GENERATED)
-diff -durN libsepol.orig/utils/Makefile libsepol/utils/Makefile
---- libsepol.orig/utils/Makefile	2018-01-12 12:42:30.915376458 +0100
-+++ libsepol/utils/Makefile	2018-01-12 09:58:04.322148228 +0100
-@@ -1,6 +1,6 @@
- # Installation directories.
--PREFIX ?= $(DESTDIR)/usr
--BINDIR ?= $(PREFIX)/bin
-+PREFIX ?= /usr
-+BINDIR ?= $(DESTDIR)$(PREFIX)/bin
- 
- CFLAGS ?= -Wall -Werror
- override CFLAGS += -I../include
diff --git a/package/libsepol/0002-support-static-only.patch b/package/libsepol/0001-support-static-only.patch
similarity index 68%
rename from package/libsepol/0002-support-static-only.patch
rename to package/libsepol/0001-support-static-only.patch
index 8cf9a180ff..f475dcad18 100644
--- a/package/libsepol/0002-support-static-only.patch
+++ b/package/libsepol/0001-support-static-only.patch
@@ -11,6 +11,8 @@ does not have support for shared libraries.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Update for 2.8]
 ---
  src/Makefile | 13 ++++++++++---
  1 file changed, 10 insertions(+), 3 deletions(-)
@@ -34,12 +36,12 @@ diff -durNw libsepol-2.7.orig/src/Makefile libsepol-2.7/src/Makefile
  $(LIBA):  $(OBJS)
 @@ -81,8 +86,10 @@
  install: all
- 	test -d $(LIBINSTALL) || install -m 755 -d $(LIBINSTALL)
- 	install -m 644 $(LIBA) $(LIBINSTALL)
+	test -d $(DESTDIR)$(LIBDIR) || install -m 755 -d $(DESTDIR)$(LIBDIR)
+	install -m 644 $(LIBA) $(DESTDIR)$(LIBDIR)
 +ifeq ($(STATIC),)
- 	test -d $(LIBINSTALL) || install -m 755 -d $(LIBINSTALL)
- 	install -m 755 $(LIBSO) $(LIBINSTALL)
+	test -d $(DESTDIR)$(SHLIBDIR) || install -m 755 -d $(DESTDIR)$(SHLIBDIR)
+	install -m 755 $(LIBSO) $(DESTDIR)$(SHLIBDIR)
 +endif
- 	test -d $(LIBINSTALL)/pkgconfig || install -m 755 -d $(LIBINSTALL)/pkgconfig
- 	install -m 644 $(LIBPC) $(LIBINSTALL)/pkgconfig
- 	$(LN) -sf --relative $(LIBINSTALL)/$(LIBSO) $(LIBINSTALL)/$(TARGET)
+	test -d $(DESTDIR)$(LIBDIR)/pkgconfig || install -m 755 -d $(DESTDIR)$(LIBDIR)/pkgconfig
+	install -m 644 $(LIBPC) $(DESTDIR)$(LIBDIR)/pkgconfig
+	$(LN) -sf --relative $(DESTDIR)$(SHLIBDIR)/$(LIBSO) $(DESTDIR)$(LIBDIR)/$(TARGET)
diff --git a/package/libsepol/0003-revert-ln-relative.patch b/package/libsepol/0002-revert-ln-relative.patch
similarity index 68%
rename from package/libsepol/0003-revert-ln-relative.patch
rename to package/libsepol/0002-revert-ln-relative.patch
index 9d1553ed97..acac908be0 100644
--- a/package/libsepol/0003-revert-ln-relative.patch
+++ b/package/libsepol/0002-revert-ln-relative.patch
@@ -12,16 +12,18 @@ they are maintained (up to 10 years in some cases?).
 For the sake of Buildroot, revert the upstream patch.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Update for 2.8 (with assumption that SHLIBDIR=LIBDIR)]
 
 diff -durNw libsepol-2.7.orig/src/Makefile libsepol-2.7/src/Makefile
 --- libsepol-2.7.orig/src/Makefile	2018-01-15 21:37:12.821831315 +0100
 +++ libsepol-2.7/src/Makefile	2018-01-15 21:38:03.838497434 +0100
 @@ -92,7 +92,7 @@
  endif
- 	test -d $(LIBINSTALL)/pkgconfig || install -m 755 -d $(LIBINSTALL)/pkgconfig
- 	install -m 644 $(LIBPC) $(LIBINSTALL)/pkgconfig
--	$(LN) -sf --relative $(LIBINSTALL)/$(LIBSO) $(LIBINSTALL)/$(TARGET)
-+	cd $(LIBINSTALL) && ln -sf $(LIBSO) $(TARGET)
+	test -d $(DESTDIR)$(LIBDIR)/pkgconfig || install -m 755 -d $(DESTDIR)$(LIBDIR)/pkgconfig
+	install -m 644 $(LIBPC) $(DESTDIR)$(LIBDIR)/pkgconfig
+-	$(LN) -sf --relative $(DESTDIR)$(SHLIBDIR)/$(LIBSO) $(DESTDIR)$(LIBDIR)/$(TARGET)
++	cd $(DESTDIR)$(LIBDIR) && ln -sf $(LIBSO) $(TARGET)
  
  relabel:
  	/sbin/restorecon $(LIBINSTALL)/$(LIBSO)
diff --git a/package/libsepol/libsepol.hash b/package/libsepol/libsepol.hash
index 08e2bf97a4..599133c116 100644
--- a/package/libsepol/libsepol.hash
+++ b/package/libsepol/libsepol.hash
@@ -1,2 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 d69d3bd8ec901a3bd5adf2be2fb47fb1a685ed73066ab482e7e505371a48f9e7  libsepol-2.7.tar.gz
+sha256 3ad6916a8352bef0bad49acc8037a5f5b48c56f94e4cb4e1959ca475fa9d24d6  libsepol-2.8.tar.gz
+
+# Hash for license file
+sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index a9a9c652ea..a1e3836851 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSEPOL_VERSION = 2.7
-LIBSEPOL_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804
+LIBSEPOL_VERSION = 2.8
+LIBSEPOL_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20180524
 LIBSEPOL_LICENSE = LGPL-2.1+
 LIBSEPOL_LICENSE_FILES = COPYING
 
@@ -23,17 +23,22 @@ define LIBSEPOL_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBSEPOL_MAKE_FLAGS)
 endef
 
+# Set SHLIBDIR to /usr/lib so it has the same value than LIBDIR, as a result
+# we won't have to use a relative path in 0002-revert-ln-relative.patch
 define LIBSEPOL_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install $(LIBSEPOL_MAKE_FLAGS) DESTDIR=$(STAGING_DIR)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install $(LIBSEPOL_MAKE_FLAGS) \
+		DESTDIR=$(STAGING_DIR) SHLIBDIR=/usr/lib
 endef
 
 define LIBSEPOL_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install $(LIBSEPOL_MAKE_FLAGS) DESTDIR=$(TARGET_DIR)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install $(LIBSEPOL_MAKE_FLAGS) \
+		DESTDIR=$(TARGET_DIR) SHLIBDIR=/usr/lib
 endef
 
 HOST_LIBSEPOL_MAKE_ENV = \
 	$(HOST_MAKE_ENV) \
-	PREFIX=$(HOST_DIR)
+	PREFIX=$(HOST_DIR) \
+	SHLIBDIR=$(HOST_DIR)/lib
 
 define HOST_LIBSEPOL_BUILD_CMDS
 	$(HOST_LIBSEPOL_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS)
