From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 17 Oct 2010 23:32:37 +0200
Subject: [Buildroot] [git commit master 1/1] Makefile: move KERNEL_ARCH from
	kernel-headers to here
Message-ID: <20101017213453.0AA4A8D25E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=891973f53805e35a4a14657f2c922ee7c5ff7cf7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2707

It's not only for kernel headers, and the kernel headers .mk file
isn't included for crosstool-ng toolchain, which broke linux/u-boot/..
builds.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                    |    1 +
 Makefile                                   |    8 ++++++++
 toolchain/kernel-headers/kernel-headers.mk |    8 --------
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/CHANGES b/CHANGES
index 21fffde..9adcc91 100644
--- a/CHANGES
+++ b/CHANGES
@@ -68,6 +68,7 @@
 	#2521: Can't compile sdl_mixer, mikmod.h can't be found
 	#2563: [PATCH] cairo: Expose the configure option to disable some...
 	#2581: libmms: Update to 0.6, and patch to work on architectures...
+	#2707: Can't compile linux kernel using buildroot + crosstool-ng
 
 2010.08: Released August 31th, 2010:
 
diff --git a/Makefile b/Makefile
index ac60b24..22c3801 100644
--- a/Makefile
+++ b/Makefile
@@ -249,6 +249,14 @@ ifeq ($(ARCH),xtensa)
 ARCH:=$(ARCH)_$(call qstrip,$(BR2_xtensa_core_name))
 endif
 
+KERNEL_ARCH:=$(shell echo "$(ARCH)" | sed -e "s/-.*//" \
+	-e s/i.86/i386/ -e s/sun4u/sparc64/ \
+	-e s/arm.*/arm/ -e s/sa110/arm/ \
+	-e s/parisc64/parisc/ \
+	-e s/powerpc64/powerpc/ \
+	-e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
+	-e s/sh.*/sh/)
+
 ZCAT:=$(call qstrip,$(BR2_ZCAT))
 BZCAT:=$(call qstrip,$(BR2_BZCAT))
 TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
diff --git a/toolchain/kernel-headers/kernel-headers.mk b/toolchain/kernel-headers/kernel-headers.mk
index 7b8989b..bb7ee3c 100644
--- a/toolchain/kernel-headers/kernel-headers.mk
+++ b/toolchain/kernel-headers/kernel-headers.mk
@@ -13,14 +13,6 @@ LINUX_HEADERS_SITE:=127.0.0.1
 LINUX_HEADERS_SOURCE:=unspecified-kernel-headers
 LINUX_HEADERS_UNPACK_DIR:=$(TOOLCHAIN_DIR)/linux-libc-headers-null
 
-KERNEL_ARCH:=$(shell $(SHELL) -c "echo \"$(ARCH)\" | sed -e \"s/-.*//\" \
-	-e s/i.86/i386/ -e s/sun4u/sparc64/ \
-	-e s/arm.*/arm/ -e s/sa110/arm/ \
-	-e s/parisc64/parisc/ \
-	-e s/powerpc64/powerpc/ \
-	-e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
-	-e s/sh.*/sh/")
-
 include toolchain/kernel-headers/kernel-headers-new.makefile
 
 $(DL_DIR)/$(LINUX_HEADERS_SOURCE):
-- 
1.7.1
