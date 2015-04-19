From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 19 Apr 2015 16:03:56 +0200
Subject: [Buildroot] [PATCH] uclibc-ng: update to 1.0.2
Message-ID: <20150419140355.GA7043@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following problems found by buildroot should be fixed:
 * static python2 compile (there is still a general problem, not related to uClibc-ng)
 * postgresql configure hickup (link warnings got removed)
 * samba runtime problems (RPATH in executables are respected)

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...selection-better-do-it-in-your-build-syst.patch |   60 ----------------
 .../0001-fix-static-linking-of-pthread-apps.patch  |   72 ++++++++++++++++++++
 package/uclibc/Config.in                           |    2 +-
 package/uclibc/uClibc-ng.config                    |    4 +-
 package/uclibc/uclibc.hash                         |    2 +-
 5 files changed, 77 insertions(+), 63 deletions(-)
 delete mode 100644 package/uclibc/1.0.1/0001-remove-NAN-selection-better-do-it-in-your-build-syst.patch
 create mode 100644 package/uclibc/1.0.2/0001-fix-static-linking-of-pthread-apps.patch

diff --git a/package/uclibc/1.0.1/0001-remove-NAN-selection-better-do-it-in-your-build-syst.patch b/package/uclibc/1.0.1/0001-remove-NAN-selection-better-do-it-in-your-build-syst.patch
deleted file mode 100644
index b94c5a3..0000000
--- a/package/uclibc/1.0.1/0001-remove-NAN-selection-better-do-it-in-your-build-syst.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 65aa786d3f6282da02d35b600e82408b47e0a3fe Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Mon, 9 Mar 2015 01:48:19 -0500
-Subject: [PATCH 20/20] remove NAN selection, better do it in your build
- system
-
-With older gcc than 4.9.x, this breaks the build.
-These specific compiler flags belongs better to your
-favorite build system.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- Rules.mak                 |    4 ----
- extra/Configs/Config.mips |   15 ---------------
- 2 files changed, 19 deletions(-)
-
-diff --git a/Rules.mak b/Rules.mak
-index 3b074a8..5217004 100644
---- a/Rules.mak
-+++ b/Rules.mak
-@@ -404,10 +404,6 @@ ifeq ($(TARGET_ARCH),mips)
- 	CPU_CFLAGS-$(CONFIG_MIPS_N64_ABI)+=-mabi=64
- 	CPU_CFLAGS-$(CONFIG_MIPS_O32_ABI)+=-mabi=32
- 	CPU_CFLAGS-$(CONFIG_MIPS_N32_ABI)+=-mabi=n32
--
--	CPU_CFLAGS-$(CONFIG_MIPS_NAN_LEGACY)+=-mnan=legacy
--	CPU_CFLAGS-$(CONFIG_MIPS_NAN_2008)+=-mnan=2008
--
- 	CPU_LDFLAGS-y += $(CPU_CFLAGS)
- endif
- 
-diff --git a/extra/Configs/Config.mips b/extra/Configs/Config.mips
-index 76b10c6..4d30d31 100644
---- a/extra/Configs/Config.mips
-+++ b/extra/Configs/Config.mips
-@@ -33,21 +33,6 @@ config CONFIG_MIPS_N64_ABI
- endchoice
- 
- choice
--	prompt "Target NAN Encoding"
--	default CONFIG_MIPS_NAN_LEGACY
--	help
--	  This is the NAN Encoding you want to use.  Chose either Legacy
--	  or 2008.
--
--config CONFIG_MIPS_NAN_LEGACY
--	bool "LEGACY"
--
--config CONFIG_MIPS_NAN_2008
--	bool "2008"
--
--endchoice
--
--choice
- 	prompt "Target Processor Architecture"
- 	default CONFIG_MIPS_ISA_1 if CONFIG_MIPS_O32_ABI
- 	default CONFIG_MIPS_ISA_3 if CONFIG_MIPS_N32_ABI
--- 
-1.7.10.4
-
diff --git a/package/uclibc/1.0.2/0001-fix-static-linking-of-pthread-apps.patch b/package/uclibc/1.0.2/0001-fix-static-linking-of-pthread-apps.patch
new file mode 100644
index 0000000..a0f3bc0
--- /dev/null
+++ b/package/uclibc/1.0.2/0001-fix-static-linking-of-pthread-apps.patch
@@ -0,0 +1,72 @@
+From 74c69da52ad5029cd2fc2d3d41d581022ed0a7aa Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Wed, 15 Apr 2015 12:47:57 -0500
+Subject: [PATCH] fix static linking of pthread apps
+
+When compiling python you get duplicate symbol problem.
+Seen in the autobuilders of buildroot project.
+
+Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+---
+ libc/sysdeps/linux/common/setregid.c  | 2 +-
+ libc/sysdeps/linux/common/setresgid.c | 4 ++--
+ libc/sysdeps/linux/common/setresuid.c | 4 ++--
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/libc/sysdeps/linux/common/setregid.c b/libc/sysdeps/linux/common/setregid.c
+index 15d590a..aaa7293 100644
+--- a/libc/sysdeps/linux/common/setregid.c
++++ b/libc/sysdeps/linux/common/setregid.c
+@@ -37,4 +37,4 @@ int setregid(gid_t rgid, gid_t egid)
+ }
+ #endif
+ 
+-libc_hidden_def(setregid)
++libc_hidden_weak(setregid)
+diff --git a/libc/sysdeps/linux/common/setresgid.c b/libc/sysdeps/linux/common/setresgid.c
+index 95decc2..b6d1647 100644
+--- a/libc/sysdeps/linux/common/setresgid.c
++++ b/libc/sysdeps/linux/common/setresgid.c
+@@ -16,7 +16,7 @@
+ # define __NR_setresgid __NR_setresgid32
+ 
+ _syscall3(int, setresgid, gid_t, rgid, gid_t, egid, gid_t, sgid)
+-libc_hidden_def(setresgid)
++libc_hidden_weak(setresgid)
+ 
+ #elif defined(__NR_setresgid)
+ 
+@@ -34,7 +34,7 @@ int setresgid(gid_t rgid, gid_t egid, gid_t sgid)
+ 	}
+ 	return (__syscall_setresgid(rgid, egid, sgid));
+ }
+-libc_hidden_def(setresgid)
++libc_hidden_weak(setresgid)
+ 
+ #endif
+ 
+diff --git a/libc/sysdeps/linux/common/setresuid.c b/libc/sysdeps/linux/common/setresuid.c
+index 022ccfe..a2a2183 100644
+--- a/libc/sysdeps/linux/common/setresuid.c
++++ b/libc/sysdeps/linux/common/setresuid.c
+@@ -16,7 +16,7 @@
+ # define __NR_setresuid __NR_setresuid32
+ 
+ _syscall3(int, setresuid, uid_t, ruid, uid_t, euid, uid_t, suid)
+-libc_hidden_def(setresuid)
++libc_hidden_weak(setresuid)
+ 
+ #elif defined(__NR_setresuid)
+ 
+@@ -34,7 +34,7 @@ int setresuid(uid_t ruid, uid_t euid, uid_t suid)
+ 	}
+ 	return (__syscall_setresuid(ruid, euid, suid));
+ }
+-libc_hidden_def(setresuid)
++libc_hidden_weak(setresuid)
+ 
+ #endif
+ 
+-- 
+2.3.2 (Apple Git-55)
+
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index fdf8351..a48e2ec 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -69,7 +69,7 @@ config BR2_UCLIBC_VERSION_STRING
 	string
 	default "0.9.33.2"	if BR2_UCLIBC_VERSION_0_9_33
 	default "arc-2014.12" if BR2_UCLIBC_VERSION_ARC_GIT
