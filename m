From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Mar 2016 22:12:16 +0100
Subject: [Buildroot] [git commit] lxc: remove dependency on headers >= 3.0
Message-ID: <20160318211635.19C3D7F940@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=598d1e53c1a15bb983ed96a19db411bbcdfd97df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that libcap no longer needs kernel headers >= 3.0, we can remove
this dependency from lxc. However, building with headers 2.6.32
exhibits a build issue caused by the redefinition of the setns()
function.

Since setns() is not implemented in the C library, lxc provides its
own version. However, for some reason, while the C library doesn't
implement setns(), it provides a prototype for it, which is not
exactly the same as the one in lxc, causing a build failure. We re-use
a solution implemented in gdb to solve the same problem: define in lxc
a function called do_setns(), which calls setns() when available, or
manually does the system call otherwise.

Of course, with old kernels the system call will not be available, so
things will fail at runtime, but this was anyway already the behavior
of lxc's setns() dummy implementation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0002-src-lxc-utils.h-don-t-redefine-setns.patch | 159 +++++++++++++++++++++
 package/lxc/Config.in                              |   4 +-
 2 files changed, 160 insertions(+), 3 deletions(-)

diff --git a/package/lxc/0002-src-lxc-utils.h-don-t-redefine-setns.patch b/package/lxc/0002-src-lxc-utils.h-don-t-redefine-setns.patch
new file mode 100644
index 0000000..78c88f8
--- /dev/null
+++ b/package/lxc/0002-src-lxc-utils.h-don-t-redefine-setns.patch
@@ -0,0 +1,159 @@
+From fc111c5df2ce573f6d01c2a78405455aa4bc766c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 16 Mar 2016 11:47:51 +0100
+Subject: [PATCH] src/lxc/utils.h: don't redefine setns()
+
+The current logic in src/lxc/utils.h consists in implementing a
+setns() function if HAVE_SETNS is undefined. However, there are cases
+where the autoconf setns() check will fail (and therefore HAVE_SETNS
+will not be defined), but the C library does provide a setns()
+prototype. Unfortunately, this prototype conflicts with the one used
+internally in LXC. The C library headers define:
+
+extern int setns (int __fd, int __nstype) __THROW;
+
+While LXC defines:
+
+static inline int do_setns(int fd, int nstype)
+
+Which triggers the following build failures:
+
+utils.h:52:19: error: static declaration of 'setns' follows non-static declaration
+ static inline int setns(int fd, int nstype)
+                   ^
+In file included from /home/test/buildroot2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/sched.h:43:0,
+                 from bdev.c:38:
+/home/test/buildroot2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/bits/sched.h:91:12: note: previous declaration of 'setns' was here
+ extern int setns (int __fd, int __nstype) __THROW;
+
+In order to resolve this problem, we adopt the solution that was
+adopted by the gdb project at
+https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=a8c636cb54328fb9a71dcf27b66a7e7ab5443d88:
+the function defined by LXC is renamed to do_setns(), and calls
+setns() when available, or otherwise falls back on doing the system
+calls manually.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/lxc/attach.c       | 2 +-
+ src/lxc/conf.c         | 4 ++--
+ src/lxc/lxc_user_nic.c | 4 ++--
+ src/lxc/start.c        | 2 +-
+ src/lxc/utils.c        | 2 +-
+ src/lxc/utils.h        | 9 ++++-----
+ 6 files changed, 11 insertions(+), 12 deletions(-)
+
+diff --git a/src/lxc/attach.c b/src/lxc/attach.c
+index 436ae7a..953963f 100644
+--- a/src/lxc/attach.c
++++ b/src/lxc/attach.c
+@@ -260,7 +260,7 @@ static int lxc_attach_to_ns(pid_t pid, int which)
+ 	}
+ 
+ 	for (i = 0; i < size; i++) {
+-		if (fd[i] >= 0 && setns(fd[i], 0) != 0) {
++		if (fd[i] >= 0 && do_setns(fd[i], 0) != 0) {
+ 			saved_errno = errno;
+ 
+ 			for (j = i; j < size; j++)
+diff --git a/src/lxc/conf.c b/src/lxc/conf.c
+index 55c2fae..8c7f16f 100644
+--- a/src/lxc/conf.c
++++ b/src/lxc/conf.c
+@@ -2636,7 +2636,7 @@ void restore_phys_nics_to_netns(int netnsfd, struct lxc_conf *conf)
+ 		SYSERROR("Failed to open monitor netns fd");
+ 		return;
+ 	}
+-	if (setns(netnsfd, 0) != 0) {
++	if (do_setns(netnsfd, 0) != 0) {
+ 		SYSERROR("Failed to enter container netns to reset nics");
+ 		close(oldfd);
+ 		return;
+@@ -2647,7 +2647,7 @@ void restore_phys_nics_to_netns(int netnsfd, struct lxc_conf *conf)
+ 			WARN("Error moving nic index:%d back to host netns",
+ 					s->ifindex);
+ 	}
+-	if (setns(oldfd, 0) != 0)
++	if (do_setns(oldfd, 0) != 0)
+ 		SYSERROR("Failed to re-enter monitor's netns");
+ 	close(oldfd);
+ }
+diff --git a/src/lxc/lxc_user_nic.c b/src/lxc/lxc_user_nic.c
+index 6622db0..399e855 100644
+--- a/src/lxc/lxc_user_nic.c
++++ b/src/lxc/lxc_user_nic.c
+@@ -492,7 +492,7 @@ static int rename_in_ns(int pid, char *oldname, char **newnamep)
+ 		fprintf(stderr, "Opening %s\n", nspath);
+ 		goto out_err;
+ 	}
+-	if (setns(fd, 0) < 0) {
++	if (do_setns(fd, 0) < 0) {
+ 		fprintf(stderr, "setns to container network namespace\n");
+ 		goto out_err;
+ 	}
+@@ -519,7 +519,7 @@ static int rename_in_ns(int pid, char *oldname, char **newnamep)
+ 		if (!*newnamep)
+ 			goto out_err;
+ 	}
+-	if (setns(ofd, 0) < 0) {
++	if (do_setns(ofd, 0) < 0) {
+ 		fprintf(stderr, "Error returning to original netns\n");
+ 		close(ofd);
+ 		return -1;
+diff --git a/src/lxc/start.c b/src/lxc/start.c
+index fa905e2..2c76713 100644
+--- a/src/lxc/start.c
++++ b/src/lxc/start.c
+@@ -157,7 +157,7 @@ static int attach_ns(const int ns_fd[LXC_NS_MAX]) {
+ 		if (ns_fd[i] < 0)
+ 			continue;
+ 
+-		if (setns(ns_fd[i], 0) != 0)
++		if (do_setns(ns_fd[i], 0) != 0)
+ 			goto error;
+ 	}
+ 	return 0;
+diff --git a/src/lxc/utils.c b/src/lxc/utils.c
+index d9e769d..a696e0f 100644
+--- a/src/lxc/utils.c
++++ b/src/lxc/utils.c
+@@ -1091,7 +1091,7 @@ bool switch_to_ns(pid_t pid, const char *ns) {
+ 		return false;
+ 	}
+ 
+-	ret = setns(fd, 0);
++	ret = do_setns(fd, 0);
+ 	if (ret) {
+ 		SYSERROR("failed to set process %d to %s of %d.", pid, ns, fd);
+ 		close(fd);
+diff --git a/src/lxc/utils.h b/src/lxc/utils.h
+index 059026f..0f79ba0 100644
+--- a/src/lxc/utils.h
++++ b/src/lxc/utils.h
+@@ -47,11 +47,11 @@ extern char *get_rundir(void);
+ #endif
+ #endif
+ 
+-/* Define setns() if missing from the C library */
+-#ifndef HAVE_SETNS
+-static inline int setns(int fd, int nstype)
++static inline int do_setns(int fd, int nstype)
+ {
+-#ifdef __NR_setns
++#ifdef HAVE_SETNS
++	return setns(fd, nstype);
++#elif defined(__NR_setns)
+ 	return syscall(__NR_setns, fd, nstype);
+ #elif defined(__NR_set_ns)
+ 	return syscall(__NR_set_ns, fd, nstype);
+@@ -60,7 +60,6 @@ static inline int setns(int fd, int nstype)
+ 	return -1;
+ #endif
+ }
+-#endif
+ 
+ /* Define unshare() if missing from the C library */
+ #ifndef HAVE_UNSHARE
+-- 
+2.6.4
+
diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index 3253f14..acc561c 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_LXC
 	depends on BR2_USE_MMU # fork()
 	# build system forcefully builds a shared library
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libcap
 	help
 	  Linux Containers (LXC), provides the ability to group and isolate
 	  of a set of processes in a jail by virtualizing and accounting the
@@ -13,8 +12,7 @@ config BR2_PACKAGE_LXC
 
 	  https://linuxcontainers.org/
 
-comment "lxc needs a toolchain w/ threads, headers >= 3.0, dynamic library"
+comment "lxc needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 \
 		|| BR2_STATIC_LIBS
