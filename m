From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 16 Jan 2007 01:35:12 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070116093512.0CBCD4856D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-16 01:35:11 -0800 (Tue, 16 Jan 2007)
New Revision: 17324

Log:
- pass the selected arm variant and ABI setting down to uClibc.
  Now does not prompt for the former entered arch variant and ABI setting anymore, but still does for USE_BX (should this be forced to y if supported?)
- TODO: add missing variants that are supported by uClibc to buildroot


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-01-16 08:10:27 UTC (rev 17323)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-01-16 09:35:11 UTC (rev 17324)
@@ -97,12 +97,19 @@
 		-e 's,^SHARED_LIB_LOADER_PREFIX=.*,SHARED_LIB_LOADER_PREFIX=\"/lib\",g' \
 		$(UCLIBC_DIR)/.config
 ifeq ($(UCLIBC_TARGET_ARCH),arm)
-	$(SED) 's,^.*CONFIG_$(shell echo $(BR2_ARM_TYPE)).*,CONFIG_$(shell echo $(BR2_ARM_TYPE))=y,g' \
-	$(UCLIBC_DIR)/.config
-endif
+	$(SED) '/.*CONFIG_ARM.*/d' -e '/.*CONFIG_GENERIC_ARM.*/d' \
+		 $(UCLIBC_DIR)/.config
+	/bin/echo "CONFIG_$(shell echo $(BR2_ARM_TYPE))=y" >> \
+		$(UCLIBC_DIR)/.config
 ifeq ($(BR2_ARM_EABI),y)
-	$(SED) 's,# CONFIG_ARM_EABI is not set,CONFIG_ARM_EABI=y,g' $(UCLIBC_DIR)/.config
+	/bin/echo "# CONFIG_ARM_OABI is not set" >> $(UCLIBC_DIR)/.config
+	/bin/echo "CONFIG_ARM_EABI=y" >> $(UCLIBC_DIR)/.config
 endif
+ifeq ($(BR2_ARM_OABI),y)
+	/bin/echo "CONFIG_ARM_OABI=y" >> $(UCLIBC_DIR)/.config
+	/bin/echo "# CONFIG_ARM_EABI is not set" >> $(UCLIBC_DIR)/.config
+endif
+endif
 ifneq ($(UCLIBC_TARGET_ENDIAN),)
 	$(SED) '/^# ARCH_$(UCLIBC_TARGET_ENDIAN)_ENDIAN /{s,# ,,;s, is not set,=y,g}' \
 		-e '/^# ARCH_$(UCLIBC_NOT_TARGET_ENDIAN)_ENDIAN /{s,# ,,;s, is not set,=n,g}' \
