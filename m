From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 May 2019 20:00:45 +0200
Subject: [Buildroot] [git commit] package/openblas: bump to version 0.3.6
Message-ID: <20190505175546.237E8881AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe1263042964207d0a9b0efdbf14d99cb213cc59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove second and third patches (already in version)
- Add an upstream patch to fix build with glibc < 2.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...rrect-argument-of-CPU_ISSET-for-glibc-2-5.patch | 36 +++++++++++
 ...IBC_PREREQ-checks-to-avoid-breaking-non-g.patch | 73 ----------------------
 ...-build-when-__GLIBC_PREREQ-is-not-defined.patch | 45 -------------
 package/openblas/openblas.hash                     |  2 +-
 package/openblas/openblas.mk                       |  2 +-
 5 files changed, 38 insertions(+), 120 deletions(-)

diff --git a/package/openblas/0002-Correct-argument-of-CPU_ISSET-for-glibc-2-5.patch b/package/openblas/0002-Correct-argument-of-CPU_ISSET-for-glibc-2-5.patch
new file mode 100644
index 0000000000..cf15c6b8ed
--- /dev/null
+++ b/package/openblas/0002-Correct-argument-of-CPU_ISSET-for-glibc-2-5.patch
@@ -0,0 +1,36 @@
+From b43c8382c885551b0f230c8493e79bf04d94e366 Mon Sep 17 00:00:00 2001
+From: Martin Kroeker <martin@ruby.chemie.uni-freiburg.de>
+Date: Wed, 1 May 2019 10:46:46 +0200
+Subject: [PATCH] Correct argument of CPU_ISSET for glibc <2.5
+
+fixes #2104
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/xianyi/OpenBLAS/commit/b43c8382c885551b0f230c8493e79bf04d94e366]
+---
+ driver/others/memory.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/driver/others/memory.c b/driver/others/memory.c
+index ac8545f35..db14cde02 100644
+--- a/driver/others/memory.c
++++ b/driver/others/memory.c
+@@ -229,7 +229,7 @@ int get_num_procs(void) {
+   n=0;
+   #if !__GLIBC_PREREQ(2, 6)
+   for (i=0;i<nums;i++)
+-     if (CPU_ISSET(i,cpuset)) n++;
++     if (CPU_ISSET(i,&cpuset)) n++;
+   nums=n;
+   #else
+   nums = CPU_COUNT(sizeof(cpuset),&cpuset);
+@@ -1772,7 +1772,7 @@ int get_num_procs(void) {
+   n=0;
+   #if !__GLIBC_PREREQ(2, 6)
+   for (i=0;i<nums;i++)
+-     if (CPU_ISSET(i,cpuset)) n++;
++     if (CPU_ISSET(i,&cpuset)) n++;
+   nums=n;
+   #else
+   nums = CPU_COUNT(sizeof(cpuset),&cpuset);
diff --git a/package/openblas/0002-Rework-__GLIBC_PREREQ-checks-to-avoid-breaking-non-g.patch b/package/openblas/0002-Rework-__GLIBC_PREREQ-checks-to-avoid-breaking-non-g.patch
deleted file mode 100644
index 7659ee0888..0000000000
--- a/package/openblas/0002-Rework-__GLIBC_PREREQ-checks-to-avoid-breaking-non-g.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From ad0f270ed32635d8ef9a7446ae280db415cf78ac Mon Sep 17 00:00:00 2001
-From: Martin Kroeker <martin@ruby.chemie.uni-freiburg.de>
-Date: Mon, 31 Jul 2017 21:02:43 +0200
-Subject: [PATCH] Rework __GLIBC_PREREQ checks to avoid breaking non-glibc
- builds
-
-[baruch: backported to v0.2.20
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 63cfa32691680
-
- driver/others/memory.c | 22 +++++++++++-----------
- 1 file changed, 11 insertions(+), 11 deletions(-)
-
-diff --git a/driver/others/memory.c b/driver/others/memory.c
-index 38d063715602..79d6988e08a4 100644
---- a/driver/others/memory.c
-+++ b/driver/others/memory.c
-@@ -155,7 +155,6 @@ USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- #ifdef DYNAMIC_ARCH
- gotoblas_t *gotoblas = NULL;
- #endif
--
- extern void openblas_warning(int verbose, const char * msg);
- 
- #ifndef SMP
-@@ -187,25 +186,24 @@ int i,n;
-      
- #if !defined(__GLIBC_PREREQ)
-    return nums;
--#endif   
--#if !__GLIBC_PREREQ(2, 3)
-+#else
-+ #if !__GLIBC_PREREQ(2, 3)
-    return nums;
--#endif   
-+ #endif
- 
--#if !__GLIBC_PREREQ(2, 7)
-+ #if !__GLIBC_PREREQ(2, 7)
-   ret = sched_getaffinity(0,sizeof(cpu_set_t), cpusetp);
-   if (ret!=0) return nums;
-   n=0;
--#if !__GLIBC_PREREQ(2, 6)  
-+  #if !__GLIBC_PREREQ(2, 6)
-   for (i=0;i<nums;i++)
-      if (CPU_ISSET(i,cpusetp)) n++;
--  nums=n;   
--#else
-+  nums=n;
-+  #else
-   nums = CPU_COUNT(sizeof(cpu_set_t),cpusetp);
--#endif
-+  #endif
-   return nums;
--#endif
--
-+ #else
-   cpusetp = CPU_ALLOC(nums);
-   if (cpusetp == NULL) return nums;
-   size = CPU_ALLOC_SIZE(nums);
-@@ -214,6 +212,8 @@ int i,n;
-   nums = CPU_COUNT_S(size,cpusetp);
-   CPU_FREE(cpusetp);
-   return nums;
-+ #endif
-+#endif
- }
- #endif
- #endif
--- 
-2.17.0
-
diff --git a/package/openblas/0003-Fix-build-when-__GLIBC_PREREQ-is-not-defined.patch b/package/openblas/0003-Fix-build-when-__GLIBC_PREREQ-is-not-defined.patch
deleted file mode 100644
index be4833f4a8..0000000000
--- a/package/openblas/0003-Fix-build-when-__GLIBC_PREREQ-is-not-defined.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 84eaad62e95b9a80df2138db3fed2a186ef00b62 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 17 Apr 2018 18:46:29 +0300
-Subject: [PATCH] Fix build when __GLIBC_PREREQ is not defined
-
-Rearrange the code so that __GLIBC_PREREQ is not used when not defined.
-This fixes build with musl libc.
-
-[baruch: backport to v0.2.20]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: combines upstream commits 480e69768176 and c4af196a2d
----
- driver/others/init.c | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/driver/others/init.c b/driver/others/init.c
-index 4c75d72e4075..adce075f0ac0 100644
---- a/driver/others/init.c
-+++ b/driver/others/init.c
-@@ -838,7 +838,11 @@ void gotoblas_affinity_init(void) {
- 
-     nums = sysconf(_SC_NPROCESSORS_CONF);
-      
--#if !defined(__GLIBC_PREREQ) || !__GLIBC_PREREQ(2, 3)
-+#if !defined(__GLIBC_PREREQ)
-+    common->num_procs = nums;
-+#else
-+
-+#if !__GLIBC_PREREQ(2, 3)
-     common->num_procs = nums;
- #elif __GLIBC_PREREQ(2, 7)
-     cpusetp = CPU_ALLOC(nums);
-@@ -872,6 +876,8 @@ void gotoblas_affinity_init(void) {
- 
- #endif 
- 
-+#endif
-+
-     if(common -> num_procs > MAX_CPUS) {
-       fprintf(stderr, "\nOpenBLAS Warning : The number of CPU/Cores(%d) is beyond the limit(%d). Terminated.\n", common->num_procs, MAX_CPUS);
-       exit(1);
--- 
-2.17.0
-
diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index e4a3989f67..da4c59a6e7 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 5ef38b15d9c652985774869efd548b8e3e972e1e99475c673b25537ed7bcf394  openblas-v0.2.20.tar.gz
+sha256 e64c8fe083832ffbc1459ab6c72f71d53afd3b36e8497c922a15a06b72e9002f  openblas-v0.3.6.tar.gz
 sha256 190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index e9a87b0262..963295ef94 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = v0.2.20
+OPENBLAS_VERSION = v0.3.6
 OPENBLAS_SITE = $(call github,xianyi,OpenBLAS,$(OPENBLAS_VERSION))
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
