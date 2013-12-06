From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2013 22:40:12 +0100
Subject: [Buildroot] [git commit] binutils: arc: Use git instead of website
Message-ID: <20131206215055.E00499BF34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=674930bed44a7746d1dd58fef32b28bea263cf73
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host |    2 +-
 package/binutils/binutils.mk    |    8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 63830fb..ef833ec 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -48,7 +48,7 @@ endchoice
 config BR2_BINUTILS_VERSION
 	string
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
-	default "2.23.2-arc"	if BR2_arc
+	default "0c824ba511fa9b028220eb3c39b566af89ac9dda" if BR2_arc
 	default "2.20.1"	if BR2_BINUTILS_VERSION_2_20_1
 	default "2.21"		if BR2_BINUTILS_VERSION_2_21
 	default "2.21.1"	if BR2_BINUTILS_VERSION_2_21_1
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index b3ccee2..3c14849 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -18,17 +18,17 @@ endif
 
 ifeq ($(BINUTILS_VERSION),2.23)
 BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
-else
-BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.bz2
 endif
 
-BINUTILS_SITE = $(BR2_GNU_MIRROR)/binutils
 ifeq ($(ARCH),avr32)
 BINUTILS_SITE = ftp://www.at91.com/pub/buildroot
 endif
 ifeq ($(BR2_arc),y)
-BINUTILS_SITE = $(BR2_ARC_SITE)
+BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils,$(BINUTILS_VERSION))
+BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
 endif
+BINUTILS_SITE ?= $(BR2_GNU_MIRROR)/binutils
+BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.bz2
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
 BINUTILS_INSTALL_STAGING = YES
 BINUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
