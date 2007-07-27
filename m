From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 27 Jul 2007 00:34:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/kexec
Message-ID: <20070727073444.D78B9A470F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-27 00:34:44 -0700 (Fri, 27 Jul 2007)
New Revision: 19267

Log:
Patch kexec inside makefile

Removed:
   trunk/buildroot/package/kexec/kexec-patch.sh

Modified:
   trunk/buildroot/package/kexec/kexec.mk


Changeset:
Deleted: trunk/buildroot/package/kexec/kexec-patch.sh
===================================================================
--- trunk/buildroot/package/kexec/kexec-patch.sh	2007-07-27 07:32:13 UTC (rev 19266)
+++ trunk/buildroot/package/kexec/kexec-patch.sh	2007-07-27 07:34:44 UTC (rev 19267)
@@ -1,16 +0,0 @@
-#!/bin/bash
-SRCDIR=$1
-PATCHDIR=$2
-PATCHLIST=${PATCHDIR}/$3
-
-do_patch()
-{
-	cd ${SRCDIR}
-	for f in `cat ${PATCHLIST}` ; do
-		echo ${PATCHDIR}/$f
-		cat ${PATCHDIR}/$f | patch -p2
-	done
-}
-
-do_patch
-

Modified: trunk/buildroot/package/kexec/kexec.mk
===================================================================
--- trunk/buildroot/package/kexec/kexec.mk	2007-07-27 07:32:13 UTC (rev 19266)
+++ trunk/buildroot/package/kexec/kexec.mk	2007-07-27 07:34:44 UTC (rev 19267)
@@ -34,9 +34,10 @@
 $(KEXEC_DIR)/.unpacked: $(DL_DIR)/$(KEXEC_SOURCE) $(DL_DIR)/$(KEXEC_PATCH)
 	$(KEXEC_CAT) $(DL_DIR)/$(KEXEC_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(KEXEC_PATCH),)
-	(cd $(KEXEC_DIR) && $(KEXEC_CAT) $(DL_DIR)/$(KEXEC_PATCH) | patch -p1)
-	package/kexec/kexec-patch.sh $(KEXEC_DIR) $(KEXEC_DIR)/debian/patches 00list
-#	toolchain/patch-kernel.sh $(KEXEC_DIR) $(KEXEC_DIR)/debian/patches \*.patch
+	(cd $(KEXEC_DIR) && $(KEXEC_CAT) $(DL_DIR)/$(KEXEC_PATCH) | patch -p1;	\
+	for f in `cat debian/patches/00list` ; do	\
+		cat debian/patches/$$f | patch -p2 ; 	\
+	done)
 endif
 	toolchain/patch-kernel.sh $(KEXEC_DIR) package/kexec/ kexec\*.patch
 	touch $@
