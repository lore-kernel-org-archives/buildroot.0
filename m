From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jan 2018 23:22:03 +0100
Subject: [Buildroot] [git commit] libsepol: add patch to make the build
 process more standard
Message-ID: <20180116224330.D777481339@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65de266c23eb07670a3dba95aa44e5fb57729371
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch the Makefiles to make PREFIX and DESTDIR follow standard
semantics to get rid of DESTDIR during compile time in
libsepol.mk and generate proper pkg-config files.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...build-follow-standard-semantics-for-DESTD.patch | 109 +++++++++++++++++++++
 ...c-only.patch => 0003-support-static-only.patch} |  33 +++----
 ...elative.patch => 0004-revert-ln-relative.patch} |  25 ++---
 package/libsepol/libsepol.mk                       |   5 +-
 4 files changed, 131 insertions(+), 41 deletions(-)

diff --git a/package/libsepol/0001-libsepol-build-follow-standard-semantics-for-DESTD.patch b/package/libsepol/0001-libsepol-build-follow-standard-semantics-for-DESTD.patch
new file mode 100644
index 0000000..1daf720
--- /dev/null
+++ b/package/libsepol/0001-libsepol-build-follow-standard-semantics-for-DESTD.patch
@@ -0,0 +1,109 @@
+libsepol: build: follow standard semantics for DESTDIR and PREFIX
+
+This patch solves the following issues:
+- The pkg-config files generates odd paths when using DESTDIR without PREFIX
+- DESTDIR is needed during compile time to compute library and header paths which it should not.
+- Installing with both DESTDIR and PREFIX set gives us odd paths
+- Make usage of DESTDIR and PREFIX more standard
+
+Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
+
+diff -durN libsepol.orig/include/Makefile libsepol/include/Makefile
+--- libsepol.orig/include/Makefile	2018-01-12 12:42:30.908709792 +0100
++++ libsepol/include/Makefile	2018-01-12 09:58:04.322148228 +0100
+@@ -1,6 +1,6 @@
+ # Installation directories.
+-PREFIX ?= $(DESTDIR)/usr
+-INCDIR ?= $(PREFIX)/include/sepol
++PREFIX ?= /usr
++INCDIR = $(DESTDIR)$(PREFIX)/include/sepol
+ CILDIR ?= ../cil
+ 
+ all:
+diff -durN libsepol.orig/man/Makefile libsepol/man/Makefile
+--- libsepol.orig/man/Makefile	2018-01-12 12:42:30.912043126 +0100
++++ libsepol/man/Makefile	2018-01-12 09:58:04.322148228 +0100
+@@ -1,6 +1,7 @@
+ # Installation directories.
+-MAN8DIR ?= $(DESTDIR)/usr/share/man/man8
+-MAN3DIR ?= $(DESTDIR)/usr/share/man/man3
++PREFIX ?= /usr
++MAN8DIR ?= $(DESTDIR)$(PREFIX)/share/man/man8
++MAN3DIR ?= $(DESTDIR)$(PREFIX)/share/man/man3
+ 
+ all:
+ 
+diff -durN libsepol.orig/src/libsepol.pc.in libsepol/src/libsepol.pc.in
+--- libsepol.orig/src/libsepol.pc.in	2018-01-12 12:42:30.912043126 +0100
++++ libsepol/src/libsepol.pc.in	2018-01-12 09:58:04.322148228 +0100
+@@ -1,6 +1,6 @@
+ prefix=@prefix@
+ exec_prefix=${prefix}
+-libdir=${exec_prefix}/@libdir@
++libdir=@libdir@
+ includedir=@includedir@
+ 
+ Name: libsepol
+diff -durN libsepol.orig/src/Makefile libsepol/src/Makefile
+--- libsepol.orig/src/Makefile	2018-01-12 12:42:30.912043126 +0100
++++ libsepol/src/Makefile	2018-01-12 09:58:04.322148228 +0100
+@@ -1,11 +1,10 @@
+ # Installation directories.
+-PREFIX ?= $(DESTDIR)/usr
++PREFIX ?= /usr
+ INCLUDEDIR ?= $(PREFIX)/include
+ LIBDIR ?= $(PREFIX)/lib
+-SHLIBDIR ?= $(DESTDIR)/lib
+ RANLIB ?= ranlib
+-LIBBASE ?= $(shell basename $(LIBDIR))
+ CILDIR ?= ../cil
++LIBINSTALL = $(DESTDIR)$(LIBDIR)
+ 
+ VERSION = $(shell cat ../VERSION)
+ LIBVERSION = 1
+@@ -52,7 +51,7 @@
+ 	ln -sf $@ $(TARGET) 
+ 
+ $(LIBPC): $(LIBPC).in ../VERSION
+-	sed -e 's/@VERSION@/$(VERSION)/; s:@prefix@:$(PREFIX):; s:@libdir@:$(LIBBASE):; s:@includedir@:$(INCLUDEDIR):' < $< > $@
++	sed -e 's/@VERSION@/$(VERSION)/; s:@prefix@:$(PREFIX):; s:@libdir@:$(LIBDIR):; s:@includedir@:$(INCLUDEDIR):' < $< > $@
+ 
+ $(LIBMAP): $(LIBMAP).in
+ ifneq ($(DISABLE_CIL),y)
+@@ -80,16 +79,16 @@
+ 	$(CC) $(CFLAGS) -fPIC -DSHARED -c -o $@ $<
+ 
+ install: all
+-	test -d $(LIBDIR) || install -m 755 -d $(LIBDIR)
+-	install -m 644 $(LIBA) $(LIBDIR)
+-	test -d $(SHLIBDIR) || install -m 755 -d $(SHLIBDIR)
+-	install -m 755 $(LIBSO) $(SHLIBDIR)
+-	test -d $(LIBDIR)/pkgconfig || install -m 755 -d $(LIBDIR)/pkgconfig
+-	install -m 644 $(LIBPC) $(LIBDIR)/pkgconfig
+-	$(LN) -sf --relative $(SHLIBDIR)/$(LIBSO) $(LIBDIR)/$(TARGET)
++	test -d $(LIBINSTALL) || install -m 755 -d $(LIBINSTALL)
++	install -m 644 $(LIBA) $(LIBINSTALL)
++	test -d $(LIBINSTALL) || install -m 755 -d $(LIBINSTALL)
++	install -m 755 $(LIBSO) $(LIBINSTALL)
++	test -d $(LIBINSTALL)/pkgconfig || install -m 755 -d $(LIBINSTALL)/pkgconfig
++	install -m 644 $(LIBPC) $(LIBINSTALL)/pkgconfig
++	$(LN) -sf --relative $(LIBINSTALL)/$(LIBSO) $(LIBINSTALL)/$(TARGET)
+ 
+ relabel:
+-	/sbin/restorecon $(SHLIBDIR)/$(LIBSO)
++	/sbin/restorecon $(LIBINSTALL)/$(LIBSO)
+ 
+ clean: 
+ 	-rm -f $(LIBPC) $(LIBMAP) $(OBJS) $(LOBJS) $(LIBA) $(LIBSO) $(TARGET) $(CIL_GENERATED)
+diff -durN libsepol.orig/utils/Makefile libsepol/utils/Makefile
+--- libsepol.orig/utils/Makefile	2018-01-12 12:42:30.915376458 +0100
++++ libsepol/utils/Makefile	2018-01-12 09:58:04.322148228 +0100
+@@ -1,6 +1,6 @@
+ # Installation directories.
+-PREFIX ?= $(DESTDIR)/usr
+-BINDIR ?= $(PREFIX)/bin
++PREFIX ?= /usr
++BINDIR ?= $(DESTDIR)$(PREFIX)/bin
+ 
+ CFLAGS ?= -Wall -Werror
+ override CFLAGS += -I../include
diff --git a/package/libsepol/0001-support-static-only.patch b/package/libsepol/0003-support-static-only.patch
similarity index 57%
rename from package/libsepol/0001-support-static-only.patch
rename to package/libsepol/0003-support-static-only.patch
index 185a564..8cf9a18 100644
--- a/package/libsepol/0001-support-static-only.patch
+++ b/package/libsepol/0003-support-static-only.patch
@@ -15,11 +15,10 @@ Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
  src/Makefile | 13 ++++++++++---
  1 file changed, 10 insertions(+), 3 deletions(-)
 
