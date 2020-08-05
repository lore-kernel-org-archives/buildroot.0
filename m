From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 23:23:27 +0200
Subject: [Buildroot] [git commit] package/ima-evm-utils: bump version to 1.3
Message-ID: <20200805215746.4F38C8376E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e94a8c7adc27af5cf8ac338980e9af072c23a19d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

added tpm2-tss as dependency (needed for ima_boot_aggregate cmd for
reading PCR; better to use libtss2-esys and libtss2-rc than require
tsspcrread binary in runtime)

added also sha1 hash from sourceforge

added 2 patches fixing build (both are 1.3 specific)

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...pcr_tss-Fix-compilation-for-old-compilers.patch | 51 ++++++++++++++++++++++
 ...0002-Fix-missing-u-g-id_t-typedef-on-musl.patch | 29 ++++++++++++
 package/ima-evm-utils/Config.in                    |  3 +-
 package/ima-evm-utils/ima-evm-utils.hash           |  5 ++-
 package/ima-evm-utils/ima-evm-utils.mk             |  4 +-
 5 files changed, 87 insertions(+), 5 deletions(-)

diff --git a/package/ima-evm-utils/0001-pcr_tss-Fix-compilation-for-old-compilers.patch b/package/ima-evm-utils/0001-pcr_tss-Fix-compilation-for-old-compilers.patch
new file mode 100644
index 0000000000..079c4e0d22
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
+[ upstream status: 1f4e423 ("pcr_tss: Fix compilation for old compilers") ]
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
diff --git a/package/ima-evm-utils/0002-Fix-missing-u-g-id_t-typedef-on-musl.patch b/package/ima-evm-utils/0002-Fix-missing-u-g-id_t-typedef-on-musl.patch
new file mode 100644
index 0000000000..0596f68170
--- /dev/null
+++ b/package/ima-evm-utils/0002-Fix-missing-u-g-id_t-typedef-on-musl.patch
@@ -0,0 +1,29 @@
+From e74b1c8620ba81682dc6b62bd2783311b99f5bd0 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Wed, 22 Jul 2020 13:10:20 +0200
+Subject: [PATCH] Fix missing {u,g}id_t typedef on musl
+
+Fixes: 273701a ("evmctl - IMA/EVM control tool")
+
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[ upstream status: 7f9a59c ("Fix missing {u,g}id_t typedef on musl") ]
+---
+ src/imaevm.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/imaevm.h b/src/imaevm.h
+index b881d92..923e2e6 100644
+--- a/src/imaevm.h
++++ b/src/imaevm.h
+@@ -46,7 +46,7 @@
+ #include <syslog.h>
+ #include <stdbool.h>
+ #include <errno.h>
+-
++#include <sys/types.h>
+ #include <openssl/rsa.h>
+ 
+ #ifdef USE_FPRINTF
+-- 
+2.27.0
+
diff --git a/package/ima-evm-utils/Config.in b/package/ima-evm-utils/Config.in
index 851e2456bc..6c29c9de28 100644
--- a/package/ima-evm-utils/Config.in
+++ b/package/ima-evm-utils/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_IMA_EVM_UTILS
 	bool "ima-evm-utils"
 	depends on BR2_USE_MMU # keyutils
-	depends on !BR2_STATIC_LIBS # keyutils
+	depends on !BR2_STATIC_LIBS # keyutils, tpm2-tss
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_KEYUTILS
+	select BR2_PACKAGE_TPM2_TSS
 	help
 	  Linux Integrity Measurement Architecture (IMA)
 	  Extended Verification Module (EVM) tools.
diff --git a/package/ima-evm-utils/ima-evm-utils.hash b/package/ima-evm-utils/ima-evm-utils.hash
index 24be627d20..4fe1591f74 100644
--- a/package/ima-evm-utils/ima-evm-utils.hash
+++ b/package/ima-evm-utils/ima-evm-utils.hash
@@ -1,3 +1,4 @@
-# Locally computed
-sha256 ad8471b58c4df29abd51c80d74b1501cfe3289b60d32d1b318618a8fd26c0c0a  ima-evm-utils-1.2.1.tar.gz
+# sha1 from sourceforge, sha256 locally computed
+sha1  8b81f83ddc0e7c863268e76049fa50ad89a04b11  ima-evm-utils-1.3.tar.gz
+sha256 62e90e8dc6b131a4f34a356114cdcb5bef844f110abbdd5d8b53c449aecc609f  ima-evm-utils-1.3.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ima-evm-utils/ima-evm-utils.mk b/package/ima-evm-utils/ima-evm-utils.mk
index b944eda13c..70295643a4 100644
--- a/package/ima-evm-utils/ima-evm-utils.mk
+++ b/package/ima-evm-utils/ima-evm-utils.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-IMA_EVM_UTILS_VERSION = 1.2.1
+IMA_EVM_UTILS_VERSION = 1.3
 IMA_EVM_UTILS_SITE = http://downloads.sourceforge.net/project/linux-ima/ima-evm-utils
 IMA_EVM_UTILS_LICENSE = GPL-2.0
 IMA_EVM_UTILS_LICENSE_FILES = COPYING
-IMA_EVM_UTILS_DEPENDENCIES = host-pkgconf keyutils openssl
+IMA_EVM_UTILS_DEPENDENCIES = host-pkgconf keyutils openssl tpm2-tss
 
 # Tarball doesn't contain configure
 IMA_EVM_UTILS_AUTORECONF = YES
