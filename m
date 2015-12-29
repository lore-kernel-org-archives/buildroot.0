From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Dec 2015 23:51:22 +0100
Subject: [Buildroot] [git commit] package/linux-fusion: require kernel
	modules from Kconfig
Message-ID: <20151229225703.34A67826DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7aa4b269e1a375fc25977f926234beb8ddf71d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And reorder 'depends' after 'bool'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
