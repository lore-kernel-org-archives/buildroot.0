From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 May 2021 11:52:39 +0200
Subject: [Buildroot] [PATCH] package/lz4: add upstream security fix for
 CVE-2021-3520
Message-ID: <20210523095239.18348-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a potential memory corruption with negative memmove() size.  For
details, see (NVD not yet updated):

https://security-tracker.debian.org/tracker/CVE-2021-3520

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...mory-corruption-with-negative-memmov.patch | 26 +++++++++++++++++++
 package/lz4/lz4.mk                            |  3 +++
 2 files changed, 29 insertions(+)
 create mode 100644 package/lz4/0001-Fix-potential-memory-corruption-with-negative-memmov.patch

diff --git a/package/lz4/0001-Fix-potential-memory-corruption-with-negative-memmov.patch b/package/lz4/0001-Fix-potential-memory-corruption-with-negative-memmov.patch
new file mode 100644
index 0000000000..57e4e38f84
--- /dev/null
+++ b/package/lz4/0001-Fix-potential-memory-corruption-with-negative-memmov.patch
@@ -0,0 +1,26 @@
+From 8301a21773ef61656225e264f4f06ae14462bca7 Mon Sep 17 00:00:00 2001
+From: Jasper Lievisse Adriaanse <j@jasper.la>
+Date: Fri, 26 Feb 2021 15:21:20 +0100
+Subject: [PATCH] Fix potential memory corruption with negative memmove() size
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ lib/lz4.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/lz4.c b/lib/lz4.c
+index 5f524d0..c2f504e 100644
+--- a/lib/lz4.c
++++ b/lib/lz4.c
+@@ -1749,7 +1749,7 @@ LZ4_decompress_generic(
+                  const size_t dictSize         /* note : = 0 if noDict */
+                  )
+ {
+-    if (src == NULL) { return -1; }
++    if ((src == NULL) || (outputSize < 0)) { return -1; }
+ 
+     {   const BYTE* ip = (const BYTE*) src;
+         const BYTE* const iend = ip + srcSize;
+-- 
+2.20.1
+
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index e0236c05b1..9b9b6198c3 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -17,6 +17,9 @@ LZ4_CPE_ID_VENDOR = yann_collet
 # See https://github.com/lz4/lz4/issues/818
 LZ4_IGNORE_CVES += CVE-2014-4715
 
+# 0001-Fix-potential-memory-corruption-with-negative-memmov.patch
+LZ4_IGNORE_CVES += CVE-2021-3520
+
 ifeq ($(BR2_STATIC_LIBS),y)
 LZ4_MAKE_OPTS += BUILD_SHARED=no
 else ifeq ($(BR2_SHARED_LIBS),y)
-- 
2.20.1
