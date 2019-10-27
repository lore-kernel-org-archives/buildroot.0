From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2019 08:45:59 +0100
Subject: [Buildroot] [PATCH] package/file: add upstream security fix
Message-ID: <20191027074559.15727-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security vulnerability:

- CVE-2019-18218: cdf_read_property_info in cdf.c in file through 5.37 does
  not restrict the number of CDF_VECTOR elements, which allows a heap-based
  buffer overflow (4-byte out-of-bounds write).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ation-overflow-when-computing-sector.patch | 68 +++++++++++++++++++
 ...-of-elements-in-a-vector-found-by-os.patch | 62 +++++++++++++++++
 2 files changed, 130 insertions(+)
 create mode 100644 package/file/0001-Detect-multiplication-overflow-when-computing-sector.patch
 create mode 100644 package/file/0002-Limit-the-number-of-elements-in-a-vector-found-by-os.patch

diff --git a/package/file/0001-Detect-multiplication-overflow-when-computing-sector.patch b/package/file/0001-Detect-multiplication-overflow-when-computing-sector.patch
new file mode 100644
index 0000000000..c7ef4f2e0d
--- /dev/null
+++ b/package/file/0001-Detect-multiplication-overflow-when-computing-sector.patch
@@ -0,0 +1,68 @@
+From 06de62c022138f63de9bcd04074491945eaa8662 Mon Sep 17 00:00:00 2001
+From: Christos Zoulas <christos@zoulas.com>
+Date: Fri, 23 Aug 2019 14:29:14 +0000
+Subject: [PATCH] Detect multiplication overflow when computing sector position
+ (found by oss-fuzz)
+
+Fixes CVE-2019-18218
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/cdf.c | 20 +++++++++++++++++---
+ 1 file changed, 17 insertions(+), 3 deletions(-)
+
+diff --git a/src/cdf.c b/src/cdf.c
+index 556a3ff8..9d639674 100644
+--- a/src/cdf.c
++++ b/src/cdf.c
+@@ -35,7 +35,7 @@
+ #include "file.h"
+ 
+ #ifndef lint
+-FILE_RCSID("@(#)$File: cdf.c,v 1.114 2019/02/20 02:35:27 christos Exp $")
++FILE_RCSID("@(#)$File: cdf.c,v 1.115 2019/08/23 14:29:14 christos Exp $")
+ #endif
+ 
+ #include <assert.h>
+@@ -53,6 +53,10 @@ FILE_RCSID("@(#)$File: cdf.c,v 1.114 2019/02/20 02:35:27 christos Exp $")
+ #define EFTYPE EINVAL
+ #endif
+ 
++#ifndef SIZE_T_MAX
++#define SIZE_T_MAX CAST(size_t, ~0ULL)
++#endif
++
+ #include "cdf.h"
+ 
+ #ifdef CDF_DEBUG
+@@ -405,7 +409,12 @@ cdf_read_sector(const cdf_info_t *info, void *buf, size_t offs, size_t len,
+     const cdf_header_t *h, cdf_secid_t id)
+ {
+ 	size_t ss = CDF_SEC_SIZE(h);
+-	size_t pos = CDF_SEC_POS(h, id);
++	size_t pos;
++
++	if (SIZE_T_MAX / ss < CAST(size_t, id))
++		return -1;
++
++	pos = CDF_SEC_POS(h, id);
+ 	assert(ss == len);
+ 	return cdf_read(info, CAST(off_t, pos), RCAST(char *, buf) + offs, len);
+ }
+@@ -415,7 +424,12 @@ cdf_read_short_sector(const cdf_stream_t *sst, void *buf, size_t offs,
+     size_t len, const cdf_header_t *h, cdf_secid_t id)
+ {
+ 	size_t ss = CDF_SHORT_SEC_SIZE(h);
+-	size_t pos = CDF_SHORT_SEC_POS(h, id);
++	size_t pos;
++
++	if (SIZE_T_MAX / ss < CAST(size_t, id))
++		return -1;
++
++	pos = CDF_SHORT_SEC_POS(h, id);
+ 	assert(ss == len);
+ 	if (pos + len > CDF_SEC_SIZE(h) * sst->sst_len) {
+ 		DPRINTF(("Out of bounds read %" SIZE_T_FORMAT "u > %"
+-- 
+2.20.1
+
diff --git a/package/file/0002-Limit-the-number-of-elements-in-a-vector-found-by-os.patch b/package/file/0002-Limit-the-number-of-elements-in-a-vector-found-by-os.patch
new file mode 100644
index 0000000000..6f16894f98
--- /dev/null
+++ b/package/file/0002-Limit-the-number-of-elements-in-a-vector-found-by-os.patch
@@ -0,0 +1,62 @@
+From 46a8443f76cec4b41ec736eca396984c74664f84 Mon Sep 17 00:00:00 2001
+From: Christos Zoulas <christos@zoulas.com>
+Date: Mon, 26 Aug 2019 14:31:39 +0000
+Subject: [PATCH] Limit the number of elements in a vector (found by oss-fuzz)
+
+Fixes CVE-2019-18218
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/cdf.c | 9 ++++-----
+ src/cdf.h | 1 +
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/cdf.c b/src/cdf.c
+index 9d639674..bb81d637 100644
+--- a/src/cdf.c
++++ b/src/cdf.c
+@@ -35,7 +35,7 @@
+ #include "file.h"
+ 
+ #ifndef lint
+-FILE_RCSID("@(#)$File: cdf.c,v 1.115 2019/08/23 14:29:14 christos Exp $")
++FILE_RCSID("@(#)$File: cdf.c,v 1.116 2019/08/26 14:31:39 christos Exp $")
+ #endif
+ 
+ #include <assert.h>
+@@ -1027,8 +1027,9 @@ cdf_read_property_info(const cdf_stream_t *sst, const cdf_header_t *h,
+ 				goto out;
+ 			}
+ 			nelements = CDF_GETUINT32(q, 1);
+-			if (nelements == 0) {
+-				DPRINTF(("CDF_VECTOR with nelements == 0\n"));
++			if (nelements > CDF_ELEMENT_LIMIT || nelements == 0) {
++				DPRINTF(("CDF_VECTOR with nelements == %"
++				    SIZE_T_FORMAT "u\n", nelements));
+ 				goto out;
+ 			}
+ 			slen = 2;
+@@ -1070,8 +1071,6 @@ cdf_read_property_info(const cdf_stream_t *sst, const cdf_header_t *h,
+ 					goto out;
+ 				inp += nelem;
+ 			}
+-			DPRINTF(("nelements = %" SIZE_T_FORMAT "u\n",
+-			    nelements));
+ 			for (j = 0; j < nelements && i < sh.sh_properties;
+ 			    j++, i++)
+ 			{
+diff --git a/src/cdf.h b/src/cdf.h
+index 2f7e554b..05056668 100644
+--- a/src/cdf.h
++++ b/src/cdf.h
+@@ -48,6 +48,7 @@
+ typedef int32_t cdf_secid_t;
+ 
+ #define CDF_LOOP_LIMIT					10000
++#define CDF_ELEMENT_LIMIT				100000
+ 
+ #define CDF_SECID_NULL					0
+ #define CDF_SECID_FREE					-1
+-- 
+2.20.1
+
-- 
2.20.1
