From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Feb 2014 23:05:38 +0100
Subject: [Buildroot] [git commit] gdb: move version selection from gdb.mk to
	Config.in.host
Message-ID: <20140208222132.3617B9C849@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fda818390b5e6a585608f4523356eafa0c587f53
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This avoids duplication of the version selection between these two files.

Cc: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host |   14 +++++++++-----
 package/gdb/gdb.mk         |   14 --------------
 2 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index d5e7814..9c0c78c 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -51,15 +51,19 @@ choice
 
 endchoice
 
+endif
+
+# If cross-gdb is not enabled, the latest working version is chosen.
 config BR2_GDB_VERSION
 	string
-	default "6.6a"     if BR2_GDB_VERSION_6_6
-	default "6.7.1-avr32-2.1.5" if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
+	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
+	default "6.6a"     if BR2_GDB_VERSION_6_6 || \
+	                      (!BR2_PACKAGE_HOST_GDB && BR2_bfin)
+	default "6.7.1-avr32-2.1.5" if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 || \
+                                   (!BR2_PACKAGE_HOST_GDB && BR2_avr32)
 	default "7.2a"     if BR2_GDB_VERSION_7_2
 	default "7.3.1"    if BR2_GDB_VERSION_7_3
 	default "7.4.1"    if BR2_GDB_VERSION_7_4
-	default "7.5.1"    if BR2_GDB_VERSION_7_5
+	default "7.5.1"    if BR2_GDB_VERSION_7_5 || !BR2_PACKAGE_HOST_GDB
 	default "f25a1952afd054205f9471e449c1f7ca5b271b7c" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
-
-endif
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index d06b61b..69fb3ba 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -7,20 +7,6 @@
 GDB_VERSION = $(call qstrip,$(BR2_GDB_VERSION))
 GDB_SITE    = $(BR2_GNU_MIRROR)/gdb
 
-# When no version is defined, it means that cross-gdb for the host has
-# not been enabled, and we will only build gdbserver or gdb for the
-# target. In this case, use the latest available version
-# automatically.
-ifeq ($(GDB_VERSION),)
-ifeq ($(BR2_bfin),y)
-GDB_VERSION = 6.6a
-else ifeq ($(BR2_avr32),y)
-GDB_VERSION = 6.7.1-avr32-2.1.5
-else
-GDB_VERSION = 7.5.1
-endif
-endif
-
 ifeq ($(BR2_arc),y)
 GDB_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gdb,$(GDB_VERSION))
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
