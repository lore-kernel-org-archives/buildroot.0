From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 15 Sep 2007 15:04:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package toolchain/uClibc
Message-ID: <20070915220450.8246930048@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-15 15:04:49 -0700 (Sat, 15 Sep 2007)
New Revision: 19858

Log:
- some more sparc{,64} twiddling


Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-09-15 21:10:52 UTC (rev 19857)
+++ trunk/buildroot/Config.in	2007-09-15 22:04:49 UTC (rev 19858)
@@ -286,7 +286,7 @@
 
 choice
 	prompt "Target Architecture Variant"
-	depends BR2_sparc || BR2_sparc64
+	depends BR2_sparc
 	default BR2_sparc_v7
 	help
 	  Specific CPU variant to use
@@ -315,6 +315,8 @@
 	bool "tsc701"
 config BR2_sparc_v9
 	bool "v9"
+config BR2_sparc_v9b
+	bool "v9b"
 config BR2_sparc_ultrasparc
 	bool "ultrasparc"
 config BR2_sparc_ultrasparc3
@@ -323,7 +325,32 @@
 	bool "niagara"
 endchoice
 
+choice
+	prompt "Target Architecture Variant"
+	depends BR2_sparc64
+	default BR2_sparc64_v9
+	help
+	  Specific CPU variant to use
 
+config BR2_sparc64_v9
+	bool "v9"
+config BR2_sparc64_v9b
+	bool "v9b"
+config BR2_sparc64_ultrasparc
+	bool "ultrasparc"
+config BR2_sparc64_ultrasparc3
+	bool "ultrasparc3"
+config BR2_sparc64_niagara
+	bool "niagara"
+endchoice
+
+config BR2_SPARC_TYPE
+	string
+	default V7	if BR2_sparc_v7 || BR2_sparc_cypress || BR2_sparc_sparclite || BR2_sparc_f930 || BR2_sparc_f934 || BR2_sparc_sparclite86x || BR2_sparc_sparclet || BR2_sparc_tsc701
+	default V8	if BR2_sparc_v8 || BR2_sparc_supersparc || BR2_sparc_hypersparc
+	default V9	if BR2_sparc_v9 || BR2_sparc_ultrasparc || BR2_sparc_ultrasparc3 || BR2_sparc_niagara || BR2_sparc64_v9 || BR2_sparc64_ultrasparc || BR2_sparc64_ultrasparc3 || BR2_sparc64_niagara
+	default V9B	if BR2_sparc_v9b || BR2_sparc64_v9b
+
 choice
 	prompt "Target Architecture Variant"
 	depends BR2_ia64
@@ -557,10 +584,10 @@
 	default sparclite86x	if BR2_sparc_sparclite86x
 	default sparclet	if BR2_sparc_sparclet
 	default tsc701		if BR2_sparc_tsc701
-	default v9		if BR2_sparc_v9
-	default ultrasparc	if BR2_sparc_ultrasparc
-	default ultrasparc3	if BR2_sparc_ultrasparc3
-	default niagara		if BR2_sparc_niagara
+	default v9		if BR2_sparc_v9 || BR2_sparc_v9b || BR2_sparc64_v9 || BR2_sparc64_v9b
+	default ultrasparc	if BR2_sparc_ultrasparc || BR2_sparc64_ultrasparc
+	default ultrasparc3	if BR2_sparc_ultrasparc3 || BR2_sparc64_ultrasparc3
+	default niagara		if BR2_sparc_niagara || BR2_sparc64_niagara
 	default g5		if BR2_s390_g5
 	default g6		if BR2_s390_g6
 	default z900		if BR2_s390_z900

Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-09-15 21:10:52 UTC (rev 19857)
+++ trunk/buildroot/package/Makefile.in	2007-09-15 22:04:49 UTC (rev 19858)
@@ -46,6 +46,13 @@
 TARGET_CFLAGS+=-msoft-float
 endif
 
+ifeq ($(BR2_sparc_v9b),y)
+TARGET_CFLAGS+=-mvis
+endif
+ifeq ($(BR2_sparc64_v9b),y)
+TARGET_CFLAGS+=-mvis
+endif
+
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 
 # else it's an external toolchain

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-15 21:10:52 UTC (rev 19857)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-15 22:04:49 UTC (rev 19858)
@@ -75,6 +75,7 @@
 		-e 's/mips/BIG/' \
 		-e 's/sh[234].*eb/BIG/' \
 		-e 's/sh[234]/LITTLE/' \
+		-e 's/sparc.*/BIG/' \
 ")
 
 ifneq ($(UCLIBC_TARGET_ENDIAN),LITTLE)
@@ -88,8 +89,10 @@
 UCLIBC_NOT_TARGET_ENDIAN:=LITTLE
 endif
 
-ARM_CONFIG:=CONFIG_$(strip $(subst ",, $(BR2_ARM_TYPE)))
+UCLIBC_ARM_TYPE:=CONFIG_$(strip $(subst ",, $(BR2_ARM_TYPE)))
 #"))
+UCLIBC_SPARC_TYPE:=CONFIG_SPARC_$(strip $(subst ",, $(BR2_SPARC_TYPE)))
+#"))
 
 $(DL_DIR)/$(UCLIBC_SOURCE):
 	$(WGET) -P $(DL_DIR) $(UCLIBC_SITE)/$(UCLIBC_SOURCE)
@@ -136,7 +139,7 @@
 ifeq ($(UCLIBC_TARGET_ARCH),arm)
 	$(SED) 's/^\(CONFIG_[^_]*[_]*ARM[^=]*\)=.*/# \1 is not set/g' \
 		 $(UCLIBC_DIR)/.oldconfig
-	$(SED) 's/^.*$(ARM_CONFIG).*/$(ARM_CONFIG)=y/g' $(UCLIBC_DIR)/.oldconfig
+	$(SED) 's/^.*$(UCLIBC_ARM_TYPE).*/$(UCLIBC_ARM_TYPE)=y/g' $(UCLIBC_DIR)/.oldconfig
 ifeq ($(BR2_ARM_EABI),y)
 	/bin/echo "# CONFIG_ARM_OABI is not set" >> $(UCLIBC_DIR)/.oldconfig
 	/bin/echo "CONFIG_ARM_EABI=y" >> $(UCLIBC_DIR)/.oldconfig
@@ -178,6 +181,13 @@
 	$(SED) 's,# CONFIG_SH4 is not set,CONFIG_SH4=y,g' $(UCLIBC_DIR)/.oldconfig
 endif
 endif
+ifeq ($(UCLIBC_TARGET_ARCH),sparc)
+	$(SED) 's/^\(CONFIG_[^_]*[_]*SPARC[^=]*\)=.*/# \1 is not set/g' \
+		 $(UCLIBC_DIR)/.oldconfig
+	for i in V7 V8 V9 V9B; do echo "# CONFIG_SPARC_$$i is not set"; done \
+		>> $(UCLIBC_DIR)/.oldconfig
+	$(SED) 's/^.*$(UCLIBC_SPARC_TYPE).*/$(UCLIBC_SPARC_TYPE)=y/g' $(UCLIBC_DIR)/.oldconfig
+endif
 ifneq ($(UCLIBC_TARGET_ENDIAN),)
 	# The above doesn't work for me, so redo
 	$(SED) 's/.*\(ARCH_$(UCLIBC_NOT_TARGET_ENDIAN)_ENDIAN\).*/# \1 is not set/g' \
