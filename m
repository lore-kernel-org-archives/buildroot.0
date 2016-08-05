From: Romain Naour <romain.naour@gmail.com>
Date: Fri,  5 Aug 2016 13:46:32 +0200
Subject: [Buildroot] [PATCH] package/oprofile: introduce a
	BR2_PACKAGE_OPROFILE_ARCH_SUPPORTS
Message-ID: <1470397592-8459-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

operf_utils.h defines rmb() for a limited number of architectures, so
add this list to BR2_PACKAGE_OPROFILE_ARCH_SUPPORTS to disable any new
or unsupported architectures.

Doing so, this disable oprofile for m68k which lack of memory barrier
operations.

Remove nios2 dependency since it's not supported by oprofile even if
binutils could be build for nios2.

Fixes:
http://autobuild.buildroot.net/results/1cc/1cc761d8a5715d0a2c6eaacfde7e44b225da1b36

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
Actually binutils 2.25 build fine for nios2 target, it was disabled by
5c4b60c7e0d74f92ae7c06c7bd8f732a12e70ca6 when binutils 2.22 was used by
default. So it could be enabled in a follow up patch.
---
 package/oprofile/Config.in | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index 9014d9f..4cef30b 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -1,3 +1,13 @@
+# no memory barrier functions for m68k, microblaze, nios2 and xtensa
+config BR2_PACKAGE_OPROFILE_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_arceb || BR2_arcle || BR2_arm || BR2_armeb || \
+		BR2_aarch64 || BR2_aarch64_be || BR2_i386 || BR2_mips || \
+		BR2_mipsel || BR2_mips64 || BR2_mips64el || BR2_powerpc || \
+		BR2_powerpc64 || BR2_powerpc64le || BR2_sh4 || BR2_sh64 || \
+		BR2_sparc || BR2_sparc64 || BR2_x86_64
+
 config BR2_PACKAGE_OPROFILE
 	bool "oprofile"
 	depends on BR2_USE_MMU # fork()
@@ -5,10 +15,8 @@ config BR2_PACKAGE_OPROFILE
 	select BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_LIBPFM4 if BR2_powerpc
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_nios2 # binutils
 	depends on BR2_USE_WCHAR # binutils
-	# no memory barrier functions
-	depends on !BR2_xtensa && !BR2_microblaze
+	depends on BR2_PACKAGE_OPROFILE_ARCH_SUPPORTS
 	# libpfm4 is needed on PowerPC, and requires thread support
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_powerpc
 	help
@@ -29,7 +37,7 @@ config BR2_PACKAGE_OPROFILE
 
 comment "oprofile needs a toolchain w/ C++, wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_nios2 && !BR2_xtensa && !BR2_microblaze
+	depends on BR2_PACKAGE_OPROFILE_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
 
 comment "oprofile needs a toolchain w/ NPTL on PPC"
-- 
2.5.5
