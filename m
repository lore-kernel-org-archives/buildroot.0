From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 24 Jul 2007 16:05:30 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/kexec
In-Reply-To: <20070724140616.F0451A4683@busybox.net>
References: <20070724140616.F0451A4683@busybox.net>
Message-ID: <20070724140530.GA19688@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 24, 2007 at 07:06:16AM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2007-07-24 07:06:13 -0700 (Tue, 24 Jul 2007)
>New Revision: 19246
>
>Log:
>Patch correctly kexec, make sure utils is built using HOSTCC
>
>Added:
>   trunk/buildroot/package/kexec/kexec-patch.sh
>   trunk/buildroot/package/kexec/kexec-tools-003-build-util-using-host-gcc.patch
>
>Modified:
>   trunk/buildroot/package/kexec/kexec.mk
>
>
>Changeset:
>Added: trunk/buildroot/package/kexec/kexec-patch.sh
>===================================================================
>--- trunk/buildroot/package/kexec/kexec-patch.sh	                        (rev 0)
>+++ trunk/buildroot/package/kexec/kexec-patch.sh	2007-07-24 14:06:13 UTC (rev 19246)
>@@ -0,0 +1,16 @@
>+#!/bin/bash
>+SRCDIR=$1
>+PATCHDIR=$2
>+PATCHLIST=${PATCHDIR}/$3
>+
>+do_patch()
>+{
>+	cd ${SRCDIR}
>+	for f in `cat ${PATCHLIST}` ; do
>+		echo ${PATCHDIR}/$f
>+		cat ${PATCHDIR}/$f | patch -p2
>+	done
>+}
>+
>+do_patch

No, please don't do such a beast. See package/argus/argus.mk instead for
a simple 4-liner that does the same but in the makefile.
>+
>
>
>Property changes on: trunk/buildroot/package/kexec/kexec-patch.sh
>___________________________________________________________________
>Name: svn:executable
>   + *
>
>Added: trunk/buildroot/package/kexec/kexec-tools-003-build-util-using-host-gcc.patch
>===================================================================
>--- trunk/buildroot/package/kexec/kexec-tools-003-build-util-using-host-gcc.patch	                        (rev 0)
>+++ trunk/buildroot/package/kexec/kexec-tools-003-build-util-using-host-gcc.patch	2007-07-24 14:06:13 UTC (rev 19246)
>@@ -0,0 +1,17 @@
>+diff -urN kexec-tools-1.101-0rig/util/Makefile kexec-tools-1.101/util/Makefile
>+--- kexec-tools-1.101-0rig/util/Makefile	2004-12-16 22:08:21.000000000 +0100
>++++ kexec-tools-1.101/util/Makefile	2007-07-24 16:32:48.000000000 +0200
>+@@ -1,4 +1,4 @@
>+ BIN_TO_HEX:= $(OBJDIR)/bin/bin-to-hex
>+ $(BIN_TO_HEX): util/bin-to-hex.c
>+ 	mkdir -p $(@D)
>+-	$(BUILD_CC) $(BUILD_CFLAGS) $< -o $@
>++	$(HOSTCC) $(HOST_CFLAGS) $< -o $@

BUILD_CC is perfectly fine. I'd rather add it to TARGET_CONFIGURE_OPTS
instead.

>+diff -urN kexec-tools-1.101-0rig/util/Makefile~ kexec-tools-1.101/util/Makefile~
>+--- kexec-tools-1.101-0rig/util/Makefile~	1970-01-01 01:00:00.000000000 +0100
>++++ kexec-tools-1.101/util/Makefile~	2004-12-16 22:08:21.000000000 +0100

This is a backup-file and should not be in the patch..

>+@@ -0,0 +1,4 @@
>++BIN_TO_HEX:= $(OBJDIR)/bin/bin-to-hex
>++$(BIN_TO_HEX): util/bin-to-hex.c
>++	mkdir -p $(@D)
>++	$(BUILD_CC) $(BUILD_CFLAGS) $< -o $@
>
>Modified: trunk/buildroot/package/kexec/kexec.mk
>===================================================================
>--- trunk/buildroot/package/kexec/kexec.mk	2007-07-24 13:41:05 UTC (rev 19245)
>+++ trunk/buildroot/package/kexec/kexec.mk	2007-07-24 14:06:13 UTC (rev 19246)
>@@ -35,9 +35,10 @@
> 	$(KEXEC_CAT) $(DL_DIR)/$(KEXEC_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
> ifneq ($(KEXEC_PATCH),)
> 	(cd $(KEXEC_DIR) && $(KEXEC_CAT) $(DL_DIR)/$(KEXEC_PATCH) | patch -p1)
>-	toolchain/patch-kernel.sh $(KEXEC_DIR) $(KEXEC_DIR)/debian/patches \*.patch
>+	package/kexec/kexec-patch.sh $(KEXEC_DIR) $(KEXEC_DIR)/debian/patches 00list
>+#	toolchain/patch-kernel.sh $(KEXEC_DIR) $(KEXEC_DIR)/debian/patches \*.patch
> endif
>-	toolchain/patch-kernel.sh $(KEXEC_DIR) package/kexec/ kexec\*.dpatch
>+	toolchain/patch-kernel.sh $(KEXEC_DIR) package/kexec/ kexec\*.patch
> 	touch $@
> 
> $(KEXEC_DIR)/.configured: $(KEXEC_DIR)/.unpacked

See above.
