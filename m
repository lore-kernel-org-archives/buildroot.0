From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 May 2020 21:54:28 +0200
Subject: [Buildroot] [git commit] package/matio: add upstream security fixes
Message-ID: <20200529194751.10BE08E65E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1af92592ec591270ef7f86a56562d119f2a46e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following CVEs:
 - CVE-2019-17533: Mat_VarReadNextInfo4 in mat4.c in MATIO 1.5.17 omits
   a certain '\0' character, leading to a heap-based buffer over-read in
   strdup_vprintf when uninitialized memory is accessed.
 - CVE-2019-20017: A stack-based buffer over-read was discovered in
   Mat_VarReadNextInfo5 in mat5.c in matio 1.5.17.
 - CVE-2019-20018: A stack-based buffer over-read was discovered in
   ReadNextCell in mat5.c in matio 1.5.17.
 - CVE-2019-20020: A stack-based buffer over-read was discovered in
   ReadNextStructField in mat5.c in matio 1.5.17.
 - CVE-2019-20052: A memory leak was discovered in Mat_VarCalloc in
   mat.c in matio 1.5.17 because SafeMulDims does not consider the
   rank==0 case.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../matio/0001-Avoid-uninitialized-memory.patch    | 27 +++++++++++++
 package/matio/0002-Fix-illegal-memory-access.patch | 47 ++++++++++++++++++++++
 package/matio/0003-Fix-illegal-memory-access.patch | 46 +++++++++++++++++++++
 package/matio/0004-Fix-memory-leak.patch           | 39 ++++++++++++++++++
 package/matio/matio.mk                             |  9 +++++
 5 files changed, 168 insertions(+)

