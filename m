From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Sep 2017 14:29:54 +0200
Subject: [Buildroot] [PATCH 1/5] package/ngircd: bump version to 24
Message-ID: <20170913122958.11805-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switched _SITE to https, added patch to fix compile error.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ngircd/0001-Fix-Get_error-usage.patch | 44 +++++++++++++++++++++++++++
 package/ngircd/ngircd.hash                    |  2 +-
 package/ngircd/ngircd.mk                      |  4 +--
 3 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 package/ngircd/0001-Fix-Get_error-usage.patch

diff --git a/package/ngircd/0001-Fix-Get_error-usage.patch b/package/ngircd/0001-Fix-Get_error-usage.patch
new file mode 100644
index 0000000000..3724e46d89
--- /dev/null
+++ b/package/ngircd/0001-Fix-Get_error-usage.patch
@@ -0,0 +1,44 @@
+From 543f44bff8d56785dc13a74a14d4eaa96465bf05 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Wed, 13 Sep 2017 14:07:11 +0200
+Subject: [PATCH] Fix Get_error usage
+
+The usage of Get_Error is guarded by "ifdef h_errno" in this file, the
+definition of this function should follow the same rules.
+
+Fixes a build error when cross-compiling:
+https://github.com/ngircd/ngircd/issues/223
+
+Patch sent upstream: https://github.com/ngircd/ngircd/pull/240
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/ngircd/resolve.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/src/ngircd/resolve.c b/src/ngircd/resolve.c
+index 32791901..e1903254 100644
+--- a/src/ngircd/resolve.c
++++ b/src/ngircd/resolve.c
+@@ -108,9 +108,7 @@ Resolve_Name( PROC_STAT *s, const char *Host, void (*cbfunc)(int, short))
+ 	return false;
+ } /* Resolve_Name */
+ 
+-
+-#if !defined(HAVE_GETADDRINFO) || !defined(HAVE_GETNAMEINFO)
+-#if !defined(WANT_IPV6) && defined(h_errno)
++#ifdef h_errno
+ static char *
+ Get_Error( int H_Error )
+ {
+@@ -128,7 +126,6 @@ Get_Error( int H_Error )
+ 	return "unknown error";
+ }
+ #endif
+-#endif
+ 
+ 
+ /* Do "IDENT" (aka "AUTH") lookup and append result to resolved_addr array */
+-- 
+2.11.0
+
diff --git a/package/ngircd/ngircd.hash b/package/ngircd/ngircd.hash
index 45e2d9e825..128867bfd8 100644
--- a/package/ngircd/ngircd.hash
+++ b/package/ngircd/ngircd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	93f953b2785ff0e6e29b8b3794ba5a64754b86251ce71bf39fc27f4f5074eada	ngircd-20.3.tar.xz
+sha256 173fa0ea10788a8ba08ef2f7e64ea8951d7c88862e744128c8b87bae424b1008  ngircd-24.tar.xz
diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index f7857e85dd..5f03b66001 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-NGIRCD_VERSION = 20.3
+NGIRCD_VERSION = 24
 NGIRCD_SOURCE = ngircd-$(NGIRCD_VERSION).tar.xz
-NGIRCD_SITE = http://arthur.barton.de/pub/ngircd
+NGIRCD_SITE = https://arthur.barton.de/pub/ngircd
 NGIRCD_DEPENDENCIES = zlib
 NGIRCD_LICENSE = GPL-2.0+
 NGIRCD_LICENSE_FILES = COPYING
-- 
2.11.0
