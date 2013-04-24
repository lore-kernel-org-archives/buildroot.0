From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Wed, 24 Apr 2013 12:13:21 +0200
Subject: [Buildroot] [PATCH v2 10/12] kernel-headers: Add 3.9-rc8 headers to
	make ARC work
In-Reply-To: <1366798403-6984-1-git-send-email-mjonker@synopsys.com>
References: <1366798403-6984-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1366798403-6984-11-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add 3.9 release candidate kernel, so that the ARC architecture builds.
Also make sure that older kernels are not selected for ARC.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 Makefile                           |    1 +
 toolchain/kernel-headers/Config.in |   18 +++++++++++++-----
 2 files changed, 14 insertions(+), 5 deletions(-)

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
index ec75c34..1c972f3 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -17,35 +17,42 @@ choice
 
 	config BR2_KERNEL_HEADERS_3_0
 		bool "Linux 3.0.x kernel headers"
+		depends on !BR2_arc
 
 	config BR2_KERNEL_HEADERS_3_1
 		bool "Linux 3.1.x kernel headers"
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED && !BR2_arc
 
 	config BR2_KERNEL_HEADERS_3_2
 		bool "Linux 3.2.x kernel headers"
+		depends on !BR2_arc
 
 	config BR2_KERNEL_HEADERS_3_3
 		bool "Linux 3.3.x kernel headers"
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED && !BR2_arc
 
 	config BR2_KERNEL_HEADERS_3_4
 		bool "Linux 3.4.x kernel headers"
+		depends on !BR2_arc
 
 	config BR2_KERNEL_HEADERS_3_5
 		bool "Linux 3.5.x kernel headers"
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED && !BR2_arc
 
 	config BR2_KERNEL_HEADERS_3_6
 		bool "Linux 3.6.x kernel headers"
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED && !BR2_arc
 
 	config BR2_KERNEL_HEADERS_3_7
 		bool "Linux 3.7.x kernel headers"
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED && !BR2_arc
 
 	config BR2_KERNEL_HEADERS_3_8
 		bool "Linux 3.8.x kernel headers"
+		depends on !BR2_arc
+	
+	config BR2_KERNEL_HEADERS_3_9
+		bool "Linux 3.9.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
@@ -72,5 +79,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.6.11"	if BR2_KERNEL_HEADERS_3_6
 	default "3.7.10"	if BR2_KERNEL_HEADERS_3_7
 	default "3.8.8"		if BR2_KERNEL_HEADERS_3_8
+	default "3.9-rc8"	if BR2_KERNEL_HEADERS_3_9
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.7.0.4
