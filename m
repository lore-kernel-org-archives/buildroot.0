From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Apr 2021 21:22:18 +0200
Subject: [Buildroot] [git commit] package/attr: bump to version 2.5.1
Message-ID: <20210409185753.6A39E82B82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1ce058e4593c3dc9f8356ee44543f93335a4852
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop second patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/attr/0002-Switch-back-to-syscall.patch | 126 -------------------------
 package/attr/attr.hash                         |   2 +-
 package/attr/attr.mk                           |   3 +-
 3 files changed, 3 insertions(+), 128 deletions(-)

diff --git a/package/attr/0002-Switch-back-to-syscall.patch b/package/attr/0002-Switch-back-to-syscall.patch
deleted file mode 100644
index de879e23ab..0000000000
--- a/package/attr/0002-Switch-back-to-syscall.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-From 14adc898a36948267bfe5c63b399996879e94c98 Mon Sep 17 00:00:00 2001
-From: Andreas Gruenbacher <agruenba@redhat.com>
-Date: Fri, 17 Aug 2018 14:07:31 +0200
-Subject: Switch back to syscall()
-
-Switch back to syscall() for the *xattr system calls.  The current
-mechanism of forwarding those calls to glibc breaks libraries like
-libfakeroot (fakeroot) and libasan (the gcc address sanitizer; gcc
--fsanitize=address).
-
-Those libraries provide wrappers for functions defined in other shared
-libraries, usually glibc, do their own processing, and forward calls to
-the original symbols looke dup via dlsym(RTLD_NEXT, "symbol_name").  In
-our case, dlsym returns the libattr_*xattr wrappers.  However, when our
-wrappers try calling glibc, they end up calling the libfakeroot /
-libasan wrappers instead because those override the original symbols =>
-recursion.
-
-The libattr_*xattr wrappers will only be used when symbols are looked up
-at runtime (dlopen / dlsym).  Programs linking against libattr will
-directly use the glibc provided symbols.  Therefore, the slightly worse
-performance of syscall() won't affect any of the "normal" users of
-libattr.
-
-[nicolas.cavallari: with uclibc-ng, the recursion always happen]
-Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
----
- libattr/syscalls.c | 26 ++++++++++++++------------
- 1 file changed, 14 insertions(+), 12 deletions(-)
-
-diff --git a/libattr/syscalls.c b/libattr/syscalls.c
-index 3013aa0..721ad7f 100644
---- a/libattr/syscalls.c
-+++ b/libattr/syscalls.c
-@@ -22,6 +22,8 @@
- 
- #include "config.h"
- 
-+#include <unistd.h>
-+#include <sys/syscall.h>
- #include <sys/xattr.h>
- 
- #ifdef HAVE_VISIBILITY_ATTRIBUTE
-@@ -31,67 +33,67 @@
- int libattr_setxattr(const char *path, const char *name,
- 		     void *value, size_t size, int flags)
- {
--	return setxattr(path, name, value, size, flags);
-+	return syscall(__NR_setxattr, path, name, value, size, flags);
- }
- 
- int libattr_lsetxattr(const char *path, const char *name,
- 		      void *value, size_t size, int flags)
- {
--	return lsetxattr(path, name, value, size, flags);
-+	return syscall(__NR_lsetxattr, path, name, value, size, flags);
- }
- 
- int libattr_fsetxattr(int filedes, const char *name,
- 		      void *value, size_t size, int flags)
- {
--	return fsetxattr(filedes, name, value, size, flags);
-+	return syscall(__NR_fsetxattr, filedes, name, value, size, flags);
- }
- 
- ssize_t libattr_getxattr(const char *path, const char *name,
- 			 void *value, size_t size)
- {
--	return getxattr(path, name, value, size);
-+	return syscall(__NR_getxattr, path, name, value, size);
- }
- 
- ssize_t libattr_lgetxattr(const char *path, const char *name,
- 			  void *value, size_t size)
- {
--	return lgetxattr(path, name, value, size);
-+	return syscall(__NR_lgetxattr, path, name, value, size);
- }
- 
- ssize_t libattr_fgetxattr(int filedes, const char *name,
- 			  void *value, size_t size)
- {
--	return fgetxattr(filedes, name, value, size);
-+	return syscall(__NR_fgetxattr, filedes, name, value, size);
- }
- 
- ssize_t libattr_listxattr(const char *path, char *list, size_t size)
- {
--	return listxattr(path, list, size);
-+	return syscall(__NR_listxattr, path, list, size);
- }
- 
- ssize_t libattr_llistxattr(const char *path, char *list, size_t size)
- {
--	return llistxattr(path, list, size);
-+	return syscall(__NR_llistxattr, path, list, size);
- }
- 
- ssize_t libattr_flistxattr(int filedes, char *list, size_t size)
- {
--	return flistxattr(filedes, list, size);
-+	return syscall(__NR_flistxattr, filedes, list, size);
- }
- 
- int libattr_removexattr(const char *path, const char *name)
- {
--	return removexattr(path, name);
-+	return syscall(__NR_removexattr, path, name);
- }
- 
- int libattr_lremovexattr(const char *path, const char *name)
- {
--	return lremovexattr(path, name);
-+	return syscall(__NR_lremovexattr, path, name);
- }
- 
- int libattr_fremovexattr(int filedes, const char *name)
- {
--	return fremovexattr(filedes, name);
-+	return syscall(__NR_fremovexattr, filedes, name);
- }
- 
- #ifdef HAVE_VISIBILITY_ATTRIBUTE
--- 
-cgit v1.0-41-gc330
-
diff --git a/package/attr/attr.hash b/package/attr/attr.hash
index ba9f45669f..334a438cae 100644
--- a/package/attr/attr.hash
+++ b/package/attr/attr.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  5ead72b358ec709ed00bbf7a9eaef1654baad937c001c044fe8b74c57f5324e7  attr-2.4.48.tar.gz
+sha256  db448a626f9313a1a970d636767316a8da32aede70518b8050fa0de7947adc32  attr-2.5.1.tar.xz
 
 # Locally calculated
 sha256  98f318493be6b08bff3cd295791cde06c54e17882a3c74a1ed245eaa02533d52  doc/COPYING
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index b6b46453c7..0327497e1e 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-ATTR_VERSION = 2.4.48
+ATTR_VERSION = 2.5.1
+ATTR_SOURCE = attr-$(ATTR_VERSION).tar.xz
 ATTR_SITE = http://download.savannah.gnu.org/releases/attr
 ATTR_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 ATTR_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
