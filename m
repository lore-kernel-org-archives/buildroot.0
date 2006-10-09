From: Fredrik Roubert <roubert@df.lth.se>
Date: Mon, 9 Oct 2006 10:26:42 +0200
Subject: [Buildroot] PowerPC kernel headers
Message-ID: <20061009082642.GA20352@igloo.df.lth.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Recently the possibility to use the Linux 2.6.18 kernel headers has been
added to buildroot. However, the correct asm directory for PowerPC has
changed from "ppc" to "powerpc", as part of the move to a unified kernel
architecture for 32 and 64 bit PowerPC system.

The attached patch updates kernel-headers.mk to use asm-powerpc when
building with the 2.6.18 kernel headers.

Cheers // Fredrik Roubert

-- 
Visserij 192  |  +32 473 344527 / +46 708 776974
BE-9000 Gent  |  http://www.df.lth.se/~roubert/
-------------- next part --------------
diff -ur buildroot-20061006/toolchain/kernel-headers/kernel-headers.mk buildroot/toolchain/kernel-headers/kernel-headers.mk
--- buildroot-20061006/toolchain/kernel-headers/kernel-headers.mk	2006-10-06 09:15:02.000000000 +0200
+++ buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-10-06 16:45:43.000000000 +0200
@@ -128,7 +128,12 @@
 		    $(LINUX_HEADERS_DIR)/Makefile; \
 	fi;
 	@if [ "$(ARCH)" = "powerpc" ];then \
-	    (cd $(LINUX_HEADERS_DIR)/include; ln -fs asm-ppc$(NOMMU) asm;) \
+	    (cd $(LINUX_HEADERS_DIR)/include; \
+	     if [ $(PATCHLEVEL) -eq 6 -a $(SUBLEVEL) -ge 18 ];then \
+	         ln -fs asm-powerpc$(NOMMU) asm; \
+	     else \
+	         ln -fs asm-ppc$(NOMMU) asm; \
+	     fi) \
 	elif [ "$(ARCH)" = "mips" ];then \
 	    (cd $(LINUX_HEADERS_DIR)/include; ln -fs asm-mips$(NOMMU) asm;) \
 	elif [ "$(ARCH)" = "mipsel" ];then \
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 303 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061009/75e45e4a/attachment.pgp 
