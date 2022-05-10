Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13646C433EF
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 19:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9095941679;
	Tue, 10 May 2022 19:45:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tCsMwS9oa3hm; Tue, 10 May 2022 19:45:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1C2D4167C;
	Tue, 10 May 2022 19:44:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EDEAB1BF32E
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC2AA4167C
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:44:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l2A1dRCWX5zJ for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 19:44:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E14641679
 for <buildroot@buildroot.org>; Tue, 10 May 2022 19:44:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DF2F185D22; Tue, 10 May 2022 19:34:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 10 May 2022 21:44:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf46a20f26a4002de8f316845d0f08f7591d6f58
X-Git-Newrev: 68d0aede597d32816c5b2ff32de0ce33cc14eb93
X-Patchwork-Hint: ignore
Message-Id: <20220510193406.DF2F185D22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{glibc, localedef}: update to 2.35
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=68d0aede597d32816c5b2ff32de0ce33cc14eb93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://sourceware.org/pipermail/libc-alpha/2022-February/136040.html

- Remove upstreamed patch 0001. Patches to localedef are not upstream.
- allow to use optimization CFLAGS (not CPPFLAGS) which are nowadays
  supported by upstream (except nios2)
- enable support for or1k, which is now included upstream
- runtime tested with qemu-system for aarch64/arm/microblaze/mips/mips64/nios2/
  or1k/powerpc/powerpc64/powerpc64le/riscv32/riscv64/s390x/sh4/sparc64/x86/x86_64

Since only a single version is supported (no csky fork any more), move
the hash file out of the version directory. Also, make a symlink from
the localedef to the glibc hash file rather than copying it.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Tested-by: Petr Vorel <petr.vorel@gmail.com>
[Arnout: make localedef.hash a symlink]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...x-sysv-linux-microblaze-pselect32.c-add-m.patch | 85 ----------------------
 .../glibc.hash                                     |  7 --
 package/glibc/glibc.hash                           |  9 ++-
 package/glibc/glibc.mk                             | 17 +++--
 ...001-HACK-only-build-and-install-localedef.patch |  0
 ...ndency-on-GCC-to-4.8-and-binutils-to-2.24.patch |  0
 .../localedef.hash                                 |  7 --
 package/localedef/localedef.hash                   |  3 +-
 package/localedef/localedef.mk                     |  2 +-
 toolchain/toolchain-buildroot/Config.in            |  3 +-
 10 files changed, 22 insertions(+), 111 deletions(-)

