From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri, 11 Oct 2013 09:33:19 -0500
Subject: [Buildroot] [PATCH 4/5] gdb: add microblaze internal toolchain
In-Reply-To: <1381502000-1995-1-git-send-email-spenser@gillilanding.com>
References: <1381502000-1995-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1381502000-1995-5-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/gdb/Config.in.host |    4 ++++
 package/gdb/gdb.mk         |    9 ++++++++-
 2 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 128aed9..aae0109 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -18,6 +18,7 @@ choice
 	depends on !BR2_arc
 	default BR2_GDB_VERSION_6_6 if BR2_bfin
 	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
+	default BR2_GDB_VERSION_7_6_MICROBLAZE if BR2_microblaze
 	default BR2_GDB_VERSION_7_5
 	help
 	  Select the version of gdb you wish to use.
@@ -48,6 +49,8 @@ choice
 		bool "gdb 7.5.x"
 		depends on !BR2_bfin
 
+	config BR2_GDB_VERSION_7_6_MICROBLAZE
+		bool "gdb 7.6-microblaze"
 endchoice
 
 config BR2_GDB_VERSION
@@ -59,5 +62,6 @@ config BR2_GDB_VERSION
 	default "7.4.1"    if BR2_GDB_VERSION_7_4
 	default "7.5.1"    if BR2_GDB_VERSION_7_5
 	default "7.5.1-arc" if BR2_arc
+	default "7.6-microblaze" if BR2_microblaze
 
 endif
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 9cf90e3..65485da 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -21,15 +21,22 @@ GDB_VERSION = 7.5.1
 endif
 endif
 
+GDB_SOURCE = gdb-$(GDB_VERSION).tar.bz2
+
 ifeq ($(BR2_arc),y)
 GDB_SITE = $(BR2_ARC_SITE)
 endif
 
+ifeq ($(BR2_microblaze),y)
+GDB_VERSION = 6be65fb56ea6694a9260733a536a023a1e2d4d57
+GDB_SITE = http://github.com/Xilinx/gdb/tarball/$(GDB_VERSION)
+GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
+endif
+
 ifeq ($(GDB_VERSION),6.7.1-avr32-2.1.5)
 GDB_SITE = ftp://www.at91.com/pub/buildroot/
 endif
 
-GDB_SOURCE = gdb-$(GDB_VERSION).tar.bz2
 GDB_LICENSE = GPLv2+ LGPLv2+ GPLv3+ LGPLv3+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
 
-- 
1.7.1
