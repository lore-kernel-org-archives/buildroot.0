From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Jun 2017 23:31:38 +0200
Subject: [Buildroot] [git commit] package/gnu-efi: bump version to 3.0.6
Message-ID: <20170630215940.991B3802DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=427dfaea3b74ee11fb9c75cf7450e87992af2c2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Refreshed patch 0001-Allow-CFLAGS-CPPFLAGS-to-be-completed-from-the-envir.patch.
Dropped patch 0002-Fix-parallel-make-failure-for-archives.patch applied upstream.

Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...S-CPPFLAGS-to-be-completed-from-the-envir.patch | 21 +++++---
 ...02-Fix-parallel-make-failure-for-archives.patch | 57 ----------------------
 package/gnu-efi/gnu-efi.hash                       |  6 +--
 package/gnu-efi/gnu-efi.mk                         |  2 +-
 4 files changed, 18 insertions(+), 68 deletions(-)

diff --git a/package/gnu-efi/0001-Allow-CFLAGS-CPPFLAGS-to-be-completed-from-the-envir.patch b/package/gnu-efi/0001-Allow-CFLAGS-CPPFLAGS-to-be-completed-from-the-envir.patch
index 9038228..1150738 100644
--- a/package/gnu-efi/0001-Allow-CFLAGS-CPPFLAGS-to-be-completed-from-the-envir.patch
+++ b/package/gnu-efi/0001-Allow-CFLAGS-CPPFLAGS-to-be-completed-from-the-envir.patch
@@ -13,13 +13,16 @@ flags passed by Buildroot.
  - rebase on top of 3.0.1 release]
 [Bernd:
  - rebase on top of 3.0.5 release]
+[Beno??t:
+ - rebase on top of 3.0.6 release]
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
 ---
- Make.defaults | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
+ Make.defaults |   22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
 
 diff --git a/Make.defaults b/Make.defaults
 index 51bd7d8..7d7e8e7 100755
@@ -43,12 +46,15 @@ index 51bd7d8..7d7e8e7 100755
    ifeq ($(HOSTARCH),x86_64)
      ARCH3264 = -m32
    endif
-@@ -108,17 +108,17 @@ ifeq ($(ARCH),x86_64)
+@@ -109,19 +109,19 @@ ifeq ($(ARCH),x86_64)
                                   && [ $(GCCMINOR) -ge "7" ] ) ) \
                            && echo 1)
    ifeq ($(GCCNEWENOUGH),1)
 -    CPPFLAGS += -DGNU_EFI_USE_MS_ABI -maccumulate-outgoing-args --std=c11
 +    override CPPFLAGS += -DGNU_EFI_USE_MS_ABI -maccumulate-outgoing-args --std=c11
+   else ifeq ($(USING_CLANG),clang)
+-    CPPFLAGS += -DGNU_EFI_USE_MS_ABI --std=c11
++    override CPPFLAGS += -DGNU_EFI_USE_MS_ABI --std=c11
    endif
  
 -  CFLAGS += -mno-red-zone
@@ -64,7 +70,7 @@ index 51bd7d8..7d7e8e7 100755
    ARCH3264 = -mabi=64
  endif
  
