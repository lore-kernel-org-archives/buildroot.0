From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Feb 2021 22:31:15 +0100
Subject: [Buildroot] [git commit] package/libselinux: fix build with musl
 1.2.2
Message-ID: <20210219211000.98A4B84C4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=452f9ca82f76038527906a06a3a63692cbc357d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/34b010e76d65cf1d79ef53207cbc00a86674e17a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...gettid-to-something-which-never-conflicts.patch | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/package/libselinux/0003-libselinux-rename-gettid-to-something-which-never-conflicts.patch b/package/libselinux/0003-libselinux-rename-gettid-to-something-which-never-conflicts.patch
new file mode 100644
index 0000000000..2a23e98f9b
--- /dev/null
+++ b/package/libselinux/0003-libselinux-rename-gettid-to-something-which-never-conflicts.patch
@@ -0,0 +1,71 @@
+From 398d2ceef92cb1baac18e6b34a1a8e1bf41296cd Mon Sep 17 00:00:00 2001
+From: Nicolas Iooss <nicolas.iooss@m4x.org>
+Date: Tue, 16 Feb 2021 22:13:28 +0100
+Subject: [PATCH] libselinux: rename gettid() to something which never
+ conflicts with the libc
+
+Musl recently added a wrapper for gettid() syscall. There is no way to
+detect this new version in a reliable way, so rename our gettid()
+wrapper to a non-conflicting name.
+
+Introduce a new function which, when using a libc known to provide a
+wrapper for gettid(), calls it, and which, otherwise, performs the
+syscall directly.
+
+Anyway this function is only used on systems where /proc/thread-self
+does not exist, which are therefore running Linux<3.17.
+
+Fixes: https://github.com/SELinuxProject/selinux/issues/282
+Signed-off-by: Nicolas Iooss <nicolas.iooss@m4x.org>
+Acked-by: Petr Lautrbach <plautrba@redhat.com>
+[Retrieved from:
+https://github.com/SELinuxProject/selinux/commit/398d2ceef92cb1baac18e6b34a1a8e1bf41296cd]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/procattr.c | 18 ++++++++++--------
+ 1 file changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/src/procattr.c b/src/procattr.c
+index 1aa67ac53..840570525 100644
+--- a/src/procattr.c
++++ b/src/procattr.c
+@@ -25,21 +25,23 @@ static __thread char destructor_initialized;
+ /* Bionic and glibc >= 2.30 declare gettid() system call wrapper in unistd.h and
+  * has a definition for it */
+ #ifdef __BIONIC__
+-  #define OVERRIDE_GETTID 0
++  #define HAVE_GETTID 1
+ #elif !defined(__GLIBC_PREREQ)
+-  #define OVERRIDE_GETTID 1
++  #define HAVE_GETTID 0
+ #elif !__GLIBC_PREREQ(2,30)
+-  #define OVERRIDE_GETTID 1
++  #define HAVE_GETTID 0
+ #else
+-  #define OVERRIDE_GETTID 0
++  #define HAVE_GETTID 1
+ #endif
+ 
+-#if OVERRIDE_GETTID
+-static pid_t gettid(void)
++static pid_t selinux_gettid(void)
+ {
++#if HAVE_GETTID
++	return gettid();
++#else
+ 	return syscall(__NR_gettid);
+-}
+ #endif
++}
+ 
+ static void procattr_thread_destructor(void __attribute__((unused)) *unused)
+ {
+@@ -94,7 +96,7 @@ static int openattr(pid_t pid, const char *attr, int flags)
+ 		if (fd >= 0 || errno != ENOENT)
+ 			goto out;
+ 		free(path);
+-		tid = gettid();
++		tid = selinux_gettid();
+ 		rc = asprintf(&path, "/proc/self/task/%d/attr/%s", tid, attr);
+ 	} else {
+ 		errno = EINVAL;
