From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Feb 2015 23:34:28 +0100
Subject: [Buildroot] [PATCH 09/12] package/gdb: farewell avr32
In-Reply-To: <cover.1423866603.git.yann.morin.1998@free.fr>
References: <cover.1423866603.git.yann.morin.1998@free.fr>
Message-ID: <5e937b1fec26431b718498c43472ecc48211cc12.1423866603.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/gdb/Config.in      | 4 ++--
 package/gdb/Config.in.host | 7 -------
 package/gdb/gdb.mk         | 9 +--------
 3 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index b211878..db6adf5 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -40,10 +40,10 @@ config BR2_PACKAGE_GDB_DEBUGGER
 	bool "full debugger"
 	select BR2_PACKAGE_NCURSES
 	depends on BR2_USE_WCHAR
-	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32 && !BR2_microblaze && !BR2_bfin
+	depends on !BR2_sh && !BR2_sh64 && !BR2_microblaze && !BR2_bfin
 
 comment "full gdb on target needs a toolchain w/ wchar"
-	depends on !BR2_sh && !BR2_sh64 && !BR2_avr32 && !BR2_microblaze && !BR2_bfin
+	depends on !BR2_sh && !BR2_sh64 && !BR2_microblaze && !BR2_bfin
 	depends on !BR2_USE_WCHAR
 
 if BR2_PACKAGE_GDB_DEBUGGER
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index c8d6a94..2a03939 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -27,15 +27,10 @@ choice
 	prompt "GDB debugger Version"
 	depends on !BR2_arc
 	depends on !BR2_microblaze
-	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
 	default BR2_GDB_VERSION_7_7
 	help
 	  Select the version of gdb you wish to use.
 
-	config BR2_GDB_VERSION_6_7_1_AVR32_2_1_5
-		depends on BR2_avr32
-		bool "gdb 6.7.1-avr32-2.1.5"
-
 	config BR2_GDB_VERSION_7_7
 		bool "gdb 7.7.x"
 
@@ -50,8 +45,6 @@ endif
 config BR2_GDB_VERSION
 	string
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-	default "6.7.1-avr32-2.1.5" if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 || \
-                                   (!BR2_PACKAGE_HOST_GDB && BR2_avr32)
 	default "arc-2014.12-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.7.1"    if BR2_GDB_VERSION_7_7 || !BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 24084b8..6a192fb 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -19,10 +19,6 @@ GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
 GDB_FROM_GIT = y
 endif
 
-ifeq ($(GDB_VERSION),6.7.1-avr32-2.1.5)
-GDB_SITE = ftp://www.at91.com/pub/buildroot
-endif
-
 # Starting from 7.8.x, bz2 tarballs no longer available, use .tar.xz
 # instead.
 ifneq ($(filter 7.8.%,$(GDB_VERSION)),)
@@ -129,12 +125,9 @@ endif
 #  * --target, because we're doing a cross build rather than a real
 #    host build.
 #  * --enable-static because gdb really wants to use libbfd.a
-#  * --disable-shared, otherwise the old 6.7 version specific to AVR32
-#    doesn't build because it wants to link a shared libbfd.so against
-#    non-PIC liberty.a.
 HOST_GDB_CONF_OPTS = \
 	--target=$(GNU_TARGET_NAME) \
-	--enable-static --disable-shared \
+	--enable-static \
 	--without-uiout \
 	--disable-gdbtk \
 	--without-x \
-- 
1.9.1
