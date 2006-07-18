From: andersen@uclibc.org <andersen@uclibc.org>
Date: Tue Jul 18 16:43:59 2006
Subject: [Buildroot] svn commit: trunk/buildroot:  toolchain/uClibc
Message-ID: <20060718234358.E860C48B55@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-07-18 16:43:58 -0700 (Tue, 18 Jul 2006)
New Revision: 15722

Log:
configuring uClibc depends on first having kernel headers in place


Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2006-07-18 23:42:03 UTC (rev 15721)
+++ trunk/buildroot/Makefile	2006-07-18 23:43:58 UTC (rev 15722)
@@ -43,7 +43,7 @@
 # along with the packages to build for the target.
 #
 ##############################################################
-TARGETS:=kernel-headers uclibc-configured binutils gcc uclibc-target-utils
+TARGETS:=uclibc-configured binutils gcc uclibc-target-utils
 include toolchain/Makefile.in
 include package/Makefile.in
 

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-07-18 23:42:03 UTC (rev 15721)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-07-18 23:43:58 UTC (rev 15722)
@@ -68,7 +68,7 @@
 	touch $(UCLIBC_DIR)/.unpacked
 
 uclibc-configured: $(UCLIBC_DIR)/.configured
-$(UCLIBC_DIR)/.configured: dependencies $(UCLIBC_DIR)/.unpacked
+$(UCLIBC_DIR)/.configured: dependencies kernel-headers $(UCLIBC_DIR)/.unpacked
 	cp $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.config
 	$(SED) 's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="$(TARGET_CROSS)",g' \
 		-e 's,# TARGET_$(UCLIBC_TARGET_ARCH) is not set,TARGET_$(UCLIBC_TARGET_ARCH)=y,g' \