diff --git a/package/matio/0001-Avoid-uninitialized-memory.patch b/package/matio/0001-Avoid-uninitialized-memory.patch
new file mode 100644
index 0000000000..01fc8f0f7d
--- /dev/null
+++ b/package/matio/0001-Avoid-uninitialized-memory.patch
@@ -0,0 +1,27 @@
+From 651a8e28099edb5fbb9e4e1d4d3238848f446c9a Mon Sep 17 00:00:00 2001
+From: tbeu <tbeu@users.noreply.github.com>
+Date: Fri, 30 Aug 2019 09:21:26 +0200
+Subject: [PATCH] Avoid uninitialized memory
+
+As reported by https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=16856
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/tbeu/matio/commit/651a8e28099edb5fbb9e4e1d4d3238848f446c9a]
+---
+ src/mat4.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/mat4.c b/src/mat4.c
+index 601a3d6..93b4308 100644
+--- a/src/mat4.c
++++ b/src/mat4.c
+@@ -917,6 +917,8 @@ Mat_VarReadNextInfo4(mat_t *mat)
+     if ( tmp != readresult ) {
+         Mat_VarFree(matvar);
+         return NULL;
++    } else {
++        matvar->name[tmp - 1] = '\0';
+     }
+ 
+     matvar->internal->datapos = ftell((FILE*)mat->fp);
diff --git a/package/matio/0002-Fix-illegal-memory-access.patch b/package/matio/0002-Fix-illegal-memory-access.patch
new file mode 100644
index 0000000000..5150c79e29
--- /dev/null
+++ b/package/matio/0002-Fix-illegal-memory-access.patch
@@ -0,0 +1,47 @@
+From 7b4699854cc65874e13a8e6944cd8e62fa981068 Mon Sep 17 00:00:00 2001
+From: tbeu <tbeu@users.noreply.github.com>
+Date: Mon, 11 Nov 2019 21:58:41 +0100
+Subject: [PATCH] Fix illegal memory access
+
+As reported by https://github.com/tbeu/matio/issues/128
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/tbeu/matio/commit/7b4699854cc65874e13a8e6944cd8e62fa981068]
+---
+ src/mat5.c | 19 +++++++++++++++++--
+ 1 file changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/src/mat5.c b/src/mat5.c
+index 7f50da4..b76a331 100644
+--- a/src/mat5.c
++++ b/src/mat5.c
+@@ -1380,11 +1380,26 @@ ReadNextStructField( mat_t *mat, matvar_t *matvar )
+                 /* Rank and dimension */
+                 if ( uncomp_buf[0] == MAT_T_INT32 ) {
+                     int j;
++                    size_t size;
+                     fields[i]->rank = uncomp_buf[1];
+                     nbytes -= fields[i]->rank;
+                     fields[i]->rank /= 4;
+-                    fields[i]->dims = (size_t*)malloc(fields[i]->rank*
+-                                             sizeof(*fields[i]->dims));
++                    if ( 0 == do_clean && fields[i]->rank > 13 ) {
++                        int rank = fields[i]->rank;
++                        fields[i]->rank = 0;
++                        Mat_Critical("%d is not a valid rank", rank);
++                        continue;
++                    }
++                    err = SafeMul(&size, fields[i]->rank, sizeof(*fields[i]->dims));
++                    if ( err ) {
++                        if ( do_clean )
++                            free(dims);
++                        Mat_VarFree(fields[i]);
++                        fields[i] = NULL;
++                        Mat_Critical("Integer multiplication overflow");
++                        continue;
++                    }
++                    fields[i]->dims = (size_t*)malloc(size);
+                     if ( mat->byteswap ) {
+                         for ( j = 0; j < fields[i]->rank; j++ )
+                             fields[i]->dims[j] = Mat_uint32Swap(dims+j);
diff --git a/package/matio/0003-Fix-illegal-memory-access.patch b/package/matio/0003-Fix-illegal-memory-access.patch
new file mode 100644
index 0000000000..787207f217
--- /dev/null
+++ b/package/matio/0003-Fix-illegal-memory-access.patch
@@ -0,0 +1,46 @@
+From 65831b7ec829b0ae0ac9d691a2f8fbc2b26af677 Mon Sep 17 00:00:00 2001
+From: tbeu <tbeu@users.noreply.github.com>
+Date: Mon, 11 Nov 2019 22:03:54 +0100
+Subject: [PATCH] Fix illegal memory access
+
+As reported by https://github.com/tbeu/matio/issues/129
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/tbeu/matio/commit/65831b7ec829b0ae0ac9d691a2f8fbc2b26af677]
+---
+ src/mat5.c | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/src/mat5.c b/src/mat5.c
+index b76a331..5e3464e 100644
+--- a/src/mat5.c
++++ b/src/mat5.c
+@@ -989,10 +989,26 @@ ReadNextCell( mat_t *mat, matvar_t *matvar )
+                 /* Rank and Dimension */
+                 if ( uncomp_buf[0] == MAT_T_INT32 ) {
+                     int j;
++                    size_t size;
+                     cells[i]->rank = uncomp_buf[1];
+                     nbytes -= cells[i]->rank;
+                     cells[i]->rank /= 4;
+-                    cells[i]->dims = (size_t*)malloc(cells[i]->rank*sizeof(*cells[i]->dims));
++                    if ( 0 == do_clean && cells[i]->rank > 13 ) {
++                        int rank = cells[i]->rank;
++                        cells[i]->rank = 0;
++                        Mat_Critical("%d is not a valid rank", rank);
++                        continue;
++                    }
++                    err = SafeMul(&size, cells[i]->rank, sizeof(*cells[i]->dims));
++                    if ( err ) {
++                        if ( do_clean )
++                            free(dims);
++                        Mat_VarFree(cells[i]);
++                        cells[i] = NULL;
++                        Mat_Critical("Integer multiplication overflow");
++                        continue;
++                    }
++                    cells[i]->dims = (size_t*)malloc(size);
+                     if ( mat->byteswap ) {
+                         for ( j = 0; j < cells[i]->rank; j++ )
+                             cells[i]->dims[j] = Mat_uint32Swap(dims + j);
diff --git a/package/matio/0004-Fix-memory-leak.patch b/package/matio/0004-Fix-memory-leak.patch
new file mode 100644
index 0000000000..1899d995da
--- /dev/null
+++ b/package/matio/0004-Fix-memory-leak.patch
@@ -0,0 +1,39 @@
+From a47b7cd3aca70e9a0bddf8146eb4ab0cbd19c2c3 Mon Sep 17 00:00:00 2001
+From: tbeu <tbeu@users.noreply.github.com>
+Date: Fri, 15 Nov 2019 23:20:41 +0100
+Subject: [PATCH] Fix memory leak
+
+As reported by https://github.com/tbeu/matio/issues/131
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/tbeu/matio/commit/a47b7cd3aca70e9a0bddf8146eb4ab0cbd19c2c3]
+---
+ src/mat.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/mat.c b/src/mat.c
+index c9c6bd1..e62a9d2 100644
+--- a/src/mat.c
++++ b/src/mat.c
+@@ -220,6 +220,11 @@ int SafeMulDims(const matvar_t *matvar, size_t* nelems)
+ {
+     int i;
+ 
++    if ( matvar->rank == 0 ) {
++        *nelems = 0;
++        return 0;
++    }
++
+     for ( i = 0; i < matvar->rank; i++ ) {
+         if ( !psnip_safe_size_mul(nelems, *nelems, matvar->dims[i]) ) {
+             *nelems = 0;
+@@ -1640,7 +1645,7 @@ Mat_VarFree(matvar_t *matvar)
+         }
+ #endif
+         if ( NULL != matvar->internal->fieldnames &&
+-             matvar->internal->num_fields > 0 ) {
++            matvar->internal->num_fields > 0 ) {
+             size_t i;
+             for ( i = 0; i < matvar->internal->num_fields; i++ ) {
+                 if ( NULL != matvar->internal->fieldnames[i] )
diff --git a/package/matio/matio.mk b/package/matio/matio.mk
index 8af39ce22c..b9bb476223 100644
--- a/package/matio/matio.mk
+++ b/package/matio/matio.mk
@@ -11,6 +11,15 @@ MATIO_LICENSE_FILES = COPYING
 MATIO_DEPENDENCIES = zlib
 MATIO_INSTALL_STAGING = YES
 
+# 0001-Avoid-uninitialized-memory.patch
+MATIO_IGNORE_CVES += CVE-2019-17533
+# 0002-Fix-illegal-memory-access.patch
+MATIO_IGNORE_CVES += CVE-2019-20017 CVE-2019-20020
+# 0003-Fix-illegal-memory-access.patch
+MATIO_IGNORE_CVES += CVE-2019-20017 CVE-2019-20018
+# 0004-Fix-memory-leak.patch
+MATIO_IGNORE_CVES += CVE-2019-20052
+
 # va_copy()
 MATIO_CONF_ENV = ac_cv_va_copy=yes
 
