From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  1 Mar 2016 15:03:11 +0200
Subject: [Buildroot] [PATCH] gamin: fix build with musl
Message-ID: <d03fac44ed52ad7fe05fdd1bb6040a260cfc14b7.1456837391.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

musl does not provide the non portable PTHREAD_MUTEX_RECURSIVE_NP. Add a patch
removing the assumption the PTHREAD_MUTEX_RECURSIVE_NP is available when
'linux' is defined.

Upstream had no new release since 2008, so there is no much hope of getting
this fix applied upstream.

Also, fix the pthread dependency comment. gamin code uses pthread directly.

Fixes:
http://autobuild.buildroot.net/results/3a9/3a9328f384fc648ae61316402a84eaffb175881b/
http://autobuild.buildroot.net/results/69d/69d2a93bc97ab0d70c3acb2f9c9f28612ea95871/
http://autobuild.buildroot.net/results/092/092ac7380beb8ce403a1a6fd8e4176e9234413a3/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch | 20 ++++++++++++++++++++
 package/gamin/Config.in                              |  2 +-
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch

diff --git a/package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch b/package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch
new file mode 100644
index 000000000000..429127736c00
--- /dev/null
+++ b/package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch
@@ -0,0 +1,20 @@
+Fix missing PTHREAD_MUTEX_RECURSIVE_NP
+
+The musl C library does not provide the non portable
+PTHREAD_MUTEX_RECURSIVE_NP. Test for PTHREAD_MUTEX_RECURSIVE_NP only.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+
+diff -Nuar gamin-0.1.10-orig/libgamin/gam_data.c gamin-0.1.10/libgamin/gam_data.c
+--- gamin-0.1.10-orig/libgamin/gam_data.c	2007-07-04 16:36:48.000000000 +0300
++++ gamin-0.1.10/libgamin/gam_data.c	2016-03-01 14:50:18.931696959 +0200
+@@ -470,7 +470,7 @@
+     }
+     if (is_threaded > 0) {
+ 	pthread_mutexattr_init(&attr);
+-#if defined(linux) || defined(PTHREAD_MUTEX_RECURSIVE_NP)
++#if defined(PTHREAD_MUTEX_RECURSIVE_NP)
+ 	pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE_NP);
+ #else
+ 	pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
diff --git a/package/gamin/Config.in b/package/gamin/Config.in
index c191be06f65d..55e037a4a40d 100644
--- a/package/gamin/Config.in
+++ b/package/gamin/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_GAMIN
 	bool "gamin"
 	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
-- 
2.7.0
