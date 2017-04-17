From: Semyon Kolganov <semenak94@mail.ru>
Date: Mon, 17 Apr 2017 16:59:48 +0300
Subject: [Buildroot] [PATCH] mpir: fix build failure
In-Reply-To: <mpir: fix build failure>
References: <mpir: fix build failure>
Message-ID: <1492437588-19728-1-git-send-email-semenak94@mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Semyon Kolganov <semenak94@mail.ru>
---
 package/mpir/Config.in | 5 +++++
 package/mpir/mpir.mk   | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/package/mpir/Config.in b/package/mpir/Config.in
index da4cc9f..4f7fa65 100644
--- a/package/mpir/Config.in
+++ b/package/mpir/Config.in
@@ -1,8 +1,13 @@
 config BR2_PACKAGE_MPIR
 	bool "mpir"
+	# asm files in mpn/powerpc64/mode64/* are Abi version 1.
+	depends on !BR2_powerpc64le
 	select BR2_PACKAGE_GMP
 	help
 	  MPIR is a highly optimised library for bignum arithmetic
 	  forked from the GMP bignum library.
 
 	  http://www.mpir.org/
+
+comment "mpir conflicts with powerpc64le"
+	depends on BR2_powerpc64le
diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
index 430d587..b835ca4 100644
--- a/package/mpir/mpir.mk
+++ b/package/mpir/mpir.mk
@@ -12,4 +12,12 @@ MPIR_LICENSE_FILES = COPYING.LIB
 MPIR_INSTALL_STAGING = YES
 MPIR_DEPENDENCIES = gmp host-yasm
 
+ifeq ($(BR2_MIPS_NABI32),y)
+MPIR_CONF_OPTS += ABI=n32
+endif
+
+ifeq ($(BR2_MIPS_NABI64),y)
+MPIR_CONF_OPTS += ABI=n64
+endif
+
 $(eval $(autotools-package))
-- 
2.7.4
