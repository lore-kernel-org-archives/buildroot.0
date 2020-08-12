From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 12 Aug 2020 21:12:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/ima-evm-utils: bump version to 1.3.1
Message-ID: <20200812191221.29100-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dropped patches from this release.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Minor update, but still contain some other needed fixes.

At least some tests (minor code changes)
                             andes-nds32 [ 1/45]: OK
                             arm-aarch64 [ 2/45]: OK
                        br-aarch64-glibc [ 3/45]: OK
                           br-arcle-hs38 [ 4/45]: OK


Kind regards,
Petr

 ...ss-Fix-compilation-for-old-compilers.patch | 51 -------------------
 ...Fix-missing-u-g-id_t-typedef-on-musl.patch | 29 -----------
 package/ima-evm-utils/ima-evm-utils.hash      |  4 +-
 package/ima-evm-utils/ima-evm-utils.mk        |  2 +-
 4 files changed, 3 insertions(+), 83 deletions(-)
 delete mode 100644 package/ima-evm-utils/0001-pcr_tss-Fix-compilation-for-old-compilers.patch
 delete mode 100644 package/ima-evm-utils/0002-Fix-missing-u-g-id_t-typedef-on-musl.patch

diff --git a/package/ima-evm-utils/0001-pcr_tss-Fix-compilation-for-old-compilers.patch b/package/ima-evm-utils/0001-pcr_tss-Fix-compilation-for-old-compilers.patch
deleted file mode 100644
index 079c4e0d22..0000000000
--- a/package/ima-evm-utils/0001-pcr_tss-Fix-compilation-for-old-compilers.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 8e98b5bbf2127131f968a5d864f86e8443505639 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <pvorel@suse.cz>
-Date: Wed, 22 Jul 2020 12:06:28 +0200
-Subject: [PATCH] pcr_tss: Fix compilation for old compilers
-
-pcr_tss.c: In function 'pcr_selections_match':
-pcr_tss.c:73:2: error: 'for' loop initial declarations are only allowed in C99 mode
-  for (int i = 0; i < a->count; i++) {
-  ^
-pcr_tss.c:73:2: note: use option -std=c99 or -std=gnu99 to compile your code
-pcr_tss.c:78:3: error: 'for' loop initial declarations are only allowed in C99 mode
-   for (int j = 0; j < a->pcrSelections[i].sizeofSelect; j++) {
-   ^
-
-Fixes: 03f99ea ("ima-evm-utils: Add support for Intel TSS2 for PCR
-reading")
-
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-[ upstream status: 1f4e423 ("pcr_tss: Fix compilation for old compilers") ]
----
- src/pcr_tss.c | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/src/pcr_tss.c b/src/pcr_tss.c
-index 11b247b..feb1ff7 100644
---- a/src/pcr_tss.c
-+++ b/src/pcr_tss.c
-@@ -68,14 +68,17 @@ int tpm2_pcr_supported(void)
- 
- static int pcr_selections_match(TPML_PCR_SELECTION *a, TPML_PCR_SELECTION *b)
- {
-+	int i, j;
-+
- 	if (a->count != b->count)
- 		return 0;
--	for (int i = 0; i < a->count; i++) {
-+
-+	for (i = 0; i < a->count; i++) {
- 		if (a->pcrSelections[i].hash != b->pcrSelections[i].hash)
- 			return 0;
- 		if (a->pcrSelections[i].sizeofSelect != b->pcrSelections[i].sizeofSelect)
- 			return 0;
--		for (int j = 0; j < a->pcrSelections[i].sizeofSelect; j++) {
-+		for (j = 0; j < a->pcrSelections[i].sizeofSelect; j++) {
- 			if (a->pcrSelections[i].pcrSelect[j] != b->pcrSelections[i].pcrSelect[j])
- 				return 0;
- 		}
--- 
-2.27.0
-
diff --git a/package/ima-evm-utils/0002-Fix-missing-u-g-id_t-typedef-on-musl.patch b/package/ima-evm-utils/0002-Fix-missing-u-g-id_t-typedef-on-musl.patch
deleted file mode 100644
index 0596f68170..0000000000
--- a/package/ima-evm-utils/0002-Fix-missing-u-g-id_t-typedef-on-musl.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From e74b1c8620ba81682dc6b62bd2783311b99f5bd0 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Wed, 22 Jul 2020 13:10:20 +0200
-Subject: [PATCH] Fix missing {u,g}id_t typedef on musl
-
-Fixes: 273701a ("evmctl - IMA/EVM control tool")
-
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-[ upstream status: 7f9a59c ("Fix missing {u,g}id_t typedef on musl") ]
----
- src/imaevm.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/imaevm.h b/src/imaevm.h
-index b881d92..923e2e6 100644
---- a/src/imaevm.h
-+++ b/src/imaevm.h
-@@ -46,7 +46,7 @@
- #include <syslog.h>
- #include <stdbool.h>
- #include <errno.h>
--
-+#include <sys/types.h>
- #include <openssl/rsa.h>
- 
- #ifdef USE_FPRINTF
--- 
-2.27.0
-
diff --git a/package/ima-evm-utils/ima-evm-utils.hash b/package/ima-evm-utils/ima-evm-utils.hash
index 4fe1591f74..8d0eecfdb9 100644
--- a/package/ima-evm-utils/ima-evm-utils.hash
+++ b/package/ima-evm-utils/ima-evm-utils.hash
@@ -1,4 +1,4 @@
 # sha1 from sourceforge, sha256 locally computed
-sha1  8b81f83ddc0e7c863268e76049fa50ad89a04b11  ima-evm-utils-1.3.tar.gz
-sha256 62e90e8dc6b131a4f34a356114cdcb5bef844f110abbdd5d8b53c449aecc609f  ima-evm-utils-1.3.tar.gz
+sha1  bb0c1c2de5f6c179d9a84909e5e6698b86a4aac2  ima-evm-utils-1.3.1.tar.gz
+sha256 5304271f31a3601a2af5984942d9bd6c7532597c5a97250c9a4524074fc39925  ima-evm-utils-1.3.1.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ima-evm-utils/ima-evm-utils.mk b/package/ima-evm-utils/ima-evm-utils.mk
index 70295643a4..5c9aa2f7cd 100644
--- a/package/ima-evm-utils/ima-evm-utils.mk
+++ b/package/ima-evm-utils/ima-evm-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMA_EVM_UTILS_VERSION = 1.3
+IMA_EVM_UTILS_VERSION = 1.3.1
 IMA_EVM_UTILS_SITE = http://downloads.sourceforge.net/project/linux-ima/ima-evm-utils
 IMA_EVM_UTILS_LICENSE = GPL-2.0
 IMA_EVM_UTILS_LICENSE_FILES = COPYING
-- 
2.28.0
