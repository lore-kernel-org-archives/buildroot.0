From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Tue, 12 Nov 2013 14:26:16 +0100
Subject: [Buildroot] [PATCH 3/7] gcc: arc: Download from github instead of
	Synopsys website
In-Reply-To: <1384262780-12743-1-git-send-email-mjonker@synopsys.com>
References: <1384262780-12743-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1384262780-12743-4-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The github release mechanism only supports .tar.gz, hence the ugly
GCC_UNPACK variable.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/gcc/Config.in.host |    2 +-
 package/gcc/gcc.mk         |   11 +++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 41c1213..b762411 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -90,7 +90,7 @@ config BR2_GCC_VERSION
 	default "4.6.4"     if BR2_GCC_VERSION_4_6_X
 	default "4.7.3"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.2"     if BR2_GCC_VERSION_4_8_X
-	default "4.8-arc"   if BR2_GCC_VERSION_4_8_ARC
+	default "arc-4.8-R2-rc1"   if BR2_GCC_VERSION_4_8_ARC
 	default BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 41600ef..79fe4ef 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -19,13 +19,16 @@ ifneq ($(GCC_SNAP_DATE),)
 GCC_SITE = ftp://gcc.gnu.org/pub/gcc/snapshots/$(GCC_SNAP_DATE)/
 else ifeq ($(findstring avr32,$(GCC_VERSION)),avr32)
 GCC_SITE = ftp://www.at91.com/pub/buildroot/
-else ifeq ($(findstring arc,$(GCC_VERSION)),arc)
-GCC_SITE = $(BR2_ARC_SITE)
+else ifeq ($(BR2_arc),y)
+GCC_SITE = http://github.com/foss-for-synopsys-dwc-arc-processors/gcc/archive/
+GCC_SOURCE = $(GCC_VERSION).tar.gz
+GCC_UNPACK = $(ZCAT)
 else
 GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
 endif
 
-GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
+GCC_UNPACK ?= $(BZCAT)
+GCC_SOURCE ?= gcc-$(GCC_VERSION).tar.bz2
 
 #
 # Xtensa special hook
@@ -60,7 +63,7 @@ endef
 #
 
 define HOST_GCC_EXTRACT_CMDS
-	$(BZCAT) $(DL_DIR)/$(GCC_SOURCE) | \
+	$(GCC_UNPACK) $(DL_DIR)/$(GCC_SOURCE) | \
 		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) \
 		--exclude='libjava/*' \
 		--exclude='libgo/*' \
-- 
1.7.9.5
