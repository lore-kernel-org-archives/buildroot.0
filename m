From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Thu,  2 May 2013 21:51:28 +0200
Subject: [Buildroot] [PATCH v4 07/12] arc: Add support for ARC-specific
	uClibc
In-Reply-To: <1367524293-32081-1-git-send-email-mjonker@synopsys.com>
References: <1367524293-32081-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1367524293-32081-8-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 toolchain/uClibc/Config.in              |   10 ++++++++--
 toolchain/uClibc/uClibc-snapshot.config |    2 ++
 toolchain/uClibc/uclibc.mk              |    4 ++++
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index b98e2e8..316d006 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -16,12 +16,16 @@ choice
 
 	config BR2_UCLIBC_VERSION_0_9_32
 		bool "uClibc 0.9.32.x"
-		depends on !(BR2_avr32 || BR2_sh || BR2_xtensa)
+		depends on !(BR2_arc || BR2_avr32 || BR2_sh || BR2_xtensa)
 
 	config BR2_UCLIBC_VERSION_0_9_33
 		bool "uClibc 0.9.33.x"
-		depends on !BR2_xtensa
+		depends on !(BR2_arc || BR2_xtensa)
 
+	config BR2_UCLIBC_VERSION_0_9_33_ARC
+		bool "uClibc 0.9.33.x-arc"
+		depends on BR2_arc
+	
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
 
@@ -39,6 +43,7 @@ config BR2_UCLIBC_VERSION_STRING
 	default 0.9.31.1	if BR2_UCLIBC_VERSION_0_9_31
 	default 0.9.32.1	if BR2_UCLIBC_VERSION_0_9_32
 	default 0.9.33.2	if BR2_UCLIBC_VERSION_0_9_33
+	default 0.9.33-arc	if BR2_UCLIBC_VERSION_0_9_33_ARC
 	default $BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
@@ -46,6 +51,7 @@ config BR2_UCLIBC_CONFIG
 	default "toolchain/uClibc/uClibc-0.9.31.config" if BR2_UCLIBC_VERSION_0_9_31
 	default "toolchain/uClibc/uClibc-0.9.32.config" if BR2_UCLIBC_VERSION_0_9_32
 	default "toolchain/uClibc/uClibc-0.9.33.config" if BR2_UCLIBC_VERSION_0_9_33
+	default "toolchain/uClibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_0_9_33_ARC
 	default "toolchain/uClibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_SNAPSHOT
 	help
 	  Some people may wish to use their own modified uClibc configuration
diff --git a/toolchain/uClibc/uClibc-snapshot.config b/toolchain/uClibc/uClibc-snapshot.config
index 71fa472..cb6258d 100644
--- a/toolchain/uClibc/uClibc-snapshot.config
+++ b/toolchain/uClibc/uClibc-snapshot.config
@@ -4,6 +4,7 @@
 # Fri Jul  9 22:31:59 2010
 #
 # TARGET_alpha is not set
+# TARGET_arc is not set
 # TARGET_arm is not set
 # TARGET_avr32 is not set
 # TARGET_bfin is not set
@@ -16,6 +17,7 @@
 # TARGET_i960 is not set
 # TARGET_ia64 is not set
 # TARGET_m68k is not set
+# TARGET_metag is not set
 # TARGET_microblaze is not set
 # TARGET_mips is not set
 # TARGET_nios is not set
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 2249651..1629e76 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -17,6 +17,9 @@ UCLIBC_VERSION:=$(call qstrip,$(BR2_UCLIBC_VERSION_STRING))
 ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 UCLIBC_SITE:=http://www.uclibc.org/downloads/snapshots
 UCLIBC_DIR:=$(TOOLCHAIN_DIR)/uClibc
+else ifeq ($(findstring arc,$(UCLIBC_VERSION)),arc)
+UCLIBC_SITE:=$(BR2_ARC_SITE)
+UCLIBC_DIR:=$(TOOLCHAIN_DIR)/uClibc-$(UCLIBC_VERSION)
 else
 UCLIBC_SITE:=http://www.uclibc.org/downloads
 UCLIBC_DIR:=$(TOOLCHAIN_DIR)/uClibc-$(UCLIBC_VERSION)
@@ -31,6 +34,7 @@ UCLIBC_TARGET_ARCH:=$(shell $(SHELL) -c "echo $(ARCH) | sed \
 		-e 's/-.*//' \
 		-e 's/i.86/i386/' \
 		-e 's/sparc.*/sparc/' \
+		-e 's/arc.*/arc/g' \
 		-e 's/arm.*/arm/g' \
 		-e 's/m68k.*/m68k/' \
 		-e 's/ppc/powerpc/g' \
-- 
1.7.0.4
