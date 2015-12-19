From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 19 Dec 2015 19:14:45 +0100
Subject: [Buildroot] [PATCH 6/7] toolchain-external: Synopsys ARC: support
	only one version
In-Reply-To: <1450548886-21937-1-git-send-email-romain.naour@openwide.fr>
References: <1450548886-21937-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1450548886-21937-6-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See the conclusion about external toolchains during the Buildroot
meeting [1]:
"In the future, we stick to a single external toolchain version. The
Kconfig symbol should not encode the version (avoid legacy handling)"

[1] http://elinux.org/index.php?title=Buildroot:DeveloperDaysELCE2015#Report

Rename the Kconfig symbol even if this toolchain is marked as broken.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 toolchain/toolchain-external/Config.in             | 6 +++---
 toolchain/toolchain-external/toolchain-external.mk | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index fa4b08b..5a1dca0 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -467,7 +467,7 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
 
 	  http://musl.codu.org/
 
-config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12
+config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	bool "Synopsys ARC 2014.12 toolchain"
 	depends on BR2_arc
 	depends on BR2_HOSTARCH = "x86_64"
@@ -538,8 +538,8 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
-	default "arc-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12 && BR2_arcle
-	default "arceb-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12 && BR2_arceb
+	default "arc-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC && BR2_arcle
+	default "arceb-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC && BR2_arceb
 	default "arm-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	default "armeb-linux-gnueabihf"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index f408bdb..3c46d2b 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -367,7 +367,7 @@ TOOLCHAIN_EXTERNAL_SOURCE = crossx86-powerpc-linux-musl-$(TOOLCHAIN_EXTERNAL_VER
 else ifeq ($(BR2_x86_64),y)
 TOOLCHAIN_EXTERNAL_SOURCE = crossx86-x86_64-linux-musl-$(TOOLCHAIN_EXTERNAL_VERSION).tar.xz
 endif
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12),y)
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC),y)
 TOOLCHAIN_EXTERNAL_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2014.12
 ifeq ($(BR2_arc750d)$(BR2_arc770d),y)
 TOOLCHAIN_EXTERNAL_SYNOPSYS_CORE = arc700
-- 
2.4.3
