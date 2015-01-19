From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 20 Jan 2015 00:29:56 +0100
Subject: [Buildroot] [PATCH 2/4] boot/syslinux: bump version to 6.03
In-Reply-To: <1421710198-20898-1-git-send-email-romain.naour@openwide.fr>
References: <1421710198-20898-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1421710198-20898-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove gnu-efi dependency since it's directly included in
syslinux sources since 6.03 release. Also remove the patch
for find-gnu-efi.sh script which was removed.

There are still some parallel build issues, so MAKE1
can't be removed for now.

Also add a hash file.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 .../syslinux-000-user-headers-from-sysroot.patch   | 37 ----------------------
 boot/syslinux/syslinux.hash                        |  2 ++
 boot/syslinux/syslinux.mk                          |  4 +--
 3 files changed, 4 insertions(+), 39 deletions(-)
 delete mode 100644 boot/syslinux/syslinux-000-user-headers-from-sysroot.patch
 create mode 100644 boot/syslinux/syslinux.hash

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
new file mode 100644
index 0000000..5afa6d6
--- /dev/null
+++ b/boot/syslinux/syslinux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/utils/boot/syslinux/sha256sums.asc
+sha256 26d3986d2bea109d5dc0e4f8c4822a459276cf021125e8c9f23c3cca5d8c850e syslinux-6.03.tar.xz
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 8ef53f9..7ec840e 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSLINUX_VERSION = 6.02
+SYSLINUX_VERSION = 6.03
 SYSLINUX_SOURCE = syslinux-$(SYSLINUX_VERSION).tar.xz
 SYSLINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux
 
@@ -19,13 +19,13 @@ ifeq ($(BR2_TARGET_SYSLINUX_LEGACY_BIOS),y)
 SYSLINUX_TARGET = bios
 endif
 
+# gnu-efi is directly included in syslinux sources since 6.03 release.
 ifeq ($(BR2_TARGET_SYSLINUX_EFI),y)
 ifeq ($(BR2_ARCH_IS_64),y)
 SYSLINUX_EFI_BITS = efi64
 else
 SYSLINUX_EFI_BITS = efi32
 endif # 64-bit
-SYSLINUX_DEPENDENCIES += gnu-efi
 SYSLINUX_TARGET = $(SYSLINUX_EFI_BITS)
 endif # EFI
 
-- 
1.9.3
