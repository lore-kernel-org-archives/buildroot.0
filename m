From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 14 Nov 2018 21:42:24 +0100
Subject: [Buildroot] [PATCH 1/1] uclibc-ng-test: fix build with glibc 2.28
Message-ID: <20181114204224.27123-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since glibc 2.28
(https://savannah.gnu.org/forum/forum.php?forum_id=9205), the obsolete
functions encrypt, encrypt_r, setkey, setkey_r, cbc_crypt, ecb_crypt,
and des_setparity are no longer available to newly linked binaries, and
the headers <rpc/des_crypt.h> and <rpc/rpc_des.h> are no longer
installed. These functions encrypted and decrypted data with the DES
block cipher, which is no longer considered secure. Software that still
uses these functions should switch to a modern cryptography library,
such as libgcrypt.

So add a NO_CRYPT variable to disable test/crypt

Fixes:
 - http://autobuild.buildroot.org/results/158438debb0ce313b012b871e199bed42ba38294

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...Add-NO_CRYPT-to-fix-build-with-glibc-2.28.patch | 43 ++++++++++++++++++++++
 package/uclibc-ng-test/uclibc-ng-test.mk           |  5 +++
 2 files changed, 48 insertions(+)
 create mode 100644 package/uclibc-ng-test/0002-Add-NO_CRYPT-to-fix-build-with-glibc-2.28.patch

diff --git a/package/uclibc-ng-test/0002-Add-NO_CRYPT-to-fix-build-with-glibc-2.28.patch b/package/uclibc-ng-test/0002-Add-NO_CRYPT-to-fix-build-with-glibc-2.28.patch
new file mode 100644
index 0000000000..34760f3dfb
--- /dev/null
+++ b/package/uclibc-ng-test/0002-Add-NO_CRYPT-to-fix-build-with-glibc-2.28.patch
@@ -0,0 +1,43 @@
+From 164b1b5592ef6ad9fceba06bdfa31787e9c0329d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 14 Nov 2018 21:26:54 +0100
+Subject: [PATCH] Add NO_CRYPT to fix build with glibc 2.28
+
+Since glibc 2.28
+(https://savannah.gnu.org/forum/forum.php?forum_id=9205), the obsolete
+functions encrypt, encrypt_r, setkey, setkey_r, cbc_crypt, ecb_crypt,
+and des_setparity are no longer available to newly linked binaries, and
+the headers <rpc/des_crypt.h> and <rpc/rpc_des.h> are no longer
+installed. These functions encrypted and decrypted data with the DES
+block cipher, which is no longer considered secure. Software that still
+uses these functions should switch to a modern cryptography library,
+such as libgcrypt.
+
+So add a NO_CRYPT variable to disable test/crypt
+
+Fixes:
+ - http://autobuild.buildroot.org/results/158438debb0ce313b012b871e199bed42ba38294
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ test/Makefile | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/test/Makefile b/test/Makefile
+index 5a136ea..6690d25 100644
+--- a/test/Makefile
++++ b/test/Makefile
+@@ -39,6 +39,10 @@ ifeq ($(NO_MATH),1)
+ DIRS := $(filter-out math,$(DIRS))
+ endif
+ 
++ifeq ($(NO_CRYPT),1)
++DIRS := $(filter-out crypt,$(DIRS))
++endif
++
+ test check all: run
+ 
+ run: subdirs_run
+-- 
+2.14.1
+
diff --git a/package/uclibc-ng-test/uclibc-ng-test.mk b/package/uclibc-ng-test/uclibc-ng-test.mk
index 0e6433c83d..aeea799d88 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.mk
+++ b/package/uclibc-ng-test/uclibc-ng-test.mk
@@ -13,6 +13,11 @@ UCLIBC_NG_TEST_LICENSE_FILES = COPYING.LIB
 # regular testing is possible
 UCLIBC_NG_TEST_MAKE_ENV += NO_MATH=1
 
+# obsolete encrypt and setkey functions are not available since glibc 2.28
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
+UCLIBC_NG_TEST_MAKE_ENV += NO_CRYPT=1
+endif
+
 # locale tests are not compatible with musl, yet
 ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
 UCLIBC_NG_TEST_MAKE_ENV += NO_LOCALE=1
-- 
2.14.1
