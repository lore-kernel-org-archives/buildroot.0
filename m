From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Mar 2015 23:01:27 +0100
Subject: [Buildroot] [PATCHv2 4/5] uclibc: update to latest release 1.0.1
In-Reply-To: <1426111288-20529-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1426111288-20529-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1426111288-20529-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Waldemar Brodkorb <wbx@openadk.org>

Changes are here http://uclibc-ng.org/pipermail/devel/2015-March/000114.html

Buildroot related are SPARC and XTENSA non-threading builds
and static linking fixes for pthread apps like cdrkit.
Add a hotfix for MIPS compile with older GCC.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...selection-better-do-it-in-your-build-syst.patch | 60 ++++++++++++++++++++++
 package/uclibc/Config.in                           |  2 +-
 package/uclibc/uClibc-ng.config                    |  2 +-
 3 files changed, 62 insertions(+), 2 deletions(-)
 create mode 100644 package/uclibc/1.0.1/0001-remove-NAN-selection-better-do-it-in-your-build-syst.patch

diff --git a/package/uclibc/1.0.1/0001-remove-NAN-selection-better-do-it-in-your-build-syst.patch b/package/uclibc/1.0.1/0001-remove-NAN-selection-better-do-it-in-your-build-syst.patch
new file mode 100644
index 0000000..b94c5a3
--- /dev/null
+++ b/package/uclibc/1.0.1/0001-remove-NAN-selection-better-do-it-in-your-build-syst.patch
@@ -0,0 +1,60 @@
+From 65aa786d3f6282da02d35b600e82408b47e0a3fe Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 9 Mar 2015 01:48:19 -0500
+Subject: [PATCH 20/20] remove NAN selection, better do it in your build
+ system
+
+With older gcc than 4.9.x, this breaks the build.
+These specific compiler flags belongs better to your
+favorite build system.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ Rules.mak                 |    4 ----
+ extra/Configs/Config.mips |   15 ---------------
+ 2 files changed, 19 deletions(-)
+
+diff --git a/Rules.mak b/Rules.mak
+index 3b074a8..5217004 100644
+--- a/Rules.mak
++++ b/Rules.mak
+@@ -404,10 +404,6 @@ ifeq ($(TARGET_ARCH),mips)
+ 	CPU_CFLAGS-$(CONFIG_MIPS_N64_ABI)+=-mabi=64
+ 	CPU_CFLAGS-$(CONFIG_MIPS_O32_ABI)+=-mabi=32
+ 	CPU_CFLAGS-$(CONFIG_MIPS_N32_ABI)+=-mabi=n32
+-
+-	CPU_CFLAGS-$(CONFIG_MIPS_NAN_LEGACY)+=-mnan=legacy
+-	CPU_CFLAGS-$(CONFIG_MIPS_NAN_2008)+=-mnan=2008
+-
+ 	CPU_LDFLAGS-y += $(CPU_CFLAGS)
+ endif
+ 
+diff --git a/extra/Configs/Config.mips b/extra/Configs/Config.mips
+index 76b10c6..4d30d31 100644
+--- a/extra/Configs/Config.mips
++++ b/extra/Configs/Config.mips
+@@ -33,21 +33,6 @@ config CONFIG_MIPS_N64_ABI
+ endchoice
+ 
+ choice
+-	prompt "Target NAN Encoding"
+-	default CONFIG_MIPS_NAN_LEGACY
+-	help
+-	  This is the NAN Encoding you want to use.  Chose either Legacy
+-	  or 2008.
+-
+-config CONFIG_MIPS_NAN_LEGACY
+-	bool "LEGACY"
+-
+-config CONFIG_MIPS_NAN_2008
+-	bool "2008"
+-
+-endchoice
+-
+-choice
+ 	prompt "Target Processor Architecture"
+ 	default CONFIG_MIPS_ISA_1 if CONFIG_MIPS_O32_ABI
+ 	default CONFIG_MIPS_ISA_3 if CONFIG_MIPS_N32_ABI
+-- 
+1.7.10.4
+
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index c65277b..45e08b0 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -72,7 +72,7 @@ config BR2_UCLIBC_VERSION_STRING
 	string
 	default 0.9.33.2	if BR2_UCLIBC_VERSION_0_9_33
 	default "arc-2014.12" if BR2_UCLIBC_VERSION_ARC_GIT
-	default 1.0.0		if BR2_UCLIBC_VERSION_NG
+	default 1.0.1		if BR2_UCLIBC_VERSION_NG
 	default "7bf35c8b7d4a1f97174eb49f47f33946b282114c" if BR2_UCLIBC_VERSION_XTENSA_GIT
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
diff --git a/package/uclibc/uClibc-ng.config b/package/uclibc/uClibc-ng.config
index f5456dd..9b348d6 100644
--- a/package/uclibc/uClibc-ng.config
+++ b/package/uclibc/uClibc-ng.config
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Version: 1.0.0
+# Version: 1.0.1
 #
 # TARGET_alpha is not set
 # TARGET_arc is not set
-- 
2.1.0
