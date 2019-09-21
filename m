From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 13:24:45 +0200
Subject: [Buildroot] [git commit] package/gnutls: use __get_cpuid_count()
 only when available
Message-ID: <20190921113837.CF31C8EBCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53622826da5a303e6f99cc91b8a43a550eff7b86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/4e874ed2fcc1f969f2f8ece88985ccd625f2c55b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...use-__get_cpuid_count-only-when-available.patch | 82 ++++++++++++++++++++++
 package/gnutls/gnutls.mk                           |  2 +
 2 files changed, 84 insertions(+)

diff --git a/package/gnutls/0001-read_cpuid_vals-use-__get_cpuid_count-only-when-available.patch b/package/gnutls/0001-read_cpuid_vals-use-__get_cpuid_count-only-when-available.patch
new file mode 100644
index 0000000000..5a4e524eb4
--- /dev/null
+++ b/package/gnutls/0001-read_cpuid_vals-use-__get_cpuid_count-only-when-available.patch
@@ -0,0 +1,82 @@
+From ef80617d1e17e0878a909baad62a75ba265c0e00 Mon Sep 17 00:00:00 2001
+From: Nikos Mavrogiannopoulos <nmav@gnutls.org>
+Date: Fri, 2 Aug 2019 21:57:40 +0200
+Subject: [PATCH] read_cpuid_vals: use __get_cpuid_count() only when available
+
+This makes the functionality available on gcc 4.8.
+
+Resolves: #812
+
+Signed-off-by: Nikos Mavrogiannopoulos <nmav@gnutls.org>
+[Retrieved from:
+https://github.com/gnutls/gnutls/commit/ef80617d1e17e0878a909baad62a75ba265c0e00]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac                     | 11 +++++++++++
+ lib/accelerated/x86/x86-common.c | 24 ++++++++++++++++++++----
+ 2 files changed, 31 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6a1d3dbc5c..1bf9bce95e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -182,6 +182,17 @@ case $host_cpu in
+   ;;
+ esac
+ 
++# check for gcc's __get_cpuid_count functionality
++AC_MSG_CHECKING([for __get_cpuid_count])
++AC_LINK_IFELSE(
++   [AC_LANG_SOURCE([
++    #include <cpuid.h>
++    int main(void) { unsigned t1; return __get_cpuid_count(7, 0, &t1, &t1, &t1, &t1); }
++   ])],
++   [AC_DEFINE([HAVE_GET_CPUID_COUNT], [1], [use __get_cpuid_count]) AC_MSG_RESULT([yes])],
++   [AC_MSG_RESULT([no])]
++)
++
+ fi
+ 
+ AC_ARG_ENABLE(tls13-interop,
+diff --git a/lib/accelerated/x86/x86-common.c b/lib/accelerated/x86/x86-common.c
+index fb3ff90919..516d6776c5 100644
+--- a/lib/accelerated/x86/x86-common.c
++++ b/lib/accelerated/x86/x86-common.c
+@@ -106,17 +106,33 @@ unsigned int _gnutls_x86_cpuid_s[4];
+ #define VIA_PADLOCK_PHE (1<<21)
+ #define VIA_PADLOCK_PHE_SHA512 (1<<22)
+ 
++#ifndef HAVE_GET_CPUID_COUNT
++static inline void
++get_cpuid_level7(unsigned int *eax, unsigned int *ebx,
++		 unsigned int *ecx, unsigned int *edx)
++{
++	/* we avoid using __get_cpuid_count, because it is not available with gcc 4.8 */
++	if (__get_cpuid_max(7, 0) < 7)
++		return;
++
++	__cpuid_count(7, 0, *eax, *ebx, *ecx, *edx);
++	return;
++}
++#else
++# define get_cpuid_level7(a,b,c,d) __get_cpuid_count(7, 0, a, b, c, d)
++#endif
++
+ static unsigned read_cpuid_vals(unsigned int vals[4])
+ {
+ 	unsigned t1, t2, t3;
+-	if (!__get_cpuid(1, &t1, &vals[0],
+-			 &vals[1], &t2))
++	vals[0] = vals[1] = vals[2] = vals[3] = 0;
++
++	if (!__get_cpuid(1, &t1, &vals[0], &vals[1], &t2))
+ 		return 0;
+ 	/* suppress AVX512; it works conditionally on certain CPUs on the original code */
+ 	vals[1] &= 0xfffff7ff;
+ 
+-	if (!__get_cpuid_count(7, 0, &t1, &vals[2], &t2, &t3))
+-		return 0;
++	get_cpuid_level7(&t1, &vals[2], &t2, &t3);
+ 
+ 	return 1;
+ }
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 94935a3f9e..375c536320 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -10,6 +10,8 @@ GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
 GNUTLS_LICENSE_FILES = doc/COPYING.LESSER
+# We're patching configure.ac
+GNUTLS_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_GNUTLS_OPENSSL),y)
 GNUTLS_LICENSE := $(GNUTLS_LICENSE), GPL-3.0+ (gnutls-openssl library)
