From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Dec 2016 23:41:52 +0100
Subject: [Buildroot] [git commit] efivar: introduce
	BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
Message-ID: <20161207224649.6F3AE807D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0474d89de7298b22bb242ac627471069bb0eeb2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

efivar only makes sense on platforms that support UEFI.
UEFI is only supported by some architectures at the moment, being mostly
employed on platforms such as x86, x86_64 and aarch64. Some other
platforms such as MIPS and PowerPC may have some unofficial UEFI
support. UEFI is also limited to little endian architectures.

efivar was being supported in Buildroot without architecture
restrictions so far, however this has led to the creation of a number of
hacks in the recipes, mostly for architectures that are not supported by
UEFI.
In order to avoid spending more time to debug these failures and
maintaining more hacks for unsupported architectures, efivar can be
restricted to that platforms where it makes sense and where it is more
likely to receive some testing and actual usage.

The existing hacks for the now unsupported architectures are removed,
and the dependency is propagated to efibootmgr as it depends on efivar.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efibootmgr/Config.in |  8 ++++----
 package/efivar/Config.in     | 14 ++++++++++----
 package/efivar/efivar.mk     |  6 ------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/efibootmgr/Config.in b/package/efibootmgr/Config.in
index cd4bda1..a4011d6 100644
--- a/package/efibootmgr/Config.in
+++ b/package/efibootmgr/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_EFIBOOTMGR
 	bool "efibootmgr"
+	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS # efivar
 	depends on !BR2_STATIC_LIBS # efivar
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # efivar
 	depends on !BR2_TOOLCHAIN_USES_MUSL # efivar
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # efivar
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS && \
-		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # efivar
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_EFIVAR
 	help
@@ -17,9 +17,9 @@ config BR2_PACKAGE_EFIBOOTMGR
 	  https://github.com/rhinstaller/efibootmgr
 
 comment "efibootmgr needs a glibc or uClibc toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9"
+	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
 		BR2_TOOLCHAIN_USES_MUSL || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS && \
-		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
diff --git a/package/efivar/Config.in b/package/efivar/Config.in
index a97c766..0ec8360 100644
--- a/package/efivar/Config.in
+++ b/package/efivar/Config.in
@@ -1,5 +1,12 @@
+config BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
+	bool
+	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 \
+		|| BR2_powerpc64le || BR2_mipsel || BR2_mips64el
+	default y
+
 config BR2_PACKAGE_EFIVAR
 	bool "efivar"
+	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # linux/nvme.h
 	# linux/nvme.h has been renamed to linux/nvme_ioctl.h since 4.4,
@@ -8,8 +15,7 @@ config BR2_PACKAGE_EFIVAR
 	# don't have that header file renamed, and that is causing build
 	# failures. So, prevent this package to be built using those
 	# toolchains.
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS && \
-		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	# doesn't build with musl due to lack of __bswap_constant_16
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
@@ -20,9 +26,9 @@ config BR2_PACKAGE_EFIVAR
 	  https://github.com/rhinstaller/efivar
 
 comment "efivar needs a glibc or uClibc toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9"
+	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
 		BR2_TOOLCHAIN_USES_MUSL || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS && \
-		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
index 84735b8..c31d87b 100644
--- a/package/efivar/efivar.mk
+++ b/package/efivar/efivar.mk
@@ -21,12 +21,6 @@ EFIVAR_MAKE_OPTS = \
 	BINTARGETS=efivar \
 	LDFLAGS="$(TARGET_LDFLAGS) -fPIC"
 
-# Explicitly linking with shared libgcc is required on MicroBlaze and
-# Nios II, otherwise it fails due to FDE encoding in static libgcc.
-ifeq ($(BR2_microblaze)$(BR2_nios2),y)
-EFIVAR_MAKE_OPTS += SOFLAGS="-shared -shared-libgcc"
-endif
-
 define EFIVAR_BUILD_CMDS
 	# makeguids is an internal host tool and must be built separately with
 	# $(HOST_CC), otherwise it gets cross-built.
