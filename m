From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 23:02:53 +0100
Subject: [Buildroot] [git commit] boot/syslinux: bump version to 6.03
Message-ID: <20150304220553.E17FA817F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=52ceb700ff8ca41fbf2f6db7ec5fafb34888f64d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 6.03 syslinux release, the gnu-efi sources are bundled whith
syslinux. We need to force the build system to use the Buildroot's
gnu-efi package.

Remove the patch for find-gnu-efi.sh script which was removed, as well
as the SYSROOT variable from the BUILD_CMDS, which is no longer
needed.

There are still some parallel build issues, so MAKE1 can't
be removed for now.

Add a hash file.

Fix indentation.

[Thomas: fix minor typos in a new comment in the .mk file.]

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../syslinux-000-user-headers-from-sysroot.patch   |   37 --------------------
 boot/syslinux/syslinux.hash                        |    2 +-
 boot/syslinux/syslinux.mk                          |   18 +++++++---
 3 files changed, 14 insertions(+), 43 deletions(-)

diff --git a/boot/syslinux/syslinux-000-user-headers-from-sysroot.patch b/boot/syslinux/syslinux-000-user-headers-from-sysroot.patch
deleted file mode 100644
index 5edf79f..0000000
--- a/boot/syslinux/syslinux-000-user-headers-from-sysroot.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-efi: look for headers and libs in the sysroot
-
-Currently, syslinux hard-codes search paths to /usr/.... directories.
-This does not play well in cross-compilation.
-
-If $SYSROOT is defined, prepend it to the search paths.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN syslinux-6.02.orig/efi/find-gnu-efi.sh syslinux-6.02/efi/find-gnu-efi.sh
---- syslinux-6.02.orig/efi/find-gnu-efi.sh	2013-10-13 19:59:03.000000000 +0200
-+++ syslinux-6.02/efi/find-gnu-efi.sh	2014-04-22 00:19:23.638483887 +0200
-@@ -9,7 +9,7 @@
- find_include()
- {
-     for d in $include_dirs; do
--	found=`find $d -name efi -type d 2> /dev/null`
-+	found=`find $SYSROOT$d -name efi -type d 2> /dev/null`
- 	if [ "$found"x != "x" ] && [ -e $found/$ARCH/efibind.h ]; then
- 	    echo $found
- 	    break;
-@@ -20,12 +20,12 @@
- find_lib()
- {
-     for d in $lib_dirs; do
--	found=`find $d -name libgnuefi.a 2> /dev/null`
-+	found=`find $SYSROOT$d -name libgnuefi.a 2> /dev/null`
- 	if [ "$found"x != "x" ]; then
- 	    crt_name='crt0-efi-'$ARCH'.o'
--	    crt=`find $d -name $crt_name 2> /dev/null`
-+	    crt=`find $SYSROOT$d -name $crt_name 2> /dev/null`
- 	    if [ "$crt"x != "x" ]; then
--		echo $d
-+		echo $SYSROOT$d
- 		break;
- 	    fi
- 	fi
diff --git a/boot/syslinux/syslinux.hash b/boot/syslinux/syslinux.hash
index 4ec039f..5303f4d 100644
--- a/boot/syslinux/syslinux.hash
+++ b/boot/syslinux/syslinux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/boot/syslinux/sha256sums.asc
-sha256	afa31b7cbf72e1c0c1752a0636ba724ce01c0e374366e46e61db6862b4685478	syslinux-6.02.tar.xz
+sha256	26d3986d2bea109d5dc0e4f8c4822a459276cf021125e8c9f23c3cca5d8c850e	syslinux-6.03.tar.xz
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 8ef53f9..0868896 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSLINUX_VERSION = 6.02
+SYSLINUX_VERSION = 6.03
 SYSLINUX_SOURCE = syslinux-$(SYSLINUX_VERSION).tar.xz
 SYSLINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux
 
@@ -19,6 +19,10 @@ ifeq ($(BR2_TARGET_SYSLINUX_LEGACY_BIOS),y)
 SYSLINUX_TARGET = bios
 endif
 
+# The syslinux build system must be forced to use Buildroot's gnu-efi
+# package by setting EFIINC, LIBDIR and LIBEFI. Otherwise, it uses its
+# own copy of gnu-efi included in syslinux's sources since 6.03
+# release.
 ifeq ($(BR2_TARGET_SYSLINUX_EFI),y)
 ifeq ($(BR2_ARCH_IS_64),y)
 SYSLINUX_EFI_BITS = efi64
@@ -27,6 +31,10 @@ SYSLINUX_EFI_BITS = efi32
 endif # 64-bit
 SYSLINUX_DEPENDENCIES += gnu-efi
 SYSLINUX_TARGET = $(SYSLINUX_EFI_BITS)
+SYSLINUX_EFI_ARGS = \
+	EFIINC=$(STAGING_DIR)/usr/include/efi \
+	LIBDIR=$(STAGING_DIR)/usr/lib \
+	LIBEFI=$(STAGING_DIR)/usr/lib/libefi.a
 endif # EFI
 
 # The syslinux tarball comes with pre-compiled binaries.
@@ -44,7 +52,7 @@ SYSLINUX_POST_PATCH_HOOKS += SYSLINUX_CLEANUP
 # be used.
 define SYSLINUX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
-	    AR="$(HOSTAR)" SYSROOT=$(STAGING_DIR) -C $(@D) $(SYSLINUX_TARGET)
+		AR="$(HOSTAR)" $(SYSLINUX_EFI_ARGS) -C $(@D) $(SYSLINUX_TARGET)
 endef
 
 # While the actual bootloader is compiled for the target, several
@@ -54,8 +62,8 @@ endef
 # install time
 define SYSLINUX_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
-	    AR="$(HOSTAR)" SYSROOT=$(STAGING_DIR) INSTALLROOT=$(HOST_DIR) \
-	    -C $(@D) $(SYSLINUX_TARGET) install
+		AR="$(HOSTAR)" $(SYSLINUX_EFI_ARGS) INSTALLROOT=$(HOST_DIR) \
+		-C $(@D) $(SYSLINUX_TARGET) install
 endef
 
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_ISOLINUX) += bios/core/isolinux.bin
@@ -74,7 +82,7 @@ define SYSLINUX_INSTALL_IMAGES_CMDS
 	done
 	for i in $(SYSLINUX_C32); do \
 		$(INSTALL) -D -m 0755 $(HOST_DIR)/usr/share/syslinux/$${i} \
-				   $(BINARIES_DIR)/syslinux/$${i}; \
+			$(BINARIES_DIR)/syslinux/$${i}; \
 	done
 endef
 
