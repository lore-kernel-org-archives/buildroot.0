From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 11 Jun 2019 12:29:57 +0200
Subject: [Buildroot] [PATCH v3 15/15] package/gcc: enable gcc 9.1 for ork1
 (openrisc)
In-Reply-To: <20190611102957.7145-1-giulio.benetti@micronovasrl.com>
References: <20190611102957.7145-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190611102957.7145-16-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@gmail.com>

openrisc support has been added with gcc 9.1.
Keep for now the old gcc 5 fork for ork1.

https://gcc.gnu.org/gcc-9/changes.html

Tested using qemu_or1k_defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
v3: rebase patch on top of master branch sha1:
    04efb17c863606cdbc2405d01c3d48d6868c5245
---
 package/gcc/Config.in.host | 2 --
 package/gcc/gcc.mk         | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index f27ca4635f..443908f3f8 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -86,8 +86,6 @@ config BR2_GCC_VERSION_8_X
 
 config BR2_GCC_VERSION_9_X
 	bool "gcc 9.x"
-	# Broken or unsupported architectures
-	depends on !BR2_or1k
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
 endchoice
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index abc29c7df0..46ad16df13 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -13,7 +13,7 @@ GCC_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
 ifeq ($(BR2_GCC_VERSION_ARC),y)
 GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
-else ifeq ($(BR2_or1k),y)
+else ifeq ($(BR2_GCC_VERSION_OR1K),y)
 GCC_SITE = $(call github,openrisc,or1k-gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else ifeq ($(BR2_csky),y)
@@ -180,7 +180,7 @@ else
 HOST_GCC_COMMON_CONF_OPTS += --without-isl --without-cloog
 endif
 
-ifeq ($(BR2_arc)$(BR2_or1k),y)
+ifeq ($(BR2_arc)$(BR2_GCC_VERSION_OR1K),y)
 HOST_GCC_COMMON_DEPENDENCIES += host-flex host-bison
 endif
 
-- 
2.17.1
