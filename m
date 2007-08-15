From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 15 Aug 2007 15:35:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/coreutils
	package/tar toolchain/ etc...
Message-ID: <20070815223527.9C8EFA4711@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-15 15:35:26 -0700 (Wed, 15 Aug 2007)
New Revision: 19521

Log:
Allow user to configure PROGRAM_INVOCATION_NAME

Modified:
   trunk/buildroot/package/coreutils/Config.in
   trunk/buildroot/package/tar/Config.in
   trunk/buildroot/toolchain/uClibc/Config.in
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/package/coreutils/Config.in
===================================================================
--- trunk/buildroot/package/coreutils/Config.in	2007-08-15 22:31:25 UTC (rev 19520)
+++ trunk/buildroot/package/coreutils/Config.in	2007-08-15 22:35:26 UTC (rev 19521)
@@ -2,6 +2,7 @@
 	bool "coreutils"
 	default n
 	depends on BR2_USE_WCHAR
+	select BR2_UCLIBC_PROGRAM_INVOCATION
 	help
 	  All of the basic file/text/shell utilities.  These are the 
 	  core utilities which are expected to exist on every system.  

Modified: trunk/buildroot/package/tar/Config.in
===================================================================
--- trunk/buildroot/package/tar/Config.in	2007-08-15 22:31:25 UTC (rev 19520)
+++ trunk/buildroot/package/tar/Config.in	2007-08-15 22:35:26 UTC (rev 19521)
@@ -2,6 +2,7 @@
 	bool "tar"
 	default n
 	depends on BR2_USE_WCHAR
+	select BR2_UCLIBC_PROGRAM_INVOCATION
 	help
 	  A program that saves many files together into a single tape or disk 
 	  archive, and can restore individual files from the archive.

Modified: trunk/buildroot/toolchain/uClibc/Config.in
===================================================================
--- trunk/buildroot/toolchain/uClibc/Config.in	2007-08-15 22:31:25 UTC (rev 19520)
+++ trunk/buildroot/toolchain/uClibc/Config.in	2007-08-15 22:35:26 UTC (rev 19521)
@@ -82,3 +82,12 @@
 	default n
 	help
 	  Build the thread library with debugging enabled.
+
+config BR2_UCLIBC_PROGRAM_INVOCATION
+	bool "Enable 'program invocation name'"
+	default n
+	help
+	  Support for the GNU-specific program_invocation_name and
+	  program_invocation_short_name strings.  Some GNU packages 
+	  (like tar and coreutils) utilize these for extra useful
+	  output, but in general are not required.

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-08-15 22:31:25 UTC (rev 19520)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-08-15 22:35:26 UTC (rev 19521)
@@ -229,6 +229,11 @@
 else
 	$(SED) 's,^.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=n,g' $(UCLIBC_DIR)/.oldconfig
 endif
+ifeq ($(BR2_UCLIBC_PROGRAM_INVOCATION),y)
+	echo "UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y" >> $(UCLIBC_DIR)/.oldconfig
+else
+	echo "# UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set" >> $(UCLIBC_DIR)/.oldconfig
+endif
 ifeq ("$(KERNEL_ARCH)","i386")
 	/bin/echo "# CONFIG_GENERIC_386 is not set" >> $(UCLIBC_DIR)/.oldconfig
 	/bin/echo "# CONFIG_386 is not set" >> $(UCLIBC_DIR)/.oldconfig
