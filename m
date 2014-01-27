From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 27 Jan 2014 15:51:37 -0600
Subject: [Buildroot] [PATCH v2] gcc: coexist upstream with vendor git
	releases for mb and arc
Message-ID: <1390859507-31670-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch makes it easier to have both upstream gcc and vendor patch series
for microblaze and arc.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/gcc/Config.in.host | 4 ++--
 package/gcc/gcc.mk         | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 186ba80..044cd0f 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -96,8 +96,8 @@ config BR2_GCC_VERSION
 	default "4.6.4"     if BR2_GCC_VERSION_4_6_X
 	default "4.7.3"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.2"     if BR2_GCC_VERSION_4_8_X
-	default "7466697995233cc3aab5b9427bf843e3c7fabd80" if BR2_GCC_VERSION_4_8_ARC
-	default "b93bb009e021aba64dd4b8cdb0bbc5a176c55543" if BR2_GCC_VERSION_4_9_MICROBLAZE
+	default "arc-git"   if BR2_GCC_VERSION_4_8_ARC
+	default "mb-git"   if BR2_GCC_VERSION_4_9_MICROBLAZE
 	default BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 236297d..dd99604 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -19,10 +19,12 @@ ifneq ($(GCC_SNAP_DATE),)
 GCC_SITE = ftp://gcc.gnu.org/pub/gcc/snapshots/$(GCC_SNAP_DATE)/
 else ifeq ($(findstring avr32,$(GCC_VERSION)),avr32)
 GCC_SITE = ftp://www.at91.com/pub/buildroot/
-else ifeq ($(BR2_arc),y)
+else ifeq ($(findstring git,$(GCC_VERSION))$(BR2_arc),gity)
+GCC_VERSION = 7466697995233cc3aab5b9427bf843e3c7fabd80
 GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
-else ifeq ($(BR2_microblaze),y)
+else ifeq ($(findstring git,$(GCC_VERSION))$(BR2_microblaze),gity)
+GCC_VERSION = b93bb009e021aba64dd4b8cdb0bbc5a176c55543
 GCC_SITE = $(call github,Xilinx,gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else
-- 
1.8.3.2
