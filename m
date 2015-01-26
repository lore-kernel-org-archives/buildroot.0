From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jan 2015 23:19:50 +0100
Subject: [Buildroot] [git commit] package/gnu-efi: bump version to 3.0.1
Message-ID: <20150126221958.06F74803C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66d3cce7056c8996329c1aab6a71602bd8b37159
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

remove upstream patch gnu-efi-03-parallel-make.patch

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...S-CPPFLAGS-to-be-completed-from-the-envir.patch |   80 ++++++++++++++++++++
 ...2-Fix-parallel-make-failure-for-archives.patch} |   55 ++++++++------
 .../gnu-efi/gnu-efi-01-use-override-cflags.patch   |   53 -------------
 package/gnu-efi/gnu-efi-03-parallel-make.patch     |   22 ------
 package/gnu-efi/gnu-efi.hash                       |    5 +-
 package/gnu-efi/gnu-efi.mk                         |    4 +-
 6 files changed, 117 insertions(+), 102 deletions(-)

diff --git a/package/gnu-efi/0001-Allow-CFLAGS-CPPFLAGS-to-be-completed-from-the-envir.patch b/package/gnu-efi/0001-Allow-CFLAGS-CPPFLAGS-to-be-completed-from-the-envir.patch
new file mode 100644
index 0000000..eee0a9a
--- /dev/null
+++ b/package/gnu-efi/0001-Allow-CFLAGS-CPPFLAGS-to-be-completed-from-the-envir.patch
@@ -0,0 +1,80 @@
+From eea0f62a1f6712f10afe47635b80a061505d2d2f Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sat, 17 Jan 2015 18:33:37 +0100
+Subject: [PATCH 1/2] Allow CFLAGS/CPPFLAGS to be completed from the
+ environment
+
+Buildroot passes its own CPPFLAGS and CFLAGS in the environment, so
+the CFLAGS += and CPPFLAGS += statements in gnu-efi Makefile have no
+effect. Change these to override <VARIABLE> += so that they extend the
+flags passed by Buildroot.
+
+[Romain:
+ - rebase on top of 3.0.1 release]
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ Make.defaults | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/Make.defaults b/Make.defaults
+index 169273d..b0ddea0 100644
+--- a/Make.defaults
++++ b/Make.defaults
+@@ -80,14 +80,14 @@ endif
+ #
+ 
+ # Arch-specific compilation flags
+-CPPFLAGS += -DCONFIG_$(ARCH)
++override CPPFLAGS += -DCONFIG_$(ARCH)
+ 
+ ifeq ($(ARCH),ia64)
+-  CFLAGS += -mfixed-range=f32-f127
++  override CFLAGS += -mfixed-range=f32-f127
+ endif
+ 
+ ifeq ($(ARCH),ia32)
+-  CFLAGS += -mno-mmx -mno-sse
++  override CFLAGS += -mno-mmx -mno-sse
+   ifeq ($(HOSTARCH),x86_64)
+     ARCH3264 = -m32
+   endif
+@@ -103,10 +103,10 @@ ifeq ($(ARCH),x86_64)
+                                  && [ $(GCCMINOR) -ge "7" ] ) ) \
+                           && echo 1)
+   ifeq ($(GCCNEWENOUGH),1)
+-    CPPFLAGS += -DGNU_EFI_USE_MS_ABI -maccumulate-outgoing-args --std=c11
++    override CPPFLAGS += -DGNU_EFI_USE_MS_ABI -maccumulate-outgoing-args --std=c11
+   endif
+ 
+-  CFLAGS += -mno-red-zone -mno-mmx -mno-sse
++  override CFLAGS += -mno-red-zone -mno-mmx -mno-sse
+   ifeq ($(HOSTARCH),ia32)
+     ARCH3264 = -m64
+   endif
+@@ -127,7 +127,7 @@ export LIBGCC=$(shell $(CC) $(ARCH3264) -print-libgcc-file-name)
+ endif
+ 
+ ifeq ($(ARCH),arm)
+-CFLAGS += -marm
++override CFLAGS += -marm
+ endif
+ 
+ # Generic compilation flags
+@@ -135,10 +135,10 @@ INCDIR  += -I$(SRCDIR) -I$(TOPDIR)/inc -I$(TOPDIR)/inc/$(ARCH) \
+            -I$(TOPDIR)/inc/protocol
+ 
+ ifeq (FreeBSD, $(findstring FreeBSD, $(OS)))
+-CFLAGS  += $(ARCH3264) -O2 -fpic -Wall -fshort-wchar -fno-strict-aliasing \
++override CFLAGS  += $(ARCH3264) -O2 -fpic -Wall -fshort-wchar -fno-strict-aliasing \
+            -ffreestanding -fno-stack-protector
+ else
+-CFLAGS  += $(ARCH3264) -O2 -fpic -Wall -fshort-wchar -fno-strict-aliasing \
++override CFLAGS  += $(ARCH3264) -O2 -fpic -Wall -fshort-wchar -fno-strict-aliasing \
+            -fno-merge-constants -ffreestanding -fno-stack-protector       \
+            -fno-stack-check
+ endif
+-- 
+1.9.3
+
diff --git a/package/gnu-efi/gnu-efi-02-parallel-make-archives.patch b/package/gnu-efi/0002-Fix-parallel-make-failure-for-archives.patch
similarity index 54%
rename from package/gnu-efi/gnu-efi-02-parallel-make-archives.patch
rename to package/gnu-efi/0002-Fix-parallel-make-failure-for-archives.patch
index e5b47c1..6e12388 100644
--- a/package/gnu-efi/gnu-efi-02-parallel-make-archives.patch
+++ b/package/gnu-efi/0002-Fix-parallel-make-failure-for-archives.patch
@@ -1,4 +1,7 @@
-Fix parallel make failure for archives
+From 7e9a26b0fc0bd8ed64a5eced5ea78bcea8ae3bbc Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sat, 17 Jan 2015 18:44:04 +0100
+Subject: [PATCH 2/2] Fix parallel make failure for archives
 
 Upstream-Status: Pending
 