diff --git a/package/glibc/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/0001-sysdeps-unix-sysv-linux-microblaze-pselect32.c-add-m.patch b/package/glibc/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/0001-sysdeps-unix-sysv-linux-microblaze-pselect32.c-add-m.patch
deleted file mode 100644
index 3597cd6a11..0000000000
--- a/package/glibc/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/0001-sysdeps-unix-sysv-linux-microblaze-pselect32.c-add-m.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From af06fe63f9babb6d0179ae5d7d9245daada6bf56 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sun, 26 Dec 2021 10:30:01 +0100
-Subject: [PATCH] sysdeps/unix/sysv/linux/microblaze/pselect32.c: add missing
- implementation when !__ASSUME_TIME64_SYSCALLS
-
-In commit a92f4e6299fe0e3cb6f77e79de00817aece501ce ("linux: Add time64
-pselect support"), a Microblaze specific implementation of
-__pselect32() was added to cover the case of kernels < 3.15 which lack
-the pselect6 system call.
-
-This new file sysdeps/unix/sysv/linux/microblaze/pselect32.c takes
-precedence over the default implementation
-sysdeps/unix/sysv/linux/pselect32.c.
-
-However sysdeps/unix/sysv/linux/pselect32.c provides an implementation
-of __pselect32() which is needed when __ASSUME_TIME64_SYSCALLS is not
-defined. On Microblaze, which is a 32-bit architecture,
-__ASSUME_TIME64_SYSCALLS is only true for kernels >= 5.1.
-
-Due to sysdeps/unix/sysv/linux/microblaze/pselect32.c taking
-precedence over sysdeps/unix/sysv/linux/pselect32.c, it means that
-when we are with a kernel >= 3.15 but < 5.1, we need a __pselect32()
-implementation, but sysdeps/unix/sysv/linux/microblaze/pselect32.c
-doesn't provide it, and sysdeps/unix/sysv/linux/pselect32.c which
-would provide it is not compiled in.
-
-This causes the following build failure on Microblaze with for example
-Linux kernel headers 4.9:
-
-/home/thomas/buildroot/buildroot/output/host/lib/gcc/microblazeel-buildroot-linux-gnu/10.3.0/../../../../microblazeel-buildroot-linux-gnu/bin/ld: /home/thomas/buildroot/buildroot/output/build/glibc-2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/build/libc_pic.os: in function `__pselect64':
-(.text+0x120b44): undefined reference to `__pselect32'
-collect2: error: ld returned 1 exit status
-
-To fix this, we take a crude approach: replicate in
-sysdeps/unix/sysv/linux/microblaze/pselect32.c the
-!__ASSUME_TIME64_SYSCALLS implementation that is already in
-sysdeps/unix/sysv/linux/pselect32.c.
-
-Upstream: https://sourceware.org/pipermail/libc-alpha/2021-December/134635.html
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- .../unix/sysv/linux/microblaze/pselect32.c    | 22 +++++++++++++++++--
- 1 file changed, 20 insertions(+), 2 deletions(-)
-
-diff --git a/sysdeps/unix/sysv/linux/microblaze/pselect32.c b/sysdeps/unix/sysv/linux/microblaze/pselect32.c
-index 70b7b52a48..6b6b3e8a2e 100644
---- a/sysdeps/unix/sysv/linux/microblaze/pselect32.c
-+++ b/sysdeps/unix/sysv/linux/microblaze/pselect32.c
-@@ -22,7 +22,25 @@
- #include <sys/poll.h>
- #include <sysdep-cancel.h>
- 
--#ifndef __ASSUME_PSELECT
-+#if !defined(__ASSUME_TIME64_SYSCALLS)
-+int
-+__pselect32 (int nfds, fd_set *readfds, fd_set *writefds,
-+	     fd_set *exceptfds, const struct __timespec64 *timeout,
-+	     const sigset_t *sigmask)
-+{
-+  struct timespec ts32, *pts32 = NULL;
-+  if (timeout != NULL)
-+    {
-+      ts32 = valid_timespec64_to_timespec (*timeout);
-+      pts32 = &ts32;
-+    }
-+
-+  return SYSCALL_CANCEL (pselect6, nfds, readfds, writefds, exceptfds,
-+			 pts32,
-+			 ((__syscall_ulong_t[]){ (uintptr_t) sigmask,
-+						 __NSIG_BYTES }));
-+}
-+#elif !defined(__ASSUME_PSELECT)
- int
- __pselect32 (int nfds, fd_set *readfds, fd_set *writefds,
- 	     fd_set *exceptfds, const struct __timespec64 *timeout,
-@@ -57,4 +75,4 @@ __pselect32 (int nfds, fd_set *readfds, fd_set *writefds,
- 
-   return ret;
- }
--#endif /* __ASSUME_PSELECT  */
-+#endif
--- 
-2.31.1
-
diff --git a/package/glibc/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/glibc.hash b/package/glibc/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/glibc.hash
deleted file mode 100644
index dfd939020f..0000000000
--- a/package/glibc/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/glibc.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# Locally calculated (fetched from Github)
-sha256  3c299a21468a80356b848ca341f45551616c4928a6c871e6d45cee942e8b0f24  glibc-2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c.tar.gz
-
-# Hashes for license files
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  b33d0bd9f685b46853548814893a6135e74430d12f6d94ab3eba42fc591f83bc  LICENSES
diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 5316f03b10..f28c15c2a3 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,2 +1,7 @@
-# This hash file is not used; instead, update the
-# hash files in the per-version sub-directories.
+# Locally calculated (fetched from Github)
+sha256  0ca43b2a6cd74609519554303a16e350abdac0e66943c5d98d91228233c826a0  glibc-2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586.tar.gz
+
+# Hashes for license files
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
+sha256  b33d0bd9f685b46853548814893a6135e74430d12f6d94ab3eba42fc591f83bc  LICENSES
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 2702994c6b..7b46ad42c3 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c
+GLIBC_VERSION = 2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
@@ -110,16 +110,21 @@ endif
 #
 #  2. We have to execute the configure script with bash and not sh.
 #
-# Note that as mentionned in
-# http://patches.openembedded.org/patch/38849/, glibc must be
-# built with -O2, so we pass our own CFLAGS and CXXFLAGS below.
+# Glibc nowadays can be build with optimization flags f.e. -Os
+
+GLIBC_CFLAGS = $(TARGET_OPTIMIZATION)
+# crash in qemu-system-nios2 with -Os
+ifeq ($(BR2_nios2),y)
+GLIBC_CFLAGS += -O2
+endif
+
 define GLIBC_CONFIGURE_CMDS
 	mkdir -p $(@D)/build
 	# Do the configuration
 	(cd $(@D)/build; \
 		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="-O2 $(GLIBC_EXTRA_CFLAGS)" CPPFLAGS="" \
-		CXXFLAGS="-O2 $(GLIBC_EXTRA_CFLAGS)" \
+		CFLAGS="$(GLIBC_CFLAGS) $(GLIBC_EXTRA_CFLAGS)" CPPFLAGS="" \
+		CXXFLAGS="$(GLIBC_CFLAGS) $(GLIBC_EXTRA_CFLAGS)" \
 		$(GLIBC_CONF_ENV) \
 		$(SHELL) $(@D)/configure \
 		--target=$(GNU_TARGET_NAME) \
diff --git a/package/localedef/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/0001-HACK-only-build-and-install-localedef.patch
similarity index 100%
rename from package/localedef/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/0001-HACK-only-build-and-install-localedef.patch
rename to package/localedef/0001-HACK-only-build-and-install-localedef.patch
diff --git a/package/localedef/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
similarity index 100%
rename from package/localedef/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
rename to package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
diff --git a/package/localedef/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/localedef.hash b/package/localedef/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/localedef.hash
deleted file mode 100644
index dfd939020f..0000000000
--- a/package/localedef/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/localedef.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# Locally calculated (fetched from Github)
-sha256  3c299a21468a80356b848ca341f45551616c4928a6c871e6d45cee942e8b0f24  glibc-2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c.tar.gz
-
-# Hashes for license files
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  b33d0bd9f685b46853548814893a6135e74430d12f6d94ab3eba42fc591f83bc  LICENSES
diff --git a/package/localedef/localedef.hash b/package/localedef/localedef.hash
deleted file mode 100644
index 5316f03b10..0000000000
--- a/package/localedef/localedef.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# This hash file is not used; instead, update the
-# hash files in the per-version sub-directories.
diff --git a/package/localedef/localedef.hash b/package/localedef/localedef.hash
new file mode 120000
index 0000000000..86320aa5e0
--- /dev/null
+++ b/package/localedef/localedef.hash
@@ -0,0 +1 @@
+../glibc/glibc.hash
\ No newline at end of file
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index f8f0b42984..fb5edde0c2 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c
+LOCALEDEF_VERSION = 2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index be89f68ab5..8d9cf4cc68 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -49,7 +49,8 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
 		   BR2_riscv       || BR2_s390x      || BR2_sh          || \
 		   BR2_sparc64     || BR2_x86_64     || BR2_microblaze  || \
-		   BR2_nios2       || (BR2_arc && BR2_ARC_ATOMIC_EXT)   || BR2_csky
+		   BR2_nios2       || (BR2_arc && BR2_ARC_ATOMIC_EXT)   || \
+		   BR2_csky 	   || BR2_or1k
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
