From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  5 Oct 2007 04:06:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: target target/hurd
	toolchain/gcc toolch etc...
Message-ID: <20071005110656.6B60EA5D24@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-10-05 04:06:56 -0700 (Fri, 05 Oct 2007)
New Revision: 20179

Log:
- start to think about GNU/hurd support.
  Not yet functional. Help welcome


Added:
   trunk/buildroot/target/hurd/Makefile.in
   trunk/buildroot/toolchain/gcc/4.2.1/104-gnuhurd-uclibc-conf.patch

Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/target/Makefile.in
   trunk/buildroot/target/hurd/Config.in
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-10-05 11:03:07 UTC (rev 20178)
+++ trunk/buildroot/Config.in	2007-10-05 11:06:56 UTC (rev 20179)
@@ -131,6 +131,7 @@
 	  Default options are:
 	      linux-uclibcgnueabi for ARM EABI
 	      linux-uclibc for the rest
+	      gnuhurd-uclibc for the hurd
 
 config BR2_JLEVEL
 	int "Number of jobs to run simultaneously"

Modified: trunk/buildroot/target/Makefile.in
===================================================================
--- trunk/buildroot/target/Makefile.in	2007-10-05 11:03:07 UTC (rev 20178)
+++ trunk/buildroot/target/Makefile.in	2007-10-05 11:06:56 UTC (rev 20179)
@@ -24,4 +24,4 @@
 #else
 include target/linux/Makefile.in
 #endif
-
+include target/hurd/Makefile.in

Modified: trunk/buildroot/target/hurd/Config.in
===================================================================
--- trunk/buildroot/target/hurd/Config.in	2007-10-05 11:03:07 UTC (rev 20178)
+++ trunk/buildroot/target/hurd/Config.in	2007-10-05 11:06:56 UTC (rev 20179)
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_HURD
-	bool "Hurd kernel"
+	bool "Hurd kernel (see helptext)"
 	depends on BR2_KERNEL_HURD
 	default y
 	help

Added: trunk/buildroot/target/hurd/Makefile.in
===================================================================
--- trunk/buildroot/target/hurd/Makefile.in	                        (rev 0)
+++ trunk/buildroot/target/hurd/Makefile.in	2007-10-05 11:06:56 UTC (rev 20179)
@@ -0,0 +1,38 @@
+# GNU Hurd kernel
+#
+ifeq ($(BR2_KERNEL_HURD),y)
+
+HURD_MODULE_SITE:= -d:pserver:anonymous at cvs.savannah.gnu.org:/sources/hurd
+MIG_MODULE_NAME:=mig
+MIG_MODULE_VERSION:=cvs
+HURD_MODULE_NAME:=hurd
+HURD_MODULE_VERSION:=cvs
+HURD_CMD_CO=cvs -z3 $(HURD_MODULE_SITE) co
+HURD_CMD_UP:=cvs up -PA -d
+HURD_SRC_DIR:=hurd-$(HURD_MODULE_VERSION)
+MIG_SRC_DIR:=mig-$(MIG_MODULE_VERSION)
+
+$(TOOL_BUILD_DIR)/$(HURD_SRC_DIR)/.unpacked:
+	mkdir -p $(@D)
+	(cd $(TOOL_BUILD_DIR) && \
+	 $(HURD_CMD_CO) -d $(HURD_SRC_DIR) $(HURD_MODULE_NAME); \
+	)
+	touch $@
+
+$(TOOL_BUILD_DIR)/$(MIG_SRC_DIR)/.unpacked:
+	mkdir -p $(@D)
+	(cd $(TOOL_BUILD_DIR) && \
+	 $(HURD_CMD_CO) -d $(MIG_SRC_DIR) $(MIG_MODULE_NAME); \
+	)
+	touch $@
+
+$(TOOL_BUILD_DIR)/$(HURD_SRC_DIR)/.updated: $(TOOL_BUILD_DIR)/$(HURD_SRC_DIR)/.unpacked
+	(cd $(@D) && $(HURD_CMD_UP))
+
+$(TOOL_BUILD_DIR)/$(MIG_SRC_DIR)/.updated: $(TOOL_BUILD_DIR)/$(MIG_SRC_DIR)/.unpacked
+	(cd $(@D) && $(HURD_CMD_UP))
+
+hurd-source: $(TOOL_BUILD_DIR)/$(HURD_SRC_DIR)/.updated \
+	$(TOOL_BUILD_DIR)/$(MIG_SRC_DIR)/.updated
+
+endif

Added: trunk/buildroot/toolchain/gcc/4.2.1/104-gnuhurd-uclibc-conf.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.2.1/104-gnuhurd-uclibc-conf.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.2.1/104-gnuhurd-uclibc-conf.patch	2007-10-05 11:06:56 UTC (rev 20179)
@@ -0,0 +1,13 @@
+diff -rdup gcc-4.2.1.oorig/gcc/config.gcc gcc-4.2.1/gcc/config.gcc
+--- gcc-4.2.1.oorig/gcc/config.gcc	2007-10-01 11:52:52.000000000 +0200
++++ gcc-4.2.1/gcc/config.gcc	2007-10-01 13:22:12.000000000 +0200
+@@ -494,6 +494,9 @@ case ${target} in
+     alpha*)
+       tm_file="${cpu_type}/${cpu_type}.h alpha/elf.h alpha/linux.h alpha/linux-elf.h gnu.h ${tm_file}"
+       ;;
++    i[34567]86-*hurd*-*)
++      tm_file="${cpu_type}/${cpu_type}.h i386/unix.h i386/att.h dbxelf.h elfos.h svr4.h i386/gnu.h gnu.h ${tm_file}"
++      ;;
+     i[34567]86-*-*)
+       tm_file="${cpu_type}/${cpu_type}.h i386/unix.h i386/att.h dbxelf.h elfos.h svr4.h linux.h i386/linux.h gnu.h ${tm_file}"
+       ;;

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-10-05 11:03:07 UTC (rev 20178)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-10-05 11:06:56 UTC (rev 20179)
@@ -137,6 +137,9 @@
 GCC_ENABLE_CLOCALE:=--disable-clocale
 endif
 
+ifeq ($(BR2_KERNEL_HURD),y)
+EXTRA_GCC1_CONFIG_OPTIONS+=--without-headers
+endif
 
 $(DL_DIR)/$(GCC_SOURCE):
 	mkdir -p $(DL_DIR)
