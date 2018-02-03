From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  3 Feb 2018 18:05:59 +0100
Subject: [Buildroot] [PATCH 2/2] package/wf111: do a direct download
In-Reply-To: <cover.1517677545.git.yann.morin.1998@free.fr>
References: <cover.1517677545.git.yann.morin.1998@free.fr>
Message-ID: <ef05e42aa7a51d33c666507728602993d04344bb.1517677545.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We can now do a download without prior registration, so we can drop the
requirement for a local, pre-downloaded tarball, now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien CORJON <corjon.j@ecagroup.com>
Cc: Antoine T?nart <antoine.tenart@free-electrons.com>
---
 package/wf111/Config.in | 11 -----------
 package/wf111/wf111.mk  |  7 +------
 2 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/package/wf111/Config.in b/package/wf111/Config.in
index 081bd960cb..7b61ea195f 100644
--- a/package/wf111/Config.in
+++ b/package/wf111/Config.in
@@ -19,17 +19,6 @@ config BR2_PACKAGE_WF111
 
 	  https://www.silabs.com/products/wireless/wi-fi/wf111-bluegiga-module
 
-if BR2_PACKAGE_WF111
-
-config BR2_PACKAGE_WF111_TARBALL_PATH
-	string "Local tarball location"
-	help
-	  The WF111 tarball can be retrieved on the Silicon Labs
-	  website after registration. This option specifies the path
-	  where the tarball is locally saved.
-
-endif
-
 comment "wf111 needs a glibc toolchain"
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_ARM_CPU_ARMV5 || BR2_ARM_CPU_ARMV7A || BR2_i386
diff --git a/package/wf111/wf111.mk b/package/wf111/wf111.mk
index 5178944fa3..72526333fd 100644
--- a/package/wf111/wf111.mk
+++ b/package/wf111/wf111.mk
@@ -5,14 +5,9 @@
 ################################################################################
 
 WF111_VERSION = 5-2-2-r3
-WF111_SITE_METHOD = file
-WF111_SITE = $(call qstrip,$(BR2_PACKAGE_WF111_TARBALL_PATH))
+WF111_SITE = https://www.silabs.com/documents/login/software
 WF111_DEPENDENCIES = linux
 
-ifeq ($(BR2_PACKAGE_WF111)$(call qstrip,$(BR2_PACKAGE_WF111_TARBALL_PATH)),y)
-$(error No tarball location specified, check BR2_PACKAGE_WF111_TARBALL_PATH)
-endif
-
 ifeq ($(BR2_ARM_CPU_ARMV7A),y)
 WF111_SOURCE = wf111-linux-driver-$(WF111_VERSION)-armv7-a.tar.gz
 else ifeq ($(BR2_ARM_CPU_ARMV5),y)
-- 
2.14.1
