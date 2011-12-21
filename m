From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Dec 2011 23:01:02 +0100
Subject: [Buildroot] [git commit] libcap: security bump to version 2.22
Message-ID: <20111221220349.EA6E98FAAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2b55b459c5e61575b5ff3e10e5161f87c0da8df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...system.patch => libcap-2.22-build-system.patch} |   34 ++++++++++----------
 package/libcap/libcap.mk                           |    7 +++-
 2 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/package/libcap/libcap-2.20-build-system.patch b/package/libcap/libcap-2.22-build-system.patch
similarity index 74%
rename from package/libcap/libcap-2.20-build-system.patch
rename to package/libcap/libcap-2.22-build-system.patch
index 397aff2..8915a69 100644
--- a/package/libcap/libcap-2.20-build-system.patch
+++ b/package/libcap/libcap-2.22-build-system.patch
@@ -3,21 +3,33 @@ Also install the shared lib +x
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-diff -Nura libcap-2.20/Make.Rules libcap-2.20-build/Make.Rules
---- libcap-2.20/Make.Rules	2011-01-19 02:06:44.000000000 -0300
-+++ libcap-2.20-build/Make.Rules	2011-04-19 14:07:53.544903094 -0300
+diff -Nura libcap-2.22.orig/libcap/Makefile libcap-2.22/libcap/Makefile
+--- libcap-2.22.orig/libcap/Makefile	2010-08-08 19:26:04.000000000 -0300
++++ libcap-2.22/libcap/Makefile	2011-12-14 11:33:51.761800334 -0300
+@@ -65,7 +65,7 @@
+ 	install -m 0644 include/sys/capability.h $(INCDIR)/sys
+ 	mkdir -p -m 0755 $(LIBDIR)
+ 	install -m 0644 $(STALIBNAME) $(LIBDIR)/$(STALIBNAME)
+-	install -m 0644 $(MINLIBNAME) $(LIBDIR)/$(MINLIBNAME)
++	install -m 0755 $(MINLIBNAME) $(LIBDIR)/$(MINLIBNAME)
+ 	ln -sf $(MINLIBNAME) $(LIBDIR)/$(MAJLIBNAME)
+ 	ln -sf $(MAJLIBNAME) $(LIBDIR)/$(LIBNAME)
+ ifeq ($(FAKEROOT),)
+diff -Nura libcap-2.22.orig/Make.Rules libcap-2.22/Make.Rules
+--- libcap-2.22.orig/Make.Rules	2011-07-24 23:18:23.000000000 -0300
++++ libcap-2.22/Make.Rules	2011-12-14 11:33:28.707278685 -0300
 @@ -47,25 +47,25 @@
  KERNEL_HEADERS := $(topdir)/libcap/include
  IPATH += -fPIC -I$(topdir)/libcap/include -I$(KERNEL_HEADERS)
  
 -CC := gcc
--CFLAGS := -O2
+-CFLAGS := -O2 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 -BUILD_CC := $(CC)
 -BUILD_CFLAGS := $(CFLAGS) $(IPATH)
 -AR := ar
 -RANLIB := ranlib
 +CC ?= gcc
-+CFLAGS ?= -O2
++CFLAGS ?= -O2 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 +BUILD_CC ?= $(CC)
 +BUILD_CFLAGS ?= $(CFLAGS) $(IPATH)
 +AR ?= ar
@@ -40,15 +52,3 @@ diff -Nura libcap-2.20/Make.Rules libcap-2.20-build/Make.Rules
  INDENT := $(shell if [ -n "$(which indent 2>/dev/null)" ]; then echo "| indent -kr" ; fi)
  DYNAMIC := $(shell if [ ! -d "$(topdir)/.git" ]; then echo yes; fi)
  LIBATTR := yes
-diff -Nura libcap-2.20/libcap/Makefile libcap-2.20-build/libcap/Makefile
---- libcap-2.20/libcap/Makefile	2010-08-08 19:26:04.000000000 -0300
-+++ libcap-2.20-build/libcap/Makefile	2011-04-19 14:08:29.377146094 -0300
-@@ -65,7 +65,7 @@
- 	install -m 0644 include/sys/capability.h $(INCDIR)/sys
- 	mkdir -p -m 0755 $(LIBDIR)
- 	install -m 0644 $(STALIBNAME) $(LIBDIR)/$(STALIBNAME)
--	install -m 0644 $(MINLIBNAME) $(LIBDIR)/$(MINLIBNAME)
-+	install -m 0755 $(MINLIBNAME) $(LIBDIR)/$(MINLIBNAME)
- 	ln -sf $(MINLIBNAME) $(LIBDIR)/$(MAJLIBNAME)
- 	ln -sf $(MAJLIBNAME) $(LIBDIR)/$(LIBNAME)
- ifeq ($(FAKEROOT),)
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index a7b33a0..9d6acf2 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,8 +4,11 @@
 #
 #############################################################
 
-LIBCAP_VERSION = 2.20
-LIBCAP_SITE = http://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
+LIBCAP_VERSION = 2.22
+# Until kernel.org is completely back up use debian mirror
+#LIBCAP_SITE = http://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
+LIBCAP_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libc/libcap2
+LIBCAP_SOURCE = libcap2_$(LIBCAP_VERSION).orig.tar.gz
 LIBCAP_DEPENDENCIES = host-libcap
 LIBCAP_INSTALL_STAGING = YES
 
