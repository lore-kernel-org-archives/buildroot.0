From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon,  9 Oct 2006 09:13:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20061009161313.4F9374859A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-10-09 09:13:12 -0700 (Mon, 09 Oct 2006)
New Revision: 16347

Log:
- we need to pass ARCH to the kernel; The kernel does not have a table to
  normalize the passed in ARCH, from the looks, so we have to normalize it manually. XXX: FIXME upstream via a simple shell script like the cc-checks!
  FIXME: flesh this out..


Modified:
   trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-10-09 11:53:10 UTC (rev 16346)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-10-09 16:13:12 UTC (rev 16347)
@@ -128,12 +128,15 @@
 
 ifeq ($(LINUX_HEADERS_IS_KERNEL),y)
 # full kernel tarball >= 2.6.18
+
+KERNEL_ARCH:=$(shell $(SHELL) -c 'if test "$(ARCH)" = "i486" -o "$(ARCH)" = "i586"; then echo i386; else echo $(ARCH); fi')
+
 $(LINUX_HEADERS_UNPACK_DIR)/.patched: $(LINUX_HEADERS_UNPACK_DIR)/.unpacked
 	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) toolchain/kernel-headers linux-$(LINUX_HEADERS_VERSION)\*.patch
 
 $(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched
 	(cd $(LINUX_HEADERS_UNPACK_DIR) ; \
-	 $(MAKE) INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR) headers_install)
+	 $(MAKE) ARCH=$(KERNEL_ARCH) INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR) headers_install)
 	touch $(LINUX_HEADERS_DIR)/.configured
 else
 # the sanitized kernel-headers
