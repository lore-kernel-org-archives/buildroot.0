From: unixmania at gmail.com <unixmania@gmail.com>
Date: Fri, 18 Oct 2019 23:09:28 -0300
Subject: [Buildroot] [PATCH] package/qemu: fix crash with uClibc-ng
Message-ID: <20191019020928.2931-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

On uClibc-ng sysconf(_SC_LEVEL1_{I,D}CACHE_LINESIZE) returns -1, which
is a valid result, meaning that the limit is indeterminate. Add a patch
that handles this situation using fallback values instead of crashing
due to an assertion failure.

Upstream status:
   https://lists.nongnu.org/archive/html/qemu-devel/2019-10/msg04115.html

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 ...fix-crash-when-compiling-with-uClibc.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/qemu/3.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch

diff --git a/package/qemu/3.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch b/package/qemu/3.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
new file mode 100644
index 0000000000..d1b9e35709
--- /dev/null
+++ b/package/qemu/3.1.1/0003-util-cacheinfo-fix-crash-when-compiling-with-uClibc.patch
@@ -0,0 +1,43 @@
+From d82b8540ecaf3cb09a033e4971d8645d3343211e Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@redhat.com>
+Date: Wed, 16 Oct 2019 22:27:30 -0300
+Subject: [PATCH] util/cacheinfo: fix crash when compiling with uClibc
+
+uClibc defines _SC_LEVEL1_ICACHE_LINESIZE and _SC_LEVEL1_DCACHE_LINESIZE
+but the corresponding sysconf calls returns -1, which is a valid result,
+meaning that the limit is indeterminate.
+
+Handle this situation using the fallback values instead of crashing due
+to an assertion failure.
+
+Signed-off-by: Carlos Santos <casantos@redhat.com>
+---
+ util/cacheinfo.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/util/cacheinfo.c b/util/cacheinfo.c
+index ea6f3e99bf..d94dc6adc8 100644
+--- a/util/cacheinfo.c
++++ b/util/cacheinfo.c
+@@ -93,10 +93,16 @@ static void sys_cache_info(int *isize, int *dsize)
+ static void sys_cache_info(int *isize, int *dsize)
+ {
+ # ifdef _SC_LEVEL1_ICACHE_LINESIZE
+-    *isize = sysconf(_SC_LEVEL1_ICACHE_LINESIZE);
++    int tmp_isize = (int) sysconf(_SC_LEVEL1_ICACHE_LINESIZE);
++    if (tmp_isize > 0) {
++        *isize = tmp_isize;
++    }
+ # endif
+ # ifdef _SC_LEVEL1_DCACHE_LINESIZE
+-    *dsize = sysconf(_SC_LEVEL1_DCACHE_LINESIZE);
++    int tmp_dsize = (int) sysconf(_SC_LEVEL1_DCACHE_LINESIZE);
++    if (tmp_dsize > 0) {
++        *dsize = tmp_dsize;
++    }
+ # endif
+ }
+ #endif /* sys_cache_info */
+-- 
+2.18.1
+
-- 
2.18.1
