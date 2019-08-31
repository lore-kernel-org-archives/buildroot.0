From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Aug 2019 09:53:57 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/bzip2: security
 bump version to 1.0.8
Message-ID: <20190831074955.8D66B884F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=786f28a1e5c18902d56013676117f4273f20c356
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Switched to new maintainer source:
https://sourceware.org/ml/bzip2-devel/2019-q2/msg00022.html

Version 1.0.7 fixes CVE-2016-3189 & CVE-2019-12900

Version 1.0.8 fixes the fix for CVE-2019-12900 from 1.0.7:
https://sourceware.org/ml/bzip2-devel/2019-q3/msg00031.html

Rebased 0002-improve-build-system.patch.

Removed 0003-Make-sure-nSelectors-is-not-out-of-range.patch, applied
upstream:
https://sourceware.org/git/?p=bzip2.git;a=commitdiff;h=7ed62bfb46e87a9e878712603469440e6882b184
and reverted later on
https://sourceware.org/git/?p=bzip2.git;a=commitdiff;h=b07b105d1b66e32760095e3602261738443b9e13

Added upstream sha512 hash and updated license hash after upstream
commits:
https://sourceware.org/git/?p=bzip2.git;a=history;f=LICENSE;h=81a37eab7a5be1a34456f38adb74928cc9073e9b;hb=HEAD

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7ae14d201e142aa414b9bc275ad1acb565095d34)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bzip2/0002-improve-build-system.patch      | 14 ++++-----
 ...-Make-sure-nSelectors-is-not-out-of-range.patch | 33 ----------------------
 package/bzip2/Config.in                            |  2 ++
 package/bzip2/bzip2.hash                           |  8 ++----
 package/bzip2/bzip2.mk                             |  4 +--
 5 files changed, 14 insertions(+), 47 deletions(-)

diff --git a/package/bzip2/0002-improve-build-system.patch b/package/bzip2/0002-improve-build-system.patch
index 90099aa288..2d6e2cf900 100644
--- a/package/bzip2/0002-improve-build-system.patch
+++ b/package/bzip2/0002-improve-build-system.patch
@@ -70,15 +70,15 @@ Index: b/Makefile-libbz2_so
        huffman.o    \
 @@ -37,8 +36,11 @@
  all: $(OBJS)
- 	$(CC) -shared -Wl,-soname -Wl,libbz2.so.1.0 -o libbz2.so.1.0.6 $(OBJS)
- 	$(CC) $(CFLAGS) -o bzip2-shared bzip2.c libbz2.so.1.0.6
+ 	$(CC) -shared -Wl,-soname -Wl,libbz2.so.1.0 -o libbz2.so.1.0.8 $(OBJS)
+ 	$(CC) $(CFLAGS) -o bzip2-shared bzip2.c libbz2.so.1.0.8
 -	rm -f libbz2.so.1.0
--	ln -s libbz2.so.1.0.6 libbz2.so.1.0
+-	ln -s libbz2.so.1.0.8 libbz2.so.1.0
 +
 +install:
-+	install -m 0755 -D libbz2.so.1.0.6 $(PREFIX)/lib/libbz2.so.1.0.6
-+	ln -sf libbz2.so.1.0.6 $(PREFIX)/lib/libbz2.so
-+	ln -sf libbz2.so.1.0.6 $(PREFIX)/lib/libbz2.so.1.0
++	install -m 0755 -D libbz2.so.1.0.8 $(PREFIX)/lib/libbz2.so.1.0.8
++	ln -sf libbz2.so.1.0.8 $(PREFIX)/lib/libbz2.so
++	ln -sf libbz2.so.1.0.8 $(PREFIX)/lib/libbz2.so.1.0
  
  clean: 
