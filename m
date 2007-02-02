From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  2 Feb 2007 05:50:23 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070202135023.5C15E485E8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-02 05:50:23 -0800 (Fri, 02 Feb 2007)
New Revision: 17725

Log:
- fixup setting the UCLIBC_TARGET_ENDIAN


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-02-02 13:49:38 UTC (rev 17724)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-02-02 13:50:23 UTC (rev 17725)
@@ -32,7 +32,7 @@
 
 UCLIBC_CAT:=$(BZCAT)
 
-UCLIBC_TARGET_ARCH:=$(shell echo $(ARCH) | sed -e s'/-.*//' \
+UCLIBC_TARGET_ARCH:=$(shell $(SHELL) -c "echo $(ARCH) | sed -e s'/-.*//' \
 		-e 's/i.86/i386/' \
 		-e 's/sparc.*/sparc/' \
 		-e 's/arm.*/arm/g' \
@@ -44,14 +44,14 @@
 		-e 's/mipsel.*/mips/' \
 		-e 's/cris.*/cris/' \
 		-e 's/nios2.*/nios2/' \
-)
+")
 # just handle the ones that can be big or little
-UCLIBC_TARGET_ENDIAN:=$(shell echo $(ARCH) | sed \
+UCLIBC_TARGET_ENDIAN:=$(shell $(SHELL) -c "echo $(ARCH) | sed \
 		-e 's/armeb/BIG/' \
 		-e 's/arm/LITTLE/' \
 		-e 's/mipsel/LITTLE/' \
 		-e 's/mips/BIG/' \
-)
+")
 ifneq ($(UCLIBC_TARGET_ENDIAN),LITTLE)
 ifneq ($(UCLIBC_TARGET_ENDIAN),BIG)
 UCLIBC_TARGET_ENDIAN:=
@@ -122,6 +122,14 @@
 		-e '/^# ARCH_WANTS_$(UCLIBC_NOT_TARGET_ENDIAN)_ENDIAN /{s,# ,,;s, is not set,=n,g}' \
 		$(UCLIBC_DIR)/.config
 endif
+ifneq ($(UCLIBC_TARGET_ENDIAN),)
+	# The above doesn't work for me, so redo
+	$(SED) 's/.*\(ARCH_$(UCLIBC_NOT_TARGET_ENDIAN)_ENDIAN\).*/# \1 is not set/g' \
+		-e 's/.*\(ARCH_WANTS_$(UCLIBC_NOT_TARGET_ENDIAN)_ENDIAN\).*/# \1 is not set/g' \
+		-e 's/.*\(ARCH_$(UCLIBC_TARGET_ENDIAN)_ENDIAN\).*/\1=y/g' \
+		-e 's/.*\(ARCH_WANTS_$(UCLIBC_TARGET_ENDIAN)_ENDIAN\).*/\1=y/g' \
+		$(UCLIBC_DIR)/.config
+endif
 ifeq ($(BR2_LARGEFILE),y)
 	$(SED) 's,.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=y,g' $(UCLIBC_DIR)/.config
 else
