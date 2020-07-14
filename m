From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 22:03:59 +0200
Subject: [Buildroot] [git commit] package/lxc: bump to version 4.0.3
Message-ID: <20200714200033.3FC8C84054@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a393677314dfdaa6a4bd6a847b642ae54517538
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patches (already in version) and so drop autoreconf
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ppers-rename-internal-memfd_create-to-mem.patch | 43 ----------------------
 ...ure.ac-fix-build-on-toolchain-without-SSP.patch | 36 ------------------
 ...src-lxc-raw_syscalls.c-fix-sparc-assembly.patch | 41 ---------------------
 .../0004-cgroups-initialize-cpuset-properly.patch  | 38 -------------------
 package/lxc/lxc.hash                               |  4 +-
 package/lxc/lxc.mk                                 |  4 +-
 6 files changed, 3 insertions(+), 163 deletions(-)

diff --git a/package/lxc/0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch b/package/lxc/0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch
deleted file mode 100644
index 6210591c09..0000000000
--- a/package/lxc/0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 2b23a1313f501423aecbe4ad4a988a9f6f832f1f Mon Sep 17 00:00:00 2001
-From: Patrick Havelange <patrick.havelange@essensium.com>
-Date: Tue, 22 Oct 2019 12:29:54 +0200
-Subject: [PATCH 1/1] syscall_wrappers: rename internal memfd_create to
- memfd_create_lxc
-
-In case the internal memfd_create has to be used, make sure we don't
-clash with the already existing memfd_create function from glibc.
-
-This can happen if this glibc function is a stub. In this case, at
-./configure time, the test for this function will return false, however
-the declaration of that function is still available. This leads to
-compilation errors.
-
-Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
----
- src/lxc/syscall_wrappers.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/lxc/syscall_wrappers.h b/src/lxc/syscall_wrappers.h
-index 42d94db..bddf01b 100644
---- a/src/lxc/syscall_wrappers.h
-+++ b/src/lxc/syscall_wrappers.h
-@@ -59,7 +59,7 @@ static inline long __keyctl(int cmd, unsigned long arg2, unsigned long arg3,
- #endif
- 
- #ifndef HAVE_MEMFD_CREATE
--static inline int memfd_create(const char *name, unsigned int flags) {
-+static inline int memfd_create_lxc(const char *name, unsigned int flags) {
- 	#ifndef __NR_memfd_create
- 		#if defined __i386__
- 			#define __NR_memfd_create 356
-@@ -98,6 +98,7 @@ static inline int memfd_create(const char *name, unsigned int flags) {
- 	return -1;
- 	#endif
- }
-+#define memfd_create memfd_create_lxc
- #else
- extern int memfd_create(const char *name, unsigned int flags);
- #endif
--- 
-2.20.1
-
diff --git a/package/lxc/0002-configure.ac-fix-build-on-toolchain-without-SSP.patch b/package/lxc/0002-configure.ac-fix-build-on-toolchain-without-SSP.patch
deleted file mode 100644
index aa35e93824..0000000000
--- a/package/lxc/0002-configure.ac-fix-build-on-toolchain-without-SSP.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 226205f0c5e3ef6f5757ffdfddd5b815b217e4ff Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 11 Nov 2019 22:55:36 +0100
-Subject: [PATCH] configure.ac: fix build on toolchain without SSP
-
-Commit 3b5a0eebd4d2efdaa03c6fb11950abfcf081fab8 reverted
-3aa7271157d3c815a4426c1f8eaea2f3b6dafa6a resulting in lxc being unable
-to be built on toolchain without SSP support
-
-Fixes:
- - http://autobuild.buildroot.org/results/57945f54ffbc5c8764b6891a4516c4907e56ab97
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/lxc/lxc/pull/3184]
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 645a2166d..4c1a10b3d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -713,8 +713,8 @@ AX_CHECK_COMPILE_FLAG([-Wcast-align], [CFLAGS="$CFLAGS -Wcast-align"],,[-Werror]
- AX_CHECK_COMPILE_FLAG([-Wstrict-prototypes], [CFLAGS="$CFLAGS -Wstrict-prototypes"],,[-Werror])
- AX_CHECK_COMPILE_FLAG([-fno-strict-aliasing], [CFLAGS="$CFLAGS -fno-strict-aliasing"],,[-Werror])
- AX_CHECK_COMPILE_FLAG([-fstack-clash-protection], [CFLAGS="$CFLAGS -fstack-clash-protection"],,[-Werror])
--AX_CHECK_COMPILE_FLAG([-fstack-protector-strong], [CFLAGS="$CFLAGS -fstack-protector-strong"],,[-Werror])
--AX_CHECK_COMPILE_FLAG([--param=ssp-buffer-size=4], [CFLAGS="$CFLAGS --param=ssp-buffer-size=4"],,[-Werror])
-+AX_CHECK_LINK_FLAG([-fstack-protector-strong], [CFLAGS="$CFLAGS -fstack-protector-strong"],,[-Werror])
-+AX_CHECK_LINK_FLAG([--param=ssp-buffer-size=4], [CFLAGS="$CFLAGS --param=ssp-buffer-size=4"],,[-Werror])
- AX_CHECK_COMPILE_FLAG([-g], [CFLAGS="$CFLAGS -g"],,[-Werror])
- AX_CHECK_COMPILE_FLAG([--mcet -fcf-protection], [CFLAGS="$CFLAGS --mcet -fcf-protection"],,[-Werror])
- AX_CHECK_COMPILE_FLAG([-Werror=implicit-function-declaration], [CFLAGS="$CFLAGS -Werror=implicit-function-declaration"],,[-Werror])
--- 
-2.23.0
-
diff --git a/package/lxc/0003-src-lxc-raw_syscalls.c-fix-sparc-assembly.patch b/package/lxc/0003-src-lxc-raw_syscalls.c-fix-sparc-assembly.patch
deleted file mode 100644
index 4de07ddada..0000000000
--- a/package/lxc/0003-src-lxc-raw_syscalls.c-fix-sparc-assembly.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 5f7dd076fe203ebe6992698b63a1856a98bc0bba Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 28 Feb 2020 17:35:42 +0100
-Subject: [PATCH] src/lxc/raw_syscalls.c: fix sparc assembly
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Build of lxc 3.2.1 fails with ultrasparc on:
-
-raw_syscalls.c: In function ???lxc_raw_clone???:
-raw_syscalls.c:66:3: error: invalid 'asm': invalid operand output code
-   asm volatile(
-   ^~~
-
-Issue has been added with commit
-b52e8e68a61866da2af86e85905ec850f8a8b7fc which added %g1 instead of %%g1
-
-Fixes:
- - http://autobuild.buildroot.org/results/17c2319850f02f24da6fbef9656c07f86fdc5a3a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/lxc/lxc/commit/5f7dd076fe203ebe6992698b63a1856a98bc0bba]
----
- src/lxc/raw_syscalls.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/lxc/raw_syscalls.c b/src/lxc/raw_syscalls.c
-index 7ffb2584b8..bfa48c0348 100644
---- a/src/lxc/raw_syscalls.c
-+++ b/src/lxc/raw_syscalls.c
-@@ -76,7 +76,7 @@ __returns_twice pid_t lxc_raw_clone(unsigned long flags, int *pidfd)
- 		     * processor status register (psr) is used instead of a
- 		     * full register.
- 		     */
--		    "addx %%g0, 0, %g1"
-+		    "addx %%g0, 0, %%g1"
- 		    : "=r"(g1), "=r"(o0), "=r"(o1), "=r"(o2) /* outputs */
- 		    : "r"(g1), "r"(o0), "r"(o1), "r"(o2)     /* inputs */
- 		    : "%cc");				     /* clobbers */
diff --git a/package/lxc/0004-cgroups-initialize-cpuset-properly.patch b/package/lxc/0004-cgroups-initialize-cpuset-properly.patch
deleted file mode 100644
index 86aa708d56..0000000000
--- a/package/lxc/0004-cgroups-initialize-cpuset-properly.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 6a8a510211515824ff20699d45f6d07a84f3c02e Mon Sep 17 00:00:00 2001
-From: Christian Brauner <christian.brauner@ubuntu.com>
-Date: Sun, 28 Jul 2019 23:13:26 +0200
-Subject: [PATCH] cgroups: initialize cpuset properly
-
-Closes #3108.
-Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
-(cherry picked from commit b31d62b847a3ee013613795094cce4acc12345ef)
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- src/lxc/cgroups/cgfsng.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/lxc/cgroups/cgfsng.c b/src/lxc/cgroups/cgfsng.c
-index 87e12d2dd..7e691d7cc 100644
---- a/src/lxc/cgroups/cgfsng.c
-+++ b/src/lxc/cgroups/cgfsng.c
-@@ -496,12 +496,12 @@ static bool cg_legacy_filter_and_set_cpus(char *path, bool am_initialized)
- 	}
- 
- 	if (!flipped_bit) {
--		DEBUG("No isolated or offline cpus present in cpuset");
--		return true;
-+		cpulist = lxc_cpumask_to_cpulist(possmask, maxposs);
-+		TRACE("No isolated or offline cpus present in cpuset");
-+	} else {
-+		cpulist = move_ptr(posscpus);
-+		TRACE("Removed isolated or offline cpus from cpuset");
- 	}
--	DEBUG("Removed isolated or offline cpus from cpuset");
--
--	cpulist = lxc_cpumask_to_cpulist(possmask, maxposs);
- 	if (!cpulist) {
- 		ERROR("Failed to create cpu list");
- 		return false;
--- 
-2.24.1
-
diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index d5ea799776..faaa17dde0 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	5f903986a4b17d607eea28c0aa56bf1e76e8707747b1aa07d31680338b1cc3d4	lxc-3.2.1.tar.gz
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
+sha256  d56d91d772449c57e9a67b770dab8967e412051d8d6246ce56c63264671672e5  lxc-4.0.3.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 7994dffcf5..0d88cd6c8c 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-LXC_VERSION = 3.2.1
+LXC_VERSION = 4.0.3
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = LGPL-2.1+
 LXC_LICENSE_FILES = COPYING
 LXC_DEPENDENCIES = host-pkgconf
 LXC_INSTALL_STAGING = YES
-# We're patching configure.ac
-LXC_AUTORECONF = YES
 
 LXC_CONF_OPTS = \
 	--disable-apparmor \
