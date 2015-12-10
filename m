From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Dec 2015 19:53:14 +0100
Subject: [Buildroot] [PATCH 2/7] package/linux-fusion: require kernel
	modules from Kconfig
In-Reply-To: <cover.1449771844.git.yann.morin.1998@free.fr>
References: <cover.1449771844.git.yann.morin.1998@free.fr>
Message-ID: <0d83b1082db086fe18ae44a30b27735586a8a89a.1449771844.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And reorder 'depends' after 'bool'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-fusion/Config.in       | 3 ++-
 package/linux-fusion/linux-fusion.mk | 6 ------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/linux-fusion/Config.in b/package/linux-fusion/Config.in
index cdc1dd2..ed8bd6a 100644
--- a/package/linux-fusion/Config.in
+++ b/package/linux-fusion/Config.in
@@ -2,8 +2,9 @@ comment "linux-fusion needs a Linux kernel to be built"
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_LINUX_FUSION
-	depends on BR2_LINUX_KERNEL
 	bool "linux-fusion communication layer for DirectFB multi"
+	depends on BR2_LINUX_KERNEL
+	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
 	help
 	  DirectFB Communication Layer allowing multiple DirectFB
 	  applications to run concurrently
diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index ba4bb31..35ed28e 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -12,12 +12,6 @@ LINUX_FUSION_DEPENDENCIES = linux
 LINUX_FUSION_LICENSE = GPLv2+
 LINUX_FUSION_LICENSE_FILES = debian/copyright
 
-# We're building a kernel module without using the kernel-module infra,
-# so we need to tell we want module support in the kernel
-ifeq ($(BR2_PACKAGE_LINUX_FUSION),y)
-LINUX_NEEDS_MODULES = y
-endif
-
 LINUX_FUSION_ETC_DIR = $(TARGET_DIR)/etc/udev/rules.d
 
 LINUX_FUSION_MAKE_OPTS = \
-- 
1.9.1
