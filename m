From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 22 Apr 2009 07:27:22 +0000 (UTC)
Subject: [Buildroot] svn commit: [26183] trunk/buildroot/toolchain: uClibc
Message-ID: <20090422072722.61A47776C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-22 07:27:22 +0000 (Wed, 22 Apr 2009)
New Revision: 26183

Log:
toolchain: add BR2_USE_SSP option for stack protection support

Using the support in uClibc.

Modified:
   trunk/buildroot/toolchain/Config.in.2
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.config
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/Config.in.2	2009-04-22 07:27:17 UTC (rev 26182)
+++ trunk/buildroot/toolchain/Config.in.2	2009-04-22 07:27:22 UTC (rev 26183)
@@ -85,6 +85,15 @@
 
 	  Most people will answer N.
 
+config BR2_USE_SSP
+	bool "Enable stack protection support"
+	help
+	  Enable stack smashing protection support using GCCs
+	  -fstack-protector[-all] option.
+
+	  See http://www.linuxfromscratch.org/hints/downloads/files/ssp.txt
+	  for details.
+
 choice
 	prompt "Thread library implementation"
 	default BR2_PTHREADS_OLD

Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config	2009-04-22 07:27:17 UTC (rev 26182)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config	2009-04-22 07:27:22 UTC (rev 26183)
@@ -173,14 +173,18 @@
 #
 # uClibc security related options
 #
-# UCLIBC_SECURITY is not set
 # UCLIBC_BUILD_PIE is not set
 # UCLIBC_HAS_ARC4RANDOM is not set
 # HAVE_NO_SSP is not set
-# UCLIBC_HAS_SSP is not set
+UCLIBC_HAS_SSP=y
+# UCLIBC_HAS_SSP_COMPAT is not set
+# SSP_QUICK_CANARY is not set
+PROPOLICE_BLOCK_ABRT=y
+# PROPOLICE_BLOCK_SEGV is not set
+# UCLIBC_BUILD_SSP is not set
 UCLIBC_BUILD_RELRO=y
 UCLIBC_BUILD_NOW=y
-# UCLIBC_BUILD_NOEXECSTACK is not set
+UCLIBC_BUILD_NOEXECSTACK=y
 
 #
 # uClibc development/debugging options

Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.config
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.config	2009-04-22 07:27:17 UTC (rev 26182)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.config	2009-04-22 07:27:22 UTC (rev 26183)
@@ -196,12 +196,17 @@
 # Security options
 #
 # UCLIBC_BUILD_PIE is not set
-UCLIBC_HAS_ARC4RANDOM=y
+# UCLIBC_HAS_ARC4RANDOM is not set
 # HAVE_NO_SSP is not set
-# UCLIBC_HAS_SSP is not set
+UCLIBC_HAS_SSP=y
+# UCLIBC_HAS_SSP_COMPAT is not set
+# SSP_QUICK_CANARY is not set
+PROPOLICE_BLOCK_ABRT=y
+# PROPOLICE_BLOCK_SEGV is not set
+# UCLIBC_BUILD_SSP is not set
 UCLIBC_BUILD_RELRO=y
 UCLIBC_BUILD_NOW=y
-# UCLIBC_BUILD_NOEXECSTACK is not set
+UCLIBC_BUILD_NOEXECSTACK=y
 
 #
 # uClibc development/debugging options

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2009-04-22 07:27:17 UTC (rev 26182)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2009-04-22 07:27:22 UTC (rev 26183)
@@ -303,6 +303,11 @@
 		-e 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=y\nHAS_FPU=y\nUCLIBC_HAS_FLOATS=y\n,g' \
 		$(UCLIBC_DIR)/.oldconfig
 endif
+ifeq ($(BR2_USE_SSP),y)
+	$(SED) 's,^.*UCLIBC_HAS_SSP[^_].*,UCLIBC_HAS_SSP=y,g' $(UCLIBC_DIR)/.oldconfig
+else
+	$(SED) 's,^.*UCLIBC_HAS_SSP[^_].*,UCLIBC_HAS_SSP=n,g' $(UCLIBC_DIR)/.oldconfig
+endif
 	$(SED) '/UCLIBC_HAS_THREADS/d' $(UCLIBC_DIR)/.oldconfig
 	$(SED) '/LINUXTHREADS/d' $(UCLIBC_DIR)/.oldconfig
 	$(SED) '/LINUXTHREADS_OLD/d' $(UCLIBC_DIR)/.oldconfig
