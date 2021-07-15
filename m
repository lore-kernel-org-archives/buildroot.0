From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Jul 2021 23:29:17 +0200
Subject: [Buildroot] [PATCH] boot/uboot: add missing dependency to
 host-pkgconf
Message-ID: <20210715212917.484349-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Commit 2eaa6d0f3629 (boot/uboot: fix uboot building host tools on x86
architecture) added use of $(PKG_CONFIG_HOST_BINARY), but forgot to add
the corresponding build-ordr dependency.

Add this missing depenency now.

Additionally, the associated test had an explicit host pkgconf enbled in
its configuration. This is superfluous now that uboot properly depends
on host-pkgconf, so drop that from the test.

Note: it hapenned to work, because host-pkgconf, when explicitly enabled
in the configuration, and without per-package directories, would build
before uboot and thus be available. This would fail with PPD, though,
and thus would break for TLPB.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Kory Maincent <kory.maincent@bootlin.com>
---
 boot/uboot/uboot.mk                                           | 2 +-
 support/testing/tests/package/test_uboot_openssl_pkgconfig.py | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a7eaedb06f..a8a8bedc01 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -17,7 +17,7 @@ UBOOT_CPE_ID_PRODUCT = u-boot
 UBOOT_INSTALL_IMAGES = YES
 
 # u-boot 2020.01+ needs make 4.0+
-UBOOT_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
+UBOOT_DEPENDENCIES = host-pkgconf $(BR2_MAKE_HOST_DEPENDENCY)
 UBOOT_MAKE = $(BR2_MAKE)
 
 ifeq ($(UBOOT_VERSION),custom)
diff --git a/support/testing/tests/package/test_uboot_openssl_pkgconfig.py b/support/testing/tests/package/test_uboot_openssl_pkgconfig.py
index de2d83f5b8..55a45f44fc 100644
--- a/support/testing/tests/package/test_uboot_openssl_pkgconfig.py
+++ b/support/testing/tests/package/test_uboot_openssl_pkgconfig.py
@@ -12,7 +12,6 @@ class TestUbootOpensslPkgConfig(infra.basetest.BRTest):
         BR2_TARGET_UBOOT=y
         BR2_TARGET_UBOOT_BOARD_DEFCONFIG="efi-x86_payload64"
         BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-        BR2_PACKAGE_HOST_PKGCONF=y
         """
 
     def test_run(self):
-- 
2.25.1
