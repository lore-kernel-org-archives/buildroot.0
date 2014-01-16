From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jan 2014 23:29:00 +0100
Subject: [Buildroot] [git commit] sysprof: bump version
Message-ID: <20140116223751.C1CC79C519@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=29b6093f7177a7394bec71e9af972a495cc063b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And drop patches now upstream.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...tch => sysprof-01-define-NT_GNU_BUILD_ID.patch} |    0
 .../sysprof-01-fix-kernel-version-warning.patch    |   26 --------------------
 .../sysprof/sysprof-03-fix-powerpc-checks.patch    |   26 --------------------
 package/sysprof/sysprof.mk                         |    3 +-
 4 files changed, 1 insertions(+), 54 deletions(-)

diff --git a/package/sysprof/sysprof-02-define-NT_GNU_BUILD_ID.patch b/package/sysprof/sysprof-01-define-NT_GNU_BUILD_ID.patch
similarity index 100%
rename from package/sysprof/sysprof-02-define-NT_GNU_BUILD_ID.patch
rename to package/sysprof/sysprof-01-define-NT_GNU_BUILD_ID.patch
diff --git a/package/sysprof/sysprof-01-fix-kernel-version-warning.patch b/package/sysprof/sysprof-01-fix-kernel-version-warning.patch
deleted file mode 100644
index 7b45b30..0000000
--- a/package/sysprof/sysprof-01-fix-kernel-version-warning.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 6a5dfd385ca86b9e40b1a73237408f76b671b490 Mon Sep 17 00:00:00 2001
-From: Pauli Nieminen <suokkos@gmail.com>
-Date: Mon, 09 Apr 2012 18:12:59 +0000
-Subject: Don't complain about old kernel for 3.0+ kernels
-
-Linux kernel version received bump to 3.0 that causes configure to
-complain about older kernel. To avoid the warning configure needs to
-check major and minor versions before micro.
-
-Signed-off-by: Pauli Nieminen <suokkos@gmail.com>
----
-diff --git a/configure.ac b/configure.ac
-index 34fdc43..e4f6d5d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -83,7 +83,7 @@ Makefile
- 
- AC_OUTPUT
- 
--if [[ $KMICRO -lt 31 ]] ; then
-+if [[ $KMAJOR -eq 2 -a $KMINOR -eq 6 -a $KMICRO -lt 31 ]] ; then
-    echo
-    echo "%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%"
-    echo "@"  
---
-cgit v0.9.0.2
diff --git a/package/sysprof/sysprof-03-fix-powerpc-checks.patch b/package/sysprof/sysprof-03-fix-powerpc-checks.patch
deleted file mode 100644
index 8d69f74..0000000
--- a/package/sysprof/sysprof-03-fix-powerpc-checks.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 4708a509aa9d65ae93e9824e42ddbc6e8d42d90c Mon Sep 17 00:00:00 2001
-From: Michel D??nzer <michel@daenzer.net>
-Date: Sat, 27 Aug 2011 18:04:44 +0000
-Subject: Fix PowerPC checks for __NR_perf_counter_open.
-
-__ppc__ isn't defined here on Debian powerpc. Grepping through the headers
-installed in /usr/include, there are a few references to __ppc__ and
-__ppc64__, but I suspect they're for other OSs.
-
-Signed-off-by: Michel D??nzer <michel@daenzer.net>
----
-diff --git a/collector.c b/collector.c
-index b28964f..fe16967 100644
---- a/collector.c
-+++ b/collector.c
-@@ -175,7 +175,7 @@ sysprof_perf_counter_open (struct perf_counter_attr *attr,
- #define __NR_perf_counter_open 337
- #elif defined(__hppa__)
- #define __NR_perf_counter_open 318
--#elif defined(__ppc__) || defined(__ppc64__)
-+#elif defined(__powerpc__) || defined(__powerpc64__)
- #define __NR_perf_counter_open 319
- #elif defined(__s390__)
- #define __NR_perf_counter_open 331
---
-cgit v0.9.0.2
diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
index f288aaf..4f6ed54 100644
--- a/package/sysprof/sysprof.mk
+++ b/package/sysprof/sysprof.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-SYSPROF_VERSION = 1.1.8
+SYSPROF_VERSION = 1.2.0
 SYSPROF_SITE = http://sysprof.com
 SYSPROF_DEPENDENCIES = libglib2
-SYSPROF_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_SYSPROF_GUI),y)
 SYSPROF_DEPENDENCIES += libgtk2 libglade gdk-pixbuf
