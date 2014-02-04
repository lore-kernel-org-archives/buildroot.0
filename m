From: Christophe Vu-Brugier <cvubrugier@yahoo.fr>
Date: Tue,  4 Feb 2014 20:19:44 +0100
Subject: [Buildroot] [PATCH v4 1/2] gnu-efi: new package
Message-ID: <1391541585-8765-1-git-send-email-cvubrugier@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Christophe Vu-Brugier <cvubrugier@yahoo.fr>
---
Changes v3 -> v4
  - remove the BR2_PACKAGE_GNU_EFI_{IA32,X64} options
Changes v2 -> v3
  - depends on BR2_i386 || BR2_x86_64
Changes v1 -> v2
  - apply patches from Yocto to fix silent make failures
---
 package/Config.in                                  |  1 +
 package/gnu-efi/Config.in                          |  9 ++++
 .../gnu-efi/gnu-efi-01-use-override-cflags.patch   | 53 ++++++++++++++++++++++
 .../gnu-efi-02-parallel-make-archives.patch        | 48 ++++++++++++++++++++
 package/gnu-efi/gnu-efi-03-parallel-make.patch     | 22 +++++++++
 package/gnu-efi/gnu-efi.mk                         | 40 ++++++++++++++++
 6 files changed, 173 insertions(+)
 create mode 100644 package/gnu-efi/Config.in
 create mode 100644 package/gnu-efi/gnu-efi-01-use-override-cflags.patch
 create mode 100644 package/gnu-efi/gnu-efi-02-parallel-make-archives.patch
 create mode 100644 package/gnu-efi/gnu-efi-03-parallel-make.patch
 create mode 100644 package/gnu-efi/gnu-efi.mk

diff --git a/package/Config.in b/package/Config.in
index ee2a68e..42bf69f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -572,6 +572,7 @@ endmenu
 menu "Hardware handling"
 source "package/ccid/Config.in"
 source "package/dtc/Config.in"
+source "package/gnu-efi/Config.in"
 source "package/lcdapi/Config.in"
 source "package/libaio/Config.in"
 source "package/libatasmart/Config.in"
