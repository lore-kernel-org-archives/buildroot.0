From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 29 Jan 2014 22:44:41 +0100
Subject: [Buildroot] [PATCH] gdb: move version selection from gdb.mk to
	Config.in.host
In-Reply-To: <52E9752E.2020602@mind.be>
References: <52E9752E.2020602@mind.be>
Message-ID: <1391031881-19546-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This avoids duplication of the version selection between these two files.

Cc: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Warning: I have not really tested this!

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gdb/Config.in.host | 14 +++++++++-----
 package/gdb/gdb.mk         | 14 --------------
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
-- 
1.8.5.3
