From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Mar 2015 10:13:51 +0100
Subject: [Buildroot] [git commit] attr: backport upstream patches to fix
	build on musl
Message-ID: <20150321091501.8878480794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e16796942a6f68391e69961e5045ce20b56063e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream has already merged a number of patches that fix the build of
attr with the musl C library. This commit backports those two patches
in Buildroot, until upstream makes a new attr release.

Fixes:

  http://autobuild.buildroot.net/results/778/7785d07614ff1d76db79c86b790f13e8ab800cba/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-avoid-glibc-specific-decls-defines.patch  |   37 ++++++++++++++++++++
 package/attr/0003-portability-fixes.patch          |   37 ++++++++++++++++++++
 2 files changed, 74 insertions(+), 0 deletions(-)

diff --git a/package/attr/0002-avoid-glibc-specific-decls-defines.patch b/package/attr/0002-avoid-glibc-specific-decls-defines.patch
new file mode 100644
index 0000000..8c71678
--- /dev/null
+++ b/package/attr/0002-avoid-glibc-specific-decls-defines.patch
@@ -0,0 +1,37 @@
+From 667137acaffb8d0cc62b47821a67a52ba0637d5c Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Fri, 10 Jan 2014 13:56:37 +0000
+Subject: avoid glibc-specific DECLS defines
+
+This matches what we do in all the other headers.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+diff --git a/include/xattr.h b/include/xattr.h
+index 70a84be..070d7c5 100644
+--- a/include/xattr.h
++++ b/include/xattr.h
+@@ -30,8 +30,9 @@
+ #define XATTR_CREATE  0x1       /* set value, fail if attr already exists */
+ #define XATTR_REPLACE 0x2       /* set value, fail if attr does not exist */
+ 
+-
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ extern int setxattr (const char *__path, const char *__name,
+ 		      const void *__value, size_t __size, int __flags) __THROW;
+@@ -58,6 +59,8 @@ extern int removexattr (const char *__path, const char *__name) __THROW;
+ extern int lremovexattr (const char *__path, const char *__name) __THROW;
+ extern int fremovexattr (int __filedes,   const char *__name) __THROW;
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif	/* __XATTR_H__ */
+--
+cgit v0.9.0.2
diff --git a/package/attr/0003-portability-fixes.patch b/package/attr/0003-portability-fixes.patch
new file mode 100644
index 0000000..c5dc8c8
--- /dev/null
+++ b/package/attr/0003-portability-fixes.patch
@@ -0,0 +1,37 @@
+From 92247401984dd9a80d9d0c8c030692323f980678 Mon Sep 17 00:00:00 2001
+From: Emmanuel Dreyfus <manu@netbsd.org>
+Date: Mon, 30 Jun 2014 13:06:05 +0000
+Subject: Portability fixes
+
+- <features.h>  is Linux specific
+- Define __THROW for non glibc based systems
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+(limited to 'include/xattr.h')
+
+diff --git a/include/xattr.h b/include/xattr.h
+index 070d7c5..fd1f268 100644
+--- a/include/xattr.h
++++ b/include/xattr.h
+@@ -20,7 +20,18 @@
+ #ifndef __XATTR_H__
+ #define __XATTR_H__
+ 
++#if defined(linux)
+ #include <features.h>
++#endif
++
++/* Portability non glibc c++ build systems */
++#ifndef __THROW
++# if defined __cplusplus
++#  define __THROW       throw ()
++# else
++#  define __THROW
++# endif
++#endif
+ 
+ #include <errno.h>
+ #ifndef ENOATTR
+--
+cgit v0.9.0.2
