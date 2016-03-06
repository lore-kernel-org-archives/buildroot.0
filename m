From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Mar 2016 00:04:54 +0100
Subject: [Buildroot] [PATCH 1/3] package/libcap: install .pc file
	unconditionally
In-Reply-To: <cover.1457305443.git.yann.morin.1998@free.fr>
References: <cover.1457305443.git.yann.morin.1998@free.fr>
Message-ID: <347ad80ae1c4e2168f2ae458999f25bc5f66245f.1457305443.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And re-format patches as git patches.

Fixes:
    http://autobuild.buildroot.org/results/c13/c13fb87c2e4739106e256f34fff93696b0133bf6/
    http://autobuild.buildroot.org/results/f82/f822801f9b811e1a0fb4627f6b528116375cacfe/
    http://autobuild.buildroot.org/results/07c/07c0315a35089a8d3e8eb1a305dcd8bf1fb882ee/
    and many more...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 ...build-system-fixes-for-cross-compilation.patch} | 47 +++++++++++++---------
 ...-install-into-install-shared-install-sta.patch} | 26 ++++++++++--
 package/libcap/libcap.mk                           |  2 +-
 3 files changed, 52 insertions(+), 23 deletions(-)
 rename package/libcap/{0001-build-system.patch => 0001-build-system-fixes-for-cross-compilation.patch} (69%)
 rename package/libcap/{0002-split-static-shared-install.patch => 0002-libcap-split-install-into-install-shared-install-sta.patch} (52%)

diff --git a/package/libcap/0001-build-system.patch b/package/libcap/0001-build-system-fixes-for-cross-compilation.patch
similarity index 69%
rename from package/libcap/0001-build-system.patch
rename to package/libcap/0001-build-system-fixes-for-cross-compilation.patch
index 8915a69..705bbc7 100644
--- a/package/libcap/0001-build-system.patch
+++ b/package/libcap/0001-build-system-fixes-for-cross-compilation.patch
@@ -1,26 +1,21 @@
+From 7f48413ef1688df0d7fc25e477f4e6c0c55edfac Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Sun, 6 Mar 2016 22:52:02 +0100
+Subject: [PATCH] build-system: fixes for cross-compilation
+
 Avoid the libcap buildsys forcing CC/CFLAGS/LDFLAGS/AR/RANLIB
 Also install the shared lib +x
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 
-diff -Nura libcap-2.22.orig/libcap/Makefile libcap-2.22/libcap/Makefile
---- libcap-2.22.orig/libcap/Makefile	2010-08-08 19:26:04.000000000 -0300
-+++ libcap-2.22/libcap/Makefile	2011-12-14 11:33:51.761800334 -0300
-@@ -65,7 +65,7 @@
- 	install -m 0644 include/sys/capability.h $(INCDIR)/sys
- 	mkdir -p -m 0755 $(LIBDIR)
- 	install -m 0644 $(STALIBNAME) $(LIBDIR)/$(STALIBNAME)
--	install -m 0644 $(MINLIBNAME) $(LIBDIR)/$(MINLIBNAME)
-+	install -m 0755 $(MINLIBNAME) $(LIBDIR)/$(MINLIBNAME)
- 	ln -sf $(MINLIBNAME) $(LIBDIR)/$(MAJLIBNAME)
- 	ln -sf $(MAJLIBNAME) $(LIBDIR)/$(LIBNAME)
- ifeq ($(FAKEROOT),)
-diff -Nura libcap-2.22.orig/Make.Rules libcap-2.22/Make.Rules
---- libcap-2.22.orig/Make.Rules	2011-07-24 23:18:23.000000000 -0300
-+++ libcap-2.22/Make.Rules	2011-12-14 11:33:28.707278685 -0300
-@@ -47,25 +47,25 @@
- KERNEL_HEADERS := $(topdir)/libcap/include
- IPATH += -fPIC -I$(topdir)/libcap/include -I$(KERNEL_HEADERS)
+diff --git a/Make.Rules b/Make.Rules
+index ec1c474..8a8fc50 100644
+--- a/Make.Rules
++++ b/Make.Rules
+@@ -48,25 +48,25 @@ MINOR=24
+ KERNEL_HEADERS := $(topdir)/libcap/include/uapi
+ IPATH += -fPIC -I$(KERNEL_HEADERS) -I$(topdir)/libcap/include
  
 -CC := gcc
 -CFLAGS := -O2 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
