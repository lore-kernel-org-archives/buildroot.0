From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 21:35:47 +0200
Subject: [Buildroot] [git commit] package/gnu-efi: bump version to 3.0.5
Message-ID: <20170606193557.B54068082C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0402a6e72c8ca5088d860bb788084147a049968
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...S-CPPFLAGS-to-be-completed-from-the-envir.patch | 50 ++++++++++++++--------
 package/gnu-efi/gnu-efi.hash                       |  6 ++-
 package/gnu-efi/gnu-efi.mk                         |  2 +-
 3 files changed, 38 insertions(+), 20 deletions(-)

diff --git a/package/gnu-efi/0001-Allow-CFLAGS-CPPFLAGS-to-be-completed-from-the-envir.patch b/package/gnu-efi/0001-Allow-CFLAGS-CPPFLAGS-to-be-completed-from-the-envir.patch
index eee0a9a..9038228 100644
--- a/package/gnu-efi/0001-Allow-CFLAGS-CPPFLAGS-to-be-completed-from-the-envir.patch
+++ b/package/gnu-efi/0001-Allow-CFLAGS-CPPFLAGS-to-be-completed-from-the-envir.patch
@@ -11,18 +11,21 @@ flags passed by Buildroot.
 
 [Romain:
  - rebase on top of 3.0.1 release]
+[Bernd:
+ - rebase on top of 3.0.5 release]
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
- Make.defaults | 16 ++++++++--------
- 1 file changed, 8 insertions(+), 8 deletions(-)
+ Make.defaults | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
 
 diff --git a/Make.defaults b/Make.defaults
-index 169273d..b0ddea0 100644
+index 51bd7d8..7d7e8e7 100755
 --- a/Make.defaults
 +++ b/Make.defaults
-@@ -80,14 +80,14 @@ endif
+@@ -85,14 +85,14 @@ OBJDIR       := $(TOPDIR)/$(ARCH)
  #
  
  # Arch-specific compilation flags
@@ -40,7 +43,7 @@ index 169273d..b0ddea0 100644
    ifeq ($(HOSTARCH),x86_64)
      ARCH3264 = -m32
    endif
-@@ -103,10 +103,10 @@ ifeq ($(ARCH),x86_64)
+@@ -108,17 +108,17 @@ ifeq ($(ARCH),x86_64)
                                   && [ $(GCCMINOR) -ge "7" ] ) ) \
                            && echo 1)
    ifeq ($(GCCNEWENOUGH),1)
@@ -48,12 +51,20 @@ index 169273d..b0ddea0 100644
 +    override CPPFLAGS += -DGNU_EFI_USE_MS_ABI -maccumulate-outgoing-args --std=c11
    endif
  
--  CFLAGS += -mno-red-zone -mno-mmx -mno-sse
-+  override CFLAGS += -mno-red-zone -mno-mmx -mno-sse
+-  CFLAGS += -mno-red-zone
++  override CFLAGS += -mno-red-zone
    ifeq ($(HOSTARCH),ia32)
      ARCH3264 = -m64
    endif
-@@ -127,7 +127,7 @@ export LIBGCC=$(shell $(CC) $(ARCH3264) -print-libgcc-file-name)
+ endif
+ 
+ ifeq ($(ARCH),mips64el)
+-  CFLAGS += -march=mips64r2
++  override CFLAGS += -march=mips64r2
+   ARCH3264 = -mabi=64
+ endif
+ 
+@@ -139,7 +139,7 @@ export LIBGCC=$(shell $(CC) $(ARCH3264) -print-libgcc-file-name)
  endif
  
  ifeq ($(ARCH),arm)
@@ -62,19 +73,24 @@ index 169273d..b0ddea0 100644
  endif
  
  # Generic compilation flags
-@@ -135,10 +135,10 @@ INCDIR  += -I$(SRCDIR) -I$(TOPDIR)/inc -I$(TOPDIR)/inc/$(ARCH) \
-            -I$(TOPDIR)/inc/protocol
+@@ -149,7 +149,7 @@ INCDIR  += -I$(SRCDIR) -I$(TOPDIR)/inc -I$(TOPDIR)/inc/$(ARCH) \
+ # Only enable -fpic for non MinGW compilers (unneeded on MinGW)
+ GCCMACHINE := $(shell $(CC) -dumpmachine)
+ ifneq (mingw32,$(findstring mingw32, $(GCCMACHINE)))
+-  CFLAGS += -fpic
++  override CFLAGS += -fpic
+ endif
  
  ifeq (FreeBSD, $(findstring FreeBSD, $(OS)))
--CFLAGS  += $(ARCH3264) -O2 -fpic -Wall -fshort-wchar -fno-strict-aliasing \
-+override CFLAGS  += $(ARCH3264) -O2 -fpic -Wall -fshort-wchar -fno-strict-aliasing \
+@@ -157,7 +157,7 @@ CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
+            -fshort-wchar -fno-strict-aliasing \
             -ffreestanding -fno-stack-protector
  else
--CFLAGS  += $(ARCH3264) -O2 -fpic -Wall -fshort-wchar -fno-strict-aliasing \
-+override CFLAGS  += $(ARCH3264) -O2 -fpic -Wall -fshort-wchar -fno-strict-aliasing \
-            -fno-merge-constants -ffreestanding -fno-stack-protector       \
+-CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
++override CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
+            -fshort-wchar -fno-strict-aliasing \
+            -fno-merge-constants -ffreestanding -fno-stack-protector \
             -fno-stack-check
- endif
 -- 
-1.9.3
+2.11.0
 
diff --git a/package/gnu-efi/gnu-efi.hash b/package/gnu-efi/gnu-efi.hash
index 21033bd..78c9bd2 100644
--- a/package/gnu-efi/gnu-efi.hash
+++ b/package/gnu-efi/gnu-efi.hash
@@ -1,3 +1,5 @@
 # From http://sourceforge.net/projects/gnu-efi/files
-md5 c4099c443b6b0c2b04dedc33e7814ec0 gnu-efi-3.0.1.tar.bz2
-sha1 07eea4d72f7ecb7229aaa77ddd411de5673c67b6 gnu-efi-3.0.1.tar.bz2
+md5 1f719c9c135778aa6b087b89a1cc2423 gnu-efi-3.0.5.tar.bz2
+sha1 183dadda9de78a44bd2343ffbf7869458ff5372a gnu-efi-3.0.5.tar.bz2
+# Locally computed
+sha256 bd8fcd5914f18fc0e4ba948ab03b00013e528504f529c60739b748f6ef130b22 gnu-efi-3.0.5.tar.bz2
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index d427870..2222583 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNU_EFI_VERSION = 3.0.1
+GNU_EFI_VERSION = 3.0.5
 GNU_EFI_SOURCE = gnu-efi-$(GNU_EFI_VERSION).tar.bz2
 GNU_EFI_SITE = http://downloads.sourceforge.net/project/gnu-efi
 GNU_EFI_INSTALL_STAGING = YES
