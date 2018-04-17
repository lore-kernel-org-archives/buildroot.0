From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 17 Apr 2018 18:56:56 +0300
Subject: [Buildroot] [PATCH] openblas: fix build with musl libc
Message-ID: <dbeb63928c8d303e263ff75475d99a82b6bfa2e4.1523980616.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patches to avoid use of __GLIBC_PREREQ when this macro is
not defined.

Fixes:
http://autobuild.buildroot.net/results/f13/f13d93372449c9bf1b3c79ed056b8d820470ae89/
http://autobuild.buildroot.net/results/e1c/e1cdcdfe15b4af523c7db71952ac25163733ffb1/
http://autobuild.buildroot.net/results/778/77821a4a37171080fc7ee917862e77babeb06b88/

Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...REREQ-checks-to-avoid-breaking-non-g.patch | 73 +++++++++++++++++++
 ...d-when-__GLIBC_PREREQ-is-not-defined.patch | 45 ++++++++++++
 2 files changed, 118 insertions(+)
 create mode 100644 package/openblas/0002-Rework-__GLIBC_PREREQ-checks-to-avoid-breaking-non-g.patch
 create mode 100644 package/openblas/0003-Fix-build-when-__GLIBC_PREREQ-is-not-defined.patch

diff --git a/package/openblas/0002-Rework-__GLIBC_PREREQ-checks-to-avoid-breaking-non-g.patch b/package/openblas/0002-Rework-__GLIBC_PREREQ-checks-to-avoid-breaking-non-g.patch
new file mode 100644
index 000000000000..7659ee08884c
--- /dev/null
+++ b/package/openblas/0002-Rework-__GLIBC_PREREQ-checks-to-avoid-breaking-non-g.patch
@@ -0,0 +1,73 @@
+From ad0f270ed32635d8ef9a7446ae280db415cf78ac Mon Sep 17 00:00:00 2001
+From: Martin Kroeker <martin@ruby.chemie.uni-freiburg.de>
+Date: Mon, 31 Jul 2017 21:02:43 +0200
+Subject: [PATCH] Rework __GLIBC_PREREQ checks to avoid breaking non-glibc
+ builds
+
+[baruch: backported to v0.2.20
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 63cfa32691680
+
+ driver/others/memory.c | 22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/driver/others/memory.c b/driver/others/memory.c
+index 38d063715602..79d6988e08a4 100644
+--- a/driver/others/memory.c
++++ b/driver/others/memory.c
+@@ -155,7 +155,6 @@ USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ #ifdef DYNAMIC_ARCH
+ gotoblas_t *gotoblas = NULL;
+ #endif
+-
+ extern void openblas_warning(int verbose, const char * msg);
+ 
+ #ifndef SMP
+@@ -187,25 +186,24 @@ int i,n;
+      
+ #if !defined(__GLIBC_PREREQ)
+    return nums;
+-#endif   
+-#if !__GLIBC_PREREQ(2, 3)
++#else
++ #if !__GLIBC_PREREQ(2, 3)
+    return nums;
+-#endif   
++ #endif
+ 
+-#if !__GLIBC_PREREQ(2, 7)
++ #if !__GLIBC_PREREQ(2, 7)
+   ret = sched_getaffinity(0,sizeof(cpu_set_t), cpusetp);
+   if (ret!=0) return nums;
+   n=0;
+-#if !__GLIBC_PREREQ(2, 6)  
++  #if !__GLIBC_PREREQ(2, 6)
+   for (i=0;i<nums;i++)
+      if (CPU_ISSET(i,cpusetp)) n++;
+-  nums=n;   
+-#else
++  nums=n;
++  #else
+   nums = CPU_COUNT(sizeof(cpu_set_t),cpusetp);
+-#endif
++  #endif
+   return nums;
+-#endif
+-
++ #else
+   cpusetp = CPU_ALLOC(nums);
+   if (cpusetp == NULL) return nums;
+   size = CPU_ALLOC_SIZE(nums);
+@@ -214,6 +212,8 @@ int i,n;
+   nums = CPU_COUNT_S(size,cpusetp);
+   CPU_FREE(cpusetp);
+   return nums;
++ #endif
++#endif
+ }
+ #endif
+ #endif
+-- 
+2.17.0
+
diff --git a/package/openblas/0003-Fix-build-when-__GLIBC_PREREQ-is-not-defined.patch b/package/openblas/0003-Fix-build-when-__GLIBC_PREREQ-is-not-defined.patch
new file mode 100644
index 000000000000..be4833f4a870
--- /dev/null
+++ b/package/openblas/0003-Fix-build-when-__GLIBC_PREREQ-is-not-defined.patch
@@ -0,0 +1,45 @@
+From 84eaad62e95b9a80df2138db3fed2a186ef00b62 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 17 Apr 2018 18:46:29 +0300
+Subject: [PATCH] Fix build when __GLIBC_PREREQ is not defined
+
+Rearrange the code so that __GLIBC_PREREQ is not used when not defined.
+This fixes build with musl libc.
+
+[baruch: backport to v0.2.20]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: combines upstream commits 480e69768176 and c4af196a2d
+---
+ driver/others/init.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/driver/others/init.c b/driver/others/init.c
+index 4c75d72e4075..adce075f0ac0 100644
+--- a/driver/others/init.c
++++ b/driver/others/init.c
+@@ -838,7 +838,11 @@ void gotoblas_affinity_init(void) {
+ 
+     nums = sysconf(_SC_NPROCESSORS_CONF);
+      
+-#if !defined(__GLIBC_PREREQ) || !__GLIBC_PREREQ(2, 3)
++#if !defined(__GLIBC_PREREQ)
++    common->num_procs = nums;
++#else
++
++#if !__GLIBC_PREREQ(2, 3)
+     common->num_procs = nums;
+ #elif __GLIBC_PREREQ(2, 7)
+     cpusetp = CPU_ALLOC(nums);
+@@ -872,6 +876,8 @@ void gotoblas_affinity_init(void) {
+ 
+ #endif 
+ 
++#endif
++
+     if(common -> num_procs > MAX_CPUS) {
+       fprintf(stderr, "\nOpenBLAS Warning : The number of CPU/Cores(%d) is beyond the limit(%d). Terminated.\n", common->num_procs, MAX_CPUS);
+       exit(1);
+-- 
+2.17.0
+
-- 
2.17.0
