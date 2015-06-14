From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 14:51:06 +0200
Subject: [Buildroot] [git commit] uclibc: remove Xtensa specific version
Message-ID: <20150614125125.C4FF47FC9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6d237c8c2313829b6f7b4f06d55a5a4c89a870b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we now have uClibc-ng, and it is used as the default uClibc
version, there is no real need to keep the Xtensa version: this
version is just a specific Git revision of uClibc master branch, and
uClibc-ng is also based on uClibc master branch.

In addition, since in the choice of uClibc versions, uClibc-ng is
already *before* the Xtensa specific version, uClibc-ng has in fact
already been the default uClibc version for Xtensa since uClibc-ng
support was introduced.

See for example:

  http://autobuild.buildroot.org/results/c85/c854fae31d82e0f11d5a8b5bfc196c29bd7e21db/config

for a build on Xtensa with the internal toolchain, where in fact
uClibc-ng is used instead of the Xtensa specific version.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
---
 ...-add-missing-.literal_position-directives.patch |   62 ------------
 ...-posix_fadvise-Fix-build-breakage-for-LFS.patch |   98 --------------------
 ...n.arch-enable-long-double-math-for-xtensa.patch |   26 -----
 package/uclibc/Config.in                           |    7 --
 package/uclibc/uclibc.mk                           |    3 -
 5 files changed, 0 insertions(+), 196 deletions(-)