-	default "1.0.1"		if BR2_UCLIBC_VERSION_NG
+	default "1.0.2"		if BR2_UCLIBC_VERSION_NG
 	default "7bf35c8b7d4a1f97174eb49f47f33946b282114c" if BR2_UCLIBC_VERSION_XTENSA_GIT
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
diff --git a/package/uclibc/uClibc-ng.config b/package/uclibc/uClibc-ng.config
index 2885af6..c6e7ff9 100644
--- a/package/uclibc/uClibc-ng.config
+++ b/package/uclibc/uClibc-ng.config
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Version: 1.0.1
+# Version: 1.0.2
 #
 # TARGET_alpha is not set
 # TARGET_arc is not set
@@ -93,6 +93,7 @@ LDSO_PRELOAD_ENV_SUPPORT=y
 # LDSO_PRELINK_SUPPORT is not set
 # UCLIBC_STATIC_LDCONFIG is not set
 LDSO_RUNPATH=y
+LDSO_RUNPATH_OF_EXECUTABLE=y
 LDSO_SAFE_RUNPATH=y
 LDSO_SEARCH_INTERP_PATH=y
 LDSO_LD_LIBRARY_PATH=y
@@ -236,6 +237,7 @@ UCLIBC_HAS_FTW=y
 # UCLIBC_HAS_FTS is not set
 UCLIBC_HAS_GLOB=y
 UCLIBC_HAS_GNU_GLOB=y
+UCLIBC_HAS_UTMP=y
 UCLIBC_HAS_UTMPX=y
 
 #
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 69cc103..7bfe46f 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -5,4 +5,4 @@ sha256	62333167b79afb0b25a843513288c67b59547acf653e8fbe62ee64e71ebd1587	uClibc-0
 sha256	0a9085a11615296cfe7783f16ff29073393eb330749947adece0eeddb31705a4	uClibc-arc-2014.08.tar.gz
 
 # From http://www.uclibc-ng.org/trac/
-sha256  e561040293ba4f21dcf3285ca1f683b5a8493eb0ffd3b3e495122cfde5a64a0e        uClibc-ng-1.0.1.tar.xz
+sha256  7e92e99995daa634cbdc63c297784df6e8fe39cc1d3bbd2d37eb5c3ced8a86e5        uClibc-ng-1.0.2.tar.xz
-- 
1.7.10.4
