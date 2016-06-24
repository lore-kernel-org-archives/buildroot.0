From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 24 Jun 2016 14:50:07 -0400
Subject: [Buildroot] [PATCH 1/1] V2 libsepol: version bump to 2.5
Message-ID: <1466794207-8875-1-git-send-email-Aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The previously submitted patch had a broken 0001-support-static-only.patch.
I didn't include the line: all: $(ALL_TARGETS) which would cause "make install" to fail.
This has been fixed in this version.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libsepol/0001-support-static-only.patch       | 13 +++++++------
 package/libsepol/0002-workaround-blackfin-issue.patch |  7 ++++---
 package/libsepol/libsepol.hash                        |  2 +-
 package/libsepol/libsepol.mk                          |  4 ++--
 4 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/package/libsepol/0001-support-static-only.patch b/package/libsepol/0001-support-static-only.patch
index b974680..04036ea 100644
--- a/package/libsepol/0001-support-static-only.patch
+++ b/package/libsepol/0001-support-static-only.patch
@@ -12,21 +12,21 @@ Index: b/src/Makefile
 ===================================================================
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -17,7 +17,12 @@
- CFLAGS ?= -Werror -Wall -W -Wundef -Wshadow -Wmissing-noreturn -Wmissing-format-attribute
- override CFLAGS += -I. -I../include -D_GNU_SOURCE
+@@ -31,8 +31,12 @@ override CFLAGS += -I$(CILDIR)/include
+ endif
+ 
  
 -all: $(LIBA) $(LIBSO) $(LIBPC)
 +ALL_TARGETS = $(LIBA) $(LIBPC)
 +ifeq ($(STATIC),)
 +ALL_TARGETS += $(LIBSO)
 +endif
-+
+ 
 +all: $(ALL_TARGETS)
  
  $(LIBA):  $(OBJS)
  	$(AR) rcs $@ $^
-@@ -39,11 +44,13 @@
+@@ -66,11 +70,13 @@ endif
  install: all
  	test -d $(LIBDIR) || install -m 755 -d $(LIBDIR)
  	install -m 644 $(LIBA) $(LIBDIR)
@@ -34,10 +34,11 @@ Index: b/src/Makefile
 -	install -m 755 $(LIBSO) $(SHLIBDIR)
  	test -d $(LIBDIR)/pkgconfig || install -m 755 -d $(LIBDIR)/pkgconfig
  	install -m 644 $(LIBPC) $(LIBDIR)/pkgconfig
+-	ln -sf --relative $(SHLIBDIR)/$(LIBSO) $(LIBDIR)/$(TARGET)
 +ifeq ($(STATIC),)
 +	test -d $(SHLIBDIR) || install -m 755 -d $(SHLIBDIR)
 +	install -m 755 $(LIBSO) $(SHLIBDIR)
- 	cd $(LIBDIR) && ln -sf ../../`basename $(SHLIBDIR)`/$(LIBSO) $(TARGET)
++	cd $(LIBDIR) && ln -sf ../../`basename $(SHLIBDIR)`/$(LIBSO) $(TARGET)
 +endif
  
  relabel:
diff --git a/package/libsepol/0002-workaround-blackfin-issue.patch b/package/libsepol/0002-workaround-blackfin-issue.patch
index 5d00c69..b6809fe 100644
--- a/package/libsepol/0002-workaround-blackfin-issue.patch
+++ b/package/libsepol/0002-workaround-blackfin-issue.patch
@@ -13,12 +13,13 @@ Index: b/src/dso.h
 ===================================================================
 --- a/src/dso.h
 +++ b/src/dso.h
-@@ -1,7 +1,7 @@
- #ifndef _SELINUX_DSO_H
- #define _SELINUX_DSO_H	1
+@@ -5,7 +5,7 @@
+     #define DISABLE_SYMVER 1
+ #endif
  
 -#ifdef SHARED
 +#if defined(SHARED) && !defined(__bfin__)
  # define hidden __attribute__ ((visibility ("hidden")))
  # define hidden_proto(fct) __hidden_proto (fct, fct##_internal)
  # define __hidden_proto(fct, internal)	\
+
diff --git a/package/libsepol/libsepol.hash b/package/libsepol/libsepol.hash
index df5dabd..266ce43 100644
--- a/package/libsepol/libsepol.hash
+++ b/package/libsepol/libsepol.hash
@@ -1,2 +1,2 @@
 # From https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256	290d17f583635a4a5d8a2141511272adf0571c4205cdea38b5a68df20d58a70b  libsepol-2.1.9.tar.gz
+sha256 2bdeec56d0a08b082b93b40703b4b3329cc5562152f7254d8f6ef6b56afe850a  libsepol-2.5.tar.gz
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 1e709c6..93896cf 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSEPOL_VERSION = 2.1.9
-LIBSEPOL_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20130423
+LIBSEPOL_VERSION = 2.5
+LIBSEPOL_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223
 LIBSEPOL_LICENSE = LGPLv2.1+
 LIBSEPOL_LICENSE_FILES = COPYING
 
-- 
2.7.4