diff --git a/package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/0001-xtensa-add-missing-.literal_position-directives.patch b/package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/0001-xtensa-add-missing-.literal_position-directives.patch
deleted file mode 100644
index f5577c6..0000000
--- a/package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/0001-xtensa-add-missing-.literal_position-directives.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 04d7bd868b300c8150231d7a37e62150eaf810d0 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Mon, 24 Mar 2014 01:06:35 +0400
-Subject: [PATCH] xtensa: add missing .literal_position directives
-
-This addition allows building uClibc with -mtext-section-literals
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
- ldso/ldso/xtensa/dl-startup.h | 1 +
- ldso/ldso/xtensa/resolve.S    | 1 +
- libc/string/xtensa/strcmp.S   | 5 +++--
- 3 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/ldso/ldso/xtensa/dl-startup.h b/ldso/ldso/xtensa/dl-startup.h
-index 45af82d..b135a4c 100644
---- a/ldso/ldso/xtensa/dl-startup.h
-+++ b/ldso/ldso/xtensa/dl-startup.h
-@@ -11,6 +11,7 @@
- __asm__ (
-     "	.text\n"
-     "	.align  4\n"
-+    "	.literal_position\n"
-     "	.global _start\n"
-     "	.type   _start, @function\n"
-     "	.hidden _start\n"
-diff --git a/ldso/ldso/xtensa/resolve.S b/ldso/ldso/xtensa/resolve.S
-index 61c2c5d..d1ae8aa 100644
---- a/ldso/ldso/xtensa/resolve.S
-+++ b/ldso/ldso/xtensa/resolve.S
-@@ -27,6 +27,7 @@
- 
- 	.text
- 	.align	4
-+	.literal_position
- 	.global	_dl_linux_resolve
- 	.type	_dl_linux_resolve, @function
- _dl_linux_resolve:
-diff --git a/libc/string/xtensa/strcmp.S b/libc/string/xtensa/strcmp.S
-index d3d72e0..8ed1ed0 100644
---- a/libc/string/xtensa/strcmp.S
-+++ b/libc/string/xtensa/strcmp.S
-@@ -34,13 +34,14 @@
- 
- #define MASK4 0x40404040
- 
-+	.text
-+	.align 4
-+	.literal_position
- 	.literal .Lmask0, MASK0
- 	.literal .Lmask1, MASK1
- 	.literal .Lmask2, MASK2
- 	.literal .Lmask3, MASK3
- 	.literal .Lmask4, MASK4
--
--	.text
- ENTRY (strcmp)
- 	/* a2 = s1, a3 = s2 */
- 
--- 
-1.8.1.4
-
diff --git a/package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/0002-libc-posix_fadvise-Fix-build-breakage-for-LFS.patch b/package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/0002-libc-posix_fadvise-Fix-build-breakage-for-LFS.patch
deleted file mode 100644
index b17ea52..0000000
--- a/package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/0002-libc-posix_fadvise-Fix-build-breakage-for-LFS.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From patchwork Thu Jan  9 09:35:45 2014
-Content-Type: text/plain; charset="utf-8"
-MIME-Version: 1.0
-Content-Transfer-Encoding: 7bit
-Subject: libc: posix_fadvise: Fix build breakage for !LFS
-From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
-X-Patchwork-Id: 308533
-Message-Id: <1389260145-8810-1-git-send-email-vgupta@synopsys.com>
-To: <uclibc@uclibc.org>
-Cc: Francois.Bedard at synopsys.com, Vineet Gupta <Vineet.Gupta1@synopsys.com>, 
- markos Chandras <markos.chandras@gmail.com>
-Date: Thu, 9 Jan 2014 15:05:45 +0530
-
-commit 00571b43df2e "libc: posix_fadvise: restore implementation for xtensa"
-enabled posix_fadvise() for all arches (it was just not generated
-before).
-
-However this also unearthed an issue introduced by ee84b8b400
-"linux: posix_fadvise: use new SYSCALL_ALIGN_64BIT" which is to
-referencing LFS'ish code (off64_t) w/o proper checks which causes build
-to break for !LFS.
-
-Fix this by calling posix_fadvise64() only for LFS case and open-code
-it's equivalent for !LFS.
-
-Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
-Cc: Mike Frysinger <vapier@gentoo.org>
-Cc: Baruch Siach <baruch@tkos.co.il>
-Cc: Khem Raj <raj.khem@gmail.com>
-Cc: markos Chandras <markos.chandras@gmail.com>
-Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
-
----
-
-Patch status: sent upstream (http://patchwork.ozlabs.org/patch/308533/)
-
-libc/sysdeps/linux/common/posix_fadvise.c | 30 ++++++++++++++++++++++++------
- 1 file changed, 24 insertions(+), 6 deletions(-)
-
-diff --git a/libc/sysdeps/linux/common/posix_fadvise.c b/libc/sysdeps/linux/common/posix_fadvise.c
-index 25c294178e5e..14bbeeea13bc 100644
---- a/libc/sysdeps/linux/common/posix_fadvise.c
-+++ b/libc/sysdeps/linux/common/posix_fadvise.c
-@@ -22,17 +22,34 @@
- # include <endian.h>
- # include <bits/wordsize.h>
- 
--# ifdef __NR_fadvise64_64
--int posix_fadvise64(int fd, off64_t offset, off64_t len, int advice);
--# endif
-+# if defined(__NR_fadvise64_64) && defined(__UCLIBC_HAS_LFS__)
-+#include <_lfs_64.h>
- 
-+int posix_fadvise64(int fd, off64_t offset, off64_t len, int advice);
- int posix_fadvise(int fd, off_t offset, off_t len, int advice)
- {
--# ifdef __NR_fadvise64_64
- 	return posix_fadvise64(fd, offset, len, advice);
--# else
-+}
-+#else
-+
-+int posix_fadvise(int fd, off_t offset, off_t len, int advice)
-+{
- 	int ret;
- 	INTERNAL_SYSCALL_DECL(err);
-+
-+# ifdef __NR_fadvise64_64
-+#  if __WORDSIZE == 64
-+	ret = INTERNAL_SYSCALL(fadvise64_64, err, 4, fd, offset, len, advice);
-+#  else
-+#   if defined(__UCLIBC_SYSCALL_ALIGN_64BIT__) || defined(__arm__)
-+	ret = INTERNAL_SYSCALL(fadvise64_64, err, 6, fd, advice,
-+			OFF_HI_LO (offset), OFF_HI_LO (len));
-+#   else
-+	ret = INTERNAL_SYSCALL(fadvise64_64, err, 6, fd,
-+			OFF_HI_LO (offset), OFF_HI_LO (len), advice);
-+#   endif
-+#  endif
-+# else  /* __NR_fadvise64 */
- #  if __WORDSIZE == 64
- 	ret = INTERNAL_SYSCALL(fadvise64, err, 4, fd, offset, len, advice);
- #  else
-@@ -43,12 +60,13 @@ int posix_fadvise(int fd, off_t offset, off_t len, int advice)
- #   endif
- 			OFF_HI_LO (offset), len, advice);
- #  endif
-+#  endif
- 	if (INTERNAL_SYSCALL_ERROR_P (ret, err))
- 		return INTERNAL_SYSCALL_ERRNO (ret, err);
- 	return 0;
--#  endif
- }
- # if defined __UCLIBC_HAS_LFS__ && (!defined __NR_fadvise64_64 || __WORDSIZE == 64)
- strong_alias(posix_fadvise,posix_fadvise64)
- # endif
- #endif
-+#endif
diff --git a/package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/0003-Config.in.arch-enable-long-double-math-for-xtensa.patch b/package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/0003-Config.in.arch-enable-long-double-math-for-xtensa.patch
deleted file mode 100644
index 2aa7ac8..0000000
--- a/package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/0003-Config.in.arch-enable-long-double-math-for-xtensa.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From b0fb0d1f69ceaceba05500602747d9f85f360fb9 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Sat, 25 Oct 2014 14:29:08 +0400
-Subject: [PATCH] Config.in.arch: enable long double math for xtensa
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
- extra/Configs/Config.in.arch | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/extra/Configs/Config.in.arch b/extra/Configs/Config.in.arch
-index 2338e3c..68e03bf 100644
---- a/extra/Configs/Config.in.arch
-+++ b/extra/Configs/Config.in.arch
-@@ -191,7 +191,7 @@ config UCLIBC_HAS_FENV
- config UCLIBC_HAS_LONG_DOUBLE_MATH
- 	bool "Enable long double support"
- 	depends on DO_C99_MATH
--	depends on TARGET_i386 || TARGET_m68k || TARGET_sparc || TARGET_x86_64 || TARGET_powerpc || TARGET_sh || TARGET_microblaze
-+	depends on TARGET_i386 || TARGET_m68k || TARGET_sparc || TARGET_x86_64 || TARGET_powerpc || TARGET_sh || TARGET_microblaze || TARGET_xtensa
- 	default y
- 	help
- 	  If you want the uClibc math library to contain the full set of C99
--- 
-1.8.1.4
-
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 9b29ae5..f69cc25 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -43,11 +43,6 @@ choice
 		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL \
 		       if !BR2_arc && !BR2_m68k && !BR2_x86_i386
 
-	config BR2_UCLIBC_VERSION_XTENSA_GIT
-		bool "uClibc Git Xtensa"
-		depends on BR2_xtensa
-		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
-
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
 		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS if !BR2_xtensa
@@ -70,7 +65,6 @@ config BR2_UCLIBC_VERSION_STRING
 	default "0.9.33.2"	if BR2_UCLIBC_VERSION_0_9_33
 	default "arc-2014.12" if BR2_UCLIBC_VERSION_ARC_GIT
 	default "1.0.2"		if BR2_UCLIBC_VERSION_NG
-	default "7bf35c8b7d4a1f97174eb49f47f33946b282114c" if BR2_UCLIBC_VERSION_XTENSA_GIT
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
@@ -79,7 +73,6 @@ config BR2_UCLIBC_CONFIG
 	default "package/uclibc/uClibc-ng.config" if BR2_UCLIBC_VERSION_NG
 	default "package/uclibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_ARC_GIT
 	default "package/uclibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_SNAPSHOT
-	default "package/uclibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_XTENSA_GIT
 	help
 	  Some people may wish to use their own modified uClibc configuration
 	  file and will specify their config file location with this option.
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index b9dce7e..ecbfa11 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -18,9 +18,6 @@ UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 else ifeq ($(BR2_UCLIBC_VERSION_ARC_GIT),y)
 UCLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,uClibc,$(UCLIBC_VERSION))
 UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.gz
-else ifeq ($(BR2_UCLIBC_VERSION_XTENSA_GIT),y)
-UCLIBC_SITE = git://git.busybox.net/uClibc
-UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.gz
 else
 UCLIBC_SITE = http://www.uclibc.org/downloads
 UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.xz
