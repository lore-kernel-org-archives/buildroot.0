From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 15 Dec 2020 07:51:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/git: fix build without threads
Message-ID: <20201215065155.46439-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build of git version >= 2.29.0 without threads

Fixes:
 - http://autobuild.buildroot.org/results/d41638d1ad8e78dd6f654367c905996b838ee649

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../git/0001-Fix-build-without-threads.patch  | 100 ++++++++++++++++++
 package/git/git.mk                            |   2 +
 2 files changed, 102 insertions(+)
 create mode 100644 package/git/0001-Fix-build-without-threads.patch

diff --git a/package/git/0001-Fix-build-without-threads.patch b/package/git/0001-Fix-build-without-threads.patch
new file mode 100644
index 0000000000..7ce85ffaf8
--- /dev/null
+++ b/package/git/0001-Fix-build-without-threads.patch
@@ -0,0 +1,100 @@
+From 07d66af3b0800764087c4151d4f6562d4f8cce05 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 14 Dec 2020 23:00:33 +0100
+Subject: [PATCH] Fix build without threads
+
+Build without threads is broken since version 2.29.0 and
+https://github.com/git/git/commit/15b52a44e0c92a0658e891194a5b0610d1f53afc:
+
+In file included from cache.h:4,
+                 from blame.c:1:
+git-compat-util.h:1238:20: error: static declaration of 'flockfile' follows non-static declaration
+ static inline void flockfile(FILE *fh)
+                    ^~~~~~~~~
+In file included from git-compat-util.h:168,
+                 from cache.h:4,
+                 from blame.c:1:
+/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/stdio.h:806:13: note: previous declaration of 'flockfile' was here
+ extern void flockfile (FILE *__stream) __THROW;
+             ^~~~~~~~~
+In file included from cache.h:4,
+                 from blame.c:1:
+git-compat-util.h:1242:20: error: static declaration of 'funlockfile' follows non-static declaration
+ static inline void funlockfile(FILE *fh)
+                    ^~~~~~~~~~~
+In file included from git-compat-util.h:168,
+                 from cache.h:4,
+                 from blame.c:1:
+/nvme/rc-buildroot-test/scripts/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/stdio.h:813:13: note: previous declaration of 'funlockfile' was here
+ extern void funlockfile (FILE *__stream) __THROW;
+             ^~~~~~~~~~~
+
+To avoid this build failure, check if flockfile is available before
+defining flockfile, funlockfile and getc_unlocked
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d41638d1ad8e78dd6f654367c905996b838ee649
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile          | 5 +++++
+ configure.ac      | 6 ++++++
+ git-compat-util.h | 2 +-
+ 3 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 6fb86c5862..58d0893a12 100644
+--- a/Makefile
++++ b/Makefile
+@@ -232,6 +232,8 @@ all::
+ # Define NO_STRUCT_ITIMERVAL if you don't have struct itimerval
+ # This also implies NO_SETITIMER
+ #
++# Define NO_FLOCKFILE if you don't have flockfile()
++#
+ # Define NO_FAST_WORKING_DIRECTORY if accessing objects in pack files is
+ # generally faster on your platform than accessing the working directory.
+ #
+@@ -1638,6 +1640,9 @@ endif
+ ifdef NO_SETITIMER
+ 	COMPAT_CFLAGS += -DNO_SETITIMER
+ endif
++ifdef NO_FLOCKFILE
++	COMPAT_CFLAGS += -DNO_FLOCKFILE
++endif
+ ifdef NO_PREAD
+ 	COMPAT_CFLAGS += -DNO_PREAD
+ 	COMPAT_OBJS += compat/pread.o
+diff --git a/configure.ac b/configure.ac
+index 66aedb9288..d4295b5c69 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1132,6 +1132,12 @@ GIT_CHECK_FUNC(setitimer,
+ [NO_SETITIMER=YesPlease])
+ GIT_CONF_SUBST([NO_SETITIMER])
+ #
++# Define NO_FLOCKFILE if you don't have flockfile.
++GIT_CHECK_FUNC(flockfile,
++[NO_FLOCKFILE=],
++[NO_FLOCKFILE=YesPlease])
++GIT_CONF_SUBST([NO_FLOCKFILE])
++#
+ # Define NO_STRCASESTR if you don't have strcasestr.
+ GIT_CHECK_FUNC(strcasestr,
+ [NO_STRCASESTR=],
+diff --git a/git-compat-util.h b/git-compat-util.h
+index 7d509c5022..279cdd941e 100644
+--- a/git-compat-util.h
++++ b/git-compat-util.h
+@@ -1236,7 +1236,7 @@ int warn_on_fopen_errors(const char *path);
+ # define SHELL_PATH "/bin/sh"
+ #endif
+ 
+-#ifndef _POSIX_THREAD_SAFE_FUNCTIONS
++#if !defined(_POSIX_THREAD_SAFE_FUNCTIONS) && defined(NO_FLOCKFILE)
+ static inline void flockfile(FILE *fh)
+ {
+ 	; /* nothing */
+-- 
+2.29.2
+
diff --git a/package/git/git.mk b/package/git/git.mk
index 0fc081eaa1..6a15e3aeeb 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -10,6 +10,8 @@ GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
 GIT_LICENSE_FILES = COPYING LGPL-2.1
 GIT_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
+# We're patching configure.ac
+GIT_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 GIT_DEPENDENCIES += host-pkgconf openssl
-- 
2.29.2