- 	rm -f $(OBJS) bzip2.o libbz2.so.1.0.6 libbz2.so.1.0 bzip2-shared
+ 	rm -f $(OBJS) bzip2.o libbz2.so.1.0.8 libbz2.so.1.0 bzip2-shared
diff --git a/package/bzip2/0003-Make-sure-nSelectors-is-not-out-of-range.patch b/package/bzip2/0003-Make-sure-nSelectors-is-not-out-of-range.patch
deleted file mode 100644
index 77a500d46d..0000000000
--- a/package/bzip2/0003-Make-sure-nSelectors-is-not-out-of-range.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 74de1e2e6ffc9d51ef9824db71a8ffee5962cdbc Mon Sep 17 00:00:00 2001
-From: Albert Astals Cid <aacid@kde.org>
-Date: Tue, 28 May 2019 19:35:18 +0200
-Subject: [PATCH] Make sure nSelectors is not out of range
-
-nSelectors is used in a loop from 0 to nSelectors to access selectorMtf
-which is
-	UChar    selectorMtf[BZ_MAX_SELECTORS];
-so if nSelectors is bigger than BZ_MAX_SELECTORS it'll do an invalid memory
-access
-
-Fixes out of bounds access discovered while fuzzying karchive
-
-Signed-off-by: Albert Astals Cid <aacid@kde.org>
----
- decompress.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/decompress.c b/decompress.c
-index ab6a624..f3db91d 100644
---- a/decompress.c
-+++ b/decompress.c
-@@ -287,7 +287,7 @@ Int32 BZ2_decompress ( DState* s )
-       GET_BITS(BZ_X_SELECTOR_1, nGroups, 3);
-       if (nGroups < 2 || nGroups > 6) RETURN(BZ_DATA_ERROR);
-       GET_BITS(BZ_X_SELECTOR_2, nSelectors, 15);
--      if (nSelectors < 1) RETURN(BZ_DATA_ERROR);
-+      if (nSelectors < 1 || nSelectors > BZ_MAX_SELECTORS) RETURN(BZ_DATA_ERROR);
-       for (i = 0; i < nSelectors; i++) {
-          j = 0;
-          while (True) {
--- 
-2.21.0
diff --git a/package/bzip2/Config.in b/package/bzip2/Config.in
index ca447bbb2d..7db1902b60 100644
--- a/package/bzip2/Config.in
+++ b/package/bzip2/Config.in
@@ -5,3 +5,5 @@ config BR2_PACKAGE_BZIP2
 	  It typically compresses files to within 10% to 15% of the best
 	  available techniques, while being around twice as fast at
 	  compression and six times faster@decompression.
+
+	  https://sourceware.org/bzip2/
diff --git a/package/bzip2/bzip2.hash b/package/bzip2/bzip2.hash
index ffe94aa454..cf66c402fc 100644
--- a/package/bzip2/bzip2.hash
+++ b/package/bzip2/bzip2.hash
@@ -1,6 +1,4 @@
-# From http://www.bzip.org/downloads.html
-md5	00b516f4704d4a7cb50a1d97e6e8e15b	bzip2-1.0.6.tar.gz
-
+# From https://sourceware.org/pub/bzip2/sha512.sum
+sha512 083f5e675d73f3233c7930ebe20425a533feedeaaa9d8cc86831312a6581cefbe6ed0d08d2fa89be81082f2a5abdabca8b3c080bf97218a1bd59dc118a30b9f3  bzip2-1.0.8.tar.gz
 # Locally calculated
-sha256	a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd	bzip2-1.0.6.tar.gz
-sha256	4919cfb14a73cd64fcef67b107613970cf1659a09aa675dba31314f373bc7204	LICENSE
+sha256 c6dbbf828498be844a89eaa3b84adbab3199e342eb5cb2ed2f0d4ba7ec0f38a3  LICENSE
diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index a3af322993..b4d8eea25e 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BZIP2_VERSION = 1.0.6
-BZIP2_SITE = http://sources.buildroot.net
+BZIP2_VERSION = 1.0.8
+BZIP2_SITE = https://sourceware.org/pub/bzip2
 BZIP2_INSTALL_STAGING = YES
 BZIP2_LICENSE = bzip2 license
 BZIP2_LICENSE_FILES = LICENSE
