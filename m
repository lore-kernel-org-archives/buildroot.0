From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  6 May 2019 20:30:11 +0200
Subject: [Buildroot] [PATCH 15/15] package/gcc: enable gcc 9.1 for ork1
 (openrisc)
In-Reply-To: <20190506183011.4856-1-romain.naour@gmail.com>
References: <20190506183011.4856-1-romain.naour@gmail.com>
Message-ID: <20190506183011.4856-16-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openrisc support has been added with gcc 9.1.
Keep for now the old gcc 5 fork for ork1.

https://gcc.gnu.org/gcc-9/changes.html

Tested using qemu_or1k_defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/gcc/Config.in.host | 2 --
 package/gcc/gcc.mk         | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 1d3af73e69..beea1f6cdb 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -71,8 +71,6 @@ config BR2_GCC_VERSION_8_X
 
 config BR2_GCC_VERSION_9_X
 	bool "gcc 9.x"
-	# Broken or unsupported architectures
-	depends on !BR2_or1k
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
 endchoice
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 5901624ea5..e07a453ecc 100644
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
 else
@@ -177,7 +177,7 @@ else
 HOST_GCC_COMMON_CONF_OPTS += --without-isl --without-cloog
 endif
 
-ifeq ($(BR2_arc)$(BR2_or1k),y)
+ifeq ($(BR2_arc)$(BR2_GCC_VERSION_OR1K),y)
 HOST_GCC_COMMON_DEPENDENCIES += host-flex host-bison
 endif
 
-- 
2.14.5
