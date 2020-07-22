From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 22 Jul 2020 21:35:30 +0200
Subject: [Buildroot] [PATCH 1/3] package/ima-evm-utils: bump version to 1.3
Message-ID: <20200722193532.32150-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

added tpm2-tss as dependency (needed for ima_boot_aggregate cmd for
reading PCR; better to use libtss2-esys and libtss2-rc than require
tsspcrread binary in runtime)

added also sha1 hash from sourceforge

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/ima-evm-utils/Config.in          | 3 ++-
 package/ima-evm-utils/ima-evm-utils.hash | 5 +++--
 package/ima-evm-utils/ima-evm-utils.mk   | 4 ++--
 3 files changed, 7 insertions(+), 5 deletions(-)

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
-- 
2.27.0
