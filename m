From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 27 Jan 2014 15:51:38 -0600
Subject: [Buildroot] [PATCH v2] gdb: use git version for cross-gdb
In-Reply-To: <1390859507-31670-1-git-send-email-spenser@gillilanding.com>
References: <1390859507-31670-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1390859507-31670-2-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use version from git for cross-gdb and introduce changes neccessary to define
this only once.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/gdb/Config.in.host | 24 ++++++++++++++++++++----
 package/gdb/gdb.mk         | 14 +++++++++-----
 2 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index de0e0be..d4a7e1a 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -15,8 +15,8 @@ if BR2_PACKAGE_HOST_GDB
 
 choice
 	prompt "GDB debugger Version"
-	depends on !BR2_arc
-	depends on !BR2_microblaze
+	default BR2_GDB_VERSION_ARC_GIT if BR2_arc
+	default BR2_GDB_VERSION_MB_GIT if BR2_microblaze
 	default BR2_GDB_VERSION_6_6 if BR2_bfin
 	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
 	default BR2_GDB_VERSION_7_5
@@ -31,23 +31,39 @@ choice
 		depends on BR2_avr32
 		bool "gdb 6.7.1-avr32-2.1.5"
 
+	config BR2_GDB_VERSION_ARC_GIT
+		depends on BR2_arc
+		bool "gdb git-snapshot"
+
+	config BR2_GDB_VERSION_MB_GIT
+		depends on BR2_microblaze
+		bool "gdb git-snapshot"
+
 	config BR2_GDB_VERSION_7_2
 		bool "gdb 7.2.x"
 		depends on !BR2_bfin
+		depends on !BR2_arc
+		depends on !BR2_microblaze
 		depends on BR2_DEPRECATED
 
 	config BR2_GDB_VERSION_7_3
 		bool "gdb 7.3.x"
 		depends on !BR2_bfin
+		depends on !BR2_arc
+		depends on !BR2_microblaze
 		depends on BR2_DEPRECATED
 
 	config BR2_GDB_VERSION_7_4
 		bool "gdb 7.4.x"
 		depends on !BR2_bfin
+		depends on !BR2_arc
+		depends on !BR2_microblaze
 
 	config BR2_GDB_VERSION_7_5
 		bool "gdb 7.5.x"
 		depends on !BR2_bfin
+		depends on !BR2_arc
+		depends on !BR2_microblaze
 
 endchoice
 
@@ -55,11 +71,11 @@ config BR2_GDB_VERSION
 	string
 	default "6.6a"     if BR2_GDB_VERSION_6_6
 	default "6.7.1-avr32-2.1.5" if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
+	default "mb-git"   if BR2_GDB_VERSION_MB_GIT
+	default "arc-git"  if BR2_GDB_VERSION_ARC_GIT
 	default "7.2a"     if BR2_GDB_VERSION_7_2
 	default "7.3.1"    if BR2_GDB_VERSION_7_3
 	default "7.4.1"    if BR2_GDB_VERSION_7_4
 	default "7.5.1"    if BR2_GDB_VERSION_7_5
-	default "f25a1952afd054205f9471e449c1f7ca5b271b7c" if BR2_arc
-	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 
 endif
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index d06b61b..2b2eb7a 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -9,28 +9,32 @@ GDB_SITE    = $(BR2_GNU_MIRROR)/gdb
 
 # When no version is defined, it means that cross-gdb for the host has
 # not been enabled, and we will only build gdbserver or gdb for the
-# target. In this case, use the latest available version
+# target. In this case, use the latest working version for the architecture
 # automatically.
 ifeq ($(GDB_VERSION),)
 ifeq ($(BR2_bfin),y)
 GDB_VERSION = 6.6a
 else ifeq ($(BR2_avr32),y)
 GDB_VERSION = 6.7.1-avr32-2.1.5
+else ifeq ($(BR2_microblaze),y)
+GDB_VERSION = mb-git
+else ifeq ($(BR2_arc),y)
+GDB_VERSION = arc-git
 else
 GDB_VERSION = 7.5.1
 endif
 endif
 
-ifeq ($(BR2_arc),y)
+ifeq ($(findstring git,$(GDB_VERSION))$(BR2_arc),gity)
 GDB_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gdb,$(GDB_VERSION))
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
-GDB_FROM_GIT = y
+GDB_VERSION = f25a1952afd054205f9471e449c1f7ca5b271b7c
 endif
 
-ifeq ($(BR2_microblaze),y)
+ifeq ($(findstring git,$(GDB_VERSION))$(BR2_microblaze),gity)
 GDB_SITE = $(call github,Xilinx,gdb,$(GDB_VERSION))
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
-GDB_FROM_GIT = y
+GDB_VERSION = 6be65fb56ea6694a9260733a536a023a1e2d4d57
 endif
 
 ifeq ($(GDB_VERSION),6.7.1-avr32-2.1.5)
-- 
1.8.3.2
