From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 22:28:01 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] attr: Add a patch to fix
 an unconditional infinite recursion
Message-ID: <20181125212452.4B0A4883B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58d46327d901452c0aa7d46544ebea8d3c03d9bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The bump to 2.4.48 introduced a bug that, according to the author,
only happen in certain cases on glibc. But under uclibc-ng, it happens
every time.

The bug essentially cause any program calling any libattr.so function
to enter an infinite recursion, because of a symbol conflict between
uclibc-ng and libattr wrappers, that causes the libattr wrappers to
call themselves.

This infinite recursion does not consume the stack, so programs
basically behave like they enter an infinite loop.

It is easy to reproduce with qemu_arm_versatile_defconfig +
BR2_PACKAGE_ATTR: "getfattr ." never returns and takes 100% CPU.

Upstream fixed it, but the patch is not part of a release yet,
so take the patch.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 99989d3b91ef6cadc0c8d1a73203178da9ac6af7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/attr/0002-Switch-back-to-syscall.patch | 126 +++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/package/attr/0002-Switch-back-to-syscall.patch b/package/attr/0002-Switch-back-to-syscall.patch
new file mode 100644
index 0000000000..de879e23ab
--- /dev/null
+++ b/package/attr/0002-Switch-back-to-syscall.patch
@@ -0,0 +1,126 @@
+From 14adc898a36948267bfe5c63b399996879e94c98 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruenba@redhat.com>
+Date: Fri, 17 Aug 2018 14:07:31 +0200
+Subject: Switch back to syscall()
+
+Switch back to syscall() for the *xattr system calls.  The current
+mechanism of forwarding those calls to glibc breaks libraries like
+libfakeroot (fakeroot) and libasan (the gcc address sanitizer; gcc
+-fsanitize=address).
+
+Those libraries provide wrappers for functions defined in other shared
+libraries, usually glibc, do their own processing, and forward calls to
+the original symbols looke dup via dlsym(RTLD_NEXT, "symbol_name").  In
+our case, dlsym returns the libattr_*xattr wrappers.  However, when our
+wrappers try calling glibc, they end up calling the libfakeroot /
+libasan wrappers instead because those override the original symbols =>
+recursion.
+
+The libattr_*xattr wrappers will only be used when symbols are looked up
+at runtime (dlopen / dlsym).  Programs linking against libattr will
+directly use the glibc provided symbols.  Therefore, the slightly worse
+performance of syscall() won't affect any of the "normal" users of
+libattr.
+
+[nicolas.cavallari: with uclibc-ng, the recursion always happen]
+Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+---
+ libattr/syscalls.c | 26 ++++++++++++++------------
+ 1 file changed, 14 insertions(+), 12 deletions(-)
+
+diff --git a/libattr/syscalls.c b/libattr/syscalls.c
+index 3013aa0..721ad7f 100644
+--- a/libattr/syscalls.c
++++ b/libattr/syscalls.c
+@@ -22,6 +22,8 @@
+ 
+ #include "config.h"
+ 
++#include <unistd.h>
++#include <sys/syscall.h>
+ #include <sys/xattr.h>
+ 
+ #ifdef HAVE_VISIBILITY_ATTRIBUTE
+@@ -31,67 +33,67 @@
+ int libattr_setxattr(const char *path, const char *name,
+ 		     void *value, size_t size, int flags)
+ {
+-	return setxattr(path, name, value, size, flags);
++	return syscall(__NR_setxattr, path, name, value, size, flags);
+ }
+ 
+ int libattr_lsetxattr(const char *path, const char *name,
+ 		      void *value, size_t size, int flags)
+ {
+-	return lsetxattr(path, name, value, size, flags);
++	return syscall(__NR_lsetxattr, path, name, value, size, flags);
+ }
+ 
+ int libattr_fsetxattr(int filedes, const char *name,
+ 		      void *value, size_t size, int flags)
+ {
+-	return fsetxattr(filedes, name, value, size, flags);
++	return syscall(__NR_fsetxattr, filedes, name, value, size, flags);
+ }
+ 
+ ssize_t libattr_getxattr(const char *path, const char *name,
+ 			 void *value, size_t size)
+ {
+-	return getxattr(path, name, value, size);
++	return syscall(__NR_getxattr, path, name, value, size);
+ }
+ 
+ ssize_t libattr_lgetxattr(const char *path, const char *name,
+ 			  void *value, size_t size)
+ {
+-	return lgetxattr(path, name, value, size);
++	return syscall(__NR_lgetxattr, path, name, value, size);
+ }
+ 
+ ssize_t libattr_fgetxattr(int filedes, const char *name,
+ 			  void *value, size_t size)
+ {
+-	return fgetxattr(filedes, name, value, size);
++	return syscall(__NR_fgetxattr, filedes, name, value, size);
+ }
+ 
+ ssize_t libattr_listxattr(const char *path, char *list, size_t size)
+ {
+-	return listxattr(path, list, size);
++	return syscall(__NR_listxattr, path, list, size);
+ }
+ 
+ ssize_t libattr_llistxattr(const char *path, char *list, size_t size)
+ {
+-	return llistxattr(path, list, size);
++	return syscall(__NR_llistxattr, path, list, size);
+ }
+ 
+ ssize_t libattr_flistxattr(int filedes, char *list, size_t size)
+ {
+-	return flistxattr(filedes, list, size);
++	return syscall(__NR_flistxattr, filedes, list, size);
+ }
+ 
+ int libattr_removexattr(const char *path, const char *name)
+ {
+-	return removexattr(path, name);
++	return syscall(__NR_removexattr, path, name);
+ }
+ 
+ int libattr_lremovexattr(const char *path, const char *name)
+ {
+-	return lremovexattr(path, name);
++	return syscall(__NR_lremovexattr, path, name);
+ }
+ 
+ int libattr_fremovexattr(int filedes, const char *name)
+ {
+-	return fremovexattr(filedes, name);
++	return syscall(__NR_fremovexattr, filedes, name);
+ }
+ 
+ #ifdef HAVE_VISIBILITY_ATTRIBUTE
+-- 
+cgit v1.0-41-gc330
+
