From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 May 2018 15:35:22 +0200
Subject: [Buildroot] [git commit] uclibc: fix ldconfig for x86_64
Message-ID: <20180508133613.04A898C004@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fcac93eeabfbce374c814aa493164d81eed2f016
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...vert-ldconfig-add-glibc-compatibility-fix.patch | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/package/uclibc/0001-Revert-ldconfig-add-glibc-compatibility-fix.patch b/package/uclibc/0001-Revert-ldconfig-add-glibc-compatibility-fix.patch
new file mode 100644
index 0000000000..7ba3b2866d
--- /dev/null
+++ b/package/uclibc/0001-Revert-ldconfig-add-glibc-compatibility-fix.patch
@@ -0,0 +1,54 @@
+From 92d250d387e247029900c9074150f45866b29781 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sun, 29 Apr 2018 19:34:11 +0200
+Subject: [PATCH] Revert "ldconfig: add glibc compatibility fix"
+
+This reverts commit 2a3bb4daf5778c5875674cd26a3c75b3d460a042.
+
+This is breaking ld.so.cache usage. Seen on Gentoo/amd64.
+
+Reported-by: "Anthony G. Basile" <basile@freeharbor.net>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ utils/ldconfig.c | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/utils/ldconfig.c b/utils/ldconfig.c
+index 58939d6..e6b7881 100644
+--- a/utils/ldconfig.c
++++ b/utils/ldconfig.c
+@@ -184,9 +184,10 @@ static char *readsoname(char *name, FILE *infile, int expected_type,
+ 		res = readsoname32(name, infile, expected_type, type);
+ 	else {
+ 		res = readsoname64(name, infile, expected_type, type);
+-
+-		// For 64-bit glibc compatibility
+-		*type |= FLAG_X8664_LIB64;
++#if 0
++		/* relies on multilib support which we dont have ... */
++		*type |= LIB_ELF64;
++#endif
+ 	}
+ 
+ 	return res;
+@@ -757,7 +758,7 @@ void cache_print(void)
+ 
+ 	for (fd = 0; fd < header->nlibs; fd++) {
+ 		printf("\t%s ", strs + libent[fd].sooffset);
+-		switch (libent[fd].flags & ~LIB_ELF64 & FLAG_TYPE_MASK) {
++		switch (libent[fd].flags & ~LIB_ELF64) {
+ 		case LIB_DLL:
+ 			printf("(libc4)");
+ 			break;
+@@ -770,7 +771,7 @@ void cache_print(void)
+ 		case LIB_ELF_LIBC5:
+ 		case LIB_ELF_LIBC6:
+ 			printf("(libc%d%s)",
+-			       (libent[fd].flags & ~LIB_ELF64 & FLAG_TYPE_MASK) + 3,
++			       (libent[fd].flags & ~LIB_ELF64) + 3,
+ 			       libent[fd].flags & LIB_ELF64 ? "/64" : "");
+ 			break;
+ 		default:
+-- 
+2.1.4
+
