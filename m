From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 22:51:47 +0200
Subject: [Buildroot] [git commit] package/libbsd: enable for non-glibc
 toolchains
Message-ID: <20180331205202.1C4C081576@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d879be3049598f35d7b959784e1a6c2811ba2036
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libbsd builds now almost fine with a musl or uClibc toolchain, except
for one issue introduced in the latest version bump. Upstream commit
22fbd62368c39de8ac5e249d1502d5ac0ffdef30 [1] uses the glibc-only macro
`__GLIBC_PREREQ`. The issue is fixed by the attached patch from upstream,
which fixes the use of `__GLIBC_PREREQ` on non-glibc toolchains.

Backported from:
https://cgit.freedesktop.org/libbsd/patch/?id=1f8a3f7bccfc84b195218ad0086ebd57049c3490

netcat-openbsd is the only package selecting libbsd. However, building
it still needs a glibc toolchain, as it uses `b64_ntop` which is not
available in musl or uClibc.

Build has been successfully tested with:
 * armv7-eabihf--glibc--bleeding-edge-2017.11-1
 * armv7-eabihf--musl--bleeding-edge-2018.02-1
 * armv7-eabihf--uclibc--bleeding-edge-2018.02-1

[1] https://cgit.freedesktop.org/libbsd/commit/?id=22fbd62368c39de8ac5e249d1502d5ac0ffdef30

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...n-declaration-protection-for-glibc-alread.patch | 80 ++++++++++++++++++++++
 package/libbsd/Config.in                           |  5 +-
 2 files changed, 82 insertions(+), 3 deletions(-)

diff --git a/package/libbsd/0001-Fix-function-declaration-protection-for-glibc-alread.patch b/package/libbsd/0001-Fix-function-declaration-protection-for-glibc-alread.patch
new file mode 100644
index 0000000000..fdf45bdef6
--- /dev/null
+++ b/package/libbsd/0001-Fix-function-declaration-protection-for-glibc-alread.patch
@@ -0,0 +1,80 @@
+From 1f8a3f7bccfc84b195218ad0086ebd57049c3490 Mon Sep 17 00:00:00 2001
+From: Guillem Jover <guillem@hadrons.org>
+Date: Tue, 6 Mar 2018 01:39:45 +0100
+Subject: [PATCH] Fix function declaration protection for glibc already
+ providing them
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+On non-glibc based systems we cannot unconditionally use the
+__GLIBC_PREREQ macro as it gets expanded before evaluation. Instead,
+if it is undefined, define it to 0.
+
+We should also always declare these functions on non-glibc based
+systems. And on systems with a new enough glibc, which provides these
+functions, we should still provide the declarations if _GNU_SOURCE
+is *not* defined.
+
+Backported from:
+https://cgit.freedesktop.org/libbsd/patch/?id=1f8a3f7bccfc84b195218ad0086ebd57049c3490
+
+Reported-by: J??rg Krause <joerg.krause@embedded.rocks>
+Signed-off-by: Guillem Jover <guillem@hadrons.org>
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ include/bsd/stdlib.h    | 3 ++-
+ include/bsd/string.h    | 3 ++-
+ include/bsd/sys/cdefs.h | 8 ++++++++
+ 3 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/include/bsd/stdlib.h b/include/bsd/stdlib.h
+index 8d33d1f..a5b063c 100644
+--- a/include/bsd/stdlib.h
++++ b/include/bsd/stdlib.h
+@@ -71,7 +71,8 @@ int sradixsort(const unsigned char **base, int nmemb,
+                const unsigned char *table, unsigned endbyte);
+ 
+ void *reallocf(void *ptr, size_t size);
+-#if defined(_GNU_SOURCE) && defined(__GLIBC__) && !__GLIBC_PREREQ(2, 26)
++#if !defined(__GLIBC__) || \
++    (defined(__GLIBC__) && (!__GLIBC_PREREQ(2, 26) || !defined(_GNU_SOURCE)))
+ void *reallocarray(void *ptr, size_t nmemb, size_t size);
+ #endif
+ 
+diff --git a/include/bsd/string.h b/include/bsd/string.h
+index 29097f6..f987fee 100644
+--- a/include/bsd/string.h
++++ b/include/bsd/string.h
+@@ -46,7 +46,8 @@ size_t strlcat(char *dst, const char *src, size_t siz);
+ char *strnstr(const char *str, const char *find, size_t str_len);
+ void strmode(mode_t mode, char *str);
+ 
+-#if defined(_GNU_SOURCE) && defined(__GLIBC__) && !__GLIBC_PREREQ(2, 25)
++#if !defined(__GLIBC__) || \
++    (defined(__GLIBC__) && (!__GLIBC_PREREQ(2, 25) || !defined(_GNU_SOURCE)))
+ void explicit_bzero(void *buf, size_t len);
+ #endif
+ __END_DECLS
+diff --git a/include/bsd/sys/cdefs.h b/include/bsd/sys/cdefs.h
+index b4c8f30..d1cc419 100644
+--- a/include/bsd/sys/cdefs.h
++++ b/include/bsd/sys/cdefs.h
+@@ -58,6 +58,14 @@
+ #endif
+ #endif
+ 
++/*
++ * On non-glibc based systems, we cannot unconditionally use the
++ * __GLIBC_PREREQ macro as it gets expanded before evaluation.
++ */
++#ifndef __GLIBC_PREREQ
++#define __GLIBC_PREREQ(maj, min) 0
++#endif
++
+ /*
+  * Some kFreeBSD headers expect those macros to be set for sanity checks.
+  */
+-- 
+2.16.2
+
diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index 11e4c4d974..f6c2e4be4b 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -9,7 +9,6 @@ config BR2_PACKAGE_LIBBSD
 	bool "libbsd"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  This library provides useful functions commonly found on BSD
 	  systems, and lacking on others like GNU systems, thus making
@@ -19,6 +18,6 @@ config BR2_PACKAGE_LIBBSD
 
 	  http://libbsd.freedesktop.org/
 
-comment "libbsd needs a glibc toolchain w/ threads"
+comment "libbsd needs a toolchain w/ threads"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
