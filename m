From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Jan 2019 11:01:09 +0100
Subject: [Buildroot] [PATCH 1/3] package/gnu-efi: get rid of patch
Message-ID: <20190111100111.17867-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pass TARGET_CONFIGURE_OPTS in the environment instead of on the make command
line, so 'CFLAGS +=' does the right thing in the Makefile without patching.

TARGET_CONFIGURE_OPTS includes TARGET_MAKE_ENV, so drop that.

This does require us to pass CROSS_COMPILE to ensure the native tools are
not used though.

Add a GNU_EFI_MAKE_OPTS and use in both the build and install steps, instead
of repeating the various arguments.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...S-CPPFLAGS-to-be-completed-from-the-envir.patch | 103 ---------------------
 package/gnu-efi/gnu-efi.mk                         |  15 +--
 2 files changed, 8 insertions(+), 110 deletions(-)
 delete mode 100644 package/gnu-efi/0001-Allow-CFLAGS-CPPFLAGS-to-be-completed-from-the-envir.patch

diff --git a/package/gnu-efi/0001-Allow-CFLAGS-CPPFLAGS-to-be-completed-from-the-envir.patch b/package/gnu-efi/0001-Allow-CFLAGS-CPPFLAGS-to-be-completed-from-the-envir.patch
deleted file mode 100644
index 11507388ea..0000000000
--- a/package/gnu-efi/0001-Allow-CFLAGS-CPPFLAGS-to-be-completed-from-the-envir.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From eea0f62a1f6712f10afe47635b80a061505d2d2f Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Sat, 17 Jan 2015 18:33:37 +0100
-Subject: [PATCH 1/2] Allow CFLAGS/CPPFLAGS to be completed from the
- environment
-
-Buildroot passes its own CPPFLAGS and CFLAGS in the environment, so
-the CFLAGS += and CPPFLAGS += statements in gnu-efi Makefile have no
-effect. Change these to override <VARIABLE> += so that they extend the
-flags passed by Buildroot.
-
-[Romain:
- - rebase on top of 3.0.1 release]
-[Bernd:
- - rebase on top of 3.0.5 release]
-[Beno?t:
- - rebase on top of 3.0.6 release]
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
----
- Make.defaults |   22 +++++++++++-----------
- 1 file changed, 11 insertions(+), 11 deletions(-)
-
-diff --git a/Make.defaults b/Make.defaults
-index 51bd7d8..7d7e8e7 100755
---- a/Make.defaults
-+++ b/Make.defaults
-@@ -85,14 +85,14 @@ OBJDIR       := $(TOPDIR)/$(ARCH)
- #
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
-@@ -109,19 +109,19 @@ ifeq ($(ARCH),x86_64)
-                                  && [ $(GCCMINOR) -ge "7" ] ) ) \
-                           && echo 1)
-   ifeq ($(GCCNEWENOUGH),1)
--    CPPFLAGS += -DGNU_EFI_USE_MS_ABI -maccumulate-outgoing-args --std=c11
-+    override CPPFLAGS += -DGNU_EFI_USE_MS_ABI -maccumulate-outgoing-args --std=c11
-   else ifeq ($(USING_CLANG),clang)
--    CPPFLAGS += -DGNU_EFI_USE_MS_ABI --std=c11
-+    override CPPFLAGS += -DGNU_EFI_USE_MS_ABI --std=c11
-   endif
- 
--  CFLAGS += -mno-red-zone
-+  override CFLAGS += -mno-red-zone
-   ifeq ($(HOSTARCH),ia32)
-     ARCH3264 = -m64
-   endif
- endif
- 
- ifeq ($(ARCH),mips64el)
--  CFLAGS += -march=mips64r2
-+  override CFLAGS += -march=mips64r2
-   ARCH3264 = -mabi=64
- endif
- 
-@@ -142,7 +142,7 @@ export LIBGCC=$(shell $(CC) $(ARCH3264)
- endif
- 
- ifeq ($(ARCH),arm)
--CFLAGS += -marm
-+override CFLAGS += -marm
- endif
- 
- # Generic compilation flags
-@@ -152,15 +152,15 @@ INCDIR  += -I$(SRCDIR) -I$(TOPDIR)/inc -
- # Only enable -fpic for non MinGW compilers (unneeded on MinGW)
- GCCMACHINE := $(shell $(CC) -dumpmachine)
- ifneq (mingw32,$(findstring mingw32, $(GCCMACHINE)))
--  CFLAGS += -fpic
-+  override CFLAGS += -fpic
- endif
- 
- ifeq (FreeBSD, $(findstring FreeBSD, $(OS)))
--CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
-+override CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
-            -fshort-wchar -fno-strict-aliasing \
-            -ffreestanding -fno-stack-protector
- else
--CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
-+override CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
-            -fshort-wchar -fno-strict-aliasing \
-            -fno-merge-all-constants -ffreestanding -fno-stack-protector \
-            -fno-stack-check
--- 
-2.11.0
-
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index d55e0274df..b83a5a9eb4 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -26,17 +26,18 @@ else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
 GNU_EFI_PLATFORM = aarch64
 endif
 
+GNU_EFI_MAKE_OPTS = \
+	ARCH=$(GNU_EFI_PLATFORM) \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	PREFIX=/usr
+
 define GNU_EFI_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		$(TARGET_CONFIGURE_OPTS) \
-		ARCH=$(GNU_EFI_PLATFORM)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(GNU_EFI_MAKE_OPTS)
 endef
 
 define GNU_EFI_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		$(TARGET_CONFIGURE_OPTS) \
-		INSTALLROOT=$(STAGING_DIR) \
-		PREFIX=/usr ARCH=$(GNU_EFI_PLATFORM) install
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(GNU_EFI_MAKE_OPTS) \
+		INSTALLROOT=$(STAGING_DIR) install
 endef
 
 $(eval $(generic-package))
-- 
2.11.0
