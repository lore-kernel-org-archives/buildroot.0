From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 17 Jan 2018 11:25:57 +0300
Subject: [Buildroot] [PATCH v2] binutils: Allow upstream 2.29 to be chosen
 for ARC
Message-ID: <20180117082557.17026-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>

As of today quite a lot of ARC stuff got merged in upsream
such that we may finally use upstream realease for building
and even running Linux kernel and rootfs built with vanilla
binutils.

Essentially upstream release is still a bit behind our
GitHub-based releases but let's try to use vanilla version
and if we're lucky enough with just a small set of back-ported patches
we'll be able to use vanilla release(s) for everything in Buildroot.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---

Changes v1 -> v2:
 * Use positive logic in binutils.mk for checking if BR2_BINUTILS_VERSION_ARC
   set as suggested by Arnout

 package/binutils/Config.in.host | 11 ++++++++---
 package/binutils/binutils.mk    |  2 +-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 95144c84c9..4a2992a79b 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -2,8 +2,8 @@ comment "Binutils Options"
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_28_X
-	depends on !BR2_arc
+	default BR2_BINUTILS_VERSION_2_28_X if !BR2_arc
+	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 	help
 	  Select the version of binutils you wish to use.
 
@@ -11,18 +11,23 @@ config BR2_BINUTILS_VERSION_2_27_X
 	bool "binutils 2.27"
 	# binutils 2.27 triggers a bug in elf2flt on ARM/noMMU
 	depends on !(BR2_arm && !BR2_USE_MMU)
+	depends on !BR2_arc
 
 config BR2_BINUTILS_VERSION_2_28_X
 	bool "binutils 2.28.1"
+	depends on !BR2_arc
 
 config BR2_BINUTILS_VERSION_2_29_X
 	bool "binutils 2.29.1"
 
+config BR2_BINUTILS_VERSION_ARC
+	bool "binutils arc (2.29)"
+	depends on BR2_arc
 endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2017.09-release"	if BR2_arc
+	default "arc-2017.09-release"	if BR2_BINUTILS_VERSION_ARC
 	default "2.27"		if BR2_BINUTILS_VERSION_2_27_X
 	default "2.28.1"	if BR2_BINUTILS_VERSION_2_28_X
 	default "2.29.1"	if BR2_BINUTILS_VERSION_2_29_X
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index d2bf5b9755..e8029521c2 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -15,7 +15,7 @@ BINUTILS_VERSION = 2.28.1
 endif
 endif # BINUTILS_VERSION
 
-ifeq ($(BR2_arc),y)
+ifeq ($(BR2_BINUTILS_VERSION_ARC),y)
 BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
 BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
-- 
2.11.0