-@@ -139,7 +139,7 @@ export LIBGCC=$(shell $(CC) $(ARCH3264) -print-libgcc-file-name)
+@@ -142,7 +142,7 @@ export LIBGCC=$(shell $(CC) $(ARCH3264)
  endif
  
  ifeq ($(ARCH),arm)
@@ -73,7 +79,7 @@ index 51bd7d8..7d7e8e7 100755
  endif
  
  # Generic compilation flags
-@@ -149,7 +149,7 @@ INCDIR  += -I$(SRCDIR) -I$(TOPDIR)/inc -I$(TOPDIR)/inc/$(ARCH) \
+@@ -152,15 +152,15 @@ INCDIR  += -I$(SRCDIR) -I$(TOPDIR)/inc -
  # Only enable -fpic for non MinGW compilers (unneeded on MinGW)
  GCCMACHINE := $(shell $(CC) -dumpmachine)
  ifneq (mingw32,$(findstring mingw32, $(GCCMACHINE)))
@@ -82,14 +88,15 @@ index 51bd7d8..7d7e8e7 100755
  endif
  
  ifeq (FreeBSD, $(findstring FreeBSD, $(OS)))
-@@ -157,7 +157,7 @@ CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
+-CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
++override CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
             -fshort-wchar -fno-strict-aliasing \
             -ffreestanding -fno-stack-protector
  else
 -CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
 +override CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
             -fshort-wchar -fno-strict-aliasing \
-            -fno-merge-constants -ffreestanding -fno-stack-protector \
+            -fno-merge-all-constants -ffreestanding -fno-stack-protector \
             -fno-stack-check
 -- 
 2.11.0
diff --git a/package/gnu-efi/0002-Fix-parallel-make-failure-for-archives.patch b/package/gnu-efi/0002-Fix-parallel-make-failure-for-archives.patch
deleted file mode 100644
index 6e12388..0000000
--- a/package/gnu-efi/0002-Fix-parallel-make-failure-for-archives.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 7e9a26b0fc0bd8ed64a5eced5ea78bcea8ae3bbc Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Sat, 17 Jan 2015 18:44:04 +0100
-Subject: [PATCH 2/2] Fix parallel make failure for archives
-
-Upstream-Status: Pending
-
-The lib and gnuefi makefiles were using the lib.a() form which compiles
-and ar's as a pair instead of compiling all and then ar'ing which can
-parallelize better. This was resulting in build failures on larger values
-of -j.
-
-See http://www.chemie.fu-berlin.de/chemnet/use/info/make/make_toc.html#TOC105
-for details.
-
-[Romain:
- - rebase on top of 3.0.1 release]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-Signed-off-by: Darren Hart <dvhart@linux.intel.com>
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- gnuefi/Makefile | 3 ++-
- lib/Makefile    | 3 ++-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/gnuefi/Makefile b/gnuefi/Makefile
-index d234ac0..d29575d 100644
---- a/gnuefi/Makefile
-+++ b/gnuefi/Makefile
-@@ -54,7 +54,8 @@ TARGETS	= crt0-efi-$(ARCH).o libgnuefi.a
- 
- all:	$(TARGETS)
- 
--libgnuefi.a: $(patsubst %,libgnuefi.a(%),$(OBJS))
-+libgnuefi.a: $(OBJS)
-+	$(AR) rv $@ $(OBJS)
- 
- clean:
- 	rm -f $(TARGETS) *~ *.o $(OBJS)
-diff --git a/lib/Makefile b/lib/Makefile
-index 019ad57..c6abcae 100644
---- a/lib/Makefile
-+++ b/lib/Makefile
-@@ -73,7 +73,8 @@ all: libsubdirs libefi.a
- libsubdirs:
- 	for sdir in $(SUBDIRS); do mkdir -p $$sdir; done
- 
--libefi.a: $(patsubst %,libefi.a(%),$(OBJS))
-+libefi.a: $(OBJS)
-+	$(AR) rv $@ $(OBJS)
- 
- clean:
- 	rm -f libefi.a *~ $(OBJS) */*.o
--- 
-1.9.3
-
diff --git a/package/gnu-efi/gnu-efi.hash b/package/gnu-efi/gnu-efi.hash
index 78c9bd2..1bd0f8c 100644
--- a/package/gnu-efi/gnu-efi.hash
+++ b/package/gnu-efi/gnu-efi.hash
@@ -1,5 +1,5 @@
 # From http://sourceforge.net/projects/gnu-efi/files
-md5 1f719c9c135778aa6b087b89a1cc2423 gnu-efi-3.0.5.tar.bz2
-sha1 183dadda9de78a44bd2343ffbf7869458ff5372a gnu-efi-3.0.5.tar.bz2
+md5 46f633758a8a37db9fd6909fe270c26b gnu-efi-3.0.6.tar.bz2
+sha1 9f0f75b64c84423f3386da6f3200f5ed7471d9cb gnu-efi-3.0.6.tar.bz2
 # Locally computed
-sha256 bd8fcd5914f18fc0e4ba948ab03b00013e528504f529c60739b748f6ef130b22 gnu-efi-3.0.5.tar.bz2
+sha256 21515902d80fbea23328a61d70d3d51a47204abd1507ebfa27550a7b9bf22c91 gnu-efi-3.0.6.tar.bz2
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 274160d..d55e027 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNU_EFI_VERSION = 3.0.5
+GNU_EFI_VERSION = 3.0.6
 GNU_EFI_SOURCE = gnu-efi-$(GNU_EFI_VERSION).tar.bz2
 GNU_EFI_SITE = http://downloads.sourceforge.net/project/gnu-efi
 GNU_EFI_INSTALL_STAGING = YES
