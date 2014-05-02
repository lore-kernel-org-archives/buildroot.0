From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  2 May 2014 19:10:35 +0200
Subject: [Buildroot] [PATCH 09/12] boot/syslinux: add option to install the
	EFI image
In-Reply-To: <cover.1399050467.git.yann.morin.1998@free.fr>
References: <cover.1399050467.git.yann.morin.1998@free.fr>
Message-ID: <00f4994e4408665605c05acccc68dfa419ec245c.1399050467.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

syslinux can now also build an EFI application.

If the target is 64-bit, we build the 64-bit EFI app,
otherwise we build the 32-bit EFI app.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
Tested-by: Frank Hunleth <fhunleth@troodon-software.com>
Tested-by: Romain Naour <romain.naour@openwide.fr>

---
Changes v1 -> v2:
  - move it in the existing choice  (Arnout)
---
 boot/syslinux/Config.in                            | 11 +++++++
 .../syslinux-000-user-headers-from-sysroot.patch   | 37 ++++++++++++++++++++++
 boot/syslinux/syslinux.mk                          | 21 ++++++++++--
 3 files changed, 66 insertions(+), 3 deletions(-)
 create mode 100644 boot/syslinux/syslinux-000-user-headers-from-sysroot.patch

diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index 7263128..5f0fe97 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -10,21 +10,32 @@ config BR2_TARGET_SYSLINUX
 
 if BR2_TARGET_SYSLINUX
 
+config BR2_TARGET_SYSLINUX_LEGACY_BIOS
+	bool
+
 choice
 	bool "Image to install"
 
 config BR2_TARGET_SYSLINUX_ISOLINUX
 	bool "isolinux"
+	select BR2_TARGET_SYSLINUX_LEGACY_BIOS
 	help
 	  Install the legacy-BIOS 'isolinux' image, to boot off
 	  optical media (CDROM, DVD.)
 
 config BR2_TARGET_SYSLINUX_PXELINUX
 	bool "pxelinux"
+	select BR2_TARGET_SYSLINUX_LEGACY_BIOS
 	help
 	  Install the legacy-BIOS 'pxelinux' image, to boot off
 	  the network using PXE.
 
+config BR2_TARGET_SYSLINUX_EFI
+	bool "efi"
+	select BR2_PACKAGE_GNU_EFI
+	help
+	  Install the 'efi' image, to boot from an EFI environment.
+
 endchoice
 
 endif # BR2_TARGET_SYSLINUX
diff --git a/boot/syslinux/syslinux-000-user-headers-from-sysroot.patch b/boot/syslinux/syslinux-000-user-headers-from-sysroot.patch
new file mode 100644
index 0000000..5edf79f
--- /dev/null
+++ b/boot/syslinux/syslinux-000-user-headers-from-sysroot.patch
@@ -0,0 +1,37 @@
+efi: look for headers and libs in the sysroot
+
+Currently, syslinux hard-codes search paths to /usr/.... directories.
+This does not play well in cross-compilation.
+
+If $SYSROOT is defined, prepend it to the search paths.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN syslinux-6.02.orig/efi/find-gnu-efi.sh syslinux-6.02/efi/find-gnu-efi.sh
+--- syslinux-6.02.orig/efi/find-gnu-efi.sh	2013-10-13 19:59:03.000000000 +0200
++++ syslinux-6.02/efi/find-gnu-efi.sh	2014-04-22 00:19:23.638483887 +0200
+@@ -9,7 +9,7 @@
+ find_include()
+ {
+     for d in $include_dirs; do
+-	found=`find $d -name efi -type d 2> /dev/null`
++	found=`find $SYSROOT$d -name efi -type d 2> /dev/null`
+ 	if [ "$found"x != "x" ] && [ -e $found/$ARCH/efibind.h ]; then
+ 	    echo $found
+ 	    break;
+@@ -20,12 +20,12 @@
+ find_lib()
+ {
+     for d in $lib_dirs; do
+-	found=`find $d -name libgnuefi.a 2> /dev/null`
++	found=`find $SYSROOT$d -name libgnuefi.a 2> /dev/null`
+ 	if [ "$found"x != "x" ]; then
+ 	    crt_name='crt0-efi-'$ARCH'.o'
+-	    crt=`find $d -name $crt_name 2> /dev/null`
++	    crt=`find $SYSROOT$d -name $crt_name 2> /dev/null`
+ 	    if [ "$crt"x != "x" ]; then
+-		echo $d
++		echo $SYSROOT$d
+ 		break;
+ 	    fi
+ 	fi
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 2c197df..95ece52 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -15,6 +15,20 @@ SYSLINUX_INSTALL_IMAGES = YES
 
 SYSLINUX_DEPENDENCIES = host-nasm host-util-linux host-upx
 
+ifeq ($(BR2_TARGET_SYSLINUX_LEGACY_BIOS),y)
+SYSLINUX_TARGET = bios
+endif
+
+ifeq ($(BR2_TARGET_SYSLINUX_EFI),y)
+ifeq ($(BR2_ARCH_IS_64),y)
+SYSLINUX_EFI_BITS = efi64
+else
+SYSLINUX_EFI_BITS = efi32
+endif # 64-bit
+SYSLINUX_DEPENDENCIES += gnu-efi
+SYSLINUX_TARGET = $(SYSLINUX_EFI_BITS)
+endif # EFI
+
 # The syslinux tarball comes with pre-compiled binaries.
 # Since timestamps might not be in the correct order, a rebuild is
 # not always triggered for all the different images.
@@ -30,7 +44,7 @@ SYSLINUX_POST_PATCH_HOOKS += SYSLINUX_CLEANUP
 # be used.
 define SYSLINUX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
-	    AR="$(HOSTAR)" -C $(@D) bios
+	    AR="$(HOSTAR)" SYSROOT=$(STAGING_DIR) -C $(@D) $(SYSLINUX_TARGET)
 endef
 
 # While the actual bootloader is compiled for the target, several
@@ -40,12 +54,13 @@ endef
 # install time
 define SYSLINUX_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
-	    AR="$(HOSTAR)" INSTALLROOT=$(HOST_DIR) \
-	    -C $(@D) bios install
+	    AR="$(HOSTAR)" SYSROOT=$(STAGING_DIR) INSTALLROOT=$(HOST_DIR) \
+	    -C $(@D) $(SYSLINUX_TARGET) install
 endef
 
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_ISOLINUX) += bios/core/isolinux.bin
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_PXELINUX) += bios/core/pxelinux.bin
+SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_EFI) += $(SYSLINUX_EFI_BITS)/efi/syslinux.efi
 
 define SYSLINUX_INSTALL_IMAGES_CMDS
 	for i in $(SYSLINUX_IMAGES-y); do \
-- 
1.8.3.2
