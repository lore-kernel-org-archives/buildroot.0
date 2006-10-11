From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 11 Oct 2006 04:36:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20061011113658.426EF485F8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-10-11 04:36:57 -0700 (Wed, 11 Oct 2006)
New Revision: 16360

Log:
- normalize KERNEL_ARCH via sed


Modified:
   trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-10-10 23:26:05 UTC (rev 16359)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-10-11 11:36:57 UTC (rev 16360)
@@ -129,10 +129,15 @@
 ifeq ($(LINUX_HEADERS_IS_KERNEL),y)
 # full kernel tarball >= 2.6.18
 
-KERNEL_ARCH:=$(shell $(SHELL) -c 'if test "$(ARCH)" = "i486" -o "$(ARCH)" = "i586"; then echo i386; else echo $(ARCH); fi')
+KERNEL_ARCH:=$(shell $(SHELL) -c "echo \"$(ARCH)\" | sed -e \"s/-.*//\" \
+	-e s/i.86/i386/ -e s/sun4u/sparc64/ \
+	-e s/arm.*/arm/ -e s/sa110/arm/ \
+	-e s/s390x/s390/ -e s/parisc64/parisc/ \
+	-e s/ppc.*/powerpc/ -e s/mips.*/mips/")
 
 $(LINUX_HEADERS_UNPACK_DIR)/.patched: $(LINUX_HEADERS_UNPACK_DIR)/.unpacked
 	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) toolchain/kernel-headers linux-$(LINUX_HEADERS_VERSION)\*.patch
+	touch $(LINUX_HEADERS_UNPACK_DIR)/.patched
 
 $(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched
 	(cd $(LINUX_HEADERS_UNPACK_DIR) ; \