@@ -10,33 +13,22 @@ of -j.
 See http://www.chemie.fu-berlin.de/chemnet/use/info/make/make_toc.html#TOC105
 for details.
 
+[Romain:
+ - rebase on top of 3.0.1 release]
+
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 Signed-off-by: Darren Hart <dvhart@linux.intel.com>
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 ---
----
- gnuefi/Makefile |    3 ++-
- lib/Makefile    |    3 ++-
+ gnuefi/Makefile | 3 ++-
+ lib/Makefile    | 3 ++-
  2 files changed, 4 insertions(+), 2 deletions(-)
 
-Index: gnu-efi-3.0/lib/Makefile
-===================================================================
---- gnu-efi-3.0.orig/lib/Makefile
-+++ gnu-efi-3.0/lib/Makefile
-@@ -66,7 +66,8 @@ all: libsubdirs libefi.a
- libsubdirs:
- 	for sdir in $(SUBDIRS); do mkdir -p $$sdir; done
- 
--libefi.a: $(patsubst %,libefi.a(%),$(OBJS))
-+libefi.a: $(OBJS)
-+	$(AR) rv $@ $(OBJS)
- 
- clean:
- 	rm -f libefi.a *~ $(OBJS) */*.o
-Index: gnu-efi-3.0/gnuefi/Makefile
-===================================================================
---- gnu-efi-3.0.orig/gnuefi/Makefile
-+++ gnu-efi-3.0/gnuefi/Makefile
-@@ -51,7 +51,8 @@ TARGETS	= crt0-efi-$(ARCH).o libgnuefi.a
+diff --git a/gnuefi/Makefile b/gnuefi/Makefile
+index d234ac0..d29575d 100644
+--- a/gnuefi/Makefile
++++ b/gnuefi/Makefile
+@@ -54,7 +54,8 @@ TARGETS	= crt0-efi-$(ARCH).o libgnuefi.a
  
  all:	$(TARGETS)
  
@@ -46,3 +38,20 @@ Index: gnu-efi-3.0/gnuefi/Makefile
  
  clean:
  	rm -f $(TARGETS) *~ *.o $(OBJS)
+diff --git a/lib/Makefile b/lib/Makefile
+index 019ad57..c6abcae 100644
+--- a/lib/Makefile
++++ b/lib/Makefile
+@@ -73,7 +73,8 @@ all: libsubdirs libefi.a
+ libsubdirs:
+ 	for sdir in $(SUBDIRS); do mkdir -p $$sdir; done
+ 
+-libefi.a: $(patsubst %,libefi.a(%),$(OBJS))
++libefi.a: $(OBJS)
++	$(AR) rv $@ $(OBJS)
+ 
+ clean:
+ 	rm -f libefi.a *~ $(OBJS) */*.o
+-- 
+1.9.3
+
diff --git a/package/gnu-efi/gnu-efi-01-use-override-cflags.patch b/package/gnu-efi/gnu-efi-01-use-override-cflags.patch
deleted file mode 100644
index 07c3a9f..0000000
--- a/package/gnu-efi/gnu-efi-01-use-override-cflags.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-Allow CFLAGS/CPPFLAGS to be completed from the environment
-
-Buildroot passes its own CPPFLAGS and CFLAGS in the environment, so
-the CFLAGS += and CPPFLAGS += statements in gnu-efi Makefile have no
-effect. Change these to override <VARIABLE> += so that they extend the
-flags passed by Buildroot.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/Make.defaults
-===================================================================
---- a/Make.defaults
-+++ b/Make.defaults
-@@ -83,25 +83,25 @@
-                                && [ $(GCCMINOR) -ge "7" ] ) ) \
-                         && echo 1)
- ifeq ($(GCCNEWENOUGH),1)
--  CPPFLAGS += -DGNU_EFI_USE_MS_ABI -maccumulate-outgoing-args --std=c11
-+  override CPPFLAGS += -DGNU_EFI_USE_MS_ABI -maccumulate-outgoing-args --std=c11
- endif
- 
- # Arch-specific compilation flags
--CPPFLAGS += -DCONFIG_$(ARCH)
-+override CPPFLAGS += -DCONFIG_$(ARCH)
- 
- ifeq ($(ARCH),ia64)
--  CFLAGS += -mfixed-range=f32-f127
-+  override CFLAGS += -mfixed-range=f32-f127
- endif
- 
- ifeq ($(ARCH),ia32)
--  CFLAGS += -mno-mmx -mno-sse
-+  override CFLAGS += -mno-mmx -mno-sse
-   ifeq ($(HOSTARCH),x86_64)
-     ARCH3264 = -m32
-   endif
- endif
- 
- ifeq ($(ARCH),x86_64)
--  CFLAGS += -mno-red-zone -mno-mmx -mno-sse
-+  override CFLAGS += -mno-red-zone -mno-mmx -mno-sse
-   ifeq ($(HOSTARCH),ia32)
-     ARCH3264 = -m64
-   endif
-@@ -110,7 +110,7 @@
- # Generic compilation flags
- INCDIR  += -I$(SRCDIR) -I$(TOPDIR)/inc -I$(TOPDIR)/inc/$(ARCH) \
-            -I$(TOPDIR)/inc/protocol
--CFLAGS  += $(ARCH3264) -O2 -fpic -Wall -fshort-wchar -fno-strict-aliasing \
-+override CFLAGS  += $(ARCH3264) -O2 -fpic -Wall -fshort-wchar -fno-strict-aliasing \
-            -fno-merge-constants -ffreestanding -fno-stack-protector       \
-            -fno-stack-check
- ASFLAGS += $(ARCH3264)
diff --git a/package/gnu-efi/gnu-efi-03-parallel-make.patch b/package/gnu-efi/gnu-efi-03-parallel-make.patch
deleted file mode 100644
index 27c94e8..0000000
--- a/package/gnu-efi/gnu-efi-03-parallel-make.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Fix parallel make failure
-
-Upstream-Status: Submitted [Maintainer directly]
-
-Add a missing dependency which resulted in a race leading to failure
-on larger values of -j.
-
-Signed-off-by: Darren Hart <dvhart@linux.intel.com>
-
-Index: gnu-efi-3.0/Makefile
-===================================================================
---- gnu-efi-3.0.orig/Makefile
-+++ gnu-efi-3.0/Makefile
-@@ -42,6 +42,8 @@ include $(SRCDIR)/Make.defaults
- 
- SUBDIRS = lib gnuefi inc apps
- 
-+gnuefi: lib
-+
- all:	check_gcc $(SUBDIRS)
- 
- $(SUBDIRS):
diff --git a/package/gnu-efi/gnu-efi.hash b/package/gnu-efi/gnu-efi.hash
index ec14922..21033bd 100644
--- a/package/gnu-efi/gnu-efi.hash
+++ b/package/gnu-efi/gnu-efi.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  3c0d450d5829204ca05dcb3b2aae772e52c379b7c7e09146759c6315606f934e  gnu-efi_3.0u.orig.tar.gz
+# From http://sourceforge.net/projects/gnu-efi/files
+md5 c4099c443b6b0c2b04dedc33e7814ec0 gnu-efi-3.0.1.tar.bz2
+sha1 07eea4d72f7ecb7229aaa77ddd411de5673c67b6 gnu-efi-3.0.1.tar.bz2
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 9fbbadd..0e067a6 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GNU_EFI_VERSION = 3.0u
-GNU_EFI_SOURCE = gnu-efi_$(GNU_EFI_VERSION).orig.tar.gz
+GNU_EFI_VERSION = 3.0.1
+GNU_EFI_SOURCE = gnu-efi-$(GNU_EFI_VERSION).tar.bz2
 GNU_EFI_SITE = http://downloads.sourceforge.net/project/gnu-efi
 GNU_EFI_INSTALL_STAGING = YES
 GNU_EFI_LICENSE = GPLv2+ (gnuefi), BSD (efilib)
