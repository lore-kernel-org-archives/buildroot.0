From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2020 21:16:36 +0100
Subject: [Buildroot] [git commit] package/file: bump to version 5.38
Message-ID: <20200113201115.0B3B0818F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a61a3df7bcd8f62e3f78b1bbb75ccf7a9bb1444
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patches (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...iplication-overflow-when-computing-sector.patch | 68 ----------------------
 ...umber-of-elements-in-a-vector-found-by-os.patch | 62 --------------------
 package/file/file.hash                             |  6 +-
 package/file/file.mk                               |  2 +-
 4 files changed, 4 insertions(+), 134 deletions(-)

diff --git a/package/file/0001-Detect-multiplication-overflow-when-computing-sector.patch b/package/file/0001-Detect-multiplication-overflow-when-computing-sector.patch
deleted file mode 100644
index c7ef4f2e0d..0000000000
--- a/package/file/0001-Detect-multiplication-overflow-when-computing-sector.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 06de62c022138f63de9bcd04074491945eaa8662 Mon Sep 17 00:00:00 2001
-From: Christos Zoulas <christos@zoulas.com>
-Date: Fri, 23 Aug 2019 14:29:14 +0000
-Subject: [PATCH] Detect multiplication overflow when computing sector position
- (found by oss-fuzz)
-
-Fixes CVE-2019-18218
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/cdf.c | 20 +++++++++++++++++---
- 1 file changed, 17 insertions(+), 3 deletions(-)
-
-diff --git a/src/cdf.c b/src/cdf.c
-index 556a3ff8..9d639674 100644
---- a/src/cdf.c
-+++ b/src/cdf.c
-@@ -35,7 +35,7 @@
- #include "file.h"
- 
- #ifndef lint
--FILE_RCSID("@(#)$File: cdf.c,v 1.114 2019/02/20 02:35:27 christos Exp $")
-+FILE_RCSID("@(#)$File: cdf.c,v 1.115 2019/08/23 14:29:14 christos Exp $")
- #endif
- 
- #include <assert.h>
-@@ -53,6 +53,10 @@ FILE_RCSID("@(#)$File: cdf.c,v 1.114 2019/02/20 02:35:27 christos Exp $")
- #define EFTYPE EINVAL
- #endif
- 
-+#ifndef SIZE_T_MAX
-+#define SIZE_T_MAX CAST(size_t, ~0ULL)
-+#endif
-+
- #include "cdf.h"
- 
- #ifdef CDF_DEBUG
-@@ -405,7 +409,12 @@ cdf_read_sector(const cdf_info_t *info, void *buf, size_t offs, size_t len,
-     const cdf_header_t *h, cdf_secid_t id)
- {
- 	size_t ss = CDF_SEC_SIZE(h);
--	size_t pos = CDF_SEC_POS(h, id);
-+	size_t pos;
-+
-+	if (SIZE_T_MAX / ss < CAST(size_t, id))
-+		return -1;
-+
-+	pos = CDF_SEC_POS(h, id);
- 	assert(ss == len);
- 	return cdf_read(info, CAST(off_t, pos), RCAST(char *, buf) + offs, len);
- }
-@@ -415,7 +424,12 @@ cdf_read_short_sector(const cdf_stream_t *sst, void *buf, size_t offs,
-     size_t len, const cdf_header_t *h, cdf_secid_t id)
- {
- 	size_t ss = CDF_SHORT_SEC_SIZE(h);
--	size_t pos = CDF_SHORT_SEC_POS(h, id);
-+	size_t pos;
-+
-+	if (SIZE_T_MAX / ss < CAST(size_t, id))
-+		return -1;
-+
-+	pos = CDF_SHORT_SEC_POS(h, id);
- 	assert(ss == len);
- 	if (pos + len > CDF_SEC_SIZE(h) * sst->sst_len) {
- 		DPRINTF(("Out of bounds read %" SIZE_T_FORMAT "u > %"
--- 
-2.20.1
-
diff --git a/package/file/0002-Limit-the-number-of-elements-in-a-vector-found-by-os.patch b/package/file/0002-Limit-the-number-of-elements-in-a-vector-found-by-os.patch
deleted file mode 100644
index 6f16894f98..0000000000
--- a/package/file/0002-Limit-the-number-of-elements-in-a-vector-found-by-os.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 46a8443f76cec4b41ec736eca396984c74664f84 Mon Sep 17 00:00:00 2001
-From: Christos Zoulas <christos@zoulas.com>
-Date: Mon, 26 Aug 2019 14:31:39 +0000
-Subject: [PATCH] Limit the number of elements in a vector (found by oss-fuzz)
-
-Fixes CVE-2019-18218
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/cdf.c | 9 ++++-----
- src/cdf.h | 1 +
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/cdf.c b/src/cdf.c
-index 9d639674..bb81d637 100644
---- a/src/cdf.c
-+++ b/src/cdf.c
-@@ -35,7 +35,7 @@
- #include "file.h"
- 
- #ifndef lint
--FILE_RCSID("@(#)$File: cdf.c,v 1.115 2019/08/23 14:29:14 christos Exp $")
-+FILE_RCSID("@(#)$File: cdf.c,v 1.116 2019/08/26 14:31:39 christos Exp $")
- #endif
- 
- #include <assert.h>
-@@ -1027,8 +1027,9 @@ cdf_read_property_info(const cdf_stream_t *sst, const cdf_header_t *h,
- 				goto out;
- 			}
- 			nelements = CDF_GETUINT32(q, 1);
--			if (nelements == 0) {
--				DPRINTF(("CDF_VECTOR with nelements == 0\n"));
-+			if (nelements > CDF_ELEMENT_LIMIT || nelements == 0) {
-+				DPRINTF(("CDF_VECTOR with nelements == %"
-+				    SIZE_T_FORMAT "u\n", nelements));
- 				goto out;
- 			}
- 			slen = 2;
-@@ -1070,8 +1071,6 @@ cdf_read_property_info(const cdf_stream_t *sst, const cdf_header_t *h,
- 					goto out;
- 				inp += nelem;
- 			}
--			DPRINTF(("nelements = %" SIZE_T_FORMAT "u\n",
--			    nelements));
- 			for (j = 0; j < nelements && i < sh.sh_properties;
- 			    j++, i++)
- 			{
-diff --git a/src/cdf.h b/src/cdf.h
-index 2f7e554b..05056668 100644
---- a/src/cdf.h
-+++ b/src/cdf.h
-@@ -48,6 +48,7 @@
- typedef int32_t cdf_secid_t;
- 
- #define CDF_LOOP_LIMIT					10000
-+#define CDF_ELEMENT_LIMIT				100000
- 
- #define CDF_SECID_NULL					0
- #define CDF_SECID_FREE					-1
--- 
-2.20.1
-
diff --git a/package/file/file.hash b/package/file/file.hash
index 241820d0fb..96efaf8483 100644
--- a/package/file/file.hash
+++ b/package/file/file.hash
@@ -1,7 +1,7 @@
 # Locally calculated after verifying signature
-# ftp://ftp.astron.com/pub/file/file-5.37.tar.gz.asc
+# ftp://ftp.astron.com/pub/file/file-5.38.tar.gz.asc
 # using key BE04995BA8F90ED0C0C176C471112AB16CB33B3A
-sha256 e9c13967f7dd339a3c241b7710ba093560b9a33013491318e88e6b8b57bae07f  file-5.37.tar.gz
+sha256 593c2ffc2ab349c5aea0f55fedfe4d681737b6b62376a9b3ad1e77b2cc19fa34  file-5.38.tar.gz
 sha256 0bfa856a9930bddadbef95d1be1cf4e163c0be618e76ea3275caaf255283e274  COPYING
 sha256 4ccb60d623884ef637af4a5bc16b2cb350163e2135e967655837336019a64462  src/mygetopt.h
-sha256 7ac061e1a1c840c4dfa0573aec6f3497676c9295b5ec4190d3576646eb1646bf  src/vasprintf.c
+sha256 58b5932aca6c10f2194290a3b26088ec9ba07ef6b52cc9bb2dd638cc634db6f1  src/vasprintf.c
diff --git a/package/file/file.mk b/package/file/file.mk
index a13acbc47c..3ae7c85976 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.37
+FILE_VERSION = 5.38
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 HOST_FILE_DEPENDENCIES = host-zlib