@@ -52,3 +47,19 @@ diff -Nura libcap-2.22.orig/Make.Rules libcap-2.22/Make.Rules
  INDENT := $(shell if [ -n "$(which indent 2>/dev/null)" ]; then echo "| indent -kr" ; fi)
  DYNAMIC := $(shell if [ ! -d "$(topdir)/.git" ]; then echo yes; fi)
  LIBATTR := yes
+diff --git a/libcap/Makefile b/libcap/Makefile
+index 20ab00f..97fea3f 100644
+--- a/libcap/Makefile
++++ b/libcap/Makefile
+@@ -75,7 +75,7 @@ install: all
+ 	install -m 0644 include/sys/capability.h $(INCDIR)/sys
+ 	mkdir -p -m 0755 $(LIBDIR)
+ 	install -m 0644 $(STALIBNAME) $(LIBDIR)/$(STALIBNAME)
+-	install -m 0644 $(MINLIBNAME) $(LIBDIR)/$(MINLIBNAME)
++	install -m 0755 $(MINLIBNAME) $(LIBDIR)/$(MINLIBNAME)
+ 	ln -sf $(MINLIBNAME) $(LIBDIR)/$(MAJLIBNAME)
+ 	ln -sf $(MAJLIBNAME) $(LIBDIR)/$(LIBNAME)
+ ifeq ($(FAKEROOT),)
+-- 
+1.9.1
+
diff --git a/package/libcap/0002-split-static-shared-install.patch b/package/libcap/0002-libcap-split-install-into-install-shared-install-sta.patch
similarity index 52%
rename from package/libcap/0002-split-static-shared-install.patch
rename to package/libcap/0002-libcap-split-install-into-install-shared-install-sta.patch
index 21e7f2a..a7a9d13 100644
--- a/package/libcap/0002-split-static-shared-install.patch
+++ b/package/libcap/0002-libcap-split-install-into-install-shared-install-sta.patch
@@ -1,15 +1,20 @@
-libcap: split install into install-shared/install-static
+From 8d7339169b9a5df2082731fe5468923be4be39af Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 6 Mar 2016 22:53:24 +0100
+Subject: [PATCH] libcap: split install into install-shared/install-static
 
 In order to support static only builds, split the install target into
 install-shared and install-static targets.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[yann.morin.1998 at free.fr: install the .pc file in the common rule]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 
-Index: b/libcap/Makefile
-===================================================================
+diff --git a/libcap/Makefile b/libcap/Makefile
+index 97fea3f..7ac45dd 100644
 --- a/libcap/Makefile
 +++ b/libcap/Makefile
-@@ -60,11 +60,17 @@
+@@ -70,19 +70,25 @@ $(MINLIBNAME): $(OBJS)
  cap_text.o: cap_text.c $(USE_GPERF_OUTPUT) $(INCLS)
  	$(CC) $(CFLAGS) $(IPATH) $(INCLUDE_GPERF_OUTPUT) -c $< -o $@
  
@@ -19,6 +24,8 @@ Index: b/libcap/Makefile
 +install-common:
  	mkdir -p -m 0755 $(INCDIR)/sys
  	install -m 0644 include/sys/capability.h $(INCDIR)/sys
++	mkdir -p -m 0755 $(PKGCONFIGDIR)
++	install -m 0644 libcap.pc $(PKGCONFIGDIR)/libcap.pc
  	mkdir -p -m 0755 $(LIBDIR)
 +
 +install-static: install-common
@@ -28,3 +35,14 @@ Index: b/libcap/Makefile
  	install -m 0755 $(MINLIBNAME) $(LIBDIR)/$(MINLIBNAME)
  	ln -sf $(MINLIBNAME) $(LIBDIR)/$(MAJLIBNAME)
  	ln -sf $(MAJLIBNAME) $(LIBDIR)/$(LIBNAME)
+ ifeq ($(FAKEROOT),)
+ 	-/sbin/ldconfig
+ endif
+-	mkdir -p -m 0755 $(PKGCONFIGDIR)
+-	install -m 0644 libcap.pc $(PKGCONFIGDIR)/libcap.pc
+ 
+ clean:
+ 	$(LOCALCLEAN)
+-- 
+1.9.1
+
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 252c4bb..8625139 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -23,7 +23,7 @@ endif
 HOST_LIBCAP_DEPENDENCIES = host-attr
 
 ifeq ($(BR2_STATIC_LIBS),y)
-LIBCAP_MAKE_TARGET = libcap.a
+LIBCAP_MAKE_TARGET = libcap.a libcap.pc
 LIBCAP_MAKE_INSTALL_TARGET = install-static
 else
 LIBCAP_MAKE_TARGET = all
-- 
1.9.1
