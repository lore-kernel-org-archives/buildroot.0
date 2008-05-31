From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 31 May 2008 00:27:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20080531072758.5AB4E3C8B0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-05-31 00:27:58 -0700 (Sat, 31 May 2008)
New Revision: 22135

Log:
uclibc-0.9.29: handle powerpc subarch selection


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-05-31 07:27:52 UTC (rev 22134)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-05-31 07:27:58 UTC (rev 22135)
@@ -257,6 +257,15 @@
 		>> $(UCLIBC_DIR)/.oldconfig
 	$(SED) 's/^.*$(UCLIBC_SPARC_TYPE).*/$(UCLIBC_SPARC_TYPE)=y/g' $(UCLIBC_DIR)/.oldconfig
 endif
+ifeq ($(UCLIBC_TARGET_ARCH),powerpc)
+ifeq ($(BR2_powerpc_8540),y)
+	/bin/echo "# CONFIG_CLASSIC is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "CONFIG_E500=y" >> $(UCLIBC_DIR)/.oldconfig
+else
+	/bin/echo "CONFIG_CLASSIC=y" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# CONFIG_E500 is not set" >> $(UCLIBC_DIR)/.oldconfig
+endif
+endif
 ifneq ($(UCLIBC_TARGET_ENDIAN),)
 	# The above doesn't work for me, so redo
 	$(SED) 's/.*\(ARCH_$(UCLIBC_NOT_TARGET_ENDIAN)_ENDIAN\).*/# \1 is not set/g' \
