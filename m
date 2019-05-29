From: guoren at kernel.org <guoren@kernel.org>
Date: Wed, 29 May 2019 15:18:43 +0800
Subject: [Buildroot] [PATCH V3 05/10] package/binutils: Add C-SKY support
In-Reply-To: <1559114328-23357-1-git-send-email-guoren@kernel.org>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
Message-ID: <1559114328-23357-6-git-send-email-guoren@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Guo Ren <ren_guo@c-sky.com>

Add binutils build for C-SKY Architecture.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 package/binutils/Config.in.host | 11 ++++++++++-
 package/binutils/binutils.hash  |  2 ++
 package/binutils/binutils.mk    |  7 +++++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index c3c3beb..d2ca8af 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -7,28 +7,37 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_31_X if !BR2_arc
+	default BR2_BINUTILS_VERSION_2_31_X if !BR2_arc && !BR2_csky
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
+	default BR2_BINUTILS_VERSION_CSKY if BR2_csky
 	help
 	  Select the version of binutils you wish to use.
 
 config BR2_BINUTILS_VERSION_2_30_X
 	bool "binutils 2.30"
+	depends on !BR2_csky
 
 config BR2_BINUTILS_VERSION_2_31_X
 	bool "binutils 2.31.1"
+	depends on !BR2_csky
 
 config BR2_BINUTILS_VERSION_2_32_X
 	bool "binutils 2.32"
+	depends on !BR2_csky
 
 config BR2_BINUTILS_VERSION_ARC
 	bool "binutils arc (2.31)"
 	depends on BR2_arc
+
+config BR2_BINUTILS_VERSION_CSKY
+	bool "binutils csky"
+	depends on BR2_csky
 endchoice
 
 config BR2_BINUTILS_VERSION
 	string
 	default "arc-2018.09-release"	if BR2_BINUTILS_VERSION_ARC
+	default "c66d8bbcebfddf713b2b436e1b135e6b125a55a5" if BR2_BINUTILS_VERSION_CSKY
 	default "2.30"		if BR2_BINUTILS_VERSION_2_30_X
 	default "2.31.1"	if BR2_BINUTILS_VERSION_2_31_X
 	default "2.32"		if BR2_BINUTILS_VERSION_2_32_X
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 039e368..9f8b419 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -5,3 +5,5 @@ sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724a
 
 # Locally calculated (fetched from Github)
 sha512  a96dfcea6064fcd1aac1333ac0d631491bed8b0be9bdcf62f1447909c8f30d2cb8d9323ffeb7c9ad6b326ecddb72e3d28281684e73343189d0a4a37a11aef62f  binutils-gdb-arc-2018.09-release.tar.gz
+# Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
+sha512  979552d4b3a4f31e9f3b9a7027321bd4eb3ac6c2d8deac1720e94e54f81d736db09c53c5d87c301010e307b64127e14400a036c7a35e5d63a954a4edd9cc8e2c  binutils-c66d8bbcebfddf713b2b436e1b135e6b125a55a5.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index c70ba13..6d2b710 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -20,6 +20,13 @@ BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,
 BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
 endif
+
+ifeq ($(BR2_csky),y)
+BINUTILS_SITE = $(call github,c-sky,binutils-gdb,$(BINUTILS_VERSION))
+BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
+BINUTILS_FROM_GIT = y
+endif
+
 BINUTILS_SITE ?= $(BR2_GNU_MIRROR)/binutils
 BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.xz
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
-- 
2.7.4
