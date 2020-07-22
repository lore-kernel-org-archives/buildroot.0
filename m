From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 22 Jul 2020 21:35:31 +0200
Subject: [Buildroot] [PATCH 2/3] package/ima-evm-utils: fix build for old
 compilers
In-Reply-To: <20200722193532.32150-1-petr.vorel@gmail.com>
References: <20200722193532.32150-1-petr.vorel@gmail.com>
Message-ID: <20200722193532.32150-2-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
                     sourcery-arm-armv4t [38/44]: FAILED
                            sourcery-arm [39/44]: FAILED
                     sourcery-arm-thumb2 [40/44]: FAILED

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Acked by upstream, but not yet merged.
https://lore.kernel.org/linux-integrity/1595416105.5311.33.camel at linux.ibm.com/T/#mc663d7aa4e39752db4034de49a9fda2442185009

Kind regards,
Petr

 ...ss-Fix-compilation-for-old-compilers.patch | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/ima-evm-utils/0001-pcr_tss-Fix-compilation-for-old-compilers.patch

diff --git a/package/ima-evm-utils/0001-pcr_tss-Fix-compilation-for-old-compilers.patch b/package/ima-evm-utils/0001-pcr_tss-Fix-compilation-for-old-compilers.patch
new file mode 100644
index 0000000000..258a74fe8c
--- /dev/null
+++ b/package/ima-evm-utils/0001-pcr_tss-Fix-compilation-for-old-compilers.patch
@@ -0,0 +1,51 @@
+From 8e98b5bbf2127131f968a5d864f86e8443505639 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <pvorel@suse.cz>
+Date: Wed, 22 Jul 2020 12:06:28 +0200
+Subject: [PATCH] pcr_tss: Fix compilation for old compilers
+
+pcr_tss.c: In function 'pcr_selections_match':
+pcr_tss.c:73:2: error: 'for' loop initial declarations are only allowed in C99 mode
+  for (int i = 0; i < a->count; i++) {
+  ^
+pcr_tss.c:73:2: note: use option -std=c99 or -std=gnu99 to compile your code
+pcr_tss.c:78:3: error: 'for' loop initial declarations are only allowed in C99 mode
+   for (int j = 0; j < a->pcrSelections[i].sizeofSelect; j++) {
+   ^
+
+Fixes: 03f99ea ("ima-evm-utils: Add support for Intel TSS2 for PCR
+reading")
+
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[ upstream status: https://lore.kernel.org/linux-integrity/1595416105.5311.33.camel at linux.ibm.com/T/#t ]
+---
+ src/pcr_tss.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/pcr_tss.c b/src/pcr_tss.c
+index 11b247b..feb1ff7 100644
+--- a/src/pcr_tss.c
++++ b/src/pcr_tss.c
+@@ -68,14 +68,17 @@ int tpm2_pcr_supported(void)
+ 
+ static int pcr_selections_match(TPML_PCR_SELECTION *a, TPML_PCR_SELECTION *b)
+ {
++	int i, j;
++
+ 	if (a->count != b->count)
+ 		return 0;
+-	for (int i = 0; i < a->count; i++) {
++
++	for (i = 0; i < a->count; i++) {
+ 		if (a->pcrSelections[i].hash != b->pcrSelections[i].hash)
+ 			return 0;
+ 		if (a->pcrSelections[i].sizeofSelect != b->pcrSelections[i].sizeofSelect)
+ 			return 0;
+-		for (int j = 0; j < a->pcrSelections[i].sizeofSelect; j++) {
++		for (j = 0; j < a->pcrSelections[i].sizeofSelect; j++) {
+ 			if (a->pcrSelections[i].pcrSelect[j] != b->pcrSelections[i].pcrSelect[j])
+ 				return 0;
+ 		}
+-- 
+2.27.0
+
-- 
2.27.0