-diff --git a/src/Makefile b/src/Makefile
-index 819d261..040921d 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -40,7 +40,12 @@ LDFLAGS += -undefined dynamic_lookup
+diff -durNw libsepol-2.7.orig/src/Makefile libsepol-2.7/src/Makefile
+--- libsepol-2.7.orig/src/Makefile	2018-01-15 21:07:51.285183415 +0100
++++ libsepol-2.7/src/Makefile	2018-01-15 21:08:56.515182717 +0100
+@@ -39,7 +39,12 @@
  LN=gln
  endif
  
@@ -33,22 +32,14 @@ index 819d261..040921d 100644
  
  
  $(LIBA):  $(OBJS)
-@@ -82,11 +87,13 @@ endif
+@@ -81,8 +86,10 @@
  install: all
- 	test -d $(LIBDIR) || install -m 755 -d $(LIBDIR)
- 	install -m 644 $(LIBA) $(LIBDIR)
--	test -d $(SHLIBDIR) || install -m 755 -d $(SHLIBDIR)
--	install -m 755 $(LIBSO) $(SHLIBDIR)
- 	test -d $(LIBDIR)/pkgconfig || install -m 755 -d $(LIBDIR)/pkgconfig
- 	install -m 644 $(LIBPC) $(LIBDIR)/pkgconfig
+ 	test -d $(LIBINSTALL) || install -m 755 -d $(LIBINSTALL)
+ 	install -m 644 $(LIBA) $(LIBINSTALL)
 +ifeq ($(STATIC),)
