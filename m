From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 00:02:28 +0200
Subject: [Buildroot] [git commit] gamin: fix build with musl
Message-ID: <20160329220230.62F448181E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39be6f6bdad6b77a7540f6c9f299e02726b4a469
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch | 20 ++++++++++++++++++++
 package/gamin/Config.in                              |  2 +-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch b/package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch
new file mode 100644
index 0000000..4291277
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
index c191be0..55e037a 100644
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
