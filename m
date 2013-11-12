From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue, 12 Nov 2013 11:31:41 -0600
Subject: [Buildroot] [PATCH v2 1/5] binutils: add microblaze internal
	toolchain
In-Reply-To: <1384277505-11503-1-git-send-email-spenser@gillilanding.com>
References: <1384277505-11503-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1384277505-11503-2-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/binutils/Config.in.host |    2 ++
 package/binutils/binutils.mk    |    5 +++++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 8f19597..e43261b 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -3,6 +3,7 @@ comment "Binutils Options"
 choice
 	prompt "Binutils Version"
 	depends on !BR2_arc
+	depends on !BR2_microblaze
 	default BR2_BINUTILS_VERSION_2_21 if (BR2_mips || BR2_mipsel || BR2_sh)
 	default BR2_BINUTILS_VERSION_2_22
 	help
@@ -45,6 +46,7 @@ config BR2_BINUTILS_VERSION
 	string
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
 	default "2.23.2-arc"	if BR2_arc
+	default "2.24.51-microblaze" if BR2_microblaze
 	default "2.20.1"	if BR2_BINUTILS_VERSION_2_20_1
 	default "2.21"		if BR2_BINUTILS_VERSION_2_21
 	default "2.21.1"	if BR2_BINUTILS_VERSION_2_21_1
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index f1723b2..0d809c1 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -29,6 +29,11 @@ endif
 ifeq ($(BR2_arc),y)
 BINUTILS_SITE = $(BR2_ARC_SITE)
 endif
+ifeq ($(BR2_microblaze),y)
+BINUTILS_VERSION = 8351467c933d277ebea0c8d99ad2b65b5f7b6bc2
+BINUTILS_SITE = http://github.com/Xilinx/binutils/tarball/$(BINUTILS_VERSION)
+BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
+endif
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
 BINUTILS_INSTALL_STAGING = YES
 BINUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
-- 
1.7.1