-+	test -d $(SHLIBDIR) || install -m 755 -d $(SHLIBDIR)
-+	install -m 755 $(LIBSO) $(SHLIBDIR)
- 	$(LN) -sf --relative $(SHLIBDIR)/$(LIBSO) $(LIBDIR)/$(TARGET)
+ 	test -d $(LIBINSTALL) || install -m 755 -d $(LIBINSTALL)
+ 	install -m 755 $(LIBSO) $(LIBINSTALL)
 +endif
- 
- relabel:
- 	/sbin/restorecon $(SHLIBDIR)/$(LIBSO)
--- 
-2.13.6
-
+ 	test -d $(LIBINSTALL)/pkgconfig || install -m 755 -d $(LIBINSTALL)/pkgconfig
+ 	install -m 644 $(LIBPC) $(LIBINSTALL)/pkgconfig
+ 	$(LN) -sf --relative $(LIBINSTALL)/$(LIBSO) $(LIBINSTALL)/$(TARGET)
diff --git a/package/libsepol/0003-revert-ln-relative.patch b/package/libsepol/0004-revert-ln-relative.patch
similarity index 54%
rename from package/libsepol/0003-revert-ln-relative.patch
rename to package/libsepol/0004-revert-ln-relative.patch
index 488a9ab..9d1553e 100644
--- a/package/libsepol/0003-revert-ln-relative.patch
+++ b/package/libsepol/0004-revert-ln-relative.patch
@@ -12,23 +12,16 @@ they are maintained (up to 10 years in some cases?).
 For the sake of Buildroot, revert the upstream patch.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- src/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/Makefile b/src/Makefile
-index 040921d..e811c9e 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -92,7 +92,7 @@ install: all
- ifeq ($(STATIC),)
- 	test -d $(SHLIBDIR) || install -m 755 -d $(SHLIBDIR)
- 	install -m 755 $(LIBSO) $(SHLIBDIR)
--	$(LN) -sf --relative $(SHLIBDIR)/$(LIBSO) $(LIBDIR)/$(TARGET)
-+	cd $(LIBDIR) && ln -sf ../../`basename $(SHLIBDIR)`/$(LIBSO) $(TARGET)
+diff -durNw libsepol-2.7.orig/src/Makefile libsepol-2.7/src/Makefile
+--- libsepol-2.7.orig/src/Makefile	2018-01-15 21:37:12.821831315 +0100
++++ libsepol-2.7/src/Makefile	2018-01-15 21:38:03.838497434 +0100
+@@ -92,7 +92,7 @@
  endif
+ 	test -d $(LIBINSTALL)/pkgconfig || install -m 755 -d $(LIBINSTALL)/pkgconfig
+ 	install -m 644 $(LIBPC) $(LIBINSTALL)/pkgconfig
+-	$(LN) -sf --relative $(LIBINSTALL)/$(LIBSO) $(LIBINSTALL)/$(TARGET)
++	cd $(LIBINSTALL) && ln -sf $(LIBSO) $(TARGET)
  
  relabel:
--- 
-2.13.6
-
+ 	/sbin/restorecon $(LIBINSTALL)/$(LIBSO)
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index c54c3bf..5932ca1 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -20,9 +20,7 @@ LIBSEPOL_MAKE_FLAGS += STATIC=1
 endif
 
 define LIBSEPOL_BUILD_CMDS
-	# DESTDIR is needed during the compile to compute library and
-	# header paths.
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBSEPOL_MAKE_FLAGS) DESTDIR=$(STAGING_DIR)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBSEPOL_MAKE_FLAGS)
 endef
 
 define LIBSEPOL_INSTALL_STAGING_CMDS
@@ -35,7 +33,6 @@ endef
 
 HOST_LIBSEPOL_MAKE_ENV = \
 	$(HOST_MAKE_ENV) \
-	DESTDIR=$(HOST_DIR) \
 	PREFIX=$(HOST_DIR)
 
 define HOST_LIBSEPOL_BUILD_CMDS
