From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 Feb 2019 22:42:13 +0100
Subject: [Buildroot] [git commit] package/tpm2-tss: fix build with gcc <= 4.8
Message-ID: <20190207214055.C94C183CA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab59727b38429c2338d8d0c85a263a587a199283
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/8d7b6dad6602fe67338abc696bc4752dda8e9717

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...m2b-types.c-fix-maybe-uninitialized-error.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/tpm2-tss/0001-tpm2b-types.c-fix-maybe-uninitialized-error.patch b/package/tpm2-tss/0001-tpm2b-types.c-fix-maybe-uninitialized-error.patch
new file mode 100644
index 0000000000..7125835711
--- /dev/null
+++ b/package/tpm2-tss/0001-tpm2b-types.c-fix-maybe-uninitialized-error.patch
@@ -0,0 +1,37 @@
+From 815f2bcbdfe5d9aff2cd3acbbb105daf1f5e9d7f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 7 Feb 2019 09:58:07 +0100
+Subject: [PATCH] tpm2b-types.c: fix maybe-uninitialized error
+
+src/tss2-mu/tpm2b-types.c: In function 'Tss2_MU_TPM2B_ECC_POINT_Marshal':
+src/tss2-mu/tpm2b-types.c:201:24: error: 'ptr' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+         *(UINT16 *)ptr = HOST_TO_BE_16(buffer + local_offset - ptr - 2); \
+                        ^
+src/tss2-mu/tpm2b-types.c:152:12: note: 'ptr' was declared here
+     UINT8 *ptr; \
+
+Fixes:
+ - http://autobuild.buildroot.org/results/8d7b6dad6602fe67338abc696bc4752dda8e9717
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/tpm2-software/tpm2-tss/pull/1265]
+---
+ src/tss2-mu/tpm2b-types.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/tss2-mu/tpm2b-types.c b/src/tss2-mu/tpm2b-types.c
+index 9c1003ab..7632febb 100644
+--- a/src/tss2-mu/tpm2b-types.c
++++ b/src/tss2-mu/tpm2b-types.c
+@@ -150,7 +150,7 @@ TSS2_RC Tss2_MU_##type##_Marshal(type const *src, uint8_t buffer[], \
+                                  size_t buffer_size, size_t *offset) \
+ { \
+     size_t local_offset = 0; \
+-    UINT8 *ptr; \
++    UINT8 *ptr = NULL; \
+     TSS2_RC rc; \
+ \
+     if (src == NULL) { \
+-- 
+2.14.1
+