diff --git a/package/gnu-efi/Config.in b/package/gnu-efi/Config.in
new file mode 100644
index 0000000..982102f
--- /dev/null
+++ b/package/gnu-efi/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_GNU_EFI
+	bool "gnu-efi"
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  Develop EFI applications for IA-64 (IPF), IA-32 (x86), and
+	  x86_64 platforms using the GNU toolchain and the EFI
+	  development environment.
+
+	  http://gnu-efi.sourceforge.net/
diff --git a/package/gnu-efi/gnu-efi-01-use-override-cflags.patch b/package/gnu-efi/gnu-efi-01-use-override-cflags.patch
new file mode 100644
index 0000000..07c3a9f
--- /dev/null
+++ b/package/gnu-efi/gnu-efi-01-use-override-cflags.patch
@@ -0,0 +1,53 @@
+Allow CFLAGS/CPPFLAGS to be completed from the environment
+
+Buildroot passes its own CPPFLAGS and CFLAGS in the environment, so
+the CFLAGS += and CPPFLAGS += statements in gnu-efi Makefile have no
+effect. Change these to override <VARIABLE> += so that they extend the
+flags passed by Buildroot.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Make.defaults
+===================================================================
+--- a/Make.defaults
++++ b/Make.defaults
+@@ -83,25 +83,25 @@
+                                && [ $(GCCMINOR) -ge "7" ] ) ) \
+                         && echo 1)
+ ifeq ($(GCCNEWENOUGH),1)
+-  CPPFLAGS += -DGNU_EFI_USE_MS_ABI -maccumulate-outgoing-args --std=c11
++  override CPPFLAGS += -DGNU_EFI_USE_MS_ABI -maccumulate-outgoing-args --std=c11
+ endif
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
+ endif
+ 
+ ifeq ($(ARCH),x86_64)
+-  CFLAGS += -mno-red-zone -mno-mmx -mno-sse
++  override CFLAGS += -mno-red-zone -mno-mmx -mno-sse
+   ifeq ($(HOSTARCH),ia32)
+     ARCH3264 = -m64
+   endif
+@@ -110,7 +110,7 @@
+ # Generic compilation flags
+ INCDIR  += -I$(SRCDIR) -I$(TOPDIR)/inc -I$(TOPDIR)/inc/$(ARCH) \
+            -I$(TOPDIR)/inc/protocol
+-CFLAGS  += $(ARCH3264) -O2 -fpic -Wall -fshort-wchar -fno-strict-aliasing \
++override CFLAGS  += $(ARCH3264) -O2 -fpic -Wall -fshort-wchar -fno-strict-aliasing \
+            -fno-merge-constants -ffreestanding -fno-stack-protector       \
+            -fno-stack-check
+ ASFLAGS += $(ARCH3264)
diff --git a/package/gnu-efi/gnu-efi-02-parallel-make-archives.patch b/package/gnu-efi/gnu-efi-02-parallel-make-archives.patch
new file mode 100644
index 0000000..e5b47c1
--- /dev/null
+++ b/package/gnu-efi/gnu-efi-02-parallel-make-archives.patch
@@ -0,0 +1,48 @@
+Fix parallel make failure for archives
+
+Upstream-Status: Pending
+
+The lib and gnuefi makefiles were using the lib.a() form which compiles
+and ar's as a pair instead of compiling all and then ar'ing which can
+parallelize better. This was resulting in build failures on larger values
+of -j.
+
+See http://www.chemie.fu-berlin.de/chemnet/use/info/make/make_toc.html#TOC105
+for details.
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+Signed-off-by: Darren Hart <dvhart@linux.intel.com>
+---
+---
+ gnuefi/Makefile |    3 ++-
+ lib/Makefile    |    3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+Index: gnu-efi-3.0/lib/Makefile
+===================================================================
+--- gnu-efi-3.0.orig/lib/Makefile
++++ gnu-efi-3.0/lib/Makefile
+@@ -66,7 +66,8 @@ all: libsubdirs libefi.a
+ libsubdirs:
+ 	for sdir in $(SUBDIRS); do mkdir -p $$sdir; done
+ 
+-libefi.a: $(patsubst %,libefi.a(%),$(OBJS))
++libefi.a: $(OBJS)
++	$(AR) rv $@ $(OBJS)
+ 
+ clean:
+ 	rm -f libefi.a *~ $(OBJS) */*.o
+Index: gnu-efi-3.0/gnuefi/Makefile
+===================================================================
+--- gnu-efi-3.0.orig/gnuefi/Makefile
++++ gnu-efi-3.0/gnuefi/Makefile
+@@ -51,7 +51,8 @@ TARGETS	= crt0-efi-$(ARCH).o libgnuefi.a
+ 
+ all:	$(TARGETS)
+ 
+-libgnuefi.a: $(patsubst %,libgnuefi.a(%),$(OBJS))
++libgnuefi.a: $(OBJS)
++	$(AR) rv $@ $(OBJS)
+ 
+ clean:
+ 	rm -f $(TARGETS) *~ *.o $(OBJS)
diff --git a/package/gnu-efi/gnu-efi-03-parallel-make.patch b/package/gnu-efi/gnu-efi-03-parallel-make.patch
new file mode 100644
index 0000000..27c94e8
--- /dev/null
+++ b/package/gnu-efi/gnu-efi-03-parallel-make.patch
@@ -0,0 +1,22 @@
+Fix parallel make failure
+
+Upstream-Status: Submitted [Maintainer directly]
+
+Add a missing dependency which resulted in a race leading to failure
+on larger values of -j.
+
+Signed-off-by: Darren Hart <dvhart@linux.intel.com>
+
+Index: gnu-efi-3.0/Makefile
+===================================================================
+--- gnu-efi-3.0.orig/Makefile
++++ gnu-efi-3.0/Makefile
+@@ -42,6 +42,8 @@ include $(SRCDIR)/Make.defaults
+ 
+ SUBDIRS = lib gnuefi inc apps
+ 
++gnuefi: lib
++
+ all:	check_gcc $(SUBDIRS)
+ 
+ $(SUBDIRS):
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
new file mode 100644
index 0000000..28eb17e
--- /dev/null
+++ b/package/gnu-efi/gnu-efi.mk
@@ -0,0 +1,40 @@
+################################################################################
+#
+# gnu-efi
+#
+################################################################################
+
+GNU_EFI_VERSION = 3.0u
+GNU_EFI_SOURCE = gnu-efi_$(GNU_EFI_VERSION).orig.tar.gz
+GNU_EFI_SITE = http://downloads.sourceforge.net/project/gnu-efi/
+GNU_EFI_INSTALL_STAGING = YES
+GNU_EFI_LICENSE = GPLv2+ (gnuefi), BSD (efilib)
+GNU_EFI_LICENSE_FILES = debian/copyright
+
+ifeq ($(BR2_i386),y)
+GNU_EFI_PLATFORM=ia32
+else ifeq ($(BR2_x86_64),y)
+GNU_EFI_PLATFORM=x86_64
+endif
+
+define GNU_EFI_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(TARGET_CONFIGURE_OPTS) \
+		ARCH=$(GNU_EFI_PLATFORM)
+endef
+
+define GNU_EFI_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(TARGET_CONFIGURE_OPTS) \
+		INSTALLROOT=$(TARGET_DIR) \
+		PREFIX=/usr ARCH=$(GNU_EFI_PLATFORM) install
+endef
+
+define GNU_EFI_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(TARGET_CONFIGURE_OPTS) \
+		INSTALLROOT=$(STAGING_DIR) \
+		PREFIX=/usr ARCH=$(GNU_EFI_PLATFORM) install
+endef
+
+$(eval $(generic-package))
-- 
1.9.rc1
