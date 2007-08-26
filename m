From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 26 Aug 2007 13:55:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070826205502.AEC4CA6AC2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-26 13:55:02 -0700 (Sun, 26 Aug 2007)
New Revision: 19703

Log:
- improve handling of sh (fgretief) for bug #1446


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-08-26 20:47:18 UTC (rev 19702)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-08-26 20:55:02 UTC (rev 19703)
@@ -73,7 +73,7 @@
 		-e 's/arm/LITTLE/' \
 		-e 's/mipsel/LITTLE/' \
 		-e 's/mips/BIG/' \
-		-e 's/sh[234]eb/BIG/' \
+		-e 's/sh[234].*eb/BIG/' \
 		-e 's/sh[234]/LITTLE/' \
 ")
 
@@ -146,6 +146,38 @@
 	/bin/echo "# CONFIG_ARM_EABI is not set" >> $(UCLIBC_DIR)/.oldconfig
 endif
 endif
+ifeq ($(UCLIBC_TARGET_ARCH),sh)
+	/bin/echo "# CONFIG_SH2A is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# CONFIG_SH2 is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# CONFIG_SH3 is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# CONFIG_SH4 is not set" >> $(UCLIBC_DIR)/.oldconfig
+ifeq ($(BR2_sh2a_nofpueb),y)
+	$(SED) 's,# CONFIG_SH2A is not set,CONFIG_SH2A=y,g' $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# UCLIBC_FORMAT_FDPIC_ELF is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# UCLIBC_FORMAT_FLAT is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# UCLIBC_FORMAT_FLAT_SEP_DATA is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# UCLIBC_FORMAT_SHARED_FLAT is not set" >> $(UCLIBC_DIR)/.oldconfig
+endif
+ifeq ($(BR2_sh2eb),y)
+	$(SED) 's,# CONFIG_SH2 is not set,CONFIG_SH2=y,g' $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# UCLIBC_FORMAT_FDPIC_ELF is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# UCLIBC_FORMAT_FLAT is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# UCLIBC_FORMAT_FLAT_SEP_DATA is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# UCLIBC_FORMAT_SHARED_FLAT is not set" >> $(UCLIBC_DIR)/.oldconfig
+endif
+ifeq ($(BR2_sh3eb),y)
+	$(SED) 's,# CONFIG_SH3 is not set,CONFIG_SH3=y,g' $(UCLIBC_DIR)/.oldconfig
+endif
+ifeq ($(BR2_sh3),y)
+	$(SED) 's,# CONFIG_SH3 is not set,CONFIG_SH3=y,g' $(UCLIBC_DIR)/.oldconfig
+endif
+ifeq ($(BR2_sh4eb),y)
+	$(SED) 's,# CONFIG_SH4 is not set,CONFIG_SH4=y,g' $(UCLIBC_DIR)/.oldconfig
+endif
+ifeq ($(BR2_sh4),y)
+	$(SED) 's,# CONFIG_SH4 is not set,CONFIG_SH4=y,g' $(UCLIBC_DIR)/.oldconfig
+endif
+endif
 ifneq ($(UCLIBC_TARGET_ENDIAN),)
 	# The above doesn't work for me, so redo
 	$(SED) 's/.*\(ARCH_$(UCLIBC_NOT_TARGET_ENDIAN)_ENDIAN\).*/# \1 is not set/g' \
