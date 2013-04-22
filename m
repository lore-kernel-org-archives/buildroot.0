From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Mon, 22 Apr 2013 13:37:28 +0200
Subject: [Buildroot] [PATCH 4/7] arc: Add ARC specific kernel headers
In-Reply-To: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
References: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1366630651-6857-5-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ARC architecture will be on kernel.org from 3.9 onwards. For now
we still need to use a out-of-tree kernel tarball.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 Makefile                                   |    1 +
 toolchain/kernel-headers/Config.in         |   19 ++++++++++++++-----
 toolchain/kernel-headers/kernel-headers.mk |    4 +++-
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 0a91658..8fef492 100644
--- a/Makefile
+++ b/Makefile
@@ -238,6 +238,7 @@ ARCH:=$(call qstrip,$(BR2_ARCH))
 
 KERNEL_ARCH:=$(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 	-e s/i.86/i386/ -e s/sun4u/sparc64/ \
+	-e s/arc.*/arc/ \
 	-e s/arm.*/arm/ -e s/sa110/arm/ \
 	-e s/aarch64/arm64/ \
 	-e s/bfin/blackfin/ \
diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index ec75c34..7db815b 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -7,6 +7,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_3_8
+	default BR2_KERNEL_HEADERS_3_8_ARC	if (BR2_arc || BR2_arceb)
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -17,35 +18,42 @@ choice
 
 	config BR2_KERNEL_HEADERS_3_0
 		bool "Linux 3.0.x kernel headers"
+		depends on !(BR2_arc || BR2_arceb)
 
 	config BR2_KERNEL_HEADERS_3_1
 		bool "Linux 3.1.x kernel headers"
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED && !(BR2_arc || BR2_arceb)
 
 	config BR2_KERNEL_HEADERS_3_2
 		bool "Linux 3.2.x kernel headers"
+		depends on !(BR2_arc || BR2_arceb)
 
 	config BR2_KERNEL_HEADERS_3_3
 		bool "Linux 3.3.x kernel headers"
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED && !(BR2_arc || BR2_arceb)
 
 	config BR2_KERNEL_HEADERS_3_4
 		bool "Linux 3.4.x kernel headers"
+		depends on !(BR2_arc || BR2_arceb)
 
 	config BR2_KERNEL_HEADERS_3_5
 		bool "Linux 3.5.x kernel headers"
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED && !(BR2_arc || BR2_arceb)
 
 	config BR2_KERNEL_HEADERS_3_6
 		bool "Linux 3.6.x kernel headers"
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED && !(BR2_arc || BR2_arceb)
 
 	config BR2_KERNEL_HEADERS_3_7
 		bool "Linux 3.7.x kernel headers"
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED && !(BR2_arc || BR2_arceb)
 
 	config BR2_KERNEL_HEADERS_3_8
 		bool "Linux 3.8.x kernel headers"
+		depends on !(BR2_arc || BR2_arceb)
+	
+	config BR2_KERNEL_HEADERS_3_8_ARC
+		bool "Linux 3.8-arc kernel headers"
 
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
@@ -72,5 +80,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
 	default "3.8.8"		if BR2_KERNEL_HEADERS_3_8
+	default "3.8-arc"	if BR2_KERNEL_HEADERS_3_8_ARC
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/kernel-headers.mk b/toolchain/kernel-headers/kernel-headers.mk
index adf7bc4..7c4910f 100644
--- a/toolchain/kernel-headers/kernel-headers.mk
+++ b/toolchain/kernel-headers/kernel-headers.mk
@@ -26,7 +26,9 @@ SUBLEVEL:=$(if $(SUBLEVEL),.$(SUBLEVEL),)
 EXTRAVERSION:=$(if $(EXTRAVERSION),.$(EXTRAVERSION),)
 
 LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL)$(SUBLEVEL)$(EXTRAVERSION)
-ifeq ($(findstring x2.6.,x$(DEFAULT_KERNEL_HEADERS)),x2.6.)
+ifeq ($(findstring arc,x$(DEFAULT_KERNEL_HEADERS)),arc)
+LINUX_HEADERS_SITE:=$(BR2_ARC_SITE)
+else ifeq ($(findstring x2.6.,x$(DEFAULT_KERNEL_HEADERS)),x2.6.)
 LINUX_HEADERS_SITE:=$(BR2_KERNEL_MIRROR:/=)/linux/kernel/v2.6/
 else
 LINUX_HEADERS_SITE:=$(BR2_KERNEL_MIRROR:/=)/linux/kernel/v3.x/
-- 
1.7.0.4
