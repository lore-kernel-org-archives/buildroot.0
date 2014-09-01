From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Sep 2014 16:14:42 +0200
Subject: [Buildroot] [git commit] ARC: bump tools to 2014.08 release
Message-ID: <20140901145335.7C7099D561@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a484a6ca2c7817eacfce486b672a9a31f7537c2a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now when new shiny tools are released by Synopsys we're ready for version
update in Buildroot.

Important change in this release is switching to combined "binutils-gdb" repo
in accordance to upstream move.

Following patch now is a part of the most recent relese:
https://github.com/foss-for-synopsys-dwc-arc-processors/binutils-gdb/commit/e6ab8cac627a44a7594aeb907a579d8d2f066ba5

So dropping it.
package/binutils/arc-4.8-R3/0001-arc-Honor-DESTDIR-in-custom-Makefile.patch

Since arc-2014.08 tools are still based on GCC 4.8 following patch is still
relevant so moving to the new folder to matxh ARC gcc bump.
package/gcc/arc-4.8-R3/100-libstdcxx-uclibc-c99.patch ->
package/gcc/arc-2014.08/100-libstdcxx-uclibc-c99.patch

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host                    |    2 +-
 ...0001-arc-Honor-DESTDIR-in-custom-Makefile.patch |   47 --------------------
 package/binutils/binutils.mk                       |    2 +-
 package/gcc/Config.in.host                         |    2 +-
 .../100-libstdcxx-uclibc-c99.patch                 |    0
 package/gdb/Config.in.host                         |    2 +-
 package/gdb/gdb.mk                                 |    2 +-
 package/uclibc/Config.in                           |    2 +-
 8 files changed, 6 insertions(+), 53 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index de8b780..826db6d 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -29,7 +29,7 @@ endchoice
 config BR2_BINUTILS_VERSION
 	string
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
-	default "arc-4.8-R3"	if BR2_arc
+	default "arc-2014.08"	if BR2_arc
 	default "2.22"		if BR2_BINUTILS_VERSION_2_22
 	default "2.23.2"	if BR2_BINUTILS_VERSION_2_23_2
 	default "2.24"		if BR2_BINUTILS_VERSION_2_24
diff --git a/package/binutils/arc-4.8-R3/0001-arc-Honor-DESTDIR-in-custom-Makefile.patch b/package/binutils/arc-4.8-R3/0001-arc-Honor-DESTDIR-in-custom-Makefile.patch
deleted file mode 100644
index 9895a3f..0000000
--- a/package/binutils/arc-4.8-R3/0001-arc-Honor-DESTDIR-in-custom-Makefile.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From e2b7b635c28915d59cb3c1b47f8e79401e1e6c46 Mon Sep 17 00:00:00 2001
-From: Anton Kolesov <Anton.Kolesov@synopsys.com>
-Date: Fri, 6 Jun 2014 12:58:45 +0400
-Subject: [PATCH] arc: Honor DESTDIR in custom Makefile
-
-Installing native binutils in Buildroot faile, because `prefix` is /usr, and
-proper installation path on host is achieved via usage of DESTDIR variable.
-Homegrown ARC Makefile was ignoring this variable and therefour it was
-trying to install files into /usr/extlib, when doing native binutils build.
-This patch teaches our Makefile to honor DESTDIR.
-
-Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
----
- gas/ChangeLog.ARC             | 4 ++++
- gas/config/extlib/Makefile.in | 4 ++--
- 2 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/gas/ChangeLog.ARC b/gas/ChangeLog.ARC
-index 42a386f..80aedb5 100644
---- a/gas/ChangeLog.ARC
-+++ b/gas/ChangeLog.ARC
-@@ -1,3 +1,7 @@
-+2014-06-06 Anton Kolesov  <Anton Kolesov@synopsys.com>
-+
-+	* config/extlib/Makefile.in: Honor DESTDIR.
-+
- 2014-03-20 Claudiu Zissulescu <claziss@synopsys.com>
- 
-         * config/tc-arc.c (arc_extoper): Allow negative value when
-diff --git a/gas/config/extlib/Makefile.in b/gas/config/extlib/Makefile.in
-index 75e6a82..35232ea 100644
---- a/gas/config/extlib/Makefile.in
-+++ b/gas/config/extlib/Makefile.in
-@@ -1,8 +1,8 @@
- all:
- 	-install @srcdir@/*.s .
- install:
--	install -d @prefix@/extlib
--	install @srcdir@/*.s @prefix@/extlib
-+	install -d $(DESTDIR)@prefix@/extlib
-+	install @srcdir@/*.s $(DESTDIR)@prefix@/extlib
- 
- check:
- clean:
--- 
-1.8.4.1
-
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 4888eeb..5ec420a 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -24,7 +24,7 @@ ifeq ($(ARCH),avr32)
 BINUTILS_SITE = ftp://www.at91.com/pub/buildroot
 endif
 ifeq ($(BR2_arc),y)
-BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils,$(BINUTILS_VERSION))
+BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
 BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
 endif
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index b29bacb..b536a66 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -99,7 +99,7 @@ config BR2_GCC_VERSION
 	default "4.7.4"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.3"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.1"     if BR2_GCC_VERSION_4_9_X
-	default "arc-4.8-R3" if BR2_GCC_VERSION_4_8_ARC
+	default "arc-2014.08" if BR2_GCC_VERSION_4_8_ARC
 	default BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/arc-4.8-R3/100-libstdcxx-uclibc-c99.patch b/package/gcc/arc-2014.08/100-libstdcxx-uclibc-c99.patch
similarity index 100%
rename from package/gcc/arc-4.8-R3/100-libstdcxx-uclibc-c99.patch
rename to package/gcc/arc-2014.08/100-libstdcxx-uclibc-c99.patch
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index e48dc10..10d16b9 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -49,7 +49,7 @@ config BR2_GDB_VERSION
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
 	default "6.7.1-avr32-2.1.5" if BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 || \
                                    (!BR2_PACKAGE_HOST_GDB && BR2_avr32)
-	default "arc-4.8-R3" if BR2_arc
+	default "arc-2014.08-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.6.2"    if BR2_GDB_VERSION_7_6 || !BR2_PACKAGE_HOST_GDB
 	default "7.7.1"    if BR2_GDB_VERSION_7_7 || BR2_powerpc64le
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 7e87bf9..85b7883 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -8,7 +8,7 @@ GDB_VERSION = $(call qstrip,$(BR2_GDB_VERSION))
 GDB_SITE    = $(BR2_GNU_MIRROR)/gdb
 
 ifeq ($(BR2_arc),y)
-GDB_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gdb,$(GDB_VERSION))
+GDB_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(GDB_VERSION))
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
 GDB_FROM_GIT = y
 endif
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 851ad1e..d319ae7 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -42,7 +42,7 @@ config BR2_UCLIBC_VERSION_STRING
 	string
 	default 0.9.31.1	if BR2_UCLIBC_VERSION_0_9_31
 	default 0.9.33.2	if BR2_UCLIBC_VERSION_0_9_33
-	default "8af9dc8f714d20a68df034f6ed1ededc2d752f5b" if BR2_arc
+	default "arc-2014.08" if BR2_arc
 	default "7bf35c8b7d4a1f97174eb49f47f33946b282114c" if BR2_UCLIBC_VERSION_XTENSA_GIT
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
